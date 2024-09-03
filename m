Return-Path: <linux-i2c+bounces-6037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E7E96A17A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 17:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F20BE1C24166
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 15:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B19181B88;
	Tue,  3 Sep 2024 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fKrhiWFf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AAD13D245;
	Tue,  3 Sep 2024 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375619; cv=none; b=XcNlEdQ/exNeuA2WNxv/0dvYyCtO+KkK+LHRZhAVkNQaH3k0bQw3ghvToLE92zHF1+M/432lA+vNX7T+AKcfkIs9F6F8x6TQRpKrEjwo8sQ2uTziLy6LHl1asZQbux5QeZVJkD3GS1CCEZ0uuLQ9UDg+YpTUKvqwRrA8FtLcqFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375619; c=relaxed/simple;
	bh=dT6FsbNahWTNg13pHyUnWbWbCQMcM2rJdjoIX0ZxlJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwDECDUesSovYRiO6Gnnf3nl3WO5MScVDDIBFSC3gPEb2droR0nBAtyc2BmUdqpKZ07wqCBENcsktsRq944FeBpPZ8eWw8l9BCsZ0aQs/W9tKDmiEfAe4L45qTXvcuOfDRMXKvz8ziY3EaT3c5YFXO2mXA+Li6li3GKG+WJkK2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fKrhiWFf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725375618; x=1756911618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dT6FsbNahWTNg13pHyUnWbWbCQMcM2rJdjoIX0ZxlJY=;
  b=fKrhiWFfHhy46FZqfmGZsHX9Bj21neqCZPEn7hhSKq29DOEwZHuvJcep
   TBJhzyMy0+I2sbw2w7TdKlh1eY/aeMkzh+GiKF2ZDbdmTI9lWKfgvBD2b
   Kpp1KViKQT+qw1W65QLNh82ed9pzMMYfjcTdh63D/5NYEzbuO2mlw+LR2
   0D4hTaADz4XWmRVKgJs7QxspvboLrRhkgnAdzipGfguFyGHF1G9opF5Zy
   DsI3ovaCN6iDY0M8nfzA2SitmwxxfjCej6K0uWRmtwgbY5oUm0rqxW3NN
   gZGi80rM/oEdk+HQevwyO6Swscjkb3dKosSFHz0pikQUVaKim2fAnlDOG
   Q==;
X-CSE-ConnectionGUID: nrtnBex6QKGDMdmYwwqxCQ==
X-CSE-MsgGUID: QyPVUskCS2WayUCpk9N7bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34587974"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="34587974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:00:11 -0700
X-CSE-ConnectionGUID: QZGN/+SaR/S8gjU/RiXZOg==
X-CSE-MsgGUID: OsnCa0GPRnGkt4ALQIPqZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65146663"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:00:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1slV0n-00000004kE4-3a2y;
	Tue, 03 Sep 2024 18:00:05 +0300
Date: Tue, 3 Sep 2024 18:00:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>, Kim Phillips <kim.phillips@amd.com>
Subject: Re: [PATCH v2 1/1] i2c: designware: Consolidate PM ops
Message-ID: <ZtckdcI3mSRhe2Su@smile.fi.intel.com>
References: <20240827150101.2171107-1-andriy.shevchenko@linux.intel.com>
 <g74jbzdorj4vdhqxaztbl6rsjrybhlhx6swybrtms6jeaufzhq@ac77f3xcip2u>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g74jbzdorj4vdhqxaztbl6rsjrybhlhx6swybrtms6jeaufzhq@ac77f3xcip2u>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 04:30:00PM +0200, Andi Shyti wrote:
> Hi Andy,
> 
> On Tue, Aug 27, 2024 at 06:00:37PM GMT, Andy Shevchenko wrote:
> > We have the same (*) PM ops in the PCI and plaform drivers.
> 
> /plaform/platform/
> 
> with this change I pushed it to i2c/i2c-host.

Ah, thanks!

-- 
With Best Regards,
Andy Shevchenko



