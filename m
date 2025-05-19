Return-Path: <linux-i2c+bounces-11038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D77ABC2CA
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 17:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0666C3B3FB2
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 15:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE33286893;
	Mon, 19 May 2025 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOMWIman"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D912820C6;
	Mon, 19 May 2025 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669470; cv=none; b=fTSnr74qZOvgdGVe149C7Bk08UIXwQW5PQ6OSsxoThj2HBSP3+TQPOwMjxNef46k0rTmZnjxfhD+4pZD4A5HGIzncViSltESc3uxefIgd2bxjh7cngYurzZlEC8DcS7CMokrtf8CvHwePvi48tTM8Vxv8F4tgm2XTUeFW1Xo4K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669470; c=relaxed/simple;
	bh=ucbRC+By9t6hiwEjSnTGEwM8Sp7zd3PXSGJLq749aGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qm92AmcR87mf6YgWqphb2IWpliXJ34Epejc8119Sq6cqpJcbaXX0pagIl+7WLlYnLx/dH9buWEVbWl5znbOm6Kop1FfR+RTfZF5oguHp6w8gR14h4i1R/IDYKraJq5GIicufo0QjBXbdCjNJuvYit0cepe/m5V+dYVzOtSwK0Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOMWIman; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747669469; x=1779205469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ucbRC+By9t6hiwEjSnTGEwM8Sp7zd3PXSGJLq749aGA=;
  b=gOMWImanockod7A/QxMhBip60hxhwDqRMjfZuqjMPulix1cJgkOeSY9G
   uVp4Yfeopxznj7KPDWdx8aDdTANeeh0rx/ejfIZCzjkxiti+WqL+PmzFf
   o1nKoJkAzHClGxWTcgXkZnlKwp4AhiTlkj+901XhieoRlr1OeDhQ1GuCe
   ztEM0zzEnZyGd/e813Xl1dy35NKQ6y1kG+fb5ugBZeRgcOZQ0s42OGZaB
   h6DRoK8EOBiuZzWHD4AbfQO1MQw0rWE+a5DeGvFSD1A2mdz0gEuP4HjH3
   3stFLGelmUzcOHA/rhR55DG/iKyxCkWH6ilFRwL5H5rubH2wuP/0bcbzZ
   w==;
X-CSE-ConnectionGUID: WKLKd6ubTY+f8O88tW3VcA==
X-CSE-MsgGUID: /UA6LEhJRMWQmdgoLNy3YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60966638"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="60966638"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:44:28 -0700
X-CSE-ConnectionGUID: D9nnBx4yRm2U9Gb6be0UuQ==
X-CSE-MsgGUID: O7jOjWPERG2e6Txxz393/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="176513494"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 08:44:18 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uH2f0-000000034rN-2cA2;
	Mon, 19 May 2025 18:44:14 +0300
Date: Mon, 19 May 2025 18:44:14 +0300
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
Subject: Re: [PATCH v2 23/26] misc: lan966x_pci: Introduce board specific data
Message-ID: <aCtRzm6nPk61WtRj@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com>
 <aB0ERYKdRreDe7Wt@smile.fi.intel.com>
 <20250519170004.631d99af@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519170004.631d99af@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 19, 2025 at 05:00:04PM +0200, Herve Codina wrote:
> On Thu, 8 May 2025 22:21:41 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:

...

> > >  static struct pci_device_id lan966x_pci_ids[] = {
> > > -	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, 0x9660) },
> > > +	{ PCI_VDEVICE(EFAR, 0x9660), (kernel_ulong_t)&evb_lan9662_nic_info },  
> > 
> > PCI_DEVICE_DATA() ?
> 
> PCI_DEVICE_DATA() need the device ID defined using a #define in the form
> PCI_DEVICE_ID_##vend##_##dev
> 
> PCI_VDEVICE() allows the device ID value passed as an integer in the same
> way as for PCI_DEVICE().
> 
> Also, according to its kdoc, it allows the next field to follow as the
> device private data.
> 
> IMHO, I think PCI_VDEVICE() use is correct here and I will keep it.

It's correct, no doubts, but using PCI_DEVICE_DATA() makes sense when you need
to supply driver_data. In particular it will take care of needed castings and
also as you noticed asks users to apply the regular pattern for PCI ID
definitions.

Moreover, the 0x9660 is used in two drivers and it's a good candidate to be in
pci_ids.h. (Note drivers/pci/quirks.c:6286)

-- 
With Best Regards,
Andy Shevchenko



