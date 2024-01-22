Return-Path: <linux-i2c+bounces-1410-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC228362EF
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 13:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A0E71F2263B
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 12:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A554A3B2B6;
	Mon, 22 Jan 2024 12:17:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7093B282;
	Mon, 22 Jan 2024 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705925843; cv=none; b=RB9UmCuegLzZ9L5FlkLUsxEHr4eFX0aagdLFkVO2Yg77zH7BCQ44YyoCl9qeRGIOSEz8nFXnOPXJIdvPqjHQx0Jfs84kqP65h+Ej+F/OG2cj01Ms5ZBGQzk5U7SJYxArTmxOlwZTvYxWamiB4wFg+xJYU1XKRxmiQsJ0Wt6JyVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705925843; c=relaxed/simple;
	bh=7aKVXurem33k/1z2Bwp/iO5Bd28myCRdPoS1dST9u/s=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=YrrWOqSc/M+18/eLJk4xVzM6Y1HkAFuwcnadsrFXBcFHiXlM75F4yTtxknbZilvb4/qkTOVQ32DsRw3qVOzacyvnMZYObMoKyB7sNWyrrztpMANBWSmHm4usDV2SpFCyGEnCSqgCAevrtZfc1X5XReMM3d2HCwbHJpiIG+TFOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.53] (ip5f5ae9f4.dynamic.kabel-deutschland.de [95.90.233.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 32BEE61E646C7;
	Mon, 22 Jan 2024 13:16:26 +0100 (CET)
Content-Type: multipart/mixed; boundary="------------EBz23e30HntQKxViUq8E5TGn"
Message-ID: <f1658459-1b77-41b1-9e58-99c16a83e1d1@molgen.mpg.de>
Date: Mon, 22 Jan 2024 13:16:25 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dell XPS 13 9360: DMAR errors `DRHD: handling fault status reg 2`
 and `[INTR-REMAP] Request device [f0:1f.0] fault index 0x0`
Content-Language: en-US
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, Mike Jones <mike@mjones.io>,
 linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
References: <9a24c335-8ec5-48c9-9bdd-b0dac5ecbca8@molgen.mpg.de>
 <Zaq4Gv2SWhd12Lx0@cae.in-ulm.de>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <Zaq4Gv2SWhd12Lx0@cae.in-ulm.de>

This is a multi-part message in MIME format.
--------------EBz23e30HntQKxViUq8E5TGn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Cc: +linux-i2c, +linux-acpi, +Hans, cf original message [1]]

Dear Christian,


Thank you for your reply.

Am 19.01.24 um 18:57 schrieb Christian A. Ehrhardt:

> On Fri, Jan 19, 2024 at 01:59:29PM +0100, Paul Menzel wrote:
>> On a Dell XPS 13 9360 Linux 6.6.8, 6.6.11 and 6.7 (and earlier versions) log
>> the lines below when resuming from ACPI S3 (deep):
>>
>>      [    0.000000] Linux version 6.7-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-13 (Debian 13.2.0-9) 13.2.0, GNU ld (GNU Binutils for Debian) 2.41.50.20231227) #1 SMP PREEMPT_DYNAMIC Debian 6.7-1~exp1 (2024-01-08)
>>      [    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.7-amd64 root=UUID=32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=noaer mem_sleep_default=deep log_buf_len=8M
>>      […]
>>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>      […]
>>      [   99.711230] PM: suspend entry (deep)
>>      […]
>>      [   99.722101] printk: Suspending console(s) (use no_console_suspend to debug)
>>      [  100.285178] ACPI: EC: interrupt blocked
>>      [  100.319908] ACPI: PM: Preparing to enter system sleep state S3
>>      [  100.331793] ACPI: EC: event blocked
>>      [  100.331798] ACPI: EC: EC stopped
>>      [  100.331800] ACPI: PM: Saving platform NVS memory
>>      [  100.335224] Disabling non-boot CPUs ...
>>      [  100.337412] smpboot: CPU 1 is now offline
>>      [  100.341065] smpboot: CPU 2 is now offline
>>      [  100.346441] smpboot: CPU 3 is now offline
>>      [  100.353086] ACPI: PM: Low-level resume complete
>>      [  100.353129] ACPI: EC: EC started
>>      [  100.353129] ACPI: PM: Restoring platform NVS memory
>>      [  100.355219] Enabling non-boot CPUs ...
>>      [  100.355244] smpboot: Booting Node 0 Processor 1 APIC 0x2
>>      [  100.355954] CPU1 is up
>>      [  100.355972] smpboot: Booting Node 0 Processor 2 APIC 0x1
>>      [  100.356698] CPU2 is up
>>      [  100.356716] smpboot: Booting Node 0 Processor 3 APIC 0x3
>>      [  100.357371] CPU3 is up
>>      [  100.360217] ACPI: PM: Waking up from system sleep state S3
>>      [  100.668380] ACPI: EC: interrupt unblocked
>>      [  100.668598] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaround enabled
>>      [  100.668606] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled
>>      [  100.668643] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaround enabled
>>      [  100.690996] DMAR: DRHD: handling fault status reg 2
>>      [  100.691001] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x0 [fault reason 0x25] Blocked a compatibility format interrupt request
>>
>> But I am unable to find the device f0:1f.0:
> 
> This is probably an ACPI enumerated device. These are platform
> devices that pose as a PCI device for the purpose of interrupt
> remapping but do not enumerate via PCI. The PCI ID assigned to
> these hidden devices is enumerated via ANDD entries in the
> DMAR table. You can decode this table with from
> /sys/firmware/acpi/tables/DMAR with iasl to verify.

I disassembled it with `iasl -d` (attached), and there are indeed two 
devices:

     [058h 0088 001h]           Device Scope Type : 03 [IOAPIC Device]
     [059h 0089 001h]                Entry Length : 08
     [05Ah 0090 002h]                    Reserved : 0000
     [05Ch 0092 001h]              Enumeration ID : 02
     [05Dh 0093 001h]              PCI Bus Number : F0

     [05Eh 0094 002h]                    PCI Path : 1F,00


     [060h 0096 001h]           Device Scope Type : 04 [Message-capable 
HPET Device]
     [061h 0097 001h]                Entry Length : 08
     [062h 0098 002h]                    Reserved : 0000
     [064h 0100 001h]              Enumeration ID : 00
     [065h 0101 001h]              PCI Bus Number : 00

     [066h 0102 002h]                    PCI Path : 1F,00

     $ grep Name DMAR.dsl
      * Format: [HexOffset DecimalOffset ByteLength]  FieldName : 
FieldValue (in hex)
     [068h 0104 001h]           Device Scope Type : 05 [Namespace Device]
     [070h 0112 001h]           Device Scope Type : 05 [Namespace Device]
     [0B8h 0184 002h]               Subtable Type : 0004 [ACPI Namespace 
Device Declaration]
     [0C0h 0192 00Fh]                 Device Name : "\_SB.PCI0.I2C0"
     [0D4h 0212 002h]               Subtable Type : 0004 [ACPI Namespace 
Device Declaration]
     [0DCh 0220 00Fh]                 Device Name : "\_SB.PCI0.I2C1"

> Your dmesg shows two ANDD records for your I2C controllers,
> so somehow the I2C controller is sending interrupts that DMAR
> doesn't like (probably because the I2C controller is not yet
> resumed properly).
> 
> Thus my guess is that this is an issue with the suspend/resume hooks
> of the I2C controllers not with the IOMMU.

