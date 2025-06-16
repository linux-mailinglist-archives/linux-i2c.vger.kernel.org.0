Return-Path: <linux-i2c+bounces-11491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E4ADAE93
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 13:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9C023B4E60
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 11:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2D82E11DB;
	Mon, 16 Jun 2025 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhL/aw41"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD85A29C35C;
	Mon, 16 Jun 2025 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073558; cv=none; b=oi0Q/0itA1IScvQZ3G8DqkwLNb47KclUaqRXBjLT+DjmFYsNw2eqDdGL6PiueAlUtbt1hGemb4pVz0s43y6S8AJOI+8Khp7bCsxwnxTGdUyHkt7yEuJtXoHPZRdU8O3kJ/MC5jT693MJsT0HkBE8saCP+7HEFhy6wG2ngIHkZBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073558; c=relaxed/simple;
	bh=K9KWXjUK6ETi9gIw9hOQRn1dglxLURauDPg1WLVBpa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgU6F0lh3SCIn3VWNtp6g7cvq/NQKyQIJqoNJskDWtw9RgRs4VkWhhl8o/nfL7Gu1M+nZKTgWm2hk5BOCSHwGOw9XNqsty8SCgK4hlFq5Ug1Ayz7BqH+xvmyDI00GbBdJYBztWk0ujqxk0rpa5w861FGSsrxBH6bZVwp0Ojir84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhL/aw41; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073557; x=1781609557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=K9KWXjUK6ETi9gIw9hOQRn1dglxLURauDPg1WLVBpa8=;
  b=HhL/aw413zoAJjXdVpxZ0DjIY3QCT+TJvVGCzpc2yo0kWsIh/Nt69OuK
   30A0PbetITLld2Kixncl+WryQSKGmotiXMyvEb1GKs3HnmgHTjc60Mnng
   o5+0CWZnzZ95ncUSW6OlDVckoYMUBRpFOuZdqqzgvTWog2Uw0srgxn1EI
   ps5FIrLSPSWIGYPYhQqS+foVrQ+9OzDen+ad2LXq8Q1UEjgiVljhxKSDK
   +27AGjxTTLy0LQKwH102GGEJxc+peYZ0PUvlZKjQND2fDG+WyQ3upSz6K
   eVhNxmkxRsrokxm5i2Thd+ptUK1l2sEvMkg0cJWe+C64SH7q79N3OX9HX
   g==;
X-CSE-ConnectionGUID: ZSYUzmwbR9O17H0BOLMs2Q==
X-CSE-MsgGUID: duvoV5RMSBGuHNCZO0pzew==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69657581"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="69657581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:32:36 -0700
X-CSE-ConnectionGUID: QDgnZjIbTNK2iCkDaWZJzA==
X-CSE-MsgGUID: eGPeF19JQ0WYvqZkT3eomA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="152281049"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:32:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR84a-000000073ib-42pq;
	Mon, 16 Jun 2025 14:32:20 +0300
Date: Mon, 16 Jun 2025 14:32:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
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
Subject: Re: [PATCH v3 06/28] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <aFAAxKKmwagLcg9B@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-7-herve.codina@bootlin.com>
 <CAGETcx9u-7TJ6_J5HdmDT=7A6Z08P-rUC0n+qnBoBi+ejRc2SQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx9u-7TJ6_J5HdmDT=7A6Z08P-rUC0n+qnBoBi+ejRc2SQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 02:13:49PM -0700, Saravana Kannan wrote:
> On Fri, Jun 13, 2025 at 6:49 AM Herve Codina <herve.codina@bootlin.com> wrote:

> > Setting fwnode->dev is specific to fw_devlink.
> >
> > In order to avoid having a direct 'fwnode->dev = dev;' in several
> > place in the kernel, introduce fw_devlink_set_device() helper to perform
> > this operation.
> 
> This should not be set anywhere outside the driver core files. I'll
> get to reviewing the series

Strictly speaking I agree with you, but this is not a some driver case,
it's very special and also we have some (ab)users of it.
I can relax the requirement to not set outside of a core functionality,
(like driver core, PCI core) which are tightly related to driver core
one.

Just my 2c.

-- 
With Best Regards,
Andy Shevchenko



