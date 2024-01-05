Return-Path: <linux-i2c+bounces-1136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF42825148
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 10:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D975284CD4
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 09:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DCD24A1C;
	Fri,  5 Jan 2024 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kk7YZpDh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FB124A0C;
	Fri,  5 Jan 2024 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704448498; x=1735984498;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=7ObWYYBLn40f0UahgV/luBpVWwgWk04CpAkgRbzVTHg=;
  b=Kk7YZpDhcqpNGHOl0pFyCaSgMOwrD5DIrDpaK0f/ZuPCLaQKEbb8wtbZ
   cpVASDGtbi9iTPTFZDAXEDnrBspSRhj5ZsdZjjjO5tiu78rNCT2PXXgPa
   SVJAxUyf3JSAcPfXUNTgGtEfjs4lm2i2t/hy8odKmjjTKBN18C2mCLIX6
   XaeGlG/Y0NRqnoRguxvUKkX0GHIS953iW4KAhwgHq8nfyJjZfnuVH7ofR
   BBD19moBabk+h5R/OKRBO2vOQlPpEVGgD8Kh8l7KjfD2dA8AbAjLK6bc7
   /8v0n/gdXs0Odbj3jxNq0QmQezxbQxcAf5JTO+cRKunWKiR5QUEz70EpC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4242941"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4242941"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 01:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="846533687"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="846533687"
Received: from unknown (HELO [10.237.72.158]) ([10.237.72.158])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jan 2024 01:54:52 -0800
Message-ID: <10f00229-4cc0-4511-a39e-14e2c58ba98a@linux.intel.com>
Date: Fri, 5 Jan 2024 11:54:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/24] i2c: designware: code consolidation & cleanups
To: Wolfram Sang <wsa@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Andi Shyti
 <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
 <ZYBgB3J51hfGQSVX@smile.fi.intel.com> <ZYFvEn0/xxIhGnlT@shikoro>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <ZYFvEn0/xxIhGnlT@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wolfram

On 12/19/23 12:23, Wolfram Sang wrote:
> 
>> Wolfram, is there any chance to get this into this (v6.8) cycle?
> 
> Sure, due to lots of travels and other issues I am in general very late
> with preparing the merge window.
> 
> Applied to for-next, thanks!
> 
Can we put this on hold from not being queued into v6.8 or better drop 
the whole patchset?

Andy is right now out of office and there is a serious i2c-designware 
regression in linux-next on AMD machine and I'm not able to figure out 
quickly reason for it:

https://lore.kernel.org/linux-i2c/20231229120820.GCZY62tM7z4v2XmOAZ@fat_crate.local/

