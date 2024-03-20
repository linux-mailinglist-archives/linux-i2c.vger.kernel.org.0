Return-Path: <linux-i2c+bounces-2456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0611881513
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 16:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3EFD1C20A51
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 15:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4754524D7;
	Wed, 20 Mar 2024 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JovvZ93E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CEF53E14
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710950354; cv=none; b=S9AxNFIy2HEUlZnSMzjugSqSVBiMR3o+MMZ2Fcfl/fHjngsjfuyWecyd9vYTrMcE3IFyTBEyhd30WLErE4BBWl0eRCTGaH86nIgaFPtcl340orQRex/rOrVycNxgvtHLYYnngumRUU8fZoiTdtMyFmep6lhC0PUN/92CVKCcKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710950354; c=relaxed/simple;
	bh=hJxZJqfI1RlrhsGxjDFwxIdHbpnxem3KnbulDuJGdP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/dpmaLKCulEMFQXqPWF7UYmv8MzllczpUry8Hh7Yxih1E5oNYRuLMB+Od2h4Od9JJElapVf2OdQXLjMOn5TL/HJEEkYRzHeezIiHKUvLuZlONpWgR6iSgPCQYcUB3T1giFBkKicirrIASMYaPCwBOmXByz9OBPsESL2WWZRYrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JovvZ93E; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710950353; x=1742486353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hJxZJqfI1RlrhsGxjDFwxIdHbpnxem3KnbulDuJGdP8=;
  b=JovvZ93ERYHeiEUnWXuQvhFsYW+SgaHv5EkOHL7iJdqARYlDO5kRP3v2
   MrAMcvGNvngVsZXTmx5eem51rzFZICshhtI/N7BOEC+syIEUDt7oDL8LR
   dZHjQvReO8FsvYHn3y8FooAtHCiBId8GXCgqJ5JvFlsDY7jtdoVFQOXW9
   c9sxI7wFqUywdTrzMBrL62X2jbYsLOr47TyZIJafYKu4XjHXxaP1RFNvY
   Ry1GRwifO1elhlLHqz46bheI+n2rC+LcN66OQtxR6lHEhxd+I/toZ9Yp3
   YEkGM/XqvYqD7E5a6Ws4IHU/sYDYPexwrEFVZSes5qYqPV5JlheJAwG9u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5760731"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5760731"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 08:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="914672084"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="914672084"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 08:59:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rmyLM-0000000Ebsn-1iIO;
	Wed, 20 Mar 2024 17:59:08 +0200
Date: Wed, 20 Mar 2024 17:59:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Message-ID: <ZfsHyyrel-d1exxM@smile.fi.intel.com>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
 <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
 <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:
> On 20.03.2024 15:15, Andy Shevchenko wrote:
> > On Wed, Mar 20, 2024 at 03:37:34PM +0200, Jarkko Nikula wrote:
> >> On 3/20/24 2:27 PM, Heiner Kallweit wrote:
> >>> On 19.03.2024 22:11, Heiner Kallweit wrote:
> >>>> On a N100-based mini pc I see the following. I found older reports with the same symptom,
> >>>> but root cause seems to be different.
> >>>>
> >>>> - Interrupt 27 is not shared in my case
> >>>> - I checked register values on entering the ISR. Interrupt mask and DW_IC_RAW_INTR_STAT
> >>>>    are both 0.
> >>>> - After an interrupt storm of 100,000 interrupts the interrupt gets disabled
> >>>> - The issue affects channel 0 only
> >>>>
> >>>> If not the I2C IP, then who else can touch the interrupt line?
> >>>
> >>> I noticed that after including INTEL_IDMA64 in my config the problem no longer occurs.
> >>> So there seems to be a dependency. Should it be reflected in Kconfig, e.g.
> >>> make MFD_INTEL_LPSS dependent on INTEL_IDMA64, or let it imply INTEL_IDMA64?
> >>>
> >> Hmm.. interesting. I'd say BIOS perhaps has left the IDMA active and is
> >> generating interrupts until the idma64 driver acknowledges it.
> >>
> >> There should not be generic dependency since the i2c_designware is not using
> >> the DMA and a quick test on one platform where idma64 and i2c_designware are
> >> sharing the same interrupt without CONFIG_INTEL_IDMA64 not set didn't show
> >> similar behavior.
> >>
> >> Andy: Do you have any additional ideas or debug hints to this?
> > 
> > Can you share `cat /proc/interrupts` in non-working and working cases?
> > 
> > Just to confirm: loading idma64 driver fixes the issue, correct?
> > 
> I spoke too soon. Loading idma64 didn't actually fix the problem.
> What happened:
> Runtime PM kicked in and set the device to D3. Therefore reads to the idma64
> status register returned 0xffffffff, resulting the idma64 ISR returning
> IRQ_HANDLED.

