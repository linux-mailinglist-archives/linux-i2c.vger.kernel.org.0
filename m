Return-Path: <linux-i2c+bounces-7360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5F499C8BE
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 13:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3652A1F20D67
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 11:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A8719D09E;
	Mon, 14 Oct 2024 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czAnHXNb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374E9197A6E;
	Mon, 14 Oct 2024 11:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905013; cv=none; b=YQyOcs8TkdU7/Y8FmaF+k8HOd7wlXk126uwO46wgdvaz/WHIMAMbZgDGztcV6LQX8d6TcNkpbBEqci7IIEkUcZYd2AbZ3tSAXL92XgOLO0AnAF9Lsa/YMkLhk8FR7EFoCvIOBMZBGuUci29xWQzDO5H45h3IaCRGLxJMsf8DXHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905013; c=relaxed/simple;
	bh=F6OtytiL7+JS9gPiOc57+sw/mfDS+IMkcUewiU8ceGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQ63TWvhJrabQ5NqJuujEyDdgi9O1c1SDPFUCwglUAoxzl5HNZSGvAWTuHD2fkw9ull4gehCgOxOisjYSLSiJH1lmxs2KF7S59FDv/jvEyZk/upR9qo4Gp+lbNSj3qU1M3dZ0S+PtFVE1jT3/JKVxzBod2GrFowBvur6UB1+8bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czAnHXNb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728905012; x=1760441012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=F6OtytiL7+JS9gPiOc57+sw/mfDS+IMkcUewiU8ceGQ=;
  b=czAnHXNbCcaxfTTZLAuA148eXVumxV6POU1+Dohoa6m9Kr42h+jyLukb
   lQ7bIMgSqFSEoD1uVh3t8+XZQzP0cRTi3h9IFsKDr4c+7dg8P6+CTu/Ks
   AklH+yIIMg7MCc2SCv6GautG4V/eKAM745e1tfN01YR+MlNXK+uk2ml3b
   m2IkJKX3t648FpYF8vME6yeDmk2U8je6LqpndCVYJMsh5YAHPjn07zcwf
   Gk7b1VMrl5LWJkeucsRMaWWikaBwvpkzgdLeqZ6dAKyqviEBtHqXDMQzT
   1+tkhj/7jdKQ+9r6+Q+hFPuijF1A9tiPv8Dv+7pOuqismZeLvYUH3lXOv
   g==;
X-CSE-ConnectionGUID: HzPMbG4ZSAumuOLmm4A6gA==
X-CSE-MsgGUID: iLYmgoKgRTWFSU2BkVVLEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="15878320"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="15878320"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:23:30 -0700
X-CSE-ConnectionGUID: YcWC7ZFLTc6LAyGu3A9NIQ==
X-CSE-MsgGUID: lZxKA49mTcSf+Sb9vfj03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77414868"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:23:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0JAY-00000002sWN-1clp;
	Mon, 14 Oct 2024 14:23:22 +0300
Date: Mon, 14 Oct 2024 14:23:22 +0300
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
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
 <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
 <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 14, 2024 at 12:56:20PM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 10, 2024 at 11:32 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > > > +   .cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> > >
> > >       .cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> > >
> > > Or even
> > >
> > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                        \
> > >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> 
> I'm not inclined on using compound literals here. "simple X cfg" will
> likely get shared between multiple |chromeos_i2c_probe_data| entries,
> and AFAIK the toolchain can't merge them. So we would end up with one
> compound literal per entry, even if their contents are the same.

I'm not sure I follow, you are using compound literal _already_.
How does my proposal change that?

> > With that also looking at the above
> >
> > #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                            \
> >         DEFINE_I2C_OF_PROBE_CFG(type, NULL)
> 
> For the "dumb" case it makes sense though, since it would be one instance
> per type. But we could go further and just wrap the whole
> |chromeos_i2c_probe_data| declaration.

Maybe it's too far from now...

-- 
With Best Regards,
Andy Shevchenko



