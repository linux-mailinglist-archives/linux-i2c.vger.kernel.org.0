Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450397C6ADD
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 12:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbjJLKVr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 06:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343665AbjJLKVq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 06:21:46 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20880B7;
        Thu, 12 Oct 2023 03:21:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7106C433C7;
        Thu, 12 Oct 2023 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697106104;
        bh=Vb9bvzF9Stu4u5tXverHSofAvhWMAcSAdOtthdU05Yk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TBijRpEZh3zVbeUBQFQHwvk/CkzFHFiX9gAqaeJ807ZkHaGKz/0iodjjCLXudy1Jc
         UOv53masyx6V3Crg2OBUwy24L39u0FxPQsPuZTFm+m3AApbrFJ4BhMxBCD+92xWMqk
         G5CRqOdAYpHjdUwBEskI+4KMhbw14ONUIBjPZvtq24abadFe+qCtDcOTuUu+w/vurn
         GaniWv7EQn5T0y2XsB1t+o17EMA/iP9+U2sEBaFRttjJ10darBtjjsBj4TDUsG7FKz
         qnz97xicFdK7XEOw63h6Pu1H2gTVK+0AJ+xzLFW/4TcECx+pMpOfivpXVxPChL5+jp
         0veC8S3Yuv0JA==
Date:   Thu, 12 Oct 2023 12:21:40 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     gregory.clement@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: mv64xxx: add an optional reset-gpios property
Message-ID: <20231012102140.kydfi2tppvhd7bdn@zenone.zhora.eu>
References: <20231012035838.2804064-1-chris.packham@alliedtelesis.co.nz>
 <20231012035838.2804064-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012035838.2804064-3-chris.packham@alliedtelesis.co.nz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

...

>  static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx = {
> @@ -1083,6 +1084,10 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  	if (drv_data->irq < 0)
>  		return drv_data->irq;
>  
> +	drv_data->reset_gpio = devm_gpiod_get_optional(&pd->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(drv_data->reset_gpio))
> +		return PTR_ERR(drv_data->reset_gpio);

if this optional why are we returning in case of error?

> +
>  	if (pdata) {
>  		drv_data->freq_m = pdata->freq_m;
>  		drv_data->freq_n = pdata->freq_n;
> @@ -1121,6 +1126,12 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  			goto exit_disable_pm;
>  	}
>  
> +	if (drv_data->reset_gpio) {
> +		udelay(1);
> +		gpiod_set_value_cansleep(drv_data->reset_gpio, 0);
> +		udelay(1);

you like busy waiting :-)

What is the reason behind these waits? Is there anything
specified by the datasheet?

If not I would do a more relaxed sleeping like an usleep_range...
what do you think?

Andi
