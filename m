Return-Path: <linux-i2c+bounces-10981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E22BAB643F
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 09:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CF373BDD44
	for <lists+linux-i2c@lfdr.de>; Wed, 14 May 2025 07:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165FE2144A3;
	Wed, 14 May 2025 07:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlL1+zLr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD86215075;
	Wed, 14 May 2025 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207515; cv=none; b=SaL/qbwgdEEWZv9Og+ztMYOZItgmT+jEa0Tbde9Z4KgSwA7Ora17hAIxv7vNdLF306nnuNZboF6LtW9JCJaKF+DS2l8T9PWRWA6BRfV3RiDSHQZp0on4seNF3RhHiafDbGFX6z50ZNwBr7PiJ0Gsr3SloiFSlsj12rigMlJ6qaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207515; c=relaxed/simple;
	bh=BilRJ6f8t76bTmUmG4gNO1cINv8bzGBDa+3qwuJJbbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fx7+NfeqgzgLYpPdcWawF1SalHCB3BdrdkDwbPgs2bBisdDypNDmxlsp2TiQUG7I826BjSLTtuBIkCPMNlKOJFpeTbGg1vzwXhHan1aYbdNueQYTZvGEbnbvVuHOGbGPS23phLXFiIMifZxVTeQaHLs2cFhfMQN1yFToqHotr90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BlL1+zLr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747207513; x=1778743513;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BilRJ6f8t76bTmUmG4gNO1cINv8bzGBDa+3qwuJJbbg=;
  b=BlL1+zLrMlqnPZm6QgntIrM533VcQyvGEBRDf1eb8MgujGlgdA/E3aIs
   Lv4NaLy/MOG9bll5StccxBx6r8h0hH+HVHwzRlqUeJQ+b4xh1wt9UbYp+
   AYx0hc6FB14OCpvL1oDPwn7r2+vf63+6ei1ORSWihcGKjw3nzb/A2uKKq
   FJWKNjrh3EePkm2ISNzYI0EW/kDpOyZjTuyt/s2NZr5plqUVLvJdfNO/Z
   mOBcM3TkdeC0vuM+syFjWGswZQjaThs+UlXmdsRLYEuvJ61kJrDC1gin/
   8c8Iu28iG875azBhgJsLDIh4d2hNjAw+UR7VRxULM2pufQdsDgndvloUg
   w==;
X-CSE-ConnectionGUID: 5D8MoYKtSIuGaR7/6UeQoQ==
X-CSE-MsgGUID: lGVNGCB3SNuW7D3U7XYoRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59747129"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="59747129"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 00:25:12 -0700
X-CSE-ConnectionGUID: ZqYaBnWjQwyzCriZP917pw==
X-CSE-MsgGUID: RkVqje+FQ1eb7+rf2PELNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="175083321"
Received: from unknown (HELO [10.237.72.53]) ([10.237.72.53])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2025 00:25:10 -0700
Message-ID: <6fe4e253-330d-4681-af89-834a045dd183@linux.intel.com>
Date: Wed, 14 May 2025 10:25:08 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: designware: Fix an error handling path in
 i2c_dw_pci_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
 Sanket Goswami <Sanket.Goswami@amd.com>, Wolfram Sang <wsa@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <fcd9651835a32979df8802b2db9504c523a8ebbb.1747158983.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <fcd9651835a32979df8802b2db9504c523a8ebbb.1747158983.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 8:56 PM, Christophe JAILLET wrote:
> If navi_amd_register_client() fails, the previous i2c_dw_probe() call
> should be undone by a corresponding i2c_del_adapter() call, as already done
> in the remove function.
> 
> Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GPU")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

