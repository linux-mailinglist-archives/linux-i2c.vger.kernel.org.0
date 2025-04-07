Return-Path: <linux-i2c+bounces-10145-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD46A7E00B
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37E9D16E7BF
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 13:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8701ACEAC;
	Mon,  7 Apr 2025 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYEsCBdc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566A18DF93;
	Mon,  7 Apr 2025 13:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033724; cv=none; b=FG0cBMRLBoQ7PRFh8+kI6trNDW4F351UQkQHIfcbjR6ZgwQ38sRD1d2d2MWy3jXWAjXQx0uIxOKMkE03stjMRpqBeDEwzRYSN/IuQ2lkleDYJaAZHC0CYoh9xAp0RoUMlKw0GRJpg+Mruc4c8FPRoqdZlr+Z3j6yJ9TSZSHfMlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033724; c=relaxed/simple;
	bh=UD/hCz5Aq78yv+U4/JzzUE92OQB20imcFEjtRY5f7hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9c3G6YbhHBpbvfCuhXs0KrWARsYGHrl5jFewdfGmbUUPpTLLEXwtfyBLJ3ko/JcGzncAwYGszy4HCwQX4ok5dT4vFSZ+nSPJRmjjHR6/Hsk9pteC5RSU2bZUzQfr/MZD9Lv+F0JS8bOCJook78FqiRLMH14DUQKuVfm1BdHIRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYEsCBdc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033723; x=1775569723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UD/hCz5Aq78yv+U4/JzzUE92OQB20imcFEjtRY5f7hI=;
  b=jYEsCBdcB4MDBshwC2YbOaw7i+H05l2tTZKOBddopDYsrOD9bgd/q9Lp
   H4xSu6lnNYsJsBfasyUhfSZZ0sN3X3R2UkOuND8hNe18nNYSR4o/N+jyd
   AmJhRt/WjLJm/KNGFYDNPlmHUiXx/oMSOG0CuWSZ6TneeoCsp/gLn8j2e
   g2ZHbpwb4BV8dblHK8OcNqi7f1IDArfop8jGP26wAM+x3M7NAXe455qJ4
   CyuHEBdNEqt5kE0TcWDx4AchoESMf66FP8c3emFwGc5U1TlesBbGHnm7K
   JMRHDhUv1dWlTMP2svj2ULSjV3bh39BuXyPYnwXqfQhY1qmUfL+NQK6sS
   A==;
X-CSE-ConnectionGUID: dckJsO7ESHuByQGg7JRV0g==
X-CSE-MsgGUID: zXCWXc92Qj2Nn6JZIcNsQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56083588"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56083588"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:48:42 -0700
X-CSE-ConnectionGUID: lXc2ks33Q6ex1UOCt0WGhw==
X-CSE-MsgGUID: OhldmVnDQSKRICz6nzB5yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127941572"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:48:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1mq5-0000000A5Jr-3y1Z;
	Mon, 07 Apr 2025 16:48:37 +0300
Date: Mon, 7 Apr 2025 16:48:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Wolfram Sang <wsa-dev@sang-engineering.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 2/6] i2c: core: Unify the firmware node type check
Message-ID: <Z_PXtXIUi4VRjICJ@smile.fi.intel.com>
References: <20250407095852.215809-3-andriy.shevchenko@linux.intel.com>
 <202504072041.Bv9mOk4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504072041.Bv9mOk4o-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 08:45:14PM +0800, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on wsa/i2c/for-next]
> [also build test ERROR on linus/master v6.15-rc1 next-20250407]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-core-Drop-duplicate-check-before-calling-OF-APIs/20250407-180528
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
> patch link:    https://lore.kernel.org/r/20250407095852.215809-3-andriy.shevchenko%40linux.intel.com
> patch subject: [PATCH v2 2/6] i2c: core: Unify the firmware node type check
> config: arc-randconfig-002-20250407 (https://download.01.org/0day-ci/archive/20250407/202504072041.Bv9mOk4o-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504072041.Bv9mOk4o-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504072041.Bv9mOk4o-lkp@intel.com/
> 

> All error/warnings (new ones prefixed by >>):

Ah, I should compile-test the slave part as well...
Will be fixed in v3. Since v3 is required, Tomi, I'm going to add the media
patch to its end.

-- 
With Best Regards,
Andy Shevchenko



