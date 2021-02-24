Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43DCF3237A4
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Feb 2021 08:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234334AbhBXHHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Feb 2021 02:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbhBXHHP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Feb 2021 02:07:15 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A577EC06178A
        for <linux-i2c@vger.kernel.org>; Tue, 23 Feb 2021 23:06:34 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id n10so863090pgl.10
        for <linux-i2c@vger.kernel.org>; Tue, 23 Feb 2021 23:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=7filuQzM3PPCew10cLsd+/0g628RiDn4obN6lLezpSc=;
        b=mZZX/EGIjnB4uQuujiuMKYg1F90fFxEsLP5wBKXKMZZ0/VRHfLvUJmWVQMsh7hn3oC
         POJo4IRMdSmQaNLZxD85lyneVPaoxPuwCFx+rCnxSlpsUwHxu/ZsV7FufEa7JoVDzypW
         d3qgNzk6bQsa0yZrbGJRTb1qRrBaQ+7DylFhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=7filuQzM3PPCew10cLsd+/0g628RiDn4obN6lLezpSc=;
        b=RS5LlkcSXMrBmAmHL5YrzaYEmk1O1ycV4pKzjc0+n+0HjBfLNM20aVqLzjj/vjbo0l
         oNexxwEq8eCL+X4SAZtaRz/WSJ9ukSmrKcnfGS8SnfTPZBvOmDl5UuAtutIyal5JQjms
         T8RooJjqIclzbncw7lN87SAub4n/Hgys35EY4P4wfKYctB6LKWCURN1cF0sWHYjeQsij
         MsY6kx6rOY3NesC/RG8LNfVGWDz4XbyHcz2GSMG9QejqHeor8MDrLgkqrA9ULpIkWUo2
         GP6Rq3ro0as8LYMfWO4vqiIT2MrXG7Hf1S+4TPaPsQMtGEww+/Mf6xWAx+qEOZ4rc65z
         bD5Q==
X-Gm-Message-State: AOAM530A1KAqVt6yjw8NsJUa/5F2gOSLwUnA3sCi8SS9/QqEnN8WGfqF
        wT0fJxmKTTcVhzxZzmSKIfKYDA==
X-Google-Smtp-Source: ABdhPJya7bcsUCvP9njl0gp25N2HQyAv9CG7JucH2KgHeK39shLD0REzuuejwM4p4tpQJy/Aw3wlJA==
X-Received: by 2002:a63:134c:: with SMTP id 12mr27479803pgt.262.1614150393980;
        Tue, 23 Feb 2021 23:06:33 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:933:e73c:97ad:add3])
        by smtp.gmail.com with ESMTPSA id z11sm1076222pgk.65.2021.02.23.23.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 23:06:33 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9ec10130df230a0ff078d9eec47e94b2@codeaurora.org>
References: <20210108150545.2018-1-rojay@codeaurora.org> <20210108150545.2018-2-rojay@codeaurora.org> <161052087940.3661239.14609415796697267628@swboyd.mtv.corp.google.com> <9ec10130df230a0ff078d9eec47e94b2@codeaurora.org>
Subject: Re: [PATCH V8 1/1] i2c: i2c-qcom-geni: Add shutdown callback for i2c
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     wsa@kernel.org, dianders@chromium.org,
        saiprakash.ranjan@codeaurora.org, gregkh@linuxfoundation.org,
        mka@chromium.org, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        rnayak@codeaurora.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org
To:     rojay@codeaurora.org
Date:   Tue, 23 Feb 2021 23:06:31 -0800
Message-ID: <161415039142.1254594.3043511127113195221@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Quoting rojay@codeaurora.org (2021-02-18 06:15:17)
> Hi Stephen,
>=20
> On 2021-01-13 12:24, Stephen Boyd wrote:
> > Quoting Roja Rani Yarubandi (2021-01-08 07:05:45)
> >> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c=20
> >> b/drivers/i2c/busses/i2c-qcom-geni.c
> >> index 214b4c913a13..c3f584795911 100644
> >> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> >> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> >> @@ -375,6 +375,32 @@ static void geni_i2c_tx_msg_cleanup(struct=20
> >> geni_i2c_dev *gi2c,
> >>         }
> >>  }
> >>=20
> >> +static void geni_i2c_stop_xfer(struct geni_i2c_dev *gi2c)
> >> +{
> >> +       int ret;
> >> +       u32 geni_status;
> >> +       struct i2c_msg *cur;
> >> +
> >> +       /* Resume device, as runtime suspend can happen anytime during=
=20
> >> transfer */
> >> +       ret =3D pm_runtime_get_sync(gi2c->se.dev);
> >> +       if (ret < 0) {
> >> +               dev_err(gi2c->se.dev, "Failed to resume device: %d\n",=
=20
> >> ret);
> >> +               return;
> >> +       }
> >> +
> >> +       geni_status =3D readl_relaxed(gi2c->se.base + SE_GENI_STATUS);
> >> +       if (geni_status & M_GENI_CMD_ACTIVE) {
> >> +               cur =3D gi2c->cur;
> >=20
> > Why don't we need to hold the spinlock gi2c::lock here?
> >=20
>=20
> I am not seeing any race here. May I know which race are you suspecting=20
> here?

Sorry there are long delays between posting and replies to my review
comments. It takes me some time to remember what we're talking about
because this patch has dragged on for many months.

So my understanding is that gi2c::lock protects the 'cur' pointer. I
imagine this scenario might go bad

  CPU0                      CPU1
  ----                      ----
  geni_i2c_stop_xfer()     =20
   ...                      geni_i2c_rx_one_msg()
			     gi2c->cur =3D cur1;
   cur =3D gi2c->cur;
   ...                       geni_i2c_tx_one_msg()
			     gi2c->cur =3D cur2;
   geni_i2c_abort_xfer()
    <uses cur2>
   if (cur->flags & I2C_M_RD)
    <uses cur1 for the condition and call; oops that's bad>

It's almost like we should combine the geni_i2c_abort_xfer() logic with
the rx/tx message cleanup functions so that it's all done under one
lock. Unfortunately it's complicated by the fact that there are various
completion waiting timeouts involved. Fun!

But even after all that, I don't see how the geni_i2c_stop_xfer() puts a
stop to future calls to geni_i2c_rx_one_msg() or geni_i2c_tx_one_msg().
The hardware isn't disabled from what I can tell. The irq isn't
disabled, the clks aren't turned off, etc. What is to stop an i2c device
from trying to use the bus after this shutdown function is called? If
anything, this function looks like a "flush", where we flush out any
pending transfer. Where's the "plug" operation that prevents any future
operations from following this call?

BTW, I see this is merged upstream. That's great, but it seems broken.
Please fix it or revert it out.

>=20
> >> +               geni_i2c_abort_xfer(gi2c);
> >> +               if (cur->flags & I2C_M_RD)
> >> +                       geni_i2c_rx_msg_cleanup(gi2c, cur);
> >> +               else
> >> +                       geni_i2c_tx_msg_cleanup(gi2c, cur);
> >> +       }
> >> +
> >> +       pm_runtime_put_sync_suspend(gi2c->se.dev);
> >> +}
> >> +
> >>  static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct=20
> >> i2c_msg *msg,
> >>                                 u32 m_param)
> >>  {
