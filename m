Return-Path: <linux-i2c+bounces-5741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7E295CE79
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A3D71F238AC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A6A188595;
	Fri, 23 Aug 2024 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e48TG8FI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E436D188586;
	Fri, 23 Aug 2024 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421373; cv=none; b=D2QR31Azbop+8ixPaERmdZUvReW93xZM/GnRX+AhlmJfdEOsjclt6Z1NKY9feVil2OUKh6S/KJmtBqSyfkb/TB9gDZHnlQi8ozpWDZ9RkmjqN7Ai9yDYQV1MAB5FpGS0OwYH1bBDqg9mPKvQRdkhMyN+SRF0sQh8D8ci3hBX3F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421373; c=relaxed/simple;
	bh=gndjyeqaytEaKYf1kOK8jLLgaJjwQwTw8djDulGw++U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx70Gp3+U1l1RIOo5JpDHWGAjLHHsdTaPvwJ/ftzhn4gr0UBg5W/FJag2lFoRYWzHlEjwBFURg25GoXe1A755xDg831G4EVsENfejGWS3VFTQ/FynUpapoyHL9xmP3mqdi1BAcdWbujkv9KskTS3iYAHmWLw0fqgyokWcynE3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e48TG8FI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724421372; x=1755957372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gndjyeqaytEaKYf1kOK8jLLgaJjwQwTw8djDulGw++U=;
  b=e48TG8FIs9pvwDdpP6MAFtI8hjEhC/wXyoOyJRUktA37zhlsZW7D9srF
   YiessI4lG813oTE4L0jjQ0e0zHUPsMb6hY/Tn9uLvA1JmeipCrIfF/lHB
   2925rsU0voC5p+cjFSw7SKNfTa0Tt+j7x+NajbiUuZYLDUJgB7PBEk4jB
   uYek/eW/ODhTjsjPt8eu7+cU+hcqpORNfIBTDK+oN7ggHFX2u7awd80/+
   rO5GanvqSIp42v+G9np59DvYvigmMEh+8PEOPABmM93edMi1xoLAQXtZP
   wmprKUiyWx2UhRRQSe01LrTzVVwAnHZJBidpr4iKMytD4HND9Q0qjxokG
   Q==;
X-CSE-ConnectionGUID: KuqTbGDKSnec/xNA4ApV+g==
X-CSE-MsgGUID: PV9oQ55WTCChIMNSy7FhuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33513410"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33513410"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:56:10 -0700
X-CSE-ConnectionGUID: qYpLNdWxRbOic97zRlbH/g==
X-CSE-MsgGUID: M4YCAqa4Q1u89Ebl/F3u5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62104859"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:56:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUln-00000000oMz-1Rih;
	Fri, 23 Aug 2024 16:56:03 +0300
Date: Fri, 23 Aug 2024 16:56:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v5 07/10] i2c: of-prober: Add regulator support
Message-ID: <ZsiU81fYfy8WTk_5@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-8-wenst@chromium.org>
 <ZsdGlMyq4pwWAOk4@smile.fi.intel.com>
 <CAGXv+5FWaN4gGksCF7k3emuDyCmAtx7+DBwHHbFhf_FLpP+=aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FWaN4gGksCF7k3emuDyCmAtx7+DBwHHbFhf_FLpP+=aw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 05:35:59PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 10:09 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:20:00PM +0800, Chen-Yu Tsai wrote:

...

> > Hmm... why not
> >
> > static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
> >                                 struct i2c_of_probe_data *data)
> > {
> >         struct property *prop;
> >         int ret;
> >
> >         ret = i2c_of_probe_get_regulator(dev, node, data);
> >         if (ret < 0) {
> >                 i2c_of_probe_free_res(data);
> >                 return dev_err_probe(dev, ret, "Failed to get regulator supplies from %pOF\n", node);
> >         }
> >
> >         return 0;
> > }
> 
> That would be more churn in the next patch, which introduces another
> error condition requiring the same cleanup.

OK!

...

> > > +     /* largest post-power-on pre-reset-deassert delay seen among drivers */
> > > +     msleep(500);
> >
> > How would we monitor if any [new] driver wants to use bigger timeout?
> 
> The assumption is that the person doing the integration should test for
> this. This prober doesn't get called everywhere. It needs a driver to
> call it, and that driver is written by someone for some specific platform.
> Maybe I should explicitly spell that out in the function description?
> Or even make it a parameter?
> 
> Also, having an arbitrarily large number here doesn't help platforms that
> want to minimize boot time. On that front I'm also thinking about whether
> it is possible to do a handover to the actual driver so that the latter
> doesn't have to go through the whole power sequence again.

Yeah, I think the best effort is to have a parameter.

-- 
With Best Regards,
Andy Shevchenko



