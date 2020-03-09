Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA8C17E372
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Mar 2020 16:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgCIPVj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Mar 2020 11:21:39 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37066 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgCIPVj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Mar 2020 11:21:39 -0400
Received: by mail-ed1-f67.google.com with SMTP id b23so4419872edx.4
        for <linux-i2c@vger.kernel.org>; Mon, 09 Mar 2020 08:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DymkJDNxmyTxtoiGEqjpHFvJ4mQXpF6UsK67wsS0amE=;
        b=REswhAgCYJ1Utem5Bv8IBPDFoNDuud7b/v6DhgRYix/m3DVCBzoiqmQmWcXVeWVOcX
         mc+cHXUt/g7J+flrt9CFwLaapHiQjevwCe790iEU9IKdz9VeIDZEQgfaVZFzsiJqTVQb
         jJuLq3pP2RMF6RsQ0fC2QKzbXw3mtFTTwStQW90Yta7mgWGwguoSYf/0N4ZM8wegfAn4
         0W5BQByXnb+ZS6ixVPvHL1M//ITBWBj9bg+f6Ggfk6op8/Do1w6r0Fo5pa+Ft92shAyq
         v8ecYHXfwh/aSar2NZezeQTts0In6ZM0syQ9eBfBOj6fhZ4bJn8FyuhZO+LJetbiefNX
         Ie3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DymkJDNxmyTxtoiGEqjpHFvJ4mQXpF6UsK67wsS0amE=;
        b=N/1E52xqlQ5v4tZDg1sUyG9lvr+oQ/b+vrU1qwpEm1WhY5phA5xzwlFAMqw+F2eCVB
         4pYCOIj7hXPLGIQrcmcTLvhbbMaVw13bJTi/GDo2BvPu8ydajxq/NRT5SP65/V0xZ+zK
         djanSgQRL6ccv6M3IKvhJI1y/cUHl4I+9eIMQfBzftEWV0ay4oTKmPcUauJBp+uR6Kj7
         oMLRVa2NE7ian3dKNY7pR+4CqxM2B+tnGAk5KdRosRssCuXqDULFdcKvqKcVBMsNa84X
         y3f4RZpG0EOq306cYiivkNd8cXCkN3Wg0/VrxO8PJ5crkFhsq9hoEHZemQcjvBHDiEs0
         YOTA==
X-Gm-Message-State: ANhLgQ1k0/5jzdHwJDj0fW1BhelUGT+8ohUdW0pA4sCZBzC0MlDXYWCm
        BTP7r/7x92NBX+oEKBTWbuLtjAzlgAINSzPKIHHViQ==
X-Google-Smtp-Source: ADFU+vuKSrCHIn+SHX2Zh9VET3vi/SsMHruKpZgFM/H0ex3JYrTYcyJsxVPgtl60JDWJmLt0x3V1EXXBkhQFPUWV/eQ=
X-Received: by 2002:a17:906:5ad7:: with SMTP id x23mr15666761ejs.160.1583767296343;
 Mon, 09 Mar 2020 08:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <1583515184-9636-1-git-send-email-loic.poulain@linaro.org> <20200307020513.GA1094083@builder>
In-Reply-To: <20200307020513.GA1094083@builder>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 9 Mar 2020 16:25:02 +0100
Message-ID: <CAMZdPi-O5_RysdvfgVu4dBmF_8jn9sCfU1jzAk3n-WW55ePokA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] i2c: Add Qualcomm CCI I2C driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     wsa@the-dreams.de, Vinod Koul <vkoul@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Todor Tomov <todor.tomov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bjorn,

On Sat, 7 Mar 2020 at 03:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> On Fri 06 Mar 09:19 PST 2020, Loic Poulain wrote:
>
> > This commit adds I2C bus support for the Camera Control Interface
> > (CCI) I2C controller found on the Qualcomm SoC processors. This I2C
> > controller supports two masters and they are registered to the core.
> >
> > CCI versions supported in the driver are MSM8916 and MSM8996.
>
> +SDM845
>
> >
> > This is a rework of the patch posted by Vinod:
> > https://patchwork.kernel.org/patch/10569961/
> >
> > With additional fixes + most of the comments addressed.
> >
> > Signed-off-by: Todor Tomov <todor.tomov@linaro.org>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > Tested-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >   v2: Remove clock rates config from driver (done via assigned clock)
> >      Added CCI timeout recovery from Ricardo's patch:
> >         https://www.spinics.net/lists/linux-i2c/msg36973.html
> >  v3: add sdm845 support
> >      rework cci_init function
> >  v4: fix checkpatch issue (double semi-colon)
> >
> >  drivers/i2c/busses/Kconfig        |  10 +
> >  drivers/i2c/busses/Makefile       |   1 +
> >  drivers/i2c/busses/i2c-qcom-cci.c | 787 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 798 insertions(+)
> >  create mode 100644 drivers/i2c/busses/i2c-qcom-cci.c
> >
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index 6a0aa76..807a052 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -894,6 +894,16 @@ config I2C_QCOM_GENI
> >         This driver can also be built as a module.  If so, the module
> >         will be called i2c-qcom-geni.
> >
> > +config I2C_QCOM_CCI
>
> Please move this above GENI, to keep sort order.

