Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F4846EB35
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Dec 2021 16:30:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbhLIPdi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Dec 2021 10:33:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbhLIPdi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Dec 2021 10:33:38 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9554C0617A1;
        Thu,  9 Dec 2021 07:30:04 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id r25so20356332edq.7;
        Thu, 09 Dec 2021 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PnZS/qCVtvAb/gIQeuy7lIAt1isqXbg6Vz2BdZccjhc=;
        b=C9C8lR2uMSA7rkl+6k/dR+gv15ZCRDtv62G4iBRXaa81eaZiGc75pDxQW9rNqX+2HI
         tfjp6x257MD0OUy1Hxx6nOX5bWDXLqiz9Jh+UV2gtn6RLvupyz1BpYGFjAzaEpVdiy6i
         APaWwVNrAvjmMQVYSDOhOn1Cam7OcwY58IPTAiVP+dcmWOZrFNGAhmDsqRhti6HqIdBB
         ydEOTWNYCyquHEF3aDjVopNnIkuwaOEyph2RUiWdmRA+3ZTTEWBd7GEN/p2VVoqZf9Zo
         cvWNHDAKkcoV6U+i0dBnkR0GoEZ/sXtwiEXngrAYQA+lHpmrcOZ/irxmocooVlxJaeU0
         Lkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PnZS/qCVtvAb/gIQeuy7lIAt1isqXbg6Vz2BdZccjhc=;
        b=j4M2hi05Co+w566fVvY0C3IBj9vN904xmR7/LQlzAB5B9NOpGSzvImMBS9fCoYwf88
         L6zDLmyWggTTyaQezf3hAgtPpDhH+zVQCVLhYvjgTUj6uoCXua7+b7/ZZzWN8pOlxgjY
         9mThJLU7juPeM2bitFoyLfNromj+pEnJ95JJKStgRkWL6zS+EZ9GHBtKW0HfyS2IjvGw
         eSj4Lf2Ssilc30/IsBz8JDWAJJ4QFOFABNpi3VVuXhWA2jxDA+gYpgroJ4H7lZ0JyVJV
         nh+ZSB5hn1zMppPOvIKdekUS8BdD5/8zVSF5KSQw7kZDFrEwehJFtoiLAjxINdwv5b54
         KS6g==
X-Gm-Message-State: AOAM531n0NeRZ59WoatGTdfSrlnpiAVfEQI6pZnvJBXBsuEd6g+SCDVD
        lUYuMNxgxV+VSPCtK8VZhY8irStfS+DqxoYTydA=
X-Google-Smtp-Source: ABdhPJzPH7wt3pebAjmYV1IuugYLMvgtnBpuqmcvwZEl9t1AgA6z//rnO4rB+UbdmCGvGYo2NZNccpjtoyFhufL2lIo=
X-Received: by 2002:a17:906:ecac:: with SMTP id qh12mr15943103ejb.377.1639063680720;
 Thu, 09 Dec 2021 07:28:00 -0800 (PST)
MIME-Version: 1.0
References: <1639057668-14377-1-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1639057668-14377-1-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Dec 2021 17:26:28 +0200
Message-ID: <CAHp75Vfja0-o49u4tXkrEgE9xKPDD=_eZonwLGYsnRTs69z9og@mail.gmail.com>
Subject: Re: [PATCH] i2c: tegra: use i2c_timings for bus clock freq
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linaro-mm-sig@lists.linaro.org,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 9, 2021 at 3:48 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Use i2c_timings struct and corresponding methods to get bus clock frequency

Thanks!
A couple of comments below, after addressing them, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>
> The patch is in response to the discussion in a previous patch to use
> i2c_timings struct for bus freq.
> ref. https://lkml.org/lkml/2021/11/25/767

A-ha.
Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
(or @linux.intel.com, I can't see it there)

> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index a5be8f0..ffd2ad2 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -246,7 +246,7 @@ struct tegra_i2c_hw_feature {
>   * @msg_buf: pointer to current message data
>   * @msg_buf_remaining: size of unsent data in the message buffer
>   * @msg_read: indicates that the transfer is a read access
> - * @bus_clk_rate: current I2C bus clock rate
> + * @timings: i2c timings information like bus frequency
>   * @multimaster_mode: indicates that I2C controller is in multi-master mode
>   * @tx_dma_chan: DMA transmit channel
>   * @rx_dma_chan: DMA receive channel
> @@ -273,7 +273,7 @@ struct tegra_i2c_dev {
>         unsigned int nclocks;
>
>         struct clk *div_clk;
> -       u32 bus_clk_rate;
> +       struct i2c_timings timings;
>
>         struct completion msg_complete;
>         size_t msg_buf_remaining;
> @@ -642,14 +642,14 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>         if (i2c_dev->is_vi)
>                 tegra_i2c_vi_init(i2c_dev);
>
> -       switch (i2c_dev->bus_clk_rate) {
> +       switch (i2c_dev->timings.bus_freq_hz) {

It would be easier to have all these to read when you introduce a
temporary variable:

  struct i2c_timings *t = &i2c_dev->timings;
  ...
  switch (t->...) {
  ...

>         case I2C_MAX_STANDARD_MODE_FREQ + 1 ... I2C_MAX_FAST_MODE_PLUS_FREQ:
>         default:
>                 tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
>                 thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
>                 tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
>
> -               if (i2c_dev->bus_clk_rate > I2C_MAX_FAST_MODE_FREQ)
> +               if (i2c_dev->timings.bus_freq_hz > I2C_MAX_FAST_MODE_FREQ)
>                         non_hs_mode = i2c_dev->hw->clk_divisor_fast_plus_mode;
>                 else
>                         non_hs_mode = i2c_dev->hw->clk_divisor_fast_mode;
> @@ -685,7 +685,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
>         clk_multiplier = (tlow + thigh + 2) * (non_hs_mode + 1);
>
>         err = clk_set_rate(i2c_dev->div_clk,
> -                          i2c_dev->bus_clk_rate * clk_multiplier);
> +                          i2c_dev->timings.bus_freq_hz * clk_multiplier);
>         if (err) {
>                 dev_err(i2c_dev->dev, "failed to set div-clk rate: %d\n", err);
>                 return err;
> @@ -724,7 +724,7 @@ static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
>          * before disabling the controller so that the STOP condition has
>          * been delivered properly.
>          */
> -       udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->bus_clk_rate));
> +       udelay(DIV_ROUND_UP(2 * 1000000, i2c_dev->timings.bus_freq_hz));
>
>         cnfg = i2c_readl(i2c_dev, I2C_CNFG);
>         if (cnfg & I2C_CNFG_PACKET_MODE_EN)
> @@ -1254,7 +1254,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
>          * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
>          */
>         xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
> -                                      i2c_dev->bus_clk_rate);
> +                                      i2c_dev->timings.bus_freq_hz);
>
>         int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
>         tegra_i2c_unmask_irq(i2c_dev, int_mask);
> @@ -1633,10 +1633,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
>         bool multi_mode;
>         int err;
>
> -       err = device_property_read_u32(i2c_dev->dev, "clock-frequency",
> -                                      &i2c_dev->bus_clk_rate);
> -       if (err)
> -               i2c_dev->bus_clk_rate = I2C_MAX_STANDARD_MODE_FREQ;
> +       i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
>
>         multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
>         i2c_dev->multimaster_mode = multi_mode;
> --
> 2.7.4
>


-- 
With Best Regards,
Andy Shevchenko
