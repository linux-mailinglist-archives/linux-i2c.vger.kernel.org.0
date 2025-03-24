Return-Path: <linux-i2c+bounces-9999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E94A6E39F
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EA0B16B093
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 19:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871FD19C554;
	Mon, 24 Mar 2025 19:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="eolV1fIv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63579198E75;
	Mon, 24 Mar 2025 19:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742844841; cv=none; b=ut8nlR4CL24bh2Se11PaSDJNjH5HRWqJdirBlr76psWOn3nRyR7WJsP2y3TOqIqHEm9mVZLxXkiaNHGh6PHSs7eL7jLQpIA6ufjrLmAEjanp8st8N0Kw0+8pwLwo36wVzTI6ln2HOALO6Sj6ALauTszYOPwMcYxjM3YIMftEZCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742844841; c=relaxed/simple;
	bh=0Lha0d3hj+4yoFErNxqH4GvKDn12QT8RGBLwjaUl/sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIaC7JMwQVZNCYHsiKdzLqZ9FTTrgmIKoIU4Q6/RIiGCHt81JFRKHHyV9w5P3JponHmYayIVxfwyVKrB9yfLAgGntRL7bnWwG4f66c6vJ06odZSK+wZw932xCs/Xp3B31nOw0/SxMjI2/BChpOLyKHKV+xwXC6W01p7EMeJpaTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=eolV1fIv; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1742844836; x=1743449636; i=w_armin@gmx.de;
	bh=t5GaNTB480hpdgq4ejKuLP4hA3aa2RsTcEY4RyrxJ1s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=eolV1fIvRVc/xZrAwp8ozJAZDQLGZ7wdSTniVigZ6Ly15VVVt7uKHzoTJMy6c+pD
	 MYIWzA3oOXy9b6DoHkFF1XDgD2FKMn+ocyyGb6YerwdB3UPaFY7hsblfsyUuBbT9j
	 dx/mINt+ZpJdKwrr8/0E0QQXrussRF5rBN0DOSArOrFDoF02l1qAFeAaOMejNcjcU
	 iJrlCpAIbJb5pd+Qk/9UtUmf2nBOMH5h+pMeedyiK6c8JaU60wZXIyJKvaMTWXMoe
	 iDOYZ1GnN34+HIflEwGdL7mpMrf/aa1kfNjtkYhax4/PNlkEWTfpKLQY86Z9JNXWZ
	 da3cSuMVTJxVW3V3uw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8ofE-1t38KY0osQ-012sLe; Mon, 24
 Mar 2025 20:33:56 +0100
Message-ID: <a86b80f2-0bff-4c39-bc03-c34bf9dd381d@gmx.de>
Date: Mon, 24 Mar 2025 20:33:54 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ACPI Error: AE_AML_LOOP_TIMEOUT in \_SB.PCI0.SBUS.RDWD &
 \_SB.PCI0.SBRG.ADP1._PSR
