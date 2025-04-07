Return-Path: <linux-i2c+bounces-10173-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90606A7E49F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C3B84253EA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240871FC0FB;
	Mon,  7 Apr 2025 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/cufWRQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7711FAC56;
	Mon,  7 Apr 2025 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039213; cv=none; b=rJ9g7c1hKghoDoZAjMhEE0SD9HXGH5MNPADxd6YWh5NfVKXKNuvVU4W4o/Xu6hBHJfjiPsvkOotZdj+bYAqxUv4MNlaMjFdzXjB/CgkwnCdmXgbFg1ezKMWA0PTgIZeIQzOoiU+ORge7dCQbie88c4rIJ3zic6HLZpBIzce6bEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039213; c=relaxed/simple;
	bh=dX1ZFgHNg5lDyS784SIlmHAz22dZyAAbob2jUM2Ek90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYULyaiLWKmRPkVylSQuLmxdGO1Ta//VmrzNY9JsabiMUntHcZeo707ip0Ppkw+fnxqNO/IE5Jblg2tEV7FboAGW/M8SlI09EnAEI3/0nzyOZ/BpuQM0m4Lv3z6y4crVECEGlVnXHMxrenSDuXcMuJfIxraduPJQnk8odQqnBlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/cufWRQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039212; x=1775575212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dX1ZFgHNg5lDyS784SIlmHAz22dZyAAbob2jUM2Ek90=;
  b=K/cufWRQ7m9Cs10VAmr4ycvMw8eIm1kLlDthEHQvkxPpGPnbkbKxjJCr
   IsQGjbl5X+yJrxAAIEjW9yo+uRqW0u4fIwfH/DNDoYgWItPtRFRXUyGTk
   pcg8FUJ3zfgJ40qgqQTq3SnrhIkMLfjys7tWBYoilqqDDJde5ScQgZWdo
   CUf9ygIeOElRzBjg023jECpcmtRtqdxvPQs1shToAVXsB4Wb2cTyyOB7Y
   dqQXTt40+88QHuursTkjjIbE3Fp8dbz5MLkOlKlejR4yjRjqGwDaUDjI4
   dEw0cADisMQKd5njoVqBcWY2FirxDIs5GfHeikQClLdXpF5ogehD5D1yv
   A==;
X-CSE-ConnectionGUID: MfhF2akXQKSAlORHIfwbSA==
X-CSE-MsgGUID: jdfQhJiTTT+r0FRS8qn6WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45600508"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45600508"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:20:11 -0700
X-CSE-ConnectionGUID: MwgiB73sS7uhuB6NDR48/g==
X-CSE-MsgGUID: a1sZoUvtTligUrhNsq7h8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132712384"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:20:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oGV-0000000A6kZ-3EWX;
	Mon, 07 Apr 2025 18:19:59 +0300
Date: Mon, 7 Apr 2025 18:19:59 +0300
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
Subject: Re: [PATCH 02/16] driver core: Rename get_dev_from_fwnode() wrapper
 to get_device_from_fwnode()
Message-ID: <Z_PtH45Zt1P_r35z@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-3-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 04:55:31PM +0200, Herve Codina wrote:
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
> 
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().

+1 to the change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



