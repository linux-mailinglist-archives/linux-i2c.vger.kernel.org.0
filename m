Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C330B189BD8
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Mar 2020 13:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgCRMU3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Mar 2020 08:20:29 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43585 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgCRMU3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Mar 2020 08:20:29 -0400
Received: by mail-io1-f67.google.com with SMTP id n21so24588549ioo.10
        for <linux-i2c@vger.kernel.org>; Wed, 18 Mar 2020 05:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dVoMkzgYQUBeeaFssbPW+r4P2HKu0vpJpb49VsywRCo=;
        b=f5cTNpqqRFSY0EGLfxCvuptPZpDADSjc0o8hQ527ovxzDq/SRQoj0oLH5t1wkyvVE3
         MUXllplWwbLnd8dT7j7DiUjRO+9F5JtXjZ5p5HUTb5UU9SmoUrbmvhNdF/C5NqOrAc/a
         D3VEO2Go+Va/hHonMJeAzGYrnfaSM38iHvUfQtDrYo15cA0mt3wfsREYt7CAzRhl834b
         0OLDil3/1fvQp4xs1owWyu2cpE2oaOIX/GEYBHs5pK2rMYmw1ergIfeRvlffoJ0dq8yX
         LwW5CmK5xp45LSOFBOgqGCcC9MGB1C7R5OyOgNEU26yNSM7a3W1GJWSECsbQRKKJyWSr
         RflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dVoMkzgYQUBeeaFssbPW+r4P2HKu0vpJpb49VsywRCo=;
        b=oLmlU4V9numnC4GORHUYkv+e5DO4Z5w24+j60zpTg6LdKRbkSqu2NTLglYnLx/xbYm
         izibbUSi1kbjFtP5yt/QEhSG3vfraQqLXOvK1yVbq8LHjDlb3o2iBR8c0oUy9MiAFgAA
         jF4xPsfNmsaQ29tPm1oVxdpZTwCcxPxn3Rr81YGs/cSkFcqPxl5kEa1Beges33p2JZOp
         ufHFPYIDKdir2GGy0FubadXP0Zgwlc1KhEOChw8o/BuzQmIJhU/lVnG6B0XqNQaQtojv
         JYK+G413Y9x1r03+pONt9PZ0+4WNzVuii7VAhUBwNpXhmDFTLUOOYkiNus4E7u6lJGBW
         CGhg==
X-Gm-Message-State: ANhLgQ0nDlyFIMStM/PURhoG15LEyXd4wEhBxKvyU4Mj/ng3dZzq52Cx
        jim6tr3yWg5KxDGeGkP8n3nNjQpF5EXcJ4U8zMw=
X-Google-Smtp-Source: ADFU+vv1GjHzmJHkmCm6L4/nFLFSVHjSt5dOeZ0w4/BdGmF6pNvf2Yjs87MdjQe/k9Y7HUaXrnbsb2P1Z8GyfgT91Kk=
X-Received: by 2002:a05:6602:2098:: with SMTP id a24mr3395500ioa.101.1584534026916;
 Wed, 18 Mar 2020 05:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
In-Reply-To: <20200218135627.24739-1-ext-jaakko.laine@vaisala.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 18 Mar 2020 17:50:15 +0530
Message-ID: <CAKfKVtFf+VpinkOGsBFZ2-_PKvx-C1L7G7_uhY2RCvV5dy6L_w@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: Support disabling multi-master in DT
To:     Laine Jaakko EXT <ext-jaakko.laine@vaisala.com>
Cc:     "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

HI Laine,

