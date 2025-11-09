Return-Path: <linux-i2c+bounces-14019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB23C4457A
	for <lists+linux-i2c@lfdr.de>; Sun, 09 Nov 2025 20:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD348188AB6E
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Nov 2025 19:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E3C22F177;
	Sun,  9 Nov 2025 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGXI8pdS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3EC21772A;
	Sun,  9 Nov 2025 19:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762715115; cv=none; b=UPVEkKk/CqiHVb81toCFD18Vcp1xNrJNSK8zLwnKmVHfS2fcCgyZ+xuuojQAc/InH7gyqCi67U4DzPM0Oi0CQ4Hph9Bz+Z3WanFxaLHXHl8VyVn/6L8EbODnrxQn45oyDJcWJwZrL2fbJBGvlYJiTALNvC8pA/K8qALrSNUXd5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762715115; c=relaxed/simple;
	bh=SSA93aOe7oVtmJVAX896+3dxROaS9STay5IxLmasNCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6EGkGFmZ+Oaq7zRDsmbXd+ul++drPXD7QIsA7/82T4vN/reFm/E3Luueuw/iTK7dur1VBJ+LTleNT0x30TrsGsdjZc7ZENg0qrfF0z1qHlH6ixpoTy0jngBiJ/0NdPekFBcWO1d2swuC8dRFsmNTAUsC01xVBGEw9/As3ivCNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGXI8pdS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762715113; x=1794251113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SSA93aOe7oVtmJVAX896+3dxROaS9STay5IxLmasNCM=;
  b=QGXI8pdSnxwpqLNRyNih6akjZmIN3JKDdK/IJpFBPMh4f0ilia1ksMK1
   BzYezc7tNj5XfYj0fkEVozylJsjPOTJUSygusd+c6/EaXfo4wtZRgfhHR
   j4NV98QWXfqP2uPGwzaIG3P2UYPp9uoMsJXMkZVjJnYLqJe9x4QrHVKHy
   BhLaWfxexnw4qRC0aMfzm7cO5pvGoaNAjrnWcfChFylIuFGj4hFbPV7tJ
   WACdqLngCOm9EXBb99aeox6jn/rMacR6fuc8QjYunh59Rv1nz0RDMO4WT
   hjF1E9sKHBL7a+khEKcE1APYYz6rH8xK8WVXYz/2klSbs9fQTfgqdnfKm
   w==;
X-CSE-ConnectionGUID: SYLJSP/dTf+JIuCt82vv7Q==
X-CSE-MsgGUID: UFL8l6fiTV2btzku9iYwWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="90249622"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="90249622"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 11:05:13 -0800
X-CSE-ConnectionGUID: 0MBbrmbSSmybDafSEFPX5A==
X-CSE-MsgGUID: 6KoH91/3SMyUXXsoLlu3lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="188341862"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.185])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 11:05:10 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vIAip-000000076E8-0CrM;
	Sun, 09 Nov 2025 21:05:07 +0200
Date: Sun, 9 Nov 2025 21:05:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Askar Safin <safinaskar@gmail.com>
Cc: Dell.Client.Kernel@dell.com, bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, regressions@lists.linux.dev,
	rrangel@chromium.org, safinaskar@zohomail.com, superm1@kernel.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own
 from suspend
Message-ID: <aRDl4tOD4CfVeSC2@smile.fi.intel.com>
References: <aKyDB7h7cUBOLbiJ@smile.fi.intel.com>
 <20250918183336.5633-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918183336.5633-1-safinaskar@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 18, 2025 at 09:33:36PM +0300, Askar Safin wrote:
> Andy Shevchenko:
> > In other words we need to enable debug of the pin control subsystem and see
> > what it will print in dmesg.
> 
> You mean I should enable CONFIG_DEBUG_PINCTRL? Okay, I did this.
> 
> So, today I tested everything on fresh kernel, 6.17.0-rc6, without any
> patches.
> 
> My config is: https://zerobin.net/?ebecc538f6caa22b#88c2k08G8+cZoMjgU9N/WYy28qQjyBW+/H78ygujZxY=
> It was generated from Debian config using localmodconfig.
> I added few tweaks, in particular I enabled CONFIG_DEBUG_PINCTRL.
> 
> # cat /proc/cmdline 
> BOOT_IMAGE=/@rootfs/boot/vmlinuz-6.17.0-rc6 root=UUID=015793d4-ad51-4da7-844b-fcc3bcb13a0b ro rootflags=subvol=@rootfs log_buf_len=4M ignore_loglevel
> 
> I run this script:
> https://zerobin.net/?327f3aa3ef7ce845#Ycu017J9YbRga8uGaCKRzsH7J/lB8D4RudpwTll5lbo=
> 
> This script runs "rtcwake -s 6 -m mem" multiple times. Sometimes my laptop wakes on timer (because of rtcwake),
> and sometimes it wakes up too early on its own (and this is a bug).
> 
> My script did suspend 7 times:
> 
> # dmesg | grep s2idle
> [  117.934504] PM: suspend entry (s2idle)
> [  127.141741] PM: suspend entry (s2idle)
> [  131.299554] PM: suspend entry (s2idle)
> [  140.034802] PM: suspend entry (s2idle)
> [  144.592260] PM: suspend entry (s2idle)
> [  154.038621] PM: suspend entry (s2idle)
> [  163.034299] PM: suspend entry (s2idle)
> 
> Out of them my laptop woke up on timer 4 times and on its own (i. e. due to bug) 3 times:
> 
> # dmesg | grep 'woke up'
> [  126.087936] will-wake: attempt 0: woke up in time
> [  130.248820] will-wake: attempt 1: woke up early
> [  138.988770] will-wake: attempt 2: woke up in time
> [  143.545973] will-wake: attempt 3: woke up early
> [  152.993654] will-wake: attempt 4: woke up in time
> [  161.988956] will-wake: attempt 5: woke up in time
> [  166.329080] will-wake: attempt 6: woke up early
> 
> Here is full output of "dmesg --level=debug+":
> https://zerobin.net/?f704a2d56603f4ec#SRrzc2mt2FNNqcltx/ULmtLZRdRH9frdgoODU03AXwE=
> 
> /proc/interrupts:
> https://zerobin.net/?b7ba5047ca84ab29#TjMUjkAdhpIuKbnvPpuYyNWa/ilA/ciGKwwSbx6KRFc=


  14:          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0       4202          0          0          0          0          0          0          0          0          0          0          0 IR-IO-APIC   14-fasteoi   INTC1085:00


 204:          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0       4199          0          0          0          0          0          0          0          0          0          0          0 intel-gpio  355  VEN_0488:00


Sounds like it comes via GPIO, but it's not handled as touchpad IRQ. You may
try to add a quirk to prevent touchpad IRQ from waking the system. That should
help I believe.
Something like "ignore_wake=INTC1085:00@355" in the kernel command line.
If it helps, update drivers/gpio/gpiolib-acpi-quirks.c accordingly.

-- 
With Best Regards,
Andy Shevchenko



