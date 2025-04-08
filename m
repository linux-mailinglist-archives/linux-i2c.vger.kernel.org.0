Return-Path: <linux-i2c+bounces-10210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A607A80CE6
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 15:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64AC41880543
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 13:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CA51C3BE9;
	Tue,  8 Apr 2025 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cmkh94ja"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFB71B3937;
	Tue,  8 Apr 2025 13:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120086; cv=none; b=qUJYhmk9aZFEC/or91XIcb5bS/zVuGHWZLWMmk4AXeO9O8GvbFt3tsZtG6DhepxPBUd66B6GDBkRTkiOR5cS3AJtbrVLJA3RzUIlSLu7CzTS6eBb6pILVVF/qIIgcjQmXLb9DcmKPzrEf1qRcD2qv8U5XwzrkDP/pQx5ItcNhbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120086; c=relaxed/simple;
	bh=QZAL+S5YzRwLwlwsMXd2zOLO+f+OKUqCHKeJeegQlnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2CiLRZAOG50vc0S5FiEvrGQn1ssNEzFNwDwUC+DfWQ0NrwwsqCdhfEpbyKRgQtAUmwK04cOUPygE7wAdRBOy9IWsS8mDdVGjtho1Qq+lvq4doAp/6QGUXl/DJhbud8CvBrfPm7d9OXmt/r86DvII6x3PIAE08VTSnR+7z37Iys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cmkh94ja; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744120085; x=1775656085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QZAL+S5YzRwLwlwsMXd2zOLO+f+OKUqCHKeJeegQlnk=;
  b=Cmkh94ja/J8o92/5HXBnkYuJeCqp4QEtuaDrw3sZogjaB5R+GSDTicjF
   N2BuIvVR0R0ZoxYmPMnjKaGKN2QRO+1FdZ6J9IeF94lIvsNsI3uPYx9XY
   jXIDZxnzmlxwX2UwYeTdMgRnh/c5eBgyRpA96EjnUkGH1q4iY261rDzYG
   Qh/1q/0pVuRdbFirsMader3kxKtl//gS9LyRjk8ZQ6JpMgHIvcepvGzB6
   EDo5qRycX2ikduD+aqM7CLDdM0uA5uI5kuyVG7bdLrjrkTo5G8ocMemvZ
   rA/VukMwkXB+uDEoS6h4Hd4OBvIWrmnkNtF4+Nzp0A4z7RUQN2uY1Kizr
   w==;
X-CSE-ConnectionGUID: x6HaVGksQJ+IU3hPv3DukA==
X-CSE-MsgGUID: feVPp7rYTnG9STGyPaiZXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45687599"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45687599"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:48:04 -0700
X-CSE-ConnectionGUID: iAYgxfehTbaEoToFMmJRlA==
X-CSE-MsgGUID: iqkx9wdbSa+Z+aMmj20O9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128794917"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:47:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u29It-0000000APvn-2CjO;
	Tue, 08 Apr 2025 16:47:51 +0300
Date: Tue, 8 Apr 2025 16:47:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 08/16] i2c: core: Introduce i2c_get_adapter_supplier()
Message-ID: <Z_UpB1cgU_99JHdF@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-9-herve.codina@bootlin.com>
 <Z_Puy8eEBc6tubEx@smile.fi.intel.com>
 <20250408150836.327a337d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408150836.327a337d@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 08, 2025 at 03:08:36PM +0200, Herve Codina wrote:
> On Mon, 7 Apr 2025 18:27:07 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Apr 07, 2025 at 04:55:37PM +0200, Herve Codina wrote:

...

> > > +	return get_device(adapter->supplier ?: adapter->dev.parent);  
> > 
> > What will be the meaning when both are set? Why dev.parent is not the same
> > as supplier in this case?  Looking at the commit message example, it seems
> > like you want to provide a physdev or sysdev (as term supplier seems more
> > devlink:ish), like it's done elsewhere. And in the same way _always_ initialise
> > it. In such a case, the ambiguity will be gone.
> 
> When both are set (this is case for i2c muxes), the adapter->supplier the
> device that register the I2C adapter using i2c_add_adapter() or variant.
> In other word, the device that creates the I2C adapter.
> 
> The adapter->dev.parent is most of the time the device that register the
> I2C adapter except for i2c muxes. For I2C muxes, this adapter->dev.parent
> is the adapter the i2c mux is connected to.
> 
> Between physdev and sysdev, I really prefer physdev and, if renaming from
> supplier to physdev is still needed (and wanted), I will rename it. Let me
> know.

The terms supplier/consumer are widely used in terms of power and devlink.
I think here should not be used the term supplier.

> For initialization, I don't want to modify all the I2C controller drivers.
> What I can do is to initialize adapter->supplier using adapter->dev.parent
> during the i2c_register_adapter() call if it was not already initialize by
> the caller (i.e. the I2C controller driver).

This can be done in the I²C core, but I'm not insisting on this part.
We can start from your function only and then decide later on how to
proceed (depending on how many users of that field appear and what
they want to do with it).

> Does it make sense ?

-- 
With Best Regards,
Andy Shevchenko



