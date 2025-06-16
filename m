Return-Path: <linux-i2c+bounces-11493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 007C7ADAECC
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 13:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F70C171DE9
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 11:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD322E2EFF;
	Mon, 16 Jun 2025 11:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKXrRLV+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC82261570;
	Mon, 16 Jun 2025 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073942; cv=none; b=gVOx4yiYMnA3oSvVcluS4F82L0vO7hC84PAq9YFjnqmCwhckeIKE2PKC/oFnXjCDojMauvlbTSjjc1uyXfSEHqGUY683W6opidh112WlqAhVXxrZdYwAilTreai+xWiInhJKTieokxZWNF+0FNfus52xchRM4JBExpPpAHAZ9Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073942; c=relaxed/simple;
	bh=/8TbTg+Rq7g+nI2tGAfe3AOGwuVcjXQE+KjkEaEhDZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LuvHeHzzj0ejrM3KW+HOeOoIJ+ySjkppUdM2MK6xkL9Xgyfy7/EnI6Ktq+baz4JR2C7rslUrCk+PrpnaEHKzDepTrhXW3jy6x15yPrje/WuVYjvM62lkyTn7kjlcu5S+m/snTdvme0oPFUTrx+wqTAE4VStuKGq5zGiKmMBx+sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKXrRLV+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750073940; x=1781609940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/8TbTg+Rq7g+nI2tGAfe3AOGwuVcjXQE+KjkEaEhDZM=;
  b=mKXrRLV+KxhMIUcPw1VnzwIFVrmfDVUD+k4XzDaf3IbqwEuoUmoRZFJW
   lKsUFmJKV1CBY32uv//pZrbig3/M3x6/QE00xDgoy4tN8bR8dhTz1Ew3r
   zpKUaQTxxSV0aJLSQPHLBkCApw19CRA+HlnZk685mkpTsp/WgZrJwNOzv
   HbW/ovOEuufSMDl0I1x3bcE0zbWsGqb7M37wgaDGDhxE0V6eEnmx5L4xH
   d2uheBDlqZmvB4Qhf7i0UXpGxQ8esmMNMiyw3l1frKz1ErX93bsUNweb9
   n/kLYZMxXn86+3lwO90SYcfya8aNiLg+iimtDHHJmFm1isTuHbCtFnNlH
   A==;
X-CSE-ConnectionGUID: g0tL27b4TDq9ITwP91KGig==
X-CSE-MsgGUID: ZpJOSgMwQM6TWJc1E6DzSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39821618"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="39821618"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:38:59 -0700
X-CSE-ConnectionGUID: QHF3MIx1Sbm3cPmZqxp25Q==
X-CSE-MsgGUID: 2KQYlUUgQY6oxpvI+njcjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="149345151"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:38:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uR8An-000000073ou-0Cpl;
	Mon, 16 Jun 2025 14:38:45 +0300
Date: Mon, 16 Jun 2025 14:38:44 +0300
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
Subject: Re: [PATCH v3 12/28] driver core: fw_devlink: Tag the fwnode dev
 member as private
Message-ID: <aFACRPNCxYfZZp9i@smile.fi.intel.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-13-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613134817.681832-13-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 13, 2025 at 03:47:52PM +0200, Herve Codina wrote:
> The dev member in the fwnode structure should be accessed only by the
> fwnode core. The fw_devlink_set_device() helper has been introduced to
> avoid users to set this member directly. All users have been converted
> and use fw_devlink_set_device() to set the field.
> 
> To avoid future abusers who might set the field directly and allow
> sparse to detect them, tag the dev field as a private field.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



