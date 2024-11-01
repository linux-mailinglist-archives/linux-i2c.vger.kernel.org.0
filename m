Return-Path: <linux-i2c+bounces-7714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D730C9B9116
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 13:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159561C21146
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 12:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369DD19CC2F;
	Fri,  1 Nov 2024 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3NgfEa9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E15C13C;
	Fri,  1 Nov 2024 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730463879; cv=none; b=PSUDmxrc6QSgH6hl7Eww6XxsZMZlQCITv4eF/ffBfroDcAISsGKDHbfbqY/3AFytn7Yd5FSlzMBHxJjWROfjO5iWU8hBW+7lTbSs6KSl4BtrkiC/KNENXqgCBAcSxsOGdd4GHD1pbmLFDzxJA9Lq8CUnDRaAJINtKj4A2pWDss0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730463879; c=relaxed/simple;
	bh=C+MdUAnhR6ex2yYgSs1ROjqZ7Ez3NWZW6GnGb7t8p6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRm4j9Oac9eHDTpkmh9LGOoMFZdS8R/A/ow4IQVByTvsMDKLWMGBX3hVPNIgbgzYaEhqmNo6PLKhfo+gZDODweSBNLWhv9A0iouwH1qsR9vfR+Vi8AKRv6zQ0Y4SEWxdvJtikzfXf8hZp+50p04jyEtYw1U16lswfDGeCXLuV/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3NgfEa9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730463877; x=1761999877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C+MdUAnhR6ex2yYgSs1ROjqZ7Ez3NWZW6GnGb7t8p6s=;
  b=H3NgfEa91VJCSahl3pxnE6arzKulTt2BdXDoVtKBH6jXXf3WfbnhvZu7
   j7o4S4meDONPOLORwYM+cV16WPUvI55hq3vIRF/ZlXrAsob/Dw0DusUGO
   LRf4hrUET+Fy3q4arNUvm2XAmNkdITAQI0uTJFExy80p5j+vxeN45WI+T
   oSbwq+FDsb7V3kXSXWVlPHJ42aGty6X7uWyilzizUEMvWHe3mIx7ScABN
   v7eHz3wADIMySk6HO6caYhNIpSijzrAZIGcHN80DYg1RXUEeHhr1Qg9C0
   b9ixZgtXugVZ0wX1GMc6NGCgXUB1f4HfoRopoROyeVAtCipkiW2eJy1zk
   Q==;
X-CSE-ConnectionGUID: JnP9LkP4R0e58btx8CBnfQ==
X-CSE-MsgGUID: qpivqwYxS8uU/yQzSW5Jzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="41593179"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="41593179"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:24:36 -0700
X-CSE-ConnectionGUID: 19MA8tV+QYCIA3XAudwDhA==
X-CSE-MsgGUID: GU4DRLkgRIa/7ceNg2vQ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="87762043"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 05:24:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6qhc-0000000A1fc-13Oi;
	Fri, 01 Nov 2024 14:24:32 +0200
Date: Fri, 1 Nov 2024 14:24:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v1 1/1] i2c: Use *-y instead of *-objs in Makefile
Message-ID: <ZyTIf8l1ghcyzJUH@smile.fi.intel.com>
References: <20241018150337.2182181-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018150337.2182181-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 18, 2024 at 06:03:37PM +0300, Andy Shevchenko wrote:
> *-objs suffix is reserved rather for (user-space) host programs while
> usually *-y suffix is used for kernel drivers (although *-objs works
> for that purpose for now).
> 
> Let's correct the old usages of *-objs in Makefiles.

Any comments?

-- 
With Best Regards,
Andy Shevchenko



