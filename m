Return-Path: <linux-i2c+bounces-9481-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C79FA39B0B
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 12:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B00B77A1578
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4529F23645F;
	Tue, 18 Feb 2025 11:33:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958062309A1;
	Tue, 18 Feb 2025 11:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739878403; cv=none; b=hdq4bIivvGxuntN6ElfostQU47GzMV7nqFUsi5+3XDFlauXOmXepAtAf9Akj4Q/HOyLXHxHc34ISkAPOLmS8jni/88rpuWoccejHuBkcYeAfwjNp3TeazAm+uzARiATBo5dfKKNKNVbkAiRPXSQdpvU6Zr/wS7qlCzG/Ab4PmiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739878403; c=relaxed/simple;
	bh=GCPuxiPxWDfaXRPHEamVAeY9EEJQzGSWKS9w6E0woMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxXsMZ18K7ETcBZAiGRl9nbWxxbV32TBC6mGayeF3OKGDt595k/MRUjzzKIsRZSnrBotFdOQvPk4F+3B3LiZo24+vPKekl3JReoPPf1NOWld6hUNC9hH7+GZS0mEkVJVMzvoq7M2QkrP4gO+HQtDFbwbInZfqMKVFGP6Op21hFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: lrC8+JlKRqCFhvz+rnIFQg==
X-CSE-MsgGUID: pN8EEi0xSTi0nIz1aGxzPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40823057"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="40823057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 03:33:20 -0800
X-CSE-ConnectionGUID: eOHgW+1zRZmeZVBkdhaeTQ==
X-CSE-MsgGUID: h7FJ2sOcRKmHSMkvhvMtNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="119358239"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 03:33:18 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tkLqk-0000000ChgE-3PGA;
	Tue, 18 Feb 2025 13:33:14 +0200
Date: Tue, 18 Feb 2025 13:33:14 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	stable@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH] i2c: ls2x: Fix frequency division register access
Message-ID: <Z7Rv-s4agg0vVO5P@smile.fi.intel.com>
References: <20250218111133.3058590-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218111133.3058590-1-zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 18, 2025 at 07:11:33PM +0800, Binbin Zhou wrote:
> According to the chip manual, the I2C register access type of
> Loongson-2K2000/LS7A is "B", so we can only access registers in byte
> form (readb/writeb).
> 
> Although Loongson-2K0500/Loongson-2K1000 do not have similar
> constraints, register accesses in byte form also behave correctly.
> 
> Also, in hardware, the frequency division registers are defined as two
> separate registers (high 8-bit and low 8-bit), so we just access them
> directly as bytes.

...

>  	/* Calculate and set i2c frequency. */
> -	writew(LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1,
> -	       priv->base + I2C_LS2X_PRER);
> +	val = LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
> +	writeb(FIELD_GET(GENMASK(7, 0), val), priv->base + I2C_LS2X_PRER_LO);
> +	writeb(FIELD_GET(GENMASK(15, 8), val), priv->base + I2C_LS2X_PRER_HI);

Now this needs a comment to prevent from appearing a patch that basically
changes that back to 16-bit write.

-- 
With Best Regards,
Andy Shevchenko