Okay, bug in idma4 driver then :-) Good catch!

> IRQ number still was rapidly growing.
> 
> After disabling RPM the problem is back.
> Who else could pull the level-triggered interrupt high?

Need to understand a bit about RTE programming.
You need to add 'apic=debug' to the kernel command line and look for IRQ 27
related bits, and also makes sense to collect this

  grep 0000001b /sys/kernel/debug/pinctrl/*/pins

it will show the GPIO pins related to RTE 27 (and we can check if direct IRQ is
enabled there).

> [    4.642978] irq 27: nobody cared (try booting with the "irqpoll" option)
> [    4.643067] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.8.0-next-20240312+ #5
> [    4.643133] Hardware name: Default string Default string/Default string, BIOS ADLN.M6.SODIMM.ZB.CY.015 08/08/2023
> [    4.643215] Call Trace:
> [    4.643241]  <IRQ>
> [    4.643266]  dump_stack_lvl+0x81/0xe0
> [    4.643319]  dump_stack+0x10/0x20
> [    4.643358]  __report_bad_irq+0x2b/0xc0
> [    4.643403]  note_interrupt+0x28f/0x2d0
> [    4.643442]  ? __this_cpu_preempt_check+0x13/0x20
> [    4.643496]  handle_irq_event+0x70/0x80
> [    4.643541]  handle_fasteoi_irq+0x90/0x210
> [    4.643586]  __common_interrupt+0x6f/0x140
> [    4.643633]  common_interrupt+0xab/0xd0
> [    4.643672]  </IRQ>
> [    4.643694]  <TASK>
> [    4.643720]  asm_common_interrupt+0x27/0x40
> [    4.643761] RIP: 0010:cpuidle_enter_state+0xff/0x4f0
> [    4.643815] Code: 8b 00 48 0f a3 05 d1 5f 9d 00 0f 82 fd 02 00 00 31 ff e8 f4 e0 69 ff 80 7d cf 00 0f 85 cc 02 00 00 e8 65 bd 77 ff fb 45 85 ff <0f> 88 f4 01 00 00 49 63 f7 4c 89 f2 48 8d 04 76 48 8d 04 86 49 8d
> [    4.643957] RSP: 0018:ffffb21dc017fe58 EFLAGS: 00000202
> [    4.644010] RAX: 000000000007987d RBX: ffffd21dbfdac690 RCX: 0000000000000000
> [    4.644069] RDX: 0000000000000000 RSI: ffffffff8f724a02 RDI: ffffffff8f710113
> [    4.644128] RBP: ffffb21dc017fe98 R08: 0000000000000001 R09: 0000000000000000
> [    4.644186] R10: 0000000000000001 R11: ffff91cfb7bad824 R12: 0000000000000001
> [    4.644244] R13: ffffffff8f9b69a0 R14: 0000000114be1938 R15: 0000000000000001
> [    4.644315]  ? cpuidle_enter_state+0xfb/0x4f0
> [    4.644367]  cpuidle_enter+0x29/0x40
> [    4.644409]  call_cpuidle+0x1d/0x40
> [    4.644450]  do_idle+0x1c2/0x220
> [    4.644489]  cpu_startup_entry+0x24/0x30
> [    4.644529]  start_secondary+0xf9/0x100
> [    4.644571]  common_startup_64+0x13e/0x148
> [    4.644626]  </TASK>
> [    4.644649] handlers:
> [    4.644674] [<000000008b061326>] idma64_irq [idma64]
> [    4.644852] [<000000008273d6d5>] i2c_dw_isr [i2c_designware_core]
> [    4.644920] Disabling IRQ #27
> 
> 
>             CPU0       CPU1       CPU2       CPU3
>    8:          0          0          0          0  IR-IO-APIC    8-edge      rtc0
>    9:          0         44          0          0  IR-IO-APIC    9-fasteoi   acpi
>   16:          0          3          0          0  IR-IO-APIC   16-fasteoi   i801_smbus, idma64.6
>   27:          0          0          0     112018  IR-IO-APIC   27-fasteoi   idma64.0, i2c_designware.0
>   29:          0          0          0          0  IR-IO-APIC   29-fasteoi   idma64.2, i2c_designware.2
>   31:          0          0          0          0  IR-IO-APIC   31-fasteoi   idma64.4, i2c_designware.4
>   32:          0          0          0          0  IR-IO-APIC   32-fasteoi   idma64.5, i2c_designware.5
>   33:          0          0          0          0  IR-IO-APIC   33-fasteoi   idma64.3, i2c_designware.3
>   37:          0          0          0          0  IR-IO-APIC   37-fasteoi   idma64.7
>   40:          0          0          0          0  IR-IO-APIC   40-fasteoi   idma64.1, i2c_designware.1
> 

-- 
With Best Regards,
Andy Shevchenko



