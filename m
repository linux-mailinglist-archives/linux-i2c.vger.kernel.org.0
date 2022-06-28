Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63B255E7C1
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 18:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344073AbiF1Nt6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 09:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234461AbiF1Nt5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 09:49:57 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AF0F17;
        Tue, 28 Jun 2022 06:49:56 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id p8so17245479oip.8;
        Tue, 28 Jun 2022 06:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I+gjKmyeMmO6YeGCF3EM4Xdj+F0MZxLNKevE8aElvRU=;
        b=FJgKAE8c6uSeeARp1Fpu88pBuszG2TFqjbgHbe03DaAslxZYKxGYzDhzj+BYlJcKdZ
         hyKn0PoHzfNbjti4YQEeeasjWCHwmGXFR+MMZOgNmCaYKgrQH8szXOysZt10BNzPARlW
         UGHbhvqfcQ/FnPrFM56ILVRAQjPm5Brjp/0hnXy7vX+AxtgWhzFzuDe9quyheMYqhivs
         4jK7+rMos34Yiq1PHCkTyJh05pJnK/4JZLrFna/3vyAAqp3EySTpJKCWw812oGKeQZBl
         X0aqbCMqRCdTS/5ChhXqls/RETT/hFz/sZQeQNjvt/3wbR0GX3Epy8Uh1ie/OzhEosY/
         VwsQ==
X-Gm-Message-State: AJIora/2Xo1I+ggPqYwwOGjQvi+pV+atjhs05qNphdNGgIZKzcyoe/Az
        4NsTV1Akeb4Epugst6orBOgxaxKJAR0Ggw==
X-Google-Smtp-Source: AGRyM1vDdG6GpDz1y/jaL1ail6GcLmYSipVcGftgtu3vt9vLVn1dH9GpkLmaE18ex8xl8f0aLH1UmA==
X-Received: by 2002:a05:6808:e88:b0:335:256f:1524 with SMTP id k8-20020a0568080e8800b00335256f1524mr11005182oil.82.1656424195461;
        Tue, 28 Jun 2022 06:49:55 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id n17-20020a9d7111000000b0060b069325f2sm35146otj.63.2022.06.28.06.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 06:49:55 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id t26-20020a9d775a000000b006168f7563daso9780776otl.2;
        Tue, 28 Jun 2022 06:49:55 -0700 (PDT)
X-Received: by 2002:a25:3288:0:b0:66c:8a91:74bb with SMTP id
 y130-20020a253288000000b0066c8a9174bbmr18247145yby.89.1656423751751; Tue, 28
 Jun 2022 06:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220624101736.27217-1-phil.edworthy@renesas.com> <20220624101736.27217-3-phil.edworthy@renesas.com>
In-Reply-To: <20220624101736.27217-3-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jun 2022 15:42:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX6azMef1PtUh79TAsGnG2op+dzF8Ykqif6u6L_eyKkQQ@mail.gmail.com>
Message-ID: <CAMuHMdX6azMef1PtUh79TAsGnG2op+dzF8Ykqif6u6L_eyKkQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: Add Renesas RZ/V2M controller
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jie Deng <jie.deng@intel.com>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Phil,

