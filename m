Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C587B9E19
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Oct 2023 16:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbjJEN5T (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 09:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243839AbjJENzS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 09:55:18 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2822A8A79
        for <linux-i2c@vger.kernel.org>; Thu,  5 Oct 2023 01:33:42 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-564af0ac494so478448a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 05 Oct 2023 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1696494821; x=1697099621; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IDS4naPGQ1FxN0B/REXVrwAINqUy2DgeZ+fVL1m8k2o=;
        b=cggttsFnCUTsEuuVbgzK+zamBA1LzeVLHMiEb72fq23GDIE0OljuPjI482iFp5EeQi
         mSQ7eVtYZJ6gEeQiUZkooJIxnZXxLkW678/ML/LRcX8Nq3nz08Wi3zrMEN1s5Dwve1Rv
         MGQv8OJl5WTI0dHofRtRVDUypQL0jIeS0B2fwUbRapfWEvecf6PGF0ChW1tXc7o67Zoj
         sfW76H6k1Fnl5CHHHTnYvhroPNXdBy4jrdi+kodafLXLtqum31/jacy3rajaw2q6M//A
         MAHc8cZ4/DSnR2pZOWuaKhG7xDSlLfSYY28SVAtOGqkoSY934xZpOI5r5N8jXL2e8aWV
         eudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696494821; x=1697099621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDS4naPGQ1FxN0B/REXVrwAINqUy2DgeZ+fVL1m8k2o=;
        b=a+m1tkgGlbYTas80S4CBUt1PTZ1tTVzHmlZSfdlkM6Fczz/Mc8u1jbUOBR4hy3mu8K
         XIvYmgeZc0pvi0QNAYvVakzaYXBey5qYps7iCVLOhp+oh2J2jgyNgMkcBnfsEi9sZehS
         8eJ6xxO+qFuBnqdwnXBiOnArcdX7gmKUw3emXmwL4i9QlqTcXcwdECC1ZDXvsIrTp6e4
         n218oSSXIm0RN4DqK7hD5nZ6gKUNiaHexONXk10zQn850M85jNiS1WOFV+B4iz/O3y/F
         XnWuNKDUokHGAsPw7xWbW/Gy+ldZsL03cH2g16ZDNwe20dG7v9KtuynQ8tHLkz4avjOi
         ilLw==
X-Gm-Message-State: AOJu0YyTdqyOShuUS+3C9p+EBE+XF07ibqVqYUtLJQHMJs1KOLqKNe4P
        sWlPI5NG+BuIe0SI6haWXtk5HpkQE7ITkiNPR6+FK5ORPRZXZfZBQ+c=
X-Google-Smtp-Source: AGHT+IH1X4tBIPMw8ecrWuT9gzqCc759cmkKO3BNU5kAKKqTKdTUxzIapzwh0wnQYYQpGr7uXwzXo6pgqqRJv96DJmg=
X-Received: by 2002:a17:90b:1056:b0:274:67d0:f57 with SMTP id
 gq22-20020a17090b105600b0027467d00f57mr3666854pjb.48.1696494821447; Thu, 05
 Oct 2023 01:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230922093117.3030977-2-naresh.solanki@9elements.com> <8ec35702-54a7-ad6e-99c5-7ed49667c94b@axentia.se>
In-Reply-To: <8ec35702-54a7-ad6e-99c5-7ed49667c94b@axentia.se>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Thu, 5 Oct 2023 14:03:30 +0530
Message-ID: <CABqG17h2PMunuyeiEPbY4Z6QMZFAmwna2t3AGn5c8YztkzSvNg@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 2/2] i2c: muxes: pca954x: Enable features on MAX7357/MAX7358
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

