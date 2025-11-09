Return-Path: <linux-i2c+bounces-14020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2FAC4459B
	for <lists+linux-i2c@lfdr.de>; Sun, 09 Nov 2025 20:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C4713A9E23
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Nov 2025 19:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE46230BE9;
	Sun,  9 Nov 2025 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CncBKdmz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD24219A8D;
	Sun,  9 Nov 2025 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762715296; cv=none; b=fQf212ltSp7sCymryd8rR73uhBTDrZWMM5f8C2ehLKpTd1pDrZfPg1mfO6OosS92LZipTcE2TCjH00XfK9VQ+59RQmrlWtO7hfwPyu1H9n1Kk7S/CY/jeHxLz4qbHVVH2qHOhyNx0yQIBvzOYzkxjSQ+XlfuzxCtPN0tDNj67PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762715296; c=relaxed/simple;
	bh=7cBe2s53pgaq8OwYOTsVaCJ0pzgL8FXTPGbrP6ryQAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KF5d3aZFECGqkrR4tTKPA6nTgwhbBMGp9fzIX/aR//0RTH4IqN6GOeiX8empWfziJFL3p/+PaNT/QzHn+LfUNf9WVe1Klj3pXyvnZoGJtuODmkHYXDHje82wilNaDDmtoolD3Iaccf+3y++528nlt1VVlSwU85snJrzxyjy+83g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CncBKdmz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762715295; x=1794251295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7cBe2s53pgaq8OwYOTsVaCJ0pzgL8FXTPGbrP6ryQAA=;
  b=CncBKdmzUN7QoMEX0RDCwPSd1lzxLoO5dS66A9PcRrAO5v0nbXMJ0mlY
   JPIUaucoaEJdzsfyv45icHl4vLcuFa+x20Jz4DlJCaxXQp2WQHDRH45U4
   v/0Vv+BAK+oqfkA8aPIpLVoo5D6hc1bohmkj47sFKRuwjhPMdf+6OsnhL
   DEkKQtjS5zcO2PVbZZLGZ2LD9IGd6Xq4su/XhQZa09Ux8u5Y3OCdP5j7u
   zipI2nDlEKBsU0q77xU0mfpj2o65Isey1yALPoQOQKQrpVN2k0rIg+J+a
   jNOQFKKDfzzUvPnpoi5dWoUMDjNO2l6vXFV62y0v9Yb8dgfllhoO5qZia
   w==;
X-CSE-ConnectionGUID: aa88JqZ/Ry+yNXxCOmJfrg==
X-CSE-MsgGUID: BsE/qMqtTySZQdYncKSZxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64479491"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="64479491"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 11:08:14 -0800
X-CSE-ConnectionGUID: HCBAPvSQQTaUscXcD2iPyw==
X-CSE-MsgGUID: riu3ZDGlQcuoChPZS5rPHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="187753872"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.185])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 11:08:10 -0800
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vIAlj-000000076HU-35mV;
	Sun, 09 Nov 2025 21:08:07 +0200
Date: Sun, 9 Nov 2025 21:08:07 +0200
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
Message-ID: <aRDml95nMPeknmUM@smile.fi.intel.com>
References: <aKyDB7h7cUBOLbiJ@smile.fi.intel.com>
 <20250918183336.5633-1-safinaskar@gmail.com>
 <aRDl4tOD4CfVeSC2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRDl4tOD4CfVeSC2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Nov 09, 2025 at 09:05:07PM +0200, Andy Shevchenko wrote:
> On Thu, Sep 18, 2025 at 09:33:36PM +0300, Askar Safin wrote:
> > Andy Shevchenko:
> > > In other words we need to enable debug of the pin control subsystem and see
> > > what it will print in dmesg.
> > 
> > You mean I should enable CONFIG_DEBUG_PINCTRL? Okay, I did this.
> > 
> > So, today I tested everything on fresh kernel, 6.17.0-rc6, without any
> > patches.
> > 
> > My config is: https://zerobin.net/?ebecc538f6caa22b#88c2k08G8+cZoMjgU9N/WYy28qQjyBW+/H78ygujZxY=
> > It was generated from Debian config using localmodconfig.
> > I added few tweaks, in particular I enabled CONFIG_DEBUG_PINCTRL.
> > 
> > # cat /proc/cmdline 
> > BOOT_IMAGE=/@rootfs/boot/vmlinuz-6.17.0-rc6 root=UUID=015793d4-ad51-4da7-844b-fcc3bcb13a0b ro rootflags=subvol=@rootfs log_buf_len=4M ignore_loglevel
> > 
> > I run this script:
> > https://zerobin.net/?327f3aa3ef7ce845#Ycu017J9YbRga8uGaCKRzsH7J/lB8D4RudpwTll5lbo=
> > 
> > This script runs "rtcwake -s 6 -m mem" multiple times. Sometimes my laptop wakes on timer (because of rtcwake),
> > and sometimes it wakes up too early on its own (and this is a bug).
> > 
> > My script did suspend 7 times:
> > 
> > # dmesg | grep s2idle
> > [  117.934504] PM: suspend entry (s2idle)
> > [  127.141741] PM: suspend entry (s2idle)
> > [  131.299554] PM: suspend entry (s2idle)
> > [  140.034802] PM: suspend entry (s2idle)
> > [  144.592260] PM: suspend entry (s2idle)
> > [  154.038621] PM: suspend entry (s2idle)
> > [  163.034299] PM: suspend entry (s2idle)
> > 
> > Out of them my laptop woke up on timer 4 times and on its own (i. e. due to bug) 3 times:
> > 
> > # dmesg | grep 'woke up'
> > [  126.087936] will-wake: attempt 0: woke up in time
> > [  130.248820] will-wake: attempt 1: woke up early
> > [  138.988770] will-wake: attempt 2: woke up in time
> > [  143.545973] will-wake: attempt 3: woke up early
> > [  152.993654] will-wake: attempt 4: woke up in time
> > [  161.988956] will-wake: attempt 5: woke up in time
> > [  166.329080] will-wake: attempt 6: woke up early
> > 
> > Here is full output of "dmesg --level=debug+":
> > https://zerobin.net/?f704a2d56603f4ec#SRrzc2mt2FNNqcltx/ULmtLZRdRH9frdgoODU03AXwE=
> > 
> > /proc/interrupts:
> > https://zerobin.net/?b7ba5047ca84ab29#TjMUjkAdhpIuKbnvPpuYyNWa/ilA/ciGKwwSbx6KRFc=
> 
> 
>   14:          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0       4202          0          0          0          0          0          0          0          0          0          0          0 IR-IO-APIC   14-fasteoi   INTC1085:00
> 
> 
>  204:          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0          0       4199          0          0          0          0          0          0          0          0          0          0          0 intel-gpio  355  VEN_0488:00
> 
> 
> Sounds like it comes via GPIO, but it's not handled as touchpad IRQ. You may
> try to add a quirk to prevent touchpad IRQ from waking the system. That should
> help I believe.
> Something like "ignore_wake=INTC1085:00@355" in the kernel command line.
> If it helps, update drivers/gpio/gpiolib-acpi-quirks.c accordingly.

It might be actually the touchpad controller name (as I see in the quirk table):

	ignore_wake=VEN_0488:00@355

-- 
With Best Regards,
Andy Shevchenko



