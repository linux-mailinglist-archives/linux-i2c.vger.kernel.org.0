Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D04B17D9A83
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 15:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345991AbjJ0Nyo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 09:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345943AbjJ0Nyn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 09:54:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871B2CA;
        Fri, 27 Oct 2023 06:54:41 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21798C433C9;
        Fri, 27 Oct 2023 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698414881;
        bh=ktN7hyJ+GNKver1d9aZsdKJs8Qxg7i+2jzt1jy1ctS8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ds11b5WfFnE+LnjhXFWHoXvF6ZwlyLnh3hvUqqkvHacECUo8yQqOyJ3sCNmIlGUsS
         YSTuXThk2wuu3Hu8QjQ2eFhA0aZNz3lLLHWjHw+pNknrTNRxk/LGgzFe2pjyc22Jck
         tOdg0j1G+Z/8SgJphflp1T9nP64UHbARuCrgToRAQD0f79Wpy+ke+JfmgUCJJEFHUg
         bwow16DTv3vrS8/aEY28/la11ZBexR2uvthxXVXY+nsRhdjX/gqXeNTtN4/p+7WZT1
         KRl6WP+7gnIVKclj6gvpSnmTmO+4gUYWoOaAH4sZyvbyzRhHJwc2/wMOnAY1iZKuIe
         EUuvTwVP40DNg==
Date:   Fri, 27 Oct 2023 15:54:36 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: s3c24xx: add support for atomic transfers
Message-ID: <20231027135436.sutdnctsgofyik4g@zenone.zhora.eu>
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
 <CGME20231025121740eucas1p2db798a12d80580af321c75edf5d59663@eucas1p2.samsung.com>
 <20231025121725.46028-4-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025121725.46028-4-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

On Wed, Oct 25, 2023 at 02:17:25PM +0200, Marek Szyprowski wrote:
> 

you left a blank space in your commit log.

> Add support for atomic transfers using polling mode with interrupts
> intentionally disabled to get rid of the warning introduced by commit
> 63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
> during system reboot and power-off.

What warning?

Andi

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 8da85cb42980..586b82b30bdf 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -76,6 +76,7 @@
>  #define QUIRK_HDMIPHY		(1 << 1)
>  #define QUIRK_NO_GPIO		(1 << 2)
>  #define QUIRK_POLL		(1 << 3)
> +#define QUIRK_ATOMIC		(1 << 4)
>  
>  /* Max time to wait for bus to become idle after a xfer (in us) */
>  #define S3C2410_IDLE_TIMEOUT	5000
> @@ -174,7 +175,7 @@ static inline void s3c24xx_i2c_master_complete(struct s3c24xx_i2c *i2c, int ret)
>  	if (ret)
>  		i2c->msg_idx = ret;
>  
> -	if (!(i2c->quirks & QUIRK_POLL))
> +	if (!(i2c->quirks & (QUIRK_POLL | QUIRK_ATOMIC)))
>  		wake_up(&i2c->wait);
>  }
>  
> @@ -700,7 +701,7 @@ static int s3c24xx_i2c_doxfer(struct s3c24xx_i2c *i2c,
>  	s3c24xx_i2c_enable_irq(i2c);
>  	s3c24xx_i2c_message_start(i2c, msgs);
>  
> -	if (i2c->quirks & QUIRK_POLL) {
> +	if (i2c->quirks & (QUIRK_POLL | QUIRK_ATOMIC)) {
>  		while ((i2c->msg_num != 0) && is_ack(i2c)) {
>  			unsigned long stat = readl(i2c->regs + S3C2410_IICSTAT);
>  
> @@ -774,6 +775,21 @@ static int s3c24xx_i2c_xfer(struct i2c_adapter *adap,
>  	return -EREMOTEIO;
>  }
>  
> +static int s3c24xx_i2c_xfer_atomic(struct i2c_adapter *adap,
> +				   struct i2c_msg *msgs, int num)
> +{
> +	struct s3c24xx_i2c *i2c = (struct s3c24xx_i2c *)adap->algo_data;
> +	int ret;
> +
> +	disable_irq(i2c->irq);
> +	i2c->quirks |= QUIRK_ATOMIC;
> +	ret = s3c24xx_i2c_xfer(adap, msgs, num);
> +	i2c->quirks &= ~QUIRK_ATOMIC;
> +	enable_irq(i2c->irq);
> +
> +	return ret;
> +}
> +
>  /* declare our i2c functionality */
>  static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
>  {
> @@ -784,6 +800,7 @@ static u32 s3c24xx_i2c_func(struct i2c_adapter *adap)
>  /* i2c bus registration info */
>  static const struct i2c_algorithm s3c24xx_i2c_algorithm = {
>  	.master_xfer		= s3c24xx_i2c_xfer,
> +	.master_xfer_atomic     = s3c24xx_i2c_xfer_atomic,
>  	.functionality		= s3c24xx_i2c_func,
>  };
>  
> -- 
> 2.34.1
> 
