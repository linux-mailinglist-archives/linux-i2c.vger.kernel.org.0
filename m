Return-Path: <linux-i2c+bounces-13170-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A2B9FE48
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 16:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31D2B7A3534
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 14:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3525A288529;
	Thu, 25 Sep 2025 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AoPM/PEG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C758F29617D;
	Thu, 25 Sep 2025 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809521; cv=none; b=F3+yDd7KjXmNW+Rng7ErqwiTiSMW0JtnRxhFysfZbTMmU83qxwQMVbLUxtbU9KRmH5a0iB8IUd4Jw10Uoozc61smWQx6tR1AbKPdBdVQY0Pj0UuE9WHd43gPJsNJDFJUlHjYMDCU0PC3/wvVsMPNBELuwFaRBFpe4Nu3O6N+VNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809521; c=relaxed/simple;
	bh=VaeU61FUtyhNrQAlsCl7R4hPvnXVxaEQNFNVN6PsTwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7quAFUFjxbhK1G1mgZVHv2MRZHJD0cLWAhtK/oI/D52GUyH0oyz37sY9/D9FTv40/YCR4pIopNDihWXmXFSBQO3oOQSEudlnS5yiFdwBerfIAyZzdxfdR0p6moPRe5LexRVkk568WoXD5UPpDUvL1AG2V8m9PI4HENgitsWjWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AoPM/PEG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758809519; x=1790345519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VaeU61FUtyhNrQAlsCl7R4hPvnXVxaEQNFNVN6PsTwQ=;
  b=AoPM/PEGErxAQyltLTyHzOGSp+ehpaDdLEyDCpNQ4jqoikTFNOdQFKdR
   xOlzfCMBSbdYU2MrqNwFUqgZLli6FfqTsuDqVArA7I+vwxeUNHR5pwtyO
   fk1xmP+0EY37Bk/lfFy/8wnkWxb+SubnpZIKOFnC7ZAT4YAvy7VzqBACB
   z5k8gMBpcZk2yAEvx9rYRV6X7wHtGK5E5RQ8+i/XWvIVLamkFkwMyvFrq
   G8pYOJuOF9kQvDZsjuMBkFX0cxrkKsUeScmnfWAIWEBCR9mldHxXtalAT
   wk0Q9Irn9Q7AhzBPgSb/bAV+g++Fr0CFRTyM3eBSE2p7I6zOCWGWBIS9g
   A==;
X-CSE-ConnectionGUID: 524miwZbTg+UmMKZvry+HQ==
X-CSE-MsgGUID: ybB8LN8USV+otxLuP5V7ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61075588"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61075588"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 07:11:58 -0700
X-CSE-ConnectionGUID: AwhdYs55QTe+AQP179vQ6g==
X-CSE-MsgGUID: T67fnTolTNSO4TAWM4vPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="176628009"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2025 07:11:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 29A5B96; Thu, 25 Sep 2025 16:11:55 +0200 (CEST)
Date: Thu, 25 Sep 2025 16:11:55 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove myself as Synopsys DesignWare I2C
 maintainer
Message-ID: <20250925141155.GH2912318@black.igk.intel.com>
References: <20250923132603.50202-1-jarkko.nikula@linux.intel.com>
 <aNLw2qMlHYJXQhk0@shikoro>
 <20250925092800.GF2912318@black.igk.intel.com>
 <49f7409f-c8be-46a2-9a77-6eee4a3dda44@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49f7409f-c8be-46a2-9a77-6eee4a3dda44@linux.intel.com>

On Thu, Sep 25, 2025 at 01:22:46PM +0300, Jarkko Nikula wrote:
> On 9/25/25 12:28 PM, Mika Westerberg wrote:
> > On Tue, Sep 23, 2025 at 09:11:22PM +0200, Wolfram Sang wrote:
> > > On Tue, Sep 23, 2025 at 04:26:03PM +0300, Jarkko Nikula wrote:
> > > > My address is going to bounce soon and I won't have access to the
> > > > Synopsys datasheets so I'm going step down being a maintainer for this
> > > > driver.
> > > 
> > > Oh, noes! Hope to see you still around hacking the kernel. Thank you for
> > > all the work on this driver and I2C in general!
> > 
> > Thanks for all the good work Jarkko!
> > 
> > > >   SYNOPSYS DESIGNWARE I2C DRIVER
> > > > -M:	Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > > >   R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > >   R:	Mika Westerberg <mika.westerberg@linux.intel.com>
> > > >   R:	Jan Dabros <jsd@semihalf.com>
> > > 
> > > Maybe one of the reviewers wants to step up?
> > 
> > I can volunteer if that's okay with others?
> 
> Sure! Sorry, my bad I didn't ask you. I thought myself you have enough work.
> And I tend to say people "ask, don't assume" :-)

No worries :) I'm sure Andy and Jan will help me with this.

