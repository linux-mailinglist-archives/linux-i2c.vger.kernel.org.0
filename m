Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E938F261D09
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 21:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731086AbgIHTaj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 15:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732249AbgIHTaW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 15:30:22 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7B4C061757
        for <linux-i2c@vger.kernel.org>; Tue,  8 Sep 2020 12:30:21 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id l126so3835pfd.5
        for <linux-i2c@vger.kernel.org>; Tue, 08 Sep 2020 12:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=SsOjzOVIq97WOAc6WZeXaOq483i3DuOEILRijMKc8+c=;
        b=I2A6OrWWp9ZhN3tycDzSBFzxFhAVc4uVVlf6QeuGM+05TNovmH2B+uVYHRSjh8Tfa4
         3rbgHqE43zixo0WWMEH/uPn6zQ+k8rp6mukpfWZWv8M5OQw4plGz5nLDUFU8TKhOG76x
         kbIHeGgSSQCfV0ICNIztWj0FF4yY6nAq3J+2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=SsOjzOVIq97WOAc6WZeXaOq483i3DuOEILRijMKc8+c=;
        b=eKBL4TJ2Md737WY4Vmi8EM2Z/Stm+5mSh+js7PvYxtLJ2OQLzWx7ZSs2b2KwuOkxPq
         h8xgJV3CDyJWqDd+/mMxSjNg+gPe3IwaJOdGs/BABw4Co2bdnm9OdoA5OTJwU2iFJe1J
         +iF9yesqh8Z0fPnBYGyaZ/KEd/RBvl2TBp3/R0xeuJ9tg3Pvc8cdemxMlwoIPbv6nEix
         KWyDFUX+J7wvnIKMX+1ZVwTVxyj9iFIZ46qJAU4F19s4kGbbaE1dZHzO6ySy3D/7KsYi
         fg6kxf8BNwHInWULv3VspQqlV44Wez4JYVboRmqGKwv0+EqivVhOlrEtf4/TO4lBwssV
         J4EQ==
X-Gm-Message-State: AOAM533LStWkFmCYdpVRcd44VcW4Ls1aRM7ERSY5l7wNCAM0kV4ig/Rr
        6dJOtyj2F/ZRVhT9WM8KmKcUVw==
X-Google-Smtp-Source: ABdhPJxHIdKSrBuYxJO9MpvlN9pOkwSjhGrSBHPFd2611Mm9W5IYS0c3yvOL6x5Xbpknc67grJnfiw==
X-Received: by 2002:a62:6003:: with SMTP id u3mr279604pfb.55.1599593421304;
        Tue, 08 Sep 2020 12:30:21 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id r3sm208389pfh.88.2020.09.08.12.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 12:30:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200907130731.2607-1-rojay@codeaurora.org>
References: <20200907130731.2607-1-rojay@codeaurora.org>
Subject: Re: [PATCH V3] i2c: i2c-qcom-geni: Add shutdown callback for i2c
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
Date:   Tue, 08 Sep 2020 12:30:18 -0700
Message-ID: <159959341894.454335.3250696075143737399@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Why is dri-devel on here? And linaro-mm-sig?

Quoting Roja Rani Yarubandi (2020-09-07 06:07:31)
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index dead5db3315a..b3609760909f 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>  struct geni_i2c_err_log {
> @@ -384,7 +387,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *g=
i2c, struct i2c_msg *msg,
>         if (dma_buf) {
>                 if (gi2c->err)
>                         geni_i2c_rx_fsm_rst(gi2c);
> -               geni_se_rx_dma_unprep(se, rx_dma, len);
> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, len);
> +               gi2c->rx_dma =3D (dma_addr_t)NULL;
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>         }
> =20
> @@ -394,12 +398,12 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
>  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg=
 *msg,
>                                 u32 m_param)
>  {
> -       dma_addr_t tx_dma;
>         unsigned long time_left;
>         void *dma_buf =3D NULL;
>         struct geni_se *se =3D &gi2c->se;
>         size_t len =3D msg->len;
> =20
> +       gi2c->xfer_len =3D len;
>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>                 dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> =20
> @@ -410,7 +414,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *g=
i2c, struct i2c_msg *msg,
> =20
>         writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
> =20
> -       if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
> +       if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &gi2c->tx_dm=
a)) {
>                 geni_se_select_mode(se, GENI_SE_FIFO);
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>                 dma_buf =3D NULL;
> @@ -429,7 +433,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *g=
i2c, struct i2c_msg *msg,
>         if (dma_buf) {
>                 if (gi2c->err)
>                         geni_i2c_tx_fsm_rst(gi2c);
> -               geni_se_tx_dma_unprep(se, tx_dma, len);
> +               geni_se_tx_dma_unprep(se, gi2c->tx_dma, len);
> +               gi2c->tx_dma =3D (dma_addr_t)NULL;
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>         }
> =20
> @@ -479,6 +484,51 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>         return ret;
>  }
> =20
> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> +{
> +       int ret;
> +       u32 dma;
> +       u32 val;
> +       u32 geni_status;
> +       struct geni_se *se =3D &gi2c->se;
> +
> +       ret =3D pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", re=
t);

Is this print really necessary? Doesn't PM core already print this sort
of information?

> +               return;
> +       }
> +
> +       geni_status =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
> +       if (geni_status & M_GENI_CMD_ACTIVE) {

Please try to de-indent all this.

	if (!(geni_status & M_GENI_CMD_ACTIVE))
		goto out;

> +               geni_i2c_abort_xfer(gi2c);
> +               dma =3D readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
> +               if (dma) {

	if (!dma)
		goto out;

> +                       val =3D readl_relaxed(gi2c->se.base + SE_DMA_DEBU=
G_REG0);
> +                       if (val & DMA_TX_ACTIVE) {
> +                               gi2c->cur_wr =3D 0;
> +                               if (gi2c->err)
> +                                       geni_i2c_tx_fsm_rst(gi2c);
> +                               if (gi2c->tx_dma) {
> +                                       geni_se_tx_dma_unprep(se,
> +                                                gi2c->tx_dma, gi2c->xfer=
_len);
> +                                       gi2c->tx_dma =3D (dma_addr_t)NULL;

Almost nobody does this. In fact, grep shows me one hit in the kernel.
If nobody else is doing it something is probably wrong. When would dma
mode be active and tx_dma not be set to something that should be
stopped? If it really is necessary I suppose we should assign this to
DMA_MAPPING_ERROR instead of casting NULL. Then the check above for
tx_dma being valid can be dropped because geni_se_tx_dma_unprep()
already checks for a valid mapping before doing anything. But really, we
should probably be tracking the dma buffer mapped to the CPU as well as
the dma address that was used for the mapping. Not storing both is a
problem, see below.

> +                               }
> +                       } else if (val & DMA_RX_ACTIVE) {
> +                               gi2c->cur_rd =3D 0;
> +                               if (gi2c->err)
> +                                       geni_i2c_rx_fsm_rst(gi2c);
> +                               if (gi2c->rx_dma) {
> +                                       geni_se_rx_dma_unprep(se,
> +                                               gi2c->rx_dma, gi2c->xfer_=
len);

Looking closely it seems that the geni dma wrappers shouldn't even be
checking for an iova being non-zero. Instead they should make sure that
it just isn't invalid with !dma_mapping_error().

> +                                       gi2c->rx_dma =3D (dma_addr_t)NULL;

If we're stopping some dma transaction doesn't that mean the=20

                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);

code needs to run also? I fail to see where we free the buffer that has
been mapped for DMA.

> +                               }
> +                       }
> +               }
> +       }
> +

out:

> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
