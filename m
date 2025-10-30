Return-Path: <linux-i2c+bounces-13911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA3CC218D0
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 18:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD00E18891E7
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 17:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF5536C23D;
	Thu, 30 Oct 2025 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a9aZc+oa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EA572639;
	Thu, 30 Oct 2025 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846372; cv=none; b=n5f8Txq4n8t+OpdBRFNNU8U6nzFw1YPTAgyPFMoz2H/5AAS0vT73o9UZqkxKGlNU5bqJt8BizRziXzBdnNGjG+D2IR7xe24m69CeOPGwRYOlk3sYSkXCBBNpmdJPYxQOe8L7yisE6ELu4GeRKwqGEa7W51PI3ix27LLT+Ta+Wlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846372; c=relaxed/simple;
	bh=b2xexS6Qluhsr9ZmEqlGOXtDsR48B9OmLyAHTqqnzbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjoLq0MKGeFrLfUrUIe51XbsZqc5fwnua1H39mqhbrIWWIPo7VrKdPaH3TeEFTgHvFB/FYbNyqZ9N1x/rhz3Q/NlLsCiX+znGeQgYfu1ZfxerfyNVXKjQxSCz4/Vf9VU4tuL+xaSqzqYJZ2n5USdHGQYoe4A/PXYHfWY9Fku9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a9aZc+oa; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761846371; x=1793382371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b2xexS6Qluhsr9ZmEqlGOXtDsR48B9OmLyAHTqqnzbk=;
  b=a9aZc+oalwpkkO3hWqBjbs+vMi2rgj2oCJWDp9pLe3pUWSPg17iqCDkk
   qtoML0dPBqScbo9FxrwSY7YmQ7R/AZQMGRtMEp8FyyOxwlGnBwjCp0Vvd
   L5zCnMqUbvo4RtH77w62IQLIkhCDtzYEjNT4TpN6wIfv+x4EAb205jkxB
   97ro6/cHB+/K2qd2xpsYHiqeTsw97hnUSzPDmTo3cwvzxloXWSuyDIOCt
   bDsIGdyu3BwN9yVxbg8OTj1KZ84jVX/0rH6qbmoBK+b/LarR1PP3eI258
   KPdDmAphYmaudT3bb5j5vaY6vXMiTcU8IyniGCQX7e13RwYO0LDCgyrqd
   A==;
X-CSE-ConnectionGUID: O6WR9q+wTHSEKlMPPgKEkA==
X-CSE-MsgGUID: khR0DuIRQTuTyy4OBIblWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64039302"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="64039302"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 10:46:10 -0700
X-CSE-ConnectionGUID: b/GmOWjcS2aKDC4H8SgNzQ==
X-CSE-MsgGUID: HAspeAjwQ7KrOmmY4Vdu1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="191158265"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.245.174])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 10:45:58 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vEWif-00000003zFy-3ih6;
	Thu, 30 Oct 2025 19:45:53 +0200
Date: Thu, 30 Oct 2025 19:45:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 18/29] i2c: mux: Create missing devlink between mux
 and adapter physical device
Message-ID: <aQOkUa1IwuiOeSvT@smile.fi.intel.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-19-herve.codina@bootlin.com>
 <6tgbavtf2dqc44ebfighrs5chzx4j4zdmjk77fmulwqbhrex2b@lou7ekbsjekr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6tgbavtf2dqc44ebfighrs5chzx4j4zdmjk77fmulwqbhrex2b@lou7ekbsjekr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Oct 30, 2025 at 04:23:24PM +0100, Andi Shyti wrote:

...

> > +	dl = device_link_add(muxc->dev, parent_physdev, DL_FLAG_AUTOREMOVE_CONSUMER);
> 
> Not to call twice put_device, I would add it once here and then
> check for !dl.

I was almost commenting the same in one of the previous rounds, but...

> > +	if (!dl) {
> > +		dev_err(muxc->dev, "failed to create device link to %s\n",
> > +			dev_name(parent_physdev));

...haven't you noticed this use? With your (and my old) suggestion this may
lead to NULL / stale pointer dereference.

> > +		put_device(parent_physdev);
> > +		ret = -EINVAL;
> > +		goto err_free_priv;
> > +	}
> > +	put_device(parent_physdev);

-- 
With Best Regards,
Andy Shevchenko



