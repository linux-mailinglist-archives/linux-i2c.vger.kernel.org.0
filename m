Return-Path: <linux-i2c+bounces-11688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D76AED5A8
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 09:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 593747A9AD7
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jun 2025 07:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927C7220F36;
	Mon, 30 Jun 2025 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXlmBR6u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76341BD9CE;
	Mon, 30 Jun 2025 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268630; cv=none; b=DD8tx7+LUVKPCGpKvDittLLnslRg6oEA3r7wrGsDBknKarzRNWwX5gx3Bbb/pl+aJlSn2wQn2OjeaRJtMN8umNhJjtG75V+hs5foP2pnFOvuXlpL/3INmYGS+VAO9nfJWcCLwJ1Fy/8uZ/ji5iM/PIz7YeLSHBSSrGIOTJnzd8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268630; c=relaxed/simple;
	bh=UDxbpQ15IxVf+2wTqZbQJ3fTPgg8IaZ8MiQmaAHvyqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOTJYU47iQJQcK+vpCezGsYLHr1Yk/sEu4ItUW0Zm5YEvF5VAGqv+ouDOYRSq2fmgWCPVgP6AKHoyZ5Etca1SpBiiheg3qcr9MeaRlqJWISHLlju/xj2wZ/RDRzO3OgBzuBxzMOnZG3FholZL3a8QYQKYNy2ERE4yID10nRWD+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXlmBR6u; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751268629; x=1782804629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UDxbpQ15IxVf+2wTqZbQJ3fTPgg8IaZ8MiQmaAHvyqc=;
  b=MXlmBR6urTT4oeEQMa6q+0NP3vUEJ55iaPEspAolBO53Ix57QXZnlnb3
   hchwFNzLiSijzlW14zcHNNh3icTTsGZOl/EnsqNNfeIswXeoyqCbnWiM3
   Qr/ShRQMS8yb+C/s+XNSJuNlpSaE0RT8JBxpj6npKJMR6iLFQBGdW1wcv
   9UxbqnrvoaTBkNr9/tYPZuOOBSHxklLxf20A08IOzACra4f6LhSz6fO5D
   GxGFm1EuIyDcgRofgZvxNNQjFol6tWf3O7LuWwtCra5IGow+l5GTJJ+jp
   xaA9wHRIghOsZkYIby5W4HbaETzUc41QmB8G6I+yRtihYEXMy91kSqjKk
   A==;
X-CSE-ConnectionGUID: 6OCl2JetSqernA1uaT9FZA==
X-CSE-MsgGUID: 7zBsP5J+QUu169/NgGcEUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="71053033"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="71053033"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:30:28 -0700
X-CSE-ConnectionGUID: kx5SBltdRq+aJvVD5fhRnQ==
X-CSE-MsgGUID: pr28x6e/Q8q298J8osKVhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153479666"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 00:30:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uW8y3-0000000BEf9-2j4t;
	Mon, 30 Jun 2025 10:30:19 +0300
Date: Mon, 30 Jun 2025 10:30:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>,
	"Tauro, Riana" <riana.tauro@intel.com>,
	"Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] i2c: designware: Add quirk for Intel Xe
Message-ID: <aGI9C6MR8qhe0MHR@smile.fi.intel.com>
References: <20250627135314.873972-1-heikki.krogerus@linux.intel.com>
 <20250627135314.873972-2-heikki.krogerus@linux.intel.com>
 <aF6nEOVhLURyf616@smile.fi.intel.com>
 <aF8N0dYk_WAJjvVu@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF8N0dYk_WAJjvVu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 05:32:01PM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 27, 2025 at 05:13:36PM +0300, Andy Shevchenko wrote:
> > On Fri, Jun 27, 2025 at 04:53:11PM +0300, Heikki Krogerus wrote:

...

> > >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> > >  {
> > > +	u32 flags = (uintptr_t)device_get_match_data(&pdev->dev);
> > 
> > > -	dev->flags = (uintptr_t)device_get_match_data(device);
> > >  	if (device_property_present(device, "wx,i2c-snps-model"))
> > > -		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > > +		flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
> > >  
> > >  	dev->dev = device;
> > >  	dev->irq = irq;
> > > +	dev->flags = flags;
> > 
> > Maybe I'm missing something, but why do we need these (above) changes?
> 
> in between, it is introduced a new one:
> flags |= ACCESS_POLLING;
> 
> So, the initialization moved up, before the ACCESS_POLLING, and
> it let the assignment to the last, along with the group.

I still don't get. The cited code is complete equivalent.

-- 
With Best Regards,
Andy Shevchenko



