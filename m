Return-Path: <linux-i2c+bounces-6984-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C690498578E
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 13:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8237E285CFA
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 11:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340EA84A5E;
	Wed, 25 Sep 2024 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="av3Ib9sN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C68F146A6C;
	Wed, 25 Sep 2024 11:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727262169; cv=none; b=dnKVt7pBhWEd/vQBQiUFB6LFYG6/MaMpgnpobFIpLVnrHGlb5X8dr4WNZF+yy8jogn7ofaeQNUWCODGK05gamxhboNexrMWBYtJGhvat2VtLFhzzzEc3j+ksIm0Tji1sgnwPM/TFfgHQXklB1CJoszPnJKmdJSWFjNj2b5zoSPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727262169; c=relaxed/simple;
	bh=AGkxZ4+RPiVbG8XUbzlVkl/C3M3VGZFa5bDwBrgJwI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cv7ELn3hs0gGmokgclyrgVv8QrPuRUr0kIB0Or58uKe3T9lpoclUuqCIyRD08aZHuMiza8gShEM4g6tqXqm/VJsA226UxlFNp2GWSvbvbcEXlghbcrtq+54Y/W8gRk/veFNDkkkS/M+LA22HLqCZVQIRHXy1e610fMp0K3stxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=av3Ib9sN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727262168; x=1758798168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AGkxZ4+RPiVbG8XUbzlVkl/C3M3VGZFa5bDwBrgJwI4=;
  b=av3Ib9sNgclIqvWkqm+zPjEIgWlPrhwOieKc+SJ6lUyH9QL07l8t7umm
   CjKWkQtNpd9MSF2XgeDcc9XY81Mrfco+eL1GkbJmYm7QqlCdMwZyDRBbD
   99ujnOUcQJzz+TpH84fmZnBCQ/L9N5ma7PyU41+gXhmD0CVs37YvXzsPs
   N0uc4XdtaJNuGKFABrKHCUCRfeNBBTAv/DvK8JO8mfqdn6+Qpr08GyVhW
   EPFPCiGtrQMgnBeb8kvmVQPp18IYlQterJiQdw1Bb2VkD8DqXhWj+zV1t
   Dw6tYoOvgvvhAqpW07bgosYHwoKIM3+/Ezpof+H0blTFlMB41TZN1y0Ex
   w==;
X-CSE-ConnectionGUID: OVppctxGRNG2GHJcC88BuA==
X-CSE-MsgGUID: yi32lGMcQEGqVA0GfxQfXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30188065"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="30188065"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 04:02:46 -0700
X-CSE-ConnectionGUID: 6tg8C9HUTNe9UILVaBJsaQ==
X-CSE-MsgGUID: 7T2rfJnWQH2sMH8Wb7N/ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72189463"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 04:02:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1stPn7-0000000Cmz4-0Tn4;
	Wed, 25 Sep 2024 14:02:41 +0300
Date: Wed, 25 Sep 2024 14:02:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Michael Wu <michael.wu@kneron.us>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Morgan Chang <morgan.chang@kneron.us>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: designware: determine HS tHIGH and tLOW based
 on HW paramters
Message-ID: <ZvPt0NLoTJJwwjmA@smile.fi.intel.com>
References: <20240925080432.186408-1-michael.wu@kneron.us>
 <20240925080432.186408-2-michael.wu@kneron.us>
 <90f64539-3092-4d3b-bdf2-c6af51e32fdc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90f64539-3092-4d3b-bdf2-c6af51e32fdc@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Sep 25, 2024 at 01:58:27PM +0300, Jarkko Nikula wrote:
> On 9/25/24 11:04 AM, Michael Wu wrote:

...

> Also i2c_dw_parse_of() sounds too generic and may lead to think all and only
> device tree related parameters are parsed here.

We already have a common (designware specific) function for this. the parsing
should be done as the part of that existing function. I.o.w. the existing just
needs to be extended for these two new properties.

-- 
With Best Regards,
Andy Shevchenko



