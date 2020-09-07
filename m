Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCA125F51D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 10:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgIGI1f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 04:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728231AbgIGI1d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 04:27:33 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93C2C061573;
        Mon,  7 Sep 2020 01:27:31 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id v15so7698164pgh.6;
        Mon, 07 Sep 2020 01:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DdOoYM6OPY1RbgCyxU17hdFmsegbNnICI2T/FOECueg=;
        b=C8WTNzki3V34f340ur6v+mfqk1HdsIUBhe4SLq6wseCBVq5eWi6kXnWkWjJQGKeGu0
         ZDfjYUqghD6mAgjv2K5akIyhnznHiUZETH7KDr5oq/HkorP2x3W87QIOTcmhNPxGdqFl
         vd+qEeuSz4eXzwRH/PbRtYEGoQXCnLOzRkngcMYJDSOheLRbCCBu1R9mJCccLm1v1Qza
         T/TAjh267bje1QsT0mZhFHeU6EwwR+YlVCRmGhzEa7vFlM2SHeGcOeh+n3u6t2fuOIL5
         pv2gWdQZ2SgQq/K1jaOeKnhv8EBw++eZT5jcQtyx7NdAWrycftpsXltwhrafTUbUaGDA
         /4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DdOoYM6OPY1RbgCyxU17hdFmsegbNnICI2T/FOECueg=;
        b=MTWO+nf7IsS5wxqEzK1Py3X+T1761eGJ/jQQ7va9MwkfiG6kVCbFuASFJ5ga4txrSV
         p76Nf8W1aCrDrVikpD5MzgzHf4UgjVZG8aTGm8PVvSAbw/vdCQH4IXHYM6lezzcPip8+
         m5fF534AxPyL06XctIVzfKQNEOSNT0lq3/Q1YR9u+VfoZs3Uk+jBMboOEhV3FUO8XG0O
         dNwQuJWpbbMTacwjw5UVvkbHddock9sSiSSVtnPGC+O6CAuuhsiJxXYh4dAXSMdJEgqO
         tVvdRhG8hpmK//A/uMjI1bQrok1S8cKNZkffQPM3QYjGzgSX8fmXNkcS3qnxH0U2kZJV
         6hIg==
X-Gm-Message-State: AOAM5329cPoSP45OXlkzcjas/RDTWri6uH6/XtiYxot97/7QrhehPADx
        DEDY7ngG4uF8sC3LD1y/ObkJULkksGJXCGnrbmU=
X-Google-Smtp-Source: ABdhPJxe0GQ5R+4iAvm4uidWTnFHE95BD5nj8jwhvyuugBKlENArPk3NQ66FM7jDp9iXRFZwYqyyt0gKOHYqMhyukgM=
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr15515102pgj.74.1599467251182;
 Mon, 07 Sep 2020 01:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-28-digetx@gmail.com>
In-Reply-To: <20200906185039.22700-28-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 11:27:13 +0300
Message-ID: <CAHp75VfSyfJoEbFGEH32=841_2h4_8r+vVYO2BPHgSVvuatOag@mail.gmail.com>
Subject: Re: [PATCH v5 27/36] i2c: tegra: Reorder location of functions in the code
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 6, 2020 at 9:52 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Reorder location of functions in the code in order to have definition
> of functions closer to the place of the invocation. This change makes
> easier to navigate around the code and removes the need to have a
> prototype for tegra_i2c_init().
>

This patch as 25th and one I commented before have a ping-pong style
of programming (you touch a lot of LOCs which you introduced in
previous patches). Please try to reorder series in a way that you
minimize the churn of shuffling the code.

