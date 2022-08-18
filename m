Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 808D85988D4
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 18:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344143AbiHRQ1i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 12:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344338AbiHRQ1a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 12:27:30 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EBE6F3AB33;
        Thu, 18 Aug 2022 09:27:29 -0700 (PDT)
Received: from localhost (p54b336f9.dip0.t-ipconnect.de [84.179.54.249])
        by pokefinder.org (Postfix) with ESMTPSA id 0CE90A416ED;
        Thu, 18 Aug 2022 18:27:29 +0200 (CEST)
Date:   Thu, 18 Aug 2022 18:27:28 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v1 4/7] i2c-mlxbf.c: incorrect base address passed during
 io write
Message-ID: <20220818162728.lnq5y7qzxbdsyexr@the-dreams.de>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220816225412.9095-5-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816225412.9095-5-asmaa@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Aug 16, 2022 at 06:54:09PM -0400, Asmaa Mnebhi wrote:
> Correct base address used during io write.

So, the driver never ever worked? Or were we lucky that it worked
somehow?

> 
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-mlxbf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
> index 39051c4a6db2..02ed6983c35c 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -655,7 +655,7 @@ static int mlxbf_i2c_smbus_enable(struct mlxbf_i2c_priv *priv, u8 slave,
>  	/* Clear status bits. */
>  	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_STATUS);
>  	/* Set the cause data. */
> -	writel(~0x0, priv->smbus->io + MLXBF_I2C_CAUSE_OR_CLEAR);
> +	writel(~0x0, priv->mst_cause->io + MLXBF_I2C_CAUSE_OR_CLEAR);
>  	/* Zero PEC byte. */
>  	writel(0x0, priv->smbus->io + MLXBF_I2C_SMBUS_MASTER_PEC);
>  	/* Zero byte count. */
> -- 
> 2.30.1
> 
