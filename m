Return-Path: <linux-i2c+bounces-10172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D729AA7E4B7
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 17:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C76683BF0BB
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B071FBC96;
	Mon,  7 Apr 2025 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DU7LMSXz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E3D1F8AC8;
	Mon,  7 Apr 2025 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039126; cv=none; b=fYELm5K3hZpGmwZ1IfsAAS8YPlkYkKHnd72y5B+OnyRfmoOnZxMFhA1PVfPbPhfHzEY5oO7TA/yas0aznBkILnUzE6Wt4GO416CPl3hCtbTskQ4j+2ngNYiFGjSlU3QdZUuQear2OepJhfQpgojlqAIrwGeQ9pll8NYips2pqco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039126; c=relaxed/simple;
	bh=1NJRt6LbnYr5vWij5ePJd37xgMVsqCx9Jmee3+UErzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPUXFkRmPjjMcelQgsBbJKo4Q9O9Dt7ANFAEqj7B58pe4iO4wSulY5cXobcseoNMUaAk5ZsBUYIBREFAXbVuVU+14PXtIsl8I5G/o7jJDnVOrWctL9TK2fLvDN7bxLutQJ3JU7j+7C6qysUjwaz7mW3QXXiXbRjsylOh08TUC4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DU7LMSXz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039125; x=1775575125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1NJRt6LbnYr5vWij5ePJd37xgMVsqCx9Jmee3+UErzw=;
  b=DU7LMSXzVQ0IhGpaWq6cF7Ijliq/4CqjhNI+o84RMdHuamuLHB5Ey9yz
   XS+GMgaySFdudOvTn9rc9Q+U19oM0v54d7S5t5qkgUrxt1MoRVn5u6oOa
   a2BNhObG5pKJzteDJILXhkJ2BdMO0ou4kUoYa8XAq92xf+fIZrUZ0MNRv
   EbmseYNZc9+iQyrYFbf63LYUMMAJRO+4eB/lZKvfvyvS7iK2SL8pSvXpf
   HYy9dd4tdAc8y7JI8S4fEU52lZw4x1PO7VzJDzBQPV2+xzrx4nO3HJmaR
   v7dTqryxZPE0p/cM0vvDb0fWQZz2x48+zEh3nhNmCXJDDfCYC+cJVmNEN
   A==;
X-CSE-ConnectionGUID: qDyxW4JwTKSuOFYXOzg3GA==
X-CSE-MsgGUID: YVii639ZRGWT06tmRNUsPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="62978227"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="62978227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:18:43 -0700
X-CSE-ConnectionGUID: IqMU7/H/Rw+TqFJhz588Jw==
X-CSE-MsgGUID: TbsEHfwYSTaH3B2GpUiTew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127866370"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:18:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1oF4-0000000A6jQ-1MZV;
	Mon, 07 Apr 2025 18:18:30 +0300
Date: Mon, 7 Apr 2025 18:18:30 +0300
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
Subject: Re: [PATCH 03/16] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
Message-ID: <Z_PsxpQC-I5abp0o@smile.fi.intel.com>
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407145546.270683-4-herve.codina@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 04:55:32PM +0200, Herve Codina wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> From: Saravana Kannan <saravanak@google.com>

Same here.

> When an overlay is applied, if the target device has already probed
> successfully and bound to a device, then some of the fw_devlink logic
> that ran when the device was probed needs to be rerun. This allows newly
> created dangling consumers of the overlayed device tree nodes to be
> moved to become consumers of the target device.

-- 
With Best Regards,
Andy Shevchenko



