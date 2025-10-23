Return-Path: <linux-i2c+bounces-13732-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C577BFF594
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 08:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68DC74EE9D5
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 06:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AA4295516;
	Thu, 23 Oct 2025 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPyNKGv1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928DA28D8E8;
	Thu, 23 Oct 2025 06:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761200951; cv=none; b=C4JIj0v/OT9BN45kPtYrHN+qx0SrAa0Atp2AW6PiowMnH5+YLKq5tEwFad7PtK6oYqvoIlRw5cAMWwYWIS2+tkz/XQKPrhM7AgAKD+a7EFabXXpKN8Vj+9aa5GoE3KplEEQCXD6Qr5Oo7i57bWXWTpcc5Jd+RMa05W0QHPshWYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761200951; c=relaxed/simple;
	bh=6bbBc8lHjgLup7P7rA+yun58lb5OL9HjWKU0yiOHpmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvRctWl0RClzx3i9EIICYj/LCBGN+Sv8+xXWCbtVw9klOf/yfxvrFoflrEkthZuC1CR2N22LMX3J1AsI/pHO9hw7AlxWRdZZf0b1mQ/ZcngP+iT/C0e4pjnv62cpU4Q4/iVxr43PRkXoO0WMUl7x1hj36FXo+xHLhlB3yhdvskg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPyNKGv1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761200950; x=1792736950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6bbBc8lHjgLup7P7rA+yun58lb5OL9HjWKU0yiOHpmg=;
  b=iPyNKGv1s4IJ4FCIn98VqHonAdkUsDQTS5V/T/EaOMNaLcN/yIMO+7fV
   8AUhXhIYF1fnWvcmHKPU7/OcGs7NJidzUjBNxS8BGtCcPLV0IOJ2LHo45
   yADDRzgX8U59kDFnqZ6Dh5bafp/8uagXmk8mLBaJRndm54Pe0hVJZ4tal
   XSrV7DvP/s/khcMR3ERk3hF+2SmmFGQIpMnTXnlNBKLdNjwOuB64SLe+U
   wGANUa7J09kZ+OgR37WGKCNqpGSU5XKQSsOC7hGQyyvORxGBVyA0l/KBo
   TC9yHln91zdcELXFP7e8yBMkg8kbt3V6faSCuysVDe19/8pbQ+1UAL6tO
   Q==;
X-CSE-ConnectionGUID: bcVci4KSSc6ly8zMniUZFw==
X-CSE-MsgGUID: f8MggeQRR4i5trgxc7exPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50939263"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="50939263"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:29:08 -0700
X-CSE-ConnectionGUID: d+zolMI8SyWTNeARvxVw4g==
X-CSE-MsgGUID: 0d8Y7nGqSuqTpLoKbfotEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183773258"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO ashevche-desk.local) ([10.245.244.163])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 23:29:05 -0700
Received: from andy by ashevche-desk.local with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1vBooo-00000001raI-2Rzj;
	Thu, 23 Oct 2025 09:29:02 +0300
Date: Thu, 23 Oct 2025 09:29:02 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] i2c: designware: Remove i2c_dw_remove_lock_support()
Message-ID: <aPnLLjv1cIOQdozV@smile.fi.intel.com>
References: <20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-v1-1-8cc4842967bf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-dw_i2c_plat_remove-avoid-objtool-no-cfi-warning-v1-1-8cc4842967bf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 13, 2025 at 06:05:03PM -0700, Nathan Chancellor wrote:
> When building certain configurations with CONFIG_FINEIBT=y after
> commit 894af4a1cde6 ("objtool: Validate kCFI calls"), there is a
> warning due to an indirect call in dw_i2c_plat_remove():
> 
>   $ cat allno.config
>   CONFIG_ACPI=y
>   CONFIG_CFI=y
>   CONFIG_COMMON_CLK=y
>   CONFIG_CPU_MITIGATIONS=y
>   CONFIG_I2C=y
>   CONFIG_I2C_DESIGNWARE_BAYTRAIL=y
>   CONFIG_I2C_DESIGNWARE_CORE=y
>   CONFIG_I2C_DESIGNWARE_PLATFORM=y
>   CONFIG_IOSF_MBI=y
>   CONFIG_MITIGATION_RETPOLINE=y
>   CONFIG_MODULES=y
>   CONFIG_PCI=y
>   CONFIG_X86_KERNEL_IBT=y
> 
>   $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 clean allnoconfig vmlinux
>   vmlinux.o: warning: objtool: dw_i2c_plat_remove+0x3c: no-cfi indirect call!
> 
> With this configuration, i2c_dw_semaphore_cb_table has the BAYTRAIL
> member and the sentinel (i.e., 2 members), both of which have an
> implicit
> 
>   .remove = NULL,
> 
> so Clang effectively turns i2c_dw_remove_lock_support(), which is later
> inlined into dw_i2c_plat_remove(), into:
> 
>   static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
>   {
>       if (dev->semaphore_idx > 2)
>           (*NULL)(dev):
>   }
> 
> which is not necessarily problematic from a logic perspective (as the
> code was not bounds checking semaphore_idx so an out of bounds index
> could already crash) but objtool's new __nocfi indirect call checking
> trips over Clang dropping the kCFI setup from a known NULL indirect
> call.
> 
> While it would be possible to fix this by transforming the initial check
> into
> 
>   if (dev->semaphore_idx < 0 || dev->semaphore_idx >= ARRAY_SIZE(i2c_dw_semaphore_cb_table))
> 
> the remove member is unused after commit 440da737cf8d ("i2c: designware:
> Use PCI PSP driver for communication"), so i2c_dw_remove_lock_support()
> can be removed altogether, as it will never actually do anything.

Have you seen this attempt to refactor a bit that code?

https://lore.kernel.org/linux-i2c/20231207141653.2785124-7-andriy.shevchenko@linux.intel.com/

-- 
With Best Regards,
Andy Shevchenko



