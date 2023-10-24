Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF6D7D5D34
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 23:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234958AbjJXV2u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 17:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbjJXV2u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 17:28:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5982E129;
        Tue, 24 Oct 2023 14:28:48 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ABD0C433C8;
        Tue, 24 Oct 2023 21:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698182928;
        bh=dxrhK6LCO9BflPWhC3GRe1Rdi4pkkGtj7kI+Qk5b8Bo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qGBIhNIaE1xH+1+qgWIGeTpbwW6/cxmSTreC4JXj7U7jpsoNatrwQYhNouN8K8X4/
         BK7fzq3jI5TVq+LkuEcCfhBOvonhE5xciHw/BMfOkK2ovzKw2RjDgAYCGI5PycCQeR
         tdRCIMawrNz6Ou/vJKp0ZOe3wvVICTChriqBmHzsRqfAIAYKDQxhMD2XQHVsrdgOA2
         b3/Pn30hF+QEWvtykpZiN85JnGn2Zry85e1RE3PaU0Ngh+/Yam1wt8tlErlbuKFYd2
         1JAmpfLxR50gxbKX26KPvWyyDnm1nMCVLeQ+4QzC7LD+DRst+B4tDhV3d9ZXrDO+os
         8yaC0MWrcnSOQ==
Date:   Tue, 24 Oct 2023 23:28:45 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Huangzheng Lai <Huangzheng.Lai@unisoc.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        huangzheng lai <laihuangzheng@gmail.com>,
        Xiongpeng Wu <xiongpeng.wu@unisoc.com>
Subject: Re: [PATCH V2 4/7] i2c: sprd: Add I2C controller driver to support
 dynamic switching of 400K/1M/3.4M frequency
Message-ID: <20231024212845.htjc2uwtg36mig5j@zenone.zhora.eu>
References: <20231023081158.10654-1-Huangzheng.Lai@unisoc.com>
 <20231023081158.10654-5-Huangzheng.Lai@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023081158.10654-5-Huangzheng.Lai@unisoc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Huangzheng,

On Mon, Oct 23, 2023 at 04:11:55PM +0800, Huangzheng Lai wrote:
> When I2C-slaves supporting different frequencies use the same I2C
> controller, the I2C controller usually only operates at lower frequencies.
> In order to improve the performance of I2C-slaves transmission supporting
> faster frequencies, we dynamically configure the I2C operating frequency
> based on the value of the input parameter msg ->flag.
> 
> Signed-off-by: Huangzheng Lai <Huangzheng.Lai@unisoc.com>
> ---
>  drivers/i2c/busses/i2c-sprd.c | 101 +++++++++++++++++++---------------
>  1 file changed, 57 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
> index dec627ef408c..f1f7fad42ecd 100644
> --- a/drivers/i2c/busses/i2c-sprd.c
> +++ b/drivers/i2c/busses/i2c-sprd.c
> @@ -75,7 +75,14 @@
>  #define SPRD_I2C_PM_TIMEOUT	1000
>  /* timeout (ms) for transfer message */
>  #define I2C_XFER_TIMEOUT	1000
> -
> +/* dynamic modify clk_freq flag  */
> +#define I2C_3M4_FLAG		0x0100
> +#define I2C_1M_FLAG		0x0080
> +#define I2C_400K_FLAG		0x0040
> +
> +#define I2C_FREQ_400K		400000
> +#define I2C_FREQ_1M		1000000
> +#define I2C_FREQ_3_4M		3400000

Why are you redefining these values?

You could use the defines you already have or, if you really want
a different name you could do:

#define I2C_FREQ_3_4M		I2C_MAX_HIGH_SPEED_MODE_FREQ

Rest looks good.

Andi
