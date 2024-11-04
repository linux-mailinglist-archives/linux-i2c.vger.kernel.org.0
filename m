Return-Path: <linux-i2c+bounces-7752-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBA89BB33D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 12:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF37A1F22CF7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 11:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A8A1C304B;
	Mon,  4 Nov 2024 11:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7VSrnfM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB51AC458;
	Mon,  4 Nov 2024 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730719238; cv=none; b=Rkdo7zIYIZcRImbfCZiKR8bBfJg345Acf9px6La5FNFRBMGaxtjrsdi/QkxAvuODC9qD/IWRtEh3K2pYebgWa7BtmzRjeP71vl0PzCrHcSWqnY91pb/WCmrCvw47K6+DHW9vNFQ7iKHkuhO99QzVCqRwPOOT5JPAxBGqZpEuOcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730719238; c=relaxed/simple;
	bh=VKU/tb7DYOTetaqBJlKR839RYdQxIBWMEDaJYFJAMVc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqJ3Nso7ggjoeobeeanTPsjta8qPLBWJsHHAsVwBhTp4ePqx2uPIUybsCNIWoJHdQ52fbBCTZy1hP0a1cwy9kIHC+f0rAT4yZoDuF8/NZOffFCLIwp4DAyRTWn2+Pfct0+RSU0Bk9Qcap/9FZqeJven2XZsUZgFD/ITqlMbV7MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7VSrnfM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730719237; x=1762255237;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=VKU/tb7DYOTetaqBJlKR839RYdQxIBWMEDaJYFJAMVc=;
  b=n7VSrnfMxQX9pHYF6qQyeDYQ4itdh4wnbgoWMAQxfJP8yDHG+OniVpwD
   fEIwBHOggo79UZHdgR3D64u0zlb9x5mARliZwnnSEg6rf57tkdw4qDdy1
   VyKEq8hkn1D9k7TxW/GNy8WILmdGXv542fv0ooKz/nu+l6xYBJRd1ZgAj
   UnfmjYtJOoxN28h2e7+n9Q56Pmd04WcVx7KYbfOyDz5+uMA76Fwv5VcDa
   8EwaYlVZvWIcmy8/V4rjV+zpi3aE9duy81NqN7ltRCwNw1q6lQVPBsfWw
   aZL/KAFgWj5Zp9mZGKbgyHxiRtGv40HUCsxQLoim2yRwuF4b0CTGlnD+b
   w==;
X-CSE-ConnectionGUID: nneO+gDnQ7aK3vpLog1/YA==
X-CSE-MsgGUID: ZwqAeuDFR1eezxR6132v4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30264694"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30264694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 03:20:36 -0800
X-CSE-ConnectionGUID: vaZRDFczT9+pICghNuC+Vg==
X-CSE-MsgGUID: bZE0rVAxTU6ytFwy3A6aZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88199494"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 03:20:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t7v8K-0000000B26W-1Zfg;
	Mon, 04 Nov 2024 13:20:32 +0200
Date: Mon, 4 Nov 2024 13:20:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: Use *-y instead of *-objs in Makefile
Message-ID: <ZyiuAIgubo4oZ5dw@smile.fi.intel.com>
References: <20241018150337.2182181-1-andriy.shevchenko@linux.intel.com>
 <ZyTIf8l1ghcyzJUH@smile.fi.intel.com>
 <ZyTNA34Y1BRxMhhn@shikoro>
 <ZyTSZTcNU63F2GjY@smile.fi.intel.com>
 <ZyTTs8gFx5r_N5Pi@smile.fi.intel.com>
 <ZyiqcHFJFFnBYmTN@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyiqcHFJFFnBYmTN@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Nov 04, 2024 at 01:05:20PM +0200, Wolfram Sang wrote:
> 
> > > Shouldn't be separated commit anyway?
> 
> Can be argued.

I have an evidence for my side: LKP complained as my (thanks to be a separate)
patch unveiled the issue in the Kconfig there. Meaning that required a new version
of the change, while the core part is not affected anyhow.

> This patch applied to for-next, thanks!

Thank you!

-- 
With Best Regards,
Andy Shevchenko



