Return-Path: <linux-i2c+bounces-10906-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A9AB0382
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 21:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 376314A648A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 19:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272BE289E15;
	Thu,  8 May 2025 19:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6FzcJIC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE4F21FF54;
	Thu,  8 May 2025 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746731986; cv=none; b=gnR+ImMgwVSt0kEXV5uhuwx19RLSI5DVJvDufJKhSCdn4ecnzuMrX4+xHz6WK5eVGQPETHfNxvxbPaSoiSfjemDRD94v3dzQ+QRIdqSbqCaOKt/AQoW0OlNYpBBIvjfs7eQC7yWMri1guJbkRiDVPkHLaMF8Evu04dO8gU0rTSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746731986; c=relaxed/simple;
	bh=18gsJArBrnS1jxWxOipw7F0QCTdS4jhedd/7kH0ZuwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTmKyhIgRW3PPaWp3kj24DqVAG9gZLfXfsDbayvtGmqL7p2BNJuQ2hl5wz/usp9lbvTKDbVr6xBYwq72jtRlTXck1GwenJiLdPZF/v6C98PjJpuTU/O/dAyCm+tcQU2iCP2PKxS6Ke8xEhtk2ZrnRM2B9PEsooNwX8fMwqyyL0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6FzcJIC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746731986; x=1778267986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=18gsJArBrnS1jxWxOipw7F0QCTdS4jhedd/7kH0ZuwA=;
  b=I6FzcJICtqIz3XjpsFxCxyn1X307M8GSvkLjVz12T6KFirC/+skVtdoW
   tcqx9gBQ0ohZI4113Y1csPpjLP3+CeZse2Qe7ZUOnEyfvs2y5t5sV/q+b
   l75GDEnTdR0dcdJrAhSA/otcJ1efrBbyDVFaUd68Qb2j0y6Szm6Z+276A
   lSG2uMydyPUq+6Dc1v96qHUN9I1NbOhmcQzGGZSAvoBYp0MmZ1WKNtv/d
   1lNwxNsUVemggKe1IJz4WfWO6Ik1iYSDtpXx5TTRfPDsjtbdyObrVkPFr
   GpY/mgfIxrVtM1USjAwlGzNfcuf8CGz6Ud+o5TV8MGGHq1JfHULnjF+l9
   g==;
X-CSE-ConnectionGUID: tN70dul3TEyFUbWRo6JQPw==
X-CSE-MsgGUID: vpfGgSK4Tmi5zYqDNFmYYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59880443"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59880443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:19:42 -0700
X-CSE-ConnectionGUID: imppGwgiTLmLc9lZi5sElQ==
X-CSE-MsgGUID: BD9SBI9fRmiZJWTT4Muhvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136102471"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:19:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD6mH-00000004D79-1VPH;
	Thu, 08 May 2025 22:19:29 +0300
Date: Thu, 8 May 2025 22:19:29 +0300
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
Subject: Re: [PATCH v2 17/26] of: property: Allow fw_devlink device-tree on
 x86 when PCI device-tree node creation is enabled
Message-ID: <aB0Dwdr8IJF4F9gR@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-18-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-18-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:12:59AM +0200, Herve Codina wrote:
> PCI drivers can use a device-tree overlay to describe the hardware
> available on the PCI board. This is the case, for instance, of the
> LAN966x PCI device driver.
> 
> Adding some more nodes in the device-tree overlay adds some more
> consumer/supplier relationship between devices instantiated from this
> overlay.
> 
> Those fw_node consumer/supplier relationships are handled by fw_devlink
> and are created based on the device-tree parsing done by the
> of_fwnode_add_links() function.
> 
> Those consumer/supplier links are needed in order to ensure a correct PM
> runtime management and a correct removal order between devices.
> 
> For instance, without those links a supplier can be removed before its
> consumers is removed leading to all kind of issue if this consumer still

are removed

OR

consumer

> want the use the already removed supplier.
> 
> The support for the usage of an overlay from a PCI driver has been added
> on x86 systems in commit 1f340724419ed ("PCI: of: Create device tree PCI
> host bridge node").
> 
> In the past, support for fw_devlink on x86 had been tried but this
> support has been removed in commit 4a48b66b3f52 ("of: property: Disable
> fw_devlink DT support for X86"). Indeed, this support was breaking some
> x86 systems such as OLPC system and the regression was reported in [0].
> 
> Instead of disabling this support for all x86 system, a first approach
> would be to use a finer grain and disable this support only for the
> possible problematic subset of x86 systems (at least OLPC and CE4100).
> 
> This first approach could still leads to issues. Indeed, the list of
> possible problematic system and the way to identify them using Kconfig
> symbols is not well defined and so some system can be missed leading to
> kernel regressions on those missing systems.
> 
> Use an other way and enable the support on x86 system only when this
> support is needed by some specific feature. The usage of a device-tree
> overlay by a PCI driver and thus the creation of PCI device-tree nodes
> is a feature that needs it.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> link: https://lore.kernel.org/lkml/3c1f2473-92ad-bfc4-258e-a5a08ad73dd0@web.de/ [0]

Link:

(mind capitalisation)

Otherwise LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



