Return-Path: <linux-i2c+bounces-7385-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619299E57B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 13:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23BD528420B
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 11:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDF61D9A5F;
	Tue, 15 Oct 2024 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afe5MrKh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325321D95A4;
	Tue, 15 Oct 2024 11:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728991445; cv=none; b=W2c0e1Dw8wEtZcxFuAGG456XPnNehE6ic2FuFAQzxIvymrxO9F7AMKhh/tTgVNOCpRmEkiUMDfRBlx11cb1QANki7IbMwXQbx8o8tAyR+v2/Rdmdo3GojSPJz806mHKCDkHr26P0CBdJ4tOpdk+s0T96jMlGwr1irW56NgWrrn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728991445; c=relaxed/simple;
	bh=Rdzp13zaH99entWKg0lm1Wx8wDdv6n9NqLsTT0PIeco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMRZx5DGgrilpjK+MSaMsMAWyu3TsSy+NTdRIbUBHF8dt2LH8Bfq7KWUxia7q6vMa8UTGOyzCbE7ZMUyuQdzBdKKEpfnsoMXiJxSYacqcydiyC7NfIVBA2I89XMCA7ygHKfDrC727Eyg2ZEmhwZzaIiI4KpRwEP9PxtIIhdAUEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afe5MrKh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728991445; x=1760527445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Rdzp13zaH99entWKg0lm1Wx8wDdv6n9NqLsTT0PIeco=;
  b=afe5MrKhsF3tcd4ecrIBfNbikkr/VgOgdaIc7bAa4UAaxcAABxIhhZvT
   FPUretu47bESzoJJyVfQxhOW9vHGU7pcObXPvALcqTfdLqpLBfkrs5GvO
   OZe4OK7CqSh0s7zRl4rRPKkxP9sYIVF/5+XJ7rJMhYUcn9avCghWsQGkj
   xT8FIdKGzeloyyan3ovR4kkXeqCJtv976ex/UWf+aamGB1tGPd7yFwfoe
   asg0Kdv111P3qudwltFRZCCQ5EWAxQ3oIG0Foy+n3Iz4P/Jf/ciAtVbLY
   2CxWMtvHlUoJvm2w7BBljqfPZfYSeKNz+tFTBvZmRe8vNtWVAKi/4pIfS
   Q==;
X-CSE-ConnectionGUID: 7sxydskBSKGv635HITyJUg==
X-CSE-MsgGUID: mHUPXui2TWa6TrP1UinnaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45850674"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45850674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:24:04 -0700
X-CSE-ConnectionGUID: XjzeGirsRkyt2NS4hd72oA==
X-CSE-MsgGUID: UxyCuKF0TkCwvW1mvnN1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77948538"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:24:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0fef-00000003FQr-0uQa;
	Tue, 15 Oct 2024 14:23:57 +0300
Date: Tue, 15 Oct 2024 14:23:56 +0300
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
Message-ID: <Zw5QzP-5hnHW--F-@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
 <ZwfzhsvlPrxMi61j@smile.fi.intel.com>
 <CAGXv+5ED7j49ndT7BaESW8ZL7_mjVUJLM_FWma8Lwkg+Uh3saw@mail.gmail.com>
 <Zwz_Kl7SwfL0ZaAZ@smile.fi.intel.com>
 <CAGXv+5H0Yvt1cwPOim-quT3C+=s9NapnryJhNxs_QW=DAyAycQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5H0Yvt1cwPOim-quT3C+=s9NapnryJhNxs_QW=DAyAycQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 15, 2024 at 02:32:54PM +0800, Chen-Yu Tsai wrote:
> On Mon, Oct 14, 2024 at 7:23 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 14, 2024 at 12:56:20PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, Oct 10, 2024 at 11:32 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Oct 10, 2024 at 06:29:44PM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > > > > > +   .cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> > > > >
> > > > >       .cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> > > > >
> > > > > Or even
> > > > >
> > > > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                        \
> > > > >       DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> > >
> > > I'm not inclined on using compound literals here. "simple X cfg" will
> > > likely get shared between multiple |chromeos_i2c_probe_data| entries,
> > > and AFAIK the toolchain can't merge them. So we would end up with one
> > > compound literal per entry, even if their contents are the same.
> >
> > I'm not sure I follow, you are using compound literal _already_.
> > How does my proposal change that?
> 
> I'm using it where it makes sense, i.e. where the embedded variable
> is not going to be shared with other instances.
> 
> For the dumb probers, there's only going to be one instance per "type".
> 
> For the simple probers, the config part is still one instance per "type",
> but the parameters are board and component specific. There will be
> multiple instances. Hence the config part can be shared, while the
> parameters likely won't be.
> 
> > > > With that also looking at the above
> > > >
> > > > #define DEFINE_I2C_OF_PROBE_CFG_NONE(_type_)                            \
> > > >         DEFINE_I2C_OF_PROBE_CFG(type, NULL)
> > >
> > > For the "dumb" case it makes sense though, since it would be one instance
> > > per type. But we could go further and just wrap the whole
> > > |chromeos_i2c_probe_data| declaration.
> >
> > Maybe it's too far from now...
> 
> This is what I have:
> 
> #define DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(_type)
>                         \
>        static const struct chromeos_i2c_probe_data
> chromeos_i2c_probe_dumb_ ## _type = {       \

>                .cfg = &(const struct i2c_of_probe_cfg) {

But the below is static initializer, why do you need a compound literal here?

>                         \
>                        .type = #_type,
>                         \
>                },
>                         \
> };
> 
> DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB(touchscreen);

s/dumb/simple/g

-- 
With Best Regards,
Andy Shevchenko



