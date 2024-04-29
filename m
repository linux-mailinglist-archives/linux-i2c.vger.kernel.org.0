Return-Path: <linux-i2c+bounces-3303-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A748B5D62
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 17:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 206ED1C216EC
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 15:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3888F12880D;
	Mon, 29 Apr 2024 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B2C1DZH2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909086130;
	Mon, 29 Apr 2024 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403844; cv=none; b=onLaUB51DV9TFzhhmTiobPpbjFdWr6RG1zsBYRQxYW5d3wH+P0cu2G45jaD9vlhjOyU54uaCwhXAjJt5d2QYOmhn9h1PxW9lK6ZDZk0lS5mgKERF1qUl8GztsnrM4V/ZPfVTl+bE4ec3h7sz1l3Rhp+B0trOFMCAD7TAOU133U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403844; c=relaxed/simple;
	bh=gcw4tAEHnDPg4H7jhkmbcIBrLHMFwk1v1DjumSngLac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ID1g8Ja5YBuZS0l4NNwIFn1c7Y8PG0XPaiBrx4hZE0X9iOW7pR0uXdSXuCoMU7+iCnJ6d7++yI5j4vkGB1bNdTuyjn6DefykW9Yh1Zw/d+dS9Au+po2SPYpwMNMldrxDcKxBRkE2EYzCJGZxR+RSBYnuiYPWdZrP7mw+aXHgN80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B2C1DZH2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714403843; x=1745939843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gcw4tAEHnDPg4H7jhkmbcIBrLHMFwk1v1DjumSngLac=;
  b=B2C1DZH2KI9i9VN6cHfVUxAoT/AfGqUhrG/L4fIElGFU0Ynq5MOnXW/j
   P+rPfJstcfvAZASm+6SyNdrk7PcwAqLS6RfPaQz0KnmzCWFQr3FqPx4tb
   HnPJk0ja8sv+IhsOPha3QlDpSLJtixaw58pHEEjfja2Bve+PSAmSuNpqz
   fuD1Xqt/w27koYM+mCh+imlWazIyxrcnn00dlq8il/P1yf6Vq03VTA8Dg
   AodmVpz5m1X0DsCGjYaMuzgeOedeQ61GrdQD3xyHiv2tulsfd+tBQBosw
   wxmosGKd3anA8wGknvLYnPrRP4Krfhgyb8o13RwAk5XSelqcdoOB0isyb
   Q==;
X-CSE-ConnectionGUID: EqwihosyRraR/m005cPgPA==
X-CSE-MsgGUID: XrQA2XY3R7ml61kHkVm6yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10187939"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10187939"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:17:07 -0700
X-CSE-ConnectionGUID: ez+scYRsQvCgPbK1VvLvWw==
X-CSE-MsgGUID: ON95rIXwSfaWO30afqk2OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26098680"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:17:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s1SkX-00000002NkE-1xWk;
	Mon, 29 Apr 2024 18:17:01 +0300
Date: Mon, 29 Apr 2024 18:17:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH RFC] i2c: Add a void pointer to i2c_device_id
Message-ID: <Zi-57cHtEelQiVEg@smile.fi.intel.com>
References: <20240426213832.915485-2-u.kleine-koenig@pengutronix.de>
 <Zi9gRVVw7qbKSL5k@smile.fi.intel.com>
 <youkuwbynndjpcoux2zaxwjp5gquj647leub3bat37a4wtho6p@ypir6ay3vhaw>
 <Zi92UCnZa90DXAI9@smile.fi.intel.com>
 <f6ddimzsqjuweaeagsmnfowcktofngjrafosab6owxj4mxkulk@2f6mg7wfdk6p>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6ddimzsqjuweaeagsmnfowcktofngjrafosab6owxj4mxkulk@2f6mg7wfdk6p>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 29, 2024 at 03:55:57PM +0200, Uwe Kleine-König wrote:
> On Mon, Apr 29, 2024 at 01:28:32PM +0300, Andy Shevchenko wrote:

...

> OK, agreed. I'm not sure yet if I prefer
> 
> 	static const struct i2c_device_id wlf_gf_module_id[] = {
> 		{ "wlf-gf-module" },
> 		{ }
> 	};
> 
> or
> 
> 	static const struct i2c_device_id wlf_gf_module_id[] = {
> 		{ .name = "wlf-gf-module" },
> 		{ }
> 	};

Personally I don't care, but it seems in such cases the .name is too verbose
for no benefit. If one needs to expand this with driver data they will change
that line in any case.

-- 
With Best Regards,
Andy Shevchenko