To: Naveen Kumar P <naveenkumar.parna@gmail.com>
Cc: linux-acpi@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 andi.shyti@kernel.org, linux-i2c@vger.kernel.org
References: <CAMciSVUVjLj44LW+3ALB1fJQsUiw_2BQ5tLgpNJH08Xmj=Wr9w@mail.gmail.com>
 <07e2fb25-625b-441e-86f7-d0d54138c4aa@gmx.de>
 <CAMciSVUwy2cB4=hdX7Qki4Uc3maYdyrWa9t=_c9Uth=Pzh-KAg@mail.gmail.com>
 <d713393c-5d08-4b7f-8d5a-1a65f6f29f59@gmx.de>
 <CAMciSVXLkCrhUTXcf2WZiDkhHSO-Wdp3MhuK6ASkUL+ObtWvmw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMciSVXLkCrhUTXcf2WZiDkhHSO-Wdp3MhuK6ASkUL+ObtWvmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SSFQ93jhfP/j87iXxWWkxF+7Zodclg1hWX3DhXv07rQD1tIEE4d
 2s3Gydkis2g3hiozQzSV1MgXBeE4muRu57Lybixk/qPZSZjcCDhBBHIQEZ0I6i1MgspvsLp
 LfxwABoEFf7gHWCvRAnyySw5hhFkR5MgIYuhKrU1WL/wTwbGze0GZaV3Sdu7WXC4gYvEJxj
 PeG8kTeO0jiPyLHUcK92Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cRVZzTS5H8c=;XF7IE8ejlDVpdTRIszyYw3DsRE9
 i7ysUAdhgHZPFyMEF0T3Q1v+fCtAt2Rhn18ZdyZp3G4QU9v/lZMHjCThPnjVKN/GcGSE3FuOp
 GI3RHHLQuUrkiMXYOt9xO3ukusAWpIUpAtw2hsFRBqa77PPL56z5lHuKTOqCdWXZy8GokksE+
 8Cn7Ndijhz/xpFhA8NvrvpEOKina4/VZtHIq6WpCWf/dIxlHhbETojXXjvba1v47bkP0AVLGu
 f9A2oioTgtun4N7uxn8si+KO+816K7t8sq9mz7lHdEgjtpjWCnN2HqGuzzBedJ++iVAFfcI6+
 DUQjv/3/WdNZ8Ah01+UJ9EAns2yFw9Eh5kFIus/xhEGOjz1dyIenpyzAO2mgfyhbqU5dCPblb
 EYWkcdG+gG5VbAXLnEciv4vQiEbRFIB3wzpLgbo83GV/2VqQoYtXE//cPk5kNWBf6G4/russL
 hAQsBZ9fXYas4w8aXdBs8BWdhItdzp8wE7efvNT8E2njlphjLjcShjqDNVEE1r5hltbe1CKhQ
 HURBya8WOCL9y+qdAnEt8EVuU/dhvgeh9uhnpKoBa7ViuDV0QLvNe1ziToxmrZ04RSD33q4d8
 n2yUs0Xexn2ba4YvhnbRlTbVPjZWYAS7sCiek/XQZvN9t8OPMMKgs8XAGVEjTfZBwAjvkDaMP
 HriANG275epnFr1Dt0jSc1TYvqEVQsAlQhu1HgU7HjiL3WHhZowYHGe1q8yS8raORjbtpfstL
 2La9tXEshhWP+5/EzX1X1HO+/ddT3uSuXcF/yZOz+N/Si1NIDkxEB1BMPSIVrXdfqGTGrEsh7
 zeb2DI+fbEIxJfqnDdNmywNM7nSnDolzB+wORRfruQFWfSamEYx+RHGAL2XZWnAmMBuYahUu3
 jpqE55QUQrNKwXrsRvR1YJCMRF5s8VBuFbFxNoNWxyAh88qzPtlFk38hgTRC5awfOGsGp/lPy
 +Vi6l577Ja+LRrLCibsfhsT1agETR2srozV0gp5uoUNcOYwufYwXLT6nlYwSQdo/ofNSv/KE4
 bAOXVpnnIHgRE+snOb89z1CJzB/iCv+cFFh2cyaRJN8v8WijVmCNGlUtPOXQWQs7E6vAxCg+X
 V00T8vEc0m4GaV36EaWL8J6ESv7CTzQnH6+SKsFtwBUhgiMYbGs8Jn6+gQI8lUzmfzdReExHG
 1X9NFm45xvC7RS148GBDjI6kyj8ZFmdQDsvvsSCagKtGdYmVlzYZPM7jJ0c/MMuGZb7+Y6Jpz
 8X0Tttg05kHUi0h8MT34/1tuq6rD/hxcpWNUvRelEiP/za/nNmzApOtmYMrJ8dWutYGJcvLmP
 2LKxBVOTqpgSEyeMPUlPPhQhmn5rZB+TChTs0GrjTbTMoJDf0AYtnUlURJuMC9aCD7p+MPPg9
 EferphWF/dl89d7MY5SgZITRq2m3PRd0LZCn1BL8h8P85poAF/ggLNOSHeVa1aTAsoJbILP8v
 6FbNMiA==

