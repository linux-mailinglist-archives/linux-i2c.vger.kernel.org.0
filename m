Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39EBA623FBB
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 11:25:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbiKJKZv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 05:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiKJKZs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 05:25:48 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A072368C4C
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 02:25:46 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id 94-20020a9d0067000000b0066c8d13a33dso847820ota.12
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 02:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8yWLRIQ1FY3LmIhSn1MHnoXz0lZOoO7FOYU1ST7sazE=;
        b=bcXTc/tEWgATMrLXs5Oihrv02t4oX//l+oKYbadBd3V+1n0Z/HjGjI4x/1d3jAOwb2
         EOjJ8GMQjEryqIaGO+AOCpLKWDB1OiAoZfxxMY7IHzPJNta+68vWeS0f5xsH5mSCdLtV
         TLPuZ9NUEFjXlb18es2gwcsJf5prhDY36BUkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yWLRIQ1FY3LmIhSn1MHnoXz0lZOoO7FOYU1ST7sazE=;
        b=j6SKMRBdGjapz7G3wfyM7hntVmsVWs9scPFth+IFDUUmEnI6myIc9jTDANzqoJTCiV
         0zXTwPD6stofwJ+xkn49iMR2HdjAt1uAHy3oNBEhDLPQW9+WeMhYYaWJDr9fPJCp9Hfo
         oPUkpsaIteeb6Sstbip4Jz+25QV6jWn9ziqzbQFAUwNImdYjnpmIRm5gipKd7MM7TaY+
         YHq2vaQEumDdSrMIK4mwhAlBe/NyXq9ORSDhw0rnTQslAk976HbDgO8wst60ojK7ocMf
         hHfZ/yYEjXcg9T4ETzsL++heRz7Y1YgrrDWKV5kt9gMlzrqFinl/8FhEgOOzQi9tQ2Ut
         z5iQ==
X-Gm-Message-State: ACrzQf18qJFT7s0UpfgESJhyc7Qt1vKL4/sqTOJowFAL8i1XOHZizbo1
        Y58rFw1fyNbFqhwLqaxBn2byFFs9uDr6vy3G
X-Google-Smtp-Source: AMsMyM5w0as0GAnQ4ytUmK35PT6ffhWqguGiJKS9dWT8hOS1Z2BtoW5RlZiPX/KMvvfv0zv27mq5Eg==
X-Received: by 2002:a9d:404c:0:b0:66c:7c7c:3b97 with SMTP id o12-20020a9d404c000000b0066c7c7c3b97mr18696702oti.298.1668075945522;
        Thu, 10 Nov 2022 02:25:45 -0800 (PST)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id g92-20020a9d2de5000000b0066c4092ae4csm6165036otb.10.2022.11.10.02.25.44
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 02:25:45 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id r76-20020a4a374f000000b004988a70de2eso195326oor.2
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 02:25:44 -0800 (PST)
X-Received: by 2002:a4a:a6c7:0:b0:498:260c:d780 with SMTP id
 i7-20020a4aa6c7000000b00498260cd780mr1260281oom.27.1668075943919; Thu, 10 Nov
 2022 02:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20221109-i2c-waive-v2-0-07550bf2dacc@chromium.org>
 <20221109-i2c-waive-v2-1-07550bf2dacc@chromium.org> <20221110092534.uzxfevcig4dllvb2@google.com>
In-Reply-To: <20221110092534.uzxfevcig4dllvb2@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 10 Nov 2022 11:25:32 +0100
X-Gmail-Original-Message-ID: <CANiDSCvYck1K8KVrKS+7TLYzi8Y_vA51iCTzGWStHAKac8CZXg@mail.gmail.com>
Message-ID: <CANiDSCvYck1K8KVrKS+7TLYzi8Y_vA51iCTzGWStHAKac8CZXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: Restore initial power state when we are done.
To:     Hidenori Kobayashi <hidenorik@chromium.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Hidenori

