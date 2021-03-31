Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6596734FBBA
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 10:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233033AbhCaIgD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 04:36:03 -0400
Received: from mga17.intel.com ([192.55.52.151]:7881 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231818AbhCaIfb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 04:35:31 -0400
IronPort-SDR: PbcfHwnkPmksgWsQGLR8/cQa0FBnAiUZxgpj1o3spNrDsEx99kZrOzuGa3fQAx2SKq1yjA12oq
 CSBnIb4Tva7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="171975903"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="171975903"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 01:35:27 -0700
IronPort-SDR: oS3hEJDsIQSfc5HUmZO7kb01krVToVL+09b6714k3DEtfW7laak399SXzComZL5x//KeWPfZEd
 ET5E2P3NY4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="418562455"
Received: from mylly.fi.intel.com (HELO [10.237.72.184]) ([10.237.72.184])
  by orsmga008.jf.intel.com with ESMTP; 31 Mar 2021 01:35:24 -0700
Subject: Re: [PATCH v5 2/5] i2c: core: add api to provide frequency mode
 strings
To:     Yicong Yang <yangyicong@hisilicon.com>, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org
Cc:     digetx@gmail.com, treding@nvidia.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
References: <1617113966-40498-1-git-send-email-yangyicong@hisilicon.com>
 <1617113966-40498-3-git-send-email-yangyicong@hisilicon.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <0561a225-3dbb-97b1-a0a8-223520885c05@linux.intel.com>
Date:   Wed, 31 Mar 2021 11:35:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1617113966-40498-3-git-send-email-yangyicong@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 3/30/21 5:19 PM, Yicong Yang wrote:
> Some I2C drivers like Designware and HiSilicon will print the
> bus frequency mode information, so add a public one that everyone
> can make use of.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   include/linux/i2c.h | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 10bd0b0..6837e64 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -47,6 +47,26 @@ typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
>   #define I2C_MAX_HIGH_SPEED_MODE_FREQ	3400000
>   #define I2C_MAX_ULTRA_FAST_MODE_FREQ	5000000
>   
> +static inline const char *i2c_freq_mode_string(u32 bus_freq_hz)
> +{
> +	switch (bus_freq_hz) {
> +	case I2C_MAX_STANDARD_MODE_FREQ:
> +		return "Standard Mode(100KHz)";
> +	case I2C_MAX_FAST_MODE_FREQ:
> +		return "Fast Mode(400KHz)";
> +	case I2C_MAX_FAST_MODE_PLUS_FREQ:
> +		return "Fast Mode Plus(1.0MHz)";
> +	case I2C_MAX_TURBO_MODE_FREQ:
> +		return "Turbo Mode(1.4MHz)";
> +	case I2C_MAX_HIGH_SPEED_MODE_FREQ:
> +		return "High Speed Mode(3.4MHz)";
> +	case I2C_MAX_ULTRA_FAST_MODE_FREQ:
> +		return "Ultra Fast Mode(5.0MHz)";
> +	default:
> +		return "Unknown Mode";
> +	}

A few minor nits here:
- KHz -> kHz
- Space between text and opening parenthesis: "Mode(" -> "Mode ("
- Space between number and unit: (1.0MHz) -> (1.0 MHz)

With those changes you may add my

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