Am 24.03.25 um 07:06 schrieb Naveen Kumar P:

> On Mon, Mar 24, 2025 at 3:25=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrot=
e:
>> Am 22.03.25 um 16:40 schrieb Naveen Kumar P:
>>
>>> On Sat, Mar 22, 2025 at 3:02=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wr=
ote:
>>>> Am 19.03.25 um 12:29 schrieb Naveen Kumar P:
>>>>
>>>>> Hi all,
>>>>>
>>>>> I am encountering repeated AE_AML_LOOP_TIMEOUT errors in the ACPI RD=
WD
>>>>> & \_SB.PCI0.SBRG.ADP1._PSR methods. Below are relevant log entries
>>>>> from my system running Linux kernel 6.13.0+:
>>>>>
>>>>> [77998.038653]
>>>>>                   Initialized Local Variables for Method [RDWD]:
>>>>> [77998.038691]   Local1: 00000000d0fe9fee <Obj>           Integer
>>>>> 0000000000000015
>>>>> [77998.038862]   Local6: 00000000f41c1645 <Obj>           Integer
>>>>> 0000000000000000
>>>>> [77998.039031]   Local7: 0000000040665c5c <Obj>           Integer
>>>>> 000000000000AA55
>>>>>
>>>>> [77998.039237] Initialized Arguments for Method [RDWD]:  (2 argument=
s
>>>>> defined for method invocation)
>>>>> [77998.039273]   Arg0:   00000000397dc53d <Obj>           Integer
>>>>> 0000000000000014
>>>>> [77998.039442]   Arg1:   000000001099e334 <Obj>           Integer
>>>>> 0000000000000002
>>>>>
>>>>> [77998.039673] ACPI Error: Aborting method \_SB.PCI0.SBUS.RDWD due t=
o
>>>>> previous error (AE_AML_LOOP_TIMEOUT) (20240827/psparse-529)
>>>>> [77998.040455] ACPI Error: Aborting method \_SB.PCI0.SBRG.ADP1._PSR
>>>>> due to previous error (AE_AML_LOOP_TIMEOUT) (20240827/psparse-529)
>>>>> [77998.043659] ACPI: \_SB_.PCI0.SBRG.ADP1: Error reading AC Adapter
>>>>> state: AE_AML_LOOP_TIMEOUT
>>>>>
>>>>> [78028.442980]
>>>>>                   Initialized Local Variables for Method [RDWD]:
>>>>> [78028.443019]   Local1: 00000000898a9a7e <Obj>           Integer
>>>>> 0000000000000017
>>>>> [78028.443192]   Local6: 000000000cf0c853 <Obj>           Integer
>>>>> 0000000000000000
>>>>> [78028.443362]   Local7: 00000000bb4aa65f <Obj>           Integer
>>>>> 000000000000AA55
>>>>>
>>>>> [78028.443569] Initialized Arguments for Method [RDWD]:  (2 argument=
s
>>>>> defined for method invocation)
>>>>> [78028.443606]   Arg0:   00000000ef8d445b <Obj>           Integer
>>>>> 0000000000000016
>>>>> [78028.443775]   Arg1:   000000006cacc887 <Obj>           Integer
>>>>> 0000000000000003
>>>>>
>>>>> [78028.444006] ACPI Error: Aborting method \_SB.PCI0.SBUS.RDWD due t=
o
>>>>> previous error (AE_AML_LOOP_TIMEOUT) (20240827/psparse-529)
>>>>> [78028.446366] ACPI Error: Aborting method \_SB.PCI0.SBRG.ADP1._PSR
>>>>> due to previous error (AE_AML_LOOP_TIMEOUT) (20240827/psparse-529)
>>>>> [78028.451179] ACPI: \_SB_.PCI0.SBRG.ADP1: Error reading AC Adapter
>>>>> state: AE_AML_LOOP_TIMEOUT
>>>>>
>>>>> [78032.877472]
>>>>>                   Initialized Local Variables for Method [RDWD]:
>>>>> [78032.877509]   Local1: 00000000cf6291ae <Obj>           Integer
>>>>> 0000000000000017
>>>>> [78032.877682]   Local6: 0000000026aa8a7a <Obj>           Integer
>>>>> 0000000000000003
>>>>> [78032.877851]   Local7: 00000000acfa20e0 <Obj>           Integer
>>>>> 000000000000AA55
>>>>>
>>>>> [78032.878058] Initialized Arguments for Method [RDWD]:  (2 argument=
s
>>>>> defined for method invocation)
>>>>> [78032.878094]   Arg0:   00000000a186096f <Obj>           Integer
>>>>> 0000000000000016
>>>>> [78032.878262]   Arg1:   00000000d0e1eefe <Obj>           Integer
>>>>> 0000000000000003
>>>>>
>>>>> [78032.878492] ACPI Error: Aborting method \_SB.PCI0.SBUS.RDWD due t=
o
>>>>> previous error (AE_AML_LOOP_TIMEOUT) (20240827/psparse-529)
>>>>> [78032.881011] ACPI Error: Aborting method \_SB.PCI0.SBRG.ADP1._PSR
>>>>> due to previous error (AE_AML_LOOP_TIMEOUT) (20240827/psparse-529)
>>>>> [78032.883061] ACPI: \_SB_.PCI0.SBRG.ADP1: Error reading AC Adapter
>>>>> state: AE_AML_LOOP_TIMEOUT
>>>>>
>>>>>
>>>>> This issue appears randomly, affecting the RDWD method, which is
>>>>> likely responsible for reading data from a bus, and consequently
>>>>> causing the _PSR method (power state read) to fail.
>>>>>
>>>>>
>>>>> Questions:
>>>>> 1. What typically causes AE_AML_LOOP_TIMEOUT errors?
>>>> AFAIK this error is caused by a while loop taking too long to finish.=
 I suspect that
