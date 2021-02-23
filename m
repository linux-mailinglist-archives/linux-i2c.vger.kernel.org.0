Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B27323424
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 00:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbhBWXLN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Feb 2021 18:11:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233704AbhBWXEn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Feb 2021 18:04:43 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93EEFC06174A
        for <linux-i2c@vger.kernel.org>; Tue, 23 Feb 2021 15:03:27 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id w36so184929lfu.4
        for <linux-i2c@vger.kernel.org>; Tue, 23 Feb 2021 15:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wRhAYey+svcGCwXyGWPv7V5X8SwkvAprp73I+85/pQc=;
        b=EwIJLES+pr00B3Dj/+oItlJmVww8ftL2KnWVjRMnQaHEG7lVUwSd2+iiKPcjHW+/uF
         kRgLBauqcCoAc97koaMrwcK6tUixzC39s8XbJ1Jn9fC0TuWt0ShAWxtlwQq2uW0Vmc64
         PoYVSlGinQsHBMPvyFrp+iyn7sctUWm/IR0aplZ4FIRVCi4r0Kvu4bvA9nNJB+ttUk74
         R/wnQOzJkJHXZhUCUyYk29X4vg2hOakJ3a/XPTt9aBTqhppn9SUzoOE+NtH8DMoi42qH
         //rMBJ3/v2fi4rhaau8tQx8TwsyAzGl6ghZ3IAfsOcucycpbZHbwQ7TIsmnA55+pKYiZ
         MNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wRhAYey+svcGCwXyGWPv7V5X8SwkvAprp73I+85/pQc=;
        b=BvZX0MdlCNesitRhPx+SUz4nW6460hYaqI/9VmtGw0a4GVbW3D0R08ZJDmRs4Hnn8G
         E2cXIcjOln7XWuGrhOTt6Jf1kf6+x9k7Xg2aR8AhZtKA8ON2dHlbAmj4rdC+W+XaSj8A
         OD+EAWjO94xdVj9++HTSH+/zGNDsM9VevaP8eYShLfWDYTtg1/dvbCjRvc//iUC8a4oi
         cAa1kttz1ulQnSKShy6QxGeZlx7YRSjQwsSkP0fKVFX3y2N78++4+9N46/RNFdyokANQ
         cteH3zfHpkdpK18g5vXlYITK37V/jwKa8vykD4VfsK4SvntJOrY9L06STd6wb2J3j19H
         X+gg==
X-Gm-Message-State: AOAM53110zEoqIPBS0nrnfENqG1Y0n/mcWkQQb7iFtTZJche0Pvnut3R
        0FYYhCjgCI2wH4Ie2uxuGAtCxkeb165zSapY9JTm3Q==
X-Google-Smtp-Source: ABdhPJzfYSmA9BfP+wP5v//IugfBYumbU1mW5LCBy8Jxvuc1gfBn/zeSpz5/3ST6REQJKCOhL/hkhkouT30tX4hi+hY=
X-Received: by 2002:a05:6512:965:: with SMTP id v5mr7893451lft.446.1614121405073;
 Tue, 23 Feb 2021 15:03:25 -0800 (PST)
MIME-Version: 1.0
References: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com> <20210216182735.11639-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210216182735.11639-4-jae.hyun.yoo@linux.intel.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 23 Feb 2021 15:03:13 -0800
Message-ID: <CAFd5g47MBQ67S3XzaH9rDPSieihNJ_WPhUgw=Pkg1Vk1PK3AvQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] i2c: aspeed: add buffer mode transfer support
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Feb 16, 2021 at 10:15 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This driver uses byte mode that makes lots of interrupt calls
> which isn't good for performance and it makes the driver very
> timing sensitive. To improve performance of the driver, this commit
> adds buffer mode transfer support which uses I2C SRAM buffer
> instead of using a single byte buffer.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Tested-by: Tao Ren <taoren@fb.com>

Overall looks pretty good! There were just a couple bits of code which
were not immediately obvious to me that I would like to see improved:

> ---
> Changes since v2:
> - Refined SoC family dependent xfer mode configuration functions.
>
> Changes since v1:
> - Updated commit message.
> - Refined using abstract functions.
>
>  drivers/i2c/busses/i2c-aspeed.c | 464 ++++++++++++++++++++++++++++----
>  1 file changed, 412 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 724bf30600d6..343e621ff133 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
[...]
> +static inline u32
> +aspeed_i2c_prepare_tx_buf(struct aspeed_i2c_bus *bus, struct i2c_msg *msg)
> +{
> +       u8 slave_addr = i2c_8bit_addr_from_msg(msg);
> +       u32 command = 0;
> +       int len;
> +
> +       if (msg->len + 1 > bus->buf_size)
> +               len = bus->buf_size;
> +       else
> +               len = msg->len + 1;
> +
> +       if (bus->buf_base) {
> +               u8 wbuf[4];
> +               int i;
> +
> +               command |= ASPEED_I2CD_TX_BUFF_ENABLE;
> +
> +               /*
> +                * Yeah, it looks bad but byte writing on remapped I2C SRAM
> +                * causes corruption so use this way to make dword writings.
> +                */

Not surprised. It looks like you reuse this code in a couple of
places, at the very least I think you should break this out into a
helper function. Otherwise, please make a similar comment in the other
locations.

Also, why doesn't writesl()
(https://elixir.bootlin.com/linux/v5.11/source/include/asm-generic/io.h#L413)
work here?

> +               wbuf[0] = slave_addr;
> +               for (i = 1; i < len; i++) {
> +                       wbuf[i % 4] = msg->buf[i - 1];
> +                       if (i % 4 == 3)
> +                               writel(*(u32 *)wbuf, bus->buf_base + i - 3);
> +               }
> +               if (--i % 4 != 3)
> +                       writel(*(u32 *)wbuf, bus->buf_base + i - (i % 4));
> +
> +               writel(FIELD_PREP(ASPEED_I2CD_BUF_TX_COUNT_MASK, len - 1) |
> +                      FIELD_PREP(ASPEED_I2CD_BUF_OFFSET_MASK, bus->buf_offset),
> +                      bus->base + ASPEED_I2C_BUF_CTRL_REG);
> +       }
> +
> +       bus->buf_index = len - 1;
> +
> +       return command;
> +}
> +
[...]
