Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D0B26E6B5
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 22:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgIQUXe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 16:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgIQUXd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 16:23:33 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9EBC061756
        for <linux-i2c@vger.kernel.org>; Thu, 17 Sep 2020 13:23:33 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d6so1935366pfn.9
        for <linux-i2c@vger.kernel.org>; Thu, 17 Sep 2020 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=YNTKdfmB+28CU+5YDgFT2N85sceXAWnBJsBarav4y+M=;
        b=OdZtCvQoTUU2/0aeiyYVxshd5cH9YBMc46/QsslQPFg6HIoO1W3vPSMnGgfiTjq+hP
         lZ67JaaqUhGORuBb6aOBcA0X1TKytQoCnwaV/I9z+hnCZicJ70GO3vqG78QBvxtraNQK
         wgVLp+lE87xR6i3ugguJM0o/4hMfbe7tXbI4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=YNTKdfmB+28CU+5YDgFT2N85sceXAWnBJsBarav4y+M=;
        b=LQKcYnIo6Hed1lF5MK+QHX+uuOsZGRuhgXC8HzicqM6NREvGxIITQdVTcBCWjAm6sA
         Wzzlt7oZXBQf2xcaqQdDWagJh7mfepPor2PcoVQe4l/3YvCEWXfqFaI9Qeg59pvuejDl
         3MRB6bfJLO6NSAwcLvmixwBvRQy3FDFPExl6+pjL8+UHFQZ0v3+QXOev2H4o+hD9hopC
         uqauLySms4IRR4Lp5vjuZDycsg239/ER4Ne05tJLQDrr0cZ6QfUfgGRl9IlbE4/lqkft
         IFZIufHviE7WojkW3q1Cn5L+bTMU0Es5lJoLaZE5r5REjoFNjXyKvUM7+ib1ZXV8aFMO
         6EQg==
X-Gm-Message-State: AOAM531L8W58pfhF2+wDC7QWTq/8tZnPgkgFD0pLo2Qarp17bSsfvf0d
        xekPsrm39xNfClbgOPdIMKSM9g==
X-Google-Smtp-Source: ABdhPJwUqBYNZMyzzYNYV2v6k7IsJ0N4NSjmQfacJ/Gq4BJeWFAXgI4j+VtUDY8KYuhwwQR1Vc28lQ==
X-Received: by 2002:aa7:989c:0:b029:142:2501:3973 with SMTP id r28-20020aa7989c0000b029014225013973mr13132887pfl.56.1600374213043;
        Thu, 17 Sep 2020 13:23:33 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id 84sm497155pfw.14.2020.09.17.13.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 13:23:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200917122558.23110-1-rojay@codeaurora.org>
References: <20200917122558.23110-1-rojay@codeaurora.org>
Subject: Re: [PATCH V4] i2c: i2c-qcom-geni: Add shutdown callback for i2c
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, saiprakash.ranjan@codeaurora.org,
        gregkh@linuxfoundation.org, mka@chromium.org,
        akashast@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, vkaur@codeaurora.org,
        pyarlaga@codeaurora.org, rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
To:     Roja Rani Yarubandi <rojay@codeaurora.org>, wsa@kernel.org
Date:   Thu, 17 Sep 2020 13:23:30 -0700
Message-ID: <160037421089.4188128.9425314091585708436@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Roja Rani Yarubandi (2020-09-17 05:25:58)
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index dead5db3315a..b0d8043c8cb2 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -86,6 +86,10 @@ struct geni_i2c_dev {
>         u32 clk_freq_out;
>         const struct geni_i2c_clk_fld *clk_fld;
>         int suspended;
> +       void *dma_buf;
> +       size_t xfer_len;
> +       dma_addr_t tx_dma;
> +       dma_addr_t rx_dma;

Do we need both tx_dma and rx_dma? Seems that we use cur->flags to
figure out if the transfer is tx or rx so we could have juat dma_buf and
dma_addr here?

>  };
> =20
>  struct geni_i2c_err_log {
> @@ -307,7 +311,6 @@ static void geni_i2c_abort_xfer(struct geni_i2c_dev *=
gi2c)
> =20
>         spin_lock_irqsave(&gi2c->lock, flags);
>         geni_i2c_err(gi2c, GENI_TIMEOUT);
> -       gi2c->cur =3D NULL;

This looks concerning. We're moving this out from under the spinlock.
The irq handler in this driver seems to hold the spinlock all the time
while processing and this function grabs it here to keep cur consistent
when aborting the transfer due to a timeout. Otherwise it looks like the
irqhandler can race with this and try to complete the transfer while
it's being torn down here.

>         geni_se_abort_m_cmd(&gi2c->se);
>         spin_unlock_irqrestore(&gi2c->lock, flags);
>         do {
> @@ -349,10 +352,62 @@ static void geni_i2c_tx_fsm_rst(struct geni_i2c_dev=
 *gi2c)
>                 dev_err(gi2c->se.dev, "Timeout resetting TX_FSM\n");
>  }
> =20
> +static void geni_i2c_rx_msg_cleanup(struct geni_i2c_dev *gi2c)

So maybe pass cur to this function?

> +{
> +       struct geni_se *se =3D &gi2c->se;
> +
> +       gi2c->cur_rd =3D 0;
> +       if (gi2c->dma_buf) {
> +               if (gi2c->err)
> +                       geni_i2c_rx_fsm_rst(gi2c);
> +               geni_se_rx_dma_unprep(se, gi2c->rx_dma, gi2c->xfer_len);
> +               i2c_put_dma_safe_msg_buf(gi2c->dma_buf, gi2c->cur, !gi2c-=
>err);
> +       }
> +}
> +
> +static void geni_i2c_tx_msg_cleanup(struct geni_i2c_dev *gi2c)

And this one?

> +{
> +       struct geni_se *se =3D &gi2c->se;
> +
> +       gi2c->cur_wr =3D 0;
> +       if (gi2c->dma_buf) {
> +               if (gi2c->err)
> +                       geni_i2c_tx_fsm_rst(gi2c);
> +               geni_se_tx_dma_unprep(se, gi2c->tx_dma, gi2c->xfer_len);
> +               i2c_put_dma_safe_msg_buf(gi2c->dma_buf, gi2c->cur, !gi2c-=
>err);
> +       }
> +}
> +
> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> +{
> +       int ret;
> +       u32 geni_status;
> +
> +       /* Resume device, as runtime suspend can happen anytime during tr=
ansfer */
> +       ret =3D pm_runtime_get_sync(gi2c->se.dev);
> +       if (ret < 0) {
> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n", re=
t);
> +               return;
> +       }
> +
> +       geni_status =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);

