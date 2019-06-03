Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B7E339C4
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 22:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfFCUaq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 16:30:46 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46624 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfFCUap (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Jun 2019 16:30:45 -0400
Received: by mail-lf1-f67.google.com with SMTP id l26so14607175lfh.13
        for <linux-i2c@vger.kernel.org>; Mon, 03 Jun 2019 13:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cumulusnetworks.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a925hmCKitRfMzRGu04g+2YNuXwA25iz38UTCusgOxk=;
        b=C+yN6RsGkvw3pFV9Q9QLmnauzYi6My8WLO1yOg17igTNrGstm+260uS/Bod0GXIYM5
         JjgPsNT2AGKFk8wAHxmy2BWu7Mn1xRCo7rtFqsdwp6rGLBvuGeP2gpAOT20y3E5Iv/ci
         jwxtSyG6bvstN/AOkejNNN+loYAtLqb76+mGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a925hmCKitRfMzRGu04g+2YNuXwA25iz38UTCusgOxk=;
        b=ui7tA65eElHly6wNRUcXPBkoBEOvbk8AlnnTx8vYw+AB8S1FX8zjGW0/E1EzyaHhbz
         FvDuDuFZ4oH3QXQFhUwsdbZ9a6kkxKuFqa7gETTbvQjsmjyqtmNeXRlPqBvighfaISVA
         EPuvy9QGqL8BXZgWbfJIYonaZy5m/DLpVNDUTMNOhcZxDRq9cm87LE3np5DBL9GXdlBn
         CmIt7AWDNS1ovAGmHLrim/4E+elRk/47BKIXlM+rIjmDJUI9oXiQsY/5w0ZeE9QUeT6O
         /+ea7XBrOnaSNjh5CWrw7qacVeAHFMkvyICbDnBGlaOclw4FBoKhaWKXpAtAJ9q3EFHo
         NefQ==
X-Gm-Message-State: APjAAAVWbC0Gzo4c/jbtvikojk/XS746cNtOtEV3ScUtTmB7V7GRHqYg
        1Hvyeh7tQg8P6q4Qvht2uUUr0XsNav5hD6QmKE6/JA==
X-Google-Smtp-Source: APXvYqzQlAv9zSkP5bLl5aU0/gBRJU3oCMar3gIRviY8uhD5vul83PtKwm3gqfetLjV6bsavjqfjI0+i8epDcMWzTwA=
X-Received: by 2002:a19:fc1d:: with SMTP id a29mr15503160lfi.35.1559593841347;
 Mon, 03 Jun 2019 13:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190306231521.29367-1-peda@axentia.se> <20190306231521.29367-6-peda@axentia.se>
 <0105c583-6b33-066a-fefd-00c2a3090178@axentia.se> <CAPwEZY38PhUddxhbe_0qce_Ogj9wZXsC+0oB7_+gnkwuhO8Xnw@mail.gmail.com>
 <63e64b6a-5103-9cc2-b3d9-f7d00a333f86@axentia.se> <20190325164925.GC28275@roeck-us.net>
In-Reply-To: <20190325164925.GC28275@roeck-us.net>
From:   Pradeep Srinivasan <pradeeps@cumulusnetworks.com>
Date:   Mon, 3 Jun 2019 13:30:30 -0700
Message-ID: <CAPwEZY24sJZ0S4VJ9nTXiLT=6nmCKkaLmQMs8LD7RWPaWyKgtw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] i2c: mux: pca9541: add support for PCA9641
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Ken Chen <chen.kenyy@inventec.com>,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

 I got some cycles to test the patches on a Celestica seastone switch
which has the PCA 9541 mux.  A rough sketch of the I2C mux tree on
seastone switch is shown below. I tested by accessing the all the
devices behind PCA9548 mux. There are 3 PCA 9548 mux devices behind
PCA 9541. I was able to read all Fan EEPROM data, lm74 sensor data
through smonctl as well as sensors command. Please let me know if you
need any other information.


Figure describing the PCA 9541 mux and devices behind the mux on seastone s=
witch
---------------------------------------------------------------------------=
----------------------------------------

PCA 9541 mux
|---------------------------------|------------------------------|
|                                        |                                 =
   |
PCA 9548_1                    PCA 9548_2                    PCA 9548_3

Fan                    PSU1, 2, board EEPROM              EEPROM,
eeproms 1-5            fan controller, lm75               lm75

Log messages and seastone CPLD driver accessing the devices behind PCA 9541=
 mux

[    3.374804] pca9541 1-0070: registered master selector for I2C pca9541
[    3.380242] pca954x 9-0073: registered 8 multiplexed busses for I2C
switch pca9548
[    3.482770] pca954x 9-0071: registered 8 multiplexed busses for I2C
switch pca9548
[    3.488394] pca954x 9-0077: registered 8 multiplexed busses for I2C
switch pca9548

