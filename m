Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAA695BBF72
	for <lists+linux-i2c@lfdr.de>; Sun, 18 Sep 2022 21:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiIRTB4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 18 Sep 2022 15:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiIRTBz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 18 Sep 2022 15:01:55 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7449F13F9E
        for <linux-i2c@vger.kernel.org>; Sun, 18 Sep 2022 12:01:54 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id z191so21364927iof.10
        for <linux-i2c@vger.kernel.org>; Sun, 18 Sep 2022 12:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ooiGqjcIB0MZPUmW2VIddMDluaog9++d6Do4yj5HvYA=;
        b=Hr5zwsquGX2UujKAlItKE/8Hhh1coBl0TT63NyiRfChIVi/gIIfIFr4U9aE/AjJ9RI
         2MJAEtqdc1EcMoeUopuDKAheALQXzCl6BNOtz404H0U6pANgpukjOZymbz3XXmgGU3Hr
         f/OQrWzSy2qVWRPyGA476YypvM/fySs9I7nQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ooiGqjcIB0MZPUmW2VIddMDluaog9++d6Do4yj5HvYA=;
        b=txb9P92feAE1Zv7MjLMX/EPmEvBQ8CAgIqxK2t6RO2NQIJZvdvGY4zFme7szxrswcI
         NiMk6itdPDPxDyxL1Gk9E5GUWokarn+fguX4cieaK02J+iONu9nqc2PgiDPhy5Kcs6So
         LeZh59LGO5lHAs5zjkCmWeMKBItlv2ulgdP7dwkv1LffyajxaiOMkeMisMSCHKaCBsbu
         6nAIriCvIyE1RLMdTfY3aIvk+zLBodp0JpyTukQ3/btSdnuPVfZZZhXIpHhgTw6y6yVX
         IeV8gksyrLACGuiRI2TM3Rus5yZT5bl21DMcp1IRnV2MgBkVrwfKIiJlyD+e7VlprqT+
         ho7Q==
X-Gm-Message-State: ACrzQf2IwAbXywAb+waxFtqWccWYS591KbRlYB9JboxkrdJ2261EoSIO
        xvFisNmBVIjrKKdqB8UWCu3Hd2PVRAb8Hp6QOJUXIg==
X-Google-Smtp-Source: AMsMyM4KQhftKSTWvS4+r8dq6sSwOkl6/WHVqlWjc97EFslZlkJMZ9wmMhoZOMgs0N5BTNi1QmDbatXQgLtyQ1eKNIs=
X-Received: by 2002:a05:6638:35a1:b0:35a:27ec:b00b with SMTP id
 v33-20020a05663835a100b0035a27ecb00bmr6682119jal.245.1663527713796; Sun, 18
 Sep 2022 12:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220912173202.16723-1-matt.ranostay@konsulko.com>
 <20220912173202.16723-5-matt.ranostay@konsulko.com> <20220918163933.0e52b581@jic23-huawei>
In-Reply-To: <20220918163933.0e52b581@jic23-huawei>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Sun, 18 Sep 2022 12:01:42 -0700
Message-ID: <CAJCx=gkiHSyCUcU8+3+G8JMYoY4ucxFBOJojQUsRFGbipw7ZKQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] HID: mcp2221: switch i2c registration to devm functions
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     gupt21@gmail.com, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 18, 2022 at 8:39 AM Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Mon, 12 Sep 2022 10:32:01 -0700
> Matt Ranostay <matt.ranostay@konsulko.com> wrote:
>
> > Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
> > for matching rest of driver initialization, and more concise code.
> >
> > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
>
> This doesn't necessarily make things worse, but I'm not keen on the
> potential ordering issues that result form mixed devm / non-devm
> in this function.  It's too hard too think about!
>
> Easiest way to avoid people staring at the code to figure out if
> there are nasty issues would be to take the whole thing devm
> with a couple of devm_add_action_or_reset() to handle the
> hid_hw_stop()/hid_hw_close() at right points in the error / remove
> flows.

Good idea. Even if .remove() may be valid with the device resource
management it is a bit confusing.

- Matt

>
> Jonathan
>
>
> > ---
> >  drivers/hid/hid-mcp2221.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> > index de52e9f7bb8c..29e69576c3d4 100644
> > --- a/drivers/hid/hid-mcp2221.c
> > +++ b/drivers/hid/hid-mcp2221.c
> > @@ -873,7 +873,7 @@ static int mcp2221_probe(struct hid_device *hdev,
> >                       "MCP2221 usb-i2c bridge on hidraw%d",
> >                       ((struct hidraw *)hdev->hidraw)->minor);
> >
> > -     ret = i2c_add_adapter(&mcp->adapter);
> > +     ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
> >       if (ret) {
> >               hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
> >               goto err_i2c;
> > @@ -884,7 +884,7 @@ static int mcp2221_probe(struct hid_device *hdev,
> >       mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
> >       if (!mcp->gc) {
> >               ret = -ENOMEM;
> > -             goto err_gc;
> > +             goto err_i2c;
> >       }
> >
> >       mcp->gc->label = "mcp2221_gpio";
> > @@ -900,12 +900,10 @@ static int mcp2221_probe(struct hid_device *hdev,
> >
> >       ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
> >       if (ret)
> > -             goto err_gc;
> > +             goto err_i2c;
> >
> >       return 0;
> >
> > -err_gc:
> > -     i2c_del_adapter(&mcp->adapter);
> >  err_i2c:
> >       hid_hw_close(mcp->hdev);
> >  err_hstop:
> > @@ -917,7 +915,6 @@ static void mcp2221_remove(struct hid_device *hdev)
> >  {
> >       struct mcp2221 *mcp = hid_get_drvdata(hdev);
> >
> > -     i2c_del_adapter(&mcp->adapter);
> >       hid_hw_close(mcp->hdev);
> >       hid_hw_stop(mcp->hdev);
> >  }
>
