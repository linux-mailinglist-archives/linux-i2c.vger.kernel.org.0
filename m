Return-Path: <linux-i2c+bounces-6868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5297C7F1
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 12:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24D9F1C24AC4
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Sep 2024 10:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FF0199FAB;
	Thu, 19 Sep 2024 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJNq3JxD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A319994D;
	Thu, 19 Sep 2024 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726741566; cv=none; b=Glw3lODhqBPYUorsmVEaTd7H4KOnTDojjc5VSeRT/7+hsZCB29gSw2xL12dW8uwDjCbfDLkJ/aVy7aV+dbULW5zMdChGjBj5xlQ+ayKTBmCjj9hOLZHUxMRxITb3P086ARZOZVRzhTwRxhnNUk0R3qYAYyTWcJmGxqI3vjmsnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726741566; c=relaxed/simple;
	bh=1Vzrg7f58Zcse7hkKRuWza7MKe2xN4VgLESOZofIRhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gHw57ma0PyAIClGsfmeoMPeeAKGSRarfpWuFN/W85xl5rUOn9OjAKK6PhpsILT3W02LhD9c2WJWyqLytAVWT+O6HK3dmRmKGF5R6Ai3Bz6raosLV28X38VKGQFRH+PE7yN146YKnV8MkBF2EYGtmzHVhKDnIu9SPH1Qqp6RB7OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJNq3JxD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726741564; x=1758277564;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1Vzrg7f58Zcse7hkKRuWza7MKe2xN4VgLESOZofIRhc=;
  b=UJNq3JxDf78P4PAXsnqn4HYNuvL9dll92hqngzMUfDgmLv+fK/MjkFUj
   IgAQLTObZwlsTxTVP/zqmfR/frmwjYXsGCSqLiQzlvfTKvjWjd6FsBYcT
   9i9nghUqeZXkFh44bL1LuU1zfxLwzxho6/ICv7mJkcCux5GPxxMKvXMPc
   AdvdBqGGu/kFIB5d+r6qwCWLzFxHBttXRtIahWzSBFVwPN4Z1YkXUfBxH
   kfeu8NUHo+xa1igSqVKWjpsxaOiBjyBl4m1zPdf7lpKGwWJB2K1KLXX5n
   ZBNQm3lYIChW4nrGuFiB/DayKF6NhrTQkQk7R3vHB1YjW7DzPDLYjpX2m
   Q==;
X-CSE-ConnectionGUID: oPvWHeNGSHKkt3hfOkx66Q==
X-CSE-MsgGUID: CYRxpj6mQkOaqzyjWd/s9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25177122"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="25177122"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 03:26:03 -0700
X-CSE-ConnectionGUID: IcLxXcsuSlOnq6brDhCH0g==
X-CSE-MsgGUID: 0xOWo0RCQaSaTdAMbempzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="70135808"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa010.fm.intel.com with ESMTP; 19 Sep 2024 03:26:01 -0700
Message-ID: <81af4ed3-dbbf-482f-9e24-5fc0d1edac6f@linux.intel.com>
Date: Thu, 19 Sep 2024 13:26:00 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: designware: Add a new ACPI HID for HJMC01 I2C
 controller
To: hunter.yu@hj-micro.com, rafael@kernel.org, lenb@kernel.org,
 andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
 jsd@semihalf.com, andi.shyti@kernel.org
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240919062943.1551197-1-hunter.yu@hj-micro.com>
 <20240919062943.1551197-3-hunter.yu@hj-micro.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240919062943.1551197-3-hunter.yu@hj-micro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/24 9:29 AM, hunter.yu@hj-micro.com wrote:
> From: "hunter.yu" <hunter.yu@hj-micro.com>
> 
> Define a new ACPI HID for HJMC01
> 
> Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index df3dc1e8093e..06dcefa3b103 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -58,6 +58,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
>   	{ "HISI02A2", 0 },
>   	{ "HISI02A3", 0 },
>   	{ "HYGO0010", ACCESS_INTR_MASK },
> +	{ "HJMC3001", 0 },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

