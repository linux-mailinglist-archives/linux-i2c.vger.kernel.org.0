Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63E0671018
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 02:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjARBgq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 20:36:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjARBgp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 20:36:45 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FB94708C;
        Tue, 17 Jan 2023 17:36:43 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id v10so46435106edi.8;
        Tue, 17 Jan 2023 17:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Za3EZeGx0XYESERo/J8ed21iLIZRkcLN0Y1ikTWxs3g=;
        b=Q7nGC5dLhOpwFWrnZOhZusQBfve+gCy3dCb1YZwzLlXeQ2HHKEi7Gd2Wnl1OkNKos5
         PFbVQySiOtZOVp8e4C8MY6/j38GJsxu3fSpDZ3Uh/cYyVxmjYBuUyFxX1RU4Ck324guW
         2l+qkxxr74r8Q+KIe5O9nJsiw9kSYkiYo9TwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za3EZeGx0XYESERo/J8ed21iLIZRkcLN0Y1ikTWxs3g=;
        b=PPh/sX2OGhgjzUTgW1TcAuqIETtEowvNok1LHAPw9bi+6NQcVMHLeh2gHeO2xHI8BD
         B8VatYD/PDNoQKFNRhDZ9xsGWvotyovZ3OnGg8gK5YcRoz/Ocej+dGtQfa/TiK6baz/v
         LtZsDpMOqwhqb3bZzVpVizslW/BBzVvI9gP/fdvEThhMQhUkUFjE0k3JolAK5Xdsk7wL
         ogZByr79V92oOwOSIOteQkQ2RRhU/JIRUKY2b88JRClbHuWVadM1RmqK/ZhMYjlQxEcg
         H4P3dlPc+XUFOK6m2NENSfDl0EQ7GeGKOIHmjV1QqgsA4ir357DDcP6QOeO3Fxf1iY4O
         h84w==
X-Gm-Message-State: AFqh2krpkcQJNQv0sSV9X2JbUTcVTV2Oonzq0cZI8/TKPjvTnc4BHyO2
        m3p//H599HiCD1kMNe0mzU8b8pY/9sqkkYkHcy5HMYyeEPI=
X-Google-Smtp-Source: AMrXdXsIIBfeuQdXCFwH7BkWk4RnxXzUaqtcFMs6cYC4d9ioykisIfuBvS1MB0eNll6sOEGW/99lvgh189FfSpbLJvk=
X-Received: by 2002:aa7:de83:0:b0:495:1602:fe69 with SMTP id
 j3-20020aa7de83000000b004951602fe69mr571538edv.224.1674005801246; Tue, 17 Jan
 2023 17:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20230117204439.76841-1-nick.hawkins@hpe.com> <20230117204439.76841-2-nick.hawkins@hpe.com>
In-Reply-To: <20230117204439.76841-2-nick.hawkins@hpe.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 18 Jan 2023 01:36:28 +0000
Message-ID: <CACPK8XfnNdSH74yotBvXmArYKe2y5ycWaSoV2X=ggXf2xPayxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] i2c: hpe: Add GXP SoC I2C Controller
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 18 Jan 2023 at 00:52, <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> The GXP SoC supports 10 I2C engines. Each I2C engine is completely
> independent and can function both as an I2C master and I2C slave. The
> I2C master can operate in a multi master environment. The engines support
> a scalable speed from 8kHZ to 1.5 Mhz.
>
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>

