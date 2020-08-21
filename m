Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB0724C91A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Aug 2020 02:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgHUAWp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Aug 2020 20:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726745AbgHUAWm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Aug 2020 20:22:42 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7844EC061387
        for <linux-i2c@vger.kernel.org>; Thu, 20 Aug 2020 17:22:42 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j21so152015pgi.9
        for <linux-i2c@vger.kernel.org>; Thu, 20 Aug 2020 17:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=JaBnFv8JsCcvYIQ4zapld4yeibcuyrja8X9nWizMp1c=;
        b=BZjKFFxJrYWLpgWAWQWZDBKLRAci51Q0Su8FjO3iUEFzlyOhqLFNPsvuxixamwrRLs
         lKZGGf7rLwn47tLUO42ClFCzMBDXdfLXL78W50n+2ZlXdKXDTdRlU5lXHXAw4nbEdKSF
         UHZOlE43W/n9/caF6jnniuToGVFUgwElEfn7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=JaBnFv8JsCcvYIQ4zapld4yeibcuyrja8X9nWizMp1c=;
        b=M92xTw95O9Slc6oNaO6Pq601P87OE0rsAlHsGeSyICFJGZ0cHVTVqlG/n96bzt/60L
         jBYzGTeWo09TAjPK5Vbjdm/TyGyMs0ZpQQw6mhAMHXTTIOAuxRzOARhLllSzVYcC/7r8
         K/TGn0TrBziNr0vLCSGCBNOGwQLjLcSmw/6UVPmSZ8fGaNw+w6Wdw6ggM/jCXZXe36Cs
         ayWy6J3ROkWnywloMK5CLN6su6WTBMbwYmNGFbgxif0/DKd+ViDfv5cOzvFWUYEDYh5X
         JtvRa1oBRMQ0z9slr2uId/Kf/nnkuvC6fq/qavzbrMqt303y0+EpQW+tSQszqkF4bkGh
         zfgQ==
X-Gm-Message-State: AOAM531Pj26OjVAmfK9V5957pJMeQGRygDMlPe/5xQZEpSylcjoRYlez
        7RnQviqE7m65HQdTPx53YZ/4CQ==
X-Google-Smtp-Source: ABdhPJzVcoX75PGXe53amp5g/BCyz0Rr5NOS371Xm2m4glOupRHFGrjG7hJOP7n5c9L/t/5QY67Ssg==
X-Received: by 2002:a63:925d:: with SMTP id s29mr449060pgn.423.1597969361170;
        Thu, 20 Aug 2020 17:22:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x127sm249376pfd.86.2020.08.20.17.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 17:22:40 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200820103522.26242-3-rojay@codeaurora.org>
References: <20200820103522.26242-1-rojay@codeaurora.org> <20200820103522.26242-3-rojay@codeaurora.org>
Subject: Re: [PATCH V2 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date:   Thu, 20 Aug 2020 17:22:39 -0700
Message-ID: <159796935923.334488.7479152222902825306@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Roja Rani Yarubandi (2020-08-20 03:35:22)
> If the hardware is still accessing memory after SMMU translation
> is disabled (as part of smmu shutdown callback), then the
> IOVAs (I/O virtual address) which it was using will go on the bus
> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
>=20
> So, implement shutdown callback to i2c driver to unmap DMA mappings
> during system "reboot" or "shutdown".
>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---

I'd still put a Fixes tag because it's fixing the driver when someone
runs shutdown.

> Changes in V2:
>  - As per Stephen's comments added seperate function for stop transfer,
>    fixed minor nitpicks.
>=20
>  drivers/i2c/busses/i2c-qcom-geni.c | 43 ++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h       |  5 ++++
>  2 files changed, 48 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 1fda5c7c2cfc..d07f2f33bb75 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -486,6 +486,28 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>         return ret;
>  }
> =20
> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> +{
> +       u32 val;
> +       struct geni_se *se =3D &gi2c->se;
> +
> +       val =3D readl_relaxed(gi2c->se.base + SE_DMA_DEBUG_REG0);
> +       if (val & DMA_TX_ACTIVE) {
> +               geni_i2c_abort_xfer(gi2c);
> +               gi2c->cur_wr =3D 0;
> +               if (gi2c->err)
> +                       geni_i2c_tx_fsm_rst(gi2c);
> +               geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
> +       }
> +       if (val & DMA_RX_ACTIVE) {
> +               geni_i2c_abort_xfer(gi2c);
> +               gi2c->cur_rd =3D 0;
> +               if (gi2c->err)
> +                       geni_i2c_rx_fsm_rst(gi2c);
> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
> +       }
> +}
> +
>  static u32 geni_i2c_func(struct i2c_adapter *adap)
>  {
>         return I2C_FUNC_I2C | (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUIC=
K);
> @@ -617,6 +639,26 @@ static int geni_i2c_remove(struct platform_device *p=
dev)
>         return 0;
>  }
> =20
> +static void geni_i2c_shutdown(struct platform_device *pdev)
> +{
> +       int ret;
> +       u32 dma;
> +       struct geni_i2c_dev *gi2c =3D platform_get_drvdata(pdev);
> +       struct geni_se *se =3D &gi2c->se;
> +
> +       ret =3D pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", re=
t);
> +               return;
> +       }
> +
> +       dma =3D readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> +       if (dma)
> +               geni_i2c_stop_xfer(gi2c);

Any reason the if (dma) check isn't inside geni_i2c_stop_xfer()?
Checking for dma and then bailing out early should work and keep the
logic in one function. Then the pm_runtime_sync() call could go in there
too and if (!dma) goto out. This assumes that we're going to call
geni_i2c_stop_xfer() from somewhere else, like if a transfer times out
or something?

> +
> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
>  static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  {
>         int ret;
