Return-Path: <linux-i2c+bounces-7358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7E99C899
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 13:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19A561F23C8D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 11:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF1A1AB6FB;
	Mon, 14 Oct 2024 11:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9OUfd6J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA731AB6E6;
	Mon, 14 Oct 2024 11:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728904575; cv=none; b=IYTDyeQ9s3xWK9och9NgxBy9ocQMSQ9j3lwm6M0uRXc8UugnbA8thpRHglDUOVNMrnA0BI40uwAwrldxeW7dcMIlPLoyX/u8EwrmyRwEGWzqAihavi1dcF2AwqVzwQyld505Y4dlvfQf3bHKBck3LC0bLGEh9P2IB77NcSnuOlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728904575; c=relaxed/simple;
	bh=diqbe8v7QmoEpj4SUWtjif2WUvBD6+uTDFf6w7M0FM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhAQFG8+l1SD8w70SwFVEj6XMyoYsu6FoToxNTVD2g4dwFhXAOPxQt0xP8LmWn6oQI88/YN8egyIBBfMysMHOzA/OexgUEYCfbMrhx4UZG6xa0zlG9SPw1JaJ7NOdX4pUMUKGn++0vLQO4xdtoWd6lF+v5UyrZkroZahNRROT4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9OUfd6J; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728904574; x=1760440574;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=diqbe8v7QmoEpj4SUWtjif2WUvBD6+uTDFf6w7M0FM8=;
  b=l9OUfd6JWf3ykrdmBQjDgJeYibGj/VEhJKvZGcOYfOVAz+Uxm6pZ1myu
   mrzvEvV91Ly/Rox6g4hVhiwt3mmiHJM8pTK//b3MGyYG2fJyqOB/f9rTo
   pxzy9lt6YTH/ZSgCSTUj7wN3TfKlvAJvJIk0YLwgJSOI2hiRcLAjZKFSC
   CV5uGZ1iU95HRplradipscc0ZgjWZ88pp9f1jZcjKcwaWtkNCTYMWBnKO
   okzBAdLoPyLgK4pUwdc4okbmoOczm1UXO72KE51A0bhMzkC0EtA8+vXMG
   1KTBdO0hrTyun6QYW/3xjgeKyexyArWkeMIEoN/TbEZppZmoWN1T9TAqA
   Q==;
X-CSE-ConnectionGUID: ZjoftGdhT2qBfphbjwhsQA==
X-CSE-MsgGUID: +qeTcIC/QgWWOSu7LOD83w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45721216"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45721216"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:16:14 -0700
X-CSE-ConnectionGUID: F7kxP5ktT96AFNZ0M+Zjdg==
X-CSE-MsgGUID: 14W+s8UkRyyg6QVnDq6lyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77171383"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:16:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0J3W-00000002sPr-1VL8;
	Mon, 14 Oct 2024 14:16:06 +0300
Date: Mon, 14 Oct 2024 14:16:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 4/8] i2c: Introduce OF component probe function
Message-ID: <Zwz9djqb0Q6Ujmo_@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-5-wenst@chromium.org>
 <ZwfvuA2WhD_0P3gL@smile.fi.intel.com>
 <CAGXv+5Hm62hFsF27B-cEWTJ_AKrhcfCPaqR7BxmpwnjABzwHTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Hm62hFsF27B-cEWTJ_AKrhcfCPaqR7BxmpwnjABzwHTQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 14, 2024 at 11:53:47AM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 10, 2024 at 11:16 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 08, 2024 at 03:34:23PM +0800, Chen-Yu Tsai wrote:

...

> > Fresh reading of the commit message make me think why the firmware or
> > bootloader on such a device can't form a dynamic OF (overlay?) to fulfill
> > the need?
> 
> The firmware / bootloader on existing devices are practically not upgradable.
> On the other hand, the kernel is very easy to upgrade or swap out.
> 
> For said shipped devices, there is also nothing to key the detection
> off of besides actually powering things up and doing I2C transfers,
> which takes time that the firmware has little to spare. We (ChromeOS)
> require that the bootloader jump into the kernel within 1 second of
> power on. That includes DRAM calibration, whatever essential hardware
> initialization, and loading and uncompressing the kernel. Anything
> non-essential that can be done in the kernel is going to get deferred
> to the kernel.
> 
> Also, due to project timelines oftentimes the devices are shipped with a
> downstream kernel with downstream device trees. We don't want to tie the
> firmware too tightly to the device tree in case the downstream stuff gets
> reworked when upstreamed.

Okay, I was always under impression that DT has at least one nice feature in
comparison with ACPI that it can be replaced / updated in much quicker /
independent manner. What you are telling seems like the same issue that
ACPI-based platforms have. However, there they usually put all possible devices
into DSDT and firmware enables them via run-time (ACPI) variables. Are you
trying to implement something similar here?

...

> > Another question is that we have the autoprobing mechanism for I2C for ages,
> > why that one can't be (re-)used / extended to cover these cases?
> 
> I haven't looked into it very much, but a quick read of
> Documentation/i2c/instantiating-devices.rst suggests that it's solving
> a different problem?
> 
> In our case, we know that it is just one of a handful of possible
> devices that we already described in the device tree. We don't need
> to probe the full address range nor the full range of drivers. We
> already have a hacky workaround in place, but that mangles the
> device tree in a way that doesn't really match the hardware.
> 
> The components that we are handling don't seem to have any hardware
> ID register, nor do their drivers implement the .detect() callback.
> There's also power sequencing (regulator and GPIO lines) and interrupt
> lines from the device tree that need to be handled, something that is
> missing in the autoprobe path.
> 
> Based on the above I don't think the existing autoprobe is a good fit.
> Trying to shoehorn it in is likely going to be a mess.
> 
> Doug's original cover letter describes the problem in more detail,
> including why we think this should be done in the kernel, not the
> firmware:
> https://lore.kernel.org/all/20230921102420.RFC.1.I9dddd99ccdca175e3ceb1b9fa1827df0928c5101@changeid/

Perhaps it needs to be summarised to cover at least this question along with
the above?

-- 
With Best Regards,
Andy Shevchenko



