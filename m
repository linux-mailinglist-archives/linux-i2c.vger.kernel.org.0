Return-Path: <linux-i2c+bounces-13080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E415DB8FFA7
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 12:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE3D87A767C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 10:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E69E285045;
	Mon, 22 Sep 2025 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YY5IOWPy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59042EDD63
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758536541; cv=none; b=EXN6cEw0ss5ZKwnjr3P+arWdXYF4IMp3UHgq6R/+Eq2hRJ6te+OftUQdXLK38LR0wc7zxit46D2PkU5q/fkPXvDahY0mWO4v7dxdy8KRI6LuLBdLe7R2n/CsnMxVAeSlkOANjJrJUku+K0wd0iFwNcsPV2ZTbtPgQkOISJ9hJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758536541; c=relaxed/simple;
	bh=lY1rkTcMag/21AFTTX3oCz5ymkmDMJPGPuGtPJCpF+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5FfFDuMLsW94EZ2JlEnip5pzxPQNdcmZSyQEsGDcr1/sArokB0emIiXcuhiqbJxEpUELZSPey4VMTACbyiGD518NOGdFV1xlmKbqyQD39yg8ZojpfiAJJOcUh3oT3qvW+xykA/pzeSVUxbgoZNS4QPI8+CLusJNVEQRX5cXOck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YY5IOWPy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758536539; x=1790072539;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lY1rkTcMag/21AFTTX3oCz5ymkmDMJPGPuGtPJCpF+4=;
  b=YY5IOWPyQAje9wTD/3Dnowy41wlBhp2q/8yA6NdA/E3V1eBq9FV7OkWB
   d8PFzUSv4WV9R9dmJgAq8/Wr01hAn3It6R2NpCpM53gK+kuaa3YS+4N2Y
   shUG2OAnkFUMw0KYrxVy6RO+07xh/dU7cPd+NLCeFL/dq5pCRjiilrWW3
   b3uAEM79hqJ4OaprL+xNecZV1J72Fk7D1i3sycESFfzdqSXuY2szwHkdV
   9FjL/WnfIorJXMXaE1Khnp+pujPz8i+HCbhmMOqY0sW1GKAohFEICeHPy
   IL5QENLOtjUHn3SLbDNzRhw5jMi52cDULfcn70sRmemCqCCCyJPV9SJVN
   w==;
X-CSE-ConnectionGUID: 7195l4qoQMOxxR+4ZFSbJg==
X-CSE-MsgGUID: 67FaC8VZSf+bhq6Dyj7wzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60850241"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60850241"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 03:22:18 -0700
X-CSE-ConnectionGUID: 59uUe0jeQBelCtLAoJ7B0w==
X-CSE-MsgGUID: 05KYqiPzSr+l7tJXFNbhVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="175578752"
Received: from mylly.fi.intel.com (HELO [10.237.72.52]) ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP; 22 Sep 2025 03:22:16 -0700
Message-ID: <c7826545-1aec-4edd-bb13-765c101b3a5a@linux.intel.com>
Date: Mon, 22 Sep 2025 13:22:15 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3 v2] i2c: designware: Extend check for mixed slave
 addresses
To: Jean Delvare <jdelvare@suse.de>, Linux I2C <linux-i2c@vger.kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
References: <20250918160341.39b66013@endymion>
 <20250918161054.7d650d2c@endymion> <20250919191400.29274d5d@endymion>
 <20250922101404.65f2ef3a@endymion>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250922101404.65f2ef3a@endymion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/25 11:14 AM, Jean Delvare wrote:
> The i2c-designware driver only supports transfers where all messages
> use the same slave address. This condition is currently tested in
> i2c_dw_xfer_msg(), with 2 limitations:
> * The code only checks the address value, not the 10-bit address
>    flag, so it could miss an address change.
> * For the AMD Navi GPU devices, the driver uses a dedicated function
>    instead of i2c_dw_xfer_msg(), so the check is not performed.
> 
> Move the check to the common code path, and add the 10-bit address
> flag comparison, to catch and report early if a given transfer is not
> supported.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---
> Changes since v1:
> * Use unlikely() to help the compiler minimize the performance penalty.
> 
>   drivers/i2c/busses/i2c-designware-master.c |   28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