Looks pretty good to me. I have some minor review comments below.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> ---
>
> v2:
>  *Removed rogue tab in structure
>  *Removed use of __iomem base local variables as it was unnecessary
>  *Switched #if IS_ENABLED() -> if (IS_ENABLED()) inside functions
>  *Removed use of pr_* functions
>  *Removed informational prints in register and unregister functions
>  *Removed print from interrupt handler
>  *No informational prints in probe function
>  *Switched dev_err for dev_err_probe in probe function
>  *Use respective helper for mapping the resource to __iomem
> ---
>  drivers/i2c/busses/Kconfig   |   7 +
>  drivers/i2c/busses/Makefile  |   1 +
>  drivers/i2c/busses/i2c-gxp.c | 609 +++++++++++++++++++++++++++++++++++
>  3 files changed, 617 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-gxp.c
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index e50f9603d189..8b3951e0ca5c 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1457,4 +1457,11 @@ config I2C_VIRTIO
>            This driver can also be built as a module. If so, the module
>            will be called i2c-virtio.
>
> +config I2C_GXP
> +       tristate "GXP I2C Interface"
> +       depends on ARCH_HPE_GXP || COMPILE_TEST
> +       help
> +         This enables support for GXP I2C interface. The I2C engines can be
> +         either I2C master or I2C slaves.
> +
>  endmenu
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index e73cdb1d2b5a..dcc96eab6d68 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -127,6 +127,7 @@ obj-$(CONFIG_I2C_THUNDERX)  += i2c-thunderx.o
>  obj-$(CONFIG_I2C_XILINX)       += i2c-xiic.o
>  obj-$(CONFIG_I2C_XLP9XX)       += i2c-xlp9xx.o
>  obj-$(CONFIG_I2C_RCAR)         += i2c-rcar.o
> +obj-$(CONFIG_I2C_GXP)          += i2c-gxp.o
>
>  # External I2C/SMBus adapter drivers
>  obj-$(CONFIG_I2C_DIOLAN_U2C)   += i2c-diolan-u2c.o
> diff --git a/drivers/i2c/busses/i2c-gxp.c b/drivers/i2c/busses/i2c-gxp.c
> new file mode 100644
> index 000000000000..bd41858a3149
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-gxp.c
> @@ -0,0 +1,609 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (C) 2022 Hewlett-Packard Enterprise Development Company, L.P. */
> +
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +
> +#define GXP_MAX_I2C_ENGINE 10
> +static const char * const gxp_i2c_name[] = {
> +       "gxp-i2c0", "gxp-i2c1", "gxp-i2c2", "gxp-i2c3",
> +       "gxp-i2c4", "gxp-i2c5", "gxp-i2c6", "gxp-i2c7",
> +       "gxp-i2c8", "gxp-i2c9" };
> +
> +/* Default value */
> +#define GXP_I2C_BIT_RATE       100000  /* 100kHz */
> +
> +/* GXP I2C Global interrupt status/enable register*/
> +#define GXP_I2CINTSTAT         0x00
> +#define GXP_I2CINTEN           0x04
> +
> +/* GXP I2C registers */
> +#define GXP_I2CSTAT            0x00
> +#define MASK_STOP_EVENT                0x20
> +#define MASK_ACK               0x08
> +#define MASK_RW                        0x04
> +#define GXP_I2CEVTERR          0x01
> +#define MASK_SLAVE_CMD_EVENT   0x01
> +#define MASK_SLAVE_DATA_EVENT  0x02
> +#define MASK_MASTER_EVENT      0x10
> +#define GXP_I2CSNPDAT          0x02
> +#define GXP_I2CMCMD            0x04
> +#define GXP_I2CSCMD            0x06
> +#define GXP_I2CSNPAA           0x09
> +#define GXP_I2CADVFEAT         0x0A
> +#define GXP_I2COWNADR          0x0B
> +#define GXP_I2CFREQDIV         0x0C
> +#define GXP_I2CFLTFAIR         0x0D
> +#define GXP_I2CTMOEDG          0x0E
> +#define GXP_I2CCYCTIM          0x0F
> +
> +static bool i2c_global_init_done;
> +
> +enum {
> +       GXP_I2C_IDLE = 0,
> +       GXP_I2C_ADDR_PHASE,
> +       GXP_I2C_RDATA_PHASE,
> +       GXP_I2C_WDATA_PHASE,
> +       GXP_I2C_ADDR_NACK,
> +       GXP_I2C_DATA_NACK,
> +       GXP_I2C_ERROR,
> +       GXP_I2C_COMP
> +};
> +
> +struct gxp_i2c_drvdata {
> +       struct device *dev;
> +       void __iomem *base;
> +       u32 bus_frequency;
> +       int engine;
> +       int irq;
> +       struct completion completion;
> +       struct i2c_adapter adapter;
> +       struct i2c_msg *curr_msg;
> +       int msgs_remaining;
> +       int msgs_num;
> +       u8 *buf;
> +       size_t buf_remaining;
> +       unsigned char state;
> +       struct i2c_client *slave;
> +       unsigned char stopped;
> +};
> +
> +static struct regmap *i2cg_map;
> +
> +static void gxp_i2c_start(struct gxp_i2c_drvdata *drvdata)
> +{
> +       u16 value;
> +
> +       drvdata->buf = drvdata->curr_msg->buf;
> +       drvdata->buf_remaining = drvdata->curr_msg->len;
> +
> +       /* Note: Address in struct i2c_msg is 7 bits */
> +       value = drvdata->curr_msg->addr << 9;
> +
> +       if (drvdata->curr_msg->flags & I2C_M_RD) {
> +               /* Read */
> +               value |= 0x05;
> +       } else {
> +               /* Write */
> +               value |= 0x01;
> +       }
> +
> +       drvdata->state = GXP_I2C_ADDR_PHASE;
> +       writew(value, drvdata->base + GXP_I2CMCMD);
> +}
> +
> +static int gxp_i2c_master_xfer(struct i2c_adapter *adapter,
> +                              struct i2c_msg *msgs, int num)
> +{
> +       int ret;
> +       struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(adapter);
> +       unsigned long time_left;
> +
> +       drvdata->msgs_remaining = num;
> +       drvdata->curr_msg = msgs;
> +       drvdata->msgs_num = num;
> +       reinit_completion(&drvdata->completion);
> +
> +       gxp_i2c_start(drvdata);
> +
> +       time_left = wait_for_completion_timeout(&drvdata->completion,
> +                                               adapter->timeout);
> +       ret = num - drvdata->msgs_remaining;
> +       if (time_left == 0) {
> +               switch (drvdata->state) {
> +               case GXP_I2C_WDATA_PHASE:
> +                       dev_err(drvdata->dev,
> +                               "gxp_i2c_start:write Data phase timeout at msg[%d]\n",
> +                       ret);
> +                       break;
> +               case GXP_I2C_RDATA_PHASE:
> +                       dev_err(drvdata->dev,
> +                               "gxp_i2c_start:read Data phase timeout at msg[%d]\n",
> +                       ret);
> +                       break;
> +               case GXP_I2C_ADDR_PHASE:
> +                       dev_err(drvdata->dev,
> +                               "gxp_i2c_start:Addr phase timeout\n");
> +                       break;
> +               default:
> +                       dev_err(drvdata->dev,
> +                               "gxp_i2c_start:i2c transfer timeout state=%d\n",
> +                       drvdata->state);
> +                       break;
> +               }
> +               return -ETIMEDOUT;
> +       }
> +
> +       if (drvdata->state == GXP_I2C_ADDR_NACK) {
> +               dev_err(drvdata->dev,
> +                       "gxp_i2c_start:No ACK for address phase\n");
> +               return -EIO;
> +       } else if (drvdata->state == GXP_I2C_DATA_NACK) {
> +               dev_err(drvdata->dev, "gxp_i2c_start:No ACK for data phase\n");
> +               return -EIO;
> +       }
> +
> +       return ret;
> +}
> +
> +static u32 gxp_i2c_func(struct i2c_adapter *adap)
> +{
> +       if (IS_ENABLED(CONFIG_I2C_SLAVE))
> +               return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL | I2C_FUNC_SLAVE;
> +
> +       return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static int gxp_i2c_reg_slave(struct i2c_client *slave)
> +{
> +       struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(slave->adapter);
> +
> +       if (drvdata->slave)
> +               return -EBUSY;
> +
> +       if (slave->flags & I2C_CLIENT_TEN)
> +               return -EAFNOSUPPORT;
> +
> +       drvdata->slave = slave;
> +
> +       writeb(slave->addr << 1, drvdata->base + GXP_I2COWNADR);
> +       writeb(0x69, drvdata->base + GXP_I2CSCMD);
> +
> +       return 0;
> +}
> +
> +static int gxp_i2c_unreg_slave(struct i2c_client *slave)
> +{
> +       struct gxp_i2c_drvdata *drvdata = i2c_get_adapdata(slave->adapter);
> +
> +       WARN_ON(!drvdata->slave);
> +
> +       writeb(0x00, drvdata->base + GXP_I2COWNADR);
> +       writeb(0xF0, drvdata->base + GXP_I2CSCMD);
> +
> +       drvdata->slave = NULL;
> +
> +       return 0;
> +}
> +#endif
> +
> +static const struct i2c_algorithm gxp_i2c_algo = {
> +       .master_xfer   = gxp_i2c_master_xfer,
> +       .functionality = gxp_i2c_func,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +       .reg_slave     = gxp_i2c_reg_slave,
> +       .unreg_slave   = gxp_i2c_unreg_slave,
> +#endif
> +};
> +
> +static void gxp_i2c_stop(struct gxp_i2c_drvdata *drvdata)
> +{
> +       /* Clear event and send stop */
> +       writeb(0x82, drvdata->base + GXP_I2CMCMD);
> +
> +       complete(&drvdata->completion);
> +}
> +
> +static void gxp_i2c_restart(struct gxp_i2c_drvdata *drvdata)
> +{
> +       u16 value;
> +
> +       drvdata->buf = drvdata->curr_msg->buf;
> +       drvdata->buf_remaining = drvdata->curr_msg->len;
> +
> +       value = drvdata->curr_msg->addr << 9;
> +
> +       if (drvdata->curr_msg->flags & I2C_M_RD) {
> +               /* Read and clear master event */
> +               value |= 0x85;
> +       } else {
> +               /* Write and clear master event */
> +               value |= 0x81;
> +       }
> +
> +       drvdata->state = GXP_I2C_ADDR_PHASE;
> +
> +       writew(value, drvdata->base + GXP_I2CMCMD);
> +}
> +
> +static void gxp_i2c_chk_addr_ack(struct gxp_i2c_drvdata *drvdata)
> +{
> +       u16 value;
> +
> +       value = readb(drvdata->base + GXP_I2CSTAT);
> +       if (!(value & MASK_ACK)) {
> +               /* Got no ack, stop */
> +               drvdata->state = GXP_I2C_ADDR_NACK;
> +               gxp_i2c_stop(drvdata);
> +               return;
> +       }
> +
> +       if (drvdata->curr_msg->flags & I2C_M_RD) {
> +               /* Start to read data from slave */
> +               if (drvdata->buf_remaining == 0) {
> +                       /* No more data to read, stop */
> +                       drvdata->msgs_remaining--;
> +                       drvdata->state = GXP_I2C_COMP;
> +                       gxp_i2c_stop(drvdata);
> +                       return;
> +               }
> +               drvdata->state = GXP_I2C_RDATA_PHASE;
> +
> +               if (drvdata->buf_remaining == 1) {
> +                       /* The last data, do not ack */
> +                       writeb(0x84, drvdata->base + GXP_I2CMCMD);
> +               } else {
> +                       /* Read data and ack it */
> +                       writeb(0x8C, drvdata->base + GXP_I2CMCMD);
> +               }
> +       } else {
> +               /* Start to write first data to slave */
> +               if (drvdata->buf_remaining == 0) {
> +                       /* No more data to write, stop */
> +                       drvdata->msgs_remaining--;
> +                       drvdata->state = GXP_I2C_COMP;
> +                       gxp_i2c_stop(drvdata);
> +                       return;
> +               }
> +               value = *drvdata->buf;
> +               value = value << 8;
> +               /* Clear master event */
> +               value |= 0x80;
> +               drvdata->buf++;
> +               drvdata->buf_remaining--;
> +               drvdata->state = GXP_I2C_WDATA_PHASE;
> +               writew(value, drvdata->base + GXP_I2CMCMD);
> +       }
> +}
> +
> +static void gxp_i2c_ack_data(struct gxp_i2c_drvdata *drvdata)
> +{
> +       u8 value;
> +
> +       /* Store the data returned */
> +       value = readb(drvdata->base + GXP_I2CSNPDAT);
> +       *drvdata->buf = value;
> +       drvdata->buf++;
> +       drvdata->buf_remaining--;
> +
> +       if (drvdata->buf_remaining == 0) {
> +               /* No more data, this message is completed. */
> +               drvdata->msgs_remaining--;
> +
> +               if (drvdata->msgs_remaining == 0) {
> +                       /* No more messages, stop */
> +                       drvdata->state = GXP_I2C_COMP;
> +                       gxp_i2c_stop(drvdata);
> +                       return;
> +               }
> +               /* Move to next message and start transfer */
> +               drvdata->curr_msg++;
> +               gxp_i2c_restart(drvdata);
> +               return;
> +       }
> +
> +       /* Ack the slave to make it send next byte */
> +       drvdata->state = GXP_I2C_RDATA_PHASE;
> +       if (drvdata->buf_remaining == 1) {
> +               /* The last data, do not ack */
> +               writeb(0x84, drvdata->base + GXP_I2CMCMD);
> +       } else {
> +               /* Read data and ack it */
> +               writeb(0x8C, drvdata->base + GXP_I2CMCMD);
> +       }
> +}
> +
> +static void gxp_i2c_chk_data_ack(struct gxp_i2c_drvdata *drvdata)
> +{
> +       u16 value;
> +
> +       value = readb(drvdata->base + GXP_I2CSTAT);
> +       if (!(value & MASK_ACK)) {
> +               /* Received No ack, stop */
> +               drvdata->state = GXP_I2C_DATA_NACK;
> +               gxp_i2c_stop(drvdata);
> +               return;
> +       }
> +
> +       /* Got ack, check if there is more data to write */
> +       if (drvdata->buf_remaining == 0) {
> +               /* No more data, this message is completed */
> +               drvdata->msgs_remaining--;
> +
> +               if (drvdata->msgs_remaining == 0) {
> +                       /* No more messages, stop */
> +                       drvdata->state = GXP_I2C_COMP;
> +                       gxp_i2c_stop(drvdata);
> +                       return;
> +               }
> +               /* Move to next message and start transfer */
> +               drvdata->curr_msg++;
> +               gxp_i2c_restart(drvdata);
> +               return;
> +       }
> +
> +       /* Write data to slave */
> +       value = *drvdata->buf;
> +       value = value << 8;
> +
> +       /* Clear master event */
> +       value |= 0x80;
> +       drvdata->buf++;
> +       drvdata->buf_remaining--;
> +       drvdata->state = GXP_I2C_WDATA_PHASE;
> +       writew(value, drvdata->base + GXP_I2CMCMD);
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +static bool gxp_i2c_slave_irq_handler(struct gxp_i2c_drvdata *drvdata)
> +{
> +       u16 value;
> +       u8 buf;
> +       int ret;
> +
> +       value = readb(drvdata->base + GXP_I2CEVTERR);

If you're reading value with readb, it could be a u8 too?

> +
> +       /* Received start or stop event */
> +       if (value & MASK_SLAVE_CMD_EVENT) {
> +               value = readb(drvdata->base + GXP_I2CSTAT);
> +               /* Master sent stop */
> +               if (value & MASK_STOP_EVENT) {
> +                       if (drvdata->stopped == 0)
> +                               i2c_slave_event(drvdata->slave, I2C_SLAVE_STOP, &buf);
> +                       writeb(0x69, drvdata->base + GXP_I2CSCMD);
> +                       drvdata->stopped = 1;
> +               } else {
> +                       /* Master sent start and  wants to read */
> +                       drvdata->stopped = 0;
> +                       if (value & MASK_RW) {
> +                               i2c_slave_event(drvdata->slave,
> +                                               I2C_SLAVE_READ_REQUESTED, &buf);
> +                               value = buf << 8 | 0x61;
> +                               writew(value, drvdata->base + GXP_I2CSCMD);
> +                       } else {
> +                               /* Master wants to write to us */
> +                               ret = i2c_slave_event(drvdata->slave,
> +                                                     I2C_SLAVE_WRITE_REQUESTED, &buf);
> +                               if (!ret) {
> +                                       /* Ack next byte from master */
> +                                       writeb(0x69, drvdata->base + GXP_I2CSCMD);
> +                               } else {
> +                                       /* Nack next byte from master */
> +                                       writeb(0x61, drvdata->base + GXP_I2CSCMD);
> +                               }
> +                       }
> +               }
> +       } else if (value & MASK_SLAVE_DATA_EVENT) {
> +               value = readb(drvdata->base + GXP_I2CSTAT);
> +               /* Master wants to read */
> +               if (value & MASK_RW) {
> +                       /* Master wants another byte */
> +                       if (value & MASK_ACK) {
> +                               i2c_slave_event(drvdata->slave,
> +                                               I2C_SLAVE_READ_PROCESSED, &buf);
> +                               value = buf << 8 | 0x61;
> +                               writew(value, drvdata->base + GXP_I2CSCMD);
> +                       } else {
> +                               /* No more bytes needed */
> +                               writew(0x69, drvdata->base + GXP_I2CSCMD);
> +                       }
> +               } else {
> +                       /* Master wants to write to us */
> +                       value = readb(drvdata->base + GXP_I2CSNPDAT);
> +                       buf = (uint8_t)value;
> +                       ret = i2c_slave_event(drvdata->slave,
> +                                             I2C_SLAVE_WRITE_RECEIVED, &buf);
> +                       if (!ret) {
> +                               /* Ack next byte from master */
> +                               writeb(0x69, drvdata->base + GXP_I2CSCMD);
> +                       } else {
> +                               /* Nack next byte from master */
> +                               writeb(0x61, drvdata->base + GXP_I2CSCMD);
> +                       }
> +               }
> +       } else {
> +               return false;
> +       }
> +
> +       return true;
> +}
> +#endif
> +
> +static irqreturn_t gxp_i2c_irq_handler(int irq, void *_drvdata)
> +{
> +       struct gxp_i2c_drvdata *drvdata = (struct gxp_i2c_drvdata *)_drvdata;
> +       u32 value;
> +
> +       regmap_read(i2cg_map, GXP_I2CINTSTAT, &value);
> +       if (!(value & (1 << drvdata->engine)))

1U, or BIT(drvdata->engine).

This is checking that the interrupt is for an engine that is enabled
(or that is present)?

> +               return IRQ_NONE;
> +
> +       value = readb(drvdata->base + GXP_I2CEVTERR);
> +
> +       /* Error */
> +       if (value & ~(MASK_MASTER_EVENT | MASK_SLAVE_CMD_EVENT |
> +                               MASK_SLAVE_DATA_EVENT)) {
> +               /* Clear all events */
> +               writeb(0x00, drvdata->base + GXP_I2CEVTERR);
> +               drvdata->state = GXP_I2C_ERROR;
> +               gxp_i2c_stop(drvdata);
> +               return IRQ_HANDLED;
> +       }
> +
> +       if (IS_ENABLED(CONFIG_I2C_SLAVE)) {
> +               /* Slave mode */
> +               if (value & (MASK_SLAVE_CMD_EVENT | MASK_SLAVE_DATA_EVENT)) {
> +                       if (gxp_i2c_slave_irq_handler(drvdata))
> +                               return IRQ_HANDLED;
> +                       return IRQ_NONE;
> +               }
> +       }
> +
> +       /*  Master mode */
> +       switch (drvdata->state) {
> +       case GXP_I2C_ADDR_PHASE:
> +               gxp_i2c_chk_addr_ack(drvdata);
> +               break;
> +
> +       case GXP_I2C_RDATA_PHASE:
> +               gxp_i2c_ack_data(drvdata);
> +               break;
> +
> +       case GXP_I2C_WDATA_PHASE:
> +               gxp_i2c_chk_data_ack(drvdata);
> +               break;
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static void gxp_i2c_init(struct gxp_i2c_drvdata *drvdata)
> +{
> +       drvdata->state = GXP_I2C_IDLE;
> +       writeb(2000000 / drvdata->bus_frequency,
> +              drvdata->base + GXP_I2CFREQDIV);
> +       writeb(0x32, drvdata->base + GXP_I2CFLTFAIR);
> +       writeb(0x0a, drvdata->base + GXP_I2CTMOEDG);
> +       writeb(0x00, drvdata->base + GXP_I2CCYCTIM);
> +       writeb(0x00, drvdata->base + GXP_I2CSNPAA);
> +       writeb(0x00, drvdata->base + GXP_I2CADVFEAT);
> +       writeb(0xF0, drvdata->base + GXP_I2CSCMD);
> +       writeb(0x80, drvdata->base + GXP_I2CMCMD);
> +       writeb(0x00, drvdata->base + GXP_I2CEVTERR);
> +       writeb(0x00, drvdata->base + GXP_I2COWNADR);
> +}
> +
> +static int gxp_i2c_probe(struct platform_device *pdev)
> +{
> +       struct gxp_i2c_drvdata *drvdata;
> +       int rc;
> +       struct resource *res;
> +       struct i2c_adapter *adapter;
> +
> +       if (!i2c_global_init_done) {
> +               i2cg_map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
> +                                                          "hpe,sysreg");
> +               if (IS_ERR(i2cg_map)) {
> +                       return dev_err_probe(&pdev->dev, IS_ERR(i2cg_map),
> +                                            "failed to map i2cg_handle\n");
> +               }
> +
> +               /* Disable interrupt */
> +               regmap_update_bits(i2cg_map, GXP_I2CINTEN, 0x00000FFF, 0);
> +               i2c_global_init_done = true;
> +       }
> +
> +       drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata),
> +                              GFP_KERNEL);
> +       if (!drvdata)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, drvdata);
> +       drvdata->dev = &pdev->dev;
> +       init_completion(&drvdata->completion);
> +
> +       drvdata->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(drvdata->base))
> +               return PTR_ERR(drvdata->base);
> +
> +       /* Use physical memory address to determine which I2C engine this is. */
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       drvdata->engine = (res->start & 0xf00) >> 8;

