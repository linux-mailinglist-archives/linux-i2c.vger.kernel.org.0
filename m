Return-Path: <linux-i2c+bounces-15138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACD0D1B470
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 21:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EA12301FFBD
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 20:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EEC311977;
	Tue, 13 Jan 2026 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfQ/+RTm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B3530DECA;
	Tue, 13 Jan 2026 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336968; cv=none; b=TMwxaj3W4gYf2bCzk29eToD9InhkJ4CAXe9hnwMc1P0MmcBvw1jSZHJaC29pvibuX53V/5qdLkg7HCgT+lcl66fkgfvsm38GdK9wxt6TxslWOtUPIUW6wmU9f3lfFuXA+qOmemdFOqKayx6SB+0gqApiP9/l+wi8tQEfa4+OczQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336968; c=relaxed/simple;
	bh=6rqISX3PQdxf/S9wv4Zc0TtGffYXK+SwYdj3XNqPPV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImLfKoELr8cDEtTGIIGfue+j1MDV9oF0VXezKS0ALr6qkcD3mZzrpaa2NInxQwll3kXu9D7GIFs9vM6rgf7fGbG1XPCh2UsC591DrwL1nWbi5hDGg9xEOey9sJmmSt6I3jAfQ3LyxJ77xAR1mNkYS+NJIOpEvQ4hLlVXuER1XX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfQ/+RTm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768336967; x=1799872967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6rqISX3PQdxf/S9wv4Zc0TtGffYXK+SwYdj3XNqPPV8=;
  b=bfQ/+RTmDcS3VJTiRV+Zw5+684kaUyvf3hBEjkd+MgLW8RGC4E6g4VLB
   vBBD2tePBeMDkOf8OA2N5auF3uE5HOw1/7q9IsQGlKGx+l8CMeLG6QYiA
   6MZaHbeEoQVLCYc9RjCO03jFe5FPygVKX2RHyg4mISG8arZ6SYGRelB9/
   NR50QVqzhk7tcJCwp+dy013vXN/N/YSGbydI3O8/cXtOotW997R15MKTE
   R6KFlsxW50V4j/tghyJNgsRMq1/3oAB7Z3RULaEZTTjCS+gTx5lznDF6Y
   gORHwA9x2ABYbPOIjpLgkjmnR3eB9YIRD1pgS7c6+t8bT1wi4s87po2gy
   A==;
X-CSE-ConnectionGUID: 7PK6oe+lQ/GN4Jr4ZT1VSQ==
X-CSE-MsgGUID: Ih+rwwR4TOeiPzqi90MVHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80353191"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80353191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:42:46 -0800
X-CSE-ConnectionGUID: rjOsWxJYReu6orOmsh/Mrw==
X-CSE-MsgGUID: Cuh+LkaySmiPreIVIHW0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208645997"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 12:42:44 -0800
Date: Tue, 13 Jan 2026 22:42:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v1 2/2] i2c: mlxbf: Use HZ_PER_KHZ in the driver
Message-ID: <aWauQVSkQsqvS_rT@smile.fi.intel.com>
References: <20260112135603.4150952-3-andriy.shevchenko@linux.intel.com>
 <202601130414.VJyCNWzI-lkp@intel.com>
 <aWVbYYusNh_q_91o@smile.fi.intel.com>
 <aWZNHKeXFMPMG9q1@rli9-mobl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWZNHKeXFMPMG9q1@rli9-mobl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 13, 2026 at 09:48:12PM +0800, Philip Li wrote:
> On Mon, Jan 12, 2026 at 10:36:49PM +0200, Andy Shevchenko wrote:
> > On Tue, Jan 13, 2026 at 04:33:04AM +0800, kernel test robot wrote:
> > > Hi Andy,
> > > 
> > > kernel test robot noticed the following build errors:
> > 
> > Ah, okay, this needs to be based on the series that adds HZ_PER_GHZ as it
> > provides the needed header inclusion.
> 
> Thanks for the info, and sorry for the false report.

No problem, can you remind the syntax on how I can mark the series that
LKP knows the dependency on another series (which is available only in
the mailing list)? I assume it needs message-id to the email thread?

-- 
With Best Regards,
Andy Shevchenko



