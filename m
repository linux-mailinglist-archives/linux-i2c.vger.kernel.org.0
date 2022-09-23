Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1B35E747F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 09:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiIWHDZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Sep 2022 03:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbiIWHDX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Sep 2022 03:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B74811ED48
        for <linux-i2c@vger.kernel.org>; Fri, 23 Sep 2022 00:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663916601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WhF4nCz6J0FLg0zxw6EoEvz5+Uahw9QLMXSb+VEZaaQ=;
        b=hfDy0WKN2K1B/h74dhzJ1mMND8SFdNvxDUHmQ6F5UzhEu9C5hns0iGwk5wnvol2iTNeH1w
        b51ooxBBltloIUItNN91c6esHFnX/UVBuDIzjEvf8Z4e7tkAHQ9OVOVjlnfaKJ/35q8Pf5
        rzAW4BJ+EzjCLrIzNO4vyPr0Dlrw3k0=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-101-3OEbyMW8N0yi0CPaD9JX4A-1; Fri, 23 Sep 2022 03:03:18 -0400
X-MC-Unique: 3OEbyMW8N0yi0CPaD9JX4A-1
Received: by mail-il1-f198.google.com with SMTP id f4-20020a056e020b4400b002f6681cca5bso5165808ilu.14
        for <linux-i2c@vger.kernel.org>; Fri, 23 Sep 2022 00:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WhF4nCz6J0FLg0zxw6EoEvz5+Uahw9QLMXSb+VEZaaQ=;
        b=ey8doBqrs7t3sI3SC37xoJAWI5OBOfZLcIC6pUXSUWMLsTo2Izd2CZw37Y4xnzqEWO
         QOKeixwxgS6d/kfsxEvmv2YJLbjm39WRGfDIop64zD//+UL0eTZjZ4U4gCXDd571Lr9V
         gEURGVCFqRV42an15yANfrbjxamV699bZTmRiLDMU0O69xLmGfo4yfdQpdpj/vrptpzY
         CVJHEz4sB5CsJXgmiHfQ+vA1mrzTg1t8elq0kbKBoBJQVwoQrTm4rlxhsFjDpJu6Ewcd
         WEuf9KamqKnTl+51jDpMDP0UYvNI99jpdS//gYjd5N7laBaNKgNMArSlYnBYGAoDdfwY
         zhaQ==
X-Gm-Message-State: ACrzQf2NnlWBC7bbPXLO/LXvdAG3a9oqPXGUo3qHPU4MNIxBEOn5neQv
        9zNJeg/yJVWaAgCWmiPfIDrUU/k1TGzu7m963S7RpLcIAmXkGPu1zQ3GI5UAKmIIDmNjcOzmeZf
        41ALcOnkbraUSjyKIzt24ZNEgjxyYHVGlhALL
X-Received: by 2002:a05:6e02:19cb:b0:2eb:3cd1:105e with SMTP id r11-20020a056e0219cb00b002eb3cd1105emr3334303ill.235.1663916597884;
        Fri, 23 Sep 2022 00:03:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM53+K2SnALqhdFlbb4G59xccKJB+PFnRwj336JHvd8f3x9tqUxq7UFJu2yzqFVEWgzOZyzmQPnf1bV43pUTa3M=
X-Received: by 2002:a05:6e02:19cb:b0:2eb:3cd1:105e with SMTP id
 r11-20020a056e0219cb00b002eb3cd1105emr3334290ill.235.1663916597644; Fri, 23
 Sep 2022 00:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
 <20220921063026.89619-5-matt.ranostay@konsulko.com> <20220921080458.3uue5ooc3svcbmxp@mail.corp.redhat.com>
 <CAJCx=gn0bZp3fToF+LZE+evR2m4nWMueusjysxcrvimH0wRhaA@mail.gmail.com> <CAJCx=gmAyae-_VmYpVw=q4+34zraxQ4d2E3DTjjRX4OWqaWwHg@mail.gmail.com>
