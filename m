Return-Path: <linux-i2c+bounces-6312-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D360896F37A
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 13:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91393283826
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 11:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B190F1CBEA2;
	Fri,  6 Sep 2024 11:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PivsV9vW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1661CBE8F;
	Fri,  6 Sep 2024 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725623274; cv=none; b=CHNx3O2oKqKGMQw0GrPtCibTPftXe/jXZH9kTfDwCkmzGn9cFuFqenIkY0VHZ95T/X+bPtvnPgu1II20w6BG8o29118ANLPo1K+DRMksDOq3JphhAFvfVJ5mFdCM0A4KI6/HTOaRCm+6DVaUk8syeyfRQxeOZzUgLOGJadRYwbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725623274; c=relaxed/simple;
	bh=N5aKQU5kkjMWnod8/X4iS0VDX8jjc/t6Cugpf7X/brQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smkdKo6t7LaqWyDUKZMIcwrAxsND5/ToFdAoMaOCKY1yP1+gpjwLFn0mGKDSzAdb4m1DSHO9hrnR67bhufIYo/OkyNtzuXEcLFf7AsjuDjVHKWQvNildQi92Lvx31rzk567nsnJR6qsXwWnvbQnTPt0eA4ECtPLwxBA0mr6SLSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PivsV9vW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725623273; x=1757159273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N5aKQU5kkjMWnod8/X4iS0VDX8jjc/t6Cugpf7X/brQ=;
  b=PivsV9vWmSyA4V/87eycNhcVrvbkpuLWokJkmTmCEFQn3A8XIuQZQQii
   M5u5RI86F9aXoL5+fHXn7MwXYfoPBLO6tEAJcZNTTt2++qt6whoDLDVvq
   qpMzhHldMJkHpuQcskXScx/yYIO/t2mqoorIKs2TWY9Beh2Y/EZULRXGj
   0KRKcBR4pKgZv0vI6+NB6KqsBA6gPGiAhDZJdPsViLyn47cN29qqOlykG
   kNJpTa4z/A69RKi9SSAY2VL6u4IFerqkKUxx7IANAhnJ1zwqkxaQwSqz1
   S1i9SQSGqTaM0NuuI15/sBk6VFGM90V67LqfS/9cvUSw3sz0d2F7ZnlIu
   w==;
X-CSE-ConnectionGUID: rHKanv31RqS8FKv9zQUjXw==
X-CSE-MsgGUID: wuBjWv5cRFuJ+3zGL1JBTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="13408814"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="13408814"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:47:52 -0700
X-CSE-ConnectionGUID: EZwPke7qTb2ylIfRFgVDXw==
X-CSE-MsgGUID: Gv4/ZtQ6Qxyo1IzLOUXTPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="66163030"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:47:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smXRL-00000005lzo-3BAq;
	Fri, 06 Sep 2024 14:47:47 +0300
Date: Fri, 6 Sep 2024 14:47:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <Ztrr4-igQ20gu0VS@smile.fi.intel.com>
References: <20240906054250.2745-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906054250.2745-1-kimriver.liu@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 06, 2024 at 01:42:50PM +0800, Kimriver Liu wrote:
> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
> IC_ENABLE is already disabled.
> 
> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
> holding SCL low. If ENABLE bit is disabled, the software need
> enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit
> 
> Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>
> 
> ---

> V3->V4:

Nice, but the Subject (which is most important part) still has no versioning :-(

>       1. update commit messages and add patch version and changelog
>       2. move print the error message in i2c_dw_xfer
> V2->V3: change (!enable) to (!(enable & DW_IC_ENABLE_ENABLE))
> V1->V2: used standard words in function names and addressed review comments

...

> +			/*
> +			 * Wait two ic_clk delay when enabling the i2c to ensure ENABLE bit
> +			 * is already set by the driver (for 400KHz this is 25us)
> +			 * as described in the DesignWare I2C databook.
> +			 */
> +			fsleep(25);

And if we use 100kHz?
Please, calculate this delay based on the actual speed in use
(or about to be in use).

> +		}

-- 
With Best Regards,
Andy Shevchenko



