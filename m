Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF300169A89
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Feb 2020 23:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgBWWw7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 23 Feb 2020 17:52:59 -0500
Received: from mout.gmx.net ([212.227.17.21]:47367 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgBWWw7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 23 Feb 2020 17:52:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582498374;
        bh=416GfZhVWD275tAxyiFyzUP/mo9wO6XeObrIYAHxCm0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=G9V6nLaN8ASSvKvKqd3AL86eqtxY8sS1kU2usYAmzmHJDn+eyJd0iJA4mL1q0wbtu
         VWbyAA7tNWrsJ/ztc90cbgmf6L/TniONoFkKYmIco7XSrS35QfIxMJf+q12R/VHdGW
         VH8Wi9t5wlK6ZGmzvaLRunEChxqXzJ0cI9JxiKsA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from corona.crabdance.com ([173.228.106.117]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MMGRK-1ip1Sl3V7m-00JJm9; Sun, 23 Feb 2020 23:52:54 +0100
Received: by corona.crabdance.com (Postfix, from userid 1001)
        id BFEB76E85603; Sun, 23 Feb 2020 14:52:34 -0800 (PST)
From:   Stefan Schaeckeler <schaecsn@gmx.net>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>
Cc:     Stefan Schaeckeler <schaecsn@gmx.net>
Subject: [PATCH 0/1] i2c: imc: Add support for Intel iMC SMBus host controller.
Date:   Sun, 23 Feb 2020 14:51:09 -0800
Message-Id: <1582498270-50674-1-git-send-email-schaecsn@gmx.net>
X-Mailer: git-send-email 2.4.5
X-Provags-ID: V03:K1:oJNy4dJXY3YRHg/0gV0/90DJO9sl45tLzRJhCwsRJakAKiBasX+
 fYb21AGofY+ABPIXWwRuC2XMPxULmVgu5hTOkgcxburZTz3dJmUon+NLo5Dnafsgtq1UjRB
 9trU0RbEEeoSSZ4O+Nf8wU2crsJbaK4z+WT2WjT15qHsJxUYQ5AS6YfIEH1rk5deeWNdo8r
 XqRDR8hEvcqHQQ4K6Z1UQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6qp28o/kVmY=:7kz1YOQWpuJQ2QnIXc2Y3X
 pl4Sk5/7yQhskrPhygcx4ezCkWOHQtAeIBCOytV9/Eb5ocdxStyR3h0JiuVmON9PAbPOcDq80
 2whlUXKr7yfgnuEzwbL2+2FfFEQ/RVVkJuKxILJwLXKk66fUUcdtXySQP7SIuI42rNWGhfUiA
 ps6OsKJEle6SMR+PgUEYgbM+ZwZnZ1T59DZyJTDzvJ10SjoLVX80BBjWEnZiYfze7WLINszWs
 a0rO1Ol282tu5G/zk6Jp50B1GMbH25T8GtxWTH3KRrO3W3iirQ7LlkPI4smEBfqlkfe5QPcFl
 CkrCy4QpnlA28TxCzwG5KT1EEExvZhafV+Lpi4HFgX4dkSGEzfX8nMVTR/ufhf3pgauuABxvC
 Aq4OAF3IKgd4F+7ec/Lovhy21ou//CTdzfveCXUTSxki0yX3ZGcV9poiGiQJUqDvXB5dMFj7Z
 XQ8FCOrVD0sto7/Ikmsp+nQH+T/cH3ek4ziXIc7yfvTMT9aMuzkvOeR++NdJFjoGqJOl7teD0
 ddGICFC12fCRSac1GfIJEJcHjR+MO5rPp8NAoUdaCJVV/57zkXVNU7/LdPZNDNphV6rmk3m51
 eC14szuN3lHYv3s2nLbgrjil4/5viEjCGHiA2ueAZ9qv37BJAM7ACSjbZTB/hCjdiG7zOiDCf
 SI0TLWrW9lnaKcRbQv/kM36QCCN3rkdaKYrTExHoJa3I4SNz8UPmI2DhlilpX/g4+nTIAiQef
 QxeLMri3wTboTp5hL/AyL2oYCzvnGBaRcLGTuitwJbfPpUgWYnlmkdla+d+PRq3hMN6BM3KDo
 k0TOOkni6knJRRMGubepwW5lEpPyhntJ0mbdxzkeqUh6rh8fsEKG7ysY+c44/5UzWZfiBP/Rs
 QZAJ3Q1pmOWZ8/jascigyTSwVbZy6zfhv1k7dT7s0Fz8kG4gBbIcvWUvA7Co5WnlIP/bJoDIZ
 uqFIztNx0BvxcWhapFmiVQtUGZi/HrMRWESISXAEtK9TyydxiFahAqhtP4Ecw1DAscIKAJRgD
 ChqSTr3IVCVvi9S5svrbViouz3f6uijIo86RkyKnVvYjg+f5DH+fM2rPGQVeC8mDaF1bIgmTk
 /d2upl7SvFj8GCh3Lu5Wv/KefIsPJU09ua4BmvtMZkQotLEACvatdQjTa7MLZyleFk1OSeUS8
 eBSsoVqKvg4CdAZn623u3VvWcysDjrKT+TYFhxNoeQYxwJvKP9f9hYaseqjrSmu71UNIV2ubS
 niDgtJy830WH7hOhn
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This patch is based on Andy Lutomirski's iMC SMBus driver patch-set
https://lkml.org/lkml/2016/4/28/926. It never made it into the kernel. I h=
ope
this rewrite will:


Overview

Modern Intel memory controllers host an SMBus controller and connection to
DIMMs and their thermal sensors. The memory controller firmware has three =
modes
of operation: Closed Loop Thermal Throttling (CLTT), Open Loop Thermal
Throttling (OLTT) and none.

- CLTT: The memory controller firmware is periodically accessing the DIMM
  temperature sensor over the SMBus.

- OLTT: The memory controller firmware is not accessing the DIMM temperatu=
re
  sensor over the SMBus but approximates/guesses its temperature.

Depending on the temperature, the memory controller firmware may throttle =
the
memory bandwidth and alike.

Only one mode of operation can be used at a time. Intel recommends CLTT. T=
his
is also the default on our BIOS.


Original Driver and its Rewrite

The original driver i2c-imc.c was an iMC SMBus controller that provided ac=
cess
to the DIMM thermal sensors. A second driver dimm-bus.c, also part of Andy=
's
patch-set, instantiated the thermal sensors.

The original driver was written for the memory controller found in Sandy B=
ridge
CPUs. Either the Sandy Bridge documentation is incomplete or the functiona=
lity
is limited. It was not possible to use this driver while the memory contro=
ller
was in CLTT mode as the driver and firmware were both accessing the memory
controller without arbitration. We ran this driver on our Broadwell CPU an=
d the
driver's internal consistency check failed every 30 min or so.

We rewrote this driver to support Broadwell's memory controller 8086.6fa8.=
 Over
time, support for more memory controllers should be added.

Our documentation (Intel Xeon Processor D-1500 Product Family External Des=
ign
Specification (EDS), Volume Two: Core and Uncore Registers Volume 2 of 5 R=
ev.
2.3) hints how to make OS drivers and firmware co-exist in CLTT mode. In s=
hort:

- don't (necessarily) disable CLTT mode, but set tsod_polling_interval to =
0
- wait 10 ms to drain a potential in-flight firmware CLTT transaction
- OS has now exclusive access to the smb bus
- set tsod_polling_interval to the previous value

Our patch provides proper arbitration between OS and firmware on Broadwell=
.


The original patch-set also provided an additional driver, dimm-bus.c, to
instantiate the temperature sensors. It had some draw-backs:

- the probe function i2c_scan_dimm_bus() blindly enumerates potential DIMM
  sensor i2c addresses causing the SBE bit to be set 6 times on our system=
.
  That is dangerous (see comment in i2c-imc.c: if (stat & SMBSTAT_SBE)). T=
he
  i2c addresses of the actual temperature sensors are known to the memory
  controller (when in CLTT mode) and don't need to be blindly enumerated.

- the probe function i2c_scan_dimm_bus() instantiates blindly 10 temperatu=
re
  sensors, although our system had only 2 DIMMs (with 1 temperature sensor
  each). The remaining 8 temperature sensors returned 0.

- as already pointed out, the instantiations happen in a further driver
  dimm-bus.c. The iMC SMBus driver i2c-imc.c is calling dimm-bus.c to do i=
ts
  job. That does not feel right. I don't know how to do it better and even=
 move
  for now the instantiations into the iMC SMBus driver itself
  (imc_instantiate_sensors(()). Please advice here.


The mapping of dimm to i2c adapter and addresses is confusing at best. Fro=
m the
smb_stat_0 and from Andy's dimm-bus.c driver, I gain the impression the ma=
pping
may be

channel 00 slot 00   i2c-1 0x18 (if there is a dimm)
channel 00 slot 01   i2c-1 0x19 (if there is a dimm)
channel 00 slot 02   i2c-1 0x1a (if there is a dimm)
channel 00 slot 03   i2c-1 0x1b (if there is a dimm)
channel 01 slot 00   i2c-1 0x1c (if there is a dimm)
channel 01 slot 01   i2c-1 0x1d (if there is a dimm)
channel 01 slot 02   i2c-1 0x1e (if there is a dimm)
channel 01 slot 03   i2c-1 0x1f (if there is a dimm)

channel 02 slot 00   i2c-2 0x18 (if there is a dimm)
channel 02 slot 01   i2c-2 0x19 (if there is a dimm)
channel 02 slot 02   i2c-2 0x1a (if there is a dimm)
channel 02 slot 03   i2c-2 0x1b (if there is a dimm)
channel 03 slot 00   i2c-2 0x1c (if there is a dimm)
channel 03 slot 01   i2c-2 0x1d (if there is a dimm)
channel 03 slot 02   i2c-2 0x1e (if there is a dimm)
channel 03 slot 03   i2c-2 0x1f (if there is a dimm)


Experimentally, I gain the impression it's rather

channel 00 slot 00   i2c-1 0x18 (if there is a dimm)
channel 00 slot 01   i2c-1 0x19 (if there is a dimm)
channel 01 slot 00   i2c-1 0x1a (if there is a dimm)
channel 01 slot 01   i2c-1 0x1b (if there is a dimm)

channel 02 slot 00   i2c-2 0x18 (if there is a dimm)
channel 02 slot 01   i2c-2 0x19 (if there is a dimm)
channel 03 slot 00   i2c-2 0x1a (if there is a dimm)
channel 03 slot 01   i2c-2 0x1b (if there is a dimm)

Why? Because we see on our system temperature sensors on i2c address i2c-1=
 0x18
and ic2-1 0x1a and BIOS and EDAC tell us we have DIMMs on channel 0:slot 0=
 and
channel 1:slot 0.

[    9.522781] EDAC DEBUG: __populate_dimms: mc#0: ha 0 channel 0, dimm 0,=
 16384 Mb (4194304 pages) bank: 16, rank: 2, row: 0x10000, col: 0x400
[    9.522786] EDAC DEBUG: __populate_dimms: mc#0: ha 0 channel 1, dimm 0,=
 16384 Mb (4194304 pages) bank: 16, rank: 2, row: 0x10000, col: 0x400


When in OLTT mode, the sensors need to be manually instantiated, e.g.

# echo jc42 0x18  > /sys/devices/pci0000:ff/0000:ff:13.0/i2c-1/new_device
# echo jc42 0x1a  > /sys/devices/pci0000:ff/0000:ff:13.0/i2c-1/new_device


In CLTT mode - we expect almost everyone to configure CLTT mode in their B=
IOS -
the new driver knows where DIMMs are populated (see arguments to
imc_instantiate_sensor()) and instantiates the sensors. For this magic to
happen, we don't need to understand the mapping.


Unit Test

I had access to two systems with these memory configurations:

System 1: DIMM at channel 1, slot 0.
System 2: DIMM at channel 0, slot 0. DIMM at channel 1, slot 0.

I had no access to a system with DIMMs on channel 2 or 3.

We read the temperature sensors for 8 hours while having CLTT enabled. Nex=
t we
read the temperature sensors for 8 hours while having OLTT enabled. We alw=
ays
get sane data. The internal sanity check always passes and dmesg is clean.=
 The
grep at the end filters out sane temperature values in the 20C to 39C rang=
e so
we can focus on abnormal temperature values and error messages.

First we stress-tested the driver (for 8 hours).

System 1:

while true; do cat /sys/devices/pci0000:ff/0000:ff:13.0/i2c-1/1-001a/hwmon=
/hwmon?/temp1_input; done | grep -v ^[23] &
while true; do cat /sys/devices/pci0000:ff/0000:ff:13.0/i2c-1/1-001a/hwmon=
/hwmon?/temp1_input; done | grep -v ^[23] &

System  2:

while true; do cat /sys/devices/pci0000:ff/0000:ff:13.0/i2c-1/1-0018/hwmon=
/hwmon?/temp1_input; done | grep -v ^[23] &
while true; do cat /sys/devices/pci0000:ff/0000:ff:13.0/i2c-1/1-0018/hwmon=
/hwmon?/temp1_input; done | grep -v ^[23] &
while true; do cat /sys/devices/pci0000:ff/0000:ff:13.0/i2c-1/1-001a/hwmon=
/hwmon?/temp1_input; done | grep -v ^[23] &
while true; do cat /sys/devices/pci0000:ff/0000:ff:13.0/i2c-1/1-001a/hwmon=
/hwmon?/temp1_input; done | grep -v ^[23] &


Next, we gave firmware polling a better chance to start and added a sleep =
of 2
seconds (for 8 hours).

System 1 and System 2:

while true; do cat /sys/devices/pci0000:ff/0000:ff:13.0/i2c-1/1-001a/hwmon=
/hwmon?/temp1_input; sleep 2; done | grep -v ^[23] &

~ Stefan


Stefan Schaeckeler (1):
  i2c: imc: Add support for Intel iMC SMBus host controller.

 MAINTAINERS                  |   5 +
 drivers/i2c/busses/Kconfig   |  15 ++
 drivers/i2c/busses/Makefile  |   1 +
 drivers/i2c/busses/i2c-imc.c | 515 ++++++++++++++++++++++++++++++++++++++=
+++++
 4 files changed, 536 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-imc.c

=2D-
2.11.0

