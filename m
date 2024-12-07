Return-Path: <linux-i2c+bounces-8370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85E9E81AA
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 19:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3BE71884446
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 18:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3F0145B0F;
	Sat,  7 Dec 2024 18:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqC+lazj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3A17E0;
	Sat,  7 Dec 2024 18:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733597178; cv=none; b=hMIYNr41D/6FW4jJ4MD2RmAzxi4dreSro5jJJwdNa1NiKq10BMS3dasdD9a5GqrWkJxTkENXYHz25Oy8X2GHJRf9G0hNF3mHJSIB2vRMiTBJYF0aSd60UCnV96GRqGchJKAg7lcrCFODcjrTqxdOdfUfqUD3oO5jX09/45Rv9X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733597178; c=relaxed/simple;
	bh=iNTpM0uciIluwC1zelCiMpLKwf6sQ0Jrd+U22cBSbz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQp6vOuKpzA0B58obb/8g3yVlkto2zdz6AVUqElNiZMGSx2rEPV7R0PViYvkLWRjU4UbphTfRtnFfWLt/Y0wSIjgsPaCLNpoysDnMiFq0oRQC0ddoZ+mXlaWIGMP37ArsDL4s4kRWfdBRSqZCb1nIDdEAlSjQL9yCi/oKVCVSRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqC+lazj; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733597177; x=1765133177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iNTpM0uciIluwC1zelCiMpLKwf6sQ0Jrd+U22cBSbz8=;
  b=iqC+lazjQK9RWl0HmjwNzuCrcWuqSPI5CyWuyKc+XUfzxZNUYyBkHubo
   eBVkG1AHkzhGOKcgYS23SDMbQsZaD+cvJwRV1HdwE7vMhzxM61flUpyJd
   bqHYHycyqIlvYoiKqXSdEWb6uVmsDJ3lJF6z5uIOKsEXo7XgYxWiVEdHK
   Xn2iSr8cwp4+4gNBHVpNl6N5jZwBaRcHSzZARlDRAnZYx3oIRoJTGmcSi
   q7AxqSZuJBwzJsKpIRl0U7qps5aqicT7ftJkd0NVxdcKP5ponZM/9yMFQ
   zQ/e5i2JugqePpnUQ2NkXtWDUK4OK8usDAORKVhh13zh6hVlc4T5iov/U
   g==;
X-CSE-ConnectionGUID: kygmimalQgGo1st7anZ9SA==
X-CSE-MsgGUID: k90sk9amQ6CvrUGJ7+tY7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11279"; a="37867057"
X-IronPort-AV: E=Sophos;i="6.12,216,1728975600"; 
   d="scan'208";a="37867057"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2024 10:46:16 -0800
X-CSE-ConnectionGUID: ZVJgYqBgQney1RAnRfEcPA==
X-CSE-MsgGUID: FHvvsqyoR/aBL18AiBF1kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,216,1728975600"; 
   d="scan'208";a="94892960"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2024 10:46:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJzoc-000000050nH-2zLP;
	Sat, 07 Dec 2024 20:46:06 +0200
Date: Sat, 7 Dec 2024 20:46:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	George Joseph <george.joseph@fairview5.com>,
	Juerg Haefliger <juergh@proton.me>,
	Riku Voipio <riku.voipio@iki.fi>,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Zev Weiss <zev@bewilderbeest.net>,
	Eric Tremblay <etremblay@distech-controls.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Peter Yin <peteryin.openbmc@gmail.com>,
	Potin Lai <potin.lai.pt@gmail.com>,
	Konstantin Aladyshev <aladyshev22@gmail.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Eddie James <eajames@linux.ibm.com>,
	Lakshmi Yadlapati <lakshmiy@us.ibm.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] hwmon: Initialize i2c_device_id structures by name
Message-ID: <Z1SX7pQpVa9UJ332@smile.fi.intel.com>
References: <20241205152833.1788679-2-u.kleine-koenig@baylibre.com>
 <89b8d605-c5ac-490f-977d-76315d6d5f46@roeck-us.net>
 <3qfvfqjp53yhfaf327rqyxzrrxrataawubetwcipv5dmrplsez@pe2ressulfxp>
 <403cc23e-db63-4091-932d-0ec82a32c52b@roeck-us.net>
 <Z1SXnV93Q_1iqM6q@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1SXnV93Q_1iqM6q@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 07, 2024 at 08:44:45PM +0200, Andy Shevchenko wrote:
> On Sat, Dec 07, 2024 at 07:32:43AM -0800, Guenter Roeck wrote:
> > On 12/7/24 01:13, Uwe Kleine-König wrote:

...

> > Something like that, though I'd even hide the parameter type and just have
> > 
> > 	#define I2C_DEVICE_ID_DATA(_name, _data)	\
> > 		{ .name = (_name), .driver_data = (kernel_ulong_t)_data }
> > 
> > 	#define I2C_DEVICE_ID(_name)	\
> > 		{ .name = (_name) }
> 
> It's better, if we go this way, to keep this in sync with above by changing as
> 
> 	#define I2C_DEVICE_ID(_name)	I2C_DEVICE_ID_DATA(_name, 0)

Or even NULL as the intention to use pointers at the end AFAIU.

> > where I2C_DEVICE_ID_DATA() would accept any type.

-- 
With Best Regards,
Andy Shevchenko



