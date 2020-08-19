Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD1D24937A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Aug 2020 05:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgHSDjZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Aug 2020 23:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbgHSDjS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Aug 2020 23:39:18 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C411C061389
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 20:39:16 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id m34so10709918pgl.11
        for <linux-i2c@vger.kernel.org>; Tue, 18 Aug 2020 20:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=LqLEg6Ld5QuLtOzu6BqXxZNLCj7RTFYiQgIAyF8gU70=;
        b=KmghUthGvojy07h9BZsorKl+jQO7wKGLOev2rzAcomRYp9sMfs6Gjktbt33K26LekA
         Qxkv14xQTsOxA9Bw0STh5x8cRg2HTa8mDrsoUOptFIhGGhBev4tXpiniG3TiTd2zRraw
         V/Eoz0F5NCVs1RDrHgfuHBOh77xH2S+T3Pt0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=LqLEg6Ld5QuLtOzu6BqXxZNLCj7RTFYiQgIAyF8gU70=;
        b=TzrS2gJAzIG92BUJt6zL6u83XpY+wOGHYI84bepTJKPg4z6IwF02d63NVbbUh6zbob
         Af0wjGeKxFOhPreBTjg8XPWxMRW29iElCp8/kV7rOc66s/mX7XhEUsezw5hjB2SGxHyL
         tpdAUsEanOVmHWM1+fothFP7emstLbJp5fOzSDefnAs7UKw83is3lNksqlnsCTbSv46I
         0Baon8s9kSfDDigCYbFXhebWx0GxZWvVqA3OnGkLS76+f8MSN8rkcB7ssIJzCkceIM9u
         MejJmMzXJTF6oiw7AQ6vQtGdneKDn/QV/4CFhHarhnMK560H9tgAtBQWHlZgjFlZNRrv
         M2JA==
X-Gm-Message-State: AOAM531cZh7s8L9g7QseE37WzUlPfypRLIA3+ewueXlY8hbMuqSzIgvV
        l9Vc7uapH/ji1do60h6D0FYCTg==
X-Google-Smtp-Source: ABdhPJw/fbapbqyEK3EQuuI/goR68Bo71kvM1Fo115OGCAsLxKKL/EFMEBHhZev14vQUxfKm+79SNw==
X-Received: by 2002:a65:68d6:: with SMTP id k22mr8267707pgt.136.1597808355900;
        Tue, 18 Aug 2020 20:39:15 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a193sm26557771pfa.105.2020.08.18.20.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 20:39:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200814095540.32115-2-rojay@codeaurora.org>
References: <20200814095540.32115-1-rojay@codeaurora.org> <20200814095540.32115-2-rojay@codeaurora.org>
Subject: Re: [PATCH 1/2] i2c: i2c-qcom-geni: Add tx_dma, rx_dma and xfer_len to geni_i2c_dev struct
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
Date:   Tue, 18 Aug 2020 20:39:13 -0700
Message-ID: <159780835380.334488.10270114810481187992@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Roja Rani Yarubandi (2020-08-14 02:55:39)
> Adding tx_dma, rx_dma and xfer length in geni_i2c_dev struct to
> store DMA mapping data to enhance its scope. For example during
> shutdown callback to unmap DMA mapping, these new struct members
> can be used as part of geni_se_tx_dma_unprep and
> geni_se_rx_dma_unprep calls.

Please read about how to write commit text from kernel docs[1]. Hint,
use imperative mood.

>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 7f130829bf01..53ca41f76080 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -86,6 +86,9 @@ struct geni_i2c_dev {
>         u32 clk_freq_out;
>         const struct geni_i2c_clk_fld *clk_fld;
>         int suspended;
> +       dma_addr_t tx_dma;
> +       dma_addr_t rx_dma;
> +       u32 xfer_len;

Why not size_t?

>  };
> =20
>  struct geni_i2c_err_log {
> @@ -352,12 +355,11 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev=
 *gi2c)
>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg=
 *msg,
>                                 u32 m_param)
>  {
> -       dma_addr_t rx_dma;
>         unsigned long time_left;
>         void *dma_buf =3D NULL;
>         struct geni_se *se =3D &gi2c->se;
> -       size_t len =3D msg->len;
> =20
> +       gi2c->xfer_len =3D msg->len;

I'd prefer to keep the local variable and then have=20

	len =3D gi2c->xfer_len =3D msg->len;

>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>                 dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> =20
> @@ -366,9 +368,10 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *=
gi2c, struct i2c_msg *msg,
>         else
>                 geni_se_select_mode(se, GENI_SE_FIFO);
> =20
> -       writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> +       writel_relaxed(gi2c->xfer_len, se->base + SE_I2C_RX_TRANS_LEN);

So that all this doesn't have to change.

> =20
> -       if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
> +       if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, gi2c->xfer_len,
> +                                          &gi2c->rx_dma)) {
>                 geni_se_select_mode(se, GENI_SE_FIFO);
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>                 dma_buf =3D NULL;
> @@ -384,7 +387,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *g=
i2c, struct i2c_msg *msg,
>         if (dma_buf) {
>                 if (gi2c->err)
>                         geni_i2c_rx_fsm_rst(gi2c);
> -               geni_se_rx_dma_unprep(se, rx_dma, len);
> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
>         }
> =20
> @@ -394,12 +397,11 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
>  static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg=
 *msg,
>                                 u32 m_param)
>  {
> -       dma_addr_t tx_dma;
>         unsigned long time_left;
>         void *dma_buf =3D NULL;
>         struct geni_se *se =3D &gi2c->se;
> -       size_t len =3D msg->len;
> =20
> +       gi2c->xfer_len =3D msg->len;

Same comment.

>         if (!of_machine_is_compatible("lenovo,yoga-c630"))
>                 dma_buf =3D i2c_get_dma_safe_msg_buf(msg, 32);
> =20

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
describe-your-changes
