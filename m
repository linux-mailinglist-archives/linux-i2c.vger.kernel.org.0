Return-Path: <linux-i2c+bounces-5740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD195CE72
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 643DD1C225CC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452C318858F;
	Fri, 23 Aug 2024 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XF1PnJHs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F3546556;
	Fri, 23 Aug 2024 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421184; cv=none; b=q51wO8z8NoODSx8wJWWZ5DoJtJK5xxLtgeOriL2sOKCDYK0fCe684qfT2/roPJCRiBLwqX7Gf5Tq4EmqE+n0U+3VfjaI6NzSzFUuqgK1QKfqAn84OVHN5ju8B9O4jEfjrK6KU55wfk+0jtNujV41C3o6Hh8IYQ9Yc3/31Zn+Tjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421184; c=relaxed/simple;
	bh=NMdfI/OWHRYSTSw6L7RpviVNsUSKd3nDock7vtJ+5b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1V3guSCFG+9QRpxij2UI/bPcO2iTOEBQWaDpiLcS+70v1dooTPyqV3YQHw+t/tKMx6ob5luLw3+n87HjkjVoPTzVICtwTsswM9nIm7gwRH5Iy872nuYpEjoYmbK1rEvcxgYcpskTOUqhO8n40RTNmpDVc3dRJzyzIsqKWqOsDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XF1PnJHs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724421183; x=1755957183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NMdfI/OWHRYSTSw6L7RpviVNsUSKd3nDock7vtJ+5b8=;
  b=XF1PnJHsFxGUuBJjN0G0hH5u4rhtk4KdiiFjaJXzKXHERrWDrWptwvUQ
   IlalE7/RatkE6ecl+MTePh2NI+PwTmHMukf69icfAgwASCO9TKyVDAh1A
   UROClwBCJwnEs/9AvGvgvSZHdhqePwsOOoGdJotEh06cHeT7yAzRuINZQ
   102+H+aOWzSHFhNwGsu02PguZn4tUH9bRCwfQVqyn2/HMuaUZfTxAvamY
   TkCFfTr1c+mVzjWxcbINxFvM72m2YVC+3Ed63AFRDAiI1w6mLu0pCmNgM
   i3FIO3fXS5Nr7v400gWPzGTQN5DIrVGk2BKdSPcsEVGRj3vZdRYnFQ3GW
   A==;
X-CSE-ConnectionGUID: uz7VckucQNqV3DuuptbIsw==
X-CSE-MsgGUID: cWkr+6UCSIOgz700x+ydog==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22770928"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="22770928"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:53:02 -0700
X-CSE-ConnectionGUID: 3J6bHqD+RnmlS77hRXo7Tw==
X-CSE-MsgGUID: KG6Te0ezSfyzu69uRTTi9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="92527922"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:52:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUik-00000000oKZ-1854;
	Fri, 23 Aug 2024 16:52:54 +0300
Date: Fri, 23 Aug 2024 16:52:54 +0300
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
Subject: Re: [PATCH v5 06/10] i2c: Introduce OF component probe function
Message-ID: <ZsiUNodqp9PgzbP-@smile.fi.intel.com>
References: <20240822092006.3134096-1-wenst@chromium.org>
 <20240822092006.3134096-7-wenst@chromium.org>
 <ZsdE0PxKnGRjzChl@smile.fi.intel.com>
 <CAGXv+5HtjWi60OnMrjR3fnO3T=7uyMazr1aKBFjuPmWuE9NK6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HtjWi60OnMrjR3fnO3T=7uyMazr1aKBFjuPmWuE9NK6g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 04:40:36PM +0800, Chen-Yu Tsai wrote:
> On Thu, Aug 22, 2024 at 10:02 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Aug 22, 2024 at 05:19:59PM +0800, Chen-Yu Tsai wrote:

...

> > > +     ret = of_changeset_apply(ocs);
> > > +     if (!ret) {
> >
> > Why not positive conditional?
> 
> No real reason. I suppose having the error condition come first is more
> common.

Yes, when you have something like

	if (err) {
		...
		return err;
	} else {
		...
	}


But you don't. That's why I commented on this.

> Not sure if it makes any difference in this case though?

! is hard to read by a human being, easy to make a mistake in the brain of
reader and with inverted logic the code reading becomes harder. So, it's pure
about cognitive function.

> > > +             /*
> > > +              * ocs is intentionally kept around as it needs to
> > > +              * exist as long as the change is applied.
> > > +              */
> > > +             void *ptr __always_unused = no_free_ptr(ocs);
> > > +     } else {
> > > +             /* ocs needs to be explicitly cleaned up before being freed. */
> > > +             of_changeset_destroy(ocs);
> > > +     }

-- 
With Best Regards,
Andy Shevchenko



