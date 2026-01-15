Return-Path: <linux-i2c+bounces-15176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D558D23CFE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 11:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0053830101C5
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 10:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ABE30E83D;
	Thu, 15 Jan 2026 10:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EuZt7Sfj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64BB2566D3;
	Thu, 15 Jan 2026 10:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471610; cv=none; b=pEf+GcDcM/0RjZA2JaC00yc7PnsnsQbJRsSqJ4ajaX5RqbwZfDwsTILQa+L27sfP8tDLTEFVgsdiD2WzSd+OUoCXd0LGhfWSOp27ZIwTzQbWZCysBLz91YaFL08ylGY0mbcNNTOXg8BJoXc8LZdWhm/whfJOK9/bse11abVMLwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471610; c=relaxed/simple;
	bh=KCAW5eiVWMGOHA0Z2VZ0FOoHgaBvZmUDDKniMkc1KC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afgRhFgy0je5ROjBUA/qTJ+njnWw6BzE9EKMHPgoP56lSPy1UGacdLzw/OVy2IHgeW4jA9Z8KT4f7oXJXgMBD9znlL5W94ZpcMWSQE3XaY+vPfSxIisacxPAa0HgcACnK8d2ORjK8cKJpXMaLqgya2zfjTUVUJ1A25dOJeNiRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EuZt7Sfj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768471609; x=1800007609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KCAW5eiVWMGOHA0Z2VZ0FOoHgaBvZmUDDKniMkc1KC8=;
  b=EuZt7SfjosGDYag14iwpe+K2mKJmZxyhX93RrZpVu78rN5OZciT83oZi
   ut3U0ATApO+pXd6OWm89+DSpm59SVprQnF6Wz4wrO1/pbwOjJwnShwNeN
   DK2NBl3s22PEboj4V4Sr81e7kMTF7T3WNqFgpVoC5rp03Q1hwO64THppH
   MAbLcva6DOs/8kLi5SK30ehf57TC1cHuI5rFU92m3MJQtVI1wyhuKaxwC
   PDhIrAQXPdF1AWqnntOxCsyINbjNqXFCQebM3zf+kk841dStPCupVFbvd
   jWoTja+iuvC0mbJdtBUEUQY87yWlunBdIyE0lS4hceHHdhvazBsFt3ZIa
   Q==;
X-CSE-ConnectionGUID: aWU0ct0GTnGArN2VOAVggA==
X-CSE-MsgGUID: xO1Wy1caRGyzfcvjEEoAZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73408783"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73408783"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:06:48 -0800
X-CSE-ConnectionGUID: OFv8hcTSQgiW916pNz/gEw==
X-CSE-MsgGUID: NfDdVB4hQgS6flOjWL48+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204059491"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 15 Jan 2026 02:06:47 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DEEB098; Thu, 15 Jan 2026 11:06:45 +0100 (CET)
Date: Thu, 15 Jan 2026 11:06:45 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, Jan Dabros <jsd@semihalf.com>
Subject: Re: [PATCH v1 2/2] i2c: designware: Use device_is_compatible()
 instead of custom approach
Message-ID: <20260115100645.GE2275908@black.igk.intel.com>
References: <20260114081954.252160-1-andriy.shevchenko@linux.intel.com>
 <20260114081954.252160-3-andriy.shevchenko@linux.intel.com>
 <20260114115304.GC2275908@black.igk.intel.com>
 <aWe_pcSm3tJZhNxw@smile.fi.intel.com>
 <20260115053959.GD2275908@black.igk.intel.com>
 <aWiaJugAIuVG1yK8@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aWiaJugAIuVG1yK8@smile.fi.intel.com>

On Thu, Jan 15, 2026 at 09:41:26AM +0200, Andy Shevchenko wrote:
> On Thu, Jan 15, 2026 at 06:39:59AM +0100, Mika Westerberg wrote:
> > On Wed, Jan 14, 2026 at 06:09:09PM +0200, Andy Shevchenko wrote:
> > > On Wed, Jan 14, 2026 at 12:53:04PM +0100, Mika Westerberg wrote:
> > > > On Wed, Jan 14, 2026 at 09:17:51AM +0100, Andy Shevchenko wrote:
> > > > > We use MODEL_MSCC_OCELOT effectively is a flag for comparing against
> > > > 
> > > > as a flag?
> > > 
> > > Yes, sorry for the typo.
> > > 
> > > > > "compatible" property. Use device_is_compatible() directly to make it
> > > > > clear.
> > > > 
> > > > Okay but if something else ever needs this same quirk then we would need to
> > > > add new entry here and also to the IDs list.
> > > 
> > > Yes, that's how DT works and there are, of course, examples all over
> > > the kernel, first that comes to my mind: drivers/mmc/host/sdhci-pltfm.c.
> > > 
> > > > With the flag you can have the IDs in a single place not all over the
> > > > driver.
> > > 
> > > Makes the reality harder to read. If I know that the same quirk is used by
> > > different platform (in terms of compatible string) I will see it immediately
> > > from the code. Flag is meaningless.
> > 
> > Well with the flag you get the help from the compiler if you typo it but
> > with the string comparison you are on your own.
> 
> It only affects the development cycle, isn't it obvious that any quirk should
> be tested by the author, otherwise it won't work.

Of course but then are these "cleanups" that probably will not be tested
that well if at all. If it is possible to take advantage of the compiler
then I prefer that.

> > Therefore I prefer the flag and as I said it also avoid duplicating the
> > compatible string.
> 
> Duplicating compatible string is not a problem, linker nowadays combines
> the same strings into one. In case you are worrying about the space, it's
> not a problem.

I don't care about the space but just duplication.

