Return-Path: <linux-i2c+bounces-1414-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B978C836462
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 14:22:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55D16B213A7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jan 2024 13:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4209D3CF60;
	Mon, 22 Jan 2024 13:22:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F320E3CF42;
	Mon, 22 Jan 2024 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705929761; cv=none; b=iX0VHcjK4H3zOfeMY0o/EK3QhCziuwcRtpOSMpk7ngRVixh0TI48oXarBiPDz3PoiB19op66wdeZEosgat3ELumzA4oeXB5+SLHSIuYQdD6coHa6uVSNlBBrb2vsvGa+hQfMBWSYGLdZhmN/AAOdi6wRbvtZzD41QuC5TCNRm28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705929761; c=relaxed/simple;
	bh=Cv2iDUllH5UEwZxinhciHpTAeZmf8C42oN8W+6kV4lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mE8Cbkq5E9r6uJXxJhL1nVgTAKdNKZ21+QnjXwUWj2FlUK1XtF0tOL+56KSrptTzQDZ0tD/aEsmaDopZxbinNVb5deevfkU0bPJ/b+orQrnve2moZstoKreRlHyftprecq7rzp9BPOMvcsGRn1OQaHXwYkw4d3kQZik+hWq/BAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id CE49214033C; Mon, 22 Jan 2024 14:22:35 +0100 (CET)
Date: Mon, 22 Jan 2024 14:22:35 +0100
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mike Jones <mike@mjones.io>,
	linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: Dell XPS 13 9360: DMAR errors `DRHD: handling fault status reg
 2` and `[INTR-REMAP] Request device [f0:1f.0] fault index 0x0`
Message-ID: <Za5sGzNPQeouiD2b@cae.in-ulm.de>
References: <9a24c335-8ec5-48c9-9bdd-b0dac5ecbca8@molgen.mpg.de>
 <Zaq4Gv2SWhd12Lx0@cae.in-ulm.de>
 <f1658459-1b77-41b1-9e58-99c16a83e1d1@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1658459-1b77-41b1-9e58-99c16a83e1d1@molgen.mpg.de>


Hi Paul,

On Mon, Jan 22, 2024 at 01:16:25PM +0100, Paul Menzel wrote:
> [Cc: +linux-i2c, +linux-acpi, +Hans, cf original message [1]]
> 
> Dear Christian,
> 
> 
> Thank you for your reply.
> 
> Am 19.01.24 um 18:57 schrieb Christian A. Ehrhardt:
> 
> > On Fri, Jan 19, 2024 at 01:59:29PM +0100, Paul Menzel wrote:
> > > On a Dell XPS 13 9360 Linux 6.6.8, 6.6.11 and 6.7 (and earlier versions) log
> > > the lines below when resuming from ACPI S3 (deep):
> > > 
> > >      [    0.000000] Linux version 6.7-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-13 (Debian 13.2.0-9) 13.2.0, GNU ld (GNU Binutils for Debian) 2.41.50.20231227) #1 SMP PREEMPT_DYNAMIC Debian 6.7-1~exp1 (2024-01-08)
> > >      [    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.7-amd64 root=UUID=32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=noaer mem_sleep_default=deep log_buf_len=8M
> > >      […]
> > >      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
> > >      […]
> > >      [   99.711230] PM: suspend entry (deep)
> > >      […]
> > >      [   99.722101] printk: Suspending console(s) (use no_console_suspend to debug)
> > >      [  100.285178] ACPI: EC: interrupt blocked
> > >      [  100.319908] ACPI: PM: Preparing to enter system sleep state S3
> > >      [  100.331793] ACPI: EC: event blocked
> > >      [  100.331798] ACPI: EC: EC stopped
> > >      [  100.331800] ACPI: PM: Saving platform NVS memory
> > >      [  100.335224] Disabling non-boot CPUs ...
> > >      [  100.337412] smpboot: CPU 1 is now offline
> > >      [  100.341065] smpboot: CPU 2 is now offline
> > >      [  100.346441] smpboot: CPU 3 is now offline
> > >      [  100.353086] ACPI: PM: Low-level resume complete
> > >      [  100.353129] ACPI: EC: EC started
> > >      [  100.353129] ACPI: PM: Restoring platform NVS memory
> > >      [  100.355219] Enabling non-boot CPUs ...
> > >      [  100.355244] smpboot: Booting Node 0 Processor 1 APIC 0x2
> > >      [  100.355954] CPU1 is up
> > >      [  100.355972] smpboot: Booting Node 0 Processor 2 APIC 0x1
> > >      [  100.356698] CPU2 is up
> > >      [  100.356716] smpboot: Booting Node 0 Processor 3 APIC 0x3
> > >      [  100.357371] CPU3 is up
> > >      [  100.360217] ACPI: PM: Waking up from system sleep state S3
> > >      [  100.668380] ACPI: EC: interrupt unblocked
> > >      [  100.668598] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaround enabled
> > >      [  100.668606] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaround enabled
> > >      [  100.668643] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaround enabled
> > >      [  100.690996] DMAR: DRHD: handling fault status reg 2
> > >      [  100.691001] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x0 [fault reason 0x25] Blocked a compatibility format interrupt request
> > > 
> > > But I am unable to find the device f0:1f.0:
> > 
> > This is probably an ACPI enumerated device. These are platform
> > devices that pose as a PCI device for the purpose of interrupt
> > remapping but do not enumerate via PCI. The PCI ID assigned to
> > these hidden devices is enumerated via ANDD entries in the
> > DMAR table. You can decode this table with from
> > /sys/firmware/acpi/tables/DMAR with iasl to verify.
> 
> I disassembled it with `iasl -d` (attached), and there are indeed two
> devices:
> 
>     [058h 0088 001h]           Device Scope Type : 03 [IOAPIC Device]
>     [059h 0089 001h]                Entry Length : 08
>     [05Ah 0090 002h]                    Reserved : 0000
>     [05Ch 0092 001h]              Enumeration ID : 02
>     [05Dh 0093 001h]              PCI Bus Number : F0
                                                     ^^
> 
>     [05Eh 0094 002h]                    PCI Path : 1F,00
                                                     ^^^^^

So your device that generates the errror message is the IO-APIC
and not your I2C controllers (these pose as 00:15.0 and 00:15.1).
Sorry for the wrong direction.

AFAIR the IO-APIC must be programmed to send remappable interrupts
if it is used with an IOMMU and interrupt remapping. So at this point
I'd start to look at the resume code of the IO-APIC next.

Just a wild guess, but if this is the same machine that has the
i8042 problems after resume, the problematic interrupt might be
that of the PS/2 controller.

     regards   Christian


