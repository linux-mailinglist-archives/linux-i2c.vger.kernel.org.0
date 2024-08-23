Return-Path: <linux-i2c+bounces-5735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBA295CDEF
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 15:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C15151C20975
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 13:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52024186E55;
	Fri, 23 Aug 2024 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KR/MTyvd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9168C185B61;
	Fri, 23 Aug 2024 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724419909; cv=none; b=Ljheo6IpH4ph3WEVcm4LiM/Th0XFiJiba5F7gTeNzk7QoDwmYcOQy9c23j44Frn50NnEYNgggZKm9NTXRuu74+aCKu42So3DW/oBfe+YJLwSf+Y3Xq/B+ZprJyO1Y/KFoS47PstkhJcwrQ3O+gvq4TwuzyQglIaVRb13xxPqGTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724419909; c=relaxed/simple;
	bh=y35YyC4z7k4CZp108Eln+wMKCgxODdiZtk/ee/GHJhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSHIK7CjiVi1pHHoAJUfqJL9cqtS+JiNRVZDv+nikqFHgtzCh9a8e3wh+H2y0DzqCmW4zu0yXUJ5dLnhChhvyv0Hh9K7yRB7tVZ8aTDXeInY8bu3/r8haglKvb5lHXhzIxweNZDzMnaU/g6mO5hRNaYZxOsDRzEEM016ItGJ2BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KR/MTyvd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724419907; x=1755955907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y35YyC4z7k4CZp108Eln+wMKCgxODdiZtk/ee/GHJhQ=;
  b=KR/MTyvdqMUG869JBV90c1Urghw62Ucs8sMSP5pZOL6bgWJ1iJeJyggQ
   rQHokf9nzzyzkTFRfxFuaywInC6s0KzqKz2QX0uHQflxrVKSEP9LRBIWL
   +QuVIHqjHLVkluWArJXzBw4ZtNNPQOCNwVCrKGfaM73NkCblErSYMmvdd
   k1AEMma/EbUzq/kec9TCIEtB2Ufb0eJ13thcPTKFoM97M3jJ/BOIaXkYQ
   zqm51minlcLWnklWBPC+fCd35TuI3D1b5B0LfbpvKjcFU9pSsKAK+EAZy
   M9jVQXcSy/+elnS73kJaAONxHTsKclB/Hb1kUbU28QBazXGbzrW+32RUa
   Q==;
X-CSE-ConnectionGUID: J3957KAVRcWo7Zdo2lg6PQ==
X-CSE-MsgGUID: T2aXldjPSlqxn1DxXz7WDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33511081"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="33511081"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:31:45 -0700
X-CSE-ConnectionGUID: uCdDVu2aQ9qldzwRYO/wtA==
X-CSE-MsgGUID: r1TwYEVRTgKOwvGuxQ7Qjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="62315873"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:31:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUO9-00000000nzf-3ycu;
	Fri, 23 Aug 2024 16:31:37 +0300
Date: Fri, 23 Aug 2024 16:31:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>, Kim Phillips <kim.phillips@amd.com>
Subject: Re: [PATCH v1 0/5] i2c: designware: Cleanups (part 2)
Message-ID: <ZsiPOQ_xEXdh9b4Z@smile.fi.intel.com>
References: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
 <oo2wbjxoe5acqeamjmnngnu2n4e2fsmclepnwvra4hmc5nn64l@q7rnxilvtebu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <oo2wbjxoe5acqeamjmnngnu2n4e2fsmclepnwvra4hmc5nn64l@q7rnxilvtebu>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Aug 23, 2024 at 02:45:58AM +0200, Andi Shyti wrote:
> On Thu, Aug 22, 2024 at 08:58:36PM GMT, Andy Shevchenko wrote:
> > This is the subset of the patches [1] that should not affect any
> > functionality. Here are:
> > - consolidation of FW parsing and configuring code 
> > - some function renaming / dropping
> > - switching to export namespace
> > 
> > In any case this is Cc'ed to AMD who reported a problem in [1]
> > presumably in the patch that is *not* included here.
> > 
> > Link: https://lore.kernel.org/linux-i2c/20231207141653.2785124-1-andriy.shevchenko@linux.intel.com/ [1]
> > 
> > Andy Shevchenko (5):
> >   i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
> >   i2c: designware: Consolidate firmware parsing and configuring code
> >   i2c: designware: Unify the firmware type checks
> >   i2c: designware: Move exports to I2C_DW namespaces
> >   i2c: designware: Remove ->disable() callback
> 
> I merged these patches in i2c/i2c-host.

Thank you!

> Normally I leave patches a bit longer in the list, but they have been
> reviewed and discussed.

FWIW, there is no change done to them except rebasing to avoid that suspicious
PM patch to be included.

> If there will come some observations from others, we are in time
> to change them.

Yes, I am here to help.

-- 
With Best Regards,
Andy Shevchenko



