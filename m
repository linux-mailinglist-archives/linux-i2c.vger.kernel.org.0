Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A0C2288A2
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 20:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbgGUSz4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 14:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbgGUSzy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Jul 2020 14:55:54 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB12C0619DA
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jul 2020 11:55:54 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id f16so2126110pjt.0
        for <linux-i2c@vger.kernel.org>; Tue, 21 Jul 2020 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=lpeIcRunQtO1GGzh3TnMCT3eJ1HuVXVaMnC4hvPTV4c=;
        b=ZraJZ4OwJkwVmBY42CcXjaMSGWMq/bEwpXlTSwQGzBF9ZA0nVcvlHRAaAUTae7CEcJ
         HRvrYykoG7LZQk21X2pu+3X9ko3Q2QQcYkEqwDeMFUMHzm0x8087W8Tob7xr2aF0EG7F
         SnjxzWSKMqw16bMmbqJXylH4/GIyEVkaBWcUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=lpeIcRunQtO1GGzh3TnMCT3eJ1HuVXVaMnC4hvPTV4c=;
        b=ExOP6CJbOU7DF2+4ANCI8hP6pMKEs3yzfvo2E494aatvXdknLSb7vTl07Y+0cbzM/R
         F5W2gYzJDLPmLndcaJysLN/ynY31N/IQesuF1VFIKFW/pNE1xG9dmE/rU2zG9nCbuzyX
         nmVmG0cVSDJsEBA98EOSUixF7lxa/PNFFhV1j+gUcKvEoHQ1WR91A++dW01eKEpjNI7g
         chuWCADDxFlfkFyd3xZDcZtka9wElDhmVAWYFU/kprb871lsQ851a+gaAUu9iryT4mL6
         73dOf3JhP2gTQ5wuzcLwNc43ZwqSWZFY4xvln6CvCBu82gmoZfYRd4bqoxqci5BwYyMc
         MxGg==
X-Gm-Message-State: AOAM530R2LENfl9R66vdIF7Ze0XkMbQH8pUELxsjl/Z7nINw6R+FtNXn
        owf5aNDZanD4wJhbOB9xf28M9g==
X-Google-Smtp-Source: ABdhPJx2s7en67gEWbb+sWP2Jr0NJevBxR5Urhrc0eYJJ/jKRPIBgjMxDqiQ1yQJRt75lnNByN9MpA==
X-Received: by 2002:a17:90a:a887:: with SMTP id h7mr6323580pjq.0.1595357754027;
        Tue, 21 Jul 2020 11:55:54 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id e191sm20976433pfh.42.2020.07.21.11.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 11:55:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAD=FV=X=NDym3V31dQ8c341UwQm9pDybUCR8jFF1JR99XeVKVw@mail.gmail.com>
References: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid> <159531115483.3847286.18280088484118119899@swboyd.mtv.corp.google.com> <159531527579.3847286.1254956818647049462@swboyd.mtv.corp.google.com> <CAD=FV=X=NDym3V31dQ8c341UwQm9pDybUCR8jFF1JR99XeVKVw@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Fix DMA transfer race
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Date:   Tue, 21 Jul 2020 11:55:52 -0700
Message-ID: <159535775253.3847286.5195740102798837524@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting Doug Anderson (2020-07-21 09:18:35)
> On Tue, Jul 21, 2020 at 12:08 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Stephen Boyd (2020-07-20 22:59:14)
> > >
> > > I worry that we also need a dmb() here to make sure the dma buffer is
> > > properly mapped before this write to the device is attempted. But it =
may
> > > only matter to be before the I2C_READ.
> > >
> >
> > I'm suggesting this patch instead where we make geni_se_setup_m_cmd()
> > use a writel() so that it has the proper barrier semantics to wait for
> > the other memory writes that happened in program order before this point
> > to complete before the device is kicked to do a read or a write.
>=20
> Are you saying that dma_map_single() isn't guaranteed to have a
> barrier or something?  I tried to do some searching and found a thread
> [1] where someone tried to add a barrierless variant of them.  To me
> that means that the current APIs have barriers.
>=20
> ...or is there something else you're worried about?

I'm not really thinking about dma_map_single() having a barrier or not.
The patch you mention is from 2010. Many things have changed in the last
decade. Does it have barrier semantics? The presence of a patch on the
mailing list doesn't mean much.

Specifically I'm looking at "KERNEL I/O BARRIER EFFECTS" of
Documentation/memory-barriers.txt and noticing that this driver is using
relaxed IO accessors meaning that the reads and writes aren't ordered
with respect to other memory accesses. They're only ordered to
themselves within the same device. I'm concerned that the CPU will issue
the IO access to start the write DMA operation before the buffer is
copied over due to out of order execution.

I'm not an expert in this area, but this is why we ask driver authors to
use the non-relaxed accessors because they have the appropriate
semantics built in to make them easy to reason about. They do what they
say when they say to do it.

>=20
>=20
> > ----8<----
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2=
c-qcom-geni.c
> > index 18d1e4fd4cf3..7f130829bf01 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -367,7 +367,6 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
> >                 geni_se_select_mode(se, GENI_SE_FIFO);
> >
> >         writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
> > -       geni_se_setup_m_cmd(se, I2C_READ, m_param);
> >
> >         if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
> >                 geni_se_select_mode(se, GENI_SE_FIFO);
> > @@ -375,6 +374,8 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
> >                 dma_buf =3D NULL;
> >         }
> >
> > +       geni_se_setup_m_cmd(se, I2C_READ, m_param);
>=20
> I guess it's true that we only need the setup_m_cmd moved.

Alright cool. That makes more sense.

>=20
>=20
> > +
> >         time_left =3D wait_for_completion_timeout(&gi2c->done, XFER_TIM=
EOUT);
> >         if (!time_left)
> >                 geni_i2c_abort_xfer(gi2c);
> > @@ -408,7 +409,6 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
> >                 geni_se_select_mode(se, GENI_SE_FIFO);
> >
> >         writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
> > -       geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
> >
> >         if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
> >                 geni_se_select_mode(se, GENI_SE_FIFO);
> > @@ -416,6 +416,8 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev =
*gi2c, struct i2c_msg *msg,
> >                 dma_buf =3D NULL;
> >         }
> >
> > +       geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
> > +
>=20
> True, it's probably safer to do the TX too even if I'm not seeing
> problems there.  Of course, I don't think I'm doing any large writes
> so probably never triggering this path anyway.

Right, this is just by inspection of the code to see that it's the same
scenario, kicking off the DMA operation at the device before mapping the
buffer.

>=20
>=20
> >         if (!dma_buf) /* Get FIFO IRQ */
> >                 writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
> >