As I understand it res->start will correspond to drvdata->base, so you
can use that instead?

> +
> +       if (drvdata->engine >= GXP_MAX_I2C_ENGINE) {
> +               return dev_err_probe(&pdev->dev, -EINVAL, "i2c engine% is unsupported\n",
> +                       drvdata->engine);
> +       }
> +
> +       rc = platform_get_irq(pdev, 0);
> +       if (rc < 0)
> +               return dev_err_probe(&pdev->dev, rc, "unable to obtain IRQ number\n");

platform_get_irq does dev_err_probe for you, just return rc.

> +
> +       drvdata->irq = rc;
> +       rc = devm_request_irq(&pdev->dev, drvdata->irq, gxp_i2c_irq_handler,
> +                             IRQF_SHARED, gxp_i2c_name[drvdata->engine], drvdata);
> +       if (rc < 0)
> +               return dev_err_probe(&pdev->dev, rc, "irq request failed\n");
> +
> +       rc = of_property_read_u32(pdev->dev.of_node,
> +                                 "clock-frequency", &drvdata->bus_frequency);

The i2c core has helpers here, see if i2c_parse_fw_timings does what you want.

> +       if (rc < 0)
> +               drvdata->bus_frequency = GXP_I2C_BIT_RATE;
> +
> +       gxp_i2c_init(drvdata);
> +
> +       /* Enable interrupt */
> +       regmap_update_bits(i2cg_map, GXP_I2CINTEN, BIT(drvdata->engine),
> +                          BIT(drvdata->engine));
> +
> +       adapter = &drvdata->adapter;
> +       i2c_set_adapdata(adapter, drvdata);
> +
> +       adapter->owner = THIS_MODULE;
> +       adapter->class = I2C_CLASS_DEPRECATED;