And this probably needs to hold the lock?

> +       if (!(geni_status & M_GENI_CMD_ACTIVE))
> +               goto out;
> +
> +       geni_i2c_abort_xfer(gi2c);
> +       if (gi2c->cur->flags & I2C_M_RD)
> +               geni_i2c_rx_msg_cleanup(gi2c);
> +       else
> +               geni_i2c_tx_msg_cleanup(gi2c);
> +       gi2c->cur =3D NULL;

until here?

> +out:
> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> +}
> +
>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg=
 *msg,
>                                 u32 m_param)
>  {
> -       dma_addr_t rx_dma;
> +       dma_addr_t rx_dma =3D 0;
>         unsigned long time_left;
>         void *dma_buf =3D NULL;
>         struct geni_se *se =3D &gi2c->se;
> @@ -372,6 +427,10 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *=
gi2c, struct i2c_msg *msg,
>                 geni_se_select_mode(se, GENI_SE_FIFO);
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>                 dma_buf =3D NULL;
> +       } else {
> +               gi2c->xfer_len =3D len;
> +               gi2c->rx_dma =3D rx_dma;
> +               gi2c->dma_buf =3D dma_buf;
>         }
> =20
>         geni_se_setup_m_cmd(se, I2C_READ, m_param);
> @@ -380,13 +439,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *=
gi2c, struct i2c_msg *msg,
>         if (!time_left)
>                 geni_i2c_abort_xfer(gi2c);
> =20
> -       gi2c->cur_rd =3D 0;
> -       if (dma_buf) {
> -               if (gi2c->err)
> -                       geni_i2c_rx_fsm_rst(gi2c);
> -               geni_se_rx_dma_unprep(se, rx_dma, len);
> -               i2c_put_dma_safe_msg_buf(dma_buf, msg, !gi2c->err);
> -       }
> +       geni_i2c_rx_msg_cleanup(gi2c);
> =20
>         return gi2c->err;
>  }

It may make sense to extract the cleanup stuff into another patch. Then
have a patch after that which does the shutdown hook. So three patches
total.

> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni=
-se.c
> index d0e4f520cff8..0216b38c1e9a 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -705,7 +705,7 @@ void geni_se_tx_dma_unprep(struct geni_se *se, dma_ad=
dr_t iova, size_t len)
>  {
>         struct geni_wrapper *wrapper =3D se->wrapper;
> =20
> -       if (iova && !dma_mapping_error(wrapper->dev, iova))
> +       if (!dma_mapping_error(wrapper->dev, iova))
>                 dma_unmap_single(wrapper->dev, iova, len, DMA_TO_DEVICE);
>  }
>  EXPORT_SYMBOL(geni_se_tx_dma_unprep);
> @@ -722,7 +722,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_ad=
dr_t iova, size_t len)
>  {
>         struct geni_wrapper *wrapper =3D se->wrapper;
> =20
> -       if (iova && !dma_mapping_error(wrapper->dev, iova))
> +       if (!dma_mapping_error(wrapper->dev, iova))
>                 dma_unmap_single(wrapper->dev, iova, len, DMA_FROM_DEVICE=
);
>  }
>  EXPORT_SYMBOL(geni_se_rx_dma_unprep);

I'd make this a different patch. Nothing depends on this change, right?
