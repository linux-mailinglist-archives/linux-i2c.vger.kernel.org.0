Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3ED4527DA7
	for <lists+linux-i2c@lfdr.de>; Mon, 16 May 2022 08:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbiEPGd0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 16 May 2022 02:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236110AbiEPGdZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 16 May 2022 02:33:25 -0400
X-Greylist: delayed 415 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 15 May 2022 23:33:23 PDT
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [IPv6:2001:67c:2050:101:465::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60E162983F
        for <linux-i2c@vger.kernel.org>; Sun, 15 May 2022 23:33:23 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4L1q5V1TT4z9sy0;
        Mon, 16 May 2022 08:26:22 +0200 (CEST)
Message-ID: <fe4d398e-978c-6784-e3f6-01b83da3f249@denx.de>
Date:   Mon, 16 May 2022 08:26:20 +0200
MIME-Version: 1.0
Subject: Re: [PATCH -next v2 1/2] i2c: mt7621: fix missing
 clk_disable_unprepare() on error in mtk_i2c_probe()
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc:     matthias.bgg@gmail.com, wsa@the-dreams.de,
        christophe.jaillet@wanadoo.fr
References: <20220514023148.305457-1-yangyingliang@huawei.com>
From:   Stefan Roese <sr@denx.de>
In-Reply-To: <20220514023148.305457-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4L1q5V1TT4z9sy0
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 14.05.22 04:31, Yang Yingliang wrote:
> Fix the missing clk_disable_unprepare() before return
> from mtk_i2c_probe() in the error handling case.
> 
> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

> ---
>     v2: add return 0 in normal path.
> ---
>   drivers/i2c/busses/i2c-mt7621.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 45fe4a7fe0c0..901f0fb04fee 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -304,7 +304,8 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	if (i2c->bus_freq == 0) {
>   		dev_warn(i2c->dev, "clock-frequency 0 not supported\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_disable_clk;
>   	}
>   
>   	adap = &i2c->adap;
> @@ -322,10 +323,15 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   
>   	ret = i2c_add_adapter(adap);
>   	if (ret < 0)
> -		return ret;
> +		goto err_disable_clk;
>   
>   	dev_info(&pdev->dev, "clock %u kHz\n", i2c->bus_freq / 1000);
>   
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(i2c->clk);
> +
>   	return ret;
>   }
>   

Viele Grüße,
Stefan Roese

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-51 Fax: (+49)-8142-66989-80 Email: sr@denx.de
