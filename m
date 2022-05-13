Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 252F1526196
	for <lists+linux-i2c@lfdr.de>; Fri, 13 May 2022 14:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbiEMMN1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 May 2022 08:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbiEMMN0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 13 May 2022 08:13:26 -0400
X-Greylist: delayed 331 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 13 May 2022 05:13:21 PDT
Received: from mout-u-107.mailbox.org (mout-u-107.mailbox.org [80.241.59.207])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2729D296BE0;
        Fri, 13 May 2022 05:13:20 -0700 (PDT)
Received: from smtp202.mailbox.org (unknown [91.198.250.118])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-u-107.mailbox.org (Postfix) with ESMTPS id 4L06pl62Lhz9spV;
        Fri, 13 May 2022 14:07:43 +0200 (CEST)
Message-ID: <1da97e8e-c819-c089-1fe1-07915ec37898@denx.de>
Date:   Fri, 13 May 2022 14:07:42 +0200
MIME-Version: 1.0
Subject: Re: [PATCH -next 2/2] i2c: mt7621: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc:     matthias.bgg@gmail.com, wsa@the-dreams.de
References: <20220513100819.2711845-1-yangyingliang@huawei.com>
 <20220513100819.2711845-2-yangyingliang@huawei.com>
From:   Stefan Roese <sr@denx.de>
In-Reply-To: <20220513100819.2711845-2-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4L06pl62Lhz9spV
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13.05.22 12:08, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/i2c/busses/i2c-mt7621.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index f117c3d9ca19..0d849379a236 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -270,18 +270,15 @@ static void mtk_i2c_init(struct mtk_i2c *i2c)
>   
>   static int mtk_i2c_probe(struct platform_device *pdev)
>   {
> -	struct resource *res;
>   	struct mtk_i2c *i2c;
>   	struct i2c_adapter *adap;
>   	int ret;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
>   	i2c = devm_kzalloc(&pdev->dev, sizeof(struct mtk_i2c), GFP_KERNEL);
>   	if (!i2c)
>   		return -ENOMEM;
>   
> -	i2c->base = devm_ioremap_resource(&pdev->dev, res);
> +	i2c->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>   	if (IS_ERR(i2c->base))
>   		return PTR_ERR(i2c->base);
>   

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
