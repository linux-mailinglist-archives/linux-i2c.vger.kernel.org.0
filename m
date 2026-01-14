Return-Path: <linux-i2c+bounces-15166-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9CD20148
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 17:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1B61300519A
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 16:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638A63A1A5F;
	Wed, 14 Jan 2026 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KW4+BFFW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C292D2E8B8A;
	Wed, 14 Jan 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406964; cv=none; b=GAxOsI51GfzPUAm+nTrbUjFfz7tTYSKh29ZQAgyhljuMVsGMrL/8K6TvqOA6GmjwJblM+n1oPNSU6VLLrOSzrXyFHfeUxfNvjZNZwGlkqDqrKiNCJ6Cb0ZLy7gWRqvwEuJgn79SPZs4ZmFTdQfDnu1ZZwDLUrOeDhS5Suy1KJLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406964; c=relaxed/simple;
	bh=lnykdJsaoXoddYZH2QXWogrKdq8g5ZK+lCSJELbzq7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdTwnXz5q+5F2DeEr+E61tY+7WAJsYB1UgSLmlv3WCXD72lCDXNueDmjJFxIOq1d89gxyth3lK/Vn83HX2I7z1k5O4ZPssVfAUtpvWeuQRUURUBa8z9qOaZhkSDcb2P9nmMnVTBeIcHldIRaBIQ0GIxm3jkYKpk6J6g0/4Oe3ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KW4+BFFW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768406963; x=1799942963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lnykdJsaoXoddYZH2QXWogrKdq8g5ZK+lCSJELbzq7s=;
  b=KW4+BFFWva6+u39Wt+ye8FVNO460BuamYNKZYlTMhxkzwU6knFL9OL88
   fzy28QORDqEzsZsqGFFbP6ODCrHw1JWdhKNrnST2lQC9kFAnhEsEs4PgP
   bnNxHgszHK4P2/F8rL82+4/mdt9cQ1936nOLr2jgfQkgHxC/ggVsQME6h
   CEqxOoqiPaI8BkfYD5v6xKrRcqaZIDMioGHt2ewZW0N3VQII67KnrJNlw
   o2XbcWtZbs/g1OxVnp04mWVYWsKfmHDCgaJ5af9m2I9+qmwizM5sTgAVy
   tluIhknJjrU6yZSdCvHpq8/uexcI4ymTC/bIWZ2hgnMfnKMZCGtofkMci
   Q==;
X-CSE-ConnectionGUID: w7mlxkOsQHm0X6d1USu60A==
X-CSE-MsgGUID: Z6K8YQpOQXSeshW6xX5DrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69685376"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69685376"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 08:09:13 -0800
X-CSE-ConnectionGUID: kECPqb0aQ9yExsjL7NcNlA==
X-CSE-MsgGUID: 7brrigsXT++TxdII1dwRDg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 08:09:11 -0800
Date: Wed, 14 Jan 2026 18:09:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 2/2] i2c: designware: Use device_is_compatible()
 instead of custom approach
Message-ID: <aWe_pcSm3tJZhNxw@smile.fi.intel.com>
References: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
 <20260114081954.252160-3-andriy.shevchenko@linux.intel.com>
 <20260114115304.GC2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114115304.GC2275908@black.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jan 14, 2026 at 12:53:04PM +0100, Mika Westerberg wrote:
> On Wed, Jan 14, 2026 at 09:17:51AM +0100, Andy Shevchenko wrote:
> > We use MODEL_MSCC_OCELOT effectively is a flag for comparing against
> 
> as a flag?

Yes, sorry for the typo.

> > "compatible" property. Use device_is_compatible() directly to make it
> > clear.
> 
> Okay but if something else ever needs this same quirk then we would need to
> add new entry here and also to the IDs list.

Yes, that's how DT works and there are, of course, examples all over
the kernel, first that comes to my mind: drivers/mmc/host/sdhci-pltfm.c.

> With the flag you can have the IDs in a single place not all over the
> driver.

Makes the reality harder to read. If I know that the same quirk is used by
different platform (in terms of compatible string) I will see it immediately
from the code. Flag is meaningless.

-- 
With Best Regards,
Andy Shevchenko