On Thu, 10 Nov 2022 at 10:25, Hidenori Kobayashi <hidenorik@chromium.org> wrote:
>
> Hi Ricardo,
>
> On Wed, Nov 09, 2022 at 04:17:06PM +0100, Ricardo Ribalda wrote:
> > A driver that supports I2C_DRV_ACPI_WAIVE_D0_PROBE is not expected to
> > power off a device that it has not powered on previously.
> >
> > For devices operating in "full_power" mode, the first call to
> > `i2c_acpi_waive_d0_probe` will return 0, which means that the device
> > will be turned on with `dev_pm_domain_attach`.
> >
> > If probe fails or the device is removed the second call to
> > `i2c_acpi_waive_d0_probe` will return 1, which means that the device
> > will not be turned off. This is, it will be left in a different power
> > state. Lets fix it.
> >
> > Fixes: b18c1ad685d9 ("i2c: Allow an ACPI driver to manage the device's power state during probe")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index b4edf10e8fd0..96623e0647bd 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -545,8 +545,9 @@ static int i2c_device_probe(struct device *dev)
> >       if (status < 0)
> >               goto err_clear_wakeup_irq;
> >
> > +     client->turn_off_on_remove = !i2c_acpi_waive_d0_probe(dev);
> >       status = dev_pm_domain_attach(&client->dev,
> > -                                   !i2c_acpi_waive_d0_probe(dev));
> > +                                   client->turn_off_on_remove);
> >       if (status)
> >               goto err_clear_wakeup_irq;
> >
> > @@ -585,7 +586,7 @@ static int i2c_device_probe(struct device *dev)
> >  err_release_driver_resources:
> >       devres_release_group(&client->dev, client->devres_group_id);
> >  err_detach_pm_domain:
> > -     dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
> > +     dev_pm_domain_detach(&client->dev, client->turn_off_on_remove);
> >  err_clear_wakeup_irq:
> >       dev_pm_clear_wake_irq(&client->dev);
> >       device_init_wakeup(&client->dev, false);
> > @@ -610,7 +611,7 @@ static void i2c_device_remove(struct device *dev)
> >
> >       devres_release_group(&client->dev, client->devres_group_id);
> >
> > -     dev_pm_domain_detach(&client->dev, !i2c_acpi_waive_d0_probe(dev));
> > +     dev_pm_domain_detach(&client->dev, client->turn_off_on_remove);
> >
> >       dev_pm_clear_wake_irq(&client->dev);
> >       device_init_wakeup(&client->dev, false);
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index f7c49bbdb8a1..6b2dacb0bae1 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -326,6 +326,8 @@ struct i2c_driver {
> >   *   calls it to pass on slave events to the slave driver.
> >   * @devres_group_id: id of the devres group that will be created for resources
> >   *   acquired when probing this device.
> > + * @turn_off_on_remove: Record if we have turned on the device before probing
> > + *   so we can restore the initial state after remove/probe error.
> >   *
> >   * An i2c_client identifies a single device (i.e. chip) connected to an
> >   * i2c bus. The behaviour exposed to Linux is defined by the driver
> > @@ -355,6 +357,7 @@ struct i2c_client {
> >       i2c_slave_cb_t slave_cb;        /* callback for slave mode      */
> >  #endif
> >       void *devres_group_id;          /* ID of probe devres group     */
> > +     bool turn_off_on_remove;        /* power state when done        */
>
> Can we have a different name that also makes sense for attach()?
> To me, it's kind of hard to see immediately what the second argument to
> attach() meant.

I was trying to be super-clever and not adding a new variable. :P

Let me send a new version.

Thanks for your review!

>
> Since this is used for both power_on and power_off, I think something
> more neutral would be easier to read? For example: power_flag?
>
> Or I guess we could name it like full_power and provide a wrapper for
> the detach() cases?
>
> >  };
> >  #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
> >
> >
> > --
> > b4 0.11.0-dev-d93f8
> >



-- 
Ricardo Ribalda
