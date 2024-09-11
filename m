Return-Path: <linux-i2c+bounces-6587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CCF9757F2
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 18:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 120AD1F23B2C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 16:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F941AAE01;
	Wed, 11 Sep 2024 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fUPYnjGQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0987224CC;
	Wed, 11 Sep 2024 16:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726070827; cv=none; b=rIHBjFLnIDxzkIT+BViNAjLGpVoRMv9BCclyqJtjMGZqU8M1Kdlu7jiwBRa2LLC1tNO+scucNdOVH9onwqh5/G3+ppFykZG8BvWnS6bRhHDd8sva9WwpTntLxrEY6+hWteLPhzvyz5wSZPEuSnIgbTgWp/r/oYXI2zuPYWT9z0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726070827; c=relaxed/simple;
	bh=woCqzjgKPLuQc/CyCNxI48JyV25/iWpRGAW6/RK+8z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQ/MFyom2J08kNxs9hUcGVNI7lbjfjorn7b2u/yZU6UWAqoyg4oWmBuyd0yPObtNp2qvnANb2J3YwXBARcvZc3RX6EQVo/8LZFGUHIl3Bk+W/e+IFaAbULevCm0Y7ObggYamethelDBFaSGxE2RbHjSlmV9QWcCVyMH0DBZP+Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fUPYnjGQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726070826; x=1757606826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=woCqzjgKPLuQc/CyCNxI48JyV25/iWpRGAW6/RK+8z8=;
  b=fUPYnjGQ78jNuArKpDZD/wHZqnNjTV0UYqwIrZsLBV3U2bmWrqLmVYBO
   t9nW/qdrUohXGkPLxGMe6wX1o2+9UvGVFAJOdygl0t9Sf1WrXAPwn5+Z9
   ji4oKUBXnxlUDKWCIKQSZbzMcxDb9eJaGft7D6G+ko2VoRTN/fcIURo7R
   7Iw/X54Mtl8I/knFNCfMTpMCy5E+ExmFad0FaUI8gp3y/YkSpThXrUdPB
   prPT4KLmBYpj1zv0bcDS0DqJqequRaUkO/yhtumzbTOGtAMl/FeNlxZdM
   16hzkFvFtVq4FsS9TecwhFvbFnGX6argonKzAsVwSpKmiFJr1AVoQImen
   w==;
X-CSE-ConnectionGUID: PQRRZ5wNT/2aSELj1JKr+g==
X-CSE-MsgGUID: r/wUQuMLThSwrtRpT3vERQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42397471"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="42397471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 09:06:58 -0700
X-CSE-ConnectionGUID: JlOIlOL8QZGlOchz6RNNKg==
X-CSE-MsgGUID: 53k3lsP+T6KA8Wv5Fuh1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71795153"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 09:06:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1soPrZ-00000007cBD-46zZ;
	Wed, 11 Sep 2024 19:06:37 +0300
Date: Wed, 11 Sep 2024 19:06:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jesper Juhl <jesperjuhl76@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 11/12] i2c: isch: Prefer to use octal permission
Message-ID: <ZuHADXmd5vrWUsNN@smile.fi.intel.com>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
 <20240911154820.2846187-12-andriy.shevchenko@linux.intel.com>
 <CAHaCkmd_HWCgyfiAV56VgENgMaS3kG9cz5CPrUzyiVoy0y1oBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHaCkmd_HWCgyfiAV56VgENgMaS3kG9cz5CPrUzyiVoy0y1oBg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 11, 2024 at 05:53:44PM +0200, Jesper Juhl wrote:
> Personally I find this to be *less* readable, but maybe that's just me.

It's just you :-)

checkpatch should complain nowadays about non-octal permissions.
It is documented here Documentation/dev-tools/checkpatch.rst.
IIRC it's added after Linus' rant on them.

But nonetheless thanks for the review!

> On Wed, 11 Sept 2024 at 17:51, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Octal permissions are preferred over the symbolics ones
> > for readbility. This ceases warning message pointed by checkpatch.


-- 
With Best Regards,
Andy Shevchenko



