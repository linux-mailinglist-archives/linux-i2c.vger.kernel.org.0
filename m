Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B65B26257F
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 04:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgIIC7c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 22:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgIIC7b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 22:59:31 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 056F3C061573;
        Tue,  8 Sep 2020 19:59:30 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 5so999209pgl.4;
        Tue, 08 Sep 2020 19:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Tp4bbytIV3MCk9Tk4/Dcp87bEHrVbZ661Kr/3La1Mzw=;
        b=BXLzG0CCg8YsEc/oa74A1IAubX08MzTTwjX3ERrPica6/CzeaP+L0rn27XGSfd/Prv
         1tGWI90koY3PhMaZtS9WknbIdljle39k7zdDNYea+OD4aqSa9hp4qaXr3sGr4ANb5VZa
         GyjGvBX/rEQJUmmZR6SWnldR+PD62bSLjVHX1/1IvVLWfilBnd9Cvat4V7yAWWO5PRPJ
         27iynbyZTsjYFYWYZYLNObcfD4pr3RI7UomsdfezTOpVv+Z71MsBAMTXqXWJBDhqkbBl
         hewfqhgHbwhf/aqfYNxgxCS4fO2yujrAs6yHtw0OdY7znKewN1CVDKqmkGFJWUOlFMhd
         bhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Tp4bbytIV3MCk9Tk4/Dcp87bEHrVbZ661Kr/3La1Mzw=;
        b=FQXZ5cr4z2G4xksXWAiVUHLHK6ZbbntGYtrYBb5IhwqrUHwase54pmhJT8lH4mx872
         xytOOjpKePdjEqVteuJGBj7p4kqHyPX/Tf2pnlxLqkBUtr4andwdqK1OoShqXV4PcFq7
         AgY7MFQ7YRCdJANYUDiNVGe6jn8GJRLEu3Ob1u9XrIO5gslSEo8uyRh5Hj2bzFV4h2QY
         mKKdchR+qt9ttuWYnE2T0R6KL31VMz9pYNyw+hqYIpmwqLwXwGjZ+JhNMVyRaM5Tf3FG
         ukt/EwHAYYZyoQY5+DChxN3KfEzDsYsxWiPqkYtZ2Oqx4Ni8iEB2+tbXcmd89Ev5Wwxi
         zjVA==
X-Gm-Message-State: AOAM531UuFPAgUiXl/m2/OA4enpYzzpM45A5AG+xn5SQSfdwllgQclf4
        OT2zQiIO2GLcpKiExdqVYQwVJ0Hdi3FzHG9k
X-Google-Smtp-Source: ABdhPJy6hCj+lJaBzifhBxZCkz9qq1bH+dxXTHRmupp1dQ+tjy7/i6gvzc5Ux5ZUvy5YbEMKVZ43Jw==
X-Received: by 2002:a63:fe06:: with SMTP id p6mr1321871pgh.337.1599620369318;
        Tue, 08 Sep 2020 19:59:29 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
        by smtp.gmail.com with ESMTPSA id r123sm737300pfc.187.2020.09.08.19.59.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 19:59:28 -0700 (PDT)
Date:   Tue, 8 Sep 2020 19:59:22 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org, wsa@kernel.org,
        ryan_chen@aspeedtech.com
Subject: Re: [PATCH v2 3/5] i2c: aspeed: Mask IRQ status to relevant bits
Message-ID: <20200909025921.GA3449@taoren-ubuntu-R90MNF91>
References: <20200908200101.64974-1-eajames@linux.ibm.com>
 <20200908200101.64974-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908200101.64974-4-eajames@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 08, 2020 at 03:00:59PM -0500, Eddie James wrote:
> Mask the IRQ status to only the bits that the driver checks. This
> prevents excessive driver warnings when operating in slave mode
> when additional bits are set that the driver doesn't handle.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Tao Ren <rentao.bupt@gmail.com>

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 31268074c422..2a388911038a 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -69,6 +69,7 @@
>   * These share bit definitions, so use the same values for the enable &
>   * status bits.
>   */
> +#define ASPEED_I2CD_INTR_ALL				0xf000ffff
>  #define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT			BIT(14)
>  #define ASPEED_I2CD_INTR_BUS_RECOVER_DONE		BIT(13)
>  #define ASPEED_I2CD_INTR_SLAVE_MATCH			BIT(7)
> @@ -604,6 +605,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>  	writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>  	       bus->base + ASPEED_I2C_INTR_STS_REG);
>  	readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +	irq_received &= ASPEED_I2CD_INTR_ALL;
>  	irq_remaining = irq_received;
>  
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> -- 
> 2.26.2
> 
