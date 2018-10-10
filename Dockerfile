FROM mtrampic/cvbuilder:nginx
MAINTAINER Mladen Trampic <mtrampic@hotmail.com>
EXPOSE 80
ENV LANG=en_US.UTF-8
RUN mkdir resume
RUN mkdir resume/html
COPY resumes resume/resumes
COPY themes/simple resume/themes/simple
COPY Makefile resume/Makefile
COPY build.py resume/build.py
COPY helpers.py resume/helpers.py
COPY default.conf /etc/nginx/conf.d/default.conf
RUN cd resume && make html
RUN cd resume && make pdf
RUN rm -rf /usr/share/nginx/html && mv resume/html /usr/share/nginx/
ADD ./supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord", "-n"]
