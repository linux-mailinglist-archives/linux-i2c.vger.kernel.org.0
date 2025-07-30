Return-Path: <linux-i2c+bounces-12086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B98B16192
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 15:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AAA617CB65
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Jul 2025 13:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D47298987;
	Wed, 30 Jul 2025 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgiGaKK6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588592905;
	Wed, 30 Jul 2025 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882305; cv=none; b=NCGSq8yB4XXLfmm6A2rDTi8GQzZogxQFrpM4VEnwkIrK2vkXEnxNRoJ5X+LwvJYR02+StSVz6wZaxhVEGaeqdHuQ4zHDzQCQeUq6Ki5gIP2u9RZZYsFvK69k2e6Rz+aUTxj6oAXwSCu7Z7ALQRq2C9gnuLOxq3yd0MeF8zjnTMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882305; c=relaxed/simple;
	bh=32UX8JXuUGyGSGlifVuoyArglRHWLRbygc+imo84SQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDMI/A92yvkYjS3eKzpsZaNIZXTKDuBiIZLedw8ohi2TDWT7/E23UHnep/6CcEoLDJmc6goG2gSFtjEtVSYiNNFS0br2Kyf+9pg8i58BottSlm0urmeWL3TYCb65eN6UsiDWXRGhGKFhsXJ7q4P7zbO1KYeMGLXB+bCg3oa7r5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgiGaKK6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753882303; x=1785418303;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=32UX8JXuUGyGSGlifVuoyArglRHWLRbygc+imo84SQg=;
  b=DgiGaKK6/0KhowpR1belonkDvHZqckLihGUP0ebuNqUz43MIuZEh9oYN
   u60rGEeOPaFkQFHEKFIqmSlPvuLXrq0YX/k6XASs6x6d1jNdGUJ5j/Taz
   ZLuS12+TM7xVkqCzBTMMDkJIZgYz9ggCmA7X7VdEeI1EAJFPPktKl46bn
   Df3xqtXjSwgRges7aHJuJU63X6Of4v2/PF8Zx66ebqYHnM2s0P07OPklx
   7Sxz0z1H6s//IZt+NB7s3cMUmeNizxx0fuh3X8IIICtJBjlvmMXiMnhSa
   dPI71W8F+X6IK5xhrm3T+7jaDXKw8qrcBjV8T/ksPtnYBD9g38LQS/AIA
   Q==;
X-CSE-ConnectionGUID: Hul0MLgFS5WOZV/sILjeVw==
X-CSE-MsgGUID: Nu0kgvoiRw6+HJxIEUpWcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66456381"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="66456381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 06:31:42 -0700
X-CSE-ConnectionGUID: YF3g1y/YTa++KBmWWPqVEQ==
X-CSE-MsgGUID: 7Mfwb/ISSX6lQMw44wQECQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167240932"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2025 06:31:40 -0700
Message-ID: <97091c58-b893-46cd-aae9-18b04bd2ae58@linux.intel.com>
Date: Wed, 30 Jul 2025 16:31:39 +0300
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: designware: Fix clock issue when PM is
 disabled
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Kohei Ito <ito.kohei@socionext.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250724042211.2160339-1-hayashi.kunihiko@socionext.com>
 <20250724042211.2160339-2-hayashi.kunihiko@socionext.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250724042211.2160339-2-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 7/24/25 7:22 AM, Kunihiko Hayashi wrote:
> When removing the driver, enable the clocks once by calling
> pm_runtime_get_sync(), and call pm_runtime_put_sync() to disable
> the clocks.
> 
> If CONFIG_PM=y, clocks for this controller are disabled when it's in
> the idle state. So the clocks are properly disabled when the driver
> exits.
> 
> Othewise, the clocks are always enabled and the PM functions have
> no effect. Therefore, the driver exits without disabling the clocks.
> 
>      # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
>      18
>      # echo 1214a000.i2c > /sys/bus/platform/drivers/i2c_designware/bind
>      # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
>      20
>      # echo 1214a000.i2c > /sys/bus/platform/drivers/i2c_designware/unbind
>      # cat /sys/kernel/debug/clk/clk-pclk/clk_enable_count
>      20
> 
> To ensure that the clocks can be disabled correctly even without
> CONFIG_PM=y, should add the following fixes:
> 
> - Replace with pm_runtime_put_noidle(), which only decrements the runtime
>    PM usage count.
> - Call i2c_dw_prepare_clk(false) to explicitly disable the clocks.
> 
> Fixes: 7272194ed391f ("i2c-designware: add minimal support for runtime PM")
> Co-developed-by: Kohei Ito <ito.kohei@socionext.com>
> Signed-off-by: Kohei Ito <ito.kohei@socionext.com>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>   drivers/i2c/busses/i2c-designware-platdrv.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
Good catch!

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

