Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B10337CC700
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Oct 2023 17:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344261AbjJQPGm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Oct 2023 11:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344273AbjJQPGb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Oct 2023 11:06:31 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0F892914E
        for <linux-i2c@vger.kernel.org>; Tue, 17 Oct 2023 07:58:45 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-27cfb8bc7eeso4620482a91.0
        for <linux-i2c@vger.kernel.org>; Tue, 17 Oct 2023 07:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1697554725; x=1698159525; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hRxv/xQHCbwfjsFwBDzlBOcscTMXDoiVeykMIgqT/70=;
        b=O5jQAQgVLRO+PsmmUqU7WgOMCOGrqtfXF0CKGR+wbchOJQikW/ovplka17+B2nYi0P
         Oo6XcoPnxrrDFsYSV+E5A8NSCuR1RP2O9zCfpr7EcyK/nuyHXJvLBPMnp8sq7lKalq4m
         G7Khv0n2ShqqDhcWlpSIs/Ocow8IC1ioGhHhsdrJwVfRrWq2wvUCIC4m6B7xulR8rFXr
         FnXQoYAqi/yxYBkqeAO/o6jxRWtWr8/K/M8LzBjFe3S7QOaLz4M9lDzWkSxMYkC1o52y
         pS8ZWyjq03Fzxoh2ucBFLH8cqIW1G371ekX+OWTStW/BhtDQwLAbXsirMB8Mb35wnZGg
         Xrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697554725; x=1698159525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRxv/xQHCbwfjsFwBDzlBOcscTMXDoiVeykMIgqT/70=;
        b=uIwjqKXqpXNQDZZDuVHHX5v9gi2eEr4HuvSXWxFGIRVF8oAgsDVcS0LJTAPH9RbMh7
         9M6i38zMQ3gqXuMJQig1A7t5Jl+arEHpL07/kY0BCeuL/hTAip8PGHdBSuPm81TH93EB
         hI1smHjY27VePxgIYBV2TJfuzL1qi7omvqzuQ6InkeqTl1N0H/cTHr7Ww0zB7Wb6EoJP
         vRXFHHR7sYAmavlBKUNzJiNjeAzkXKitNRDS43FVBkMAt2tZnGdcStqaVAhcvLC78g3P
         JrFvGLEM1tPi0kaHx/KPBwGHxc4PA5ajVosABMy4EtTEPOpUEo4HFLrbK4iZYGfLqWHn
         Y1xw==
X-Gm-Message-State: AOJu0YzNXaurf1cdhoLiESina4q7+iDBDI+6NNGdvxOe9bB7owO2d/ha
        WLXYoZMhPjBEIVlihqp927jCBihIiV9q8KrSvZ6EJncrKb8dOY44sv4=
X-Google-Smtp-Source: AGHT+IES1CkRGvdSXLTh6fW8XeKNFlA1wfTDkUWe2UIfEim18KRVWsaejinQekqV4Gq4F6JTPBmUzocv7NY6sayk86o=
X-Received: by 2002:a17:90b:1058:b0:27d:6dd:fb7d with SMTP id
 gq24-20020a17090b105800b0027d06ddfb7dmr2488553pjb.17.1697554725068; Tue, 17
 Oct 2023 07:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231005134541.947727-1-naresh.solanki@9elements.com>
 <20231005134541.947727-2-naresh.solanki@9elements.com> <29485a37-1f45-9f7f-9cc5-5d6a9fcc5e08@axentia.se>
In-Reply-To: <29485a37-1f45-9f7f-9cc5-5d6a9fcc5e08@axentia.se>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Tue, 17 Oct 2023 20:28:36 +0530
Message-ID: <CABqG17g=Q4nhH_RaVQJHhciWMfc-1hLyPaB_+WaincgLtH37CA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] i2c: muxes: pca954x: Enable features on MAX7357
To:     Peter Rosin <peda@axentia.se>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Fri, 6 Oct 2023 at 13:16, Peter Rosin <peda@axentia.se> wrote:
>
> Hi!
>
> 2023-10-05 at 15:45, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
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
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> > Changes in V4:
> > - Drop max7358
> > - Update #define
> > - Move conf variable
> > - Print warning when I2C_FUNC_SMBUS_WRITE_BYTE_DATA isn't supported
> > Changes in V3:
> > - Delete unused #define
> > - Update pca954x_init
> > - Update commit message
> >
> > Changes in V2:
> > - Update comments
> > - Update check for DT properties
> > ---
> >  drivers/i2c/muxes/i2c-mux-pca954x.c | 44 ++++++++++++++++++++++++++++-
> >  1 file changed, 43 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > index 2219062104fb..f37ce332078c 100644
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
> > +#define MAX7357_CONF_FLUSH_OUT                       BIT(1)
> > +#define MAX7357_CONF_RELEASE_INT             BIT(2)
> > +#define MAX7357_CONF_DISCON_SINGLE_CHAN              BIT(4)
> > +#define MAX7357_CONF_PRECONNECT_TEST         BIT(7)
> > +
> > +#define MAX7357_POR_DEFAULT_CONF             MAX7357_CONF_INT_ENABLE
> > +
> >  enum pca_type {
> >       max_7356,
> >       max_7357,
> > @@ -470,7 +484,35 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
> >       else
> >               data->last_chan = 0; /* Disconnect multiplexer */
> >
> > -     ret = i2c_smbus_write_byte(client, data->last_chan);
> > +     if (device_is_compatible(&client->dev, "maxim,max7357")) {
> > +             if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
> > +                     u8 conf = MAX7357_POR_DEFAULT_CONF;
> > +                     /*
> > +                      * The interrupt signal is shared with the reset pin. Release the
> > +                      * interrupt after 1.6 seconds to allow using the pin as reset.
> > +                      * The interrupt isn't serviced yet.
>
> I'd suggest dropping the word "yet". The interrupt isn't serviced for
> max7357, period. The "yet" in combination with that 1.6 second window is
> a bit cunfusing and readers might think that the interrupt is serviced
> at some later stage or something, when I think the intention of "The
> interrupt isn't serviced yet" comes with the silent implication that it
> is simply not implemented yet.
Sure.
>
> > +                      */
> > +                     conf |= MAX7357_CONF_RELEASE_INT;
> > +
> > +                     if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
> > +                             conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
> > +                     if (device_property_read_bool(&client->dev,
> > +                                                   "maxim,send-flush-out-sequence"))
> > +                             conf |= MAX7357_CONF_FLUSH_OUT;
> > +                     if (device_property_read_bool(&client->dev,
> > +                                                   "maxim,preconnection-wiggle-test-enable"))
> > +                             conf |= MAX7357_CONF_PRECONNECT_TEST;
> > +
> > +                     ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
> > +             } else {
> > +                     dev_warn(&client->dev,
> > +                              "Write byte not supported. Cannot enable enhanced mode features");
>
> Missing \n at the end of the string.
Sure. Will also update it as
'Write byte data not supported. Cannot enable enhanced mode features\n'

Regards,
Naresh
>
> Cheers,
> Peter
>
> > +                     ret = i2c_smbus_write_byte(client, data->last_chan);
> > +             }
> > +     } else {
> > +             ret = i2c_smbus_write_byte(client, data->last_chan);
> > +     }
> > +
> >       if (ret < 0)
> >               data->last_chan = 0;
> >