On Tue, Feb 18, 2020 at 7:29 PM Laine Jaakko EXT
<ext-jaakko.laine@vaisala.com> wrote:
>
> I2C master operating in multimaster mode can get stuck
> indefinitely if I2C start is detected on bus, but no master
> has a transaction going.
>
> This is a weakness in I2C standard, which defines no way
> to recover, since all masters are indefinitely disallowed
> from interrupting the currently operating master. A start
> condition can be created for example by an electromagnetic
> discharge applied near physical I2C lines. Or a already
> operating master could get reset immediately after sending
> a start.
>
> If it is known during device tree creation that only a single
> I2C master will be present on the bus, this deadlock of the
> I2C bus could be avoided in the driver by ignoring the
> bus_is_busy register of the xiic, since bus can never be
> reserved by any other master.
>
> This patch adds this support for detecting multi-master flag
> in device tree and when not provided, improves I2C reliability
> by ignoring the therefore unnecessary xiic bus_is_busy register.
>
> Error can be reproduced by pulling I2C SDA -line temporarily low
> by shorting it to ground, while linux I2C master is operating on
> it using the xiic driver. The application using the bus will
> start receiving linux error code 16: "Device or resource busy"
> indefinitely:
>
> kernel: pca953x 0-0020: failed writing register
> app: Error writing file, error: 16
>
> With multi-master disabled device will instead receive error
> code 5: "I/O error" while SDA is grounded, but recover normal
> operation once short is removed.
>
> kernel: pca953x 0-0020: failed reading register
> app: Error reading file, error: 5
>
> Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>
> ---
>
> Applies against Linux 5.6-rc1 from master in
> https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
>
> I would like to point out that that since this patch disables
> multimaster mode based on the standard I2C multimaster property
> in device tree (as it propably should) and since the driver has
> previously supported multimaster even when this property doesn't
> exist in device tree, there is a possible backwards
> compatibility issue:
>
> If there are devices relying on the multimaster mode to work
> without defining the property in device tree, their I2C bus
> might not work without issues anymore after this patch, since
> the driver will asume it is the only master on bus and could
> therefore interrupt the communication of some other master on
> same bus.
>
> Please suggest some alternative fix if this is not acceptable
> as is. On the other hand supporting multimaster even on a bus
> with only a single master does currently cause some
> reliability issues since the bus can get indefinitely stuck.
> I don't think there exists a I2C protocol compatible way to
> resolve the deadlock on multimaster bus.
>
>  drivers/i2c/busses/i2c-xiic.c | 52 +++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index 90c1c362394d..37f8d6ee0577 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -46,19 +46,20 @@ enum xiic_endian {
>
>  /**
>   * struct xiic_i2c - Internal representation of the XIIC I2C bus
> - * @dev:       Pointer to device structure
> - * @base:      Memory base of the HW registers
> - * @wait:      Wait queue for callers
> - * @adap:      Kernel adapter representation
> - * @tx_msg:    Messages from above to be sent
> - * @lock:      Mutual exclusion
> - * @tx_pos:    Current pos in TX message
> - * @nmsgs:     Number of messages in tx_msg
> - * @state:     See STATE_
> - * @rx_msg:    Current RX message
> - * @rx_pos:    Position within current RX message
> - * @endianness: big/little-endian byte order
> - * @clk:       Pointer to AXI4-lite input clock
> + * @dev:               Pointer to device structure
> + * @base:              Memory base of the HW registers
> + * @wait:              Wait queue for callers
> + * @adap:              Kernel adapter representation
> + * @tx_msg:            Messages from above to be sent
> + * @lock:              Mutual exclusion
> + * @tx_pos:            Current pos in TX message
> + * @nmsgs:             Number of messages in tx_msg
> + * @state:             See STATE_
> + * @rx_msg:            Current RX message
> + * @rx_pos:            Position within current RX message
> + * @endianness:                big/little-endian byte order
> + * @multimaster:       Indicates bus has multiple masters
> + * @clk:               Pointer to AXI4-lite input clock
>   */
>  struct xiic_i2c {
>         struct device           *dev;
> @@ -73,6 +74,7 @@ struct xiic_i2c {
>         struct i2c_msg          *rx_msg;
>         int                     rx_pos;
>         enum xiic_endian        endianness;
> +       bool                    multimaster;
>         struct clk *clk;
>  };
>
> @@ -521,19 +523,26 @@ static int xiic_bus_busy(struct xiic_i2c *i2c)
>  static int xiic_busy(struct xiic_i2c *i2c)
>  {
>         int tries = 3;
> -       int err;
> +       int err = 0;
>
>         if (i2c->tx_msg)
>                 return -EBUSY;
>
> -       /* for instance if previous transfer was terminated due to TX error
> -        * it might be that the bus is on it's way to become available
> -        * give it at most 3 ms to wake
> +       /* In single master mode bus can only be busy, when in use by this
> +        * driver. If the register indicates bus being busy for some reason we
> +        * should ignore it, since bus will never be released and i2c will be
> +        * stuck forever.
>          */

the other thing i was thinking how will multithreading .
Should we have a lock here.

> -       err = xiic_bus_busy(i2c);
> -       while (err && tries--) {
> -               msleep(1);
> +       if (i2c->multimaster) {
> +               /* for instance if previous transfer was terminated due to TX
> +                * error it might be that the bus is on it's way to become
> +                * available give it at most 3 ms to wake
> +                */
>                 err = xiic_bus_busy(i2c);
> +               while (err && tries--) {
> +                       msleep(1);
> +                       err = xiic_bus_busy(i2c);
> +               }
>         }
>
>         return err;
> @@ -811,6 +820,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
>                 goto err_clk_dis;
>         }
>
> +       i2c->multimaster =
> +               of_property_read_bool(pdev->dev.of_node, "multi-master");
> +
Current will default to mustimaster is 0.
May be the default should be 1 if not specified.
>         /*
>          * Detect endianness
>          * Try to reset the TX FIFO. Then check the EMPTY flag. If it is not
> --
> 2.19.1
>