> Reviewed-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 482 ++++++++++++++++-----------------
>  1 file changed, 240 insertions(+), 242 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 5fe138ead45e..d34b6bb295b9 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -288,8 +288,6 @@ struct tegra_i2c_dev {
>         bool is_curr_atomic_xfer;
>  };
>
> -static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev);
> -
>  static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, u32 reg)
>  {
>         writel_relaxed(val, i2c_dev->base + reg);
> @@ -463,174 +461,6 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev =
*i2c_dev)
>         return err;
>  }
>
> -static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
> -                                  u32 reg, u32 mask, u32 delay_us,
> -                                  u32 timeout_us)
> -{
> -       void __iomem *addr =3D i2c_dev->base + tegra_i2c_reg_addr(i2c_dev=
, reg);
> -       u32 val;
> -
> -       if (!i2c_dev->is_curr_atomic_xfer)
> -               return readl_relaxed_poll_timeout(addr, val, !(val & mask=
),
> -                                                 delay_us, timeout_us);
> -
> -       return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask)=
,
> -                                                delay_us, timeout_us);
> -}
> -
> -static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
> -{
> -       u32 mask, val, offset;
> -       int err;
> -
> -       if (i2c_dev->hw->has_mst_fifo) {
> -               mask =3D I2C_MST_FIFO_CONTROL_TX_FLUSH |
> -                      I2C_MST_FIFO_CONTROL_RX_FLUSH;
> -               offset =3D I2C_MST_FIFO_CONTROL;
> -       } else {
> -               mask =3D I2C_FIFO_CONTROL_TX_FLUSH |
> -                      I2C_FIFO_CONTROL_RX_FLUSH;
> -               offset =3D I2C_FIFO_CONTROL;
> -       }
> -
> -       val =3D i2c_readl(i2c_dev, offset);
> -       val |=3D mask;
> -       i2c_writel(i2c_dev, val, offset);
> -
> -       err =3D tegra_i2c_poll_register(i2c_dev, offset, mask, 1000, 1000=
000);
> -       if (err) {
> -               dev_err(i2c_dev->dev, "failed to flush FIFO\n");
> -               return err;
> -       }
> -       return 0;
> -}
> -
> -static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
> -{
> -       size_t buf_remaining =3D i2c_dev->msg_buf_remaining;
> -       u8 *buf =3D i2c_dev->msg_buf;
> -       int words_to_transfer;
> -       int rx_fifo_avail;
> -       u32 val;
> -
> -       /*
> -        * Catch overflow due to message fully sent
> -        * before the check for RX FIFO availability.
> -        */
> -       if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
> -               return -EINVAL;
> -
> -       if (i2c_dev->hw->has_mst_fifo) {
> -               val =3D i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
> -               rx_fifo_avail =3D FIELD_GET(I2C_MST_FIFO_STATUS_RX, val);
> -       } else {
> -               val =3D i2c_readl(i2c_dev, I2C_FIFO_STATUS);
> -               rx_fifo_avail =3D FIELD_GET(I2C_FIFO_STATUS_RX, val);
> -       }
> -
> -       /* Rounds down to not include partial word at the end of buf */
> -       words_to_transfer =3D buf_remaining / BYTES_PER_FIFO_WORD;
> -       if (words_to_transfer > rx_fifo_avail)
> -               words_to_transfer =3D rx_fifo_avail;
> -
> -       i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfer);
> -
> -       buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> -       buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> -       rx_fifo_avail -=3D words_to_transfer;
> -
> -       /*
> -        * If there is a partial word at the end of buf, handle it manual=
ly to
> -        * prevent overwriting past the end of buf
> -        */
> -       if (rx_fifo_avail > 0 && buf_remaining > 0) {
> -               /*
> -                * buf_remaining > 3 check not needed as rx_fifo_avail =
=3D=3D 0
> -                * when (words_to_transfer was > rx_fifo_avail) earlier
> -                * in this function.
> -                */
> -               val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
> -               val =3D cpu_to_le32(val);
> -               memcpy(buf, &val, buf_remaining);
> -               buf_remaining =3D 0;
> -               rx_fifo_avail--;
> -       }
> -
> -       /* RX FIFO must be drained, otherwise it's an Overflow case. */
> -       if (WARN_ON_ONCE(rx_fifo_avail))
> -               return -EINVAL;
> -
> -       i2c_dev->msg_buf_remaining =3D buf_remaining;
> -       i2c_dev->msg_buf =3D buf;
> -
> -       return 0;
> -}
> -
> -static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
> -{
> -       size_t buf_remaining =3D i2c_dev->msg_buf_remaining;
> -       u8 *buf =3D i2c_dev->msg_buf;
> -       int words_to_transfer;
> -       int tx_fifo_avail;
> -       u32 val;
> -
> -       if (i2c_dev->hw->has_mst_fifo) {
> -               val =3D i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
> -               tx_fifo_avail =3D FIELD_GET(I2C_MST_FIFO_STATUS_TX, val);
> -       } else {
> -               val =3D i2c_readl(i2c_dev, I2C_FIFO_STATUS);
> -               tx_fifo_avail =3D FIELD_GET(I2C_FIFO_STATUS_TX, val);
> -       }
> -
> -       /* Rounds down to not include partial word at the end of buf */
> -       words_to_transfer =3D buf_remaining / BYTES_PER_FIFO_WORD;
> -
> -       /* It's very common to have < 4 bytes, so optimize that case. */
> -       if (words_to_transfer) {
> -               if (words_to_transfer > tx_fifo_avail)
> -                       words_to_transfer =3D tx_fifo_avail;
> -
> -               /*
> -                * Update state before writing to FIFO.  Note that this m=
ay
> -                * cause us to finish writing all bytes (AKA buf_remainin=
g
> -                * goes to 0), hence we have a potential for an interrupt
> -                * (PACKET_XFER_COMPLETE is not maskable), but GIC interr=
upt
> -                * is disabled at this point.
> -                */
> -               buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_WOR=
D;
> -               tx_fifo_avail -=3D words_to_transfer;
> -               i2c_dev->msg_buf_remaining =3D buf_remaining;
> -               i2c_dev->msg_buf =3D buf +
> -                       words_to_transfer * BYTES_PER_FIFO_WORD;
> -
> -               i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer)=
;
> -
> -               buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> -       }
> -
> -       /*
> -        * If there is a partial word at the end of buf, handle it manual=
ly to
> -        * prevent reading past the end of buf, which could cross a page
> -        * boundary and fault.
> -        */
> -       if (tx_fifo_avail > 0 && buf_remaining > 0) {
> -               /*
> -                * buf_remaining > 3 check not needed as tx_fifo_avail =
=3D=3D 0
> -                * when (words_to_transfer was > tx_fifo_avail) earlier
> -                * in this function for non-zero words_to_transfer.
> -                */
> -               memcpy(&val, buf, buf_remaining);
> -               val =3D le32_to_cpu(val);
> -
> -               i2c_dev->msg_buf_remaining =3D 0;
> -               i2c_dev->msg_buf =3D NULL;
> -
> -               i2c_writel(i2c_dev, val, I2C_TX_FIFO);
> -       }
> -
> -       return 0;
> -}
> -
>  /*
>   * One of the Tegra I2C blocks is inside the DVC (Digital Voltage Contro=
ller)
>   * block.  This block is identical to the rest of the I2C blocks, except=
 that
> @@ -652,46 +482,48 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2=
c_dev)
>         dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
>  }
>
> -static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
> +static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
>  {
> -       struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> -       int ret;
> +       u32 value;
>
> -       ret =3D pinctrl_pm_select_default_state(i2c_dev->dev);
> -       if (ret)
> -               return ret;
> +       value =3D FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, 2) |
> +               FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, 4);
> +       i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_0);
>
> -       ret =3D clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
> -       if (ret)
> -               return ret;
> +       value =3D FIELD_PREP(I2C_INTERFACE_TIMING_TBUF, 4) |
> +               FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STO, 7) |
> +               FIELD_PREP(I2C_INTERFACE_TIMING_THD_STA, 4) |
> +               FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STA, 4);
> +       i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_1);
>
> -       /*
> -        * VI I2C device is attached to VE power domain which goes throug=
h
> -        * power ON/OFF during PM runtime resume/suspend. So, controller
> -        * should go through reset and need to re-initialize after power
> -        * domain ON.
> -        */
> -       if (i2c_dev->is_vi) {
> -               ret =3D tegra_i2c_init(i2c_dev);
> -               if (ret)
> -                       goto disable_clocks;
> -       }
> +       value =3D FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, 3) |
> +               FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, 8);
> +       i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_0);
>
> -       return 0;
> +       value =3D FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
> +               FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
> +               FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
> +       i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
>
> -disable_clocks:
> -       clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
> +       value =3D FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND=
;
> +       i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
>
> -       return ret;
> +       i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
>  }
>
> -static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
> +static int tegra_i2c_poll_register(struct tegra_i2c_dev *i2c_dev,
> +                                  u32 reg, u32 mask, u32 delay_us,
> +                                  u32 timeout_us)
>  {
> -       struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> +       void __iomem *addr =3D i2c_dev->base + tegra_i2c_reg_addr(i2c_dev=
, reg);
> +       u32 val;
>
> -       clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
> +       if (!i2c_dev->is_curr_atomic_xfer)
> +               return readl_relaxed_poll_timeout(addr, val, !(val & mask=
),
> +                                                 delay_us, timeout_us);
>
> -       return pinctrl_pm_select_idle_state(i2c_dev->dev);
> +       return readl_relaxed_poll_timeout_atomic(addr, val, !(val & mask)=
,
> +                                                delay_us, timeout_us);
>  }
>
>  static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
> @@ -713,33 +545,31 @@ static int tegra_i2c_wait_for_config_load(struct te=
gra_i2c_dev *i2c_dev)
>         return 0;
>  }
>
> -static void tegra_i2c_vi_init(struct tegra_i2c_dev *i2c_dev)
> +static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
>  {
> -       u32 value;
> -
> -       value =3D FIELD_PREP(I2C_INTERFACE_TIMING_THIGH, 2) |
> -               FIELD_PREP(I2C_INTERFACE_TIMING_TLOW, 4);
> -       i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_0);
> -
> -       value =3D FIELD_PREP(I2C_INTERFACE_TIMING_TBUF, 4) |
> -               FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STO, 7) |
> -               FIELD_PREP(I2C_INTERFACE_TIMING_THD_STA, 4) |
> -               FIELD_PREP(I2C_INTERFACE_TIMING_TSU_STA, 4);
> -       i2c_writel(i2c_dev, value, I2C_INTERFACE_TIMING_1);
> -
> -       value =3D FIELD_PREP(I2C_HS_INTERFACE_TIMING_THIGH, 3) |
> -               FIELD_PREP(I2C_HS_INTERFACE_TIMING_TLOW, 8);
> -       i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_0);
> +       u32 mask, val, offset;
> +       int err;
>
> -       value =3D FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STO, 11) |
> -               FIELD_PREP(I2C_HS_INTERFACE_TIMING_THD_STA, 11) |
> -               FIELD_PREP(I2C_HS_INTERFACE_TIMING_TSU_STA, 11);
> -       i2c_writel(i2c_dev, value, I2C_HS_INTERFACE_TIMING_1);
> +       if (i2c_dev->hw->has_mst_fifo) {
> +               mask =3D I2C_MST_FIFO_CONTROL_TX_FLUSH |
> +                      I2C_MST_FIFO_CONTROL_RX_FLUSH;
> +               offset =3D I2C_MST_FIFO_CONTROL;
> +       } else {
> +               mask =3D I2C_FIFO_CONTROL_TX_FLUSH |
> +                      I2C_FIFO_CONTROL_RX_FLUSH;
> +               offset =3D I2C_FIFO_CONTROL;
> +       }
>
> -       value =3D FIELD_PREP(I2C_BC_SCLK_THRESHOLD, 9) | I2C_BC_STOP_COND=
;
> -       i2c_writel(i2c_dev, value, I2C_BUS_CLEAR_CNFG);
> +       val =3D i2c_readl(i2c_dev, offset);
> +       val |=3D mask;
> +       i2c_writel(i2c_dev, val, offset);
>
> -       i2c_writel(i2c_dev, 0x0, I2C_TLOW_SEXT);
> +       err =3D tegra_i2c_poll_register(i2c_dev, offset, mask, 1000, 1000=
000);
> +       if (err) {
> +               dev_err(i2c_dev->dev, "failed to flush FIFO\n");
> +               return err;
> +       }
> +       return 0;
>  }
>
>  static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
> @@ -856,6 +686,132 @@ static int tegra_i2c_disable_packet_mode(struct teg=
ra_i2c_dev *i2c_dev)
>         return tegra_i2c_wait_for_config_load(i2c_dev);
>  }
>
> +static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
> +{
> +       size_t buf_remaining =3D i2c_dev->msg_buf_remaining;
> +       u8 *buf =3D i2c_dev->msg_buf;
> +       int words_to_transfer;
> +       int rx_fifo_avail;
> +       u32 val;
> +
> +       /*
> +        * Catch overflow due to message fully sent
> +        * before the check for RX FIFO availability.
> +        */
> +       if (WARN_ON_ONCE(!(i2c_dev->msg_buf_remaining)))
> +               return -EINVAL;
> +
> +       if (i2c_dev->hw->has_mst_fifo) {
> +               val =3D i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
> +               rx_fifo_avail =3D FIELD_GET(I2C_MST_FIFO_STATUS_RX, val);
> +       } else {
> +               val =3D i2c_readl(i2c_dev, I2C_FIFO_STATUS);
> +               rx_fifo_avail =3D FIELD_GET(I2C_FIFO_STATUS_RX, val);
> +       }
> +
> +       /* Rounds down to not include partial word at the end of buf */
> +       words_to_transfer =3D buf_remaining / BYTES_PER_FIFO_WORD;
> +       if (words_to_transfer > rx_fifo_avail)
> +               words_to_transfer =3D rx_fifo_avail;
> +
> +       i2c_readsl(i2c_dev, buf, I2C_RX_FIFO, words_to_transfer);
> +
> +       buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> +       buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> +       rx_fifo_avail -=3D words_to_transfer;
> +
> +       /*
> +        * If there is a partial word at the end of buf, handle it manual=
ly to
> +        * prevent overwriting past the end of buf
> +        */
> +       if (rx_fifo_avail > 0 && buf_remaining > 0) {
> +               /*
> +                * buf_remaining > 3 check not needed as rx_fifo_avail =
=3D=3D 0
> +                * when (words_to_transfer was > rx_fifo_avail) earlier
> +                * in this function.
> +                */
> +               val =3D i2c_readl(i2c_dev, I2C_RX_FIFO);
> +               val =3D cpu_to_le32(val);
> +               memcpy(buf, &val, buf_remaining);
> +               buf_remaining =3D 0;
> +               rx_fifo_avail--;
> +       }
> +
> +       /* RX FIFO must be drained, otherwise it's an Overflow case. */
> +       if (WARN_ON_ONCE(rx_fifo_avail))
> +               return -EINVAL;
> +
> +       i2c_dev->msg_buf_remaining =3D buf_remaining;
> +       i2c_dev->msg_buf =3D buf;
> +
> +       return 0;
> +}
> +
> +static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
> +{
> +       size_t buf_remaining =3D i2c_dev->msg_buf_remaining;
> +       u8 *buf =3D i2c_dev->msg_buf;
> +       int words_to_transfer;
> +       int tx_fifo_avail;
> +       u32 val;
> +
> +       if (i2c_dev->hw->has_mst_fifo) {
> +               val =3D i2c_readl(i2c_dev, I2C_MST_FIFO_STATUS);
> +               tx_fifo_avail =3D FIELD_GET(I2C_MST_FIFO_STATUS_TX, val);
> +       } else {
> +               val =3D i2c_readl(i2c_dev, I2C_FIFO_STATUS);
> +               tx_fifo_avail =3D FIELD_GET(I2C_FIFO_STATUS_TX, val);
> +       }
> +
> +       /* Rounds down to not include partial word at the end of buf */
> +       words_to_transfer =3D buf_remaining / BYTES_PER_FIFO_WORD;
> +
> +       /* It's very common to have < 4 bytes, so optimize that case. */
> +       if (words_to_transfer) {
> +               if (words_to_transfer > tx_fifo_avail)
> +                       words_to_transfer =3D tx_fifo_avail;
> +
> +               /*
> +                * Update state before writing to FIFO.  Note that this m=
ay
> +                * cause us to finish writing all bytes (AKA buf_remainin=
g
> +                * goes to 0), hence we have a potential for an interrupt
> +                * (PACKET_XFER_COMPLETE is not maskable), but GIC interr=
upt
> +                * is disabled at this point.
> +                */
> +               buf_remaining -=3D words_to_transfer * BYTES_PER_FIFO_WOR=
D;
> +               tx_fifo_avail -=3D words_to_transfer;
> +               i2c_dev->msg_buf_remaining =3D buf_remaining;
> +               i2c_dev->msg_buf =3D buf +
> +                       words_to_transfer * BYTES_PER_FIFO_WORD;
> +
> +               i2c_writesl(i2c_dev, buf, I2C_TX_FIFO, words_to_transfer)=
;
> +
> +               buf +=3D words_to_transfer * BYTES_PER_FIFO_WORD;
> +       }
> +
> +       /*
> +        * If there is a partial word at the end of buf, handle it manual=
ly to
> +        * prevent reading past the end of buf, which could cross a page
> +        * boundary and fault.
> +        */
> +       if (tx_fifo_avail > 0 && buf_remaining > 0) {
> +               /*
> +                * buf_remaining > 3 check not needed as tx_fifo_avail =
=3D=3D 0
> +                * when (words_to_transfer was > tx_fifo_avail) earlier
> +                * in this function for non-zero words_to_transfer.
> +                */
> +               memcpy(&val, buf, buf_remaining);
> +               val =3D le32_to_cpu(val);
> +
> +               i2c_dev->msg_buf_remaining =3D 0;
> +               i2c_dev->msg_buf =3D NULL;
> +
> +               i2c_writel(i2c_dev, val, I2C_TX_FIFO);
> +       }
> +
> +       return 0;
> +}
> +
>  static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
>  {
>         const u32 status_err =3D I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOS=
T;
> @@ -1411,27 +1367,6 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap=
)
>         return ret;
>  }
>
> -static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
> -{
> -       struct device_node *np =3D i2c_dev->dev->of_node;
> -       bool multi_mode;
> -       int ret;
> -
> -       ret =3D of_property_read_u32(np, "clock-frequency",
> -                                  &i2c_dev->bus_clk_rate);
> -       if (ret)
> -               i2c_dev->bus_clk_rate =3D I2C_MAX_STANDARD_MODE_FREQ; /* =
default clock rate */
> -
> -       multi_mode =3D of_property_read_bool(np, "multi-master");
> -       i2c_dev->is_multimaster_mode =3D multi_mode;
> -
> -       if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
> -               i2c_dev->is_dvc =3D true;
> -
> -       if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
> -               i2c_dev->is_vi =3D true;
> -}
> -
>  static const struct i2c_algorithm tegra_i2c_algo =3D {
>         .master_xfer            =3D tegra_i2c_xfer,
>         .master_xfer_atomic     =3D tegra_i2c_xfer_atomic,
> @@ -1637,6 +1572,27 @@ static const struct of_device_id tegra_i2c_of_matc=
h[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
>
> +static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
> +{
> +       struct device_node *np =3D i2c_dev->dev->of_node;
> +       bool multi_mode;
> +       int ret;
> +
> +       ret =3D of_property_read_u32(np, "clock-frequency",
> +                                  &i2c_dev->bus_clk_rate);
> +       if (ret)
> +               i2c_dev->bus_clk_rate =3D I2C_MAX_STANDARD_MODE_FREQ; /* =
default clock rate */
> +
> +       multi_mode =3D of_property_read_bool(np, "multi-master");
> +       i2c_dev->is_multimaster_mode =3D multi_mode;
> +
> +       if (of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
> +               i2c_dev->is_dvc =3D true;
> +
> +       if (of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
> +               i2c_dev->is_vi =3D true;
> +}
> +
>  static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
>  {
>         unsigned int i;
> @@ -1821,6 +1777,48 @@ static int tegra_i2c_remove(struct platform_device=
 *pdev)
>         return 0;
>  }
>
> +static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
> +{
> +       struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D pinctrl_pm_select_default_state(i2c_dev->dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D clk_bulk_enable(i2c_dev->nclocks, i2c_dev->clocks);
> +       if (ret)
> +               return ret;
> +
> +       /*
> +        * VI I2C device is attached to VE power domain which goes throug=
h
> +        * power ON/OFF during PM runtime resume/suspend. So, controller
> +        * should go through reset and need to re-initialize after power
> +        * domain ON.
> +        */
> +       if (i2c_dev->is_vi) {
> +               ret =3D tegra_i2c_init(i2c_dev);
> +               if (ret)
> +                       goto disable_clocks;
> +       }
> +
> +       return 0;
> +
> +disable_clocks:
> +       clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
> +
> +       return ret;
> +}
> +
> +static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
> +{
> +       struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> +
> +       clk_bulk_disable(i2c_dev->nclocks, i2c_dev->clocks);
> +
> +       return pinctrl_pm_select_idle_state(i2c_dev->dev);
> +}
> +
>  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  {
>         struct tegra_i2c_dev *i2c_dev =3D dev_get_drvdata(dev);
> --
> 2.27.0
>


--=20
With Best Regards,
Andy Shevchenko