root@cel-sea-51:/var/tmp# cat
/sys/devices/platform/cel_seastone_cpld.0/cpld1_version
1.2
root@cel-sea-51:/var/tmp# cat
/sys/devices/platform/cel_seastone_cpld.0/cpld2_version
2.2
root@cel-sea-51:/var/tmp# cat
/sys/devices/platform/cel_seastone_cpld.0/cpld3_version
3.2
root@cel-sea-51:/var/tmp# cat
/sys/devices/platform/cel_seastone_cpld.0/cpld4_version
4.2
root@cel-sea-51:/var/tmp# cat
/sys/devices/platform/cel_seastone_cpld.0/cpld5_version
5.2

root@cel-sea-51:/var/tmp# cat
/sys/devices/platform/cel_seastone_cpld.0/board_type
Seastone

root@cel-sea-51:/var/tmp# cat /sys/devices/platform/cel_seastone_cpld.0/led=
_psu1
green
root@cel-sea-51:/var/tmp# cat /sys/devices/platform/cel_seastone_cpld.0/led=
_psu2
off



root@cel-sea-51:/var/tmp# cat
/sys/bus/i2c/devices/0-0050/eeprom_dev/eeprom0/label
spd1_eeprom

root@cel-sea-51:/var/tmp# hd
/sys/bus/i2c/devices/0-0050/eeprom_dev/eeprom0/device/eeprom
00000000  92 11 0b 08 04 21 02 01  0b 11 01 08 0a 00 fc 00  |.....!........=
..|
00000010  69 78 69 30 69 11 18 81  20 08 3c 3c 00 f0 83 01  |ixi0i... .<<..=
..|
00000020  80 00 00 00 00 00 00 00  00 88 00 00 00 00 00 00  |..............=
..|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 0f 11 22 00  |..............=
".|
00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000070  00 00 00 00 00 86 f1 02  16 24 00 00 00 00 67 5b  |.........$....=
g[|
00000080  69 2d 44 49 4d 4d 20 20  20 20 20 20 20 20 20 20  |i-DIMM        =
  |
00000090  20 20 00 10 86 f1 44 43  41 31 2d 31 36 30 36 30  |  ....DCA1-160=
60|
000000a0  37 30 35 32 00 00 00 00  00 00 00 00 00 00 00 00  |7052..........=
..|
000000b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000100


root@cel-sea-51:/var/tmp# cat
/sys/bus/i2c/devices/12-0050/eeprom_dev/eeprom3/label
board_eeprom

root@cel-sea-51:/var/tmp# cat
/sys/bus/i2c/devices/30-0050/eeprom_dev/eeprom4/label
fan2_eeprom

root@cel-sea-51:/var/tmp# hd /sys/bus/i2c/devices/30-0050/eeprom
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..............=
..|
*
00000100


root@cel-sea-51:/var/tmp# cat
/sys/bus/i2c/devices/31-0050/eeprom_dev/eeprom5/label
fan1_eeprom

root@cel-sea-51:/var/tmp# hd /sys/bus/i2c/devices/31-0050/eeprom
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..............=
..|
*
00000100

root@cel-sea-51:/var/tmp# cat
/sys/bus/i2c/devices/32-0050/eeprom_dev/eeprom6/label
fan5_eeprom

root@cel-sea-51:/var/tmp# hd /sys/bus/i2c/devices/32-0050/eeprom
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..............=
..|
*
00000100

root@cel-sea-51:/var/tmp# cat
/sys/bus/i2c/devices/33-0050/eeprom_dev/eeprom7/label
fan3_eeprom
root@cel-sea-51:/var/tmp# hd /sys/bus/i2c/devices/33-0050/eeprom
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..............=
..|
*
00000100

root@cel-sea-51:/var/tmp# cat
/sys/bus/i2c/devices/34-0050/eeprom_dev/eeprom8/label
fan4_eeprom
root@cel-sea-51:/var/tmp# hd /sys/bus/i2c/devices/34-0050/eeprom
00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |..............=
..|
*
00000100

smonctl -v output
------------------------

Fan1In(Fan1 Inlet):  OK
fan:11599 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

Fan1Out(Fan1 Outlet):  OK
fan:11234 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

Fan2In(Fan2 Inlet):  OK
fan:11565 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

Fan2Out(Fan2 Outlet):  OK
fan:11234 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

Fan3In(Fan3 Inlet):  OK
fan:11565 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

Fan3Out(Fan3 Outlet):  OK
fan:11234 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

Fan4In(Fan4 Inlet):  OK
fan:11531 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

Fan4Out(Fan4 Outlet):  OK
fan:11234 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

Fan5In(Fan5 Inlet):  OK
fan:11497 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

Fan5Out(Fan5 Outlet):  OK
fan:11202 RPM   (max =3D 23000 RPM, min =3D 5300 RPM, limit_variance =3D 15=
%)

PSU1Fan(PSU1 Fan):  OK
fan:7488 RPM   (max =3D 18000 RPM, min =3D 4700 RPM, limit_variance =3D 15%=
)

PSU1:  OK

PSU2Fan(PSU2 Fan):  ABSENT

PSU2:  BAD

PSU1Temp1(PSU1 Inlet Temp Sensor):  OK
temp:36.0 C (lcrit =3D 0 C, fan_max =3D 60 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 60 C, crit =3D 100 C)

PSU1Temp2(PSU1 Heatsink Temp Sensor):  OK
temp:46.0 C (lcrit =3D 0 C, fan_max =3D 60 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 60 C, crit =3D 100 C)

PSU2Temp1(PSU2 Inlet Temp Sensor):  ABSENT

PSU2Temp2(PSU2 Heatsink Temp Sensor):  ABSENT

Temp1(Intel Core 0 Temp Sensor):  OK
temp:19.0 C (lcrit =3D 0 C, fan_max =3D 90 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 90 C, crit =3D 98 C)

Temp2(Intel Core 1 Temp Sensor):  OK
temp:19.0 C (lcrit =3D 0 C, fan_max =3D 90 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 90 C, crit =3D 98 C)

Temp3(Intel Core 2 Temp Sensor):  OK
temp:19.0 C (lcrit =3D 0 C, fan_max =3D 90 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 90 C, crit =3D 98 C)

Temp4(Intel Core 3 Temp Sensor):  OK
temp:19.0 C (lcrit =3D 0 C, fan_max =3D 90 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 90 C, crit =3D 98 C)

Temp5(Intel CPU external sensor 1):  OK
temp:30.0 C (lcrit =3D 0 C, fan_max =3D 65 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 65 C, crit =3D 70 C)

Temp6(Intel CPU external sensor 2):  OK
temp:31.0 C (lcrit =3D 0 C, fan_max =3D 65 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 65 C, crit =3D 70 C)

Temp7(Rear Outlet Air sensor):  OK
temp:32.5 C (lcrit =3D -15 C, fan_max =3D 48 C, fan_min =3D 25 C, min =3D -=
10
C, max =3D 48 C, crit =3D 60 C)

Temp8(Front Outlet Air sensor):  OK
temp:30.5 C (lcrit =3D -15 C, fan_max =3D 48 C, fan_min =3D 25 C, min =3D -=
10
C, max =3D 48 C, crit =3D 60 C)

Temp9(Temp Sensor close to Networking ASIC):  OK
temp:37.5 C (lcrit =3D 0 C, fan_max =3D 75 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 75 C, crit =3D 80 C)

Temp10(DIMM 1 Temp Sensor):  OK
temp:31.8 C (lcrit =3D 0 C, fan_max =3D 90 C, fan_min =3D 25 C, min =3D 5 C=
,
max =3D 90 C, crit =3D 95 C)

Temp11(Networking ASIC Die Temp Sensor):  OK
temp:54.0 C (lcrit =3D 0 C, fan_max =3D 105 C, fan_min =3D 25 C, min =3D 5 =
C,
max =3D 105 C, crit =3D 110 C)

Temp12(Networking ASIC Die Temp Sensor):  OK
temp:54.5 C (lcrit =3D 0 C, fan_max =3D 105 C, fan_min =3D 25 C, min =3D 5 =
C,
max =3D 105 C, crit =3D 110 C)

Temp13(Networking ASIC Die Temp Sensor):  OK
temp:54.5 C (lcrit =3D 0 C, fan_max =3D 105 C, fan_min =3D 25 C, min =3D 5 =
C,
max =3D 105 C, crit =3D 110 C)

Temp14(Networking ASIC Die Temp Sensor):  OK
temp:55.9 C (lcrit =3D 0 C, fan_max =3D 105 C, fan_min =3D 25 C, min =3D 5 =
C,
max =3D 105 C, crit =3D 110 C)

Temp15(Networking ASIC Die Temp Sensor):  OK
temp:54.0 C (lcrit =3D 0 C, fan_max =3D 105 C, fan_min =3D 25 C, min =3D 5 =
C,
max =3D 105 C, crit =3D 110 C)

Temp16(Networking ASIC Die Temp Sensor):  OK
temp:56.4 C (lcrit =3D 0 C, fan_max =3D 105 C, fan_min =3D 25 C, min =3D 5 =
C,
max =3D 105 C, crit =3D 110 C)

Temp17(Networking ASIC Die Temp Sensor):  OK
temp:55.5 C (lcrit =3D 0 C, fan_max =3D 105 C, fan_min =3D 25 C, min =3D 5 =
C,
max =3D 105 C, crit =3D 110 C)

Temp18(Networking ASIC Die Temp Sensor):  OK
temp:55.0 C (lcrit =3D 0 C, fan_max =3D 105 C, fan_min =3D 25 C, min =3D 5 =
C,
max =3D 105 C, crit =3D 110 C)

Messages:
PSU2:  status is all_not_ok, installed

sensors output
---------------------

 emc2305-i2c-13-4d
Adapter: i2c-9-mux (chan_id 3)
fan1:        11266 RPM  (div =3D 4)
fan2:        11234 RPM  (div =3D 4)
fan3:        11170 RPM  (div =3D 4)
fan4:        11331 RPM  (div =3D 4)
fan5:        11266 RPM  (div =3D 4)

coretemp-isa-0000
Adapter: ISA adapter
Intel core 0 temp:  +19.0=C2=B0C  (high =3D +98.0=C2=B0C, crit =3D +98.0=C2=
=B0C)
Intel core 1 temp:  +19.0=C2=B0C  (high =3D +98.0=C2=B0C, crit =3D +98.0=C2=
=B0C)
Intel core 2 temp:  +19.0=C2=B0C  (high =3D +98.0=C2=B0C, crit =3D +98.0=C2=
=B0C)
Intel core 3 temp:  +19.0=C2=B0C  (high =3D +98.0=C2=B0C, crit =3D +98.0=C2=
=B0C)

dps460-i2c-11-5b
Adapter: i2c-9-mux (chan_id 1)
vin:          +0.00 V                                    ALARM
vcap:         -0.50 V
vout1:        +0.00 V  (crit min =3D +10.40 V, crit max =3D +14.20 V)
fan1:           0 RPM
temp1:        +28.0=C2=B0C  (high =3D +90.0=C2=B0C)
temp2:        +28.0=C2=B0C  (high =3D +90.0=C2=B0C)
temp3:        +28.0=C2=B0C  (high =3D +90.0=C2=B0C)
pin:           0.00 W  (max =3D   1.15 kW)
pout1:         0.00 W  (max =3D 900.00 W, crit =3D   1.10 kW)
iin:          +0.00 A  (max =3D  +6.00 A, crit max =3D  +7.00 A)
iout1:        +0.00 A  (max =3D +76.00 A, crit max =3D +80.00 A)

lm75-i2c-24-49
Adapter: i2c-9-mux (chan_id 4)
temp1:        +32.5=C2=B0C  (high =3D +48.0=C2=B0C, hyst =3D +48.0=C2=B0C)

lm75-i2c-15-4e
Adapter: i2c-9-mux (chan_id 5)
temp1:        +30.5=C2=B0C  (high =3D +48.0=C2=B0C, hyst =3D +48.0=C2=B0C)

jc42-i2c-0-18
Adapter: SMBus I801 adapter at f000
temp1:        +31.5=C2=B0C  (low  =3D  +0.0=C2=B0C)
                       (high =3D +90.0=C2=B0C, hyst =3D +90.0=C2=B0C)
                       (crit =3D +95.0=C2=B0C, hyst =3D +95.0=C2=B0C)

dps460-i2c-10-5a
Adapter: i2c-9-mux (chan_id 0)
vin:         +206.50 V
vout1:       +12.07 V  (crit min =3D +10.40 V, crit max =3D +14.20 V)
fan1:        7488 RPM
temp1:        +36.0=C2=B0C  (high =3D +90.0=C2=B0C)
temp2:        +46.0=C2=B0C  (high =3D +90.0=C2=B0C)
temp3:        +42.0=C2=B0C  (high =3D +90.0=C2=B0C)
pin:         147.75 W  (max =3D   1.15 kW)
pout1:       132.75 W  (max =3D 900.00 W, crit =3D   1.10 kW)
                       (cap =3D -500.00 mW)
iin:          +0.73 A  (max =3D  +6.00 A, crit max =3D  +7.00 A)
iout1:       +11.11 A  (max =3D +76.00 A, crit max =3D +80.00 A)

emc2305-i2c-13-2e
Adapter: i2c-9-mux (chan_id 3)
fan1:        11464 RPM  (div =3D 4)
fan2:        11599 RPM  (div =3D 4)
fan3:        11565 RPM  (div =3D 4)
fan4:        11464 RPM  (div =3D 4)
fan5:        11633 RPM  (div =3D 4)

lm75-i2c-25-4a
Adapter: i2c-9-mux (chan_id 5)
temp1:        +37.0=C2=B0C  (high =3D +80.0=C2=B0C, hyst =3D +80.0=C2=B0C)

lm75-i2c-23-48
Adapter: i2c-9-mux (chan_id 3)
temp1:        +30.5=C2=B0C  (high =3D +70.0=C2=B0C, hyst =3D +70.0=C2=B0C)

lm75-i2c-14-48
Adapter: i2c-9-mux (chan_id 4)
temp1:        +29.5=C2=B0C  (high =3D +70.0=C2=B0C, hyst =3D +70.0=C2=B0C)



On Mon, Mar 25, 2019 at 9:49 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Mar 25, 2019 at 03:01:21PM +0000, Peter Rosin wrote:
> > On 2019-03-22 20:38, Pradeep Srinivasan wrote:
> > > I have verified the changes on PCA 9541. May I know how you want the =
test results to be shared ? (newbie here; please bear with me)
> > >
> > > root@cumulus:/home/cumulus# dmesg| grep "pca9541" | grep -v "pmbus"
> > > [    2.922288] pca9541 1-0070: registered master selector for I2C pca=
9541
> > >
> > > root@cumulus:/home/cumulus# cat /sys/class/i2c-dev/i2c-1/device/1-007=
0/name
> > > pca9541
> >
> > This only verifies that the probe works and that the chip is detected p=
roperly.
> > It says nothing about if it works to communicate with whatever is beyon=
d the
> > PCA9541, and nothing on how the interaction with the "alien" other mast=
er
> > connected to the PCA9541 is working. I don't know how I want this to be=
 tested,
> > but if you have a setup with a PCA9541 / PCA9641 I would assume that yo=
u
> > have some kind of need for those chips and that you at least could repo=
rt
> > if basic xfers through them are working? I don't need to see actual com=
mands
> > that you have executed, I'm much more interested in some summary of wha=
t
> > you did and what worked (or not).
> >
> > E.g. if you have an eeprom beyond the master selector, you could read f=
rom
> > it in a loop while doing something else from the alien master and check=
 if
> > it all works as expected? Perhaps try to verify timing if there are sta=
lls
> > and/or timeouts etc. Go wild! But if you don't know how or don't have t=
he
>
> Something like that is what I did to test the original implementation: Ac=
cess
> all chips behind the mux from both ends continuously. Let that run for an=
 hour
> or so and declare it a success if there is no error. Usually, while the c=
ode
> was still buggy, errors would show up within minutes, if not seconds.
>
> Guenter
>
> > time, I'd be happy with a report on basic functionality (but a little b=
it
> > more than probe-ok would be nice though), because the code affecting th=
e
> > PCA9541 is probably not broken subtly, it either works as it did before=
 or