I don't think this is needed for new drivers?

> +       strscpy(adapter->name, "HPE GXP I2C adapter", sizeof(adapter->name));
> +       adapter->algo = &gxp_i2c_algo;
> +       adapter->dev.parent = &pdev->dev;
> +       adapter->dev.of_node = pdev->dev.of_node;
> +
> +       rc = i2c_add_adapter(adapter);
> +       if (rc)
> +               return dev_err_probe(&pdev->dev, rc, "i2c add adapter failed\n");
> +
> +       return 0;
> +}
> +
> +static int gxp_i2c_remove(struct platform_device *pdev)
> +{
> +       struct gxp_i2c_drvdata *drvdata = platform_get_drvdata(pdev);
> +

Do you want to disable the IRQs here?

> +       i2c_del_adapter(&drvdata->adapter);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id gxp_i2c_of_match[] = {
> +       { .compatible = "hpe,gxp-i2c" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, gxp_i2c_of_match);
> +
> +static struct platform_driver gxp_i2c_driver = {
> +       .probe  = gxp_i2c_probe,
> +       .remove = gxp_i2c_remove,
> +       .driver = {
> +               .name = "gxp-i2c",
> +               .of_match_table = gxp_i2c_of_match,
> +       },
> +};
> +module_platform_driver(gxp_i2c_driver);
> +
> +MODULE_AUTHOR("Nick Hawkins <nick.hawkins@hpe.com>");
> +MODULE_DESCRIPTION("HPE GXP I2C bus driver");
> +MODULE_LICENSE("GPL");
> --
> 2.17.1
>
