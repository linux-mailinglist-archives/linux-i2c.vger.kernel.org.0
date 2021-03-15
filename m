Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F9833B300
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Mar 2021 13:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhCOMow (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 15 Mar 2021 08:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbhCOMob (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 15 Mar 2021 08:44:31 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB58C061574;
        Mon, 15 Mar 2021 05:44:31 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id z13so33154586iox.8;
        Mon, 15 Mar 2021 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PqmxvVJwI/DC3vsvSzca8s/AHwB4m2xICIwZ6sXZyZA=;
        b=qQ8TdP8rw4nL6NdxZ/bxsRw98/djVs7nkFBeS71s6oq++6xtBhUnLO1WKvA/bZCoH5
         8QaAy0WXEKHV8dXowndJRs3HKKVjurnTPR/zsR2l4E7hs+cLzc1pZONxZOjPiOpwq423
         zZ7oBnBTsc8W+AEbLVONOEIzlBIMaoQdHpSk+qsARV4/IXNkm3Ov5LluVjWueipa6GLJ
         Lkq28s6g/IAfq+1Jama52uObsN6hArq4tgrDwdORjto60rpoo4HC/fIJBqDP+g7FdzKQ
         kLRNgS8fUOJ0v6E26yhr/Z9DzUKXqUOyCfYO1kTzZ9qFburUlXSQFXdltzEfxHsTISfo
         rwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PqmxvVJwI/DC3vsvSzca8s/AHwB4m2xICIwZ6sXZyZA=;
        b=Vujh1Wjh9R06ekrtfUzM0IRWSwcDCgdrPTnoqOKBV0MNTULGIj1LKG1bZE44vJNOfd
         LjJjnGM3dG6f8ny2fcLRRstTGsgQR4AxTGOekOkSsPBtL43addPBqSah6pARpm00EApG
         8GEdYVsoSLl4seFJJv22TGt/B6OZGPBv5N29iNtwiPgfTudGGDKoL+4z63PfaBydQ6Ap
         MYO8ajrKERmTmVquCoFl1d0C8dLpDTzifPaQgGWKM8dtEVJ05pTSvIa09sZ13g+p7iOo
         WPb3muHnheqTrYur9cjQxYBQAnFFBEo57UnmMN6IoVMMqxryZMGu1X/8mZj9w3cvLLon
         8nPQ==
X-Gm-Message-State: AOAM533CxGEcvTFn6oJM8yeGu8KRMvyHckzZA1U7otgaObrebeZV1vrr
        g9By5cjNAsrjpVW15iArquqoNg3zavQtS9IU5SDkQVWkmKM=
X-Google-Smtp-Source: ABdhPJxa+9TJBDqlEawiezq+UM0bj90iaSfZ+0GXcIkB2o1X7Yxuex1+GznbQaevJ/wVMMatjmsFTuumQqftlDwnWcA=
X-Received: by 2002:a5e:a519:: with SMTP id 25mr6717361iog.3.1615812270447;
 Mon, 15 Mar 2021 05:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com> <1591709203-12106-5-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1591709203-12106-5-git-send-email-dillon.minfei@gmail.com>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Mon, 15 Mar 2021 20:43:54 +0800
Message-ID: <CAL9mu0LJPnxA0JSmV3mogvPA5xRRYCO_4=P7pqpAO7R=YaJX5g@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        p.zabel@pengutronix.de, pierre-yves.mordret@st.com,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Alexandre TORGUE <Alexandre.torgue@foss.st.com>,
        pierre-yves.mordret@foss.st.com
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-i2c@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

Just a gentle ping.

Regards.

On Tue, Jun 9, 2020 at 9:27 PM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> as stm32f429's internal flash is 2Mbytes and compiled kernel
> image bigger than 2Mbytes, so we have to load kernel image
> to sdram on stm32f429-disco board which has 8Mbytes sdram space.
>
> based on above context, as you knows kernel running on external
> sdram is more slower than internal flash. besides, we need read 4
> bytes to get touch screen xyz(x, y, pressure) coordinate data in
> stmpe811 interrupt.
>
> so, in stm32f4_i2c_handle_rx_done, as i2c read slower than running
> in xip mode, have to adjust 'STOP/START bit set position' from last
> two bytes to last one bytes. else, will get i2c timeout in reading
> touch screen coordinate.
>
> to not take side effect, introduce IIC_LAST_BYTE_POS to support xip
> kernel or has mmu platform.
>
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>
> V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot
>
>  drivers/i2c/busses/i2c-stm32f4.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-stm32f4.c b/drivers/i2c/busses/i2c-stm32f4.c
> index d6a69dfcac3f..97cf42ae7fa0 100644
> --- a/drivers/i2c/busses/i2c-stm32f4.c
> +++ b/drivers/i2c/busses/i2c-stm32f4.c
> @@ -93,6 +93,12 @@
>  #define STM32F4_I2C_MAX_FREQ           46U
>  #define HZ_TO_MHZ                      1000000
>
> +#if !defined(CONFIG_MMU) && !defined(CONFIG_XIP_KERNEL)
> +#define IIC_LAST_BYTE_POS 1
> +#else
> +#define IIC_LAST_BYTE_POS 2
> +#endif
> +
>  /**
>   * struct stm32f4_i2c_msg - client specific data
>   * @addr: 8-bit slave addr, including r/w bit
> @@ -439,7 +445,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>         int i;
>
>         switch (msg->count) {
> -       case 2:
> +       case IIC_LAST_BYTE_POS:
>                 /*
>                  * In order to correctly send the Stop or Repeated Start
>                  * condition on the I2C bus, the STOP/START bit has to be set
> @@ -454,7 +460,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>                 else
>                         stm32f4_i2c_set_bits(reg, STM32F4_I2C_CR1_START);
>
> -               for (i = 2; i > 0; i--)
> +               for (i = IIC_LAST_BYTE_POS; i > 0; i--)
>                         stm32f4_i2c_read_msg(i2c_dev);
>
>                 reg = i2c_dev->base + STM32F4_I2C_CR2;
> @@ -463,7 +469,7 @@ static void stm32f4_i2c_handle_rx_done(struct stm32f4_i2c_dev *i2c_dev)
>
>                 complete(&i2c_dev->complete);
>                 break;
> -       case 3:
> +       case (IIC_LAST_BYTE_POS+1):
>                 /*
>                  * In order to correctly generate the NACK pulse after the last
>                  * received data byte, we have to enable NACK before reading N-2
> --
> 2.7.4
>
