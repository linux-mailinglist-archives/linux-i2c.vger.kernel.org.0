Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56EE744311
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Jun 2023 22:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjF3UKt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 30 Jun 2023 16:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjF3UKs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Jun 2023 16:10:48 -0400
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA771BDF
        for <linux-i2c@vger.kernel.org>; Fri, 30 Jun 2023 13:10:43 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id FKS0qDqJXtqCNFKS0qy9cb; Fri, 30 Jun 2023 22:10:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1688155842;
        bh=y2u6WlB/0vH/xyKke5iyXC4imFnTCNt+j5LDvLCSDmE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=BPVVtasyPJa4r3cYp9QqZEC4mq8EEnn6zWeaNPTeUE3TFIBk8ecVgJBWQk7ivHHjh
         a5fLWGUXsr/ZZ93H/NhxfPo5+RvmIiygR6exYicUtVyTq59uJSH0ICmyXplYLaTza3
         zPC/mNuCxmryryrLdp8wG3KfRd8TMo4J1g3YbVS1VYjWTN2YY5PR2Qi2RmmR//Qbay
         gJ6jn+iBRNHYqHjfNh1g0vmemawdPRqfhbSodmwRcPtcDcGI/eWqa7SI+yX4Jb5Kqk
         uwPUYtBIUTPvPV6tJRo4uBFsnLGAs4oWDo3vbH9W6QIg57LXOV91Ycg3yGBVcfC2O2
         1jvRPPFP8Mydg==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 30 Jun 2023 22:10:41 +0200
X-ME-IP: 86.243.2.178
Message-ID: <8ac04af8-eff8-bfe1-647a-2d04f5739702@wanadoo.fr>
Date:   Fri, 30 Jun 2023 22:10:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] i2c: busses: i2c-nomadik: Remove a useless call in the
 remove function
Content-Language: fr, en-US
To:     linus.walleij@linaro.org, Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <4f4c2c5c20b61c4bb28cb3e9ab4640534dd2adec.1629530169.git.christophe.jaillet@wanadoo.fr>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <4f4c2c5c20b61c4bb28cb3e9ab4640534dd2adec.1629530169.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

"drivers/i2c/busses/i2c-nomadik.c" just got some loved, so I was 
wondering if the below patch could be reviewed.

It does not apply anymore because of the recent change, but the 
explanation in the commit message and the proposed change still make 
sense to me.

If it looks valid, I could send a V2.

So any feedback would be appreciated.

CJ


Le 21/08/2021 à 09:17, Christophe JAILLET a écrit :
> Since commit a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of
> git://git.pengutronix.de/git/wsa/linux"), there is no more
> 'request_mem_region()' call in this driver.
> 
> So remove the 'release_mem_region()' call from the remove function which is
> likely a left over.
> 
> There is no details in the above commit log, but at its end we can read:
>     Conflicts:
> 	   drivers/i2c/busses/i2c-nomadik.c
> 
> This may explain why this call has been left here.
> 
> Fixes: a410963ba4c0 ("Merge branch 'i2c-embedded/for-next' of git://git.pengutronix.de/git/wsa/linux
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is completely speculative and without details about commit
> a410963ba4c0 it's hard to be sure of the intent.
> 
> All I can say is that it looks logical to me and that it compiles!
> ---
>   drivers/i2c/busses/i2c-nomadik.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
> index a2d12a5b1c34..e215a7357873 100644
> --- a/drivers/i2c/busses/i2c-nomadik.c
> +++ b/drivers/i2c/busses/i2c-nomadik.c
> @@ -1057,7 +1057,6 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
>   
>   static void nmk_i2c_remove(struct amba_device *adev)
>   {
> -	struct resource *res = &adev->res;
>   	struct nmk_i2c_dev *dev = amba_get_drvdata(adev);
>   
>   	i2c_del_adapter(&dev->adap);
> @@ -1067,7 +1066,6 @@ static void nmk_i2c_remove(struct amba_device *adev)
>   	/* disable the controller */
>   	i2c_clr_bit(dev->virtbase + I2C_CR, I2C_CR_PE);
>   	clk_disable_unprepare(dev->clk);
> -	release_mem_region(res->start, resource_size(res));
>   }
>   
>   static struct i2c_vendor_data vendor_stn8815 = {

