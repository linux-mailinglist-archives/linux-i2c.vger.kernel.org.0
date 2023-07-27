Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA6A765D5F
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 22:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjG0UbD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 16:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbjG0Ua5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 16:30:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2793A80;
        Thu, 27 Jul 2023 13:30:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 545C861F40;
        Thu, 27 Jul 2023 20:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED73EC433C7;
        Thu, 27 Jul 2023 20:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690489848;
        bh=mQBtNRNqjOs/lQt6R/EIsW6LRcenyV0myrRrv1wFZ0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ALFJR+wYo9wRrPqbJ70y8hQ58UfdRlVokpUzFGN4Q8UoPpydHwMBVKmbeaIP1nMz2
         hO22rLNz2b539G4e45tfpYkrFp8WSZbJcFcgzHXuRqtX1AVvZ1JKOgk+rTCll7Lmz7
         dEmsiLqRZZPZjpv7gHEIWddvqbvA1ijnDUnuvRmfl70dO4fa2EuhKl1bHhxv8D+xTb
         IMqjJdOPhDD+PGEbLAHEKZqF0FDXjcfq8GuVmnjBfR31MgZ3NNeZb4/JLsEhGC9VbQ
         EzQq9ZAVFykggSleDerNeRCXLxKmtDuvDkRqtl0kfJuJW7AbY0VKGvE6v1hzPZE1d9
         vpT2j6JK5NIvg==
Date:   Thu, 27 Jul 2023 22:30:45 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Mans Rullgard <mans@mansr.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: add support for I2C_M_STOP flag
Message-ID: <20230727203045.2p7mbdtayca2hago@intel.intel>
References: <20230706125729.17335-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706125729.17335-1-mans@mansr.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mans,

on top of Oleksij's comments...

[...]

> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1262,10 +1262,17 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  
>  	/* read/write data */
>  	for (i = 0; i < num; i++) {
> -		if (i == num - 1)
> -			is_lastmsg = true;
> +		if (is_lastmsg) {
> +			/* previous message had I2C_M_STOP flag set */
> +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +			temp |= I2CR_MSTA;
> +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +			result = i2c_imx_bus_busy(i2c_imx, 1, atomic);
> +			if (result)
> +				goto fail0;
> +		}
>  
> -		if (i) {
> +		if (i && !is_lastmsg) {

	} else if (i) {

looks a bit simplier to me.

>  			dev_dbg(&i2c_imx->adapter.dev,
>  				"<%s> repeated start\n", __func__);
>  			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> @@ -1275,6 +1282,10 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  			if (result)
>  				goto fail0;
>  		}
> +
> +		if (i == num - 1 || (msgs[i].flags & I2C_M_STOP))
> +			is_lastmsg = true;

you don't need this "i == num - 1" here.

Andi

>  		dev_dbg(&i2c_imx->adapter.dev,
>  			"<%s> transfer message: %d\n", __func__, i);
>  		/* write/read data */
