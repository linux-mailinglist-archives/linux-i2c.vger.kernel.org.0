Return-Path: <linux-i2c+bounces-8156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAA09D6036
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 15:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 489B7B24458
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 14:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240703BBD8;
	Fri, 22 Nov 2024 14:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfV6R0FI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8765B4A01;
	Fri, 22 Nov 2024 14:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732284828; cv=none; b=c/YPhtFvQpuMiEjZCWFgrYUQtQS/jLrVjXbLFRxl7QGcmcNaoQ63lUxoint4/H8RIWah2eOCKbBw1oSNsYKebA+9rTGk9cx5psgVj0jmm2NJkbVGDHPeoUDMm35n9I6Kv3PmvOVyIR+SekP+NzezcS8BgpYrpXOefymESJdkvm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732284828; c=relaxed/simple;
	bh=tC/OWioCUX/fp6QqWFU9Xo4YC5HhhdV5m4rgzkWdOZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzUFCUp2sCl+eme0oMEsMzhJMjT+0Jsz1yWlG6hAWdlAv/syr5sOQxTL77WHvLz3JMliwNWlBDamHofw4nqULsvU79PbnewuIn3RrEKn8B7hKRv/g680hN1AlzP1fqUQcQDL5fWMYf4v8mdFCsW7DJO+0z5Z1RrEV1T8bn6NqX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfV6R0FI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732284828; x=1763820828;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tC/OWioCUX/fp6QqWFU9Xo4YC5HhhdV5m4rgzkWdOZY=;
  b=nfV6R0FIWAEbrHEP2Mrp7nfddNVkvWv5ZprMqfMjJOVB0lvj0TiFYyzi
   vaQFKtiR93OmyDCPnTj4GgaxDkpAZSvBJjDL33EQpugHiY2a1uBe0tx9W
   e28FbUqgltYJrLaWaznvJRKJ1ZelOyRr4eR119WkgJCS9ddZJ903QYPGS
   1CuXCSP66c1I98gbP6R0R2KNDEGZKSYtRBYEnoEliLFt9yWB3T5WPt5uM
   BBLR1nT9YSaJklAK5qP7yB8KLKGzlwv8i4arcWqePpZbq9GKUhvgyy0Bg
   JUP1Diz/41mPzX02cMqis8djhhPoaKLNpkdVJJakZKbGbOLUhZbvf1ueo
   g==;
X-CSE-ConnectionGUID: VuPifvZBQKmqVq7gCtNm5g==
X-CSE-MsgGUID: x+gw3WqET8anDrSbQDDOPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32302664"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="32302664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:13:48 -0800
X-CSE-ConnectionGUID: TSzuK4itT7uwGIE5SU9gLQ==
X-CSE-MsgGUID: NbRFCr5+S1SZIMX3pTB90g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="90226536"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 06:13:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tEUPl-0000000HR60-2nLE;
	Fri, 22 Nov 2024 16:13:41 +0200
Date: Fri, 22 Nov 2024 16:13:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 0/3] i2c: atr: A few i2c-atr fixes
Message-ID: <Z0CRlaNtKgApH9SI@smile.fi.intel.com>
References: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-i2c-atr-fixes-v2-0-0acd325b6916@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 22, 2024 at 02:26:17PM +0200, Tomi Valkeinen wrote:
> The last two are perhaps not strictly fixes, as they essentially add
> support for nested ATRs. The first one is a fix, thus stable is in cc.

Other than SoB chain issues, code wise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



