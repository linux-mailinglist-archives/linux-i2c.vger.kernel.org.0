Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE725BA7B0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Sep 2022 10:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiIPIBt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Sep 2022 04:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiIPIBs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Sep 2022 04:01:48 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F825F7CA
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 01:01:46 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id n23-20020a17090a091700b00202a51cc78bso18619713pjn.2
        for <linux-i2c@vger.kernel.org>; Fri, 16 Sep 2022 01:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=nkGnxSMIb/wiSJKbmxLQ/m9Ao5VknrbUC17meInnGGU=;
        b=oYV19wqa/N6LwszZ3BM+NN0WV+2gRj4W9xAiZv2LJLhAJ2TFU7eQiP8BSreF9xjxa/
         a3qFI43CPoVJ+r53XjXYI+h13sE3ukrO2nmavd6n3TGst7eiNd+KQbUv5ELxcT06SnpG
         3lWpQICu+xqyktWeGiHTt6xU8c6hhkF/vxCZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=nkGnxSMIb/wiSJKbmxLQ/m9Ao5VknrbUC17meInnGGU=;
        b=qE+cUy2VC7egJhnYyjL09XzBp8L7xsbAb4e6VUw3W8WtBDMG7lDdluBCOhSCx5Cwc+
         on/Zk41hpszuQzUW2Vy4gLomXfS7jJftBtaKnRmCqo+gXLYG0taetRIkFIQXKS+6x74J
         lvuO2SA2waIGE3rlMQhQ/tCls0WzEGX3s3TasIjPeR0dtv/0kLMARgA/NSajRVA9pz+R
         WWOUNygywJaRQUpZhaQPA56b9tf3uNye1WzGt7FTCAFi48Gi2XxBEgT1vxXxHfKjbuFO
         qzYhCKvUpsSXA8ktYdSNIPLKT6+r35zqZeCVFa4bXF2yCEysQs+0aLWm6OkRsMFdTiqf
         b1EA==
X-Gm-Message-State: ACrzQf3h4vSmJ5OYEwSr+BZ11+nIEGgMdX5KxOeT+ugQQpNbXqkNenSR
        nxpifSEaLJKrg1xg5d6DutGfDg==
X-Google-Smtp-Source: AMsMyM4ODZxPbEU4PY0URQmKsDdqGfJo8KCIyTiVvgW0EhSUCsvJgNmxnyLp+etHib8E+qy7dkqDFg==
X-Received: by 2002:a17:902:b08b:b0:178:48b6:f5a8 with SMTP id p11-20020a170902b08b00b0017848b6f5a8mr3557009plr.3.1663315306287;
        Fri, 16 Sep 2022 01:01:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 129-20020a620487000000b0053e984a887csm14050231pfe.96.2022.09.16.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 01:01:44 -0700 (PDT)
Date:   Fri, 16 Sep 2022 01:01:42 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <202209160046.016AC8B4@keescook>
References: <YyMM8iVSHJ4ammsg@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyMM8iVSHJ4ammsg@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 15, 2022 at 02:30:58PM +0300, Dan Carpenter wrote:
> A couple years back we went through the kernel an automatically
> converted size calculations to use struct_size() instead.  The
> struct_size() calculation is protected against integer overflows.
> 
> However it does not make sense to use the result from struct_size()
> for additional math operations as that would negate any safeness.
> 
> Fixes: 1f3b69b6b939 ("i2c: mux: Use struct_size() in devm_kzalloc()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/i2c/i2c-mux.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 774507b54b57..313904be5f3b 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -243,9 +243,10 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
>  				   int (*deselect)(struct i2c_mux_core *, u32))
>  {
>  	struct i2c_mux_core *muxc;
> +	size_t mux_size;
>  
> -	muxc = devm_kzalloc(dev, struct_size(muxc, adapter, max_adapters)
> -			    + sizeof_priv, GFP_KERNEL);
> +	mux_size = struct_size(muxc, adapter, max_adapters);
> +	muxc = devm_kzalloc(dev, size_add(mux_size, sizeof_priv), GFP_KERNEL);
>  	if (!muxc)
>  		return NULL;
>  	if (sizeof_priv)

The new variable makes it more readable, but beyond that, do you see any
reason not to just directly compose the calls?

diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index 774507b54b57..6c481cde6517 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -244,8 +244,10 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
 {
 	struct i2c_mux_core *muxc;
 
-	muxc = devm_kzalloc(dev, struct_size(muxc, adapter, max_adapters)
-			    + sizeof_priv, GFP_KERNEL);
+	muxc = devm_kzalloc(dev,
+			    size_add(struct_size(muxc, adapter, max_adapters),
+				     sizeof_priv),
+			    GFP_KERNEL);
 	if (!muxc)
 		return NULL;
 	if (sizeof_priv)

> -- 
> 2.35.1
> 

-- 
Kees Cook