>>>> the ACPI bytecode tries to wait for a non-responsive hardware device.
>>>>
>>>>> 2. Could these ACPI errors impact PCI device access?
>>>>> Since the error originates from _SB.PCI0.SBUS.RDWD, could this failu=
re
>>>>> affect PCI device communication or cause failures when accessing PCI
>>>>> devices?
>>>> I do not think so, the SBUS device is likely just a SMBus controller =
attached to the PCI bus.
>>>>
>>>>> 3. Could this be a firmware/BIOS issue?If so, what tools or steps
>>>>> should I use to verify and debug the ACPI tables?
>>>> It is either a hardware issue or a BIOS bug. Can you share the output=
 of the "acpidump" utility
>>>> provided by the ACPICA project? Many Linux distributions already pack=
age ACPICA in their package repositories.
>>> I have attached the acpi.tar.gz file as requested. This archive
>>> contains the output from the "acpidump" utility. Below is a list of
>>> the files included in the archive:
>>>
>>> ls -ltr acpi
>>> total 760
>>> -rw-rw-r-- 1 murphy murphy 205609 Mar 19 18:30 acpi_tables.txt
>>> -rw-r--r-- 1 root   root       60 Mar 19 18:31 mcfg.dat
>>> -rw-r--r-- 1 root   root      132 Mar 19 18:31 apic.dat
>>> -rw-r--r-- 1 root   root      656 Mar 19 18:31 ssdt2.dat
>>> -rw-r--r-- 1 root   root       66 Mar 19 18:31 uefi.dat
>>> -rw-r--r-- 1 root   root    36402 Mar 19 18:31 dsdt.dat
>>> -rw-r--r-- 1 root   root      260 Mar 19 18:31 lpit.dat
>>> -rw-r--r-- 1 root   root      378 Mar 19 18:31 ssdt3.dat
>>> -rw-r--r-- 1 root   root      268 Mar 19 18:31 facp.dat
>>> -rw-r--r-- 1 root   root       68 Mar 19 18:31 fpdt.dat
>>> -rw-r--r-- 1 root   root     1891 Mar 19 18:31 ssdt1.dat
>>> -rw-r--r-- 1 root   root      332 Mar 19 18:31 csrt.dat
>>> -rw-r--r-- 1 root   root       56 Mar 19 18:31 hpet.dat
>>> -rw-r--r-- 1 root   root       64 Mar 19 18:31 facs.dat
>>> -rw-r--r-- 1 root   root      890 Mar 19 18:31 ssdt4.dat
>>> -rw-r--r-- 1 root   root      141 Mar 19 18:31 ssdt7.dat
>>> -rw-r--r-- 1 root   root     1075 Mar 19 18:31 ssdt5.dat
>>> -rw-r--r-- 1 root   root      351 Mar 19 18:31 ssdt6.dat
>>> -rw-rw-r-- 1 murphy murphy   5919 Mar 19 18:31 apic.dsl
>>> -rw-rw-r-- 1 murphy murphy   8131 Mar 19 18:31 csrt.dsl
>>> -rw-rw-r-- 1 murphy murphy 337832 Mar 19 18:31 dsdt.dsl
>>> -rw-rw-r-- 1 murphy murphy  10103 Mar 19 18:31 facp.dsl
>>> -rw-rw-r-- 1 murphy murphy   1368 Mar 19 18:31 facs.dsl
>>> -rw-rw-r-- 1 murphy murphy   1802 Mar 19 18:31 fpdt.dsl
>>> -rw-rw-r-- 1 murphy murphy   1863 Mar 19 18:31 hpet.dsl
>>> -rw-rw-r-- 1 murphy murphy   7523 Mar 19 18:31 lpit.dsl
>>> -rw-rw-r-- 1 murphy murphy   1524 Mar 19 18:31 mcfg.dsl
>>> -rw-rw-r-- 1 murphy murphy   9996 Mar 19 18:31 ssdt1.dsl
>>> -rw-rw-r-- 1 murphy murphy   7692 Mar 19 18:31 ssdt2.dsl
>>> -rw-rw-r-- 1 murphy murphy   4296 Mar 19 18:31 ssdt3.dsl
>>> -rw-rw-r-- 1 murphy murphy   8290 Mar 19 18:31 ssdt4.dsl
>>> -rw-rw-r-- 1 murphy murphy  16968 Mar 19 18:31 ssdt5.dsl
>>> -rw-rw-r-- 1 murphy murphy   2843 Mar 19 18:31 ssdt6.dsl
>>> -rw-rw-r-- 1 murphy murphy   1337 Mar 19 18:31 ssdt7.dsl
>>> -rw-rw-r-- 1 murphy murphy   1383 Mar 19 18:31 uefi.dsl
>>>
>>>
>>> Please let me know if you need any further details or additional
>>> information to assist in debugging the ACPI tables.
>>>
>>> Thank you for your help.
>> Alright, it seems that the ACPI bytecode is trying to access the charge=
r using the smbus interface.
>> For some reason this takes over 30 seconds which causes the ACPI interp=
reter to throw this error.
>>
>> Can you check how long it normally takes to read the "online" sysfs att=
ribute of the charger located
>> under "/sys/class/power_supply/ADP1"?
> I have written a script to measure the time it takes to read the
> "online" sysfs attribute of the charger located under
> /sys/class/power_supply/ADP1. Below is the script and the results:
>
> $cat test.sh
> #!/bin/bash
>
> start_time=3D$(date +%s%N)
> cat /sys/class/power_supply/ADP1/online
> end_time=3D$(date +%s%N)
>
> elapsed_time=3D$((end_time - start_time))
> echo "Time taken: $((elapsed_time / 1000000)) ms"
>
> $ sudo ./test.sh
> 1
> Time taken: 3809 ms
>
> $ sudo ./test.sh
> 1
> Time taken: 1688 ms
>
> $ sudo ./test.sh
> 1
> Time taken: 1685 ms
>
> $ sudo ./test.sh
> 1
> Time taken: 1688 ms
>
>
> As you can see, the first run took 3809 ms, and the subsequent runs
> took around 1688 ms.

