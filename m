Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E69676BF53
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Aug 2023 23:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbjHAVde (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 17:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjHAVdd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 17:33:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDF3DF;
        Tue,  1 Aug 2023 14:33:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4191E6170A;
        Tue,  1 Aug 2023 21:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F96C433C8;
        Tue,  1 Aug 2023 21:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690925611;
        bh=N9595aIRtgEYC1wv4klCYsZBtIX9mnv8I2dQa+xe4WI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V7zR6NXbCz3tareXxeIsXLTgG1IvW4ieR8TDtVGr38y7iQLykq5fNUXoiQqkj70RU
         WUDM3gjnmQ89qZkIdrCgxs3aV+IYuiTo/l2hMKsmCjd+Bkalrk9PddfKNzt37WWm+R
         icY8hCLfzaJiJONZpP72dMbGisz5QIOryULvXPzhcQtayCVnDSXoELZj2szhWS92ZH
         f1qeExSqGItS3Ltm08ZqsM+vpv1Vnu0vOHAWcFWUynL8+W0+VHzjysg11N5cdssrms
         dbTGlEwNlXxFx7S1zi7i2bzAQfHQDOsPRKMYeyLCASz5g6pLkqPCausOQE95teXR+k
         ovSomW86mTzMA==
Date:   Tue, 1 Aug 2023 23:33:28 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Liao Chang <liaochang1@huawei.com>
Cc:     florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/9] i2c: mlxbf: Use dev_err_probe in probe function
Message-ID: <20230801213328.l6g2zumnobo43ixg@intel.intel>
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-3-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728013148.1720978-3-liaochang1@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Liao,

On Fri, Jul 28, 2023 at 09:31:41AM +0800, Liao Chang wrote:
> Use the dev_err_probe function instead of dev_err in the probe function
> so that the printed messge includes the return value and also handles
> -EPROBE_DEFER nicely.
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  drivers/i2c/busses/i2c-mlxbf.c | 44 ++++++++++++----------------------
>  1 file changed, 15 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
> index ae66bdd1b737..b5f2aa2fc1db 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -2323,10 +2323,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
>  
>  		ret = mlxbf_i2c_init_resource(pdev, &priv->smbus,
>  					      MLXBF_I2C_SMBUS_RES);
> -		if (ret < 0) {
> -			dev_err(dev, "Cannot fetch smbus resource info");
> -			return ret;
> -		}
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Cannot fetch smbus resource info");
>  
>  		priv->timer->io = priv->smbus->io;
>  		priv->mst->io = priv->smbus->io + MLXBF_I2C_MST_ADDR_OFFSET;
> @@ -2334,10 +2332,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
>  	} else {
>  		ret = mlxbf_i2c_init_resource(pdev, &priv->timer,
>  					      MLXBF_I2C_SMBUS_TIMER_RES);
> -		if (ret < 0) {
> -			dev_err(dev, "Cannot fetch timer resource info");
> -			return ret;
> -		}
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Cannot fetch timer resource info");
>  
>  		ret = mlxbf_i2c_init_resource(pdev, &priv->mst,
>  					      MLXBF_I2C_SMBUS_MST_RES);

You forgot one here 

	return dev_err_probe(dev, "Cannot fetch master resource info");

Andi

> @@ -2348,25 +2344,19 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
>  
>  		ret = mlxbf_i2c_init_resource(pdev, &priv->slv,
>  					      MLXBF_I2C_SMBUS_SLV_RES);
> -		if (ret < 0) {
> -			dev_err(dev, "Cannot fetch slave resource info");
> -			return ret;
> -		}
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "Cannot fetch slave resource info");
