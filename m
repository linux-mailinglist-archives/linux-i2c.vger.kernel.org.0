Return-Path: <linux-i2c+bounces-7361-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5CD99C8CC
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 13:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A3911F21D82
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 11:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06941581EE;
	Mon, 14 Oct 2024 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMb0FBKm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC915350B;
	Mon, 14 Oct 2024 11:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905136; cv=none; b=KIJe25Wzej0Xlnt0CobX0lYOEHDXmjV30eV20vUGfI1vU5N5J9BqaXpiSFAk7u793sNcfGgZODMWBllH1LQjULNRkzt7kuAj3s0yNPGOjLjLDLqO0Nzq5npapAc+dzCAPVSd7mtxfDqkYrpCp5tGNEbQDeKkqvBBJjkrkJvkcUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905136; c=relaxed/simple;
	bh=SLqJFOsn5q2qjbckf2ljncx5lrxLVkzu1xfzSt7sS5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzcKioPSYdZlfQZ0p3/ZYPEmvNM7CENFcdZBuVbk/DODY9B6PClEhALQvWbFMFFl8Sqp2zQ3gNtEyMvIdQu88YhDscNhPJ7Ti4Ci+ORVFlG3BdS0AEbd1sdNXe8RDztHw5Kd46wZn8MKkw+dnK6kbs6BapzXTjaUil3apa1Tz4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMb0FBKm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728905135; x=1760441135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SLqJFOsn5q2qjbckf2ljncx5lrxLVkzu1xfzSt7sS5w=;
  b=bMb0FBKmECzSEsP6Q9dmlqRyieWfBKheOSXiKZGzSMCApNjoIyllFS3I
   JfgsbLma9/FbLXYUPR0vX3ERNQYjYS5UybYvT3vfRctcz90vuzYiNZCH3
   jJfkhoItEIzjhKpUSbMzmog8WDssUeWd789B3u3ZEFb5xZRqVCM42MYHD
   1fTmv2tO1S8isj5ouf579w6KO/mGM2O2ZTq9miJEjhJaO1+6jR52TFLvU
   EnV0Z4OCCP3wWQpCRiEDLzMa83EiX09AFGJoN7p32aIA4sH3O6JlvQHsM
   ZnkQ0WMO6TMLRgsmVPFBzaYk+OlXFFWP87xhgl3YGyR2dab9mMeK7iimM
   w==;
X-CSE-ConnectionGUID: ItiP64g0QQmkKPnql+XhHg==
X-CSE-MsgGUID: +eeLnZEuQIq0dlD6f1tWWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="32165961"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="32165961"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:25:34 -0700
X-CSE-ConnectionGUID: yYETopAaQiGK1J/Khy5GJw==
X-CSE-MsgGUID: 7exEHq4kQwagftdiOKZAgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="82116585"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:25:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t0JCZ-00000002sYA-2ZwM;
	Mon, 14 Oct 2024 14:25:27 +0300
Date: Mon, 14 Oct 2024 14:25:27 +0300
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
Message-ID: <Zwz_p3o1PJF6sl2Y@smile.fi.intel.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
 <CAGXv+5FAhZQR+Tah_6Qxp4O7=x2RawfWuMh29_FT4mGQGQF84w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FAhZQR+Tah_6Qxp4O7=x2RawfWuMh29_FT4mGQGQF84w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Oct 14, 2024 at 03:04:44PM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 10, 2024 at 11:29 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:

...

> > > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
> > > +     .cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> >
> >         .cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> >
> > Or even
> >
> > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                  \
> >         DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> >
> > > +     .opts = &(const struct i2c_of_probe_simple_opts) {
> >
> > Perhaps also DEFINE_xxx for this compound literal?
> 
> I think it's better to leave this one as is.

Using a compound literal like this questions the entire approach.
Why you can't you drop it and use the static initializers?

> Not every entry will
> use the same combination of parameters. And having the entry spelled
> out like this makes it easier to read which value is for what
> parameter, instead of having to go up to the macro definition.
> 
> For comparison, this entry uses just two of the parameters, while for
> another platform I'm working on the full set of parameters is needed.
> 
> > > +             .res_node_compatible = "elan,ekth3000",
> > > +             .supply_name = "vcc",
> > > +             /*
> > > +              * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
> > > +              * Synaptics trackpad needs 100 ms.
> > > +              * However, the regulator is set to "always-on", presumably to
> > > +              * avoid this delay. The ELAN driver is also missing delays.
> > > +              */
> > > +             .post_power_on_delay_ms = 0,
> > > +     }
> > > +};

-- 
With Best Regards,
Andy Shevchenko



