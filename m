Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8C6117988B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Mar 2020 20:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgCDTFB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Mar 2020 14:05:01 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45041 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbgCDTFA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Mar 2020 14:05:00 -0500
Received: by mail-ot1-f67.google.com with SMTP id v22so3103241otq.11
        for <linux-i2c@vger.kernel.org>; Wed, 04 Mar 2020 11:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ffVp+DJw7gJr5+JyqQCO3xZjH+pe0MY8AZ10aYkjTiE=;
        b=c05l3T/2xOrCenVAmG1pbZSSKTvHnsSCanFqMtV/kd8JYNx+2Mvj7ojR9ps09i3MyO
         Sc/TIDLzOwetNAuyqK6lUQCF/svLan/Vy9dxST3e1wajhhaJDMeWp/3Uk9Q9xNk+2UZL
         IykhT7cNxLTaq1t4Jmm2PESNvYi1aph1p8L7XswpDF6J9QlzFefT+3Rw+P7BBSnFjxMP
         WJfu02x4Q2PWHzoXTuhcZbQq7DPiHjG2bnUQVrU5HL4z8H3ccxbpUF36pDg+k+WxnScr
         TGZh8FwrQfwxxj2ip3QS8U3lwTUeORe3TU4qjBuW58M8IvAJ5NyTCe7YpHg96d/6V2z9
         mSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ffVp+DJw7gJr5+JyqQCO3xZjH+pe0MY8AZ10aYkjTiE=;
        b=Gak8MNLLFjAv0DA/MkrHG/+YDy6quNHiahSgTbqrNQq4T0SzqPt16wZQw+/YqqQkRl
         Knao2uR58aO4B8bBg38ZZM6Ls0HnMicOSWSxvehH2UpXH1L8yHGjmXM/ghE7otN3q2Pa
         EGG/mUT7l+wqL51O5rRCoiTdsAt+5J20n4Pjbzy7RwcHLEsC/MJqScu8D/7uv0eRD/kp
         0VMERMBsx7WoQBZviCawn8HAtTqeSmnxVN99C7ZSVOzdwsruR58bvKDcgPb/j83kYQQq
         i+iPtr6wlZRqxsrCthjtK8YDWhvz551+3C0t7mZHvtD5MjhNmb4Itikkd84ZmknlHADq
         1BGQ==
X-Gm-Message-State: ANhLgQ2YfY20EITZZiKkE9129B9lnrfBbNUU4FV3ivfxN99MC0eqT29R
        pqlV9HiHuMbw1gJ2YuK5K4VV9S1ziW+RXS37lSOFiw==
X-Google-Smtp-Source: ADFU+vsHgxUBqUsbFUBPr+HWuGEByBckpfNWgjUhheEY7b2FVbvLAEZc9EWV/I+tJEX0uJsTXsK4xs4IJ94T+Uzs7r4=
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr3547593otq.91.1583348698897;
 Wed, 04 Mar 2020 11:04:58 -0800 (PST)
MIME-Version: 1.0
References: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1583340776-27865-1-git-send-email-loic.poulain@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 4 Mar 2020 20:04:46 +0100
Message-ID: <CAG3jFysnDNtG=TmWRC4G3ZKD-TOYT2vgLTyOnxGygRjifmgqPA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] i2c: Add Qualcomm CCI I2C driver
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     wsa@the-dreams.de, vkoul@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        Todor Tomov <todor.tomov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Thanks for submitting this.

I've built & run this series on the SDM845/db845c, and I can confirm
that camera modules (ov7251) probes and comes up correctly.

Tested-by: Robert Foss <robert.foss@linaro.org>

On Wed, 4 Mar 2020 at 17:49, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> This commit adds I2C bus support for the Camera Control Interface
> (CCI) I2C controller found on the Qualcomm SoC processors. This I2C
> controller supports two masters and they are registered to the core.
>
> CCI versions supported in the driver are MSM8916 and MSM8996.

Add SDM845 to the commit comment.