ack

>
> > +     tristate "Qualcomm Camera Control Interface"
> > +     depends on ARCH_QCOM || COMPILE_TEST
> > +     help
> > +       If you say yes to this option, support will be included for the
> > +       built-in camera control interface on the Qualcomm SoCs.
> > +
> > +       This driver can also be built as a module.  If so, the module
> > +       will be called i2c-qcom-cci.
> > +
> >  config I2C_QUP
> >       tristate "Qualcomm QUP based I2C controller"
> >       depends on ARCH_QCOM
> > diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> > index 3ab8aeb..9028b77 100644
> > --- a/drivers/i2c/busses/Makefile
> > +++ b/drivers/i2c/busses/Makefile
> > @@ -92,6 +92,7 @@ obj-$(CONFIG_I2C_PUV3)              += i2c-puv3.o
> >  obj-$(CONFIG_I2C_PXA)                += i2c-pxa.o
> >  obj-$(CONFIG_I2C_PXA_PCI)    += i2c-pxa-pci.o
> >  obj-$(CONFIG_I2C_QCOM_GENI)  += i2c-qcom-geni.o
> > +obj-$(CONFIG_I2C_QCOM_CCI)   += i2c-qcom-cci.o
>
> Sort order.

ack

>
> >  obj-$(CONFIG_I2C_QUP)                += i2c-qup.o
> >  obj-$(CONFIG_I2C_RIIC)               += i2c-riic.o
> >  obj-$(CONFIG_I2C_RK3X)               += i2c-rk3x.o
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> [..]
> > +/* Max number of resources + 1 for a NULL terminator */
> > +#define CCI_RES_MAX  6
> > +
> > +
>
> Extra newline?
>
> > +#define CCI_I2C_SET_PARAM    1
> > +#define CCI_I2C_REPORT               8
> > +#define CCI_I2C_WRITE                9
> > +#define CCI_I2C_READ         10
> [..]
> > +static int cci_i2c_read(struct cci *cci, u16 master,
> > +                     u16 addr, u8 *buf, u16 len)
> > +{
> > +     u32 val, words_read, words_exp;
> > +     u8 queue = QUEUE_1;
> > +     int i, index = 0, ret;
> > +     bool first = true;
> > +
> > +     /*
> > +      * Call validate queue to make sure queue is empty before starting.
> > +      * This is to avoid overflow / underflow of queue.
> > +      */
> > +     ret = cci_validate_queue(cci, master, queue);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
> > +     writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +
> > +     val = CCI_I2C_READ | len << 4;
> > +     writel(val, cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, queue));
> > +
> > +     ret = cci_run_queue(cci, master, queue);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     words_read = readl(cci->base + CCI_I2C_Mm_READ_BUF_LEVEL(master));
> > +     words_exp = len / 4 + 1;
> > +     if (words_read != words_exp) {
> > +             dev_err(cci->dev, "words read = %d, words expected = %d\n",
> > +                     words_read, words_exp);
> > +             return -EIO;
> > +     }
> > +
> > +     do {
> > +             val = readl(cci->base + CCI_I2C_Mm_READ_DATA(master));
> > +
> > +             for (i = 0; i < 4 && index < len; i++) {
> > +                     if (first) {
>
> So lower 8 bits of the first word read should always be discarded? Do we
> know why? Can we have a comment describing this behavior?

Yes, the first byte contains the SID (slave ID), I'll add a comment.


> > +             cci->master[i].master = i;
> > +             cci->master[i].cci = cci;
> > +
> > +             i2c_set_adapdata(&cci->master[i].adap, &cci->master[i]);
> > +             snprintf(cci->master[i].adap.name,
> > +                      sizeof(cci->master[i].adap.name),
> > +                      "Qualcomm Camera Control Interface: %d", i);
> > +
> > +             /* find the child node for i2c-bus as we are on cci node */
> > +             of_node = of_get_next_available_child(dev->of_node, of_node);
> > +             if (!of_node) {
> > +                     dev_err(dev, "Missing i2c-bus@%d child node\n", i);
> > +                     return -EINVAL;
> > +             }
> > +             cci->master[i].adap.dev.of_node = of_node;
>
> Won't this break if the two masters are provided in reverse order in the
> DT?

Indeed, I'm going to rework that.

> > +     /* Interrupt */
> > +
> > +     ret = platform_get_irq(pdev, 0);
> > +     if (ret < 0) {
> > +             dev_err(dev, "missing IRQ: %d\n", ret);
> > +             return ret;
> > +     }
> > +     cci->irq = ret;
> > +
> > +     ret = devm_request_irq(dev, cci->irq, cci_isr,
> > +                            IRQF_TRIGGER_RISING, dev_name(dev), cci);
>
> Wouldn't it be better to request the irq after the clocks are enabled?
> Presumably it won't fire here, but if it does then the isr might access
> unclocked registers?
>
> At least you shouldn't have to temporarily disable the irqs until later
> in the probe?

Yes we can move the request at a later time in the probe.

Regards,
Loic
