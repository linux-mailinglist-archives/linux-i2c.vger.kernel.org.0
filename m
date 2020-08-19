Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89E1249393
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Aug 2020 05:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgHSDoA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Aug 2020 23:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgHSDn7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Aug 2020 23:43:59 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82D1C061342
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 20:43:58 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id mw10so482479pjb.2
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 20:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=LM6WEk9ZkbFt6Qg2UpRFNU3bLjYzPUz6PTE3Cs+whU4=;
        b=FA4/UU2gVgjS/rjFwfGsWgyT+dH+LvVeCqbFb0OUeI/gWzIGoXU3gQBgpbuyKlQv1S
         vY0apjSOiH5Lmx9d0Sdve7ESWLk1aZ9Odq7o4p8SeYfjhXQE+rqoEw212IS1yE/nbqH5
         nb+EQqH1uyhEGYhD4HnH/3sBRgbmW9+WeJlLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=LM6WEk9ZkbFt6Qg2UpRFNU3bLjYzPUz6PTE3Cs+whU4=;
        b=FntAXxHsJlpzVzk/g3iXpv1QGdbbeLkzBd0BY0l2qGO+4Hhis5WLDgNZLHU1fiRrZQ
         N4dubwvWGd+tIysDLIyUN+qBtW7EguNy3MKq7xvm0UyBBcKaha4YWAdtCL6/Yeirwcbs
         1UCF6ThlYBJLYuiecH9e5O9SGdbu3uQNlGx4fXfWP5YDVzLNZKLraGqXhDeklnnNAGhn
         izIuCtRtpHs7sY1VgG7y6icL2DqpOWh7pVOsUb7RSK17d7EZq1/psJO1RV8yot4WpRhR
         HbfNVSnWEUHYDlkikr/h/DpKEMA2UtG88nmUlX9l3BSsHENyP5rnz1Dxi1V2JOxRtN1P
         4f+g==
X-Gm-Message-State: AOAM531poqB8gXx2rnrBvsYZiMmCA6XaUrESu9CqdOpx2eskuTBcwSZp
        u+Jwunk+vcM+VaCwUTFxFQH3Ow==
X-Google-Smtp-Source: ABdhPJw1IsJubYX++BUAswOcW/LVMXJ7mvqrysqRZbiBHWRN6AL/0ifU2M3IpMSDGi5didlOHQuO3w==
X-Received: by 2002:a17:90a:c593:: with SMTP id l19mr2507622pjt.20.1597808638416;
        Tue, 18 Aug 2020 20:43:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id o14sm255147pjw.11.2020.08.18.20.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 20:43:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200814095540.32115-3-rojay@codeaurora.org>
References: <20200814095540.32115-1-rojay@codeaurora.org> <20200814095540.32115-3-rojay@codeaurora.org>
Subject: Re: [PATCH 2/2] i2c: i2c-qcom-geni: Add shutdown callback for i2c
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
Date:   Tue, 18 Aug 2020 20:43:56 -0700
Message-ID: <159780863669.334488.18038785498966010175@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Roja Rani Yarubandi (2020-08-14 02:55:40)
> If the hardware is still accessing memory after SMMU translation
> is disabled(as part of smmu shutdown callback), then the

Put a space before (

> IOVAs(I/O virtual address) which it was using will go on the bus

Put a space before (

> as the physical addresses which will result in unknown crashes
> like NoC/interconnect errors.
>=20
> So, adding shutdown callback to i2c driver to unmap DMA mappings
> during system "reboot" or "shutdown".
>=20

Deserves a Fixes: tag if it's fixing a problem, which it looks like it
is.

> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 36 ++++++++++++++++++++++++++++++
>  include/linux/qcom-geni-se.h       |  5 +++++

I'd prefer this is squashed with the previous patch. The first patch
doesn't really stand on its own anyway.

>  2 files changed, 41 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 53ca41f76080..749c225f95c4 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -613,6 +613,41 @@ static int geni_i2c_remove(struct platform_device *p=
dev)
>         return 0;
>  }
> =20
> +static void geni_i2c_shutdown(struct platform_device *pdev)
> +{
> +       int ret;
> +       struct geni_i2c_dev *gi2c =3D platform_get_drvdata(pdev);
> +       struct geni_se *se =3D &gi2c->se;
> +       u32 dma;
> +       u32 dma_dbg_reg;

Typically this is just called 'val'.

> +
> +       ret =3D pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device:%d\n", ret=
);

Maybe just write: "Failed to resume device\n"? Not sure anyone cares
what the error code is. And if they did, it would be connected to the
colon so it will be hard to read. Add a space after colon if you want to
keep the return value please.

> +               return;
> +       }
> +
> +       dma =3D readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> +       if (dma) {
> +               dma_dbg_reg =3D readl_relaxed(gi2c->se.base + SE_DMA_DEBU=
G_REG0);
> +               if (dma_dbg_reg & DMA_TX_ACTIVE) {
> +                       geni_i2c_abort_xfer(gi2c);
> +                       gi2c->cur_wr =3D 0;
> +                       if (gi2c->err)
> +                               geni_i2c_tx_fsm_rst(gi2c);
> +                       geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfe=
r_len);
> +               }
> +               if (dma_dbg_reg & DMA_RX_ACTIVE) {
> +                       geni_i2c_abort_xfer(gi2c);
> +                       gi2c->cur_rd =3D 0;
> +                       if (gi2c->err)
> +                               geni_i2c_rx_fsm_rst(gi2c);
> +                       geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfe=
r_len);
> +               }

Can this be a function? It sort of seems like we should be doing the
same sort of stuff if we're canceling a DMA transaction in flight.

> +       }
> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
>  static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
>  {
>         int ret;
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd464943f717..acad69be747d 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -77,6 +77,7 @@ struct geni_se {
>  #define SE_DMA_RX_FSM_RST              0xd58
>  #define SE_HW_PARAM_0                  0xe24
>  #define SE_HW_PARAM_1                  0xe28
> +#define SE_DMA_DEBUG_REG0              0xe40
> =20
>  /* GENI_FORCE_DEFAULT_REG fields */
>  #define FORCE_DEFAULT  BIT(0)
> @@ -207,6 +208,10 @@ struct geni_se {
>  #define RX_GENI_CANCEL_IRQ             BIT(11)
>  #define RX_GENI_GP_IRQ_EXT             GENMASK(13, 12)
> =20
> +/* DMA DEBUG Register fields */

Please follow other style, ie. SE_DMA_DEBUG_REG0 fields

> +#define DMA_TX_ACTIVE                  BIT(0)
> +#define DMA_RX_ACTIVE                  BIT(1)
> +
>  /* SE_HW_PARAM_0 fields */
>  #define TX_FIFO_WIDTH_MSK              GENMASK(29, 24)
>  #define TX_FIFO_WIDTH_SHFT             24
