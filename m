Return-Path: <linux-i2c+bounces-6779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26B979F4D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C41FB21B88
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 10:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BEC14BFA3;
	Mon, 16 Sep 2024 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QtlU5QUm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7614A4E9;
	Mon, 16 Sep 2024 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726482655; cv=none; b=CTlwNT4wHDj6Vu1P+6Cv2tKHTedK454kJJYRKTBjwVWgcErlRerZj7wyE8wM1M0ToQvsd7qXpJ6w7Wk+ZsDg6bNI5WmXfPAvv06Jw3FpXC6ujMFp9pJfYOBBm21zGy9pjoKFZvAzX6ZpQlyHPIdJowtmIZOPGmX93ZVE4ZN5Eto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726482655; c=relaxed/simple;
	bh=wFKfXga0UFnDlHx5OfUVMM6dkkUS8wk3gZy7iYHJugk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qngbxSWEE9FPZAoPQxqA4bJ8Dk1aLxa4B3q3JMYy1DtbYf4rqcULyumqCuzA1l6D8ilEYzXjGmq9XvmkHFwolwivL3TPpGk7A+KpGOH2LfvhS/IC6+6LvB3Qb4qd7cYzc6TVyqgRmMOvp3m9lDuQq9u70SEsQU0tOiymdKAlwqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QtlU5QUm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726482654; x=1758018654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wFKfXga0UFnDlHx5OfUVMM6dkkUS8wk3gZy7iYHJugk=;
  b=QtlU5QUmVGO3UTzkKu8iJYzaRjimVytVieeBIw0ATKGZeBMGNUNvVtPJ
   CjVBsYQD4qa2Wt9MfOXfcU29FY8weWZl1fEIMGTx10TD4ru1OreBOzShW
   mJzDCPF2VL9uTlXUzVFzc1P2WwxsbnkyGaT8R7gF4/CwO5Ldj1o6j3Ygu
   UOCGFAGMnxkx6Vz4i7I+YZoeim/mzESnVwKpRzvb2MOcVQObkclGCHRlB
   3X3bTnLVzDxz6WgHhsUAPIAIj9s2Ytnn3gWS9q0Cn4YMUaNfArW2w7L3g
   TKvkKMYFlVY4UKFKFR9YMWdeKSzjKJ9SV6xo0LOotF2+REz1x6WPGUeKI
   w==;
X-CSE-ConnectionGUID: FRJkYLHrT8OQCUHx8JQoiA==
X-CSE-MsgGUID: Sf25N+YaQEiKwH+xlp7D2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25397744"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="25397744"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:30:53 -0700
X-CSE-ConnectionGUID: xgsvsBEtRhOxHk4jGIWexQ==
X-CSE-MsgGUID: 7nEyrY8hSlaO6PndDy92eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="73206767"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:30:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sq90K-00000009QIl-42YM;
	Mon, 16 Sep 2024 13:30:48 +0300
Date: Mon, 16 Sep 2024 13:30:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 04/12] i2c: isch: Switch to memory mapped IO accessors
Message-ID: <ZugI2NCtaWKgcgh5@smile.fi.intel.com>
References: <20240911154820.2846187-5-andriy.shevchenko@linux.intel.com>
 <202409141436.QFCDQrRF-lkp@intel.com>
 <Zuf1UJ6K_8hL5x5U@smile.fi.intel.com>
 <leoyop42s4qmaytvwhwhpgfwfrkpm2xxabskz645r337jdjfml@zg5ql73tqidk>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <leoyop42s4qmaytvwhwhpgfwfrkpm2xxabskz645r337jdjfml@zg5ql73tqidk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 16, 2024 at 12:10:32PM +0200, Andi Shyti wrote:
> On Mon, Sep 16, 2024 at 12:07:28PM GMT, Andy Shevchenko wrote:
> > On Sat, Sep 14, 2024 at 02:56:19PM +0800, kernel test robot wrote:

...

> > >    drivers/i2c/busses/i2c-isch.c: In function 'smbus_sch_probe':
> > > >> drivers/i2c/busses/i2c-isch.c:296:42: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'resource_size_t' {aka 'long long unsigned int'} [-Wformat=]
> > >      296 |                 "SMBus SCH adapter at %04x", res->start);
> > >          |                                       ~~~^   ~~~~~~~~~~
> > >          |                                          |      |
> > >          |                                          |      resource_size_t {aka long long unsigned int}
> > >          |                                          unsigned int
> > >          |                                       %04llx
> > 
> > Yeah, this should be something like %pa, but the problem with that that it
> > always uses the same, fixed-width format with a prefix. We don't want this. But
> > to make sure we have proper specifier we need to introduce a temporary variable
> > and assign the resource start address to it and then use that variable in here.
> > I'll update this in v2 and send it after we have v6.12-rc1 is out.
> 
> Feel free to send it, I will apply it in i2c/i2c-host-for-6.12,
> that's where I'm collecting the next patches.

But I believe it's a material for v6.13, no?
From the whole series the first patch is only a fix, the rest is pure
refactoring and cleanup.

-- 
With Best Regards,
Andy Shevchenko



