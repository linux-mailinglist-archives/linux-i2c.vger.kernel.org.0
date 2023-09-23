Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0558F7ABEF8
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Sep 2023 10:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjIWIzy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Sep 2023 04:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbjIWIzx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Sep 2023 04:55:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15DB136;
        Sat, 23 Sep 2023 01:55:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7759C433C8;
        Sat, 23 Sep 2023 08:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695459347;
        bh=IlRVCJ8O0p2MjXVihLdAMeFBt3OGx8uaK4b2Zzeaz8w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mzQ0HVMbw2Ng88dNE181Wv0rallPGi2QMXv9yWD8/t8WuJQVvz3rV6ukJ/+20Zzsh
         FNZZD5D2NC29W7XEbTCNzLMx7bHn2JWaEOLYLo3XHmZgUkEkxNwBrFZXSgjT4TDUo1
         R7WdmA3E0u6gdaTziygQrTz00wq+FDfHT3dZ31SjaJlW0yUkpv/2ITaDDKRkQUBEZu
         eVZi8uogSy7+kTTdstNJrUchwXpwPeqRAhjqF6en9oWVC9VWuOAvXu24oSMJSG3rZq
         pUI1TJzuA2esIXmNdW4X+3C8TEa8wq3qXMIIFm9IMTf9k61ic+T9cfgn8f4zmgpenS
         6CYUaXW+k3KwA==
Date:   Sat, 23 Sep 2023 10:56:49 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] media: i2c: Annotate struct i2c_atr with __counted_by
Message-ID: <ZQ8Y0btrpGuESo4F@work>
References: <20230922175424.work.863-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922175424.work.863-kees@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 22, 2023 at 10:54:25AM -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct i2c_atr.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Wolfram Sang <wsa@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Tom Rix <trix@redhat.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  drivers/i2c/i2c-atr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
> index 8ca1daadec93..f21475ae5921 100644
> --- a/drivers/i2c/i2c-atr.c
> +++ b/drivers/i2c/i2c-atr.c
> @@ -94,7 +94,7 @@ struct i2c_atr {
>  
>  	struct notifier_block i2c_nb;
>  
> -	struct i2c_adapter *adapter[];
> +	struct i2c_adapter *adapter[] __counted_by(max_adapters);
>  };
>  
>  static struct i2c_atr_alias_pair *
> -- 
> 2.34.1
> 
> 
