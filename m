Return-Path: <linux-i2c+bounces-10907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A159AB038B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 21:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C35CB4A667B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 19:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1D928A1ED;
	Thu,  8 May 2025 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IelAtWoL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1C61F582E;
	Thu,  8 May 2025 19:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732117; cv=none; b=puQ+tmHc2ubhVq/j2XzQ4GlwahKleRuuNn5YztjCD1soH+TtnoFTdOJ+t47lTFzdyvu6IWJSuB4PRzHmyhxAAH2Rjg8r1WgoMQD6UGZ3TRnkEZYriBr8hkA39qcI3BLnaJHzFW+n/BanM2bHdi+tRbggYIhTJTAaaYIJ6Tov/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732117; c=relaxed/simple;
	bh=gNfji5PFl+h0m2cHgjtJ540HGm+2fhAcZWawBcQGVj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6cTRq6JKSuNWGqNCtGgKlTcODkuCBTpqxZvSmzQcsg8XM0HFomTmbae1BP4NbVHN2HQ3cVQeSqJM5CO0EgWLerlBRZUMFfQ7SPO4UZBkKz127YUtP/+7Ybhp7q+ZCOasgFQuKilSCjROMwNQe1hcSPPAttGSNC7nH0y30Gx5/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IelAtWoL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746732116; x=1778268116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gNfji5PFl+h0m2cHgjtJ540HGm+2fhAcZWawBcQGVj4=;
  b=IelAtWoL6LJf6z/v3ljvGoWhgDVKaxmP7G+cQCkX4OYhkZBsdCsNLQ9g
   9hPVmUUIIDr8f1uCKQxH6GEZwiTozp3Qh+t70srzgwm2snUkHmly7ywNJ
   oIzV/xN2I1AxZ5FDcY4SJg90T8NHxp/wBDCqssAQjV/AZUBPjp8KGEKov
   q2aASaC+WmdocQXCb3tm/yJfGcW9RyHO1rmATj0Fgv339mY/sFZew5gYZ
   i+ZtOxUi9YIT0zkw9uCEKZ91XjbBgQA+z/y2X0EfI3L8fcDdy64/EZ7Wt
   aTJGZMhjxfe+knXD3i9aAi/nXZgwYAY6RaStgQclJKFL4QDgpOGFQsgWR
   Q==;
X-CSE-ConnectionGUID: 6gi/fR5cTA2CPctUzYAj/A==
X-CSE-MsgGUID: iraohavkSZKJPNDZ5/zqRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73916375"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="73916375"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:21:54 -0700
X-CSE-ConnectionGUID: 6K8qyxJ8Sp2SFtC4BMHSMA==
X-CSE-MsgGUID: LP/93AoySMKUKm+Bf0N0HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="141348693"
Received: from smile.fi.intel.com ([10.237.72.55])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:21:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uD6oP-00000004D8c-2ujt;
	Thu, 08 May 2025 22:21:41 +0300
Date: Thu, 8 May 2025 22:21:41 +0300
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
Message-ID: <aB0ERYKdRreDe7Wt@smile.fi.intel.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-24-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507071315.394857-24-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 07, 2025 at 09:13:05AM +0200, Herve Codina wrote:
> Only one device-tree overlay (lan966x_evb_lan9662_nic.dtbo) is handled
> and this overlay is directly referenced in lan966x_pci_load_overlay().
> 
> This avoid to use the code for an other board.
> 
> In order to be more generic and to allow support for other boards (PCI
> Vendor/Device IDs), introduce the lan966x_pci_info structure and attach
> it to PCI Vendor/Device IDs handled by the driver.
> 
> This structure contains information related to the PCI board such as
> information related to the dtbo describing the board we have to load.

...

>  static struct pci_device_id lan966x_pci_ids[] = {
> -	{ PCI_DEVICE(PCI_VENDOR_ID_EFAR, 0x9660) },
> +	{ PCI_VDEVICE(EFAR, 0x9660), (kernel_ulong_t)&evb_lan9662_nic_info },

PCI_DEVICE_DATA() ?

>  	{ }
>  };

-- 
With Best Regards,
Andy Shevchenko



