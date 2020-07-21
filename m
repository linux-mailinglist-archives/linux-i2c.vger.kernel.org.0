Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762FC227863
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 07:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgGUF7R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 01:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgGUF7Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 01:59:16 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B6EC0619D6
        for <linux-i2c@vger.kernel.org>; Mon, 20 Jul 2020 22:59:16 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id f16so1122169pjt.0
        for <linux-i2c@vger.kernel.org>; Mon, 20 Jul 2020 22:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=KMmzvRDJd+7JQh3nAfR3C392m0BpTUJ+3ePAUF20ipM=;
        b=Rxv84i0QAHjDtaiOwh/2J3sKXar2+ERm+ATC8Q8Xfyc6nMJXbwVIhxRyXUP7SVjfjn
         eQwUEXhTG6oJTATxSLbFZDVKCQZ8LHhZvaqcBbUlVl2wUb8bRcMtUal/mqZnQfb0LhnE
         RFJNs7S2GBbfDx2RAk/LtKpF31pDh4oP37amc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=KMmzvRDJd+7JQh3nAfR3C392m0BpTUJ+3ePAUF20ipM=;
        b=RzG8eEtXH+GkvVamrEti7MWr5XV+iJsPvZX15+qU9tBgEZ4wGjlP6hvJ/mSMArzaZH
         K606dOSL7sClqgDGxFXoSU8idtsdFFTvCORDXHINTfT7L9Bb0IZ44Xn7BZex2NlFRVfm
         mv7CUXPoNdk2vodegq4Jq0Zy4DIRJeSTiAHeaT5EFipVlbZVA6BTEKcVGMJHfg5TL+eB
         /XGMChhqo4SMx8/1ABePgI7Ww1C2+z1VZ3pxwlH69ax0HB8dnQWwyWpLLhsjjno2gFsw
         zwGgL3N2TwKPRk+Ds8LJCJq6m1Dak2yb2JUPKneYN3hCIg8v6lr09Kc+lQnLEezDIJBN
         DCjA==
X-Gm-Message-State: AOAM533vzDmpIjlARGtD4IgWzF2ai5oA7/My+bN00ROh9HWM5jQh2E7N
        kYU9CQKIW80W7sAZ1P+s2L/zZWdh6Do=
X-Google-Smtp-Source: ABdhPJyPsf7kVDCbzPver/0zOXuRkOwd1jKCYu5DVQc3foP0eJly1X6oGmB7HiIREep2HWy6KWn53A==
X-Received: by 2002:a17:90b:46d0:: with SMTP id jx16mr2894431pjb.222.1595311156227;
        Mon, 20 Jul 2020 22:59:16 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id nh14sm1594205pjb.4.2020.07.20.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 22:59:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
References: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Fix DMA transfer race
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Wolfram Sang <wsa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>
Date:   Mon, 20 Jul 2020 22:59:14 -0700
Message-ID: <159531115483.3847286.18280088484118119899@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Douglas Anderson (2020-07-20 17:24:53)
> When I have KASAN enabled on my kernel and I start stressing the
> touchscreen my system tends to hang.  The touchscreen is one of the
> only things that does a lot of big i2c transfers and ends up hitting
> the DMA paths in the geni i2c driver.  It appears that KASAN adds
> enough delay in my system to tickle a race condition in the DMA setup
> code.
>=20
> When the system hangs, I found that it was running the geni_i2c_irq()
> over and over again.  It had these:
>=20
> m_stat   =3D 0x04000080
> rx_st    =3D 0x30000011
> dm_tx_st =3D 0x00000000
> dm_rx_st =3D 0x00000000
> dma      =3D 0x00000001
>=20
> Notably we're in DMA mode but are getting M_RX_IRQ_EN and
> M_RX_FIFO_WATERMARK_EN over and over again.
>=20
> Putting some traces in geni_i2c_rx_one_msg() showed that when we
> failed we were getting to the start of geni_i2c_rx_one_msg() but were
> never executing geni_se_rx_dma_prep().
>=20
> I believe that the problem here is that we are writing the transfer
> length and setting up the geni command before we run
> geni_se_rx_dma_prep().  If a transfer makes it far enough before we do
> that then we get into the state I have observed.  Let's change the
> order, which seems to work fine.

Does the length matter or the I2C_READ m_cmd matter? Or somehow both?
Otherwise it sounds correct to me that we're configuring it to start the
read before mapping the buffer.

>=20
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm=
 GENI I2C controller")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 18d1e4fd4cf3..21e27f10510a 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -366,15 +366,15 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
>         else
>                 geni_se_select_mode(se, GENI_SE_FIFO);
> =20
> -       writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> -       geni_se_setup_m_cmd(se, I2C_READ, m_param);
> -
>         if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
>                 geni_se_select_mode(se, GENI_SE_FIFO);
>                 i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
>                 dma_buf =3D NULL;
>         }
> =20

I worry that we also need a dmb() here to make sure the dma buffer is
properly mapped before this write to the device is attempted. But it may
only matter to be before the I2C_READ.

> +       writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> +       geni_se_setup_m_cmd(se, I2C_READ, m_param);
> +
>         time_left =3D wait_for_completion_timeout(&gi2c->done, XFER_TIMEO=
UT);
>         if (!time_left)
>                 geni_i2c_abort_xfer(gi2c);
