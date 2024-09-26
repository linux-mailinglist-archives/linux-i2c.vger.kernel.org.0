Return-Path: <linux-i2c+bounces-7023-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A7986F26
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 10:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79EF51C215C4
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 08:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EED91A4E8D;
	Thu, 26 Sep 2024 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiM9DgdY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7B418C333;
	Thu, 26 Sep 2024 08:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727340299; cv=none; b=fjeLqYcJdpnhaBt4xobTdfjUKF+SFbVIxwVNPud1/n9GeCMSs6FVcW3hMoR3assuZ6MpWvZ0IhYoBTEeQq0mpOPqIvk4+4hy8jvoyUnmFY+Tue76e5+H59m2DD3XsEkdF6i3y9hw/l4VCWP2AYEOhpSMwmQ1mA8MSXzWfUDOaYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727340299; c=relaxed/simple;
	bh=JqMJShm7YLgNXiFy1N3Et7Jwq6PhUFTOWYv3lI9TMHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdPWQ0a9xERFCS8ho5ptYklOyWkr46VQw99SL9EW7HDHzg6bo1nSy2cyYqEEB4N61bCpEKPK9vmwonfpfoKjlVveKoYAJzphl2cQaQAztJVZa8tkqT4t7SSSLyLSErn1KRVQPJsWagnQRG9NDo0H1l2/QxeHrgu0xvmDHXSnlxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiM9DgdY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727340296; x=1758876296;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JqMJShm7YLgNXiFy1N3Et7Jwq6PhUFTOWYv3lI9TMHo=;
  b=MiM9DgdYsHyNR1xiB7pU7evoHMgVqGuyQCz3UXRboGB6etz3NGTZYuFN
   M7S5BlAuPOdZOfMmmYZleTnsf9vwwp7I8DeWO4tkrOc2O8ScSmqlPaniW
   zmv5QC0IteSaNhhEHcNJWUPto/STgUn6DPqYrdpv0x/xa2/DNZCZQascl
   HvDPaNnq+MNPpondl+Tx+W/zBMPF0hNtV3s/gnLj9JazX6y1dhmxZaGhB
   vVWgQPakHfdLnDJaxnAiMS2N4pIn86Kt7S1Ts1lTHUiCY3bUsQJChEumx
   gguSkWNy1V7jCtQGCvTMgruGi7BzHkqp+AfUOXEUa23dxsA5sM6Dc5lPb
   A==;
X-CSE-ConnectionGUID: TY6EvM+UQVuGp408PE11aA==
X-CSE-MsgGUID: nYFCUKc8S6y3DTFw4+M4OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26289706"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="26289706"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 01:44:56 -0700
X-CSE-ConnectionGUID: ynSu07btTU6X6RgoMOSZ3g==
X-CSE-MsgGUID: TYxoQrYPR4mprMCdknkrAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; 
   d="scan'208";a="109541371"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by orviesa001.jf.intel.com with ESMTP; 26 Sep 2024 01:44:54 -0700
Message-ID: <1986acc5-6c6c-4795-b9c6-8dde5410c4cf@linux.intel.com>
Date: Thu, 26 Sep 2024 11:44:52 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i2c: designware: Add a new ACPI HID for HJMC01 I2C
 controller
To: "hunter.yu" <hunter.yu@hj-micro.com>, andriy.shevchenko@linux.intel.com,
 lenb@kernel.org, rafael@kernel.org, jsd@semihalf.com, andi.shyti@kernel.org
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
 andy.xu@hj-micro.com, peter.du@hj-micro.com
References: <20240926024026.2539-1-hunter.yu@hj-micro.com>
 <20240926024026.2539-3-hunter.yu@hj-micro.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240926024026.2539-3-hunter.yu@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/24 5:40 AM, hunter.yu wrote:
> Define a new ACPI HID for HJMC01
> 
> Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 2d0c7348e491..701506e92380 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -354,6 +354,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
>   	{ "HISI02A1", 0 },
>   	{ "HISI02A2", 0 },
>   	{ "HISI02A3", 0 },
> +	{ "HJMC3001", 0 },
>   	{ "HYGO0010", ACCESS_INTR_MASK },
>   	{ "INT33C2", 0 },
>   	{ "INT33C3", 0 },

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

