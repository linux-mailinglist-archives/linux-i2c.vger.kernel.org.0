Return-Path: <linux-i2c+bounces-7927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B09C407B
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 15:15:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233E11F2213F
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2024 14:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F8319CD12;
	Mon, 11 Nov 2024 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHbO1KI2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8819E99B;
	Mon, 11 Nov 2024 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731334512; cv=none; b=cwODK9f+5Zax2JNLXkJ87r+ENPMDJxaXN2NOs161NqzviKhHA6V7SSIt3ErOSnliyIzEIjMLZ8xt870ORXhZIBHLvpTtE6Zbut0kf95to+CXnv0tyyLyoWcY62Urc5itnJ1oZlOtDYVmW/WbnLamVIx4M3/Bykw2BN89DoHs5ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731334512; c=relaxed/simple;
	bh=jYoF1pKVGKwDVgCm3pW+hEr+ADcmqkmquiJ1YcEpkok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzXVsCFdzgRqPu0VObBXMDSabWjklnrKne2HK7iUIaTKAR9UhVtgIemvxRui89fsusGk9QeImPHDH5IyU5Hd2b1iAIRldtudWeAeSQ+AITs19l1GBp69T7X2ty/s8mauP43G9C0fECF8YJZ8o8q01azXzUJPYwJUtLuDzuMit+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHbO1KI2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731334511; x=1762870511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jYoF1pKVGKwDVgCm3pW+hEr+ADcmqkmquiJ1YcEpkok=;
  b=aHbO1KI2SWRwoyT68eYzrelhXndjSn5nJVEJUKiAGJ8HSRuLFXzTCkpE
   wkPGF/kxnbXKA7eTwFJ8LbqzWeZN8MtkIAPLqecm6+6i85D2ZP40caM0P
   QiR8ZWKctws0XvCWDTlGOZFJJJbhb94o+xMsI0zsVkoM/F9BTYise0Jch
   VD/n7vB58a5Kjpu0QdSShLDB81zkpeS3SD8uNvC85rgvrF8jaPTNVKfl8
   S9KZ2tjLlLg5OTmjG2cB5ZVbnbcv52lFJ/GKlyruTsaJmbhw7NhJlHQxo
   Br9SkB7/jgn+QxTDSjtAbLvPcsyKQvtuE2kZ8p1cbVaA2rRAfPdR50rS7
   w==;
X-CSE-ConnectionGUID: MbUZPfrfRBWTwi+oU79xig==
X-CSE-MsgGUID: NXAWuTDZSIOVntbk4U3Agw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31304061"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31304061"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 06:15:11 -0800
X-CSE-ConnectionGUID: HevwKZaPQLu5EEjqvziHWA==
X-CSE-MsgGUID: jRGlD3PkSLqat6eWXSC9yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; 
   d="scan'208";a="87304187"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 06:15:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tAVC7-0000000Ddqn-0Wvh;
	Mon, 11 Nov 2024 16:15:07 +0200
Date: Mon, 11 Nov 2024 16:15:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Konstantin Aladyshev <aladyshev22@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: i2c: piix4: Add ACPI section
Message-ID: <ZzIRakOl9VTAxc3w@smile.fi.intel.com>
References: <ZzH-KeSavsPkldLU@smile.fi.intel.com>
 <20241111140231.15198-1-aladyshev22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111140231.15198-1-aladyshev22@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

+Cc: Andi

On Mon, Nov 11, 2024 at 05:02:31PM +0300, Konstantin Aladyshev wrote:
> Provide information how to reference I2C busses created by the PIIX4
> chip driver from the ACPI code.

So, this is not ideal, but it's a good start so far.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
We may amend this later on.

Thanks!

> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---

This place is for changelog and comments, if any. Since this is a v2 of a
standalone patch, the changelog is good to have. No need to resend now,
you can just reply to your original v2 with the missing changelog.

>  Documentation/i2c/busses/i2c-piix4.rst | 62 ++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)

-- 
With Best Regards,
Andy Shevchenko



