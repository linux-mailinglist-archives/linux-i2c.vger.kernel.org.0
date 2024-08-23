Return-Path: <linux-i2c+bounces-5736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F695CE3F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F27A01C2143C
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFF1187FFD;
	Fri, 23 Aug 2024 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvKoed14"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04049186E55;
	Fri, 23 Aug 2024 13:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724420611; cv=none; b=EHq9k2aOUfJiN7wUa7gP6G58+kU0Fg0yWimbMThrrantpkSlUeh5egBYAnahIr27Xaz/Jiyzdn7Wydo7d+Mw1sJvOh8XEslRs53ospnvj+ZvMpDR3zR9Gkyn2x8qc1zu3aFSvE5sNc1KGC/xmgDE4Xta3Q6FFJGXliRElkg/nMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724420611; c=relaxed/simple;
	bh=ib4sJFch59+GHVbbNODHxykPpCp6swAnQhqC1AHvoNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1+wSPbP5aMX5YgZLh3hNkT2ayhivwKi7zH3WEjXRhB8qjsWCyC5NprWuHHmnA6deJy4He8tB4e0xIYSV1jd4MjUNgpFEOtTx4WXFNhEB3zgzYc9gZCtXZlccpfuYLgi5z8inwB7meTkmCeBNclwHLDvYh0MKJ2X9xLfHRTXkjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvKoed14; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724420610; x=1755956610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ib4sJFch59+GHVbbNODHxykPpCp6swAnQhqC1AHvoNM=;
  b=RvKoed14wIVS7WWbe2RILh/yRicWZ0WL0A0AW+JtRxsAgrgaGMyF9dl4
   vzwOcfjh1GHgL65wPAffcZDDaZpeUCNol5EOiq0FVE9ISLml8wEtaTrBR
   CcriEG7eMwWEiI7WR8QIUeYmN0XY4PMFMQMLj+HPvFZYn3QcH9mhRtnvz
   aKdtqZ1A5Q7I8OmwUaz25InCGlCDFTtmUbxRhdLSSseujcf6yNlOF5U32
   h2AHepGNGEj5ze+lj/WtaaxyhOGlAymFzbm3FzH2F05QozLXGSoNCraMZ
   Z3dS9f3AveHvYs6Xx/nUadlBZKP+V/Y7o/eFNUmMblU3VfkGXBzMoAGlw
   A==;
X-CSE-ConnectionGUID: BoaZ8bdPTb+OjzvpNWABUw==
X-CSE-MsgGUID: ZSNoBZc3T76LAXnOXVDy2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40352809"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="40352809"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:43:29 -0700
X-CSE-ConnectionGUID: S+vBFfveTkGCT/5A9bwGUw==
X-CSE-MsgGUID: IoLQjP50Q9K73aFOWBIlnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="84980367"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:43:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUZW-00000000oAz-2JFe;
	Fri, 23 Aug 2024 16:43:22 +0300
Date: Fri, 23 Aug 2024 16:43:22 +0300
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
Subject: Re: [PATCH v5 02/10] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <ZsiR-kizxnvZufgR@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-3-wenst@chromium.org>
 <ZsdBddTDuvNasHNq@smile.fi.intel.com>
 <CAGXv+5FjwxGQgV6SdLfTeNRYbpcgwkEnCWvaZiWh4rs3bhs-2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5FjwxGQgV6SdLfTeNRYbpcgwkEnCWvaZiWh4rs3bhs-2A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 02:49:59PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 9:47 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:19:55PM +0800, Chen-Yu Tsai wrote:

...

> > > +/**
> > > + * of_get_child_regulator - get a child regulator device node
> > > + * based on supply name
> > > + * @parent: Parent device node
> > > + * @prop_name: Combination regulator supply name and "-supply"
> > > + *
> > > + * Traverse all child nodes.
> > > + * Extract the child regulator device node corresponding to the supply name.
> > > + * returns the device node corresponding to the regulator if found, else
> > > + * returns NULL.
> >
> > At the same time you may fix kernel-doc warnings (no "Return" section) in these
> > three (on your wish you may fix others in a separate change, but it's not
> > related to this series).
> 
> As you said some other functions are missing it as well, so I'll do a
> patch separate from this series to fix them all.

But you need to fix them in this patch series. We do not add patches with known
issues, which are really easy to fix beforehand.

(And below seems you indirectly agrees on that)

> > > + */

...

> > > +/** of_regulator_dev_lookup - lookup a regulator device with device tree only
> >
> > Something went wrong with the indentation.
> 
> Will fix, and also add a "Return" section.

Thank you!

> > > + * @dev: Device pointer for regulator supply lookup.
> > > + * @supply: Supply name or regulator ID.
> > > + *
> > > + * If successful, returns a struct regulator_dev that corresponds to the name
> > > + * @supply and with the embedded struct device refcount incremented by one.
> > > + * The refcount must be dropped by calling put_device().
> > > + * On failure one of the following ERR-PTR-encoded values is returned:
> > > + * -ENODEV if lookup fails permanently, -EPROBE_DEFER if lookup could succeed
> > > + * in the future.
> > > + */

-- 
With Best Regards,
Andy Shevchenko



