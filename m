Return-Path: <linux-i2c+bounces-15273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF79D3B713
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 20:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D596304816E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jan 2026 19:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663FB2874F5;
	Mon, 19 Jan 2026 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEuICg+G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E8428152A;
	Mon, 19 Jan 2026 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850187; cv=none; b=bLPp4IQJTmU7kQNgsfXJUSyoauLYN8+GRrbRwWgHkp4lNMG5pNaMWwPjJFBH4tiROGnkhV8+JgKAA/n+krKTF9VXgZGbqYh8DQdtstsJPDP+IwRBHyOdQFKHL7MJcYiuWKHgCMLsXhR4nUWFSl2NThb8+UqsOB8xcTXOWizRU/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850187; c=relaxed/simple;
	bh=0k4zMM0xFGGI2gIsh4tNSUIORb9lsxxgZ/GDjdpUL/s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UIpXR1LKq7/gOda04GCaZZVVlxcAaiTvgol35SrTYsS83fKFtd8SEGiF3SXLkR4pzFE0t1yruCAVGjA2qHM3SJhZ92VW2JIAABCAcixqj1ZI+YtwLghA4d4jnp/3CDv8aBInlubwRAugjS2EVB+1y7CvfzxUX3kl95J+R1GZgI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEuICg+G; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768850186; x=1800386186;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=0k4zMM0xFGGI2gIsh4tNSUIORb9lsxxgZ/GDjdpUL/s=;
  b=IEuICg+GBmsrhhcldOdKLNS7ZkVu7z+oOXtzcAlbCXg9xTe9HzMMtiL9
   RSFx3/dcjR1+80WdWKCqP5DhJZCNEMAgzcPVKUKlVmnlkKUFr339Sd40T
   HjzVP/qHJBDrhf1vyKSYtuQEvBxPbt6JFITExzTvHzyoT75LPbvXy0Cpu
   VTC/xsoaxQHUF0AyCcWhWkDMvzvmycn8dE+uxrMbq7BP5dQNWC11+0I5V
   yHoMAq5UXtfOvs/YiwMoi+E4DbNgqT0WPQIXek/PSOmO2g6GzfPgWus9M
   0Fg6/f6moU5jJb6vuoQUlP6SGXfhKiooIm59ZNtt6kdluVxSGy+F+V/bL
   w==;
X-CSE-ConnectionGUID: WqQ2OWqgQzuy6/gTNwZ29Q==
X-CSE-MsgGUID: cq1PifE0R4OLp6UxaJVugg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70226602"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70226602"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 11:16:25 -0800
X-CSE-ConnectionGUID: WjBAjbCpSvSiVHD4krQTfg==
X-CSE-MsgGUID: Xx3g2NzRR4yLmCizGxDodw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="205085137"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.37])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 11:16:24 -0800
Date: Mon, 19 Jan 2026 21:16:21 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: core: Propagate all possible errors when
 requesting recovery GPIOs
Message-ID: <aW6DBSNejuqMU0Kq@smile.fi.intel.com>
References: <20250212163701.2407540-1-andriy.shevchenko@linux.intel.com>
 <Z9Gdx4QIMj25JRB2@smile.fi.intel.com>
 <aBTT0Fs5xIN0sjnx@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBTT0Fs5xIN0sjnx@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, May 02, 2025 at 05:16:48PM +0300, Andy Shevchenko wrote:
> On Wed, Mar 12, 2025 at 04:44:23PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 12, 2025 at 06:37:01PM +0200, Andy Shevchenko wrote:
> > > If GPIO is available but we can't get it by some other, than deferred probe,
> > > reason, propagate it to the caller.
> > > 
> > > No functional change since i2c_register_adapter() still cares only about
> > > deferred probe.
> > 
> > Any comment on this? It's a month passed without any reaction...
> 
> Yet another ping...

So, can this be applied or should I do something about it?

-- 
With Best Regards,
Andy Shevchenko



