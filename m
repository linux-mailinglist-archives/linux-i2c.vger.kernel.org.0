Return-Path: <linux-i2c+bounces-7384-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45899E572
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 13:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C95F284BA9
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 11:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1D41D89F8;
	Tue, 15 Oct 2024 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJy790Lh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD9B1A76CE;
	Tue, 15 Oct 2024 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728991281; cv=none; b=c32v9p2mIs3+CJaVsjBY3rBu651UmaV+rJsVJLJpsvkDGdl1FcbLlxdTV//KO2c08Ulc3jw4d/8YxlgTVhgtNfxpCRbBBDO7qDbRxzcFIj8eO7NfzgJNA9WdqCIt6sdUQiinAJQTVbxTVaAtH4jbmRM0G9oT3J+lU0QJ577sQYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728991281; c=relaxed/simple;
	bh=F+LntjNMoNMukvVFd2uBIf+bs68NkbZTB14gu4OyGW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhVkR3ln6eRCmmfQEYHPNR0MmweORnEH3kenf95kaTrbf8cZL+X8PPSSgqCDccJBmPYJIjt75V3WAnMR5uNw3F/oJJVuOc2Om53VQ6pgVfU3z+J5aXLQhwctFw4w8tQGzSELbhlI9D+mo9yFF0flXybH1XcsGYT2EeM1v6ftD00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJy790Lh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728991280; x=1760527280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=F+LntjNMoNMukvVFd2uBIf+bs68NkbZTB14gu4OyGW0=;
  b=VJy790Lh2aDCHnlFsLLwF6Nza0y/M1xYdwIZjXj5ZNSUD7D58kPxoLva
   kgQG6hE6wApwbA58tWDNjhk6YOhKiH2/Vy11E4WOnwCQzVMrSGCoyXZoF
   9bOwxajxpNHX2twf9nGrA7PEn/7RCh6e6k6i57x2qZh2tQHJZtf6e//bz
   u7y21GKVent2b7QnWE/atTK5PZHd00Y7tXj24A4iVt3WsfCcr8eGtib7e
   paEfpeWuGm5HmHWlNYz0xYV2Na/RDl963aANMt5qNE6Mn7jvOYNVq+Ob9
   iDSHY3W6jd4X1WPsqQDJcDRwe+4tMACrEUiD2ObuXO3bZyzC3k1i73rPp
   A==;
X-CSE-ConnectionGUID: oMBUm3LSTgeWns89leW9Bg==
X-CSE-MsgGUID: BEDEq/pdRhSjIsXxUAfNoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39500329"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39500329"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:21:19 -0700
X-CSE-ConnectionGUID: piYH8dHzQlyF9xS4V6a0lA==
X-CSE-MsgGUID: YjuABOffSRCNBgXlDBh9NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="77734747"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:21:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0fc0-00000003FO9-1pHB;
	Tue, 15 Oct 2024 14:21:12 +0300
Date: Tue, 15 Oct 2024 14:21:12 +0300
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
Message-ID: <Zw5QKDoZkn6QZtNO@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-7-wenst@chromium.org>
 <Zwfwv-O9ln-PVMdc@smile.fi.intel.com>
 <CAGXv+5F=5f4R5AExANxOwgTL6_VbpHdNKKhHnzy_PDcxtcFoEQ@mail.gmail.com>
 <Zwz-benEP4PHbRb2@smile.fi.intel.com>
 <CAGXv+5HtDqf9MbGc53axP276fFA6riM85+Sa7nXHPvZcCb5-Pg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HtDqf9MbGc53axP276fFA6riM85+Sa7nXHPvZcCb5-Pg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 15, 2024 at 01:34:52PM +0800, Chen-Yu Tsai wrote:
> On Mon, Oct 14, 2024 at 7:20 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Oct 14, 2024 at 12:06:16PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, Oct 10, 2024 at 11:20 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Oct 08, 2024 at 03:34:25PM +0800, Chen-Yu Tsai wrote:

...

> > > > > +static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
> > > > > +{
> > > > > +     if (!ctx->gpiod)
> > > > > +             return;
> > > >
> > > > Do you need this check for the future patches?
> > >
> > > Not sure I follow. The check is needed because this function is called
> > > in i2c_of_probe_simple_cleanup(), but the GPIO could have been released
> > > earlier in i2c_of_probe_simple_cleanup_early(), and that makes this
> > > function a no-op.
> >
> > Do you have a known race condition then? This is bad. You shouldn't rely on
> > the sequence of events here, or the serialisation has to be added.
> >
> > > The helpers for the release side are quite short, but the ones on the
> > > request side wrap some conditional and error handling. I think it's
> > > better to keep it symmetric?
> >
> > Yes, but why do you need the above check, I didn't still get...
> > I.o.w. you think that there is a gap in time that (if no check) the GPIO
> > descriptor might be changed? But then how does it affect anyway the possibility
> > that it becomes not NULL even with the current code.
> 
> The opposite actually. Either it is always NULL, or it was initially valid,
> but the early cleanup function released it and thus it became NULL by the
> time this function gets called.

Then I don't see any points to have this check (details in the other reply).

> > > > > +     /* Ignore error if GPIO is not in output direction */
> > > > > +     gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
> > > > > +}

-- 
With Best Regards,
Andy Shevchenko