>
> This is a rework of the patch posted by Vinod:
> https://patchwork.kernel.org/patch/10569961/
>
> With additional fixes + most of the comments addressed.
>
> Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: Remove clock rates config from driver (done via assigned clock)
>      Added CCI timeout recovery from Ricardo's patch:
>         https://www.spinics.net/lists/linux-i2c/msg36973.html
>  v3: add sdm845 support
>      rework cci_init function
>
>  drivers/i2c/busses/Kconfig        |  10 +
>  drivers/i2c/busses/Makefile       |   1 +
>  drivers/i2c/busses/i2c-qcom-cci.c | 787 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 798 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-qcom-cci.c
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6a0aa76..807a052 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -894,6 +894,16 @@ config I2C_QCOM_GENI
>           This driver can also be built as a module.  If so, the module
>           will be called i2c-qcom-geni.
>
> +config I2C_QCOM_CCI
> +       tristate "Qualcomm Camera Control Interface"
> +       depends on ARCH_QCOM || COMPILE_TEST
> +       help
> +         If you say yes to this option, support will be included for the
> +         built-in camera control interface on the Qualcomm SoCs.
> +
> +         This driver can also be built as a module.  If so, the module
> +         will be called i2c-qcom-cci.
> +
>  config I2C_QUP
>         tristate "Qualcomm QUP based I2C controller"
>         depends on ARCH_QCOM
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 3ab8aeb..9028b77 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_I2C_PUV3)                += i2c-puv3.o
>  obj-$(CONFIG_I2C_PXA)          += i2c-pxa.o
>  obj-$(CONFIG_I2C_PXA_PCI)      += i2c-pxa-pci.o
>  obj-$(CONFIG_I2C_QCOM_GENI)    += i2c-qcom-geni.o
> +obj-$(CONFIG_I2C_QCOM_CCI)     += i2c-qcom-cci.o
>  obj-$(CONFIG_I2C_QUP)          += i2c-qup.o
>  obj-$(CONFIG_I2C_RIIC)         += i2c-riic.o
>  obj-$(CONFIG_I2C_RK3X)         += i2c-rk3x.o
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> new file mode 100644
> index 0000000..2ef472e
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -0,0 +1,787 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
> +// Copyright (c) 2017-19 Linaro Limited.
> +
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#define CCI_HW_VERSION                         0x0
> +#define CCI_RESET_CMD                          0x004
> +#define CCI_RESET_CMD_MASK                     0x0f73f3f7
> +#define CCI_RESET_CMD_M0_MASK                  0x000003f1
> +#define CCI_RESET_CMD_M1_MASK                  0x0003f001
> +#define CCI_QUEUE_START                                0x008
> +#define CCI_HALT_REQ                           0x034
> +#define CCI_HALT_REQ_I2C_M0_Q0Q1               BIT(0)
> +#define CCI_HALT_REQ_I2C_M1_Q0Q1               BIT(1)
> +
> +#define CCI_I2C_Mm_SCL_CTL(m)                  (0x100 + 0x100 * (m))
> +#define CCI_I2C_Mm_SDA_CTL_0(m)                        (0x104 + 0x100 * (m))
> +#define CCI_I2C_Mm_SDA_CTL_1(m)                        (0x108 + 0x100 * (m))
> +#define CCI_I2C_Mm_SDA_CTL_2(m)                        (0x10c + 0x100 * (m))
> +#define CCI_I2C_Mm_MISC_CTL(m)                 (0x110 + 0x100 * (m))
> +
> +#define CCI_I2C_Mm_READ_DATA(m)                        (0x118 + 0x100 * (m))
> +#define CCI_I2C_Mm_READ_BUF_LEVEL(m)           (0x11c + 0x100 * (m))
> +#define CCI_I2C_Mm_Qn_EXEC_WORD_CNT(m, n)      (0x300 + 0x200 * (m) + 0x100 * (n))
> +#define CCI_I2C_Mm_Qn_CUR_WORD_CNT(m, n)       (0x304 + 0x200 * (m) + 0x100 * (n))
> +#define CCI_I2C_Mm_Qn_CUR_CMD(m, n)            (0x308 + 0x200 * (m) + 0x100 * (n))
> +#define CCI_I2C_Mm_Qn_REPORT_STATUS(m, n)      (0x30c + 0x200 * (m) + 0x100 * (n))
> +#define CCI_I2C_Mm_Qn_LOAD_DATA(m, n)          (0x310 + 0x200 * (m) + 0x100 * (n))
> +
> +#define CCI_IRQ_GLOBAL_CLEAR_CMD               0xc00
> +#define CCI_IRQ_MASK_0                         0xc04
> +#define CCI_IRQ_MASK_0_I2C_M0_RD_DONE          BIT(0)
> +#define CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT                BIT(4)
> +#define CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT                BIT(8)
> +#define CCI_IRQ_MASK_0_I2C_M1_RD_DONE          BIT(12)
> +#define CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT                BIT(16)
> +#define CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT                BIT(20)
> +#define CCI_IRQ_MASK_0_RST_DONE_ACK            BIT(24)
> +#define CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK    BIT(25)
> +#define CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK    BIT(26)
> +#define CCI_IRQ_MASK_0_I2C_M0_ERROR            0x18000ee6
> +#define CCI_IRQ_MASK_0_I2C_M1_ERROR            0x60ee6000
> +#define CCI_IRQ_CLEAR_0                                0xc08
> +#define CCI_IRQ_STATUS_0                       0xc0c
> +#define CCI_IRQ_STATUS_0_I2C_M0_RD_DONE                BIT(0)
> +#define CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT      BIT(4)
> +#define CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT      BIT(8)
> +#define CCI_IRQ_STATUS_0_I2C_M1_RD_DONE                BIT(12)
> +#define CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT      BIT(16)
> +#define CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT      BIT(20)
> +#define CCI_IRQ_STATUS_0_RST_DONE_ACK          BIT(24)
> +#define CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK  BIT(25)
> +#define CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK  BIT(26)
> +#define CCI_IRQ_STATUS_0_I2C_M0_ERROR          0x18000ee6
> +#define CCI_IRQ_STATUS_0_I2C_M1_ERROR          0x60ee6000
> +
> +#define CCI_TIMEOUT    (msecs_to_jiffies(100))
> +#define NUM_MASTERS    2
> +#define NUM_QUEUES     2
> +
> +/* Max number of resources + 1 for a NULL terminator */
> +#define CCI_RES_MAX    6
> +
> +
> +#define CCI_I2C_SET_PARAM      1
> +#define CCI_I2C_REPORT         8
> +#define CCI_I2C_WRITE          9
> +#define CCI_I2C_READ           10
> +
> +#define CCI_I2C_REPORT_IRQ_EN  BIT(8)
> +
> +enum {
> +       I2C_MODE_STANDARD,
> +       I2C_MODE_FAST,
> +       I2C_MODE_FAST_PLUS,
> +};
> +
> +enum cci_i2c_queue_t {
> +       QUEUE_0,
> +       QUEUE_1
> +};
> +
> +struct hw_params {
> +       u16 thigh; /* HIGH period of the SCL clock in clock ticks */
> +       u16 tlow; /* LOW period of the SCL clock */
> +       u16 tsu_sto; /* set-up time for STOP condition */
> +       u16 tsu_sta; /* set-up time for a repeated START condition */
> +       u16 thd_dat; /* data hold time */
> +       u16 thd_sta; /* hold time (repeated) START condition */
> +       u16 tbuf; /* bus free time between a STOP and START condition */
> +       u8 scl_stretch_en;
> +       u16 trdhld;
> +       u16 tsp; /* pulse width of spikes suppressed by the input filter */
> +};
> +
> +struct cci;
> +
> +struct cci_master {
> +       struct i2c_adapter adap;
> +       u16 master;
> +       u8 mode;
> +       int status;
> +       struct completion irq_complete;
> +       struct cci *cci;
> +};
> +
> +struct cci_data {
> +       unsigned int num_masters;
> +       struct i2c_adapter_quirks quirks;
> +       u16 queue_size[NUM_QUEUES];
> +       unsigned long cci_clk_rate;
> +       struct hw_params params[3];
> +};
> +
> +struct cci {
> +       struct device *dev;
> +       void __iomem *base;
> +       unsigned int irq;
> +       const struct cci_data *data;
> +       struct clk_bulk_data *clocks;
> +       int nclocks;
> +       struct cci_master master[NUM_MASTERS];
> +};
> +
> +static irqreturn_t cci_isr(int irq, void *dev)
> +{
> +       struct cci *cci = dev;
> +       u32 val, reset = 0;
> +       int ret = IRQ_NONE;
> +
> +       val = readl(cci->base + CCI_IRQ_STATUS_0);
> +       writel(val, cci->base + CCI_IRQ_CLEAR_0);
> +       writel(0x1, cci->base + CCI_IRQ_GLOBAL_CLEAR_CMD);
> +
> +       if (val & CCI_IRQ_STATUS_0_RST_DONE_ACK) {
> +               complete(&cci->master[0].irq_complete);
> +               if (cci->master[1].master)
> +                       complete(&cci->master[1].irq_complete);
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (val & CCI_IRQ_STATUS_0_I2C_M0_RD_DONE ||
> +                       val & CCI_IRQ_STATUS_0_I2C_M0_Q0_REPORT ||
> +                       val & CCI_IRQ_STATUS_0_I2C_M0_Q1_REPORT) {
> +               cci->master[0].status = 0;
> +               complete(&cci->master[0].irq_complete);
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (val & CCI_IRQ_STATUS_0_I2C_M1_RD_DONE ||
> +                       val & CCI_IRQ_STATUS_0_I2C_M1_Q0_REPORT ||
> +                       val & CCI_IRQ_STATUS_0_I2C_M1_Q1_REPORT) {
> +               cci->master[1].status = 0;
> +               complete(&cci->master[1].irq_complete);
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_Q0Q1_HALT_ACK)) {
> +               reset = CCI_RESET_CMD_M0_MASK;
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_Q0Q1_HALT_ACK)) {
> +               reset = CCI_RESET_CMD_M1_MASK;
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (unlikely(reset))
> +               writel(reset, cci->base + CCI_RESET_CMD);
> +
> +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M0_ERROR)) {
> +               dev_err_ratelimited(cci->dev, "Master 0 error 0x%08x\n", val);
> +               cci->master[0].status = -EIO;
> +               writel(CCI_HALT_REQ_I2C_M0_Q0Q1, cci->base + CCI_HALT_REQ);
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       if (unlikely(val & CCI_IRQ_STATUS_0_I2C_M1_ERROR)) {
> +               dev_err_ratelimited(cci->dev, "Master 1 error 0x%08x\n", val);
> +               cci->master[1].status = -EIO;
> +               writel(CCI_HALT_REQ_I2C_M1_Q0Q1, cci->base + CCI_HALT_REQ);
> +               ret = IRQ_HANDLED;
> +       }
> +
> +       return ret;
> +}
> +
> +static int cci_halt(struct cci *cci, u8 master_num)
> +{
> +       struct cci_master *master;
> +       u32 val;
> +
> +       if (master_num > 1) {
> +               dev_err(cci->dev, "Unsupported master idx (%u)\n", master_num);
> +               return -EINVAL;
> +       }
> +
> +       val = BIT(master_num);
> +       master = &cci->master[master_num];
> +
> +       reinit_completion(&master->irq_complete);
> +       writel(val, cci->base + CCI_HALT_REQ);
> +
> +       if (!wait_for_completion_timeout(&master->irq_complete, CCI_TIMEOUT)) {
> +               dev_err(cci->dev, "CCI halt timeout\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
> +static int cci_reset(struct cci *cci)
> +{
> +       /*
> +        * we reset the whole controller, here and for implicity use
> +        * master[0].xxx for waiting on it.
> +        */
> +       reinit_completion(&cci->master[0].irq_complete);
> +       writel(CCI_RESET_CMD_MASK, cci->base + CCI_RESET_CMD);
> +
> +       if (!wait_for_completion_timeout(&cci->master[0].irq_complete,
> +                                        CCI_TIMEOUT)) {
> +               dev_err(cci->dev, "CCI reset timeout\n");
> +               return -ETIMEDOUT;
> +       }
> +
> +       return 0;
> +}
> +
> +static int cci_init(struct cci *cci)
> +{
> +       u32 val = CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
> +                       CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
> +                       CCI_IRQ_MASK_0_I2C_M0_Q1_REPORT |
> +                       CCI_IRQ_MASK_0_I2C_M1_RD_DONE |
> +                       CCI_IRQ_MASK_0_I2C_M1_Q0_REPORT |
> +                       CCI_IRQ_MASK_0_I2C_M1_Q1_REPORT |
> +                       CCI_IRQ_MASK_0_RST_DONE_ACK |
> +                       CCI_IRQ_MASK_0_I2C_M0_Q0Q1_HALT_ACK |
> +                       CCI_IRQ_MASK_0_I2C_M1_Q0Q1_HALT_ACK |
> +                       CCI_IRQ_MASK_0_I2C_M0_ERROR |
> +                       CCI_IRQ_MASK_0_I2C_M1_ERROR;
> +       int i;
> +
> +       writel(val, cci->base + CCI_IRQ_MASK_0);
> +
> +       for (i = 0; i < cci->data->num_masters; i++) {
> +               int mode = cci->master[i].mode;
> +               const struct hw_params *hw = &cci->data->params[mode];
> +
> +               val = hw->thigh << 16 | hw->tlow;
> +               writel(val, cci->base + CCI_I2C_Mm_SCL_CTL(i));;
> +
> +               val = hw->tsu_sto << 16 | hw->tsu_sta;
> +               writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_0(i));
> +
> +               val = hw->thd_dat << 16 | hw->thd_sta;
> +               writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_1(i));
> +
> +               val = hw->tbuf;
> +               writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_2(i));
> +
> +               val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
> +               writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
> +       }
> +
> +       return 0;
> +}
> +
> +static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
> +{
> +       u32 val;
> +       int ret;
> +
> +       val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_EXEC_WORD_CNT(master, queue));
> +
> +       reinit_completion(&cci->master[master].irq_complete);
> +       val = BIT(master * 2 + queue);
> +       writel(val, cci->base + CCI_QUEUE_START);
> +
> +       if (!wait_for_completion_timeout(&cci->master[master].irq_complete,
> +                                        CCI_TIMEOUT)) {
> +               dev_err(cci->dev, "master %d queue %d timeout\n",
> +                       master, queue);
> +               cci_reset(cci);
> +               cci_init(cci);
> +               return -ETIMEDOUT;
> +       }
> +
> +       ret = cci->master[master].status;
> +       if (ret < 0)
> +               dev_err(cci->dev, "master %d queue %d error %d\n",
> +                       master, queue, ret);
> +
> +       return ret;
> +}
> +
> +static int cci_validate_queue(struct cci *cci, u8 master, u8 queue)
> +{
> +       u32 val;
> +
> +       val = readl(cci->base + CCI_I2C_Mm_Qn_CUR_WORD_CNT(master, queue));
> +       if (val == cci->data->queue_size[queue])
> +               return -EINVAL;
> +
> +       if (!val)
> +               return 0;
> +
> +       val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       return cci_run_queue(cci, master, queue);
> +}
> +
> +static int cci_i2c_read(struct cci *cci, u16 master,
> +                       u16 addr, u8 *buf, u16 len)
> +{
> +       u32 val, words_read, words_exp;
> +       u8 queue = QUEUE_1;
> +       int i, index = 0, ret;
> +       bool first = true;
> +
> +       /*
> +        * Call validate queue to make sure queue is empty before starting.
> +        * This is to avoid overflow / underflow of queue.
> +        */
> +       ret = cci_validate_queue(cci, master, queue);
> +       if (ret < 0)
> +               return ret;
> +
> +       val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       val = CCI_I2C_READ | len << 4;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       ret = cci_run_queue(cci, master, queue);
> +       if (ret < 0)
> +               return ret;
> +
> +       words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
> +       words_exp = len / 4 + 1;
> +       if (words_read != words_exp) {
> +               dev_err(cci->dev, "words read = %d, words expected = %d\n",
> +                       words_read, words_exp);
> +               return -EIO;
> +       }
> +
> +       do {
> +               val = readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
> +
> +               for (i = 0; i < 4 && index < len; i++) {
> +                       if (first) {
> +                               first = false;
> +                               continue;
> +                       }
> +                       buf[index++] = (val >> (i * 8)) & 0xff;
> +               }
> +       } while (--words_read);
> +
> +       return 0;
> +}
> +
> +static int cci_i2c_write(struct cci *cci, u16 master,
> +                        u16 addr, u8 *buf, u16 len)
> +{
> +       u8 queue = QUEUE_0;
> +       u8 load[12] = { 0 };
> +       int i = 0, j, ret;
> +       u32 val;
> +
> +       /*
> +        * Call validate queue to make sure queue is empty before starting.
> +        * This is to avoid overflow / underflow of queue.
> +        */
> +       ret = cci_validate_queue(cci, master, queue);
> +       if (ret < 0)
> +               return ret;
> +
> +       val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       load[i++] = CCI_I2C_WRITE | len << 4;
> +
> +       for (j = 0; j < len; j++)
> +               load[i++] = buf[j];
> +
> +       for (j = 0; j < i; j += 4) {
> +               val = load[j];
> +               val |= load[j + 1] << 8;
> +               val |= load[j + 2] << 16;
> +               val |= load[j + 3] << 24;
> +               writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +       }
> +
> +       val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
> +       writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> +
> +       return cci_run_queue(cci, master, queue);
> +}
> +
> +static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
> +{
> +       struct cci_master *cci_master = i2c_get_adapdata(adap);
> +       struct cci *cci = cci_master->cci;
> +       int i, ret;
> +
> +       ret = pm_runtime_get_sync(cci->dev);
> +       if (ret < 0)
> +               goto err;
> +
> +       for (i = 0; i < num; i++) {
> +               if (msgs[i].flags & I2C_M_RD)
> +                       ret = cci_i2c_read(cci, cci_master->master,
> +                                          msgs[i].addr, msgs[i].buf,
> +                                          msgs[i].len);
> +               else
> +                       ret = cci_i2c_write(cci, cci_master->master,
> +                                           msgs[i].addr, msgs[i].buf,
> +                                           msgs[i].len);
> +
> +               if (ret < 0) {
> +                       dev_err(cci->dev, "cci i2c xfer error %d", ret);
> +                       break;
> +               }
> +       }
> +
> +       if (!ret)
> +               ret = num;
> +
> +err:
> +       pm_runtime_mark_last_busy(cci->dev);
> +       pm_runtime_put_autosuspend(cci->dev);
> +
> +       return ret;
> +}
> +
> +static u32 cci_func(struct i2c_adapter *adap)
> +{
> +       return I2C_FUNC_I2C;
> +}
> +
> +static const struct i2c_algorithm cci_algo = {
> +       .master_xfer    = cci_xfer,
> +       .functionality  = cci_func,
> +};
> +
> +static int cci_enable_clocks(struct cci *cci)
> +{
> +       int ret;
> +
> +       ret = clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
> +       if (ret < 0)
> +               dev_err(cci->dev, "Bulk clock prepare failed: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static void cci_disable_clocks(struct cci *cci)
> +{
> +       clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
> +}
> +
> +#ifdef CONFIG_PM
> +static int cci_suspend_runtime(struct device *dev)
> +{
> +       struct cci *cci = dev_get_drvdata(dev);
> +
> +       dev_dbg(dev, "Supend invoked\n");
> +       cci_disable_clocks(cci);
> +       return 0;
> +}
> +
> +static int cci_resume_runtime(struct device *dev)
> +{
> +       struct cci *cci = dev_get_drvdata(dev);
> +       int ret;
> +
> +       dev_dbg(dev, "Resume invoked\n");
> +       ret = cci_enable_clocks(cci);
> +       if (ret)
> +               return ret;
> +
> +       cci_init(cci);
> +       return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int cci_suspend(struct device *dev)
> +{
> +       if (!pm_runtime_suspended(dev))
> +               return cci_suspend_runtime(dev);
> +
> +       return 0;
> +}
> +
> +static int cci_resume(struct device *dev)
> +{
> +       cci_resume_runtime(dev);
> +       pm_runtime_mark_last_busy(dev);
> +       pm_request_autosuspend(dev);
> +
> +       return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops qcom_cci_pm = {
> +       SET_SYSTEM_SLEEP_PM_OPS(cci_suspend, cci_resume)
> +       SET_RUNTIME_PM_OPS(cci_suspend_runtime, cci_resume_runtime, NULL)
> +};
> +
> +static int cci_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *of_node = NULL;
> +       unsigned long cci_clk_rate = 0;
> +       struct resource *r;
> +       struct cci *cci;
> +       int ret = 0, i;
> +       u32 val;
> +
> +       cci = devm_kzalloc(dev, sizeof(*cci), GFP_KERNEL);
> +       if (!cci)
> +               return -ENOMEM;
> +
> +       cci->dev = dev;
> +       platform_set_drvdata(pdev, cci);
> +       cci->data = device_get_match_data(&pdev->dev);
> +       if (!cci->data) {
> +               dev_err(&pdev->dev, "Driver data is null, abort\n");
> +               return -EIO;
> +       }
> +
> +       for (i = 0; i < cci->data->num_masters; i++) {
> +               cci->master[i].adap.quirks = &cci->data->quirks;
> +               cci->master[i].adap.algo = &cci_algo;
> +               cci->master[i].adap.dev.parent = cci->dev;
> +               cci->master[i].master = i;
> +               cci->master[i].cci = cci;
> +
> +               i2c_set_adapdata(&cci->master[i].adap, &cci->master[i]);
> +               snprintf(cci->master[i].adap.name,
> +                        sizeof(cci->master[i].adap.name),
> +                        "Qualcomm Camera Control Interface: %d", i);
> +
> +               /* find the child node for i2c-bus as we are on cci node */
> +               of_node = of_get_next_available_child(dev->of_node, of_node);
> +               if (!of_node) {
> +                       dev_err(dev, "Missing i2c-bus@%d child node\n", i);
> +                       return -EINVAL;
> +               }
> +               cci->master[i].adap.dev.of_node = of_node;
> +
> +               cci->master[i].mode = I2C_MODE_STANDARD;
> +               ret = of_property_read_u32(of_node, "clock-frequency", &val);
> +               if (!ret) {
> +                       if (val == 400000)
> +                               cci->master[i].mode = I2C_MODE_FAST;
> +                       else if (val == 1000000)
> +                               cci->master[i].mode = I2C_MODE_FAST_PLUS;
> +               }
> +
> +               init_completion(&cci->master[i].irq_complete);
> +       }
> +
> +       /* Memory */
> +
> +       r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       cci->base = devm_ioremap_resource(dev, r);
> +       if (IS_ERR(cci->base))
> +               return PTR_ERR(cci->base);
> +
> +       /* Interrupt */
> +
> +       ret = platform_get_irq(pdev, 0);
> +       if (ret < 0) {
> +               dev_err(dev, "missing IRQ: %d\n", ret);
> +               return ret;
> +       }
> +       cci->irq = ret;
> +
> +       ret = devm_request_irq(dev, cci->irq, cci_isr,
> +                              IRQF_TRIGGER_RISING, dev_name(dev), cci);
> +       if (ret < 0) {
> +               dev_err(dev, "request_irq failed, ret: %d\n", ret);
> +               return ret;
> +       }
> +
> +       disable_irq(cci->irq);
> +
> +       /* Clocks */
> +
> +       ret = devm_clk_bulk_get_all(dev, &cci->clocks);
> +       if (ret < 1) {
> +               dev_err(dev, "failed to get clocks %d\n", ret);
> +               return ret;
> +       }
> +       cci->nclocks = ret;
> +
> +       /* Retrieve CCI clock rate */
> +       for (i = 0; i < cci->nclocks; i++) {
> +               if (!strncmp(cci->clocks[i].id, "cci", 4)) {
> +                       cci_clk_rate = clk_get_rate(cci->clocks[i].clk);
> +                       break;
> +               }
> +       }
> +
> +       if (cci_clk_rate != cci->data->cci_clk_rate) {
> +               /* cci clock set by the bootloader or via assigned clock rate
> +                * in DT.
> +                */
> +               dev_warn(dev, "Found %lu cci clk rate while %lu was expected\n",
> +                        cci_clk_rate, cci->data->cci_clk_rate);
> +       }
> +
> +       ret = cci_enable_clocks(cci);
> +       if (ret < 0)
> +               return ret;
> +
> +       val = readl_relaxed(cci->base + CCI_HW_VERSION);
> +       dev_info(dev, "%s: CCI HW version = 0x%08x", __func__, val);
> +
> +       enable_irq(cci->irq);
> +
> +       ret = cci_reset(cci);
> +       if (ret < 0)
> +               goto error;
> +
> +       ret = cci_init(cci);
> +       if (ret < 0)
> +               goto error;
> +
> +       for (i = 0; i < cci->data->num_masters; i++) {
> +               ret = i2c_add_adapter(&cci->master[i].adap);
> +               if (ret < 0)
> +                       goto error_i2c;
> +       }
> +
> +       pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> +       pm_runtime_use_autosuspend(dev);
> +       pm_runtime_set_active(dev);
> +       pm_runtime_enable(dev);
> +
> +       return 0;
> +
> +error_i2c:
> +       for (; i >= 0; i--)
> +               i2c_del_adapter(&cci->master[i].adap);
> +error:
> +       disable_irq(cci->irq);
> +       cci_disable_clocks(cci);
> +
> +       return ret;
> +}
> +
> +static int cci_remove(struct platform_device *pdev)
> +{
> +       struct cci *cci = platform_get_drvdata(pdev);
> +       int i;
> +
> +       for (i = 0; i < cci->data->num_masters; i++) {
> +               i2c_del_adapter(&cci->master[i].adap);
> +               cci_halt(cci, i);
> +       }
> +
> +       disable_irq(cci->irq);
> +       pm_runtime_disable(&pdev->dev);
> +       pm_runtime_set_suspended(&pdev->dev);
> +
> +       return 0;
> +}
> +
> +static const struct cci_data cci_v1_data = {
> +       .num_masters = 1,
> +       .queue_size = { 64, 16 },
> +       .quirks = {
> +               .max_write_len = 10,
> +               .max_read_len = 12,
> +       },
> +       .cci_clk_rate =  19200000,
> +       .params[I2C_MODE_STANDARD] = {
> +               .thigh = 78,
> +               .tlow = 114,
> +               .tsu_sto = 28,
> +               .tsu_sta = 28,
> +               .thd_dat = 10,
> +               .thd_sta = 77,
> +               .tbuf = 118,
> +               .scl_stretch_en = 0,
> +               .trdhld = 6,
> +               .tsp = 1
> +       },
> +       .params[I2C_MODE_FAST] = {
> +               .thigh = 20,
> +               .tlow = 28,
> +               .tsu_sto = 21,
> +               .tsu_sta = 21,
> +               .thd_dat = 13,
> +               .thd_sta = 18,
> +               .tbuf = 32,
> +               .scl_stretch_en = 0,
> +               .trdhld = 6,
> +               .tsp = 3
> +       },
> +};
> +
> +static const struct cci_data cci_v2_data = {
> +       .num_masters = 2,
> +       .queue_size = { 64, 16 },
> +       .quirks = {
> +               .max_write_len = 11,
> +               .max_read_len = 12,
> +       },
> +       .cci_clk_rate =  37500000,
> +       .params[I2C_MODE_STANDARD] = {
> +               .thigh = 201,
> +               .tlow = 174,
> +               .tsu_sto = 204,
> +               .tsu_sta = 231,
> +               .thd_dat = 22,
> +               .thd_sta = 162,
> +               .tbuf = 227,
> +               .scl_stretch_en = 0,
> +               .trdhld = 6,
> +               .tsp = 3
> +       },
> +       .params[I2C_MODE_FAST] = {
> +               .thigh = 38,
> +               .tlow = 56,
> +               .tsu_sto = 40,
> +               .tsu_sta = 40,
> +               .thd_dat = 22,
> +               .thd_sta = 35,
> +               .tbuf = 62,
> +               .scl_stretch_en = 0,
> +               .trdhld = 6,
> +               .tsp = 3
> +       },
> +       .params[I2C_MODE_FAST_PLUS] = {
> +               .thigh = 16,
> +               .tlow = 22,
> +               .tsu_sto = 17,
> +               .tsu_sta = 18,
> +               .thd_dat = 16,
> +               .thd_sta = 15,
> +               .tbuf = 24,
> +               .scl_stretch_en = 0,
> +               .trdhld = 3,
> +               .tsp = 3
> +       },
> +};
> +
> +static const struct of_device_id cci_dt_match[] = {
> +       { .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
> +       { .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
> +       { .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
> +       {}
> +};
> +MODULE_DEVICE_TABLE(of, cci_dt_match);
> +
> +static struct platform_driver qcom_cci_driver = {
> +       .probe  = cci_probe,
> +       .remove = cci_remove,
> +       .driver = {
> +               .name = "i2c-qcom-cci",
> +               .of_match_table = cci_dt_match,
> +               .pm = &qcom_cci_pm,
> +       },
> +};
> +
> +module_platform_driver(qcom_cci_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Camera Control Interface driver");
> +MODULE_AUTHOR("Todor Tomov <todor.tomov@linaro.org>");
> +MODULE_AUTHOR("Loic Poulain <loic.poulain@linaro.org>");
> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4
>
