Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8CC7AA463
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 00:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbjIUWHe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 18:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231795AbjIUWHO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 18:07:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64701C85C8
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 14:14:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686A6C433C7;
        Thu, 21 Sep 2023 21:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695330866;
        bh=3ISIXPSYynm8nPwODdS4GfSYhDZNyO3F8ZKPeuidRmY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U5+JcMajn4MgTDeQoDLLw80MISA3dpE2T0yFFzc56YFxKnOkCfdBxjLIeRDyDXpQE
         oFgiad11Mn1lK8jJim173ABmYa67Vh+Sf6NbC2wpL0PcuHHptQjS4W9zYLFyJ15V/I
         /RB0rhzCtw2fShr++CAk8vmb0jVqk25MIZS7wYi8wEQsCSXdCkQCI/1KsrzsYZcNjE
         0jkBGzfcoqo+YQRxIym3tZZvEV+1uHgxNd1BsKrvOo21h0QWqZQSV3Hjl3CloiFMHC
         bq7fQ012HKPEQAJzMUA907jWSkn4jfouO2Us+va3+0i/fLHZKUN6aGbLuf5yMExcmq
         gT7cgS3u13JSg==
Date:   Thu, 21 Sep 2023 23:14:23 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: use i2c_mark_adapter_suspended/resumed
Message-ID: <20230921211423.e55vvjmckfwhusxj@zenone.zhora.eu>
References: <0d13ed54-af1d-4c21-a90c-ba8c6b03f67e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d13ed54-af1d-4c21-a90c-ba8c6b03f67e@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Heiner,

On Wed, Sep 20, 2023 at 09:29:28AM +0200, Heiner Kallweit wrote:
> When entering the suspend callback, at first we should ensure that
> transfers are finished and I2C core can't start further transfers.
> Use i2c_mark_adapter_suspended() for this purpose, and complement it
> with a call to i2c_mark_adapter_resumed() in the resume path.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> Rebased version of a previously discussed patch, now w/o touching
> the remove and shutdown path.
> ---
>  drivers/i2c/busses/i2c-i801.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 6d02a8b88..26f132277 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1818,6 +1818,7 @@ static int i801_suspend(struct device *dev)
>  {
>  	struct i801_priv *priv = dev_get_drvdata(dev);
>  
> +	i2c_mark_adapter_suspended(&priv->adapter);
>  	i801_restore_regs(priv);
>  
>  	return 0;
> @@ -1829,6 +1830,7 @@ static int i801_resume(struct device *dev)
>  
>  	i801_setup_hstcfg(priv);
>  	i801_enable_host_notify(&priv->adapter);
> +	i2c_mark_adapter_resumed(&priv->adapter);

I think I already reviewed this patch previously and I had same
concerns as Jean, anyway,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
