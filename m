Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7254D3566E2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 10:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244864AbhDGIcj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 04:32:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:49711 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244949AbhDGIci (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 04:32:38 -0400
IronPort-SDR: 26woun6F62rJtDQ9RnOjQHC7NiO+3jFNPeansRZ/F80Cu0DN4NvPn++cyr/sqyPIbfObQiu1cp
 Y8yieMcWQpLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="213648064"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="213648064"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2021 01:32:14 -0700
IronPort-SDR: NbSLsRqgo5vTWbDeh7/ht5zJtyo1Nt8F8KOD6rhNicoY4gaYZuKIwDKuvV1SYo3ukSTb2yGDeV
 +4LIOjHKeavQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="421598177"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2021 01:32:11 -0700
Subject: Re: [PATCH v6 3/5] i2c: add support for HiSilicon I2C controller
To:     Yicong Yang <yangyicong@hisilicon.com>, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        Sergey.Semin@baikalelectronics.ru, linux-kernel@vger.kernel.org
Cc:     digetx@gmail.com, treding@nvidia.com, rmk+kernel@armlinux.org.uk,
        song.bao.hua@hisilicon.com, john.garry@huawei.com,
        mika.westerberg@linux.intel.com, prime.zeng@huawei.com,
        linuxarm@huawei.com
References: <1617197790-30627-1-git-send-email-yangyicong@hisilicon.com>
 <1617197790-30627-4-git-send-email-yangyicong@hisilicon.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <f1d50200-93f5-2c35-933a-01a1e7622983@linux.intel.com>
Date:   Wed, 7 Apr 2021 11:32:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1617197790-30627-4-git-send-email-yangyicong@hisilicon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 3/31/21 4:36 PM, Yicong Yang wrote:
> +	ret = device_property_read_u64(dev, "clk_rate", &ctlr->clk_rate_khz);
> +	if (ret) {
> +		dev_err(dev, "failed to get clock frequency, ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ctlr->clk_rate_khz = DIV_ROUND_UP_ULL(ctlr->clk_rate_khz, HZ_PER_KHZ);
> +

I'd use a temp variable here for reading the "clk_rate" property in 
Hertz and calculating the derived kHz value from it. As a bonus allow to 
use u32 for clk_rate_khz instead of u64. u32 will still provide plenty 
of headroom :-)

Reason for temp variable is for me it's confusing to see statement like 
"rate_khz = rate_khz / 1000".

Jarkko
