Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4AD289CF9
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Oct 2020 03:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbgJJBRy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 21:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729110AbgJJAjs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Oct 2020 20:39:48 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91AB2C0613D0
        for <linux-i2c@vger.kernel.org>; Fri,  9 Oct 2020 17:39:46 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y14so8234803pfp.13
        for <linux-i2c@vger.kernel.org>; Fri, 09 Oct 2020 17:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=O+5V9QDwFxJ7ahxHSMiTSLRJZJxgHbRSoJpPCEuMsXA=;
        b=hq7Cd16U9/1SOQcDCdv9YNvPC7JhIGnkNGGueEofc/BYpYTAsLbg3FUdu3c0vZ6cIT
         fE7R+9BQswBqjrbi4byGqhFIuJNUO2ECwrw2Nrdo5PmbHAZxV9vq4YoX9UUAAs6v1K/1
         aBLAow1EtvP2m/jbkxDqgnN8ZguFq05erQOCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=O+5V9QDwFxJ7ahxHSMiTSLRJZJxgHbRSoJpPCEuMsXA=;
        b=Y4rxSYnn/WFrXcdiJJzLcFiUElu7+Vsi83cp4uk7iikAWpkcC8diizS1O2ZnLqzSHj
         ApwuB+KU3//h4ECA03B0YtWuZTXnLdobZu/UtBM8qaGKElm35uYLjJTokBYqxJiANSEy
         a10PO3H37XJSvAQcyJDmddQPW0JoF5E9vpGgmr+AaC664FtvRgpMqcIoT0jI5AecbUxf
         LVUeFSLS3VCtsfUW2r8RFV3Rya/FaXJYrXQOdfhJQZyJm/uppa17T/7J++tmI8FU1JI4
         erUUMuMVzMm0IxOKRYKHUpfbgJno6U4MqfqeuAg02y9qmosa/uH+N38daVhRESw/qNfd
         0Dzg==
X-Gm-Message-State: AOAM532d6blzZPQwuSxX8cOlnP//4ZNIW+NEooUWjq80zHbmySx+3Bxr
        MixrsWSwDb8ViBaLH851xlpdhPJmA7gq4w==
X-Google-Smtp-Source: ABdhPJz2qqP7cSX9dhKSmvxzLnkygtn1R3KcUZKY2RHdPx9iB5G/9QC8OWwngasxGqKYf1GKG5+KBg==
X-Received: by 2002:a17:90a:348e:: with SMTP id p14mr7431223pjb.75.1602290386061;
        Fri, 09 Oct 2020 17:39:46 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id z18sm11642238pfn.158.2020.10.09.17.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 17:39:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201008155154.1.Ifdb1b69fa3367b81118e16e9e4e63299980ca798@changeid>
References: <20201008225235.2035820-1-dianders@chromium.org> <20201008155154.1.Ifdb1b69fa3367b81118e16e9e4e63299980ca798@changeid>
Subject: Re: [PATCH 1/3] soc: qcom: geni: More properly switch to DMA mode
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
To:     Akash Asthana <akashast@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@kernel.org>
Date:   Fri, 09 Oct 2020 17:39:43 -0700
Message-ID: <160229038385.310579.7502548054994849649@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Douglas Anderson (2020-10-08 15:52:33)
> On geni-i2c transfers using DMA, it was seen that if you program the
> command (I2C_READ) before calling geni_se_rx_dma_prep() that it could
> cause interrupts to fire.  If we get unlucky, these interrupts can
> just keep firing (and not be handled) blocking further progress and
> hanging the system.
>=20
> In commit 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
> we avoided that by making sure we didn't program the command until
> after geni_se_rx_dma_prep() was called.  While that avoided the
> problems, it also turns out to be invalid.  At least in the TX case we
> started seeing sporadic corrupted transfers.  This is easily seen by
> adding an msleep() between the DMA prep and the writing of the
> command, which makes the problem worse.  That means we need to revert
> that commit and find another way to fix the bogus IRQs.
>=20
> Specifically, after reverting commit 02b9aec59243 ("i2c:
> i2c-qcom-geni: Fix DMA transfer race"), I put some traces in.  I found
> that the when the interrupts were firing like crazy:
> - "m_stat" had bits for M_RX_IRQ_EN, M_RX_FIFO_WATERMARK_EN set.
> - "dma" was set.
>=20
> Further debugging showed that I could make the problem happen more
> reliably by adding an "msleep(1)" any time after geni_se_setup_m_cmd()
> ran up until geni_se_rx_dma_prep() programmed the length.
>=20
> A rather simple fix is to change geni_se_select_dma_mode() so it's a
> true inverse of geni_se_select_fifo_mode() and disables all the FIFO
> related interrupts.  Now the problematic interrupts can't fire and we
> can program things in the correct order without worrying.
>=20
> As part of this, let's also change the writel_relaxed() in the prepare
> function to a writel() so that our DMA is guaranteed to be prepared
> now that we can't rely on geni_se_setup_m_cmd()'s writel().
>=20
> NOTE: the only current user of GENI_SE_DMA in mainline is i2c.
>=20
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm=
 GENI I2C controller")
> Fixes: 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>=20
>  drivers/soc/qcom/qcom-geni-se.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni=
-se.c
> index d0e4f520cff8..751a49f6534f 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -289,10 +289,23 @@ static void geni_se_select_fifo_mode(struct geni_se=
 *se)
> =20
>  static void geni_se_select_dma_mode(struct geni_se *se)
>  {
> +       u32 proto =3D geni_se_read_proto(se);
>         u32 val;
> =20
>         geni_se_irq_clear(se);
> =20
> +       val =3D readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
> +       if (proto !=3D GENI_SE_UART) {

Not a problem with this patch but it would be great if there was a
comment here (and probably in geni_se_select_fifo_mode() too) indicating
why GENI_SE_UART is special. Is it because GENI_SE_UART doesn't use the
main sequencer? I think that is the reason, but I forgot and reading
this code doesn't tell me that.

Splitting the driver in this way where the logic is in the geni wrapper
and in the engine driver leads to this confusion.

> +               val &=3D ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
> +               val &=3D ~(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
> +       }
> +       writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
> +
> +       val =3D readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
> +       if (proto !=3D GENI_SE_UART)
> +               val &=3D ~S_CMD_DONE_EN;
> +       writel_relaxed(val, se->base + SE_GENI_S_IRQ_EN);
> +
>         val =3D readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
>         val |=3D GENI_DMA_MODE_EN;
>         writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