I am adding the Linux I2C and ACPI folks. Maybe they have an idea.


Kind regards,

Paul


[1]: 
https://lore.kernel.org/all/5517f76a-94ad-452c-bae6-34ecc0ec4831@molgen.mpg.de/
--------------EBz23e30HntQKxViUq8E5TGn
Content-Type: text/x-dsl; charset=UTF-8; name="DMAR.dsl"
Content-Disposition: attachment; filename="DMAR.dsl"
Content-Transfer-Encoding: base64

LyoKICogSW50ZWwgQUNQSSBDb21wb25lbnQgQXJjaGl0ZWN0dXJlCiAqIEFNTC9BU0wrIERp
c2Fzc2VtYmxlciB2ZXJzaW9uIDIwMjMwNjI4ICg2NC1iaXQgdmVyc2lvbikKICogQ29weXJp
Z2h0IChjKSAyMDAwIC0gMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbgogKiAKICogRGlzYXNzZW1i
bHkgb2YgRE1BUiwgU2F0IEphbiAyMCAwOTozNDoyMCAyMDI0CiAqCiAqIEFDUEkgRGF0YSBU
YWJsZSBbRE1BUl0KICoKICogRm9ybWF0OiBbSGV4T2Zmc2V0IERlY2ltYWxPZmZzZXQgQnl0
ZUxlbmd0aF0gIEZpZWxkTmFtZSA6IEZpZWxkVmFsdWUgKGluIGhleCkKICovCgpbMDAwaCAw
MDAwIDAwNGhdICAgICAgICAgICAgICAgICAgIFNpZ25hdHVyZSA6ICJETUFSIiAgICBbRE1B
IFJlbWFwcGluZyBUYWJsZV0KWzAwNGggMDAwNCAwMDRoXSAgICAgICAgICAgICAgICBUYWJs
ZSBMZW5ndGggOiAwMDAwMDBGMApbMDA4aCAwMDA4IDAwMWhdICAgICAgICAgICAgICAgICAg
ICBSZXZpc2lvbiA6IDAxClswMDloIDAwMDkgMDAxaF0gICAgICAgICAgICAgICAgICAgIENo
ZWNrc3VtIDogMDgKWzAwQWggMDAxMCAwMDZoXSAgICAgICAgICAgICAgICAgICAgICBPZW0g
SUQgOiAiSU5URUwgIgpbMDEwaCAwMDE2IDAwOGhdICAgICAgICAgICAgICAgIE9lbSBUYWJs
ZSBJRCA6ICJLQkwgIgpbMDE4aCAwMDI0IDAwNGhdICAgICAgICAgICAgICAgIE9lbSBSZXZp
c2lvbiA6IDAwMDAwMDAxClswMUNoIDAwMjggMDA0aF0gICAgICAgICAgICAgQXNsIENvbXBp
bGVyIElEIDogIklOVEwiClswMjBoIDAwMzIgMDA0aF0gICAgICAgQXNsIENvbXBpbGVyIFJl
dmlzaW9uIDogMDAwMDAwMDEKClswMjRoIDAwMzYgMDAxaF0gICAgICAgICAgSG9zdCBBZGRy
ZXNzIFdpZHRoIDogMjYKWzAyNWggMDAzNyAwMDFoXSAgICAgICAgICAgICAgICAgICAgICAg
RmxhZ3MgOiAwMQpbMDI2aCAwMDM4IDAwQWhdICAgICAgICAgICAgICAgICAgICBSZXNlcnZl
ZCA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwCgpbMDMwaCAwMDQ4IDAwMmhdICAg
ICAgICAgICAgICAgU3VidGFibGUgVHlwZSA6IDAwMDAgW0hhcmR3YXJlIFVuaXQgRGVmaW5p
dGlvbl0KWzAzMmggMDA1MCAwMDJoXSAgICAgICAgICAgICAgICAgICAgICBMZW5ndGggOiAw
MDE4CgpbMDM0aCAwMDUyIDAwMWhdICAgICAgICAgICAgICAgICAgICAgICBGbGFncyA6IDAw
ClswMzVoIDAwNTMgMDAxaF0gICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAKWzAz
NmggMDA1NCAwMDJoXSAgICAgICAgICBQQ0kgU2VnbWVudCBOdW1iZXIgOiAwMDAwClswMzho
IDAwNTYgMDA4aF0gICAgICAgUmVnaXN0ZXIgQmFzZSBBZGRyZXNzIDogMDAwMDAwMDBGRUQ5
MDAwMAoKWzA0MGggMDA2NCAwMDFoXSAgICAgICAgICAgRGV2aWNlIFNjb3BlIFR5cGUgOiAw
MSBbUENJIEVuZHBvaW50IERldmljZV0KWzA0MWggMDA2NSAwMDFoXSAgICAgICAgICAgICAg
ICBFbnRyeSBMZW5ndGggOiAwOApbMDQyaCAwMDY2IDAwMmhdICAgICAgICAgICAgICAgICAg
ICBSZXNlcnZlZCA6IDAwMDAKWzA0NGggMDA2OCAwMDFoXSAgICAgICAgICAgICAgRW51bWVy
YXRpb24gSUQgOiAwMApbMDQ1aCAwMDY5IDAwMWhdICAgICAgICAgICAgICBQQ0kgQnVzIE51
bWJlciA6IDAwCgpbMDQ2aCAwMDcwIDAwMmhdICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0
aCA6IDAyLDAwCgoKWzA0OGggMDA3MiAwMDJoXSAgICAgICAgICAgICAgIFN1YnRhYmxlIFR5
cGUgOiAwMDAwIFtIYXJkd2FyZSBVbml0IERlZmluaXRpb25dClswNEFoIDAwNzQgMDAyaF0g
ICAgICAgICAgICAgICAgICAgICAgTGVuZ3RoIDogMDAzMAoKWzA0Q2ggMDA3NiAwMDFoXSAg
ICAgICAgICAgICAgICAgICAgICAgRmxhZ3MgOiAwMQpbMDREaCAwMDc3IDAwMWhdICAgICAg
ICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAwClswNEVoIDAwNzggMDAyaF0gICAgICAgICAg
UENJIFNlZ21lbnQgTnVtYmVyIDogMDAwMApbMDUwaCAwMDgwIDAwOGhdICAgICAgIFJlZ2lz
dGVyIEJhc2UgQWRkcmVzcyA6IDAwMDAwMDAwRkVEOTEwMDAKClswNThoIDAwODggMDAxaF0g
ICAgICAgICAgIERldmljZSBTY29wZSBUeXBlIDogMDMgW0lPQVBJQyBEZXZpY2VdClswNTlo
IDAwODkgMDAxaF0gICAgICAgICAgICAgICAgRW50cnkgTGVuZ3RoIDogMDgKWzA1QWggMDA5
MCAwMDJoXSAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQgOiAwMDAwClswNUNoIDAwOTIg
MDAxaF0gICAgICAgICAgICAgIEVudW1lcmF0aW9uIElEIDogMDIKWzA1RGggMDA5MyAwMDFo
XSAgICAgICAgICAgICAgUENJIEJ1cyBOdW1iZXIgOiBGMAoKWzA1RWggMDA5NCAwMDJoXSAg
ICAgICAgICAgICAgICAgICAgUENJIFBhdGggOiAxRiwwMAoKClswNjBoIDAwOTYgMDAxaF0g
ICAgICAgICAgIERldmljZSBTY29wZSBUeXBlIDogMDQgW01lc3NhZ2UtY2FwYWJsZSBIUEVU
IERldmljZV0KWzA2MWggMDA5NyAwMDFoXSAgICAgICAgICAgICAgICBFbnRyeSBMZW5ndGgg
OiAwOApbMDYyaCAwMDk4IDAwMmhdICAgICAgICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAw
MDAKWzA2NGggMDEwMCAwMDFoXSAgICAgICAgICAgICAgRW51bWVyYXRpb24gSUQgOiAwMApb
MDY1aCAwMTAxIDAwMWhdICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDAwCgpbMDY2
aCAwMTAyIDAwMmhdICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDFGLDAwCgoKWzA2
OGggMDEwNCAwMDFoXSAgICAgICAgICAgRGV2aWNlIFNjb3BlIFR5cGUgOiAwNSBbTmFtZXNw
YWNlIERldmljZV0KWzA2OWggMDEwNSAwMDFoXSAgICAgICAgICAgICAgICBFbnRyeSBMZW5n
dGggOiAwOApbMDZBaCAwMTA2IDAwMmhdICAgICAgICAgICAgICAgICAgICBSZXNlcnZlZCA6
IDAwMDAKWzA2Q2ggMDEwOCAwMDFoXSAgICAgICAgICAgICAgRW51bWVyYXRpb24gSUQgOiAw
MQpbMDZEaCAwMTA5IDAwMWhdICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDAwCgpb
MDZFaCAwMTEwIDAwMmhdICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDE1LDAwCgoK
WzA3MGggMDExMiAwMDFoXSAgICAgICAgICAgRGV2aWNlIFNjb3BlIFR5cGUgOiAwNSBbTmFt
ZXNwYWNlIERldmljZV0KWzA3MWggMDExMyAwMDFoXSAgICAgICAgICAgICAgICBFbnRyeSBM
ZW5ndGggOiAwOApbMDcyaCAwMTE0IDAwMmhdICAgICAgICAgICAgICAgICAgICBSZXNlcnZl
ZCA6IDAwMDAKWzA3NGggMDExNiAwMDFoXSAgICAgICAgICAgICAgRW51bWVyYXRpb24gSUQg
OiAwMgpbMDc1aCAwMTE3IDAwMWhdICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDAw
CgpbMDc2aCAwMTE4IDAwMmhdICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDE1LDAx
CgoKWzA3OGggMDEyMCAwMDJoXSAgICAgICAgICAgICAgIFN1YnRhYmxlIFR5cGUgOiAwMDAx
IFtSZXNlcnZlZCBNZW1vcnkgUmVnaW9uXQpbMDdBaCAwMTIyIDAwMmhdICAgICAgICAgICAg
ICAgICAgICAgIExlbmd0aCA6IDAwMjAKClswN0NoIDAxMjQgMDAyaF0gICAgICAgICAgICAg
ICAgICAgIFJlc2VydmVkIDogMDAwMApbMDdFaCAwMTI2IDAwMmhdICAgICAgICAgIFBDSSBT
ZWdtZW50IE51bWJlciA6IDAwMDAKWzA4MGggMDEyOCAwMDhoXSAgICAgICAgICAgICAgICBC
YXNlIEFkZHJlc3MgOiAwMDAwMDAwMDY0RUMyMDAwClswODhoIDAxMzYgMDA4aF0gICAgICAg
ICBFbmQgQWRkcmVzcyAobGltaXQpIDogMDAwMDAwMDA2NEVFMUZGRgoKWzA5MGggMDE0NCAw
MDFoXSAgICAgICAgICAgRGV2aWNlIFNjb3BlIFR5cGUgOiAwMSBbUENJIEVuZHBvaW50IERl
dmljZV0KWzA5MWggMDE0NSAwMDFoXSAgICAgICAgICAgICAgICBFbnRyeSBMZW5ndGggOiAw
OApbMDkyaCAwMTQ2IDAwMmhdICAgICAgICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAwMDAK
WzA5NGggMDE0OCAwMDFoXSAgICAgICAgICAgICAgRW51bWVyYXRpb24gSUQgOiAwMApbMDk1
aCAwMTQ5IDAwMWhdICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDAwCgpbMDk2aCAw
MTUwIDAwMmhdICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDE0LDAwCgoKWzA5OGgg
MDE1MiAwMDJoXSAgICAgICAgICAgICAgIFN1YnRhYmxlIFR5cGUgOiAwMDAxIFtSZXNlcnZl
ZCBNZW1vcnkgUmVnaW9uXQpbMDlBaCAwMTU0IDAwMmhdICAgICAgICAgICAgICAgICAgICAg
IExlbmd0aCA6IDAwMjAKClswOUNoIDAxNTYgMDAyaF0gICAgICAgICAgICAgICAgICAgIFJl
c2VydmVkIDogMDAwMApbMDlFaCAwMTU4IDAwMmhdICAgICAgICAgIFBDSSBTZWdtZW50IE51
bWJlciA6IDAwMDAKWzBBMGggMDE2MCAwMDhoXSAgICAgICAgICAgICAgICBCYXNlIEFkZHJl
c3MgOiAwMDAwMDAwMDdBMDAwMDAwClswQThoIDAxNjggMDA4aF0gICAgICAgICBFbmQgQWRk
cmVzcyAobGltaXQpIDogMDAwMDAwMDA3QzdGRkZGRgoKWzBCMGggMDE3NiAwMDFoXSAgICAg
ICAgICAgRGV2aWNlIFNjb3BlIFR5cGUgOiAwMSBbUENJIEVuZHBvaW50IERldmljZV0KWzBC
MWggMDE3NyAwMDFoXSAgICAgICAgICAgICAgICBFbnRyeSBMZW5ndGggOiAwOApbMEIyaCAw
MTc4IDAwMmhdICAgICAgICAgICAgICAgICAgICBSZXNlcnZlZCA6IDAwMDAKWzBCNGggMDE4
MCAwMDFoXSAgICAgICAgICAgICAgRW51bWVyYXRpb24gSUQgOiAwMApbMEI1aCAwMTgxIDAw
MWhdICAgICAgICAgICAgICBQQ0kgQnVzIE51bWJlciA6IDAwCgpbMEI2aCAwMTgyIDAwMmhd
ICAgICAgICAgICAgICAgICAgICBQQ0kgUGF0aCA6IDAyLDAwCgoKWzBCOGggMDE4NCAwMDJo
XSAgICAgICAgICAgICAgIFN1YnRhYmxlIFR5cGUgOiAwMDA0IFtBQ1BJIE5hbWVzcGFjZSBE
ZXZpY2UgRGVjbGFyYXRpb25dClswQkFoIDAxODYgMDAyaF0gICAgICAgICAgICAgICAgICAg
ICAgTGVuZ3RoIDogMDAxQwoKWzBCQ2ggMDE4OCAwMDNoXSAgICAgICAgICAgICAgICAgICAg
UmVzZXJ2ZWQgOiAwMDAwMDAKWzBCRmggMDE5MSAwMDFoXSAgICAgICAgICAgICAgIERldmlj
ZSBOdW1iZXIgOiAwMQpbMEMwaCAwMTkyIDAwRmhdICAgICAgICAgICAgICAgICBEZXZpY2Ug
TmFtZSA6ICJcX1NCLlBDSTAuSTJDMCIKClswRDRoIDAyMTIgMDAyaF0gICAgICAgICAgICAg
ICBTdWJ0YWJsZSBUeXBlIDogMDAwNCBbQUNQSSBOYW1lc3BhY2UgRGV2aWNlIERlY2xhcmF0
aW9uXQpbMEQ2aCAwMjE0IDAwMmhdICAgICAgICAgICAgICAgICAgICAgIExlbmd0aCA6IDAw
MUMKClswRDhoIDAyMTYgMDAzaF0gICAgICAgICAgICAgICAgICAgIFJlc2VydmVkIDogMDAw
MDAwClswREJoIDAyMTkgMDAxaF0gICAgICAgICAgICAgICBEZXZpY2UgTnVtYmVyIDogMDIK
WzBEQ2ggMDIyMCAwMEZoXSAgICAgICAgICAgICAgICAgRGV2aWNlIE5hbWUgOiAiXF9TQi5Q
Q0kwLkkyQzEiCgpSYXcgVGFibGUgRGF0YTogTGVuZ3RoIDI0MCAoMHhGMCkKCiAgICAwMDAw
OiA0NCA0RCA0MSA1MiBGMCAwMCAwMCAwMCAwMSAwOCA0OSA0RSA1NCA0NSA0QyAyMCAgLy8g
RE1BUi4uLi4uLklOVEVMIAogICAgMDAxMDogNEIgNDIgNEMgMjAgMDAgMDAgMDAgMDAgMDEg
MDAgMDAgMDAgNDkgNEUgNTQgNEMgIC8vIEtCTCAuLi4uLi4uLklOVEwKICAgIDAwMjA6IDAx
IDAwIDAwIDAwIDI2IDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAvLyAuLi4u
Ji4uLi4uLi4uLi4uCiAgICAwMDMwOiAwMCAwMCAxOCAwMCAwMCAwMCAwMCAwMCAwMCAwMCBE
OSBGRSAwMCAwMCAwMCAwMCAgLy8gLi4uLi4uLi4uLi4uLi4uLgogICAgMDA0MDogMDEgMDgg
MDAgMDAgMDAgMDAgMDIgMDAgMDAgMDAgMzAgMDAgMDEgMDAgMDAgMDAgIC8vIC4uLi4uLi4u
Li4wLi4uLi4KICAgIDAwNTA6IDAwIDEwIEQ5IEZFIDAwIDAwIDAwIDAwIDAzIDA4IDAwIDAw
IDAyIEYwIDFGIDAwICAvLyAuLi4uLi4uLi4uLi4uLi4uCiAgICAwMDYwOiAwNCAwOCAwMCAw
MCAwMCAwMCAxRiAwMCAwNSAwOCAwMCAwMCAwMSAwMCAxNSAwMCAgLy8gLi4uLi4uLi4uLi4u
Li4uLgogICAgMDA3MDogMDUgMDggMDAgMDAgMDIgMDAgMTUgMDEgMDEgMDAgMjAgMDAgMDAg
MDAgMDAgMDAgIC8vIC4uLi4uLi4uLi4gLi4uLi4KICAgIDAwODA6IDAwIDIwIEVDIDY0IDAw
IDAwIDAwIDAwIEZGIDFGIEVFIDY0IDAwIDAwIDAwIDAwICAvLyAuIC5kLi4uLi4uLmQuLi4u
CiAgICAwMDkwOiAwMSAwOCAwMCAwMCAwMCAwMCAxNCAwMCAwMSAwMCAyMCAwMCAwMCAwMCAw
MCAwMCAgLy8gLi4uLi4uLi4uLiAuLi4uLgogICAgMDBBMDogMDAgMDAgMDAgN0EgMDAgMDAg
MDAgMDAgRkYgRkYgN0YgN0MgMDAgMDAgMDAgMDAgIC8vIC4uLnouLi4uLi4ufC4uLi4KICAg
IDAwQjA6IDAxIDA4IDAwIDAwIDAwIDAwIDAyIDAwIDA0IDAwIDFDIDAwIDAwIDAwIDAwIDAx
ICAvLyAuLi4uLi4uLi4uLi4uLi4uCiAgICAwMEMwOiA1QyA1RiA1MyA0MiAyRSA1MCA0MyA0
OSAzMCAyRSA0OSAzMiA0MyAzMCAwMCAwMCAgLy8gXF9TQi5QQ0kwLkkyQzAuLgogICAgMDBE
MDogMDAgMDAgMDAgMDAgMDQgMDAgMUMgMDAgMDAgMDAgMDAgMDIgNUMgNUYgNTMgNDIgIC8v
IC4uLi4uLi4uLi4uLlxfU0IKICAgIDAwRTA6IDJFIDUwIDQzIDQ5IDMwIDJFIDQ5IDMyIDQz
IDMxIDAwIDAwIDAwIDAwIDAwIDAwICAvLyAuUENJMC5JMkMxLi4uLi4uCg==

--------------EBz23e30HntQKxViUq8E5TGn--

