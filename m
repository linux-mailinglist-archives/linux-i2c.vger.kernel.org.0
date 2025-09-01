Return-Path: <linux-i2c+bounces-12540-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4CB3E535
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 15:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5F3A3B7DD0
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Sep 2025 13:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F98B322A1F;
	Mon,  1 Sep 2025 13:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guC4pzkG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4461B3314B3;
	Mon,  1 Sep 2025 13:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756733748; cv=none; b=ivGZCyuvzFo9oTyZfHU7QsG2fze89uStSJC6VkfbhzZySt2UL+mTio6rAdlDdtmff33RpUTTuqxnuNYmyoWSQq+RsYbIPiTjSCmiYcme1tUtyGzR5YkAjM6ZEZdxgTuBUI6C4hsMB6X5MahN2gVCd5/4EZfdYTSiA0Og/wsWipI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756733748; c=relaxed/simple;
	bh=3JAO/QiTZY8eNFFGW5kNE0Esd7k4OSKajQLnhcfKT3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqBO7M6RsAdU5ctgxzAWDm7PaqiM1zPPNI9QG/xZdQt6iVssbgfU2ZyNRWVf9ACK3hpdNZFRZF0mFs3/NRMjDr/Y3vdRvkZle7BSTRxhUcgXFQny2aJyXlkHSDcOD+N+MX02XflETs/uTJjF2LtEi2PoZvo7Eo1In/wPBPNlwAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guC4pzkG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756733747; x=1788269747;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3JAO/QiTZY8eNFFGW5kNE0Esd7k4OSKajQLnhcfKT3U=;
  b=guC4pzkGRlbvkq3pQey0w+bsgtKXyxS0X1h/AyQA9r87Ankez/j1GBKi
   HCBW5U7Vt+myRNk1lg71i+zPkf8hw23NaYDmbLuCC5T5k+4ViNDa1CVmd
   HWbgtHigfDFK3sxOKUEDAj3suQhvl3YYhLkX+0gDoF/o61Az6jQW8/7xA
   ky/b8/ib8TFwxT2U7JknUmxJ6o8KZevyhVSBJ4PU4Yp990xLxxxuLBUjT
   M9zRTAtVF7NBZ1b+hoY4hLIIhEUXLpPfXRpVtOvo2scQfEnSqkxb1CQvi
   /0nyBy/PT2K8NVK2FijpjFnnNWPZVuxvzFqSki0BUbPEJGFpaQV+kFFYg
   g==;
X-CSE-ConnectionGUID: ZYHtWZc3TvqUGhfrqDYhJg==
X-CSE-MsgGUID: d9FE3y2LQFSRzj1yxrZV6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="58191648"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58191648"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 06:35:46 -0700
X-CSE-ConnectionGUID: 9dN+0VpwQamRIvD3bwh12w==
X-CSE-MsgGUID: hhTa0mucQReDw4wRDTyakg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170573230"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Sep 2025 06:35:44 -0700
Message-ID: <2f5efd07-2e04-49b8-a4d1-37e4f68ddfba@linux.intel.com>
Date: Mon, 1 Sep 2025 16:35:42 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Hide Intel Birch Stream SoC TCO WDT
To: Chiasheng Lee <chiasheng.lee@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, linux-i2c@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 stable@vger.kernel.org
References: <20250901125943.916522-1-chiasheng.lee@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250901125943.916522-1-chiasheng.lee@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/25 3:59 PM, Chiasheng Lee wrote:
> Hide the Intel Birch Stream SoC TCO WDT feature since it was removed.
> 
> On platforms with PCH TCO WDT, this redundant device might be rendering
> errors like this:
> 
> [   28.144542] sysfs: cannot create duplicate filename '/bus/platform/devices/iTCO_wdt'
> 
> Fixes: 8c56f9ef25a3 ("i2c: i801: Add support for Intel Birch Stream SoC")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chiasheng Lee <chiasheng.lee@linux.intel.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220320
> ---
>   drivers/i2c/busses/i2c-i801.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index a7f89946dad4..e94ac746a741 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1052,7 +1052,7 @@ static const struct pci_device_id i801_ids[] = {
>   	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
>   	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
>   	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
> -	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
> +	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5)			 },
>   	{ PCI_DEVICE_DATA(INTEL, ARROW_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
>   	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
>   	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

