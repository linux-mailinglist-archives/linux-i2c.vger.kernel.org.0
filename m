Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC01770F81
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 13:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbjHELxJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 07:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjHELxI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 07:53:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C08E21720
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 04:53:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5541960CBB
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 11:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6204AC433C7;
        Sat,  5 Aug 2023 11:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691236386;
        bh=Kid2m3FLS75HibfEZ+BwImQC32aGpD56PqxWjkRmQbE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mk+ggaFNpKfS23niW9HIcnPWHSxUWOCUNcXMm71mhNAfujQZBUzCAbkfCuB8nKuyU
         EOX1mYhz5UZq6N9FLNjKl7DQ+dyP+IuUFp50yQSUuvuo8Cyoi3MFWtn+9PYH5yvCwF
         VE6HH5/ZSVgNrZXphAwkU+BAzwuNBYliw+aIGIEgFeckzpzGuhDOdDhNKdA/kNLXNW
         DgSMiMocgXcwE5mm5jSMsVe0fSmHAkbeV8BLOjfDz1YaEfWP+3MN4+tf3NXCGgvmMa
         ICO/NMtku6oyh6CSmushigVi/pwR3IgdaVA6TqzEu90vIuTP1pqzddAYPPAviMz23f
         5AEVzk+pGjglg==
Date:   Sat, 5 Aug 2023 13:53:04 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     michael.hennerich@analog.com, peda@axentia.se,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH -next] i2c: mux: ltc4306: Remove an unnecessary ternary
 operator
Message-ID: <20230805115304.mas62dncqpznzane@intel.intel>
References: <20230801025328.3380963-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801025328.3380963-1-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ruan,

On Tue, Aug 01, 2023 at 10:53:28AM +0800, Ruan Jinjie wrote:
> The true or false judgement of the ternary operator is unnecessary
> in C language semantics. So remove it to clean Code.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/i2c/muxes/i2c-mux-ltc4306.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-ltc4306.c b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> index 5a03031519be..637e25506490 100644
> --- a/drivers/i2c/muxes/i2c-mux-ltc4306.c
> +++ b/drivers/i2c/muxes/i2c-mux-ltc4306.c
> @@ -62,7 +62,7 @@ static const struct chip_desc chips[] = {
>  
>  static bool ltc4306_is_volatile_reg(struct device *dev, unsigned int reg)
>  {
> -	return (reg == LTC_REG_CONFIG) ? true : false;
> +	return reg == LTC_REG_CONFIG;

This patch on its own is not bringing much improvement... I'm
taking it into my branch, but next time please insert it in a
wider scope.

Acked-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi

>  }
>  
>  static const struct regmap_config ltc4306_regmap_config = {
> -- 
> 2.34.1
> 
