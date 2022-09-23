Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B68BB5E84C9
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 23:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbiIWVWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Sep 2022 17:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiIWVWc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Sep 2022 17:22:32 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8575212260D
        for <linux-i2c@vger.kernel.org>; Fri, 23 Sep 2022 14:22:31 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id k12so908161qkj.8
        for <linux-i2c@vger.kernel.org>; Fri, 23 Sep 2022 14:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VpnQg1rEnQar635HXZ15MaEVyMiJZ00IZjOuCsQVIRY=;
        b=tLP/NCRt9yE2npvnDM82VwJnX7HtCL8AYCn267ODXt9qtLQowR6rbxk6G79QX/eZQ3
         EIq5Zk0atBYuR1B1fHoVbZLtLEKZWxsKbHqmDL+G8/EqxZxOkfhdBESV8fIse2zaoj/i
         91YIicKpUGq++SGSt2xF1hT6LQET5NSCZGjiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VpnQg1rEnQar635HXZ15MaEVyMiJZ00IZjOuCsQVIRY=;
        b=YL0uytbjaiVc4XGvXz3oxkZ7Yj6bgmmzh4V2ooVwtRoXi0mUlcRiDtvsQON9mgy/e4
         3q+lm9WJK71WdlRfaippmn6eivxeqNIYzZ2Htbtr/7iPtCzxIWQAwee9K8kO66t8VQoy
         ktYwlibAtT846Z2p9uUkk81QwcEVnPYDaH1bfC8HB3V8ZTK2EinoK8+brXEQP5wFf4M7
         1siQSxc1s5D/TW8kJ/9nmX3hp8qVoJlgMVebU0h1Ump5My5l42C/TLZy6VuLNihfkm7e
         blTr7swsdjFVd9I+C6tAz6ILgWW+8X/txTxa7RZAPIWtyRz84ZRYsuMPtm02ga/7Kd7Z
         TPjA==
X-Gm-Message-State: ACrzQf3lgMiWLJ37xb8OATGvIRqAa2CnyiDtoJI3khTdUIAKvTnxookr
        UyiW2+Ow8HnaU4LRF2I82b12d/e7smWq5eYALREqsaxTNCnjSHiI
X-Google-Smtp-Source: AMsMyM7nfvry5depoC3V+zXd5yIxGRnpYRnUuTrxtnTMa909iAIZFFf2e3JgOK1x+g4KupF2FicCwlLOVxSSTPYHgxU=
X-Received: by 2002:a05:620a:c41:b0:6b6:bc8:2051 with SMTP id
 u1-20020a05620a0c4100b006b60bc82051mr7120453qki.410.1663968150696; Fri, 23
 Sep 2022 14:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
 <20220921063026.89619-5-matt.ranostay@konsulko.com> <20220921080458.3uue5ooc3svcbmxp@mail.corp.redhat.com>
 <CAJCx=gn0bZp3fToF+LZE+evR2m4nWMueusjysxcrvimH0wRhaA@mail.gmail.com>
 <CAJCx=gmAyae-_VmYpVw=q4+34zraxQ4d2E3DTjjRX4OWqaWwHg@mail.gmail.com> <CAO-hwJJrgb+ncG9mSiE4zZ32oRc_vD0OcrsTa+uXBCTBGRL+nw@mail.gmail.com>
