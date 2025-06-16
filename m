Return-Path: <linux-i2c+bounces-11495-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B89AADAEFE
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 13:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7531173045
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 11:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AAD2E7F06;
	Mon, 16 Jun 2025 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kbf3Mba5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB3E27E059;
	Mon, 16 Jun 2025 11:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074357; cv=none; b=BCo0iHr/ECy/e7WKiRKntY759vdqtMzYOqlGyvCV2pnUQKbDGC9rcWhY8c8kOP0H1+VznEEPXPdo9JITf0xAboWroyuLrCHyfJF+OTh4y1Nrws1qvckb309mY2NIZ8Q8xrgpc8xAO9muEbQec19i9osFygT0oFCuPKe1B5fqz98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074357; c=relaxed/simple;
	bh=O7zqOTuFLCOrB6zke/k+DoaYmhGkvGgv200R9Xh9Rv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stTCNcicH4HPa1Juu+9MW01jXse/1kMqCcw5vJMk8vwsn9nZRnRDwK9DHmIcN5ruh38A/Se3KCIQY6Y13MlTM4RZLOJnzsufpZZ6ZyQtH1IKduqZ/oaaMO8OtVLThWU9bKV0l1t3bZa2iytW6wIJgT2x1KUkwNhXkYv+NEI9dyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kbf3Mba5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750074355; x=1781610355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O7zqOTuFLCOrB6zke/k+DoaYmhGkvGgv200R9Xh9Rv0=;
  b=Kbf3Mba5ujKZypBR2wIFKFyXP2jDydWZiWqnkCWSjV//2oHf4L7KLUZ3
   mPIGNyf+4BzQIebMf7pl0Wu8IHJMsjAGgHQKHiV/jZxc+sD3ctOpTA0RU
   dYO2a5NKyt2iikZchHcvHXhjdlecC2zncKbekLVeZOK4NlI5T+BHkFM8+
   GUyHDDx0tREYPRdz9FXd4bNHyImr2TlctrXJFwOEFd8I1KEq1EV19nKvV
   4OduPrG3PjfJdmR64+1t5s2xzVMRp2efzhdI8rIlCco3zNbIGX3VD1S1V
   F/zzrfnBNKo3ybIRp3NpUcDRtaSi3oluzFaVEgB4zBGR7zh2pYmMMCAH4
   Q==;
X-CSE-ConnectionGUID: gOMbagrtSzKEhzy9DzzA/A==
X-CSE-MsgGUID: 8MHOkuv5SOKrX9eqeReAMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63629545"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="63629545"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:45:54 -0700
X-CSE-ConnectionGUID: YPoKs+xPTJS23+lwLuQK+g==
X-CSE-MsgGUID: 2/EHphBLS6e1qatprLVKeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148991459"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:45:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR8HR-000000073td-2aiv;
	Mon, 16 Jun 2025 14:45:37 +0300
Date: Mon, 16 Jun 2025 14:45:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Davidlohr Bueso <dave@stgolabs.net>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 11/28] PCI: of: Use fw_devlink_set_device()
Message-ID: <aFAD4czF-qPxoc-X@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-12-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-12-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 03:47:51PM +0200, Herve Codina wrote:
> The code set directly fwnode.dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



