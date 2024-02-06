Return-Path: <linux-i2c+bounces-1650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D67584B948
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 16:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A07F291506
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2862A13665E;
	Tue,  6 Feb 2024 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3nRuJlH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9108D13C1F2
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707232436; cv=none; b=ObrI6Hh4ykKvg7B/wJcaNja9k3flkDOzPoRpcy8pbHRelFHXrNgLJnFPmIvdGkafRX2whJKJ7vB9bCGhGbtqnGGanvLUVlw2LslbzyrOUn/sjU/bB1uZUymUo3GUXgQQbQOw9w2aH6Be73GCOi4zIqqk+11+tY5f1H22NMv2K/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707232436; c=relaxed/simple;
	bh=6tnfZbX/sSrKnFNbdtcxV7IS3k94QNtXVHqDk5LsMU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAzOgFsjxi/DDIoqwsKq53o3slnWP1Aja77RvdZgAOZMk33u0W1GJAgWqGO0GiclrQ/RZ4MiqYKtc1v/XXgNkZhpZSDbGLKN54p2n7ZG0G/IH688ncN2OX4Hj0a4TbbmeeHnboPZrt7kEkM7cYrGcFj/UvUkXGHRWcUZyWa7hPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3nRuJlH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707232435; x=1738768435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6tnfZbX/sSrKnFNbdtcxV7IS3k94QNtXVHqDk5LsMU4=;
  b=i3nRuJlH4VBMzpKHXavon85eYyyGYP0SNungzzrCDnSZOKl1RM15Z8BQ
   z2VDCMobb6fByiGxSCIp+xhozqOzhoWNOyeFrdlRmFz/sPjGX00Fa+ohd
   Kc6mbKwZB10Pl4v9QH9bdqIjCI2CaEjbXeWGq31s8T1qavIYVOvncFAuY
   ZltWWvPeNEeyLkCbaJJc63qLaxu2CK1d8tWI/2nscdZ5tLeD3VqBlZm8y
   loGzMkgoc3h5GXJc8ZjoNT2pEf3USoK4ZH4HRTuvDGvNPp7fPG50tjD/H
   lnsctsmF0zZK1WMEbsDtG/nWZdg930efmZ+cbFs3jAWVg8oSQMpM4UBnf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="11412185"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="11412185"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:13:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="909663978"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="909663978"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 07:13:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rXN8v-00000002N5y-0Wxt;
	Tue, 06 Feb 2024 17:13:49 +0200
Date: Tue, 6 Feb 2024 17:13:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 4/9] i2c: designware: Uniform initialization flow for
 polling mode
Message-ID: <ZcJMrOns_vhcruxj@smile.fi.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
 <20240206145158.227254-5-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206145158.227254-5-jarkko.nikula@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 06, 2024 at 04:51:53PM +0200, Jarkko Nikula wrote:
> Currently initialization flow in i2c_dw_probe_master() skips a few steps
> and has code duplication for polling mode implementation.
> 
> Simplify this by adding a new ACCESS_POLLING flag that is set for those
> two platforms that currently use polling mode and use it to skip
> interrupt handler setup.

...

>  #define ACCESS_INTR_MASK			BIT(0)
>  #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
> +#define ACCESS_POLLING				BIT(3)

Bit 2 is free now, no?

-- 
With Best Regards,
Andy Shevchenko



