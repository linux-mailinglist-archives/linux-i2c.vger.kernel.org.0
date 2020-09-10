Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAE02640D5
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Sep 2020 11:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbgIJJBW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Sep 2020 05:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729986AbgIJJBG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Sep 2020 05:01:06 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D09C061757
        for <linux-i2c@vger.kernel.org>; Thu, 10 Sep 2020 02:01:05 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id n14so4254899pff.6
        for <linux-i2c@vger.kernel.org>; Thu, 10 Sep 2020 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ikzS6RYjoj2agknRb+4ptOX5afJxX0ugn9/c1CJ7PGY=;
        b=susunWFFKwqMfxgI6ByE2bxzf0efOUepi18FJy0I3JaGM6PyRxlr5pWK3ZQrDC2hnN
         ReIMsZIjJ33de7BpVFfN6XqNS2jyfb9GZ4K4h/I+P+A/84lrh4EPnpGm+66JuThreZhq
         iAMtKUT4cO0Ytr/lL4S5Sgtjvq1DbmwGLc9mWMpW0LEU+uV0uBZdkKDexwQrIXp5JxOQ
         RA7+krRJzRP7PBsEmcwR2pTSvNWBUhC9PH7lfT+vnhnZJ2EJ/bJDi6mlKCS+wRvd9Aam
         hrjVglwXEJHhNVjheCVAFPlrQygD9qBLmsofYecD5zPuBl8kXkIXPqbFzTT4CDb1bFpn
         vioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ikzS6RYjoj2agknRb+4ptOX5afJxX0ugn9/c1CJ7PGY=;
        b=hVbJawvyHucDtL/iLCijfhEBe7egXz1C1A9eNz0n+roqNTibXivCAl5shmsllZ0IcS
         OSgxjzypx7cFpWDL0sNevEIOa440dElNS+VytS15l/+vWbz4mKFPK//P/kLvvlHjQkFz
         vbhMUJZWrpFhuH11X9eCrI2qGilRnOkNc1g8L7EcTm3Mwy+w7/L4tyQpq0fVMW2o76Lx
         sfjLu8Nzl80T8Hrovk4W+Z2dHmpIENVd7w6s06PRcLjYBMjN3j/As/eBsrbu92HjliC0
         ySJCMkM8zOI92+1+BEGtuC+Jxn6HW8J80hl9e1KKB6I5cwP8+2CeHPl+NbgUSN181uTm
         eJmQ==
X-Gm-Message-State: AOAM533CgU5bwTfhs0ZwvqTdfvA+D+v9sJIj+cBVcab9tMxmE5VzlWN/
        KyiY4shgESF1d7eSaqUWPdtxmhIsmP7H5X1VqDSO7Q==
X-Google-Smtp-Source: ABdhPJyz+lxVXWAN3RjhjfBgNFqBMssrHGsYLq26O3vVlwR5Eg9ERiehVAHVqUqpwEj5gFDwZOX+ebtv3+a8IJuSeMA=
X-Received: by 2002:a63:fd03:: with SMTP id d3mr3605973pgh.201.1599728464251;
 Thu, 10 Sep 2020 02:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200909203059.23427-1-eajames@linux.ibm.com> <20200909203059.23427-4-eajames@linux.ibm.com>
In-Reply-To: <20200909203059.23427-4-eajames@linux.ibm.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 10 Sep 2020 02:00:53 -0700
Message-ID: <CAFd5g46ghV7ArmM8LnMkGa-Nip_fT934+3cPOkVxS-b5odZXYw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] i2c: aspeed: Mask IRQ status to relevant bits
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-i2c@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        wsa@kernel.org, rentao.bupt@gmail.com,
        Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 9, 2020 at 1:31 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> Mask the IRQ status to only the bits that the driver checks. This
> prevents excessive driver warnings when operating in slave mode
> when additional bits are set that the driver doesn't handle.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Tao Ren <rentao.bupt@gmail.com>

Sorry, looks like I didn't get my comment in in time.

Looks good in principle. One minor comment below:

> ---
>  drivers/i2c/busses/i2c-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 31268074c422..724bf30600d6 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -69,6 +69,7 @@
>   * These share bit definitions, so use the same values for the enable &
>   * status bits.
>   */
> +#define ASPEED_I2CD_INTR_RECV_MASK                     0xf000ffff

Could we define ASPEED_I2CD_INTR_RECV_MASK to be ASPEED_I2CD_INTR_ALL ?

>  #define ASPEED_I2CD_INTR_SDA_DL_TIMEOUT                        BIT(14)
>  #define ASPEED_I2CD_INTR_BUS_RECOVER_DONE              BIT(13)
>  #define ASPEED_I2CD_INTR_SLAVE_MATCH                   BIT(7)
> @@ -604,6 +605,7 @@ static irqreturn_t aspeed_i2c_bus_irq(int irq, void *dev_id)
>         writel(irq_received & ~ASPEED_I2CD_INTR_RX_DONE,
>                bus->base + ASPEED_I2C_INTR_STS_REG);
>         readl(bus->base + ASPEED_I2C_INTR_STS_REG);
> +       irq_received &= ASPEED_I2CD_INTR_RECV_MASK;
>         irq_remaining = irq_received;
>
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
> --
> 2.26.2
>
