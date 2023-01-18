Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF7E671DA8
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 14:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjARNYq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 08:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjARNYA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 08:24:00 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F524860E
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 04:51:19 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id k4so35554650vsc.4
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 04:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rQ7ZyW+SMgnOs4ZSUaGsgK0nMgf/0oqpbtKXM5Uvnyg=;
        b=S5ZrlQMovxgQ6/5BqwiZs0z19HziLVNewPF65Ayj3b+WxASGC5UwcS1nmQLduJBF0J
         sbm2yxGr/GEFGvF+veJ1JFBLTvwN43OWkgJ9wGJFC2n/KbSmarcqvmgkIhXUwgYzSSLq
         7Az8gd20TTV6OXZRuNjElLrcgyzWYV282ABpeB3CdPnWMIV5nbgNI98ybR2sS7bpJq7X
         37v8aCRFWWvebUgzwm5aGl/GkRyZ7YqOrjFu29DcSISRt2X9w+HD5rxE+PmufG+rLbiz
         ol+BkqP7QMmbGxfQSFy9THTjSNSP6if8p/iuQozpNcZStpb8NWGYSTOJYFK1u7/Yv9/l
         2aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ7ZyW+SMgnOs4ZSUaGsgK0nMgf/0oqpbtKXM5Uvnyg=;
        b=7206tc1ow9ewDhaMwdhqxpSQtKpast4GDbrrX76bb5/Wh8OFdM6P27oHYfU/XC8c5l
         W6/pYKfw4EA3p280dWJwhkuXKYMYZD6MigJhE15DasKdKP4GSF7eVm+LXKG2T0P3wfED
         tS79B3grcWDtxfSQ5l+dH2eoZldcqS+hOfckhk9M7WgDYxTGWdYa2CJOna7lNkJehQg3
         16tmWHhMFuAFwVvoUl493IGPNveRwUDAkuVP15Lytl7TEk0x9gqmQSDDariByrK5VJHx
         ILkZddEZbQG+YdJStxsh7gi9X1abLVw4FUlGs7Fp4eLMUAocKnj8Lrrou9Y1bqCHW3ag
         A0Ew==
X-Gm-Message-State: AFqh2kpcYHgKy5VjUPdG7FQnah9emtwxfoGyKCioqWuv6DQMjJIPAOlR
        0g77oxketNKLEVDTBe3OGZNJ5lSs/Mb/i5OenxZSGw==
X-Google-Smtp-Source: AMrXdXtc6tQN3SNXacW8wfHMgdsbBjfVruZT16ptflt+enjnFrWWaSpTvbCEDNrS9g2P9MOurE8r4zyDaXRIhn5/yWs=
X-Received: by 2002:a67:c387:0:b0:3d2:3577:2d05 with SMTP id
 s7-20020a67c387000000b003d235772d05mr844832vsj.9.1674046278314; Wed, 18 Jan
 2023 04:51:18 -0800 (PST)
MIME-Version: 1.0
References: <20221229160045.535778-1-brgl@bgdev.pl> <20221229160045.535778-3-brgl@bgdev.pl>
 <Y8bvf9k2K62EscEo@ninjato>
