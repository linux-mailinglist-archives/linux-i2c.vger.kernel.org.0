Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A443899D8
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 01:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhESXaK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 May 2021 19:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhESXaK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 May 2021 19:30:10 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FD6C061574;
        Wed, 19 May 2021 16:28:49 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id i5so7274356qkf.12;
        Wed, 19 May 2021 16:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+sRe31lrHGcUgSFKKGzM5XKzbij36J+nU6GLQsIGJJk=;
        b=HAOlx4M74XjBWQ8LN2fsuibOmX34Rxz0V7tqxzf7ZIWM+X+lRP/M7KyCNN/h19Q2ze
         ou41sL+m6NfWT9Y4u75hnp/iUQWwcpgGnc3lU4BxL1BpRf14BKJUseUHnAKYSRbMoIbB
         8WFQrW9H6mTEzhMJ8n8yJGvDHvomUkP+pmbBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+sRe31lrHGcUgSFKKGzM5XKzbij36J+nU6GLQsIGJJk=;
        b=N/oEgRtPDEvJtuXqZsTOSKT2iaWB4aLwls+w3pgOvh0r2XhHq72RMLj/zJSB+d5PMq
         50i9q8oO6VXX2APcOkE/hZVGUCdABx59Rd+v0NJ8ioXLZHu66ys7sRD2I/Vn8G0Yz7U+
         OcoiNNCg2rGbnqA++5ZPDqEOzVT0MHJf2kqZtyAk5z7e3bwvOI8+RCukEiS+gq15H/g4
         WZzABH9nefnpY8lKeV8kvQXihoIHJl/yM3Vnioptwl3eJp/cTk7U6jonI0UmYEvmmubL
         61OCFbnQeklMIQai5vGdKjGZXf0M6kZqW0mtt6fqqtUvLGAd4rbs+XsUMWRTeZouYokd
         3s6Q==
X-Gm-Message-State: AOAM5317/x0bovv9+MbE1wGqK4VmDOwmbrCWJ3lt8smaGrBUUXKPvE6N
        GXAP9lD6s97JeJAgu4VhN7ICE6jlsRiU6tA/XRw=
X-Google-Smtp-Source: ABdhPJzs/PNVyZHXiN60/U4ROwriKRalRsyur5ioWhvG9uZxMJo/oQyw0WnlQ0RLEb2ucWzVwat0FQEtGAkFU+vY1FU=
X-Received: by 2002:a05:620a:704:: with SMTP id 4mr1279089qkc.66.1621466929079;
 Wed, 19 May 2021 16:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210519074934.20712-1-quan@os.amperecomputing.com> <20210519074934.20712-4-quan@os.amperecomputing.com>
In-Reply-To: <20210519074934.20712-4-quan@os.amperecomputing.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 19 May 2021 23:28:37 +0000
Message-ID: <CACPK8XeFsuEXeCvG9DC0z+tiri6ptjOFOXe3x+COEZTVqUbVFg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] i2c: aspeed: Fix unhandled Tx done with NAK
To:     Quan Nguyen <quan@os.amperecomputing.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ryan, can you please review this change?

On Wed, 19 May 2021 at 07:50, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> It is observed that in normal condition, when the last byte sent by
> slave, the Tx Done with NAK irq will raise.
> But it is also observed that sometimes master issues next transaction
> too quick while the slave irq handler is not yet invoked and Tx Done
> with NAK irq of last byte of previous READ PROCESSED was not ack'ed.
> This Tx Done with NAK irq is raised together with the Slave Match and
> Rx Done irq of the next coming transaction from master.
> Unfortunately, the current slave irq handler handles the Slave Match and
> Rx Done only in higher priority and ignore the Tx Done with NAK, causing
> the complain as below:
> "aspeed-i2c-bus 1e78a040.i2c-bus: irq handled != irq. expected
> 0x00000086, but was 0x00000084"
>
> This commit handles this case by emitting a Slave Stop event for the
> Tx Done with NAK before processing Slave Match and Rx Done for the
> coming transaction from master.

It sounds like this patch is independent of the rest of the series,
and can go in on it's own. Please send it separately to the i2c
maintainers and add a suitable Fixes line, such as:

  Fixes: f9eb91350bb2 ("i2c: aspeed: added slave support for Aspeed I2C driver")

>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v3:
>   + First introduce in v3 [Quan]
>
>  drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 724bf30600d6..3fb37c3f23d4 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -254,6 +254,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>
>         /* Slave was requested, restart state machine. */
>         if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {

Can you explain why you need to do this handing inside the SLAVE_MATCH case?

Could you instead move the TX_NAK handling to be above the SLAVE_MATCH case?

> +               if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
> +                   bus->slave_state == ASPEED_I2C_SLAVE_READ_PROCESSED) {

Either way, this needs a comment to explain what we're working around.

> +                       irq_handled |= ASPEED_I2CD_INTR_TX_NAK;
> +                       i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
> +               }
>                 irq_handled |= ASPEED_I2CD_INTR_SLAVE_MATCH;
>                 bus->slave_state = ASPEED_I2C_SLAVE_START;
>         }
> --
> 2.28.0
>
