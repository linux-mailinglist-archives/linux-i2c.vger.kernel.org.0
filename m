Return-Path: <linux-i2c+bounces-8369-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC529E81A8
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 19:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A4031884467
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Dec 2024 18:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D173014F9D6;
	Sat,  7 Dec 2024 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQMXFluq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E06414A4C7;
	Sat,  7 Dec 2024 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733597098; cv=none; b=XA7+kDWXwKv9rD8y122Z/5fFA/DYV1LIIBK51lJCvS3TdtgukYPXN1RIsFDs7Opp4Ky5bQjO66+9EixLutbqbKp0bVEvRsc8NVGiNUF+brwcYOXoJGeDEp6UqeAwhws0pvXxFd2RxPfyVLm1fa+sQfTOnF9Jo/BPgHMQ4PS2X/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733597098; c=relaxed/simple;
	bh=1OCUMsUsBHGBiB/NBmZwv055NhvptTuYSGnvOFoi0vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGj67cfoZe0ITzvaanloiIKT+OoPuVnd2CzpVCUuAlwkNmle1EN5V2Pn6FbyFaK0n5S65EG/bhsP4MoJpfiKDto7+uWkBPNVbHjvJZLgGpApUnffy0jjA4YNIlukenX5cU0VD00OIFzrXwYVg82+Pu2UG7b8f8zpAFtBfLTP3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQMXFluq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733597097; x=1765133097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1OCUMsUsBHGBiB/NBmZwv055NhvptTuYSGnvOFoi0vc=;
  b=LQMXFluqKmS282bv5MDmUoYuTC3Zf4YM8o5GjIWmm9iKNkRXJRhhgQ0j
   YBWHXfOI7wMPFdZEn0n0hYz/EeD8/y7uFU6Ebawn0fRLsrNCe9MEDPyB4
   UFQ/OzrITWCOBPW9Rttn8slHsA+PMap0S1k98oJfwggg8VXPPTbCGqPwp
   kzf/7szZEeEd9LWSvb9Pqf6C0Vd2yEXvnYdN1EyIeXFW431A/ARTSDNAm
   xrvO/LCvU0M5SkDAxhuHTAz5vmSBN/NxY3fBV6vBZuqKzAuZK1GBwUgz3
   OTF9tFYBnvRE9wgX1r8FYgxX7Pi7jUjYiKsv87gaVy8ZhJYZwduIYIoD9
   g==;
X-CSE-ConnectionGUID: WO0I8ak9TVqg/45Ckii8LQ==
X-CSE-MsgGUID: QFsVYTAsTVKAjxv1RgH6hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11279"; a="45339316"
X-IronPort-AV: E=Sophos;i="6.12,216,1728975600"; 
   d="scan'208";a="45339316"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2024 10:44:56 -0800
X-CSE-ConnectionGUID: GzvtPNGwT9Kxw53YiXCkOQ==
X-CSE-MsgGUID: //qPxZHJRF6Y35uZzYP1UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,216,1728975600"; 
   d="scan'208";a="99763432"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2024 10:44:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tJznJ-000000050kl-2YSz;
	Sat, 07 Dec 2024 20:44:45 +0200
Date: Sat, 7 Dec 2024 20:44:45 +0200
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
Message-ID: <Z1SXnV93Q_1iqM6q@smile.fi.intel.com>
References: <20241205152833.1788679-2-u.kleine-koenig@baylibre.com>
 <89b8d605-c5ac-490f-977d-76315d6d5f46@roeck-us.net>
 <3qfvfqjp53yhfaf327rqyxzrrxrataawubetwcipv5dmrplsez@pe2ressulfxp>
 <403cc23e-db63-4091-932d-0ec82a32c52b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <403cc23e-db63-4091-932d-0ec82a32c52b@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 07, 2024 at 07:32:43AM -0800, Guenter Roeck wrote:
> On 12/7/24 01:13, Uwe Kleine-König wrote:
> > Hello Guenter,
> > 
> > [dropped Jose Ramon San Buenaventura from Cc: who's address bounced]
> > 
> > On Thu, Dec 05, 2024 at 08:27:15AM -0800, Guenter Roeck wrote:
> > > On Thu, Dec 05, 2024 at 04:28:33PM +0100, Uwe Kleine-König wrote:
> > > > I intend to change the definition of struct i2c_device_id to look as
> > > > follows:
> > > > 
> > > >          struct i2c_device_id {
> > > >                 char name[I2C_NAME_SIZE];
> > > >                 /* Data private to the driver */
> > > >                 union {
> > > >                         kernel_ulong_t driver_data;
> > > >                         const void *driver_data_ptr;
> > > >                 };
> > > >          };
> > > > 
> > > > That the initializers for these structures also work with this new
> > > > definition, they must use named members.
> > > > 
> > > > The motivation for that change is to be able to drop many casts from
> > > > pointer to kernel_ulong_t. So once the definition is updated,
> > > > initializers that today use:
> > > > 
> > > > 	{"adp4000", (kernel_ulong_t)&pmbus_info_one},
> > > > 
> > > > can be changed to
> > > > 
> > > >          { .name = "adp4000", .driver_data_ptr = &pmbus_info_one },
> > > > 
> > > 
> > > How about introducing a macro for that instead, similar to I3C_DEVICE() ?
> > 
> > OK, for now we'd have then:
> > 
> > 	#define I2C_DEVICE_ID_PTR(_name, _driver_data_ptr)	\
> > 		{ .name = (_name), .driver_data = (kernel_ulong_t)_driver_data_ptr }
> > 
> > 	#define I2C_DEVICE_ID_ULONG(_name, _driver_data)	\
> > 		{ .name = (_name), .driver_data = _driver_data }
> > 
> > plus maybe:
> > 
> > 	#define I2C_DEVICE_ID(_name)	\
> > 		{ .name = (_name) }
> > 
> > for the drivers that don't need driver data?
> > 
> 
> Something like that, though I'd even hide the parameter type and just have
> 
> 	#define I2C_DEVICE_ID_DATA(_name, _data)	\
> 		{ .name = (_name), .driver_data = (kernel_ulong_t)_data }
> 
> 	#define I2C_DEVICE_ID(_name)	\
> 		{ .name = (_name) }

It's better, if we go this way, to keep this in sync with above by changing as

	#define I2C_DEVICE_ID(_name)	I2C_DEVICE_ID_DATA(_name, 0)

> where I2C_DEVICE_ID_DATA() would accept any type.
> 
> > When all drivers are converted accordingly, we could change the
> > definition of i2c_device_id in a commit that only touches i2c core
> > things to introduce the stronger type checking.
> 
> The stronger type checking would not be possible with that, though.
> Does that really add value ? I personally prefer the opaque style where
> driver users can provide (almost) any type they want/need.

-- 
With Best Regards,
Andy Shevchenko



