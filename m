Return-Path: <linux-i2c+bounces-8315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2B39E2C02
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 20:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63CB5283C7A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Dec 2024 19:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EBB1FE471;
	Tue,  3 Dec 2024 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBTSkqza"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F74413B2B8
	for <linux-i2c@vger.kernel.org>; Tue,  3 Dec 2024 19:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733254062; cv=none; b=bfwgCL8njtZaY2/w/ZmTfeeCq+iZ0ntmibTHhj2gGV7irCVTGfi3ncJhNNC2osub4zIR1UEINttOIz/YwIsVECt/ZrIg09feYZhASw2ycABZAw8cPR3/L1XLfzDmVDtZAIK1FmO1U9tchJ2/BiFEuvjkkMS8dVpEOWFCZ8tlc5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733254062; c=relaxed/simple;
	bh=zPeqhNoD9zltTff9DejuRmSNhvS0V+5HXbUIoFwjb6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lS0kkGhHln/MHYinaIGeTL3RRDsZTHkxN6O/5I2bsyYtf5ZwggRUUjIlAjYMKd2y5eI13POHlaRAWB23UqQGjiCFTLLuKy24w62QoGLkWbdxygX0liQFIgOmUueGsF1jLGZ08Z4fJZU2M5W4Kvc1eAIsEEmRLquPN3RF/2Krm8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBTSkqza; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733254061; x=1764790061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zPeqhNoD9zltTff9DejuRmSNhvS0V+5HXbUIoFwjb6c=;
  b=FBTSkqzaAe09SBIJ+QR5lvA2WLYJzaCmLrcSI7Rd5q9at927lSdY+04W
   k89kLwmns921lz5oDgv2gl02jO3oDBFrWtlDbUN7Ef2fPcAvJlngabiLd
   XVaa7yieRSxQJWfNnKzxZnDEBNz9u7O6Ztu4LFCV6pfDNg2WcfN7pWzVz
   M+xrtnLII5I6vp6KXRFX1NklZf9mXsI7nIuK8YVxrlsD6YC+Ij8wI/AiH
   trdzlHLDLUPm9SulF4M9m7O3wfz+wIxZ8WjtO1JMYhqa1rux0rtG8iaM8
   EzSSIfo8q3i8kQf2t/aa3uqutE9NzMHt+tfVOF67M7+DwmQWxEPQIFrpX
   g==;
X-CSE-ConnectionGUID: ai/k4G7TQcCIr6cUJVmSBQ==
X-CSE-MsgGUID: +s4q/GSvTliVI0zVYuKcwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44103575"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="44103575"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 11:27:40 -0800
X-CSE-ConnectionGUID: mbTou+odTHWyb4C+BHAkSw==
X-CSE-MsgGUID: P2IJ59idSUOcmLIsvltE9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="124473910"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 11:27:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tIYYZ-00000003WwQ-418D;
	Tue, 03 Dec 2024 21:27:35 +0200
Date: Tue, 3 Dec 2024 21:27:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Actually make use of the I2C_DW_COMMON
 and I2C_DW symbol namespaces
Message-ID: <Z09bp9uMzwXRLXuF@smile.fi.intel.com>
References: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203173640.1648939-2-u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 03, 2024 at 06:36:40PM +0100, Uwe Kleine-König wrote:
> DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> is included. So move the define above the include block.

As in the other email I pointed out the doc says that we need to undef the
symbol. No need to move it around.

The only requirement is to place that before any EXPORT_SYMBOL*() we want to
add it to.

-- 
With Best Regards,
Andy Shevchenko



