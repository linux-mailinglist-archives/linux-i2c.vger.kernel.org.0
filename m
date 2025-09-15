Return-Path: <linux-i2c+bounces-12950-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEB6B57035
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 08:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F5403BC567
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 06:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329E827FD49;
	Mon, 15 Sep 2025 06:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7YN58jf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE017C21E;
	Mon, 15 Sep 2025 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757917641; cv=none; b=R+5dCVx7J+fpkcsM6NRg0uYqfYKrW/PmBJiDFGD68AtZMnaLGFhpsOsXpT3I2Ji4Eete4KiqRM3ZmM+zpD6YWg5gBBKvRFEEr7ii267vMwCPGsbRbRzDAAP8rGYEyBj59Lijahn0Sxdyk/CaE2usOeQFHNrnRguCmBpsNDyqqqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757917641; c=relaxed/simple;
	bh=+7q7jPwPjbSSzwQKlJbZwZyOv7o49lHFlmKWTQmST7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzZT5z/dECeKUXe/e2fuG/kAy8F/cJn6CYhvrcz8cz6W3CtoE51nYBnZL7N9UQacNkI5WwixMqjXhIFF8wuZIYCg+5YdDd3IJnUaLtlXf6C7VEJLx0i4k19ZhQYZUpxzoj5WW9RAGutYgCuJUrx4+ZmO6aWshpuz2m/yLdmZ6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7YN58jf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757917639; x=1789453639;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+7q7jPwPjbSSzwQKlJbZwZyOv7o49lHFlmKWTQmST7I=;
  b=f7YN58jftqotJSVnEG60dss4GDctSbVxOyAsrEr83FBPob3j1RxDBuzs
   VFk6Tv+ZIiytuT8d/9A/6VUqQbusZowvHyN6elxHNmVkzQS/DTElN0k/D
   rACMrPU6Tb3iun6VokKXFcEjGbgej8jUpoTy2Cu8Mn+WL1xeTbnBZNlF5
   Z2teddZI0IcW7vVAxdrHOT/yWRzDKOPpv+HnwjlBRg7N9cHZ71+tSSN5i
   OK9ggPEJyfVj6jpNgNXEJ+zQsln0u213C1o6BjQ3bE4Su+FbQjCqNTe8f
   uQ9pXV1ZAEH1xzrfn0qG3PKCWt8++c1GYzvJbe60dlG2KOi9VUBQ7ag2R
   g==;
X-CSE-ConnectionGUID: 1KrFXFH5SaOzT0eQdNUvhw==
X-CSE-MsgGUID: p22pNBjvQ2Gd3H5SuYO67Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="63983218"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="63983218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 23:27:18 -0700
X-CSE-ConnectionGUID: UJtIKqY8Q7GBgKa5FWJW5Q==
X-CSE-MsgGUID: +O4XCaT/TgKpHHXYIzO90A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="174349205"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 23:27:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uy2gC-000000036gJ-32Rl;
	Mon, 15 Sep 2025 09:27:12 +0300
Date: Mon, 15 Sep 2025 09:27:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: =?iso-8859-1?Q?Jean-Fran=E7ois?= Lessard <jefflessard3@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 0/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aMexwC-nB2IQEr8C@smile.fi.intel.com>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <aLgY1z-MvQbDBx2_@smile.fi.intel.com>
 <aLlgpUlHp7t8P4dQ@shikoro>
 <aLljGIcjAjQhC2uS@smile.fi.intel.com>
 <aMF0xW9rBrSK--Cl@shikoro>
 <aMSehiADcCEpfJUa@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMSehiADcCEpfJUa@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Sep 13, 2025 at 12:28:22AM +0200, Wolfram Sang wrote:

> > > > > It might be good to have an immutable branch for me from i2c core.
> > > > > Wolfram, can you provide a such if no objections?
> > > > 
> > > > Sure thing, I can do that. But there is still discussion on patch 1, so
> > > > I will wait for an outcome there.
> > > 
> > > But it seems that the discussion can be implemented in a followup?
> > > I think we are not in hurry anyway, so let see if it settles down soon.
> > 
> > I pushed out an immutable branch now:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/immutable/scoped_fwnode_child
> > 
> > Please have a look if I got the tags correct. Once confirmed, I will
> > merge it into i2c/for-mergewindow and Andy can pull it as well.
> 
> Andy, did you pull this immutable branch already?

Me? No, not yet.

-- 
With Best Regards,
Andy Shevchenko



