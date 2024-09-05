Return-Path: <linux-i2c+bounces-6238-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D096D6A5
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 13:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 558C5B25E68
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 11:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7331991CE;
	Thu,  5 Sep 2024 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ho6rayyI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41251991AC;
	Thu,  5 Sep 2024 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725534188; cv=none; b=XTWgXcVS/LAodw8PWzzI+NGo0g1uHxlStZ3tKPeAJNcC8tl4uKsDSjZZYF88ZhApM2n+vrf6u4Zot/sf268lEkh4/V6OJAOvmXYdcAO+Fw6Ey00t6inmqXaNM6xEGA8x3Fy4XhvspnZm/eoREj3PFIO2w1VwM6P7P/8DoD3gDXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725534188; c=relaxed/simple;
	bh=RGlpkz/2wav5shSUEwVGF248vvCXxGMpr0ImcE8tEvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=efqPELkcD0AWXJeqg+gKgg10B0a/s/tpuLN50CvCGOwwrLxn+G+efoABKmra8B7Ea4Es8d9Rhkr5ms4LiJC64v5F1LPUkBUfqkqt+d5nUKru38MEUajZE30R1LV/w9xwzVqiIYM+KxVAmqw2cS5EjgQ8TPEpGD4yu0asqBwKN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ho6rayyI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725534187; x=1757070187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RGlpkz/2wav5shSUEwVGF248vvCXxGMpr0ImcE8tEvg=;
  b=ho6rayyIUaOiRAgZ1Gu6kekA5d/W5JsCUdyyd2HHdXcSvlO6Su73MdpF
   OdcxK3RMTQ8pEfcuKCDCPiQlTXbK3IJpPENNu6HWLs5OXpXoSsA6tfvfn
   iWgJs5f9XxQq5zUOq4JyI2eGSjWrT3yx1A5vHOD+GkRqMAi/3tSvGzDJ9
   wEdidmHTeYRwB6NaUj0MiI/NcdXeK3wVoYpG8bfnTYzU+WTVXiM0dN2qd
   vfAkpl/ma8iqOO25RHkGTtvQ01cQqLi7NkiRwjk5b12AcDxtkMh0mgWwt
   s+/NFwOOp6O6LIYo4C6d1cYrePfcfOyEGigHCkWe7L0YLo/rgKp7Mxelu
   A==;
X-CSE-ConnectionGUID: XqYvgrRNRj+3x5DMMqWHaA==
X-CSE-MsgGUID: 1XZxXAEIQYO98kxSXE4G4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24106423"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="24106423"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 04:03:06 -0700
X-CSE-ConnectionGUID: Xxo8+cQDRjeUBZQ3GWqNkQ==
X-CSE-MsgGUID: iphZhlX/TAm9hay70M2MXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="103044732"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 04:03:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1smAGT-00000005Mvq-1lYf;
	Thu, 05 Sep 2024 14:03:01 +0300
Date: Thu, 5 Sep 2024 14:03:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kimriver liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <ZtmP5VixBvXF9THk@smile.fi.intel.com>
References: <20240905074211.2278-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240905074211.2278-1-kimriver.liu@siengine.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Sep 05, 2024 at 03:42:11PM +0800, kimriver liu wrote:
> From: "kimriver.liu" <kimriver.liu@siengine.com>

You forgot bumping patch version in the Subject and now it's quite confusing.

> Failure in normal Stop operational path

Is this a subsection?
Make it more clear, by using additional formatting, like

Failure in normal Stop operational path
---------------------------------------

> This failure happens rarely and is hard to reproduce. Debug trace
> showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
> immediately disable ENABLE bit that can result in
> IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.

> Failure in ENABLE bit is disabled path

Ditto.

> It was observed that master is holding SCL low and the IC_ENABLE is
> already disabled, Enable ABORT bit and ENABLE bit simultaneously
> cannot take effect.
> 
> Check if the master is holding SCL low after ENABLE bit is already
> disabled. If SCL is held low, The software can set this ABORT bit only
> when ENABLE is already set，otherwise,
> the controller ignores any write to ABORT bit. When the abort is done,
> then proceed with disabling the controller.
> 
> These kernel logs show up whenever an I2C transaction is attempted
> after this failure.
> i2c_designware e95e0000.i2c: timeout in disabling adapter
> i2c_designware e95e0000.i2c: timeout waiting for bus ready
> 
> The patch can be fix the controller cannot be disabled while SCL is
> held low in ENABLE bit is already disabled.
> 
> Signed-off-by: kimriver.liu <kimriver.liu@siengine.com>
> ---

Here is the place for comments and changelog.
Since it's not the first version of the patch, changelog is a must.

-- 
With Best Regards,
Andy Shevchenko



