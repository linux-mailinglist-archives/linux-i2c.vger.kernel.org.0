Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89F93501ED
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 16:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235976AbhCaOKN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 10:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235993AbhCaOKG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Mar 2021 10:10:06 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E36C061574
        for <linux-i2c@vger.kernel.org>; Wed, 31 Mar 2021 07:10:05 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id c204so14659690pfc.4
        for <linux-i2c@vger.kernel.org>; Wed, 31 Mar 2021 07:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uMG7IEiavzSRE2X65Zsaw36Y4uyy2Xzq3ejd+JY938s=;
        b=GHmHIPTSsfyLpfQNVBmNXMEoTEEoJBQCa6SHoFWfehh/SO3pVcMb35t+adcflzrdBa
         LO1T9zk9wRSKcElAOxg9OSQEC2RkHt0uXE8zVSBp2phhiWVBPbixUGiz+NZU820xY10H
         AJj5HoJ3R2Se45St+dHwoYNVckc34k2nMKl+duxIPGzuVCwj89B/CSR49fdI4CR5h/M9
         XQ0OYnlhoqDUOHBMAnKRPAKC0DY2wsUMN7JZqQrH9k58dEJHPmt/LkYSSjbnnXhYTl+D
         +NOMsjQFKhVD4a/F7GenIPOL69GnGO1oeqOTPHUgCY7VD6I9VkZUD5OhCP2QsOoAgz4f
         rYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uMG7IEiavzSRE2X65Zsaw36Y4uyy2Xzq3ejd+JY938s=;
        b=IGfQb5lTKSp3FRNTVC9AdYjpfvSsByK2SDycRFCkfC6Ea2FXq8oAQpATlMth+noXj+
         uFE5Be71+zMAGe1n0rjyoy3VvP7KUlfrU5cCRCpLUB0MoChZm+Q9zmmJntbQ2312rsmz
         ZUMC3WXyFFmaO+okctkr59A2cvCOvND83xyJQvsaN+15SpUDkFmOMusOUTvF94GSVrIC
         biy6UqNDBSlvmZzCmU4ID+5+l1oVyCIwxWO+/O27qMqlqxv2Fgnr4G0AR4ZDjzhpnglE
         Bhg6MYRBovpDx3rEwzzloz+u8FjW0skIqyKsKD4VQHGQwOvTeCs11vR05YlDP6JlRXSJ
         juIg==
X-Gm-Message-State: AOAM532Q+Q10l8xcER9p2iaZ6smlwtFw/lJeW3B2/QcVZAYit9cVa7y4
        BCSadTvst5KnNTRGIQktPZfjW7C4c4szDoJDCmCuVw==
X-Google-Smtp-Source: ABdhPJzV2NlH20rN2slIH3t2yEuNNhBQjJpDqRJFy64EHQl/Nn2Dm+/keOoqb3l/wQYM8tURyLvI1RfnId1vEWlnN2E=
X-Received: by 2002:a62:80cf:0:b029:1f3:1959:2e42 with SMTP id
 j198-20020a6280cf0000b02901f319592e42mr3171023pfd.39.1617199804922; Wed, 31
 Mar 2021 07:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210331104622.84657-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210331104622.84657-1-andriy.shevchenko@linux.intel.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 31 Mar 2021 16:09:53 +0200
Message-ID: <CAG3jFyufem_LrhmYar==qzWmEhOp_Q3LLErchzLBJeEjfRb0Zg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: drivers: Use generic definitions for bus
 frequencies (part 2)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hey Andy,

This patch looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Wed, 31 Mar 2021 at 12:46, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Khalil Blaiech <kblaiech@nvidia.com>
> ---
> v2: added tag (Khalil), converted one missed place in DesignWare driver
>  drivers/i2c/busses/i2c-designware-master.c |  2 +-
>  drivers/i2c/busses/i2c-mlxbf.c             | 14 ++++----------
>  drivers/i2c/busses/i2c-qcom-cci.c          |  4 ++--
>  3 files changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index dd27b9dbe931..3f4d2124e0fc 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -78,7 +78,7 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
>          * difference is the timing parameter values since the registers are
>          * the same.
>          */
> -       if (t->bus_freq_hz == 1000000) {
> +       if (t->bus_freq_hz == I2C_MAX_FAST_MODE_PLUS_FREQ) {
>                 /*
>                  * Check are Fast Mode Plus parameters available. Calculate
>                  * SCL timing parameters for Fast Mode Plus if not set.
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
> index 2fb0532d8a16..80ab831df349 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -172,12 +172,6 @@
>  #define MLXBF_I2C_SMBUS_THIGH_MAX_TBUF            0x14
>  #define MLXBF_I2C_SMBUS_SCL_LOW_TIMEOUT           0x18
>
> -enum {
> -       MLXBF_I2C_TIMING_100KHZ = 100000,
> -       MLXBF_I2C_TIMING_400KHZ = 400000,
> -       MLXBF_I2C_TIMING_1000KHZ = 1000000,
> -};
> -
>  /*
>   * Defines SMBus operating frequency and core clock frequency.
>   * According to ADB files, default values are compliant to 100KHz SMBus
> @@ -1202,7 +1196,7 @@ static int mlxbf_i2c_init_timings(struct platform_device *pdev,
>
>         ret = device_property_read_u32(dev, "clock-frequency", &config_khz);
>         if (ret < 0)
> -               config_khz = MLXBF_I2C_TIMING_100KHZ;
> +               config_khz = I2C_MAX_STANDARD_MODE_FREQ;
>
>         switch (config_khz) {
>         default:
> @@ -1210,15 +1204,15 @@ static int mlxbf_i2c_init_timings(struct platform_device *pdev,
>                 pr_warn("Illegal value %d: defaulting to 100 KHz\n",
>                         config_khz);
>                 fallthrough;
> -       case MLXBF_I2C_TIMING_100KHZ:
> +       case I2C_MAX_STANDARD_MODE_FREQ:
>                 config_idx = MLXBF_I2C_TIMING_CONFIG_100KHZ;
>                 break;
>
> -       case MLXBF_I2C_TIMING_400KHZ:
> +       case I2C_MAX_FAST_MODE_FREQ:
>                 config_idx = MLXBF_I2C_TIMING_CONFIG_400KHZ;
>                 break;
>
> -       case MLXBF_I2C_TIMING_1000KHZ:
> +       case I2C_MAX_FAST_MODE_PLUS_FREQ:
>                 config_idx = MLXBF_I2C_TIMING_CONFIG_1000KHZ;
>                 break;
>         }
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 1c259b5188de..c63d5545fc2a 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -569,9 +569,9 @@ static int cci_probe(struct platform_device *pdev)
>                 cci->master[idx].mode = I2C_MODE_STANDARD;
>                 ret = of_property_read_u32(child, "clock-frequency", &val);
>                 if (!ret) {
> -                       if (val == 400000)
> +                       if (val == I2C_MAX_FAST_MODE_FREQ)
>                                 cci->master[idx].mode = I2C_MODE_FAST;
> -                       else if (val == 1000000)
> +                       else if (val == I2C_MAX_FAST_MODE_PLUS_FREQ)
>                                 cci->master[idx].mode = I2C_MODE_FAST_PLUS;
>                 }
>
> --
> 2.30.2
>
