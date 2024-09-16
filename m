Return-Path: <linux-i2c+bounces-6809-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95E97A547
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 17:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEB471C20EB0
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 15:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93A7158DC8;
	Mon, 16 Sep 2024 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNfbNhI2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACDA158548;
	Mon, 16 Sep 2024 15:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726500245; cv=none; b=X+DBv2D4r3SVyHlEKyPEZHxa9T9gyB6ipeFrQbDTIR0AYzNADvzxAKaRAILLFWbJdoPNAxDtmegKN99XAPznJUUsM3sodmFcxzFUYbNyDEbRWyB3+L5EPnBiOkMdzRy1M5IAx42Hql7YrN5YN5fNV+W4wz6j3UwTdG/uHknGHB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726500245; c=relaxed/simple;
	bh=X867kVY3mwLewmvWQEQaqmOpFkKVgamKi/gS36af2Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfIH0Bl9PTVQCNDikw8Y8TU0/aIuqmvABkLL29hPbQsZYyNW1iDpxwKkP9TIccYct+vPOTofo9ZkeaNKqOUjewnP1uIV9PJHuWeHGoJy948M4SSNMxU3vhZGDn9vMXXSem9HZN3Ym5DSorLWEz12M3mlzr++iNL/jZy4NSQwkyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JNfbNhI2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726500245; x=1758036245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=X867kVY3mwLewmvWQEQaqmOpFkKVgamKi/gS36af2Uo=;
  b=JNfbNhI2HkpFadDLnzdKVbwSlBa7Slf2zq8rmI9fwXSBjHiK2YG51mmw
   pvViBjrVnsLcJUivx9zhWfUETbn3e9JKdbJw0xG3F4u9OgE9g0HaMqvLU
   M8+rgFj8nddKxsJ/4Ee3DRM7DFl/VvT6deg/aA7u+n67Bp0rbJV8pnW+M
   XbePNFVUFSvY39RkSog34RdW+OUdOZkAj8DEfrhdoyPQ6M+w3Jr77KbhF
   jbm+LJ0VpmCmsjblAuwmKbVBtyLbsQGIsyQu+VQac52e/+1DT1RbraH9o
   bvFE75EMkKQ3YZTlybtqfKttjdfSawsWCaB0tafzqkgOzfgxtm0B2AIq4
   A==;
X-CSE-ConnectionGUID: wQoCl39kQZS3hZeWKRMEJg==
X-CSE-MsgGUID: zDxqU2xGRHChTWYzS0rgRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="47839801"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="47839801"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 08:24:04 -0700
X-CSE-ConnectionGUID: NHqN84/5RaOVIOHMXmdfhA==
X-CSE-MsgGUID: NSzwDnfoTNWZlhN5umqf1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="69380965"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 08:23:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sqDa0-00000009VQS-1MWw;
	Mon, 16 Sep 2024 18:23:56 +0300
Date: Mon, 16 Sep 2024 18:23:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <ZuhNjHwwluF2wfoU@smile.fi.intel.com>
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-10-wenst@chromium.org>
 <CAD=FV=WtVSQ5GX6H5CtxNPTdOAJVMj_xNRvG9siZB6_ePZr7CQ@mail.gmail.com>
 <CAGXv+5HRLHV2tDZxiqFRhz1p+_bhMzMXoJMBnhy-R=8C4hBjnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HRLHV2tDZxiqFRhz1p+_bhMzMXoJMBnhy-R=8C4hBjnQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 16, 2024 at 04:58:51PM +0200, Chen-Yu Tsai wrote:
> On Sat, Sep 14, 2024 at 1:43 AM Doug Anderson <dianders@chromium.org> wrote:
> > On Wed, Sep 11, 2024 at 12:29 AM Chen-Yu Tsai <wenst@chromium.org> wrote:

...

> > >  obj-$(CONFIG_CHROMEOS_LAPTOP)          += chromeos_laptop.o
> > >  obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)  += chromeos_privacy_screen.o
> > >  obj-$(CONFIG_CHROMEOS_PSTORE)          += chromeos_pstore.o
> > > +obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)    += chromeos_of_hw_prober.o
> >
> > "o" sorts before "p" so "of" should sort before "privacy"?
> >
> > I guess it's not exactly all sorted, but this small section is. Since
> > it's arbitrary you could preserve the existing sorting. :-P
> 
> To me it seemed more like they are just sorted in the order they were
> added.

If we can make it more ordered I'm for it.

Just my 2c.

-- 
With Best Regards,
Andy Shevchenko



