Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA742E0547
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Dec 2020 05:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgLVEJI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Dec 2020 23:09:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725927AbgLVEJF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Dec 2020 23:09:05 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFA8C0613D3;
        Mon, 21 Dec 2020 20:08:25 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id p14so10908437qke.6;
        Mon, 21 Dec 2020 20:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1lferK7S/WcuZtuM8G00rHoo+wxuBCDmc8Awl4Gm4XE=;
        b=LcJ6hqjgmBAF3xenw/wLMRvZFXCxq5WfdX0WYJkCtYW+AWEWFGMR2Ejt+j75UFN9Zi
         Q7j6VLS5nIvfMZJLi6g6fT+oqP766/otVRSBnLMYqA/pqOAT2Ftt3DoM/ApQKlUHigkX
         3U8IrKrq1yuC7eIT12I4mjZ35Wwp16Y+R/Yl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1lferK7S/WcuZtuM8G00rHoo+wxuBCDmc8Awl4Gm4XE=;
        b=g9hPgQ2pUkae1ubMgCbcLbgi+hb8oY+PbsYiNe6owfnREd9XyWUjN6r1pS86RNCu5x
         4F7U3ju9aaw+bk9zJeU2ycV1Axg5lWhPmg2NI/fWSakyzzUZVB16zd41nzmEMW61GtfS
         yYn/Ig5eXSYR9CwCzRRMd7q1Njh//zTmX2KFeSsNeX3TfE4PcAXDPiCyLddxCrbuMNnb
         34FjjXT+8mIL5cpDxFykjz7Bxu0rhh2w4hDsgZPuRkLsLpPpPq/aX/tBeJZmZKkXTeiP
         /+MD8pYjemcVFXnE/ILRmgtTvZNSnYGrOEA1zFKgPGLzpmwqAqisRoosA3JAwMygnrZI
         0GWA==
X-Gm-Message-State: AOAM531qY81iGB7mwvoW4SFt1sf+a+o/fd2FwAhb9vdnNapJe4OzOrDQ
        VZVbUkSIDCB76c2Ccd8rPRQHqZKYmY45dvW2ne0=
X-Google-Smtp-Source: ABdhPJxOJe0aczqoEqz1cNRhFogu+B29Eal0/8X5iQGiNPeLLyhWKCYJdy4Trd8iFlfSL98eHlhm7D5RyKOBwJpQMIM=
X-Received: by 2002:a05:620a:31a:: with SMTP id s26mr20267871qkm.66.1608610104425;
 Mon, 21 Dec 2020 20:08:24 -0800 (PST)
MIME-Version: 1.0
References: <20200915184525.29665-1-zev@bewilderbeest.net> <20201218213952.refmqjlxdclsquzg@hatter.bewilderbeest.net>
In-Reply-To: <20201218213952.refmqjlxdclsquzg@hatter.bewilderbeest.net>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 22 Dec 2020 04:08:12 +0000
Message-ID: <CACPK8Xe9uPMHHkNGmUL+xm4MKBvOzNd-3bCLGc7UuZW_QkhUog@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: disable additional device addresses on ast2[56]xx
To:     Zev Weiss <zev@bewilderbeest.net>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 18 Dec 2020 at 21:40, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> On Tue, Sep 15, 2020 at 01:45:25PM CDT, Zev Weiss wrote:
> >The ast25xx and ast26xx have, respectively, two and three configurable
> >slave device addresses to the ast24xx's one.  We only support using
> >one at a time, but the others may come up in an indeterminate state
> >depending on hardware/bootloader behavior, so we need to make sure we
> >disable them so as to avoid ending up with phantom devices on the bus.
> >
> >Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> >---
> > drivers/i2c/busses/i2c-aspeed.c | 50 +++++++++++++++++++++++++++------
> > 1 file changed, 41 insertions(+), 9 deletions(-)
> >
> > <snip>
>
> Ping...any thoughts on this patch?

Apologies for the delay, this one slipped through the cracks.

The rework is fine, and lends itself to supporting the other addresses
in the future. However, a simpler fix would be to construct reg 0x18
from zero, so only the functions that are supported are enabled.

static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
{
    u32 addr_reg_val, func_ctrl_reg_val;

    /* Set slave addr. */
    addr_reg_val = slave_addr & ASPEED_I2CD_DEV_ADDR_MASK;
    writel(addr_reg_val, bus->base + ASPEED_I2C_DEV_ADDR_REG);

    /* Turn on slave mode. */
    func_ctrl_reg_val = readl(bus->base + ASPEED_I2C_FUN_CTRL_REG);
    func_ctrl_reg_val |= ASPEED_I2CD_SLAVE_EN;
    writel(func_ctrl_reg_val, bus->base + ASPEED_I2C_FUN_CTRL_REG);
}

You could go further and ensure slave mode is always disabled unless
requested by clearing 0x18 when 0x00 is cleared at aspeed_i2c_init.

Cheers,

Joel

>
>
> Thanks,
> Zev
>