That is suspiciously long for a smbus transaction, something is not right.

>> Also please share the output of "lspci -v".
> $ sudo lspci -v
> 00:00.0 Host bridge: Intel Corporation Atom Processor Z36xxx/Z37xxx
> Series SoC Transaction Register (rev 11)
>          Subsystem: Intel Corporation Atom Processor Z36xxx/Z37xxx
> Series SoC Transaction Register
>          Flags: bus master, fast devsel, latency 0
>          Kernel driver in use: iosf_mbi_pci
>
> 00:02.0 VGA compatible controller: Intel Corporation Atom Processor
> Z36xxx/Z37xxx Series Graphics & Display (rev 11) (prog-if 00 [VGA
> controller])
>          DeviceName:  Onboard IGD
>          Subsystem: Intel Corporation Atom Processor Z36xxx/Z37xxx
> Series Graphics & Display
>          Flags: bus master, fast devsel, latency 0, IRQ 97
>          Memory at b0000000 (32-bit, non-prefetchable) [size=3D4M]
>          Memory at a0000000 (32-bit, prefetchable) [size=3D256M]
>          I/O ports at e080 [size=3D8]
>          Expansion ROM at 000c0000 [virtual] [disabled] [size=3D128K]
>          Capabilities: [d0] Power Management version 2
>          Capabilities: [90] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
>          Capabilities: [b0] Vendor Specific Information: Len=3D07 <?>
>          Kernel driver in use: i915
>          Kernel modules: i915
>
> 00:13.0 SATA controller: Intel Corporation Atom Processor E3800 Series
> SATA AHCI Controller (rev 11) (prog-if 01 [AHCI 1.0])
>          Subsystem: Intel Corporation Atom Processor E3800 Series SATA
> AHCI Controller
>          Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 91
>          I/O ports at e070 [size=3D8]
>          I/O ports at e060 [size=3D4]
>          I/O ports at e050 [size=3D8]
>          I/O ports at e040 [size=3D4]
>          I/O ports at e020 [size=3D32]
>          Memory at b0b17000 (32-bit, non-prefetchable) [size=3D2K]
>          Capabilities: [80] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
>          Capabilities: [70] Power Management version 3
>          Capabilities: [a8] SATA HBA v1.0
>          Kernel driver in use: ahci
>          Kernel modules: ahci
>
> 00:14.0 USB controller: Intel Corporation Atom Processor
> Z36xxx/Z37xxx, Celeron N2000 Series USB xHCI (rev 11) (prog-if 30
> [XHCI])
>          Subsystem: Intel Corporation Atom Processor Z36xxx/Z37xxx,
> Celeron N2000 Series USB xHCI
>          Flags: bus master, medium devsel, latency 0, IRQ 90
>          Memory at b0b00000 (64-bit, non-prefetchable) [size=3D64K]
>          Capabilities: [70] Power Management version 2
>          Capabilities: [80] MSI: Enable+ Count=3D1/8 Maskable- 64bit+
>          Kernel driver in use: xhci_hcd
>
> 00:17.0 SD Host controller: Intel Corporation Atom Processor E3800
> Series eMMC 4.5 Controller (rev 11) (prog-if 01)
>          Flags: bus master, fast devsel, latency 0, IRQ 23
>          Memory at b0b16000 (32-bit, non-prefetchable) [size=3D4K]
>          Memory at b0b15000 (32-bit, non-prefetchable) [size=3D4K]
>          Capabilities: [80] Power Management version 3
>          Kernel driver in use: sdhci-pci
>          Kernel modules: sdhci_pci
>
> 00:1a.0 Encryption controller: Intel Corporation Atom Processor
> Z36xxx/Z37xxx Series Trusted Execution Engine (rev 11)
>          Subsystem: Intel Corporation Atom Processor Z36xxx/Z37xxx
> Series Trusted Execution Engine
>          Flags: bus master, fast devsel, latency 0, IRQ 98
>          Memory at b0900000 (32-bit, non-prefetchable) [size=3D1M]
>          Memory at b0800000 (32-bit, non-prefetchable) [size=3D1M]
>          Capabilities: [80] Power Management version 3
>          Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
>          Kernel driver in use: mei_txe
>          Kernel modules: mei_txe
>
> 00:1b.0 Audio device: Intel Corporation Atom Processor Z36xxx/Z37xxx
> Series High Definition Audio Controller (rev 11)
>          Subsystem: Intel Corporation Atom Processor Z36xxx/Z37xxx
> Series High Definition Audio Controller
>          Flags: bus master, fast devsel, latency 0, IRQ 10
>          Memory at b0b10000 (64-bit, non-prefetchable) [size=3D16K]
>          Capabilities: [50] Power Management version 2
>          Capabilities: [60] MSI: Enable- Count=3D1/1 Maskable- 64bit+
>          Kernel modules: snd_hda_intel
>
> 00:1c.0 PCI bridge: Intel Corporation Atom Processor E3800 Series PCI
> Express Root Port 1 (rev 11) (prog-if 00 [Normal decode])
>          Flags: bus master, fast devsel, latency 0, IRQ 87
>          Bus: primary=3D00, secondary=3D01, subordinate=3D01, sec-latenc=
y=3D0
>          I/O behind bridge: 00001000-00001fff [size=3D4K]
>          Memory behind bridge: b0400000-b07fffff [size=3D4M]
>          Prefetchable memory behind bridge: [disabled]
>          Capabilities: [40] Express Root Port (Slot+), MSI 00
>          Capabilities: [80] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
>          Capabilities: [90] Subsystem: Intel Corporation Atom Processor
> E3800 Series PCI Express Root Port 1
>          Capabilities: [a0] Power Management version 3
>          Kernel driver in use: pcieport
>
> 00:1c.2 PCI bridge: Intel Corporation Atom Processor E3800 Series PCI
> Express Root Port 3 (rev 11) (prog-if 00 [Normal decode])
>          Flags: bus master, fast devsel, latency 0, IRQ 88
>          Bus: primary=3D00, secondary=3D02, subordinate=3D02, sec-latenc=
y=3D0
>          I/O behind bridge: 00002000-00002fff [size=3D4K]
>          Memory behind bridge: [disabled]
>          Prefetchable memory behind bridge: [disabled]
>          Capabilities: [40] Express Root Port (Slot+), MSI 00
>          Capabilities: [80] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
>          Capabilities: [90] Subsystem: Intel Corporation Atom Processor
> E3800 Series PCI Express Root Port 3
>          Capabilities: [a0] Power Management version 3
>          Kernel driver in use: pcieport
>
> 00:1c.3 PCI bridge: Intel Corporation Atom Processor E3800 Series PCI
> Express Root Port 4 (rev 11) (prog-if 00 [Normal decode])
>          Flags: bus master, fast devsel, latency 0, IRQ 89
>          Bus: primary=3D00, secondary=3D03, subordinate=3D03, sec-latenc=
y=3D0
>          I/O behind bridge: 0000d000-0000dfff [size=3D4K]
>          Memory behind bridge: b0a00000-b0afffff [size=3D1M]
>          Prefetchable memory behind bridge: [disabled]
>          Capabilities: [40] Express Root Port (Slot+), MSI 00
>          Capabilities: [80] MSI: Enable+ Count=3D1/1 Maskable- 64bit-
>          Capabilities: [90] Subsystem: Intel Corporation Atom Processor
> E3800 Series PCI Express Root Port 4
>          Capabilities: [a0] Power Management version 3
>          Kernel driver in use: pcieport
>
> 00:1f.0 ISA bridge: Intel Corporation Atom Processor Z36xxx/Z37xxx
> Series Power Control Unit (rev 11)
>          Subsystem: Intel Corporation Atom Processor Z36xxx/Z37xxx
> Series Power Control Unit
>          Flags: bus master, medium devsel, latency 0
>          Capabilities: [e0] Vendor Specific Information: Len=3D0c <?>
>          Kernel driver in use: lpc_ich
>          Kernel modules: lpc_ich
>
> 00:1f.3 SMBus: Intel Corporation Atom Processor E3800 Series SMBus
> Controller (rev 11)
>          Subsystem: Intel Corporation Atom Processor E3800 Series SMBus
> Controller
>          Flags: medium devsel, IRQ 18
>          Memory at b0b14000 (32-bit, non-prefetchable) [size=3D32]
>          I/O ports at e000 [size=3D32]
>          Capabilities: [50] Power Management version 3
>          Kernel driver in use: i801_smbus
>          Kernel modules: i2c_i801

