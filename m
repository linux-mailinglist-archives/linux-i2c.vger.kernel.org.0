Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF1FD2FDDE9
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Jan 2021 01:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731476AbhAUA3i convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 20 Jan 2021 19:29:38 -0500
Received: from mail-ej1-f52.google.com ([209.85.218.52]:34355 "EHLO
        mail-ej1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731305AbhATV3m (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Jan 2021 16:29:42 -0500
Received: by mail-ej1-f52.google.com with SMTP id hs11so33253702ejc.1;
        Wed, 20 Jan 2021 13:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CHq80JcgebTZpMX/DJOPhoUJ5tf3ahK/z5EPsn2Pxyw=;
        b=AbFrtY6d2mATvUX4LO/Mr1JG0+bt4tqoiK83wQ8iugpqK24fRb1bcexbrDAswfZa7l
         QdG2oqAih2kVG3Ycwfd+CQ15Z6Z8rS4tFynn725leQ3h8+HdJFv28+wpZPuSgWrV+lNd
         5NpkYSCaXMLDwYrNOeNGPJJCeI1aFLLafQ3hNLrWzEnfgdKGCoiNlN1VuW1FGn7MyjGA
         w4eWLhHe4Tpmx+bJEfC0ZRY9DyoJ4bqdawRWmJ5116BBxeZXlYT86W3mukvmDLbTJ6CF
         9P+/bvHw6HiJ8xPzgvC0smKrLGOUjgOr5ZQgPq3zOqc8TlkprLq67EIt0WxkET71QlQQ
         RLGg==
X-Gm-Message-State: AOAM533gZlvHe+4NS53hC+jgEibq2ru9QpApOyLqv5qlREVZEsOJZ8ou
        zlmYCT/SOAUK9HcTPdxlTyxkBOjbn2Pt0wXzAOM=
X-Google-Smtp-Source: ABdhPJwLL6mCZWlbiuI5CCF+g+ncOBPMDtMOG/OnFeIj12AwgjZtaKXvX+DanJK4EPdyBsksh4NsWIOQwZh7buPlSqI=
X-Received: by 2002:a17:906:b2d5:: with SMTP id cf21mr7370233ejb.387.1611178137709;
 Wed, 20 Jan 2021 13:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20210120132834.2375048-1-arnd@kernel.org> <20210120132834.2375048-2-arnd@kernel.org>
In-Reply-To: <20210120132834.2375048-2-arnd@kernel.org>
From:   Barry Song <baohua@kernel.org>
Date:   Thu, 21 Jan 2021 10:28:46 +1300
Message-ID: <CAGsJ_4yNGi3eyn0LHXdqR_3ttd37c0qwu76iOfSodSsW6_UTWA@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: remove sirf bus driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        LKML <linux-kernel@vger.kernel.org>, linux-i2c@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Arnd Bergmann <arnd@kernel.org> 于2021年1月21日周四 上午2:28写道：
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The CSR SiRF prima2/atlas platforms are getting removed, so this driver
> is no longer needed.
>
> Cc: Barry Song <baohua@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Barry Song <baohua@kernel.org>

> ---
>  .../devicetree/bindings/i2c/i2c-sirf.txt      |  19 -
>  drivers/i2c/busses/Kconfig                    |  10 -
>  drivers/i2c/busses/Makefile                   |   1 -
>  drivers/i2c/busses/i2c-sirf.c                 | 475 ------------------
>  4 files changed, 505 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-sirf.txt
>  delete mode 100644 drivers/i2c/busses/i2c-sirf.c
>
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-sirf.txt b/Documentation/devicetree/bindings/i2c/i2c-sirf.txt
> deleted file mode 100644
> index 2701eefb00f7..000000000000
> --- a/Documentation/devicetree/bindings/i2c/i2c-sirf.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -I2C for SiRFprimaII platforms
> -
> -Required properties :
> -- compatible : Must be "sirf,prima2-i2c"
> -- reg: physical base address of the controller and length of memory mapped
> -     region.
> -- interrupts: interrupt number to the cpu.
> -
> -Optional properties:
> -- clock-frequency : Constains desired I2C/HS-I2C bus clock frequency in Hz.
> -  The absence of the property indicates the default frequency 100 kHz.
> -
> -Examples :
> -
> -i2c0: i2c@b00e0000 {
> -    compatible = "sirf,prima2-i2c";
> -    reg = <0xb00e0000 0x10000>;
> -    interrupts = <24>;
> -};
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 0e284fb750e5..85ed2b2bd31a 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -1000,16 +1000,6 @@ config I2C_SIMTEC
>           This driver can also be built as a module. If so, the module
>           will be called i2c-simtec.
>
> -config I2C_SIRF
> -       tristate "CSR SiRFprimaII I2C interface"
> -       depends on ARCH_SIRF || COMPILE_TEST
> -       help
> -         If you say yes to this option, support will be included for the
> -         CSR SiRFprimaII I2C interface.
> -
> -         This driver can also be built as a module.  If so, the module
> -         will be called i2c-sirf.
> -
>  config I2C_SPRD
>         tristate "Spreadtrum I2C interface"
>         depends on I2C=y && (ARCH_SPRD || COMPILE_TEST)
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 683c49faca05..45ce4caa0c2b 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -99,7 +99,6 @@ obj-$(CONFIG_I2C_S3C2410)     += i2c-s3c2410.o
>  obj-$(CONFIG_I2C_SH7760)       += i2c-sh7760.o
>  obj-$(CONFIG_I2C_SH_MOBILE)    += i2c-sh_mobile.o
>  obj-$(CONFIG_I2C_SIMTEC)       += i2c-simtec.o
> -obj-$(CONFIG_I2C_SIRF)         += i2c-sirf.o
>  obj-$(CONFIG_I2C_SPRD)         += i2c-sprd.o
>  obj-$(CONFIG_I2C_ST)           += i2c-st.o
>  obj-$(CONFIG_I2C_STM32F4)      += i2c-stm32f4.o
> diff --git a/drivers/i2c/busses/i2c-sirf.c b/drivers/i2c/busses/i2c-sirf.c
> deleted file mode 100644
> index 30db8fafe078..000000000000
> --- a/drivers/i2c/busses/i2c-sirf.c
> +++ /dev/null
> @@ -1,475 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * I2C bus driver for CSR SiRFprimaII
> - *
> - * Copyright (c) 2011 Cambridge Silicon Radio Limited, a CSR plc group company.
> - */
> -
> -#include <linux/interrupt.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/slab.h>
> -#include <linux/platform_device.h>
> -#include <linux/i2c.h>
> -#include <linux/clk.h>
> -#include <linux/err.h>
> -#include <linux/io.h>
> -
> -#define SIRFSOC_I2C_CLK_CTRL           0x00
> -#define SIRFSOC_I2C_STATUS             0x0C
> -#define SIRFSOC_I2C_CTRL               0x10
> -#define SIRFSOC_I2C_IO_CTRL            0x14
> -#define SIRFSOC_I2C_SDA_DELAY          0x18
> -#define SIRFSOC_I2C_CMD_START          0x1C
> -#define SIRFSOC_I2C_CMD_BUF            0x30
> -#define SIRFSOC_I2C_DATA_BUF           0x80
> -
> -#define SIRFSOC_I2C_CMD_BUF_MAX                16
> -#define SIRFSOC_I2C_DATA_BUF_MAX       16
> -
> -#define SIRFSOC_I2C_CMD(x)             (SIRFSOC_I2C_CMD_BUF + (x)*0x04)
> -#define SIRFSOC_I2C_DATA_MASK(x)        (0xFF<<(((x)&3)*8))
> -#define SIRFSOC_I2C_DATA_SHIFT(x)       (((x)&3)*8)
> -
> -#define SIRFSOC_I2C_DIV_MASK           (0xFFFF)
> -
> -/* I2C status flags */
> -#define SIRFSOC_I2C_STAT_BUSY          BIT(0)
> -#define SIRFSOC_I2C_STAT_TIP           BIT(1)
> -#define SIRFSOC_I2C_STAT_NACK          BIT(2)
> -#define SIRFSOC_I2C_STAT_TR_INT                BIT(4)
> -#define SIRFSOC_I2C_STAT_STOP          BIT(6)
> -#define SIRFSOC_I2C_STAT_CMD_DONE      BIT(8)
> -#define SIRFSOC_I2C_STAT_ERR           BIT(9)
> -#define SIRFSOC_I2C_CMD_INDEX          (0x1F<<16)
> -
> -/* I2C control flags */
> -#define SIRFSOC_I2C_RESET              BIT(0)
> -#define SIRFSOC_I2C_CORE_EN            BIT(1)
> -#define SIRFSOC_I2C_MASTER_MODE                BIT(2)
> -#define SIRFSOC_I2C_CMD_DONE_EN                BIT(11)
> -#define SIRFSOC_I2C_ERR_INT_EN         BIT(12)
> -
> -#define SIRFSOC_I2C_SDA_DELAY_MASK     (0xFF)
> -#define SIRFSOC_I2C_SCLF_FILTER                (3<<8)
> -
> -#define SIRFSOC_I2C_START_CMD          BIT(0)
> -
> -#define SIRFSOC_I2C_CMD_RP(x)          ((x)&0x7)
> -#define SIRFSOC_I2C_NACK               BIT(3)
> -#define SIRFSOC_I2C_WRITE              BIT(4)
> -#define SIRFSOC_I2C_READ               BIT(5)
> -#define SIRFSOC_I2C_STOP               BIT(6)
> -#define SIRFSOC_I2C_START              BIT(7)
> -
> -#define SIRFSOC_I2C_ERR_NOACK      1
> -#define SIRFSOC_I2C_ERR_TIMEOUT    2
> -
> -struct sirfsoc_i2c {
> -       void __iomem *base;
> -       struct clk *clk;
> -       u32 cmd_ptr;            /* Current position in CMD buffer */
> -       u8 *buf;                /* Buffer passed by user */
> -       u32 msg_len;            /* Message length */
> -       u32 finished_len;       /* number of bytes read/written */
> -       u32 read_cmd_len;       /* number of read cmd sent */
> -       int msg_read;           /* 1 indicates a read message */
> -       int err_status;         /* 1 indicates an error on bus */
> -
> -       u32 sda_delay;          /* For suspend/resume */
> -       u32 clk_div;
> -       int last;               /* Last message in transfer, STOP cmd can be sent */
> -
> -       struct completion done; /* indicates completion of message transfer */
> -       struct i2c_adapter adapter;
> -};
> -
> -static void i2c_sirfsoc_read_data(struct sirfsoc_i2c *siic)
> -{
> -       u32 data = 0;
> -       int i;
> -
> -       for (i = 0; i < siic->read_cmd_len; i++) {
> -               if (!(i & 0x3))
> -                       data = readl(siic->base + SIRFSOC_I2C_DATA_BUF + i);
> -               siic->buf[siic->finished_len++] =
> -                       (u8)((data & SIRFSOC_I2C_DATA_MASK(i)) >>
> -                               SIRFSOC_I2C_DATA_SHIFT(i));
> -       }
> -}
> -
> -static void i2c_sirfsoc_queue_cmd(struct sirfsoc_i2c *siic)
> -{
> -       u32 regval;
> -       int i = 0;
> -
> -       if (siic->msg_read) {
> -               while (((siic->finished_len + i) < siic->msg_len)
> -                               && (siic->cmd_ptr < SIRFSOC_I2C_CMD_BUF_MAX)) {
> -                       regval = SIRFSOC_I2C_READ | SIRFSOC_I2C_CMD_RP(0);
> -                       if (((siic->finished_len + i) ==
> -                                       (siic->msg_len - 1)) && siic->last)
> -                               regval |= SIRFSOC_I2C_STOP | SIRFSOC_I2C_NACK;
> -                       writel(regval,
> -                               siic->base + SIRFSOC_I2C_CMD(siic->cmd_ptr++));
> -                       i++;
> -               }
> -
> -               siic->read_cmd_len = i;
> -       } else {
> -               while ((siic->cmd_ptr < SIRFSOC_I2C_CMD_BUF_MAX - 1)
> -                               && (siic->finished_len < siic->msg_len)) {
> -                       regval = SIRFSOC_I2C_WRITE | SIRFSOC_I2C_CMD_RP(0);
> -                       if ((siic->finished_len == (siic->msg_len - 1))
> -                               && siic->last)
> -                               regval |= SIRFSOC_I2C_STOP;
> -                       writel(regval,
> -                               siic->base + SIRFSOC_I2C_CMD(siic->cmd_ptr++));
> -                       writel(siic->buf[siic->finished_len++],
> -                               siic->base + SIRFSOC_I2C_CMD(siic->cmd_ptr++));
> -               }
> -       }
> -       siic->cmd_ptr = 0;
> -
> -       /* Trigger the transfer */
> -       writel(SIRFSOC_I2C_START_CMD, siic->base + SIRFSOC_I2C_CMD_START);
> -}
> -
> -static irqreturn_t i2c_sirfsoc_irq(int irq, void *dev_id)
> -{
> -       struct sirfsoc_i2c *siic = (struct sirfsoc_i2c *)dev_id;
> -       u32 i2c_stat = readl(siic->base + SIRFSOC_I2C_STATUS);
> -
> -       if (i2c_stat & SIRFSOC_I2C_STAT_ERR) {
> -               /* Error conditions */
> -               siic->err_status = SIRFSOC_I2C_ERR_NOACK;
> -               writel(SIRFSOC_I2C_STAT_ERR, siic->base + SIRFSOC_I2C_STATUS);
> -
> -               if (i2c_stat & SIRFSOC_I2C_STAT_NACK)
> -                       dev_dbg(&siic->adapter.dev, "ACK not received\n");
> -               else
> -                       dev_err(&siic->adapter.dev, "I2C error\n");
> -
> -               /*
> -                * Due to hardware ANOMALY, we need to reset I2C earlier after
> -                * we get NOACK while accessing non-existing clients, otherwise
> -                * we will get errors even we access existing clients later
> -                */
> -               writel(readl(siic->base + SIRFSOC_I2C_CTRL) | SIRFSOC_I2C_RESET,
> -                               siic->base + SIRFSOC_I2C_CTRL);
> -               while (readl(siic->base + SIRFSOC_I2C_CTRL) & SIRFSOC_I2C_RESET)
> -                       cpu_relax();
> -
> -               complete(&siic->done);
> -       } else if (i2c_stat & SIRFSOC_I2C_STAT_CMD_DONE) {
> -               /* CMD buffer execution complete */
> -               if (siic->msg_read)
> -                       i2c_sirfsoc_read_data(siic);
> -               if (siic->finished_len == siic->msg_len)
> -                       complete(&siic->done);
> -               else /* Fill a new CMD buffer for left data */
> -                       i2c_sirfsoc_queue_cmd(siic);
> -
> -               writel(SIRFSOC_I2C_STAT_CMD_DONE, siic->base + SIRFSOC_I2C_STATUS);
> -       }
> -
> -       return IRQ_HANDLED;
> -}
> -
> -static void i2c_sirfsoc_set_address(struct sirfsoc_i2c *siic,
> -       struct i2c_msg *msg)
> -{
> -       unsigned char addr;
> -       u32 regval = SIRFSOC_I2C_START | SIRFSOC_I2C_CMD_RP(0) | SIRFSOC_I2C_WRITE;
> -
> -       /* no data and last message -> add STOP */
> -       if (siic->last && (msg->len == 0))
> -               regval |= SIRFSOC_I2C_STOP;
> -
> -       writel(regval, siic->base + SIRFSOC_I2C_CMD(siic->cmd_ptr++));
> -
> -       addr = i2c_8bit_addr_from_msg(msg);
> -
> -       /* Reverse direction bit */
> -       if (msg->flags & I2C_M_REV_DIR_ADDR)
> -               addr ^= 1;
> -
> -       writel(addr, siic->base + SIRFSOC_I2C_CMD(siic->cmd_ptr++));
> -}
> -
> -static int i2c_sirfsoc_xfer_msg(struct sirfsoc_i2c *siic, struct i2c_msg *msg)
> -{
> -       u32 regval = readl(siic->base + SIRFSOC_I2C_CTRL);
> -       /* timeout waiting for the xfer to finish or fail */
> -       int timeout = msecs_to_jiffies((msg->len + 1) * 50);
> -
> -       i2c_sirfsoc_set_address(siic, msg);
> -
> -       writel(regval | SIRFSOC_I2C_CMD_DONE_EN | SIRFSOC_I2C_ERR_INT_EN,
> -               siic->base + SIRFSOC_I2C_CTRL);
> -       i2c_sirfsoc_queue_cmd(siic);
> -
> -       if (wait_for_completion_timeout(&siic->done, timeout) == 0) {
> -               siic->err_status = SIRFSOC_I2C_ERR_TIMEOUT;
> -               dev_err(&siic->adapter.dev, "Transfer timeout\n");
> -       }
> -
> -       writel(regval & ~(SIRFSOC_I2C_CMD_DONE_EN | SIRFSOC_I2C_ERR_INT_EN),
> -               siic->base + SIRFSOC_I2C_CTRL);
> -       writel(0, siic->base + SIRFSOC_I2C_CMD_START);
> -
> -       /* i2c control doesn't response, reset it */
> -       if (siic->err_status == SIRFSOC_I2C_ERR_TIMEOUT) {
> -               writel(readl(siic->base + SIRFSOC_I2C_CTRL) | SIRFSOC_I2C_RESET,
> -                       siic->base + SIRFSOC_I2C_CTRL);
> -               while (readl(siic->base + SIRFSOC_I2C_CTRL) & SIRFSOC_I2C_RESET)
> -                       cpu_relax();
> -       }
> -       return siic->err_status ? -EAGAIN : 0;
> -}
> -
> -static u32 i2c_sirfsoc_func(struct i2c_adapter *adap)
> -{
> -       return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> -}
> -
> -static int i2c_sirfsoc_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> -       int num)
> -{
> -       struct sirfsoc_i2c *siic = adap->algo_data;
> -       int i, ret;
> -
> -       clk_enable(siic->clk);
> -
> -       for (i = 0; i < num; i++) {
> -               siic->buf = msgs[i].buf;
> -               siic->msg_len = msgs[i].len;
> -               siic->msg_read = !!(msgs[i].flags & I2C_M_RD);
> -               siic->err_status = 0;
> -               siic->cmd_ptr = 0;
> -               siic->finished_len = 0;
> -               siic->last = (i == (num - 1));
> -
> -               ret = i2c_sirfsoc_xfer_msg(siic, &msgs[i]);
> -               if (ret) {
> -                       clk_disable(siic->clk);
> -                       return ret;
> -               }
> -       }
> -
> -       clk_disable(siic->clk);
> -       return num;
> -}
> -
> -/* I2C algorithms associated with this master controller driver */
> -static const struct i2c_algorithm i2c_sirfsoc_algo = {
> -       .master_xfer = i2c_sirfsoc_xfer,
> -       .functionality = i2c_sirfsoc_func,
> -};
> -
> -static int i2c_sirfsoc_probe(struct platform_device *pdev)
> -{
> -       struct sirfsoc_i2c *siic;
> -       struct i2c_adapter *adap;
> -       struct clk *clk;
> -       int bitrate;
> -       int ctrl_speed;
> -       int irq;
> -
> -       int err;
> -       u32 regval;
> -
> -       clk = clk_get(&pdev->dev, NULL);
> -       if (IS_ERR(clk)) {
> -               err = PTR_ERR(clk);
> -               dev_err(&pdev->dev, "Clock get failed\n");
> -               goto err_get_clk;
> -       }
> -
> -       err = clk_prepare(clk);
> -       if (err) {
> -               dev_err(&pdev->dev, "Clock prepare failed\n");
> -               goto err_clk_prep;
> -       }
> -
> -       err = clk_enable(clk);
> -       if (err) {
> -               dev_err(&pdev->dev, "Clock enable failed\n");
> -               goto err_clk_en;
> -       }
> -
> -       ctrl_speed = clk_get_rate(clk);
> -
> -       siic = devm_kzalloc(&pdev->dev, sizeof(*siic), GFP_KERNEL);
> -       if (!siic) {
> -               err = -ENOMEM;
> -               goto out;
> -       }
> -       adap = &siic->adapter;
> -       adap->class = I2C_CLASS_DEPRECATED;
> -
> -       siic->base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(siic->base)) {
> -               err = PTR_ERR(siic->base);
> -               goto out;
> -       }
> -
> -       irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               err = irq;
> -               goto out;
> -       }
> -       err = devm_request_irq(&pdev->dev, irq, i2c_sirfsoc_irq, 0,
> -               dev_name(&pdev->dev), siic);
> -       if (err)
> -               goto out;
> -
> -       adap->algo = &i2c_sirfsoc_algo;
> -       adap->algo_data = siic;
> -       adap->retries = 3;
> -
> -       adap->dev.of_node = pdev->dev.of_node;
> -       adap->dev.parent = &pdev->dev;
> -       adap->nr = pdev->id;
> -
> -       strlcpy(adap->name, "sirfsoc-i2c", sizeof(adap->name));
> -
> -       platform_set_drvdata(pdev, adap);
> -       init_completion(&siic->done);
> -
> -       /* Controller initialisation */
> -
> -       writel(SIRFSOC_I2C_RESET, siic->base + SIRFSOC_I2C_CTRL);
> -       while (readl(siic->base + SIRFSOC_I2C_CTRL) & SIRFSOC_I2C_RESET)
> -               cpu_relax();
> -       writel(SIRFSOC_I2C_CORE_EN | SIRFSOC_I2C_MASTER_MODE,
> -               siic->base + SIRFSOC_I2C_CTRL);
> -
> -       siic->clk = clk;
> -
> -       err = of_property_read_u32(pdev->dev.of_node,
> -               "clock-frequency", &bitrate);
> -       if (err < 0)
> -               bitrate = I2C_MAX_STANDARD_MODE_FREQ;
> -
> -       /*
> -        * Due to some hardware design issues, we need to tune the formula.
> -        * Since i2c is open drain interface that allows the slave to
> -        * stall the transaction by holding the SCL line at '0', the RTL
> -        * implementation is waiting for SCL feedback from the pin after
> -        * setting it to High-Z ('1'). This wait adds to the high-time
> -        * interval counter few cycles of the input synchronization
> -        * (depending on the SCL_FILTER_REG field), and also the time it
> -        * takes for the board pull-up resistor to rise the SCL line.
> -        * For slow SCL settings these additions are negligible,
> -        * but they start to affect the speed when clock is set to faster
> -        * frequencies.
> -        * Through the actual tests, use the different user_div value(which
> -        * in the divider formula 'Fio / (Fi2c * user_div)') to adapt
> -        * the different ranges of i2c bus clock frequency, to make the SCL
> -        * more accurate.
> -        */
> -       if (bitrate <= 30000)
> -               regval = ctrl_speed / (bitrate * 5);
> -       else if (bitrate > 30000 && bitrate <= 280000)
> -               regval = (2 * ctrl_speed) / (bitrate * 11);
> -       else
> -               regval = ctrl_speed / (bitrate * 6);
> -
> -       writel(regval, siic->base + SIRFSOC_I2C_CLK_CTRL);
> -       if (regval > 0xFF)
> -               writel(0xFF, siic->base + SIRFSOC_I2C_SDA_DELAY);
> -       else
> -               writel(regval, siic->base + SIRFSOC_I2C_SDA_DELAY);
> -
> -       err = i2c_add_numbered_adapter(adap);
> -       if (err < 0)
> -               goto out;
> -
> -       clk_disable(clk);
> -
> -       dev_info(&pdev->dev, " I2C adapter ready to operate\n");
> -
> -       return 0;
> -
> -out:
> -       clk_disable(clk);
> -err_clk_en:
> -       clk_unprepare(clk);
> -err_clk_prep:
> -       clk_put(clk);
> -err_get_clk:
> -       return err;
> -}
> -
> -static int i2c_sirfsoc_remove(struct platform_device *pdev)
> -{
> -       struct i2c_adapter *adapter = platform_get_drvdata(pdev);
> -       struct sirfsoc_i2c *siic = adapter->algo_data;
> -
> -       writel(SIRFSOC_I2C_RESET, siic->base + SIRFSOC_I2C_CTRL);
> -       i2c_del_adapter(adapter);
> -       clk_unprepare(siic->clk);
> -       clk_put(siic->clk);
> -       return 0;
> -}
> -
> -#ifdef CONFIG_PM
> -static int i2c_sirfsoc_suspend(struct device *dev)
> -{
> -       struct i2c_adapter *adapter = dev_get_drvdata(dev);
> -       struct sirfsoc_i2c *siic = adapter->algo_data;
> -
> -       clk_enable(siic->clk);
> -       siic->sda_delay = readl(siic->base + SIRFSOC_I2C_SDA_DELAY);
> -       siic->clk_div = readl(siic->base + SIRFSOC_I2C_CLK_CTRL);
> -       clk_disable(siic->clk);
> -       return 0;
> -}
> -
> -static int i2c_sirfsoc_resume(struct device *dev)
> -{
> -       struct i2c_adapter *adapter = dev_get_drvdata(dev);
> -       struct sirfsoc_i2c *siic = adapter->algo_data;
> -
> -       clk_enable(siic->clk);
> -       writel(SIRFSOC_I2C_RESET, siic->base + SIRFSOC_I2C_CTRL);
> -       while (readl(siic->base + SIRFSOC_I2C_CTRL) & SIRFSOC_I2C_RESET)
> -               cpu_relax();
> -       writel(SIRFSOC_I2C_CORE_EN | SIRFSOC_I2C_MASTER_MODE,
> -               siic->base + SIRFSOC_I2C_CTRL);
> -       writel(siic->clk_div, siic->base + SIRFSOC_I2C_CLK_CTRL);
> -       writel(siic->sda_delay, siic->base + SIRFSOC_I2C_SDA_DELAY);
> -       clk_disable(siic->clk);
> -       return 0;
> -}
> -
> -static const struct dev_pm_ops i2c_sirfsoc_pm_ops = {
> -       .suspend = i2c_sirfsoc_suspend,
> -       .resume = i2c_sirfsoc_resume,
> -};
> -#endif
> -
> -static const struct of_device_id sirfsoc_i2c_of_match[] = {
> -       { .compatible = "sirf,prima2-i2c", },
> -       {},
> -};
> -MODULE_DEVICE_TABLE(of, sirfsoc_i2c_of_match);
> -
> -static struct platform_driver i2c_sirfsoc_driver = {
> -       .driver = {
> -               .name = "sirfsoc_i2c",
> -#ifdef CONFIG_PM
> -               .pm = &i2c_sirfsoc_pm_ops,
> -#endif
> -               .of_match_table = sirfsoc_i2c_of_match,
> -       },
> -       .probe = i2c_sirfsoc_probe,
> -       .remove = i2c_sirfsoc_remove,
> -};
> -module_platform_driver(i2c_sirfsoc_driver);
> -
> -MODULE_DESCRIPTION("SiRF SoC I2C master controller driver");
> -MODULE_AUTHOR("Zhiwu Song <Zhiwu.Song@csr.com>");
> -MODULE_AUTHOR("Xiangzhen Ye <Xiangzhen.Ye@csr.com>");
> -MODULE_LICENSE("GPL v2");
> --
> 2.29.2
>
