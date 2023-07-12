Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1EC3750D00
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbjGLPtO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbjGLPtN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:49:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58CAFB;
        Wed, 12 Jul 2023 08:49:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7B57161828;
        Wed, 12 Jul 2023 15:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BBCC433C7;
        Wed, 12 Jul 2023 15:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689176951;
        bh=1YAOFuwaMu/Dsn1MAvmn/2yPz2GA1fAtcKqHfMv4Q+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kTbeY9JpRwiaEn4NdoUDv/Q3oPRMBgZA8WgbtoL32W3VUMvCieCTPTvEI+mZAiDsd
         xYpy6Vc59NLVuUaaQ7T3nglwCveaEahgZ3C5BSWylX8krxGUG38TG4wwcbRyDefUwF
         mhKDuV+wepOzKvtd2W2Ayave7H+f5O0NnWzl2zuP2LFlwqc8CpaugGCxNE9auAmY3o
         JJ4kTFxlfSUuYC40JicNhaEv5y/1s8kXuG5KN9u63L8rXIU9jF7aboDnCIABUQ5EBM
         i9+/k86jFU3Mh+Ap0lhhGCiHEOiGq9l1Rom5wa1I1GL57XzQ6JWUPrFRvcsVhIdVin
         eETgQ0tzi+LcQ==
Date:   Wed, 12 Jul 2023 17:49:07 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/11] i2c: mlxbf: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712154907.zj7qvt5qml4g5khj@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
 <20230710063351.17490-4-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-4-frank.li@vivo.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yangtao,

On Mon, Jul 10, 2023 at 02:33:43PM +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

> ---
>  drivers/i2c/busses/i2c-mlxbf.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
> index ae66bdd1b737..2f60e5532b54 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -1080,13 +1080,7 @@ static int mlxbf_i2c_init_resource(struct platform_device *pdev,
>  	if (!tmp_res)
>  		return -ENOMEM;
>  
> -	tmp_res->params = platform_get_resource(pdev, IORESOURCE_MEM, type);
> -	if (!tmp_res->params) {
> -		devm_kfree(dev, tmp_res);
> -		return -EIO;
> -	}
> -
> -	tmp_res->io = devm_ioremap_resource(dev, tmp_res->params);
> +	tmp_res->io = devm_platform_get_and_ioremap_resource(pdev, type, &tmp_res->params);
>  	if (IS_ERR(tmp_res->io)) {
>  		devm_kfree(dev, tmp_res);

In a later patch we could also remove this redundant
devm_kfree().

Andi

>  		return PTR_ERR(tmp_res->io);
> -- 
> 2.39.0
> 