> > it doesn't work at all. And any problem with the PCA9641 side of things
> > will not be a regression and therefore not a big problem...
> >
> > Cheers,
> > Peter
> >
> > > I need to do the same on PCA 9641. If the above is sufficient, I will=
 grab a switch with PCA 9641 and check if the driver works .
> > >
> > >
> > > Thanks
> > > Pradeep
> > >
> > > On Thu, Mar 7, 2019 at 1:16 PM Peter Rosin <peda@axentia.se <mailto:p=
eda@axentia.se>> wrote:
> > >
> > >     Hi!
> > >
> > >     I should have read Kens code more carefully, before signing off o=
n it...
> > >
> > >     Review comments inline...
> > >
> > >     On 2019-03-07 00:15, Peter Rosin wrote:
> > >     > Heavily based on code from Ken Chen <chen.kenyy@inventec.com <m=
ailto:chen.kenyy@inventec.com>>.
> > >     >
> > >     > Signed-off-by: Peter Rosin <peda@axentia.se <mailto:peda@axenti=
a.se>>
> > >     > ---
> > >     >  drivers/i2c/muxes/Kconfig           |   6 +-
> > >     >  drivers/i2c/muxes/i2c-mux-pca9541.c | 137 ++++++++++++++++++++=
++++++++++++++--
> > >     >  2 files changed, 136 insertions(+), 7 deletions(-)
> > >     >
> > >     > diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kcon=
fig
> > >     > index 52a4a922e7e6..8532841de5db 100644
> > >     > --- a/drivers/i2c/muxes/Kconfig
> > >     > +++ b/drivers/i2c/muxes/Kconfig
> > >     > @@ -55,10 +55,10 @@ config I2C_MUX_LTC4306
> > >     >         will be called i2c-mux-ltc4306.
> > >     >
> > >     >  config I2C_MUX_PCA9541
> > >     > -     tristate "NXP PCA9541 I2C Master Selector"
> > >     > +     tristate "NXP PCA9541/PCA9641 I2C Master Selectors"
> > >     >       help
> > >     > -       If you say yes here you get support for the NXP PCA9541
> > >     > -       I2C Master Selector.
> > >     > +       If you say yes here you get support for the NXP PCA9541=
/PCA9641
> > >     > +       I2C Master Selectors.
> > >     >
> > >     >         This driver can also be built as a module.  If so, the =
module
> > >     >         will be called i2c-mux-pca9541.
> > >     > diff --git a/drivers/i2c/muxes/i2c-mux-pca9541.c b/drivers/i2c/=
muxes/i2c-mux-pca9541.c
> > >     > index 5eb36e3223d5..5d4e0c92e978 100644
> > >     > --- a/drivers/i2c/muxes/i2c-mux-pca9541.c
> > >     > +++ b/drivers/i2c/muxes/i2c-mux-pca9541.c
> > >     > @@ -1,5 +1,5 @@
> > >     >  /*
> > >     > - * I2C multiplexer driver for PCA9541 bus master selector
> > >     > + * I2C multiplexer driver for PCA9541/PCA9641 bus master selec=
tors
> > >     >   *
> > >     >   * Copyright (c) 2010 Ericsson AB.
> > >     >   *
> > >     > @@ -28,8 +28,8 @@
> > >     >  #include <linux/slab.h>
> > >     >
> > >     >  /*
> > >     > - * The PCA9541 is a bus master selector. It supports two I2C m=
asters connected
> > >     > - * to a single slave bus.
> > >     > + * The PCA9541 and PCA9641 are bus master selector. They suppo=
rt two I2C masters
> > >     > + * connected to a single slave bus.
> > >     >   *
> > >     >   * Before each bus transaction, a master has to acquire bus ow=
nership. After the
> > >     >   * transaction is complete, bus ownership has to be released. =
This fits well
> > >     > @@ -63,6 +63,33 @@
> > >     >  #define PCA9541_BUSON        (PCA9541_CTL_BUSON | PCA9541_CTL_=
NBUSON)
> > >     >  #define PCA9541_MYBUS        (PCA9541_CTL_MYBUS | PCA9541_CTL_=
NMYBUS)
> > >     >
> > >     > +#define PCA9641_ID                   0x00
> > >     > +#define PCA9641_ID_MAGIC             0x38
> > >     > +
> > >     > +#define PCA9641_CONTROL                      0x01
> > >     > +#define PCA9641_STATUS                       0x02
> > >     > +#define PCA9641_TIME                 0x03
> > >     > +
> > >     > +#define PCA9641_CTL_LOCK_REQ         BIT(0)
> > >     > +#define PCA9641_CTL_LOCK_GRANT               BIT(1)
> > >     > +#define PCA9641_CTL_BUS_CONNECT              BIT(2)
> > >     > +#define PCA9641_CTL_BUS_INIT         BIT(3)
> > >     > +#define PCA9641_CTL_SMBUS_SWRST              BIT(4)
> > >     > +#define PCA9641_CTL_IDLE_TIMER_DIS   BIT(5)
> > >     > +#define PCA9641_CTL_SMBUS_DIS                BIT(6)
> > >     > +#define PCA9641_CTL_PRIORITY         BIT(7)
> > >     > +
> > >     > +#define PCA9641_STS_OTHER_LOCK               BIT(0)
> > >     > +#define PCA9641_STS_BUS_INIT_FAIL    BIT(1)
> > >     > +#define PCA9641_STS_BUS_HUNG         BIT(2)
> > >     > +#define PCA9641_STS_MBOX_EMPTY               BIT(3)
> > >     > +#define PCA9641_STS_MBOX_FULL                BIT(4)
> > >     > +#define PCA9641_STS_TEST_INT         BIT(5)
> > >     > +#define PCA9641_STS_SCL_IO           BIT(6)
> > >     > +#define PCA9641_STS_SDA_IO           BIT(7)
> > >     > +
> > >     > +#define PCA9641_RES_TIME             0x03
> > >
> > >     This appears to be the same thing as PCA9641_TIME above. The
> > >     register is called PCA9641_RT in my data sheet.
> > >
> > >     > +
> > >     >  /* arbitration timeouts, in jiffies */
> > >     >  #define ARB_TIMEOUT  (HZ / 8)        /* 125 ms until forcing b=
us ownership */
> > >     >  #define ARB2_TIMEOUT (HZ / 4)        /* 250 ms until acquisiti=
on failure */
> > >     > @@ -73,6 +100,7 @@
> > >     >
> > >     >  enum chip_name {
> > >     >       pca9541,
> > >     > +     pca9641,
> > >     >  };
> > >     >
> > >     >  struct chip_desc {
> > >     > @@ -102,6 +130,21 @@ static bool pca9541_busoff(int ctl)
> > >     >       return (ctl & PCA9541_BUSON) =3D=3D PCA9541_BUSON;
> > >     >  }
> > >     >
> > >     > +static bool pca9641_lock_grant(int ctl)
> > >     > +{
> > >     > +     return !!(ctl & PCA9641_CTL_LOCK_GRANT);
> > >     > +}
> > >     > +
> > >     > +static bool pca9641_other_lock(int sts)
> > >     > +{
> > >     > +     return !!(sts & PCA9641_STS_OTHER_LOCK);
> > >     > +}
> > >     > +
> > >     > +static bool pca9641_busoff(int ctl, int sts)
> > >     > +{
> > >     > +     return !pca9641_lock_grant(ctl) && !pca9641_other_lock(st=
s);
> > >     > +}
> > >     > +
> > >     >  /*
> > >     >   * Write to chip register. Don't use i2c_transfer()/i2c_smbus_=
xfer()
> > >     >   * as they will try to lock the adapter a second time.
> > >     > @@ -256,6 +299,86 @@ static int pca9541_arbitrate(struct i2c_cl=
ient *client)
> > >     >       return 0;
> > >     >  }
> > >     >
> > >     > +/* Release bus. */
> > >     > +static void pca9641_release_bus(struct i2c_client *client)
> > >     > +{
> > >     > +     pca9541_reg_write(client, PCA9641_CONTROL, 0);
> > >
> > >     Should this release bus function really "clobber" the control bit=
s
> > >     PCA9641_CTL_IDLE_TIMER_DIS, PCA9641_CTL_SMBUS_DIS, PCA9641_CTL_PR=
IORITY?
> > >     Yes yes, the driver never sets these bits so they are likely zero=
. But
> > >     the driver doesn't reset the chip either, so some bootstrap code =
might
> > >     have configured those bits...
> > >
> > >     Also related to bus release, since the driver does not touch the
> > >     reserve time register, and then clears the above bits, the only w=
ay
> > >     to release the bus is if everything continues to work and the abo=
ve
> > >     pca9641_release_bus is in fact happening. But if the kernel crash=
es
> > >     while hogging the bus, and fails to come up, then the other maste=
r
> > >     has no way of stealing the ownership. I really feel that the driv=
er
> > >     should make use of the timers so that the arbiter releases the bu=
s
> > >     automatically on catastrophic failure. But maybe I plain and simp=
le
> > >     just misunderstand the datasheet?
> > >
> > >     > +}
> > >     > +
> > >     > +/*
> > >     > + * Channel arbitration
> > >     > + *
> > >     > + * Return values:
> > >     > + *  <0: error
> > >     > + *  0 : bus not acquired
> > >     > + *  1 : bus acquired
> > >     > + */
> > >     > +static int pca9641_arbitrate(struct i2c_client *client)
> > >     > +{
> > >     > +     struct i2c_mux_core *muxc =3D i2c_get_clientdata(client);
> > >     > +     struct pca9541 *data =3D i2c_mux_priv(muxc);
> > >     > +     int reg_ctl, reg_sts;
> > >     > +
> > >     > +     reg_ctl =3D pca9541_reg_read(client, PCA9641_CONTROL);
> > >     > +     if (reg_ctl < 0)
> > >     > +             return reg_ctl;
> > >     > +     reg_sts =3D pca9541_reg_read(client, PCA9641_STATUS);
> > >     > +
> > >     > +     if (pca9641_busoff(reg_ctl, reg_sts)) {
> > >     > +             /*
> > >     > +              * Bus is off. Request ownership or turn it on un=
less
> > >     > +              * other master requested ownership.
> > >     > +              */
> > >     > +             reg_ctl |=3D PCA9641_CTL_LOCK_REQ;
> > >     > +             pca9541_reg_write(client, PCA9641_CONTROL, reg_ct=
l);
> > >     > +             reg_ctl =3D pca9541_reg_read(client, PCA9641_CONT=
ROL);
> > >     > +
> > >     > +             if (pca9641_lock_grant(reg_ctl)) {
> > >     > +                     /*
> > >     > +                      * Other master did not request ownership=
,
> > >     > +                      * or arbitration timeout expired. Take t=
he bus.
> > >     > +                      */
> > >     > +                     reg_ctl |=3D PCA9641_CTL_BUS_CONNECT |
> > >     > +                             PCA9641_CTL_LOCK_REQ;
> > >     > +                     pca9541_reg_write(client, PCA9641_CONTROL=
, reg_ctl);
> > >     > +                     data->select_timeout =3D SELECT_DELAY_SHO=
RT;
> > >     > +
> > >     > +                     return 1;
> > >     > +             }
> > >     > +
> > >     > +             /*
> > >     > +              * Other master requested ownership.
> > >     > +              * Set extra long timeout to give it time to acqu=
ire it.
> > >     > +              */
> > >     > +             data->select_timeout =3D SELECT_DELAY_LONG * 2;
> > >     > +
> > >     > +             return 0;
> > >     > +     }
> > >     > +
> > >     > +     if (pca9641_lock_grant(reg_ctl)) {
> > >     > +             /*
> > >     > +              * Bus is on, and we own it. We are done with acq=
uisition.
> > >     > +              */
> > >     > +             reg_ctl |=3D PCA9641_CTL_BUS_CONNECT | PCA9641_CT=
L_LOCK_REQ;
> > >     > +             pca9541_reg_write(client, PCA9641_CONTROL, reg_ct=
l);
> > >     > +
> > >     > +             return 1;
> > >     > +     }
> > >     > +
> > >     > +     if (pca9641_other_lock(reg_sts)) {
> > >     > +             /*
> > >     > +              * Other master owns the bus.
> > >     > +              * If arbitration timeout has expired, force owne=
rship.
> > >     > +              * Otherwise request it.
> > >
> > >     This comment is stale. Reading the data sheet, I find no way to f=
orce
> > >     ownership with the PCA9641 (as indicated above in the release_bus
> > >     review comment). But I have only browsed the data sheet so I coul=
d
> > >     easily be mistaken...
> > >
> > >     [time passes]
> > >
> > >     Ahhh, wait, it could reset the chip to get a new chance to get ow=
nership.
> > >     But that will reset all registers for the other master as well, s=
ince I
> > >     read it as if the reset is chip-global and not master-local with =
minimal
> > >     effects on the other master. So, a big hammer indeed.
> > >
> > >     Cheers,
> > >     Peter
> > >
> > >     > +              */
> > >     > +             data->select_timeout =3D SELECT_DELAY_LONG;
> > >     > +             reg_ctl |=3D PCA9641_CTL_LOCK_REQ;
> > >     > +             pca9541_reg_write(client, PCA9641_CONTROL, reg_ct=
l);
> > >     > +     }
> > >     > +
> > >     > +     return 0;
> > >     > +}
> > >     > +
> > >     >  static int pca9541_select_chan(struct i2c_mux_core *muxc, u32 =
chan)
> > >     >  {
> > >     >       struct pca9541 *data =3D i2c_mux_priv(muxc);
> > >     > @@ -295,10 +418,15 @@ static const struct chip_desc chips[] =3D=
 {
> > >     >               .arbitrate =3D pca9541_arbitrate,
> > >     >               .release_bus =3D pca9541_release_bus,
> > >     >       },
> > >     > +     [pca9641] =3D {
> > >     > +             .arbitrate =3D pca9641_arbitrate,
> > >     > +             .release_bus =3D pca9641_release_bus,
> > >     > +     },
> > >     >  };
> > >     >
> > >     >  static const struct i2c_device_id pca9541_id[] =3D {
> > >     >       { "pca9541", pca9541 },
> > >     > +     { "pca9641", pca9641 },
> > >     >       {}
> > >     >  };
> > >     >
> > >     > @@ -307,6 +435,7 @@ MODULE_DEVICE_TABLE(i2c, pca9541_id);
> > >     >  #ifdef CONFIG_OF
> > >     >  static const struct of_device_id pca9541_of_match[] =3D {
> > >     >       { .compatible =3D "nxp,pca9541", .data =3D &chips[pca9541=
] },
> > >     > +     { .compatible =3D "nxp,pca9641", .data =3D &chips[pca9641=
] },
> > >     >       {}
> > >     >  };
> > >     >  MODULE_DEVICE_TABLE(of, pca9541_of_match);
> > >     > @@ -392,5 +521,5 @@ static struct i2c_driver pca9541_driver =3D=
 {
> > >     >  module_i2c_driver(pca9541_driver);
> > >     >
> > >     >  MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net <mailto:linux=
@roeck-us.net>>");
> > >     > -MODULE_DESCRIPTION("PCA9541 I2C master selector driver");
> > >     > +MODULE_DESCRIPTION("PCA9541/PCA9641 I2C master selector driver=
");
> > >     >  MODULE_LICENSE("GPL v2");
> > >     >
> > >
> >