In-Reply-To: <CAO-hwJJrgb+ncG9mSiE4zZ32oRc_vD0OcrsTa+uXBCTBGRL+nw@mail.gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Fri, 23 Sep 2022 14:22:18 -0700
Message-ID: <CAJCx=g=bcZe5RUWZTqmz_2=Q1sDmbwGB8Rd8F47eVkz7e2Zz2A@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] HID: mcp2221: switch i2c registration to devm functions
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Rishi Gupta <gupt21@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 23, 2022 at 12:03 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Fri, Sep 23, 2022 at 1:45 AM Matt Ranostay
> <matt.ranostay@konsulko.com> wrote:
> >
> > On Wed, Sep 21, 2022 at 10:57 AM Matt Ranostay
> > <matt.ranostay@konsulko.com> wrote:
> > >
> > > On Wed, Sep 21, 2022 at 1:05 AM Benjamin Tissoires
> > > <benjamin.tissoires@redhat.com> wrote:
> > > >
> > > > [foreword: please keep Jiri and myself (the HID maintainers) CC-ed to
> > > > the series, as you will need ack from us and we don't necessarily monitor
> > > > every single message on linux-input]
> > > >
> > > > On Sep 20 2022, Matt Ranostay wrote:
> > > > > Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
> > > > > for matching rest of driver initialization, and more concise code.
> > > > >
> > > > > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > > > > ---
> > > > >  drivers/hid/hid-mcp2221.c | 45 +++++++++++++++++----------------------
> > > > >  1 file changed, 19 insertions(+), 26 deletions(-)
> > > > >
> > > > > diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> > > > > index de52e9f7bb8c..7ba63bcd66de 100644
> > > > > --- a/drivers/hid/hid-mcp2221.c
> > > > > +++ b/drivers/hid/hid-mcp2221.c
> > > > > @@ -824,6 +824,14 @@ static int mcp2221_raw_event(struct hid_device *hdev,
> > > > >       return 1;
> > > > >  }
> > > > >
> > > > > +static void mcp2221_hid_remove(void *ptr)
> > > > > +{
> > > > > +     struct hid_device *hdev = ptr;
> > > > > +
> > > > > +     hid_hw_close(hdev);
> > > > > +     hid_hw_stop(hdev);
> > > >
> > > > By default, if you remove the .remove() callback, hid_hw_stop() will get
> > > > automatically called by hid-core.c. So we are now calling it twice,
> > > > which, in a way is not a big deal but it might be an issue in the long
> > > > run.
> > > >
> > > > Generally speaking, in the HID subsystem, that situation doesn't happen
> > > > a lot because hid_hw_start() is usually the last command of probe, and
> > > > we don't need to open the device in the driver itself.
> > > >
> > > > Here, I guess as soon as you add the i2c adapter, you might want to have
> > > > the communication channels ready, and thus you need to have it open
> > > > *before* i2c_add_adapter.
> > > >
> > > > I would suggest the following if you want to keep the devm release of
> > > > stop and close: please put a big fat warning before mcp2221_hid_remove()
> > > > explaining that this is called in devm management, *and* add a function
> > > > that would just return 0 as the .remove() callback with another big fat
> > > > warning explaining that we don't want hid-core.c to call hid_hw_stop()
> > > > because we are doing it ourself through devres.
> > > >
> > >
> > > Yeah maybe best to keep the non-devres if it isn't going to affect how the last
> > > change in this series is trying to implement with iio.
> > >
> > > I'll wait for Jonathan to chime in on this thread.
> > >
> > > > Last, in the HID subsystem, we often interleave non devres with devres
> > > > for resource allocation, given that .remove() will be called before any
> > > > devres release. But that is assuming this ordering is OK, which doesn't
> > > > seem to be the case here. We first need to unregister the i2c adapter
> > > > and then close/stop the HID device.
> >
> > On second thought I2C will be unregistered before the HID calls, since
> > unless I'm totally
> > incorrect device resource management unwinds backwards in the order actions are
> > registered.
>
> Yeah, sorry if it was not clear:
> - .remove() is called *before* any devres action takes place
> - devres action are LIFO, so unwinded backwards as you say
>
> In the general case, a driver does:
> int probe() {
>   void *pointer  = devm_alloc(...)
>   some_more_devm_action(...)
>   hid_hw_start()
>   return 0;
> }
>
> and so the HID start action is the last one, meaning that .remove will
> first call stop and then devres unwind will get called.
>
> But here, in your case, you need hid_hw_start to be called *before*
> devm_i2c_add_adapter(), meaning that the implicit .remove() will mess
> up with the device, so you  are forced to do something about it.
>
> You can either keep a non devm variant, or you can override the
> .remove() of HID to not do anything and do the stop/close in a
> specific devm task, which you did here. You are just missing the
> "let's override .remove() to ensure we keep the device open and
> started while we need it".

Ok, now I understand!

Thanks,

Matt

>
> Cheers,
> Benjamin
>
