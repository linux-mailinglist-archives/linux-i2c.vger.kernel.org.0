Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C70D251224
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 08:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729116AbgHYGiZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 02:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729068AbgHYGiY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Aug 2020 02:38:24 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11D4C061574;
        Mon, 24 Aug 2020 23:38:24 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o18so15023714eje.7;
        Mon, 24 Aug 2020 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Q9k3xF6hWPOQM3uFwSy2qlWDQ5BGn+QdqRbPCM8EhM=;
        b=d318I0JDAY3KO2OfweXvemxDvpcgVxD/poXqH0o44y89iIIdQ2tKqg8axqlHdT8Acl
         ZwraWTH8Be+wNIdnhcriuFkqqu+TMMH0QJZ/TUNOpruZNRxE9CT0VlMX/CzWe+IZ+AKh
         1i6LQwYPsKVqW8t3f2z5GeVPSUXLalcko0o7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Q9k3xF6hWPOQM3uFwSy2qlWDQ5BGn+QdqRbPCM8EhM=;
        b=AuRsY8/wXh5c6AUTfKei83ZPPLzod9pc+bVP4uAjLRjKsa9+A2UYrbbWStFClXP2nB
         Rnat2K6phw+OBLcRqDObIKQ9eE/tLRSmitQJyIN2WHOT+9CTzr7CNNp55rMsegDv7c/M
         FUKrh5x34dkUWmf/PPhJ7xgsCE8YjyYczkSWwPIEcog+qQoQrCGLWZvktTzaq26pgtSY
         tk4QzY9ghDtUJ2NzuE6KxNBy39Xx9Q/aEPL8ixXeSyLc3ZHmjL9oSbbOfosd0WeIav80
         a0YLBsRKze74hckUkkUYAP88RbIwJ1U1PXKUAGLe0VnoW00A0tsCEUr3bZJnT9Op6Pjr
         Ls4g==
X-Gm-Message-State: AOAM533W/91YS/kuRs22kAMSivCsyTmUBV4YCNTze+xnwjDuby7ydhHR
        rfiXYe3kxDM6PsyDo4jV36RnxHtpUrtMpTjMC6KFnVVk4Ro=
X-Google-Smtp-Source: ABdhPJweMgK6I5TgV9Ly2uJzqR7Tgq7Qn1uQsVbMr86HbZ6rf4REgHoJ8D+2tbHNLahHnsDFOhsp3YQTaEez+w4QafM=
X-Received: by 2002:a17:906:4ec3:: with SMTP id i3mr8802552ejv.215.1598337503276;
 Mon, 24 Aug 2020 23:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200820161152.22751-1-eajames@linux.ibm.com> <20200820161152.22751-4-eajames@linux.ibm.com>
In-Reply-To: <20200820161152.22751-4-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 25 Aug 2020 06:38:10 +0000
Message-ID: <CACPK8XdG1+3eQPQ71fZYZdHwcn8WNLQKF=5iKrOvGhLwispSQA@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: aspeed: Mask IRQ status to relevant bits
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        dmitry.torokhov@gmail.com, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 20 Aug 2020 at 16:12, Eddie James <eajames@linux.ibm.com> wrote:
>
> Mask the IRQ status to only the bits that the driver checks. This
> prevents excessive driver warnings when operating in slave mode
> when additional bits are set that the driver doesn't handle.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 31268074c422..abf40f2af8b4 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -604,6 +604,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>         writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>                bus->base + ASPEED_I2C_INTR_STS_REG);
>         readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +       irq_received &= 0xf000ffff;
>         irq_remaining = irq_received;

This would defeat the check for irq_remaining. I don't think we want to do this.

Can you explain why these bits are being set in slave mode?
