Return-Path: <linux-i2c+bounces-12536-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB860B3DE33
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 11:24:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13735189E42A
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 09:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D5030DEDC;
	Mon,  1 Sep 2025 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iBxl9iBh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D5D2E0417;
	Mon,  1 Sep 2025 09:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756718469; cv=none; b=ZS7mIT0LCaF6rVjNsOhtxorOh1OwK7Tl3IC4KhDs+sd+TWYpkEOD0e6lQP5q34CTAXb+0VDw9b79H+eytehMuaVMkXgoVbjwSLHX35QhIhsigsLmwypcvhPigixMekuxuEIQTnkNjGij5jr/3zWCx9F7JRQCuLPkwFX8/u7Ab0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756718469; c=relaxed/simple;
	bh=ls5u1XePOINQwXxs0U11TUbZVLbAaL/foUkpem7uo+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOjkTz2ZUOR9xOSP3is28KHLdpdyKViUvsfOHrZ7z2/WibJ3d/R/jsdfdZR2SgRxbsiNhGV+WxVu0UeICYWYzn9YtSAZrz+ZMy5w0lAVTEaGfZzNdKPKhu6sK0LAyj4/guZwXd+5UhdskRWyRnc0KT3P61k2PbsjCKsNkX0L8cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iBxl9iBh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756718468; x=1788254468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ls5u1XePOINQwXxs0U11TUbZVLbAaL/foUkpem7uo+s=;
  b=iBxl9iBhJLh5KXm+nYH1ZsTNv2YcocyS5eA5JHXoWIuNSwpDB+tS4LlD
   4MTOworazD8UjvbMCxHosklpde5F3ZHvcGlqK6T6vnw5eR9O6XPG0CWmZ
   oWCY4ECLc96l4Vn4+GsgBptd4M4O7KDaE0VTrqKlc6KMCyfMB9CGeuKxF
   yrCSDLXLwvjYeNydHHROiaklE2Uqa+JTGJIQyZd4sbXaEIN0rMFazICiS
   te2SZmZCjCJN9nqrASG+ydvRous9WHBqC5VCgiDdt/FaZ6ViJ1BUp0C8F
   YRMzLqTjHxR8EAsGZCRuikx9vgPuk8NmgoX7j+vApw7fk0199kZ5CM7ou
   w==;
X-CSE-ConnectionGUID: FmpkWQLYRGib8s7BlrJhKQ==
X-CSE-MsgGUID: U78szqvvTvGc8xHo/8XZPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62803587"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62803587"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:21:08 -0700
X-CSE-ConnectionGUID: V7X8rnqMS3ueJLy+SCkyKg==
X-CSE-MsgGUID: MLlgXYFpQ5GnCrnqMVziLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170823305"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:21:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ut0ih-0000000AN6Z-42sq;
	Mon, 01 Sep 2025 12:20:59 +0300
Date: Mon, 1 Sep 2025 12:20:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Linus Walleij <linus.walleij@linaro.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH v3 0/2] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <aLVle-fEMXlQlDR-@smile.fi.intel.com>
References: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-i2c-pxa-fix-i2c-communication-v3-0-052c9b1966a2@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 27, 2025 at 07:13:57PM +0200, Gabor Juhos wrote:
> There is a long standing bug which causes I2C communication not to
> work on the Armada 3700 based boards. The first patch in the series
> fixes that regression. The second patch improves recovery to make it
> more robust which helps to avoid communication problems with certain
> SFP modules.

> Changes in v3:
>   - rebase on tip of i2c/for-current

Hmm... Why not the i2c/i2c-host branch? (It's Andi's tree)

-- 
With Best Regards,
Andy Shevchenko



