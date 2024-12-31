Return-Path: <linux-i2c+bounces-8844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBAE9FEFDA
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2024 14:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C5923A28DB
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2024 13:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E12319A28D;
	Tue, 31 Dec 2024 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjvI7B80"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79630199396
	for <linux-i2c@vger.kernel.org>; Tue, 31 Dec 2024 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735652925; cv=none; b=pzjSmY6rM0RRKPK87Xi9mXwMF/gWGKiYVVoVpoYns3ACKjGPzExOXoSgkDgb4BCYf9nlxvP6piGWG38l2avrKbFSt/3JyKbMDNkxwLrQlsr2rl+sTZ+hqARBFZ4ziEwbMSHvoNFp21+OJxsv9wY1tKTO6L3/OAkKgu6p2snw7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735652925; c=relaxed/simple;
	bh=XiZRjZTyDCjntQSg1jzq3cohS1bTv/FmokwtUF9uqK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RJSZyReb+B3pB3vrPmomgMXxGP0962slaUz089ToxTlfC5x21m8bj2RPLWQC+duQUWtV1YgdG9LTiOm0VVHGy8uxes8aErsYRr79V5rJJJEWcLXx9LmbhaA37KOyfLFPMeLg2LBJrzSD9ala98lSvU5R5Jhe9TDWDM7Q0uWUfpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjvI7B80; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735652924; x=1767188924;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XiZRjZTyDCjntQSg1jzq3cohS1bTv/FmokwtUF9uqK4=;
  b=fjvI7B80wDNmV80qJbXXZEmNZxqery0s1m/7DK7TlhGe7L1WbbauIfn0
   rlgf4HCfqESv3j2R3wi6v79UoAo8GteKssTXS/rpiDIGe5NPsWtRKdXUX
   dsxEt2nEUL7b/JBOESpNZeiAEpVmBBWd4wOww/k9N988nedkdLo8aXQP0
   /D58hP7liJbA1Z/TqsTJj5vFF7KnC/snzsJHsfNaMyCylHneHw77lVkQQ
   1GFWDTWC6wn9JUTFsEqntXNTtPZ6vdUXih0ZXE9QGYISuHBd7m/SIfdfY
   Lb5UuXhrF/il1yNCTH5z6eY2MSlCpmDTTL7o+wB/7QkbSSKnifuKBpZoP
   Q==;
X-CSE-ConnectionGUID: jBmwn7BATwyBtL8D/XR75w==
X-CSE-MsgGUID: L78IfxizTiWWrkiH3wfS5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36045975"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; 
   d="scan'208";a="36045975"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 05:48:41 -0800
X-CSE-ConnectionGUID: e0xgTaYOQfup6nU9eE1l8Q==
X-CSE-MsgGUID: unxUloHYTBmEjaSEOtrKrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105109708"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP; 31 Dec 2024 05:48:39 -0800
Message-ID: <6f3978a7-66d8-4035-b3a4-7b6533b168a2@linux.intel.com>
Date: Tue, 31 Dec 2024 15:48:38 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: designware: Actually make use of the
 I2C_DW_COMMON and I2C_DW symbol namespaces
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org
References: <20241230155948.3211743-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241230155948.3211743-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/30/24 5:59 PM, Uwe Kleine-König wrote:
> DEFAULT_SYMBOL_NAMESPACE must already be defined when <linux/export.h>
> is included. So move the define above the include block.
> 
> Fixes: fd57a3325a77 ("i2c: designware: Move exports to I2C_DW namespaces")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> Changes since (implicit) v1 that is available at
> https://lore.kernel.org/linux-i2c/20241203173640.1648939-2-u.kleine-koenig@baylibre.com:
> 
>   - Also fix drivers/i2c/busses/i2c-designware-master.c
>   - Make added line breaks consistent
> 
>   drivers/i2c/busses/i2c-designware-common.c | 4 ++--
>   drivers/i2c/busses/i2c-designware-master.c | 5 +++--
>   drivers/i2c/busses/i2c-designware-slave.c  | 4 ++--
>   3 files changed, 7 insertions(+), 6 deletions(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

