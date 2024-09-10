Return-Path: <linux-i2c+bounces-6460-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3AC972CCB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 476D31F257F0
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39D4018801A;
	Tue, 10 Sep 2024 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NP8Y53MN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0981CD1F;
	Tue, 10 Sep 2024 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725958964; cv=none; b=gNW+cQFFNS+8U7y2WoksH9bVO2QNgxjPKyolYTi34nSEsD04Qs7AAGJPAUJAYjw5q6j0H0Tk3HQpp8KXbNxUDUNgzffvvZdDYTUvvO5kgaeo107/A2tL+LyYDf8mATNE67z9o8pmA0PGv5NbCZCqh9WQ8bC6uB9GshThIUL0OOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725958964; c=relaxed/simple;
	bh=Oee4nX33sKfzOaZs9kUJYdhRTRWjYJghEwELM//R4yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVeysgtfoHxzlpGANtgVHnsw83MNCI0zcFKE5B4ubRR4sjKc3cxH6vLfm/Ly5H/lTt33dN58yeg/1TcIj6SYmeLNYIrqEac9Bvd83MAiPYWBfrikEBa7zO+HmUCMSdcB5q2D/8fL45ZqisTd2qfOuUgyoR2Zq6FnOOM98rwXD2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NP8Y53MN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725958962; x=1757494962;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oee4nX33sKfzOaZs9kUJYdhRTRWjYJghEwELM//R4yA=;
  b=NP8Y53MNajsTKexxugIgSJyh9pj80i778oU8C0zWdp9gW/Yio7ToEGri
   lguvsBP/uXKOZEGQohF54gMUfN26NzyJ7GH8k463Hfa40xD9LzZxtBgog
   jf5aRLyyatxNiYYAFRjsh2gnK7ThDRCxgLksYuiWWVmXIbNKpF55QppeI
   z5hDPf6bSkmWHXkp0RM9sACp5qowuWtAgh9tLIiXxPMvP+iowIs8y5SVm
   riQYkkZRQ7xmjgrDBbC/MoLnuFF/yT+Vf98OtjYy3zQN1yNkolE85vXtU
   Y3b52194ioCD5MRE5ypxP55mnLZb7JwM+332z2GEZhv23wJZ7ymTM1Hmp
   Q==;
X-CSE-ConnectionGUID: 6AWK39pfRa2YqIjihvaT5Q==
X-CSE-MsgGUID: h6LL4BIHTC6j4uEv3Fj5HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="27614599"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="27614599"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:02:41 -0700
X-CSE-ConnectionGUID: 98SGSRODQy+BfNzCSeDI6g==
X-CSE-MsgGUID: PTHpqKgfQeSDadDWbALJQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71560099"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2024 02:02:39 -0700
Message-ID: <3ededf4f-7fba-4b15-ada8-a7172bd56caa@linux.intel.com>
Date: Tue, 10 Sep 2024 12:02:38 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
 jsd@semihalf.com, andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/24 9:13 AM, Kimriver Liu wrote:
> It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
> IC_ENABLE is already disabled.
> 
> Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
> holding SCL low. If ENABLE bit is disabled, the software need
> enable it before trying to issue ABORT bit. otherwise,
> the controller ignores any write to ABORT bit.
> 
> Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> 
> ---
> V7->V8:
> 	1.calculate this delay based on the actual speed in use
> 	  fsleep(DIV_ROUND_CLOSEST_ULL(10 * MICRO, t->bus_freq_hz))
> 	2. add Reviewed-by: Mika Westerberg<mika.westerberg@linux.intel.com>
> V6->V7:
> 	1. add Subject versioning [PATCH v7]
> 	2. change fsleep(25) to usleep_range(25, 250)
> 	3. Add macro definition DW_iC_ENABLE_ENABLE to fix compile errors
> 	  | Reported-by: kernel test robot <lkp@intel.com>
> 	  | Closes:https://lore.kernel.org/oe-kbuild-all/202409082011.9JF6aYsk-lkp@intel.com/
> 	4. base: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=master
> V5->V6: restore i2c_dw_is_master_idling() function checking
> V4->V5: delete master idling checking
> V3->V4:
> 	1. update commit messages and add patch version and changelog
> 	2. move print the error message in i2c_dw_xfer
> V2->V3: change (!enable) to (!(enable & DW_IC_ENABLE_ENABLE))
> V1->V2: used standard words in function names and addressed review comments
> 
> link to V1:
> https://lore.kernel.org/lkml/20240904064224.2394-1-kimriver.liu@siengine.com/
> ---
>   drivers/i2c/busses/i2c-designware-common.c | 13 +++++++++++++
>   drivers/i2c/busses/i2c-designware-core.h   |  1 +
>   drivers/i2c/busses/i2c-designware-master.c | 22 ++++++++++++++++++++++
>   3 files changed, 36 insertions(+)
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

