Return-Path: <linux-i2c+bounces-6561-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 948DD9755C8
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F51E1F27A1D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 14:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC661A3027;
	Wed, 11 Sep 2024 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVWd9pEz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC619F12F;
	Wed, 11 Sep 2024 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726065606; cv=none; b=KYLnbmAZ5Iyy7cr/KPxKwwH6G43rZT2AVyFhBujBQCSwl8RS8rrEvTPXQeXOvXDkV2HYx32Vr+co5LhHUJ1THeznj5vvh4EBZ9NUeWWAwelonJe/dtpuBzZi46PwPRbPj9EQ9RiTEY7UTbGXTMWKafkgYfa0Spzj32em7O0UNzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726065606; c=relaxed/simple;
	bh=WI2hLbPs3H1pco02BcRwP2QdoYU9cUQafOS5FL+JAdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVJpQFm171dqjVEQNI2YmLqlIfPT1LYpBF1/3713QEI/VDxKnKo4FBfLrUQXx1bixZMVayKHva5qLAz4HM1PoNufVht+s+h+3pk4DGBhRy8AUYhktggWW3f+tgTvB8xHZeWi1AtSRb6/Dt/7MN7ltTQKg+5XMebcyiNrYDEUn3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVWd9pEz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726065605; x=1757601605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WI2hLbPs3H1pco02BcRwP2QdoYU9cUQafOS5FL+JAdo=;
  b=dVWd9pEz1zrCIpAkBHhdl88Ba77GkkaEFgDaP3LFvKKBvnYOGRjd2jHU
   flNE+pL6RUhrV6zt7qKZyE0amKKK9udOZErSrHvneasMMpevL6W1TMT3k
   zELLH5SeJ9iBa0XnL2FERnG1pD+mZrXQPOvEiKSO8HZ12qiD8DhJmPQaE
   Lo3l7GxiAcZL49G5JA5VLW93whjXleLs1wzyZVoRT8BTJvI05FvFFPU56
   v95wIAKZcIdM4qE7WQas+Rm9HlxKAADBKVmV1xmewu8cq1Gajw6f+ELsU
   +RRnvti7Q4kXSaZ5rIvh6G2eZFfW6DFjFZAiW9bW7aMVH0CfZuQxbHcwV
   A==;
X-CSE-ConnectionGUID: 8ty3sN6jTNuS7vX6YWez5g==
X-CSE-MsgGUID: /khWHfz7StCHwhtcslZ2SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36258863"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="36258863"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:40:04 -0700
X-CSE-ConnectionGUID: /9794G4jTLCwJ1OZgfQhEQ==
X-CSE-MsgGUID: nxrEBEmqRhebid8NxU0tPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71526680"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:40:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soOVh-00000007aSl-0wzE;
	Wed, 11 Sep 2024 17:39:57 +0300
Date: Wed, 11 Sep 2024 17:39:56 +0300
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
Subject: Re: [PATCH v6 06/12] gpiolib: Add gpio_get_property_name_length()
Message-ID: <ZuGrvIb_kZpiA9QC@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-7-wenst@chromium.org>
 <ZthjSK9N9z11YXi2@smile.fi.intel.com>
 <CAGXv+5GrW0EZZw6HVY7ALvm0dBj5Wwrvp02vtTPZYwqxxiZQyg@mail.gmail.com>
 <CAGXv+5Hrz2rA1_eAY8S96ankeWS4wr9EX-hr1LUY5JGx=FoNPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Hrz2rA1_eAY8S96ankeWS4wr9EX-hr1LUY5JGx=FoNPQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 03:37:35PM +0800, Chen-Yu Tsai wrote:
> On Mon, Sep 9, 2024 at 10:45 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Wed, Sep 4, 2024 at 9:40 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Sep 04, 2024 at 05:00:08PM +0800, Chen-Yu Tsai wrote:

...

> > > > +/**
> > > > + * gpio_get_property_name_length - Returns the GPIO name length from a property name
> > > > + * @propname:        name of the property to check
> > > > + *
> > > > + * This function checks if the given property name matches the GPIO property
> > > > + * patterns, and returns the length of the name of the GPIO. The pattern is
> > > > + * "*-<GPIO suffix>" or just "<GPIO suffix>".
> > > > + *
> > > > + * Returns:
> > > > + * The length of the string before '-<GPIO suffix>' if it matches
> > > > + * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
> > > > + * -EINVAL if the string doesn't match the pattern.
> > >
> > > Should be %-EINVAL as we agreed with Bart when I updated GPIOLIB kernel-doc.
> >
> > Ack.
> >
> > In the regulator cleanups I did, I used -%EINVAL instead. But then I
> > realized that constants aren't really cross-referenced. I probably
> > have to go through all of them to fix those up.
> 
> FTR this patch ended up getting dropped from the series as it was no
> longer needed.

That's great news!

> However if folks think there is still value in this patch,
> I can still send a new version.

Not for me, thanks.

-- 
With Best Regards,
Andy Shevchenko