On Fri, Jun 24, 2022 at 12:18 PM Phil Edworthy
<phil.edworthy@renesas.com> wrote:
> Yet another i2c controller from Renesas that is found on the RZ/V2M
> (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-rzv2m.c

> +enum bcr_index {
> +       RZV2M_I2C_100K = 0,
> +       RZV2M_I2C_400K,
> +};
> +
> +struct bitrate_config {
> +       unsigned int percent_low;
> +       unsigned int min_hold_time_ns;
> +};
> +
> +static const struct bitrate_config bitrate_configs[] = {
> +       {47, 3450},
> +       {52, 900},

These are indexed by bcr_index, so perhaps

    .[RZV2M_I2C_100K] = { 47, 3450 },
    ...

?

> +};

> +/* Calculate IICB0WL and IICB0WH */
> +static int rzv2m_i2c_clock_calculate(struct device *dev,
> +                                    struct rzv2m_i2c_priv *priv)
> +{
> +       const struct bitrate_config *config;
> +       unsigned int hold_time_ns;
> +       unsigned int total_pclks;
> +       unsigned int trf_pclks;
> +       unsigned long pclk_hz;
> +       struct i2c_timings t;
> +       u32 trf_ns;
> +
> +       i2c_parse_fw_timings(dev, &t, true);
> +
> +       pclk_hz = clk_get_rate(priv->clk);
> +       total_pclks = pclk_hz / t.bus_freq_hz;
> +
> +       trf_ns = t.scl_rise_ns + t.scl_fall_ns;
> +       trf_pclks = (u64)pclk_hz * trf_ns / NSEC_PER_SEC;

This is an open-coded 64-by-ul division, which may cause link failures
when compile-tested on 32-bit. Please use mul_u64_u32_div() instead.

> +
> +       /* Config setting */
> +       switch (t.bus_freq_hz) {
> +       case I2C_MAX_FAST_MODE_FREQ:
> +               priv->bus_mode = RZV2M_I2C_400K;
> +               break;
> +       case I2C_MAX_STANDARD_MODE_FREQ:
> +               priv->bus_mode = RZV2M_I2C_100K;
> +               break;
> +       default:
> +               dev_err(dev, "transfer speed is invalid\n");
> +               return -EINVAL;
> +       }
> +       config = &bitrate_configs[priv->bus_mode];
> +
> +       /* IICB0WL = (percent_low / Transfer clock) x PCLK */
> +       priv->iicb0wl = total_pclks * config->percent_low / 100;
> +       if (priv->iicb0wl > 0x3ff)
> +               return -EINVAL;
> +
> +       /* IICB0WH = ((percent_high / Transfer clock) x PCLK) - (tR + tF) */
> +       priv->iicb0wh = total_pclks - priv->iicb0wl - trf_pclks;
> +       if (priv->iicb0wh > 0x3ff)
> +               return -EINVAL;
> +
> +       /*
> +        * Data hold time must be less than 0.9us in fast mode and
> +        * 3.45us in standard mode.
> +        * Data hold time = IICB0WL[9:2] / PCLK
> +        */
> +       hold_time_ns = (u64)(priv->iicb0wl >> 2) * NSEC_PER_SEC / pclk_hz;

div64_ul()

> +       if (hold_time_ns > config->min_hold_time_ns) {
> +               dev_err(dev, "data hold time %dns is over %dns\n",
> +                       hold_time_ns, config->min_hold_time_ns);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}

> +static int rzv2m_i2c_write_with_ACK(struct rzv2m_i2c_priv *priv, u32 data)

rzv2m_i2c_write_with_ack

> +{
> +       unsigned long time_left;
> +
> +       reinit_completion(&priv->msg_tia_done);
> +
> +       writel(data, priv->base + IICB0DAT);
> +
> +       time_left = wait_for_completion_timeout(&priv->msg_tia_done,
> +                                               priv->adap.timeout);
> +       if (!time_left)
> +               return -ETIMEDOUT;
> +
> +       /* Confirm ACK */
> +       if ((readl(priv->base + IICB0STR0) & IICB0SSAC) != IICB0SSAC)
> +               return -ENXIO;
> +
> +       return 0;
> +}
> +
> +static int rzv2m_i2c_read_with_ACK(struct rzv2m_i2c_priv *priv, u8 *data,

rzv2m_i2c_read_with_ack

> +                                  bool last)
> +{
> +       unsigned long time_left;
> +       u32 data_tmp;
> +
> +       reinit_completion(&priv->msg_tia_done);
> +
> +       /* Interrupt request timing : 8th clock */
> +       bit_clrl(priv->base + IICB0CTL0, IICB0SLWT);
> +
> +       /* Exit the wait state */
> +       writel(IICB0WRET, priv->base + IICB0TRG);
> +
> +       /* Wait for transaction */
> +       time_left = wait_for_completion_timeout(&priv->msg_tia_done,
> +                                               priv->adap.timeout);
> +       if (!time_left)
> +               return -ETIMEDOUT;
> +
> +       if (!last) {
> +               /* Read data */
> +               data_tmp = readl(priv->base + IICB0DAT);
> +       } else {
> +               /* Disable ACK */
> +               bit_clrl(priv->base + IICB0CTL0, IICB0SLAC);
> +
> +               /* Read data*/
> +               data_tmp = readl(priv->base + IICB0DAT);
> +
> +               /* Interrupt request timing : 9th clock */
> +               bit_setl(priv->base + IICB0CTL0, IICB0SLWT);
> +
> +               /* Exit the wait state */
> +               writel(IICB0WRET, priv->base + IICB0TRG);
> +
> +               /* Wait for transaction */
> +               time_left = wait_for_completion_timeout(&priv->msg_tia_done,
> +                                                       priv->adap.timeout);
> +               if (!time_left)
> +                       return -ETIMEDOUT;
> +
> +               /* Enable ACK */
> +               bit_setl(priv->base + IICB0CTL0, IICB0SLAC);
> +       }
> +
> +       *data = (u8)(data_tmp & 0xff);

No need to cast or mask.

> +
> +       return 0;
> +}
> +
> +static int rzv2m_i2c_send(struct rzv2m_i2c_priv *priv, struct i2c_msg *msg,
> +                         int *count)

unsigned int *count

> +{
> +       int i, ret = 0;

unsigned int i

> +
> +       for (i = 0; i < msg->len; i++) {
> +               ret = rzv2m_i2c_write_with_ACK(priv, msg->buf[i]);
> +               if (ret < 0)
> +                       break;

return ret?

> +       }
> +       *count = i;
> +
> +       return ret;
> +}
> +
> +static int rzv2m_i2c_receive(struct rzv2m_i2c_priv *priv, struct i2c_msg *msg,
> +                            int *count)

unsigned int *count

> +{
> +       int i, ret = 0;

unsigned int i

> +
> +       for (i = 0; i < msg->len; i++) {
> +               ret = rzv2m_i2c_read_with_ACK(priv, &msg->buf[i],
> +                                             ((msg->len - 1) == i));
> +               if (ret < 0)
> +                       break;

return ret?

> +       }
> +       *count = i;
> +
> +       return ret;
> +}
> +
> +static int rzv2m_i2c_send_address(struct rzv2m_i2c_priv *priv,
> +                                 struct i2c_msg *msg, int read)

No need to pass read, as you have access to the full msg, and 10-bit
addressing is rare?

> +{
> +       u32 addr;
> +       int ret;
> +
> +       if (msg->flags & I2C_M_TEN) {
> +               /* 10-bit address
> +                *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> +                *   addr_2: addr[7:0]
> +                */
> +               addr = 0xf0 | ((msg->addr >> 7) & 0x06);
> +               addr |= read;
> +               /* Send 1st address(extend code) */
> +               ret = rzv2m_i2c_write_with_ACK(priv, addr);
> +               if (ret == 0) {
> +                       /* Send 2nd address */
> +                       ret = rzv2m_i2c_write_with_ACK(priv, msg->addr & 0xff);
> +               }
> +       } else {
> +               /* 7-bit address */
> +               addr = i2c_8bit_addr_from_msg(msg);
> +               ret = rzv2m_i2c_write_with_ACK(priv, addr);
> +       }
> +
> +       return ret;
> +}

> +static int rzv2m_i2c_master_xfer1(struct rzv2m_i2c_priv *priv,
> +                                 struct i2c_msg *msg, int stop)
> +{
> +       int count = 0;

unsigned int

> +       int ret, read = !!(msg->flags & I2C_M_RD);
> +
> +       /* Send start condition */
> +       writel(IICB0STT, priv->base + IICB0TRG);
> +
> +       ret = rzv2m_i2c_send_address(priv, msg, read);
> +

Please drop this blank line.

> +       if (ret == 0) {
> +               if (read)
> +                       ret = rzv2m_i2c_receive(priv, msg, &count);
> +               else
> +                       ret = rzv2m_i2c_send(priv, msg, &count);
> +
> +               if ((ret == 0) && stop)
> +                       ret = rzv2m_i2c_stop_condition(priv);
> +       }
> +
> +       if (ret == -ENXIO)
> +               rzv2m_i2c_stop_condition(priv);
> +       else if (ret < 0)
> +               rzv2m_i2c_init(priv);
> +       else
> +               ret = count;
> +
> +       return ret;
> +}
> +
> +static int rzv2m_i2c_master_xfer(struct i2c_adapter *adap,
> +                                struct i2c_msg *msgs, int num)
> +{
> +       struct rzv2m_i2c_priv *priv = i2c_get_adapdata(adap);
> +       struct device *dev = rzv2m_i2c_priv_to_dev(priv);
> +       int ret, i;

unsigned int i

> +
> +       pm_runtime_get_sync(dev);

Please use pm_runtime_resume_and_get() in new code
(and check its return code?).

> +
> +       if (readl(priv->base + IICB0STR0) & IICB0SSBS) {
> +               ret = -EAGAIN;
> +               goto out;
> +       }
> +
> +       /* I2C main transfer */
> +       for (i = 0; i < num; i++) {
> +               ret = rzv2m_i2c_master_xfer1(priv, &msgs[i], (i == (num - 1)));
> +               if (ret < 0)
> +                       goto out;
> +       }
> +       ret = num;
> +
> +out:
> +       pm_runtime_put(dev);
> +
> +       return ret;
> +}

> +static struct i2c_algorithm rzv2m_i2c_algo = {
> +       .master_xfer = rzv2m_i2c_master_xfer,
> +       .functionality = rzv2m_i2c_func,

No .(un)reg_slave()? ;-)
The hardware seems to support it.

> +};


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
