Return-Path: <linux-i2c+bounces-10419-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AE7A8B8D2
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 14:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C21D4455B1
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Apr 2025 12:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED6423F41F;
	Wed, 16 Apr 2025 12:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnRE36mb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3B02AEF5;
	Wed, 16 Apr 2025 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806202; cv=none; b=bXowAf0zOtLBfnTCKBC8xkv0OqN3oSq2IFyFaaAEwrN98W8uvaGCsGYd+QnbZXgJ8xxBLWobGT9La1MsYLfevkPuX4Ygl3cIyFdyNgj3OTSgUaxzboQrldmVfx3EtM68cmFu4Rzlt3AYnED5ZXAeIoiKwK6nYWii9BSgNww9KWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806202; c=relaxed/simple;
	bh=rvGzA5GTzsh30nHmxArYeEfbrk5b7Hc9sMvnG/MyOrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KqgBvc+5gtMWbaSnJqQXrLRwfWBPYhHe+CPC1xF2b+XQ8QKmP340hOfG8fQpMXsbiEs/RJu5IptINZpwsico6GNjzXxggXmB6vnsJ/phbgPnRqy3HxaK2JduWN5APEVeTYOW79VxHg4pt4JQVOVqWQeS1CqsZOnLferGbfCvIR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnRE36mb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744806200; x=1776342200;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rvGzA5GTzsh30nHmxArYeEfbrk5b7Hc9sMvnG/MyOrA=;
  b=PnRE36mbkmb8RACeHBoJe4u3ck2a8kqW18fw/FoYQc9tMLwn2zzchtaV
   2P/4eNY1ZIZtVK60i6R31O9eAbVQiRe1e1HTMaLqjnJEqojxtGMailc4Y
   8RjD1YWK22EBQ5kwx/80Xj5Zlwr7+C52H0piKBiHZ8Ru7wAdTxaI0q38D
   i1aqhq78szeOv/v0p4VAtmXWkguXEAC0GBnM+WAEIafN20K6wFOQMvKDf
   7EQ5KrktiqWT0KvCNxorMJQWXoMjEdoTsHoNgN421PpfkR7wf8ePYBXga
   +YSYEqa+Vd8veXUXcfJCkIbyYCR48ng8vBcYt/eSW7OxsqX9T37KqD5u4
   Q==;
X-CSE-ConnectionGUID: 62p10Z+6QCK0r4Bc9unFuQ==
X-CSE-MsgGUID: eROgGOyaR6Ob7WlvexXNnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="50171363"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50171363"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 05:23:18 -0700
X-CSE-ConnectionGUID: IiNgDi+qSIazCvM8phnISw==
X-CSE-MsgGUID: FTHtHRNSS+iDGbdU1PMZDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="161496070"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by fmviesa001.fm.intel.com with ESMTP; 16 Apr 2025 05:23:17 -0700
Message-ID: <0508221f-f2d3-4480-bbf3-91982163c221@linux.intel.com>
Date: Wed, 16 Apr 2025 15:23:16 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] i2c: designware: Use better constants from units.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>
References: <20250416101702.2128740-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250416101702.2128740-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 1:17 PM, Andy Shevchenko wrote:
> When we use constants in a time or frequency related contexts,
> it's better to utilise the respective definitions that have
> encoded units in them. This will make code better to read and
> understand.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

