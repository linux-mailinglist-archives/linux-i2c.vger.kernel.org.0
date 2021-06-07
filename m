Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E582239DFD1
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 16:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhFGO7d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 10:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbhFGO72 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 10:59:28 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52728C061766
        for <linux-i2c@vger.kernel.org>; Mon,  7 Jun 2021 07:57:26 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so12957158wmk.1
        for <linux-i2c@vger.kernel.org>; Mon, 07 Jun 2021 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VlCXU9+MFpUy7SArdgNYI/tiU14CG8Xgo06o1Uxsr38=;
        b=rggAUTyKTufq+dvlwzacJo9pgOVEdDk5fs3Ote0eHa9Ikr22ppYaRz2a4Jb4/ToGE9
         pJkiZO7GFVstggttfUpKJid5MIj7MBT1ehm0kb1rXd+jJXGbHfBu1nJAIo31+xmCh7U/
         qb+/J8pqkPvJ6Ej8kejnhPDprATZqkAHu1JjTInwUK9LZVOHnCjoQltUVh0qxxonZAQc
         Fu0WUKtDF2ECtEiAb9FDHkz7hTvmHveDDsQt3NyItj3IsxEReE4aEjQ5lm5VTo+Zkzbu
         lzBFaZn6VV0tk1fhsqtHtys6OoAI3vchKxv3CWnDoo4Gf3/RInJRII3o9R4/UDEFbizy
         vVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VlCXU9+MFpUy7SArdgNYI/tiU14CG8Xgo06o1Uxsr38=;
        b=MQzpgKVZLQG8sGaI6Rdt2nWL9kzYQCTqfUOhpVY1/OzxbIoG6k1IlpWyL6+5tuZFV5
         s6p0lXKVg3PSMKmbjOQzuXrNlAMwiyCCHB42a2aDSQXcgWPhtfH+jyL5ifqtpnWSFLK/
         yQU9bubh6XMY7nAZehVZDugYK5DsszKaDfgKisTkiBAuFh11yNhL8M9wMgBZZ+1l6gRv
         P/XWz8QBM81PORB+ZF5c1jw3TdxSiwIlmH8INxqm1NlfYAZsevZiDs+SFbpg9zY7Q9w4
         J8i/vXxNEc+tlBanvUsTXKncS2kISxFUd2kcU5JJaNqqoN08H4GluioDaEHhvL3FO7Ck
         BxbA==
X-Gm-Message-State: AOAM531MAEA7WXZ4b8JAbfVxbkFI3eqJu2hx7mi2ykk8C1oy4CBub7Ea
        ZTFy2T91n/n4SJscYJP8wod/YA==
X-Google-Smtp-Source: ABdhPJx6fGlVL5stxlu2ekuhuN/NXsWIomGXGgkt/9+9iT+k+wju9j4eewvseyJ0aY+TeXuGEd/cuQ==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr16901621wmk.54.1623077844897;
        Mon, 07 Jun 2021 07:57:24 -0700 (PDT)
Received: from ggregory-linuxws ([2a02:8010:64d6:5343:6309:485e:2524:388a])
        by smtp.gmail.com with ESMTPSA id f14sm15953806wry.40.2021.06.07.07.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 07:57:24 -0700 (PDT)
Date:   Mon, 7 Jun 2021 15:57:22 +0100
From:   Graeme Gregory <graeme@nuviainc.com>
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 5/7] i2c: aspeed: Add aspeed_set_slave_busy()
Message-ID: <20210607145722.GA2682@ggregory-linuxws>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
 <20210519074934.20712-6-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519074934.20712-6-quan@os.amperecomputing.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 19, 2021 at 02:49:32PM +0700, Quan Nguyen wrote:
> Slave i2c device on AST2500 received a lot of slave irq while it is
> busy processing the response. To handle this case, adds and exports
> aspeed_set_slave_busy() for controller to temporary stop slave irq
> while slave is handling the response, and re-enable them again when
> the response is ready.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + First introduce in v3 [Quan]
> 
>  drivers/i2c/busses/i2c-aspeed.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index b2e9c8f0ddf7..9926d04831a2 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -944,6 +944,26 @@ static int aspeed_i2c_init(struct aspeed_i2c_bus *bus,
>  	return 0;
>  }
>  
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +void aspeed_set_slave_busy(struct i2c_adapter *adap, bool busy)
> +{
> +	struct aspeed_i2c_bus *bus = i2c_get_adapdata(adap);
> +	unsigned long current_mask, flags;
> +
> +	spin_lock_irqsave(&bus->lock, flags);

This as far as I can see is still a recursive spinlock, and the spinlock
debugger seems to agree with me.

Graeme

> +
> +	current_mask = readl(bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +	if (busy)
> +		current_mask &= ~(ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_SLAVE_MATCH);
> +	else
> +		current_mask |= ASPEED_I2CD_INTR_RX_DONE | ASPEED_I2CD_INTR_SLAVE_MATCH;
> +	writel(current_mask, bus->base + ASPEED_I2C_INTR_CTRL_REG);
> +
> +	spin_unlock_irqrestore(&bus->lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(aspeed_set_slave_busy);
> +#endif
> +
>  static int aspeed_i2c_reset(struct aspeed_i2c_bus *bus)
>  {
>  	struct platform_device *pdev = to_platform_device(bus->dev);
> -- 
> 2.28.0
> 
