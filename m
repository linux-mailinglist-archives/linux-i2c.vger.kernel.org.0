Return-Path: <linux-i2c+bounces-3290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F08B538D
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 10:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EB08280C5B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 08:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBB11803A;
	Mon, 29 Apr 2024 08:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6Ec2h2Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514161805E;
	Mon, 29 Apr 2024 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714380876; cv=none; b=mecCNxW5vl3Aq4QfwIL0KrWnEECfpcdyNv3FMbeFP9qSsZ1e9vq/LU334TiajxdLRhtsNRA14eCJ8KbvH7CkQNHeSoKcnSrSni0pELcs8WZIFfw+zoEgCm3WuUlwyw9VTcvtMZoFHnVwToVvevNJJyQ8rMQlUff1x0kNmUpH77M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714380876; c=relaxed/simple;
	bh=LgXwXdChWO61g75cog3FG6NE/DrHS8/PurZcKabMWLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sj48zkTGtnuMJCK9KXMHI9GROFmkmebnidavX/EF4U3gMYCWq2Kyqim6QOAjsJ9GvJHuC+eYJmsUmab1wPUDCBFLoC7k19DhfbNcpU3RApNDapIkx/7CYlyvQ4uy7w07ru+bIP1AqQQXbz4pbX6SR7UtQBHsQZ4uwtXY4ITYXwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6Ec2h2Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714380876; x=1745916876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LgXwXdChWO61g75cog3FG6NE/DrHS8/PurZcKabMWLc=;
  b=T6Ec2h2Qem6/uN8XCPIH1o5YXaTTqYvL6heZ5MDcGKzcWeZ8F+7ZobHZ
   5xEGUKkXU1mtAapYL4M7IrgPL6/bnbfu4mQjLYreFwGLR2qOUeILIubkC
   ykS4PW6HwM2qqagcPjdn73OvAHdqmxhFetMAUR2gBQm8fZTUvv/qUG0Fv
   A3Y+9XoV0UZPrrzpkLsaizMqCvmBOq5ukK8a92RljeM+5CLqFqF2s32sJ
   2OwpKFPJfdTFxn89PimHGj2PgZnD4LDFsFQW9xTTiBJaTmczfAyIQyHEj
   nu2KrQBPo4UUXAELl0SE7hJkGJLdnw5QvW7g4+0Vlc927SHxI/yNtlw7i
   w==;
X-CSE-ConnectionGUID: I9/IUVmuSM2t+syNoVaXhA==
X-CSE-MsgGUID: cV5BfUxKTfavyPyU071sqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9955847"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9955847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:54:35 -0700
X-CSE-ConnectionGUID: f/ZKfK+ASX+z2lRCFktbHQ==
X-CSE-MsgGUID: Sfe6E7TBScGM2tawSxvrTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26455365"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:54:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s1MmM-00000002GIl-0HxU;
	Mon, 29 Apr 2024 11:54:30 +0300
Date: Mon, 29 Apr 2024 11:54:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH RFC] i2c: Add a void pointer to i2c_device_id
Message-ID: <Zi9gRVVw7qbKSL5k@smile.fi.intel.com>
References: <20240426213832.915485-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240426213832.915485-2-u.kleine-koenig@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Apr 26, 2024 at 11:38:33PM +0200, Uwe Kleine-König wrote:
> Traditionally a struct i2c_device_id has a kernel_ulong_t member to
> store some chip variant data. Some drivers use it to store an enum,
> others to store a pointer. In the latter case there is some ugly(?)
> casting involved. To improve that, add a void pointer in an anonymous
> union together with the integer driver_data.
> 
> This way a i2c_device_id requires usage of a designated initializer when
> the driver_data or data member should be initialized, but IMHO that's
> fine and you might even consider that an advantage.

...

>  static const struct i2c_device_id wlf_gf_module_id[] = {
> -	{ "wlf-gf-module", 0 },
> +	{ "wlf-gf-module", },

In such cases the inner comma is redundant as well.

>  	{ }
>  };

...

In general idea might be okay, but I always have the same Q (do we have it
being clarified in the documentation, btw): is an ID table the ABI or not?
In another word, how should we treat the changes there, because ID tables
are being used by the user space tools.

-- 
With Best Regards,
Andy Shevchenko



