Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 012275E704B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 01:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiIVXpC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 19:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbiIVXpA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 19:45:00 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4BB851A3E
        for <linux-i2c@vger.kernel.org>; Thu, 22 Sep 2022 16:44:58 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id h28so7360081qka.0
        for <linux-i2c@vger.kernel.org>; Thu, 22 Sep 2022 16:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=0Hb5HGp+k2XflhkoKgDKjNTvMxi7xMzwldrOdX8+I+g=;
        b=OUEpNXvvSeMMe+CcI3u8etC80T82EUY1ydti5DKjOJ0nHC1OMXAURoia0kfTrGIU4v
         CBOCdWZlSGSuxh+V9z4CRBAmsHN2RqMRWshHkVGOzZQyvkwBjXKe0vbAvR2WWcFTiGnq
         yW8yc8dlNL9UUrxF3POgIYWJmznfgbZpJz6ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=0Hb5HGp+k2XflhkoKgDKjNTvMxi7xMzwldrOdX8+I+g=;
        b=UwDPfDtf2NGTJZBgVAYpbDydsMiKeeSChDNM6nHD7FcGf2UYFd7vCB1NKle+d7bR1l
         5O0P8R/+dKFosWTwRIqnWODZZOYQ4VTQan5KFJTuIl8cJCZ/BqKGs9JIK1VcOpoX/rdl
         Ibc39hEVARTk0ITgyPnilhNhr952aBihwiV+Tn4rLkvtlSdsDqAMEDudcO688gOBN0Du
         u1pBXSv0zcjzIytmFkxPFk0+MoY98qO8U3TTe2olygr1TfhoJR3wmXLvHnAif3yC/aay
         u4Is0aNRYHF+ia2dRIbPz0384SDQExQ9YcevfITU77jVGKHMbRFapTn/1qg/Z0mw7t9a
         35Gw==
X-Gm-Message-State: ACrzQf3wxHF7VjhVofbHGatqQPCUAhJ25DsqTLD1nYFe8a83nSDWgltq
        tJFhC76woDj08K+98YfVoVZRSgY5aEYwMzFfU0hNjg==
X-Google-Smtp-Source: AMsMyM4lzGrAhbGpiWu+pLgXbcf3Ed0LZQW8B+2iJP5rYUG4K+19xk2aBZ0atCNaYzbt5RRCc09JWwoR7UEvWbHdF3E=
X-Received: by 2002:a05:620a:c41:b0:6b6:bc8:2051 with SMTP id
 u1-20020a05620a0c4100b006b60bc82051mr4013261qki.410.1663890297830; Thu, 22
 Sep 2022 16:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
 <20220921063026.89619-5-matt.ranostay@konsulko.com> <20220921080458.3uue5ooc3svcbmxp@mail.corp.redhat.com>
 <CAJCx=gn0bZp3fToF+LZE+evR2m4nWMueusjysxcrvimH0wRhaA@mail.gmail.com>