The i2c_i801 driver uses a custom operation region handler to intercept AC=
PI accesses
to the smbus controller registers, maybe this could be the reason for the =
timeouts.

I CCed the maintainers of this driver. Maybe they can help us here.

Thanks,
Armin Wolf

> 01:00.0 RAM memory: PLDA Device 5555
>          Subsystem: Device 4000:0000
>          Flags: fast devsel, IRQ 11
>          Memory at b0400000 (32-bit, non-prefetchable) [virtual] [size=
=3D4M]
>          Capabilities: [40] Power Management version 3
>          Capabilities: [48] MSI: Enable- Count=3D1/1 Maskable- 64bit-
>          Capabilities: [60] Express Endpoint, MSI 00
>
> 03:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network
> Connection (rev 03)
>          Flags: bus master, fast devsel, latency 0, IRQ 19
>          Memory at b0a00000 (32-bit, non-prefetchable) [size=3D512K]
>          I/O ports at d000 [size=3D32]
>          Memory at b0a80000 (32-bit, non-prefetchable) [size=3D16K]
>          Capabilities: [40] Power Management version 3
>          Capabilities: [50] MSI: Enable- Count=3D1/1 Maskable+ 64bit+
>          Capabilities: [70] MSI-X: Enable+ Count=3D5 Masked-
>          Capabilities: [a0] Express Endpoint, MSI 00
>          Capabilities: [100] Advanced Error Reporting
>          Capabilities: [140] Device Serial Number 00-30-64-ff-ff-a2-59-a=
a
>          Capabilities: [1a0] Transaction Processing Hints
>          Kernel driver in use: igb
>          Kernel modules: igb
>
>> Thanks,
>> Armin Wolf
>>
>>>>> 4. Is there a recommended workaround to mitigate this issue?
>>>> You can check if a BIOS update is available for your device.
>>>>
>>>>> 4. How can I debug this further?I can enable additional ACPI debuggi=
ng
>>>>> logs or provide dumps of ACPI tables if necessary.
>>>> I can take a look at the \_SB.PCI0.SBUS.RDWD method inside the ACPI t=
able dumps
>>>> to see where the error is coming from.
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>>>> Any guidance on resolving or further diagnosing this issue would be
>>>>> highly appreciated.
>>>>>
>>>>> Best regards,
>>>>> Naveen
>>>>>

