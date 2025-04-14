Return-Path: <linux-i2c+bounces-10331-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4425DA885D9
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 16:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 420AB581134
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 14:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292F84502A;
	Mon, 14 Apr 2025 14:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kln8X0I0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E865A79B;
	Mon, 14 Apr 2025 14:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640189; cv=none; b=bdtKxQspvx9FB2abo0q2jNvrMsls1hmkbFXQ3QcNtTGT03IGr+Y4g5CC3fCIkrm+7Vu+NLH16UhmvU0J8mJtT9BdBKaUEQhdtwOgjFfPJ0jT/CdGkK9UefNAzRwseh/TQq0uMCt4Fq9pkbuFl5MbL2KabCC/LbAiVz83HAYnalo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640189; c=relaxed/simple;
	bh=yL0Sa6QkPb6yOTB+AKE1N/5GefbRJ1U5BkCbUn4519M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMJTB5qtj/kEabTM78X1CJzcQXExN16lrBWgS+UBI4Q1y2sfSDGYZny5ka9K6ISyIMdCS1TUW7ypHMnV+gUfOAQqhcJ74mbBE1uzyNdNPA2Lx6vDH4txcuLDVnBi9y7Zm38kNaOku3gkl2pl43LiA8mF8vLMwlSfevoMP+10M9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kln8X0I0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744640188; x=1776176188;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yL0Sa6QkPb6yOTB+AKE1N/5GefbRJ1U5BkCbUn4519M=;
  b=kln8X0I004ePfzr5FIsUdCHl2UpI8gjJq0WEnH9IFNwmfMtfr7LO2ppF
   LifynZVYnUxE355oacO6n9ZEnLamroDD3Vmk2O5EKpr6PEE0bKUaTs94t
   D/M3dqcHSLt5TRN9lh/MXcocJdmJ1mYNLBGu/DMSN3RNKKmfzxtkyYh05
   dl91EvCdDMnBrBDpCguSY//MXLutjqTI3hdrj1gPHeWWEFEi18ZGfO4Kz
   e/n/t40z4/2LkgBZ4x9etxK5QNCvRTiEliIIfVhw7hI5qPfK2NkPpWBts
   0ZLwU3Z0i+uwxu4PgYEpTAC4jmXfi9Aa5ZFOOVmHGKHx7MI4uW/s+m7DS
   Q==;
X-CSE-ConnectionGUID: RdW9Uw0GQsOUdEA+XXKTVw==
X-CSE-MsgGUID: RNDKuIidRp2WJW9BH8ydSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45821629"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45821629"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 07:16:27 -0700
X-CSE-ConnectionGUID: 4Y9/6GOWReOyhUmHLgkaXg==
X-CSE-MsgGUID: C6Xn+4YpTYqHvW0bGRqXtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="129791245"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orviesa006.jf.intel.com with ESMTP; 14 Apr 2025 07:16:24 -0700
Message-ID: <7b619cf2-8f50-4f6e-9a5f-cce9112a99b3@linux.intel.com>
Date: Mon, 14 Apr 2025 17:16:23 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/1] i2c: designware: Add SMBus Quick Command support
To: ende.tan@starfivetech.com, linux-i2c@vger.kernel.org
Cc: andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
 jsd@semihalf.com, andi.shyti@kernel.org, linux-kernel@vger.kernel.org,
 leyfoon.tan@starfivetech.com, endeneer@gmail.com
References: <20250412093414.39351-1-ende.tan@starfivetech.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250412093414.39351-1-ende.tan@starfivetech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 4/12/25 12:34 PM, ende.tan@starfivetech.com wrote:
> From: Tan En De <ende.tan@starfivetech.com>
> 
> Add support for SMBus Quick Read and Quick Write commands.
> 
> Signed-off-by: Tan En De <ende.tan@starfivetech.com>
> ---
> v1 -> v2: Removed redundant check of tx_limit and rx_limit
> ---
>   drivers/i2c/busses/i2c-designware-core.h   |  4 ++++
>   drivers/i2c/busses/i2c-designware-master.c | 18 +++++++++++++++++-
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 347843b4f5dd..91f17181ece1 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -40,6 +40,8 @@
>   
>   #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
>   #define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
> +#define DW_IC_DATA_CMD_STOP			BIT(9)
> +#define DW_IC_DATA_CMD_CMD			BIT(8)
>   
If you like these defines would be nice to have in another patch before 
this and convert i2c-designware-master.c to use them instead of 0x100, 
BIT(9) and BIT(10) in existing code. Makes code more uniform together 
with your change.

I'm not demanding it but wanted to give you idea if you like to do some 
additional cleanups to the code :-)

