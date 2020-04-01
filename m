Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B89D019B758
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Apr 2020 22:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732350AbgDAU7v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Apr 2020 16:59:51 -0400
Received: from mga09.intel.com ([134.134.136.24]:40805 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732337AbgDAU7v (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Apr 2020 16:59:51 -0400
IronPort-SDR: UI9jPPDF0ZiqmdqRwu/Tcm1zcsLWPQTkiFNryraBU295xCCz7nY0gbLKS+hVemQZloR4Yk2MMD
 zMikhnSIUsqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2020 13:59:50 -0700
IronPort-SDR: j73qyDkHDFNC1v5iegoQOsiaqW9Z07OudvDhOlyFKM6ZFFzVaAkRHwSuFaRzPSnZm2IvaYxm0/
 tUrUE5MufROA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,333,1580803200"; 
   d="scan'208";a="273309764"
Received: from tthayer-hp-z620.an.intel.com (HELO [10.122.105.146]) ([10.122.105.146])
  by fmsmga004.fm.intel.com with ESMTP; 01 Apr 2020 13:59:50 -0700
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH] i2c: altera: use proper variable to hold errno
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200327222826.10207-1-wsa+renesas@sang-engineering.com>
From:   Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <4170acee-b3d1-8c79-f895-706501223b59@linux.intel.com>
Date:   Wed, 1 Apr 2020 16:00:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200327222826.10207-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 3/27/20 5:28 PM, Wolfram Sang wrote:
> device_property_read_u32() returns errno or 0, so we should use the
> integer variable 'ret' and not the u32 'val' to hold the retval.
> 
> Fixes: 0560ad576268 ("i2c: altera: Add Altera I2C Controller driver")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Found while trying to refactor code handling "clock-frequency" property.
> 
>   drivers/i2c/busses/i2c-altera.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 1de23b4f3809..92d2c706c2a7 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -384,7 +384,6 @@ static int altr_i2c_probe(struct platform_device *pdev)
>   	struct altr_i2c_dev *idev = NULL;
>   	struct resource *res;
>   	int irq, ret;
> -	u32 val;
>   
>   	idev = devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
>   	if (!idev)
> @@ -411,17 +410,17 @@ static int altr_i2c_probe(struct platform_device *pdev)
>   	init_completion(&idev->msg_complete);
>   	spin_lock_init(&idev->lock);
>   
> -	val = device_property_read_u32(idev->dev, "fifo-size",
> +	ret = device_property_read_u32(idev->dev, "fifo-size",
>   				       &idev->fifo_size);
> -	if (val) {
> +	if (ret) {
>   		dev_err(&pdev->dev, "FIFO size set to default of %d\n",
>   			ALTR_I2C_DFLT_FIFO_SZ);
>   		idev->fifo_size = ALTR_I2C_DFLT_FIFO_SZ;
>   	}
>   
> -	val = device_property_read_u32(idev->dev, "clock-frequency",
> +	ret = device_property_read_u32(idev->dev, "clock-frequency",
>   				       &idev->bus_clk_rate);
> -	if (val) {
> +	if (ret) {
>   		dev_err(&pdev->dev, "Default to 100kHz\n");
>   		idev->bus_clk_rate = 100000;	/* default clock rate */
>   	}
> 
Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>
