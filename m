Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE20D1A2337
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 15:43:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgDHNn2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 09:43:28 -0400
Received: from mga01.intel.com ([192.55.52.88]:3546 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726754AbgDHNn1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 8 Apr 2020 09:43:27 -0400
IronPort-SDR: cy52Gp4RrHgxtqDf63T65Fo3HKXKm+BgC+j85LQF3t4lTHeHTziD3nO0oKP4q1pdzLyji9J22D
 BgiJTZdxLKuQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 06:43:26 -0700
IronPort-SDR: dG8z2cw1pW2SWUz2Iv+H2Hq+zJvLpjf1NpEABwKCf/4Wvv6FkMARE+rQalznlXG83l/D+q42s5
 PuxVzOWdeDYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,358,1580803200"; 
   d="scan'208";a="244038225"
Received: from tthayer-hp-z620.an.intel.com (HELO [10.122.105.146]) ([10.122.105.146])
  by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2020 06:43:20 -0700
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH v1 17/28] i2c: altera: convert to
 devm_platform_ioremap_resource
To:     Dejin Zheng <zhengdejin5@gmail.com>, krzysztof.adamski@nokia.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
        nsekhar@ti.com, bgolaszewski@baylibre.com,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, matthias.bgg@gmail.com,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        baohua@kernel.org, linus.walleij@linaro.org, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org, michal.simek@xilinx.com,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com, kstewart@linuxfoundation.org,
        allison@lohutok.net, gregkh@linuxfoundation.org,
        tglx@linutronix.de, bigeasy@linutronix.de, info@metux.net,
        hslester96@gmail.com, narmstrong@baylibre.com,
        martin.blumenstingl@googlemail.com, qii.wang@mediatek.com,
        drinkcat@chromium.org, hsinyi@chromium.org, fparent@baylibre.com,
        opensource@jilayne.com, swinslow@gmail.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200407163741.17615-1-zhengdejin5@gmail.com>
 <20200407163741.17615-18-zhengdejin5@gmail.com>
From:   Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <626c205a-2f19-ea80-b817-ab64d51cfff7@linux.intel.com>
Date:   Wed, 8 Apr 2020 08:43:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200407163741.17615-18-zhengdejin5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 4/7/20 11:37 AM, Dejin Zheng wrote:
> use devm_platform_ioremap_resource() to simplify code, which
> contains platform_get_resource and devm_ioremap_resource.
> 
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>

Acked-by: Thor Thayer <thor.thayer@linux.intel.com>

> ---
>   drivers/i2c/busses/i2c-altera.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-altera.c b/drivers/i2c/busses/i2c-altera.c
> index 1de23b4f3809..7c4c836a3228 100644
> --- a/drivers/i2c/busses/i2c-altera.c
> +++ b/drivers/i2c/busses/i2c-altera.c
> @@ -382,7 +382,6 @@ static const struct i2c_algorithm altr_i2c_algo = {
>   static int altr_i2c_probe(struct platform_device *pdev)
>   {
>   	struct altr_i2c_dev *idev = NULL;
> -	struct resource *res;
>   	int irq, ret;
>   	u32 val;
>   
> @@ -390,8 +389,7 @@ static int altr_i2c_probe(struct platform_device *pdev)
>   	if (!idev)
>   		return -ENOMEM;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	idev->base = devm_ioremap_resource(&pdev->dev, res);
> +	idev->base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(idev->base))
>   		return PTR_ERR(idev->base);
>   
> 