In-Reply-To: <CAJCx=gmAyae-_VmYpVw=q4+34zraxQ4d2E3DTjjRX4OWqaWwHg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 23 Sep 2022 09:03:06 +0200
Message-ID: <CAO-hwJJrgb+ncG9mSiE4zZ32oRc_vD0OcrsTa+uXBCTBGRL+nw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] HID: mcp2221: switch i2c registration to devm functions
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     Rishi Gupta <gupt21@gmail.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 23, 2022 at 1:45 AM Matt Ranostay
<matt.ranostay@konsulko.com> wrote:
>
> On Wed, Sep 21, 2022 at 10:57 AM Matt Ranostay
> <matt.ranostay@konsulko.com> wrote:
> >
> > On Wed, Sep 21, 2022 at 1:05 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > [foreword: please keep Jiri and myself (the HID maintainers) CC-ed to
> > > the series, as you will need ack from us and we don't necessarily monitor
> > > every single message on linux-input]
> > >
> > > On Sep 20 2022, Matt Ranostay wrote:
> > > > Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
> > > > for matching rest of driver initialization, and more concise code.
> > > >
> > > > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > > > ---
> > > >  drivers/hid/hid-mcp2221.c | 45 +++++++++++++++++----------------------
> > > >  1 file changed, 19 insertions(+), 26 deletions(-)
> > > >
> > > > diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> > > > index de52e9f7bb8c..7ba63bcd66de 100644
> > > > --- a/drivers/hid/hid-mcp2221.c
> > > > +++ b/drivers/hid/hid-mcp2221.c
> > > > @@ -824,6 +824,14 @@ static int mcp2221_raw_event(struct hid_device *hdev,
> > > >       return 1;
> > > >  }
> > > >
> > > > +static void mcp2221_hid_remove(void *ptr)
> > > > +{
> > > > +     struct hid_device *hdev = ptr;
> > > > +
> > > > +     hid_hw_close(hdev);
> > > > +     hid_hw_stop(hdev);
> > >
> > > By default, if you remove the .remove() callback, hid_hw_stop() will get
> > > automatically called by hid-core.c. So we are now calling it twice,
> > > which, in a way is not a big deal but it might be an issue in the long
> > > run.
> > >
> > > Generally speaking, in the HID subsystem, that situation doesn't happen
> > > a lot because hid_hw_start() is usually the last command of probe, and
> > > we don't need to open the device in the driver itself.
> > >
> > > Here, I guess as soon as you add the i2c adapter, you might want to have
> > > the communication channels ready, and thus you need to have it open
> > > *before* i2c_add_adapter.
> > >
> > > I would suggest the following if you want to keep the devm release of
> > > stop and close: please put a big fat warning before mcp2221_hid_remove()
> > > explaining that this is called in devm management, *and* add a function
> > > that would just return 0 as the .remove() callback with another big fat
> > > warning explaining that we don't want hid-core.c to call hid_hw_stop()
> > > because we are doing it ourself through devres.
> > >
> >
> > Yeah maybe best to keep the non-devres if it isn't going to affect how the last
> > change in this series is trying to implement with iio.
> >
> > I'll wait for Jonathan to chime in on this thread.
> >
> > > Last, in the HID subsystem, we often interleave non devres with devres
> > > for resource allocation, given that .remove() will be called before any
> > > devres release. But that is assuming this ordering is OK, which doesn't
> > > seem to be the case here. We first need to unregister the i2c adapter
> > > and then close/stop the HID device.
>
> On second thought I2C will be unregistered before the HID calls, since
> unless I'm totally
> incorrect device resource management unwinds backwards in the order actions are
> registered.

Yeah, sorry if it was not clear:
- .remove() is called *before* any devres action takes place
- devres action are LIFO, so unwinded backwards as you say

In the general case, a driver does:
int probe() {
  void *pointer  = devm_alloc(...)
  some_more_devm_action(...)
  hid_hw_start()
  return 0;
}

and so the HID start action is the last one, meaning that .remove will
first call stop and then devres unwind will get called.

But here, in your case, you need hid_hw_start to be called *before*
devm_i2c_add_adapter(), meaning that the implicit .remove() will mess
up with the device, so you  are forced to do something about it.

You can either keep a non devm variant, or you can override the
.remove() of HID to not do anything and do the stop/close in a
specific devm task, which you did here. You are just missing the
"let's override .remove() to ensure we keep the device open and
started while we need it".

Cheers,
Benjamin

