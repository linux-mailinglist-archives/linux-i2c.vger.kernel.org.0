Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975AC5E8E67
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Sep 2022 18:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbiIXQQi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Sep 2022 12:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiIXQQg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Sep 2022 12:16:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98523AB1F;
        Sat, 24 Sep 2022 09:16:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 758B061087;
        Sat, 24 Sep 2022 16:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C82EC433D6;
        Sat, 24 Sep 2022 16:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664036194;
        bh=F5sTtpXXqvLfdqHDWhNG3r1/iSI3pt4pOqQI17I6R3Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OL+hqvXW69liJ659R68sL1mKcJ7SJXOT6tWv8C/yJmFSu3gvw19Zl696z03DJf0kT
         +S2MI8kgi4wYln0X1QU0tpmRYW1PGLVdJVEFtxqG/vwSdEiS6T62kbZVOdwQ0hpFhL
         IUBCNKpCrguGEfC1uffuCN7flUW3lniej6JKmpE9SgXel/p8X317UGtRwWBudfAR5L
         aD3PJrG1o/jC/L2bRkQpUq5cJbnGk9vyFbcjyhxvVroTv9a5JeyRvBk4mhKtw+yl6P
         W+llsXXGiGpGK3xOcb2bxUTWdSV3NR92Guv+c0LU87KQWvBnDJR136d6BtBD7VjfMP
         9LuvR2qiDrc3A==
Date:   Sat, 24 Sep 2022 17:16:42 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rishi Gupta <gupt21@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH v4 4/5] HID: mcp2221: switch i2c registration to devm
 functions
Message-ID: <20220924171642.38541c78@jic23-huawei>
In-Reply-To: <CAJCx=g=bcZe5RUWZTqmz_2=Q1sDmbwGB8Rd8F47eVkz7e2Zz2A@mail.gmail.com>
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
        <20220921063026.89619-5-matt.ranostay@konsulko.com>
        <20220921080458.3uue5ooc3svcbmxp@mail.corp.redhat.com>
        <CAJCx=gn0bZp3fToF+LZE+evR2m4nWMueusjysxcrvimH0wRhaA@mail.gmail.com>
        <CAJCx=gmAyae-_VmYpVw=q4+34zraxQ4d2E3DTjjRX4OWqaWwHg@mail.gmail.com>
        <CAO-hwJJrgb+ncG9mSiE4zZ32oRc_vD0OcrsTa+uXBCTBGRL+nw@mail.gmail.com>
        <CAJCx=g=bcZe5RUWZTqmz_2=Q1sDmbwGB8Rd8F47eVkz7e2Zz2A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 23 Sep 2022 14:22:18 -0700
Matt Ranostay <matt.ranostay@konsulko.com> wrote:

> On Fri, Sep 23, 2022 at 12:03 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Fri, Sep 23, 2022 at 1:45 AM Matt Ranostay
> > <matt.ranostay@konsulko.com> wrote:  
> > >
> > > On Wed, Sep 21, 2022 at 10:57 AM Matt Ranostay
> > > <matt.ranostay@konsulko.com> wrote:  
> > > >
> > > > On Wed, Sep 21, 2022 at 1:05 AM Benjamin Tissoires
> > > > <benjamin.tissoires@redhat.com> wrote:  
> > > > >
> > > > > [foreword: please keep Jiri and myself (the HID maintainers) CC-ed to
> > > > > the series, as you will need ack from us and we don't necessarily monitor
> > > > > every single message on linux-input]
> > > > >
> > > > > On Sep 20 2022, Matt Ranostay wrote:  
> > > > > > Switch from i2c_add_adapter() to resource managed devm_i2c_add_adapter()
> > > > > > for matching rest of driver initialization, and more concise code.
> > > > > >
> > > > > > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > > > > > ---
> > > > > >  drivers/hid/hid-mcp2221.c | 45 +++++++++++++++++----------------------
> > > > > >  1 file changed, 19 insertions(+), 26 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
> > > > > > index de52e9f7bb8c..7ba63bcd66de 100644
> > > > > > --- a/drivers/hid/hid-mcp2221.c
> > > > > > +++ b/drivers/hid/hid-mcp2221.c
> > > > > > @@ -824,6 +824,14 @@ static int mcp2221_raw_event(struct hid_device *hdev,
> > > > > >       return 1;
> > > > > >  }
> > > > > >
> > > > > > +static void mcp2221_hid_remove(void *ptr)
> > > > > > +{
> > > > > > +     struct hid_device *hdev = ptr;
> > > > > > +
> > > > > > +     hid_hw_close(hdev);
> > > > > > +     hid_hw_stop(hdev);  
> > > > >
> > > > > By default, if you remove the .remove() callback, hid_hw_stop() will get
> > > > > automatically called by hid-core.c. So we are now calling it twice,
> > > > > which, in a way is not a big deal but it might be an issue in the long
> > > > > run.
> > > > >
> > > > > Generally speaking, in the HID subsystem, that situation doesn't happen
> > > > > a lot because hid_hw_start() is usually the last command of probe, and
> > > > > we don't need to open the device in the driver itself.
> > > > >
> > > > > Here, I guess as soon as you add the i2c adapter, you might want to have
> > > > > the communication channels ready, and thus you need to have it open
> > > > > *before* i2c_add_adapter.
> > > > >
> > > > > I would suggest the following if you want to keep the devm release of
> > > > > stop and close: please put a big fat warning before mcp2221_hid_remove()
> > > > > explaining that this is called in devm management, *and* add a function
> > > > > that would just return 0 as the .remove() callback with another big fat
> > > > > warning explaining that we don't want hid-core.c to call hid_hw_stop()
> > > > > because we are doing it ourself through devres.
> > > > >  
> > > >
> > > > Yeah maybe best to keep the non-devres if it isn't going to affect how the last
> > > > change in this series is trying to implement with iio.
> > > >
> > > > I'll wait for Jonathan to chime in on this thread.

Not my subsystem, so I'm happy if others have to take the headaches that
mixing and matching causes :)  Personally I'd rather not!
Whilst devm_ brings it's own issues (the plumbers session on this was as
ever fun) the particular fun set of bugs that turn up because of mixing
it in probe() with manual removal in remove() was one where I've never
heard a good argument against using devm_ until the first thing in probe() where
you decide not to then not using devm_ calls after that. I have seen
a handful of cases where a different order was needed, but far more bugs
and / or difficult to reason out flows as a result of mixing them up.

Obviously straight forward allocations are fine as freeing them late doesn't
matter. Registration / consumer requests not so much.

Jonathan


