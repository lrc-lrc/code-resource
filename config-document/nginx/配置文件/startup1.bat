@echo off
rem �������ǰ�Ѿ�����nginx����¼��pid�ļ�����killָ������
nginx -s stop

rem ���������ļ��﷨��ȷ��
nginx -t -c conf/nginx.conf

rem ��ʾ�汾��Ϣ
nginx -v

rem ����ָ������ȥ����nginx
nginx -c conf/nginx.conf