Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50763356AD3
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Apr 2021 13:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243046AbhDGLLg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Apr 2021 07:11:36 -0400
Received: from mga04.intel.com ([192.55.52.120]:62600 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232994AbhDGLLb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 7 Apr 2021 07:11:31 -0400
IronPort-SDR: lY34MZcNGHHO3lvqMBxPwYIfcYMg2+w+HAPSbIeGS8Z+Mn/UeW8iZmYSj2HfYbJH4FMHpiph6o
 s5LWMV+OfUXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="191122092"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="191122092"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2021 04:11:19 -0700
IronPort-SDR: uVRW1BMEqcGLGKtEctf4WFkeryvwDZMZWXLHWqESmJ2fwQ8Dso3yFQGjIr5iZIuJ9hAk5fItVL
 kY8RhHcwuDuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; 
   d="scan'208";a="421659132"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by orsmga008.jf.intel.com with ESMTP; 07 Apr 2021 04:11:17 -0700
Subject: Re: [PATCH -next v2] i2c: designware: Fix return value check in
 navi_amd_register_client()
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
References: <20210407031137.2750993-1-weiyongjun1@huawei.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <d0db9434-76a4-d8a3-f73c-8229c69b1e8f@linux.intel.com>
Date:   Wed, 7 Apr 2021 14:11:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210407031137.2750993-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/7/21 6:11 AM, Wei Yongjun wrote:
> In case of error, the function i2c_new_client_device() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
> 
> Fixes: 17631e8ca2d3 ("i2c: designware: Add driver support for AMD NAVI GPU")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 -> v2: fix description format.
> ---
>   drivers/i2c/busses/i2c-designware-pcidrv.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
> index 7ca0017883a6..0f409a4c2da0 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -132,8 +132,8 @@ static int navi_amd_register_client(struct dw_i2c_dev *dev)
>   	info.irq = dev->irq;
>   
>   	dev->slave = i2c_new_client_device(&dev->adapter, &info);
> -	if (!dev->slave)
> -		return -ENODEV;
> +	if (IS_ERR(dev->slave))
> +		return PTR_ERR(dev->slave);
>   
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