In-Reply-To: <Y8bvf9k2K62EscEo@ninjato>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 18 Jan 2023 13:51:07 +0100
Message-ID: <CAMRc=MdbncCAH5ESdpkU+QoFQ16od1QdLMi1b_q4MuO5KYiemA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: dev: don't allow user-space to deadlock the kernel
To:     Wolfram Sang <wsa@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 17, 2023 at 7:57 PM Wolfram Sang <wsa@kernel.org> wrote:
>
> Hi Bartosz,
>
> > If we open an i2c character device and then unbind the underlying i2c
> > adapter (either by unbinding it manually via sysfs or - for a real-life
> > example - when unplugging a USB device with an i2c adaper), the kernel
> > thread calling i2c_del_adapter() will become blocked waiting for the
> > completion that only completes once all references to the character
> > device get dropped.
> >
> > In order to fix that, we introduce a couple changes. They need to be
> > part of a single commit in order to preserve bisectability. First, drop
> > the dev_release completion. That removes the risk of a deadlock but
> > we now need to protect the character device structures against NULL
> > pointer dereferences. To that end introduce an rw semaphore. It will
> > protect the dummy i2c_client structure against dropping the adapter from
> > under it. It will be taken for reading by all file_operations callbacks
> > and for writing by the notifier's unbind handler. This way we don't
> > prohibit the syscalls that don't get in each other's way from running
> > concurrently but the adapter will not be unbound before all syscalls
> > return.
> >
> > Finally: upon being notified about an unbind event for the i2c adapter,
> > we take the lock for writing and set the adapter pointer in the character
> > device's structure to NULL. This "numbs down" the device - it still exists
> > but is no longer functional. Meanwhile every syscall callback checks that
> > pointer after taking the lock but before executing any code that requires
> > it. If it's NULL, we return an error to user-space.
> >
> > This way we can safely open an i2c device from user-space, unbind the
> > device without triggering a deadlock and any subsequent system-call for
> > the file descriptor associated with the removed adapter will gracefully
> > fail.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> First of all, thank you for tackling this problem. It was long overdue
> and I really appreciate that you took the initiative to get it solved.
>
> Here are some review comments already. I'd like to do some more testing.
> So far, everything works nicely. Also, I'd like to invite more people to
> have a look at this code. We really don't want to have a regression
> here, so more eyes are very welcome.
>
>
> > @@ -1713,25 +1715,7 @@ void i2c_del_adapter(struct i2c_adapter *adap)
> >
> >       i2c_host_notify_irq_teardown(adap);
> >
> > -     /* wait until all references to the device are gone
> > -      *
> > -      * FIXME: This is old code and should ideally be replaced by an
> > -      * alternative which results in decoupling the lifetime of the struct
> > -      * device from the i2c_adapter, like spi or netdev do. Any solution
> > -      * should be thoroughly tested with DEBUG_KOBJECT_RELEASE enabled!
>
> Have you done this? Debugging with DEBUG_KOBJECT_RELEASE enabled?
>

Yes, I ran a simple test script with this option enabled - nothing
suspicious reported.

> > -      */
> > -     init_completion(&adap->dev_released);
> >       device_unregister(&adap->dev);
> > -     wait_for_completion(&adap->dev_released);
>
> So, this is basically the key change. I think you handled the userspace
> part via i2c-dev well. I don't have proof yet, but my gut feeling
> wonders if this is complete. Aren't there maybe sysfs-references as
> well. I need to check.
>
> > -
> > -     /* free bus id */
> > -     mutex_lock(&core_lock);
> > -     idr_remove(&i2c_adapter_idr, adap->nr);
> > -     mutex_unlock(&core_lock);
> > -
> > -     /* Clear the device structure in case this adapter is ever going to be
> > -        added again */
> > -     memset(&adap->dev, 0, sizeof(adap->dev));
>
> Any reason you didn't add this to release function above? Reading the
> introducing commit, the old drivers needings this still exist IMO.
> (Yes, they should be converted to use the i2c-mux subsystem, but I don't
> think someone will do this)
>

Good catch, added it back.

> > @@ -44,8 +45,14 @@ struct i2c_dev {
> >       struct i2c_adapter *adap;
> >       struct device dev;
> >       struct cdev cdev;
> > +     struct rw_semaphore sem;
>
> I'd like to name it 'rwsem' so it is always super-clear what it is.
>
> >  };
> >
> > +static inline struct i2c_dev *to_i2c_dev(struct inode *ino)
>
> I'd also prefer a more specific 'inode_to_i2c_dev' function name.
> Personally, I'd also name the argument 'inode' but I'll leave that to
> you.
>
> > +{
> > +     return container_of(ino->i_cdev, struct i2c_dev, cdev);
> > +}
>
> ...
>
> Doesn't the function 'name_show()' also need protection? It dereferences
> i2c_dev->adap.
>

Another good catch.

> So much for now,
>
>    Wolfram
>

Thanks, will send a v2 shortly.

Bart
