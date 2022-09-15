Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D970C5B9C58
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Sep 2022 15:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiIONvb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Sep 2022 09:51:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiIONva (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Sep 2022 09:51:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A041197515;
        Thu, 15 Sep 2022 06:51:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54BBBB8208C;
        Thu, 15 Sep 2022 13:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE9EC433D6;
        Thu, 15 Sep 2022 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663249887;
        bh=1G2tI40qsypf1pzSQWC49MrRmBGWTMcjQ7kM9tFd+lI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q0FAK9Bg/zxd8zF4v6KjnNWJzsPCsdcn0ETZuoAvSVffXz433DekuenTi4Gl7PTGL
         jC+XyU7zk2fBd09ezXAnLdL0m5DarsYEskBnC7m/2uDs9/t7Yu8g/F1ct4cK0DrwCC
         hvabd1Z30moBJaVch+/JDPxJGk303wUXDCF7StQwNJH2/cidSXk+Yl1ipQ05nhr/tH
         ums6BtTTjhOYkb1yx6SaB4XfFsXUdywaq52L534PXGP5z5D49z4NCNUIpKqhJmLIpV
         e017y18bjq2xEmIMVUMnPc87Ln832dmvOU7DBhNiTPh6ZdQ0wGW/6f/933P7O+fUu/
         N5U6pTRzu8+Ww==
Date:   Thu, 15 Sep 2022 14:51:21 +0100
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: harden i2c_mux_alloc() against integer
 overflows
Message-ID: <YyMt2cWtHC2SeG62@work>
References: <YyMM8iVSHJ4ammsg@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyMM8iVSHJ4ammsg@kili>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
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

Right; there most be a couple more similar cases out there. I'll
look for them and fix them. Thanks!

> 
> Fixes: 1f3b69b6b939 ("i2c: mux: Use struct_size() in devm_kzalloc()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

--
Gustavo

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
> -- 
> 2.35.1
> 