In-Reply-To: <CAJCx=gn0bZp3fToF+LZE+evR2m4nWMueusjysxcrvimH0wRhaA@mail.gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Thu, 22 Sep 2022 16:44:47 -0700
Message-ID: <CAJCx=gmAyae-_VmYpVw=q4+34zraxQ4d2E3DTjjRX4OWqaWwHg@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] HID: mcp2221: switch i2c registration to devm functions
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     gupt21@gmail.com, jic23@kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Sep 21, 2022 at 10:57 AM Matt Ranostay
<matt.ranostay@konsulko.com> wrote:
>
> On Wed, Sep 21, 2022 at 1:05 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > [foreword: please keep Jiri and myself (the HID maintainers) CC-ed to
> > the series, as you will need ack from us and we don't necessarily monitor
> > every single message on linux-input]
> >
> > On Sep 20 2022, Matt Ranostay wrote:
> > > Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
> > > for matching rest of driver initialization, and more concise code.
> > >
> > > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > > ---
> > >  drivers/hid/hid-mcp2221.c | 45 +++++++++++++++++----------------------
> > >  1 file changed, 19 insertions(+), 26 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> > > index de52e9f7bb8c..7ba63bcd66de 100644
> > > --- a/drivers/hid/hid-mcp2221.c
> > > +++ b/drivers/hid/hid-mcp2221.c
> > > @@ -824,6 +824,14 @@ static int mcp2221_raw_event(struct hid_device *hdev,
> > >       return 1;
> > >  }
> > >
> > > +static void mcp2221_hid_remove(void *ptr)
> > > +{
> > > +     struct hid_device *hdev = ptr;
> > > +
> > > +     hid_hw_close(hdev);
> > > +     hid_hw_stop(hdev);
> >
> > By default, if you remove the .remove() callback, hid_hw_stop() will get
> > automatically called by hid-core.c. So we are now calling it twice,
> > which, in a way is not a big deal but it might be an issue in the long
> > run.
> >
> > Generally speaking, in the HID subsystem, that situation doesn't happen
> > a lot because hid_hw_start() is usually the last command of probe, and
> > we don't need to open the device in the driver itself.
> >
> > Here, I guess as soon as you add the i2c adapter, you might want to have
> > the communication channels ready, and thus you need to have it open
> > *before* i2c_add_adapter.
> >
> > I would suggest the following if you want to keep the devm release of
> > stop and close: please put a big fat warning before mcp2221_hid_remove()
> > explaining that this is called in devm management, *and* add a function
> > that would just return 0 as the .remove() callback with another big fat
> > warning explaining that we don't want hid-core.c to call hid_hw_stop()
> > because we are doing it ourself through devres.
> >
>
> Yeah maybe best to keep the non-devres if it isn't going to affect how the last
> change in this series is trying to implement with iio.
>
> I'll wait for Jonathan to chime in on this thread.
>
> > Last, in the HID subsystem, we often interleave non devres with devres
> > for resource allocation, given that .remove() will be called before any
> > devres release. But that is assuming this ordering is OK, which doesn't
> > seem to be the case here. We first need to unregister the i2c adapter
> > and then close/stop the HID device.

On second thought I2C will be unregistered before the HID calls, since
unless I'm totally
incorrect device resource management unwinds backwards in the order actions are
registered.

- Matt

>
> Noted.
>
> -  Matt
>
> >
> > > +}
> > > +
> > >  static int mcp2221_probe(struct hid_device *hdev,
> > >                                       const struct hid_device_id *id)
> > >  {
> > > @@ -849,7 +857,8 @@ static int mcp2221_probe(struct hid_device *hdev,
> > >       ret = hid_hw_open(hdev);
> > >       if (ret) {
> > >               hid_err(hdev, "can't open device\n");
> > > -             goto err_hstop;
> > > +             hid_hw_stop(hdev);
> > > +             return ret;
> > >       }
> > >
> > >       mutex_init(&mcp->lock);
> > > @@ -857,6 +866,10 @@ static int mcp2221_probe(struct hid_device *hdev,
> > >       hid_set_drvdata(hdev, mcp);
> > >       mcp->hdev = hdev;
> > >
> > > +     ret = devm_add_action_or_reset(&hdev->dev, mcp2221_hid_remove, hdev);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       /* Set I2C bus clock diviser */
> > >       if (i2c_clk_freq > 400)
> > >               i2c_clk_freq = 400;
> > > @@ -873,19 +886,17 @@ static int mcp2221_probe(struct hid_device *hdev,
> > >                       "MCP2221 usb-i2c bridge on hidraw%d",
> > >                       ((struct hidraw *)hdev->hidraw)->minor);
> > >
> > > -     ret = i2c_add_adapter(&mcp->adapter);
> > > +     ret = devm_i2c_add_adapter(&hdev->dev, &mcp->adapter);
> > >       if (ret) {
> > >               hid_err(hdev, "can't add usb-i2c adapter: %d\n", ret);
> > > -             goto err_i2c;
> > > +             return ret;
> > >       }
> > >       i2c_set_adapdata(&mcp->adapter, mcp);
> > >
> > >       /* Setup GPIO chip */
> > >       mcp->gc = devm_kzalloc(&hdev->dev, sizeof(*mcp->gc), GFP_KERNEL);
> > > -     if (!mcp->gc) {
> > > -             ret = -ENOMEM;
> > > -             goto err_gc;
> > > -     }
> > > +     if (!mcp->gc)
> > > +             return -ENOMEM;
> > >
> > >       mcp->gc->label = "mcp2221_gpio";
> > >       mcp->gc->direction_input = mcp_gpio_direction_input;
> > > @@ -900,26 +911,9 @@ static int mcp2221_probe(struct hid_device *hdev,
> > >
> > >       ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
> > >       if (ret)
> > > -             goto err_gc;
> > > +             return ret;
> > >
> > >       return 0;
> > > -
> > > -err_gc:
> > > -     i2c_del_adapter(&mcp->adapter);
> > > -err_i2c:
> > > -     hid_hw_close(mcp->hdev);
> > > -err_hstop:
> > > -     hid_hw_stop(mcp->hdev);
> > > -     return ret;
> > > -}
> > > -
> > > -static void mcp2221_remove(struct hid_device *hdev)
> > > -{
> > > -     struct mcp2221 *mcp = hid_get_drvdata(hdev);
> > > -
> > > -     i2c_del_adapter(&mcp->adapter);
> > > -     hid_hw_close(mcp->hdev);
> > > -     hid_hw_stop(mcp->hdev);
> > >  }
> > >
> > >  static const struct hid_device_id mcp2221_devices[] = {
> > > @@ -932,7 +926,6 @@ static struct hid_driver mcp2221_driver = {
> > >       .name           = "mcp2221",
> > >       .id_table       = mcp2221_devices,
> > >       .probe          = mcp2221_probe,
> > > -     .remove         = mcp2221_remove,
> > >       .raw_event      = mcp2221_raw_event,
> > >  };
> > >
> > > --
> > > 2.37.2
> > >
> >
> > Cheers,
> > Benjamin
> >