On Fri, 22 Sept 2023 at 16:02, Peter Rosin <peda@axentia.se> wrote:
>
> Hi!
>
> Sorry for being unresponsive...
>
> The subject, description and the bindings patch talk about MAX7358, but
> since it not actually handled it is misleading for the subject to say
> that features are enabled on MAX7358.
Yes will remove reference to max7358.
>
> 2023-09-22 at 11:31, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Detect that max7357 is being used and run custom init sequence.
> > Enable additional features based on DT settings and unconditionally
> > release the shared interrupt pin after 1.6 seconds and allow to use
> > it as reset.
> >
> > These features aren't enabled by default & its up to board designer
> > to enable the same as it may have unexpected side effects.
> >
> > These should be validated for proper functioning & detection of devices
> > in secondary bus as sometimes it can cause secondary bus being disabled.
> >
> > The init sequence is not run for max7358 that needs to be unlocked
> > first, but that would need the unimplemented function
> > i2c_probe_func_quick_write().
>
> Is that correct? If that is all that missing, why is it not sufficient to
> open-code it instead?
>
>         i2c_smbus_xfer(client->adapter, client->addr, client->flags,
>                        I2C_SMBUS_WRITE, 0, I2C_SMBUS_QUICK, NULL);
will drop max7358 for now in this patch series.
>
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> > Changes in V3:
> > - Delete unused #define
> > - Update pca954x_init
> > - Update commit message
> >
> > Changes in V2:
> > - Update comments
> > - Update check for DT properties
> > ---
> >  drivers/i2c/muxes/i2c-mux-pca954x.c | 38 ++++++++++++++++++++++++++++-
> >  1 file changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > index 2219062104fb..91c7c1d13c89 100644
> > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > @@ -57,6 +57,20 @@
> >
> >  #define PCA954X_IRQ_OFFSET 4
> >
> > +/*
> > + * MAX7357's configuration register is writeable after POR, but
> > + * can be locked by setting the basic mode bit. MAX7358 configuration
> > + * register is locked by default and needs to be unlocked first.
> > + * The configuration register holds the following settings:
> > + */
> > +#define MAX7357_CONF_INT_ENABLE                      BIT(0)
>
> This define isn't used.
Its indirectly used for default POR config. Will use it there.
>
> > +#define MAX7357_CONF_FLUSH_OUT                       BIT(1)
> > +#define MAX7357_CONF_RELEASE_INT             BIT(2)
> > +#define MAX7357_CONF_DISCON_SINGLE_CHAN              BIT(4)
> > +#define MAX7357_CONF_PRECONNECT_TEST         BIT(7)
> > +
> > +#define MAX7357_POR_DEFAULT_CONF             BIT(0)
> > +
> >  enum pca_type {
> >       max_7356,
> >       max_7357,
> > @@ -463,6 +477,7 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
> >
> >  static int pca954x_init(struct i2c_client *client, struct pca954x *data)
> >  {
> > +     u8 conf = MAX7357_POR_DEFAULT_CONF;
>
> This line can be moved inside the block below handling max7357. The POR
> default conf is not the same for max7358 anyway.
Sure.
>
> >       int ret;
> >
> >       if (data->idle_state >= 0)
> > @@ -470,7 +485,28 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
> >       else
> >               data->last_chan = 0; /* Disconnect multiplexer */
> >
> > -     ret = i2c_smbus_write_byte(client, data->last_chan);
> > +     if (device_is_compatible(&client->dev, "maxim,max7357") &&
> > +         i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
>
> I would have liked a message that any requested extra features cannot
> be enabled if the chip happens to be connected to a bus not capable of
> ...write_byte_data(). That might be plenty helpful for anybody who
> happens to find themself in that hole...
Sure will add that.
>
> > +             /*
> > +              * The interrupt signal is shared with the reset pin. Release the
> > +              * interrupt after 1.6 seconds to allow using the pin as reset.
> > +              * The interrupt isn't serviced yet.
> > +              */
> > +             conf |= MAX7357_CONF_RELEASE_INT;
> > +
> > +             if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
> > +                     conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
> > +             if (device_property_read_bool(&client->dev, "maxim,send-flush-out-sequence"))
> > +                     conf |= MAX7357_CONF_FLUSH_OUT;
> > +             if (device_property_read_bool(&client->dev,
> > +                                           "maxim,preconnection-wiggle-test-enable"))
> > +                     conf |= MAX7357_CONF_PRECONNECT_TEST;
> > +
> > +             ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
> > +     } else {
> > +             ret = i2c_smbus_write_byte(client, data->last_chan);
> > +     }
> > +
> >       if (ret < 0)
> >               data->last_chan = 0;
> >
>
> Would there be any point in configuring max7357 to be in basic mode?
If the above features arent needed then basic mode will serve the purpose.

>
> Cheers,
> Peter
