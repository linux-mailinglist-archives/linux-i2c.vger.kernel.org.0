Return-Path: <linux-i2c+bounces-2788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4412E89A35D
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 19:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7561A1C23048
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 17:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30331171659;
	Fri,  5 Apr 2024 17:14:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F1716C858;
	Fri,  5 Apr 2024 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712337262; cv=none; b=FosKjcjEo03eYs9SYjUzzWr9aRBxnKS3zzR/Z+NzzG2xySeRsHyr4h5seLwu9hxL317j6z0gUI5d8RcNbejrA/lVxNxeC27Ie+h+aONw2ZhIZQEge/w7TNVU77gmYe4NdMjnZMsOeon16JHe3PPHaf1hyC+iBOUMHwuE2y4tcnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712337262; c=relaxed/simple;
	bh=PS5evwJ8xyi+GjWxAU4gBBflc4VGXU88R/XiJlorDvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ie16h9NrFqwr0JlbAmbs0F2xy5KphbGzrdJOdAo+PfOqu294Huek5u7zxMcIFvxwzfDwPg85JlLx7/f1k1WC/RsvfGXvESnKsKZBv/65GT1YYl5GM7RQg3Qrtx1jnlAqIlNtd2YFRAjIH2ZEtQNyrQmb6ulLdssGaUNI1yp59FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: B/jJA5c9R2yy4rIvTzuYDg==
X-CSE-MsgGUID: tdmbOsdIRKqZ0FSC78MqJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="19031169"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19031169"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 10:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="915259793"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="915259793"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 10:14:13 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1rsn8k-00000001oG4-1imE;
	Fri, 05 Apr 2024 20:14:10 +0300
Date: Fri, 5 Apr 2024 20:14:10 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v4 08/18] phy: ti: phy-j721e-wiz: add resume support
Message-ID: <ZhAxYjMgLToZWh_m@smile.fi.intel.com>
References: <20240102-j7200-pcie-s2r-v4-0-6f1f53390c85@bootlin.com>
 <20240102-j7200-pcie-s2r-v4-8-6f1f53390c85@bootlin.com>
 <ZhAqWWdZvGcFDWlM@matsya>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhAqWWdZvGcFDWlM@matsya>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 05, 2024 at 10:14:09PM +0530, Vinod Koul wrote:
> On 04-03-24, 16:35, Thomas Richard wrote:

...

> > +static int wiz_resume_noirq(struct device *dev)
> 
> I think this should be annotated with __maybe_unused

No...

> > +		.pm	= pm_sleep_ptr(&wiz_pm_ops),

...because of magic of PTR_IF() here.

-- 
With Best Regards,
Andy Shevchenko



