Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B2C389988
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 00:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhESXBI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 19:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhESXBH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 19:01:07 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8167EC061574;
        Wed, 19 May 2021 15:59:47 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id k4so3352133qkd.0;
        Wed, 19 May 2021 15:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FL4A84RnGL9eXsLReJXIYBVZb+CRyoUol9pEHr5O5qY=;
        b=Dvq29lHaaHrwBS8AFWZSoJCdqQsSj5w0bo8XghtBLAZTBjrQf4RXb+AY3jd8EtUP94
         KVMw8BwVB+j9N56QZ2bUXRwSkx94v24XrW5t9yTBPEk2Eg1E/sjej0T/YJ+UN8/hVyf2
         eZl8fwg+VCSsuIKKXAIvKGBmJaQlJRJsra5j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FL4A84RnGL9eXsLReJXIYBVZb+CRyoUol9pEHr5O5qY=;
        b=f2MF1XTJ4TP4mVLdJEJH4ivR1W0r5aA1UerFQf/J8SNX7TmWcT2l91ZFSKbEZZlsym
         YfL34ypIXdd5Qf66VIDTmbORlUUsLQbu6k6Uivz/7x2bu3tl8UjUMDqI/nDo91t1zC0o
         h0rJUIkNq67EMpULB/yGKMV621MdNuHbMGfCPhIfzsv7w5ld8R14uKdhY4WPHCj2otZ3
         XZIrb05PsJdfuVx/jx7ZQXO6CTGfSJl2cejQBpuZB0crrtZTkxogyijNLWXz2bfxE/VF
         Kfv6g09a05eEmIUVqqn4gpqys1jslJm9RZp9x7nQpvgGl8QMp+jLxLnBcW8glvfTp79m
         fGxA==
X-Gm-Message-State: AOAM531Hkzp0ZzHXBqzdA3mKlppLPticZRmeD9Izg1JszLY9n2qzPh/y
        h1+j7OrgVhymPXhS7aHY+DBz6Jy6HSRBeb0sYqg=
X-Google-Smtp-Source: ABdhPJySEJL2SSIhxhurMKhfYZmnqZskBqtE2XkdoVEbVmUuDFR04avlb3/LIVd+WzCgLE4Ok6LLOCaBZg/S+B/hSKw=
X-Received: by 2002:a37:424c:: with SMTP id p73mr1926220qka.465.1621465186642;
 Wed, 19 May 2021 15:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210519080436.18975-1-jamin_lin@aspeedtech.com> <20210519080436.18975-2-jamin_lin@aspeedtech.com>
In-Reply-To: <20210519080436.18975-2-jamin_lin@aspeedtech.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 19 May 2021 22:59:34 +0000
Message-ID: <CACPK8XdNXiGMQZOtsfMMK+w_PSvO20XT8B9MG+rGhdjYoV4ZuQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: aspeed: avoid new registers definition of AST2600
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rayn Chen <rayn_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        Troy Lee <troy_lee@aspeedtech.com>, steven_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 19 May 2021 at 08:05, Jamin Lin <jamin_lin@aspeedtech.com> wrote:
>
> The register definition between AST2600 A2 and A3 is different.
> This patch avoid new registers definition of AST2600 to use
> this driver. We will submit the path for the new registers
> definition of AST2600.

The AST2600 v9 datasheet says that bit 2 selects between old and new
register sets, and that the old register set is the default.

Has the default changed for the A3?, and the datasheet is incorrect?

Does the A3 still support the old register set?

>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 724bf30600d6..007309077d9f 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -19,14 +19,20 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>
> +/* I2C Global Registers */
> +/* 0x0c : I2CG Global Control Register (AST2500)  */
> +#define ASPEED_I2CG_GLOBAL_CTRL_REG                    0x0c
> +
>  /* I2C Register */
>  #define ASPEED_I2C_FUN_CTRL_REG                                0x00
>  #define ASPEED_I2C_AC_TIMING_REG1                      0x04
> @@ -973,6 +979,22 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         struct resource *res;
>         int irq, ret;
>
> +       if (of_device_is_compatible(pdev->dev.of_node,
> +                                   "aspeed,ast2600-i2c-bus")) {
> +               u32 global_ctrl;
> +               struct regmap *gr_regmap;
> +
> +               gr_regmap = syscon_regmap_lookup_by_compatible("aspeed,ast2600-i2c-global");
> +
> +               if (IS_ERR(gr_regmap)) {
> +                       ret = PTR_ERR(gr_regmap);
> +               } else {
> +                       regmap_read(gr_regmap, ASPEED_I2CG_GLOBAL_CTRL_REG, &global_ctrl);
> +                       if (global_ctrl & BIT(2))
> +                               return -EIO;
> +               }
> +       }
> +
>         bus = devm_kzalloc(&pdev->dev, sizeof(*bus), GFP_KERNEL);
>         if (!bus)
>                 return -ENOMEM;
> --
> 2.17.1
>
