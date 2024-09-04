Return-Path: <linux-i2c+bounces-6178-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E9A96BE03
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 15:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26021F21785
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 13:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884001EEE6;
	Wed,  4 Sep 2024 13:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cwfg2u2o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB442139D;
	Wed,  4 Sep 2024 13:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725455775; cv=none; b=CpBZWke0h3hvx37dyPyuLitJZQGr+yo4s794P8rQaPtkejfLZXxhOJHk4r2EWVCmWOU/+o2R3QAqpdWm75ZsOkxs9xJHbUlVqEtU9X9b4FURHq5WF0QMncPsY7s5hdLIbLFSKRtRs0w4fYfek5DyhcxOGjgVVE0vWkXbgR9Z0Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725455775; c=relaxed/simple;
	bh=5RTrK2A/7XPuuwlK3ZUuX4mnuUZD8sPxcvFgKwNLL/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rL+gmABf3BXluEe+tbuxDe5xqqzwMWuNi+JOcfbO1NBQrk2R7e4QTsp4XKkTaSVfN32E4deMBJKK8lTDqh9wzxjWvmmKn6xi4rJZH202Qvlz3FPLpWWHlT/uRPFfwUZkdOq3z1XuonDRgKhZH3bfa73nv1O+76UpQfjTlNp6rA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cwfg2u2o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725455774; x=1756991774;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5RTrK2A/7XPuuwlK3ZUuX4mnuUZD8sPxcvFgKwNLL/4=;
  b=Cwfg2u2oVY6Tg7VeQTxgj0+Zxhiz83qbGywEOMh6OotZMrlVJDmEokcr
   LYN50fTa5cjoL8b52kvB57paIII+mtCKdGCdNbJnnpylr4r2R6k4nlDvv
   VppI7FZ7Kbh5OvR5EvnVvHcJe0GnB6CamYxNtgDLC2unXKJ+cL3eLFSp6
   oVz19oyylJGLEKyc4OK5CvmYhNEAj6VPfski9PoT79iqKJBw35ZONE6mA
   diNPhZ70FAGGeXmgpfYCYxCiR4gCGe66wmj6HR51Eh4l6Md8jWOpXiJvu
   fS+dVIZfiVCwWDGdg7yOt8EryctRx+EZIRS62Urfhga/QxuGKZLq+NSlG
   A==;
X-CSE-ConnectionGUID: lVD2znsTQWC4DCGm9MECOw==
X-CSE-MsgGUID: 0wp7A65JR9SX5uC3iu8wbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35275474"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="35275474"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:15:23 -0700
X-CSE-ConnectionGUID: VaOsEGIpSXuEKg1mjvoXOg==
X-CSE-MsgGUID: aTQ1ZcVKQp+mUqWGC6vE7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="65608995"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:15:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slpqe-000000054Q5-02f2;
	Wed, 04 Sep 2024 16:15:00 +0300
Date: Wed, 4 Sep 2024 16:14:59 +0300
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
Subject: Re: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup
 code to of_regulator.c
Message-ID: <ZthdU6UGlM75GJVj@smile.fi.intel.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-4-wenst@chromium.org>
 <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZthcBpx8WFIvsrJj@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 04, 2024 at 04:09:26PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 04, 2024 at 05:00:05PM +0800, Chen-Yu Tsai wrote:

> > +static struct device_node *of_get_child_regulator(struct device_node *parent,
> > +						  const char *prop_name)
> > +{
> > +	struct device_node *regnode = NULL;

> > +	struct device_node *child = NULL;

Btw, redundant assignment here, as child will be assigned anyway AFAIR.

> > +	for_each_child_of_node(parent, child) {
> 
> > +		regnode = of_parse_phandle(child, prop_name, 0);
> > +		if (!regnode) {
> > +			regnode = of_get_child_regulator(child, prop_name);
> > +			if (regnode)
> > +				goto err_node_put;
> > +		} else {
> > +			goto err_node_put;
> > +		}
> 
> I know this is just a move of the existing code, but consider negating the
> conditional and have something like
> 
> 		regnode = of_parse_phandle(child, prop_name, 0);
> 		if (regnode)
> 			goto err_node_put;
> 
> 		regnode = of_get_child_regulator(child, prop_name);
> 		if (regnode)
> 			goto err_node_put;
> 
> > +	}
> > +	return NULL;
> > +
> > +err_node_put:
> > +	of_node_put(child);
> > +	return regnode;
> > +}

-- 
With Best Regards,
Andy Shevchenko



