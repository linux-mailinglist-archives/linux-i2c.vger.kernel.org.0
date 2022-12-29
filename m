Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D49658936
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Dec 2022 04:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiL2Dpf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Dec 2022 22:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiL2Dpe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Dec 2022 22:45:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10E6813D10;
        Wed, 28 Dec 2022 19:45:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BD1BBB81919;
        Thu, 29 Dec 2022 03:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA76C433D2;
        Thu, 29 Dec 2022 03:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672285531;
        bh=1eG+vfsuOTEp5lMdzeozHZZhoHfPdz4Dbi+B5tC4EUw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XwmA19D+5wQOQohnKgaWTpzXW/QAc7NfpCJI9fPOjuwUsUElfTxClWcYIjdvYjYNe
         /vdyK7rab6NZYNnNi9TzCpnNyF/Nxffx+OkQJxOpv/J5NxW8671zKTYyt0a3o6BpaV
         6RMDyBopMV/GJKg8d+vH4ko/F9J9775z7Nq4am+Q8aG+NqN0HzYaHNfTu4GWZ5Vmwa
         5L65h6GeXoR0LU3M11TOEFIA23BHfocXc/908cYRe3Ko8SZ4XL8O1R+OgGi4RuSigj
         pc8R+6hJcfhp03GmBBGBE29kBLGPzx2ky4qApmJ21PqDMmycwRWk3s4AZcR79ro105
         3ZU+fR+YJ90gA==
Date:   Wed, 28 Dec 2022 21:45:29 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        neil.armstrong@linaro.org, wsa@kernel.org
Subject: Re: [PATCH -next] i2c: qcom-geni: change i2c_master_hub to static
Message-ID: <20221229034529.yrs6u3yj4ge6e7mr@builder.lan>
References: <20221228093403.3165722-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228093403.3165722-1-yangyingliang@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Dec 28, 2022 at 05:34:02PM +0800, Yang Yingliang wrote:
> i2c_master_hub is only used in i2c-qcom-geni.c now,
> change it to static.
> 
> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub variant")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index f292e4dab98f..fd22fcb07da2 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1029,7 +1029,7 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
>  									NULL)
>  };
>  
> -const struct geni_i2c_desc i2c_master_hub = {
> +static const struct geni_i2c_desc i2c_master_hub = {
>  	.has_core_clk = true,
>  	.icc_ddr = NULL,
>  	.no_dma_support = true,
> -- 
> 2.25.1
> 
