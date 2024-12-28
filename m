Return-Path: <linux-i2c+bounces-8791-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8E69FDC51
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 22:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3DBD1615D5
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 21:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552E319884B;
	Sat, 28 Dec 2024 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7BsXc7a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC27082D;
	Sat, 28 Dec 2024 21:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735421937; cv=none; b=PFpm5nR/LC4xemb/ukOyj8AbgAuBEakVeshYOgijhnZNmoV5TSV3n0cD6Bm/FdjFzXagM39DCiIhFVhYQwrBPO+vTg0AJXg18tP1+zO6k111ZHLhc3RnpqlExLhtzxWJEtDnSGnPmU7FshJzjnEBM/ivs0q51ssCm+dOWXpFJ6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735421937; c=relaxed/simple;
	bh=xdVGAXuXB8BIeBKE51APQ1NBE3ClDDMog+pNRvkkUGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaBzjKrMziI+tfMKRxpZC8vNVDAkvTmkakE18PWF6yGMeP8q4N89OMVyDP/an9B4HzzglCW7UmTul/btgEbOtPtx51pNRJGQwW7bpGA+ybgn9RPfLHKY47Szm80ytFD3xKTKkUwB0AlMB7M8hBb8xLPTwaVuUE7jWeWG3QtpZSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7BsXc7a; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735421935; x=1766957935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xdVGAXuXB8BIeBKE51APQ1NBE3ClDDMog+pNRvkkUGU=;
  b=i7BsXc7ajvtQwx1THPaa3XUSWFtzF6pEQA82tQ3rjB42uqF9ZaqEvb6d
   pgPHRNSxf9yKhmmVAmQH5X+2uue52qc3xWYNXK7WHGRCqRE9Vf+jUB2Qv
   58JBCWZLtj4z9vg9nzYq8XpwXo6pEj3xVjUP2Ob0qMQGlLaPuBgo/WV/Y
   7m6Litytmn9F2DkscYXiYSM/1uolgKmjDOhJWjeLJGjMbflfMRmfev0Of
   2CygQx6BlorPJD0LYibdgNso/Az5jKjcsHfi2yr+oj6eRAj6feUgk9v9h
   XOeXY2NGD6OuaR1b+90N2Xrx2hxBTkKQsi6XywYn10zOfGDVfOChbzahH
   w==;
X-CSE-ConnectionGUID: 2wGnDvLjQb6I4O/m8GLD8w==
X-CSE-MsgGUID: SRIgoxUhRuyq/oxz+9WmYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35031838"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35031838"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 13:38:54 -0800
X-CSE-ConnectionGUID: S5hi6pLpQYS8GXVO15umqA==
X-CSE-MsgGUID: R1lq69KMQz+xkmEfJBUbVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137776371"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 13:38:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tReWH-0000000DUM2-476C;
	Sat, 28 Dec 2024 23:38:49 +0200
Date: Sat, 28 Dec 2024 23:38:49 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: andi.shyti@kernel.org, masahiroy@kernel.org,
	u.kleine-koenig@baylibre.com, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] module: Allow DEFAULT_SYMBOL_NAMESPACE be set after
 export.h included
Message-ID: <Z3Bv6YhZMAzSLcyg@smile.fi.intel.com>
References: <20241228184328.5ced280b@dsl-u17-10>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228184328.5ced280b@dsl-u17-10>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Dec 28, 2024 at 06:43:28PM +0000, David Laight wrote:
> Commit ceb8bf2ceaa77 ("module: Convert default symbol namespace to string
> literal") changed DEFAULT_SYMBOL_NAMESPACE to be a string literal.
> However the conditional definition of _EXPORT_SYMBOL() was left in.
> 
> Instead just default DEFAULT_SYMBOL_NAMESPACE to "" and remove the
> extra _EXPORT_SYMBOL() wrapper.
> 
> This lets DEFAULT_SYMBOL_NAMESPACE be defined after export.h is included.

> Fixes fd57a3325a779 ("i2c: designware: Move exports to I2C_DW namespaces")

Incorrect format, and this should be a tag.

...

This patch in a different form had been already submitted by Uwe. So, guys, fix
the documentation or clarify it and when you agree on the approach, choose the
patch to review. No Ack till that. Andi, FYI.

-- 
With Best Regards,
Andy Shevchenko



