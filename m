Return-Path: <linux-i2c+bounces-11933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A7AB0392D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 10:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF22517C339
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 08:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A8923ABB7;
	Mon, 14 Jul 2025 08:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efMNgnF6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D08239E60;
	Mon, 14 Jul 2025 08:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752481201; cv=none; b=ruhj8aPhDg/RsDT8L8Mg6bVjxiQoC4WJHgHBNlJ2LL+si8pczFoi0VUBGXbXopI9RMxvQghNgpNsLiF3wVrNSGwzsCS9a5pq5hU4N6a2Db/gpqCrIwxpmjDgO12byBHR3SZyTBtfpkHPlfDDc1T7jr+myxd92kXLNGA5JnIAGVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752481201; c=relaxed/simple;
	bh=0WLu3kugDvQEYAJMzASy+A5S3YDpXTBXjAaVvNoadTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJDnMyZ+SYDGtCR+T91P+g1YmsBrQk0cWNrGbE8aPptGWdXqShaDABS8zZQv9R8tfZGT999XDJtJ8pD8Rr8co/FkUB9DfRo5XZbEfGQHLa9Le08lqVXqNb/04UuVarSvwAw3pPgAXx3EPVszNyCrjmpJagy5I4/oXWov1YGBYlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efMNgnF6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752481200; x=1784017200;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0WLu3kugDvQEYAJMzASy+A5S3YDpXTBXjAaVvNoadTA=;
  b=efMNgnF6dTE5KAuCBByU+ob+DgrnC18kmymeGm/6UCqa0k2n6KfYIiTJ
   Wo0aQkL39e4mYZ7g8AuhdCRSiZI7hWLW6UayjgFzLpZ1O541ZGkHxPF3j
   Sz0y91cLKo1JMY2fqIaIzOovTYK4Pq4LDFPPbkmHr8lhYkOAdoOKpv0iC
   1b1W0tJuQs9XXOKWSjCyMPmYWmxjxP6zvdqjOlALczPPGFsn6ldddIJyB
   8BD1XXVFgGlDnGZ3tG7uk2nL2xIWlx1+EL11v67ARP7GVazMu2lmRm+hV
   NtvjoBAEKov81mYi8B/TB3FEuZzHC3WExBKDqtTiO9QeZAvHcy0cJQpqK
   g==;
X-CSE-ConnectionGUID: T1yx+kHIRGyUB8sda5iQGQ==
X-CSE-MsgGUID: m9jTzL9oQq68o6ca5ZhMhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54635679"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="54635679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:19:59 -0700
X-CSE-ConnectionGUID: 264lVN+dRIWcEt31tZOKBQ==
X-CSE-MsgGUID: GzlyscvPQsSewwfa11tumw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; 
   d="scan'208";a="194077901"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 01:19:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ubEPf-0000000FIwb-1pxJ;
	Mon, 14 Jul 2025 11:19:51 +0300
Date: Mon, 14 Jul 2025 11:19:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	digetx@gmail.com, jonathanh@nvidia.com, krzk+dt@kernel.org,
	ldewangan@nvidia.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	p.zabel@pengutronix.de, robh@kernel.org, thierry.reding@gmail.com
Subject: Re: [PATCH v6 2/3] i2c: tegra: Use internal reset when reset
 property is not available
Message-ID: <aHS9pzHA1xKXlmaJ@smile.fi.intel.com>
References: <iqx5wzywy2x66n2y36mx4fckrr7wy4lqu3dsejcovghjtmgoz7@zwslylpivy3q>
 <20250714052226.72876-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714052226.72876-1-akhilrajeev@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 14, 2025 at 10:52:25AM +0530, Akhil R wrote:
> On Fri, 11 Jul 2025 18:00:45 +0200, Andi Shyti wrote:

...

> >> I would perhaps expand the comment here to explain ENOENT check and what do we
> >> do in this case. (Note, no rewriting of the existing, just adding a paragraph)
> >> 
> >> 	*
> >> 	* In case ... we compare with -ENOENT ...
> >> 	* ...
> >> 	*/
> >
> > If you write it here I can expand your comment before merging.
> >
> > Or if you prefer sending a v7 is still fine.
> 
> Hi Andi,
> 
> I thought to update the comments as below. Please let me know if this can be
> folded in. I can send a v7 if that is easier to merge.
> 
> 	/*
> 	 * Reset the controller before initializing it.
> 	 * In case if device_reset() returns -ENOENT, i.e. when the reset is
> 	 * not available, the internal software reset will be used if it is
> 	 * supported by the controller.
> 	 */
> 	err = device_reset(i2c_dev->dev);
> 	if (err == -ENOENT)
> 		err = tegra_i2c_master_reset(i2c_dev);
> 
> 	/*
> 	 * The reset shouldn't ever fail in practice. The failure will be a
> 	 * sign of a severe problem that needs to be resolved. Still we don't
> 	 * want to fail the initialization completely because this may break
> 	 * kernel boot up since voltage regulators use I2C. Hence, we will
> 	 * emit a noisy warning on error, which won't stay unnoticed and
> 	 * won't hose machine entirely.
> 	 */
> 	WARN_ON_ONCE(err);

Good for me.

-- 
With Best Regards,
Andy Shevchenko



