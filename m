Return-Path: <linux-i2c+bounces-7359-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0364299C8A4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 13:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26F2F1C2264F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 11:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8441D1A0B07;
	Mon, 14 Oct 2024 11:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjcMfZR9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD41C1A0B1A;
	Mon, 14 Oct 2024 11:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728904822; cv=none; b=ueWZdUIegVEAnrCn5nu9JqZdHbmevylIiFzluMawMzkHGR6U3FFfr7h8Uc+g/FO0V1SsXT/Ggq6IPHxKFsl87WP1A1Bhw/3guT10iYhWM3MYKlNj3/Kg3eSOiK02PXkPKzFyTL/NdDQxM4Zfmxlxr3wg0mlWRJpcEI4UKG7goMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728904822; c=relaxed/simple;
	bh=wkULcwJ8+tIJqpDigom4l5ZO9Ca9fMKfWw3vvXj223k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRlPhzKIb+hm4+5GInrg0DveAVwr6nItrojXlYD6fyIdYnbL1XskbEcvEGbgpsiDDeYKZCThWAxUJK/waVe72wCHT7wnYbRJId1j3eo7F9tzr1uCoVMLKJMlSJF27xkw+gUH0O+lDdv4nQxApbpTpa+OnJe/SpQCSRD19YZ6mmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjcMfZR9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728904821; x=1760440821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=wkULcwJ8+tIJqpDigom4l5ZO9Ca9fMKfWw3vvXj223k=;
  b=SjcMfZR93xlbEabhQXPCe5zQSzf/2WppOKe66FAnNQgceTQmD7gscL0j
   fzP8hlen2o6x8s+S9Z9B+fC7+6A3TPNoqLYMxYuxcVLSwn5lGjulP1Bz0
   pQ/feuzfSheSESpCizgWUp/J0vDZ8d9jo0tE+M66mXvyJ3i3gv2upwgZr
   jF3mfdvxjgH36XioozU3ePVmH4PLfOr4zvd9MvIEM4HVqvzTIQDF/BuIR
   Q+odEcpe8iHh8ds8/wffKkRW7tqJljS6CSStxWo9YV1UbRUgcw7QO5HBq
   EMjMUFmHI7CSpLgO338e5OcaNf6ClfRmcb9LiMEBa7bQbs7Jd5fyb/3WM
   w==;
X-CSE-ConnectionGUID: 4NaWDIUNT5qVMJBPNdsmBA==
X-CSE-MsgGUID: pH7ztDkdTFCn54JGM1Mb0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="38890105"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="38890105"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:20:20 -0700
X-CSE-ConnectionGUID: d67WPmw8RuSOrMioKshBRw==
X-CSE-MsgGUID: OFXUrAcdSweP56vvf+Qt2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="82318089"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:20:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0J7V-00000002sTM-1oXM;
	Mon, 14 Oct 2024 14:20:13 +0300
Date: Mon, 14 Oct 2024 14:20:13 +0300
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
Subject: Re: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
Message-ID: <Zwz-benEP4PHbRb2@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
 <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 14, 2024 at 12:06:16PM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 10, 2024 at 11:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:
> > > Add GPIO support to the simple helpers for the I2C OF component prober.
> > > Components that the prober intends to probe likely require their
> > > regulator supplies be enabled, and GPIOs be toggled to enable them or
> > > bring them out of reset before they will respond to probe attempts.
> > > Regulator supplies were handled in the previous patch.
> > >
> > > The assumption is that the same class of components to be probed are
> > > always connected in the same fashion with the same regulator supply
> > > and GPIO. The names may vary due to binding differences, but the
> > > physical layout does not change.
> > >
> > > This supports at most one GPIO pin. The user must specify the GPIO name,
> > > the polarity, and the amount of time to wait after the GPIO is toggled.
> > > Devices with more than one GPIO pin likely require specific power
> > > sequencing beyond what generic code can easily support.

...

> > > +     /* An empty string signals an unnamed GPIO */
> > > +     if (!ctx->opts->gpio_name[0])
> > > +             con_id = NULL;
> > > +     else
> > > +             con_id = ctx->opts->gpio_name;
> >
> > Can it use positive conditional?
> >
> >         if (ctx->opts->gpio_name[0])
> >                 con_id = ctx->opts->gpio_name;
> >         else
> >                 con_id = NULL;
> 
> You suggested writing it this way in your reply to v7. Please pick one.

Oh, whatever you will finish with then, sorry for the noise.

...

> > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
> > > +{
> > > +     if (!ctx->gpiod)
> > > +             return;
> >
> > Do you need this check for the future patches?
> 
> Not sure I follow. The check is needed because this function is called
> in i2c_of_probe_simple_cleanup(), but the GPIO could have been released
> earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
> function a no-op.

Do you have a known race condition then? This is bad. You shouldn't rely on
the sequence of events here, or the serialisation has to be added.

> The helpers for the release side are quite short, but the ones on the
> request side wrap some conditional and error handling. I think it's
> better to keep it symmetric?

Yes, but why do you need the above check, I didn't still get...
I.o.w. you think that there is a gap in time that (if no check) the GPIO
descriptor might be changed? But then how does it affect anyway the possibility
that it becomes not NULL even with the current code.

> > > +     /* Ignore error if GPIO is not in output direction */
> > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
> > > +}

-- 
With Best Regards,
Andy Shevchenko



