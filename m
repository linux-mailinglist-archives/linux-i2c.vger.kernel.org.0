Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3DA579AF8E
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Sep 2023 01:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243773AbjIKVSe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Sep 2023 17:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235623AbjIKJHW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Sep 2023 05:07:22 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E75ECCC
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 02:07:16 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-573ccec985dso3155087a12.2
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 02:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1694423236; x=1695028036; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gHlUsrh70YjmCnzc3dnUJqO+J/xaJs3/qZ2CPlghqoE=;
        b=bQjbusEvAqxAakwUw3SXzN1u64ddvt/RYGCeQiS8w3UJCNj5pp3TMCC+Ht3+0Ur1FC
         8B2NqFgbvhe42yEf4kN0PQSmM+sbFKWV/8jgCNmF3q3awkb0YmTxNGcZwGfqphsO1CRU
         SrZilGEihMVx4sVxTaNFNFHtc/JBA0gG2wLxY0j2WtR5TdIZkp1Ts3AV4PjWB9TC/6cl
         IFdMSetvV21Cmhzk83gmJ/dQpyjQkeElJtjxex4sGKsycXpiltQP1LKUlDIc8MMvcOFG
         UQdq5we8y8rmSyfms5AkT+TkkVboaVhaFIYnYGDCvX6ztGpr69N6XxlCZAWl3gaKFuLy
         ykcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694423236; x=1695028036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHlUsrh70YjmCnzc3dnUJqO+J/xaJs3/qZ2CPlghqoE=;
        b=WBcAc1L7eeeyssL0MTbcH9QuYX2MLGynO1zSuBwF8F/Cqax4LPXXj5jkSulUuDLsT8
         apLcWIBgQjcfSlVShv6pJc7KYxnHe0b9iaaLwIiv2epyDN1ZMzOZTOQiZSbBfrwJ2SBN
         15JyCAeF9z0KY/36t/Bm/pTZAdQLTC8JmCotTpurhK1OTg/o9CPnEnah6e0nKswlA9ew
         w/Jairn80jm7V1r2ZhvU2b/443UCSOsXt7l8BNvuicgfV0Kra0eXyd7CnmgDZfmFx5cz
         pOUwYBKDZVHGuL4ijtiT6NqTSCC/NvVB4eRtRrq9/X96ugvNC2/t5cLcorF1D3eX191X
         1xKQ==
X-Gm-Message-State: AOJu0Yxhyof0WJZZYyxXaClVbvNBOl88f/AjAum+hFNjIZGmhywPAulV
        AalxtZ+eB38baEKwtoj+T5Jd8eVA4Py2Qe8LhiobFZbmAPr7s+NekYg=
X-Google-Smtp-Source: AGHT+IEw9HToe8L8JtSWQKP3oVvv/KOYlVGEUTuN812uP9A3XOVlZUa7Zw/aQ9sTpOukN/cFe8/Y+c5+UR6WaaRVzwY=
X-Received: by 2002:a05:6a20:8f01:b0:12b:fe14:907e with SMTP id
 b1-20020a056a208f0100b0012bfe14907emr12080319pzk.20.1694423235655; Mon, 11
 Sep 2023 02:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230830115744.4102929-1-Naresh.Solanki@9elements.com>
 <20230830115744.4102929-2-Naresh.Solanki@9elements.com> <20230902184256.6g2lfgqfaeanjtwz@zenone.zhora.eu>
In-Reply-To: <20230902184256.6g2lfgqfaeanjtwz@zenone.zhora.eu>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Mon, 11 Sep 2023 14:37:04 +0530
Message-ID: <CABqG17jcA3GS3vRFjAhzFa-CCAmH4ZDw4YrR=KByn2p=NGW9Pw@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: muxes: Enable features on MAX7357
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Peter Rosin <peda@axentia.se>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,


On Sun, 3 Sept 2023 at 00:13, Andi Shyti <andi.shyti@kernel.org> wrote:
>
> Hi Naresh,
>
> On Wed, Aug 30, 2023 at 01:57:43PM +0200, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Detect that max7357 is being used and run custom init sequence.
> >
> > By default MAX7357 disconnects all channels on a bus lock-up and
> > signals       this condition to the bus master using an interrupt.
>
> please replace this tab with a space.
Ack
>
> > Disable the interrupt as it's not useful within the kernel and
> > it might conflict with the reset functionality that shares the same
> > pin.
> >
> > Use the introduced 'maxim,bus-lockup-fix' property to enable
> > faulty channel isolation and flush-out sequence generation.
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> > ---
> >  drivers/i2c/muxes/i2c-mux-pca954x.c | 56 ++++++++++++++++++++++++++++-
> >  1 file changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > index 2219062104fb..0c1ff1438e7c 100644
> > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > @@ -57,6 +57,21 @@
> >
> >  #define PCA954X_IRQ_OFFSET 4
> >
> > +/*
> > + * MAX7357 exposes 7 registers on POR which allow to configure additional
> > + * features. The configuration register holds the following settings:
> > + */
> > +#define MAX7357_CONF_INT_ENABLE                      BIT(0)
> > +#define MAX7357_CONF_FLUSH_OUT                       BIT(1)
> > +#define MAX7357_CONF_RELEASE_INT             BIT(2)
> > +#define MAX7357_CONF_LOCK_UP_CLEAR           BIT(3)
> > +#define MAX7357_CONF_DISCON_SINGLE_CHAN              BIT(4)
> > +#define MAX7357_CONF_BUS_LOCKUP_DETECT_DIS   BIT(5)
> > +#define MAX7357_CONF_ENABLE_BASIC_MODE               BIT(6)
> > +#define MAX7357_CONF_PRECONNECT_TEST         BIT(7)
>
> Not all these defines are are used, can we remove those that we
> don't need?
Ack. Will keep the ones that are used.
>
> > +#define MAX7357_POR_DEFAULT_CONF             BIT(0)
>
> I think:
>
>    #define MAX7357_POR_DEFAULT_CONF     MAX7357_CONF_INT_ENABLE
>
> has a better meaning... but overall, do we need it?
Ack. Will keep the ones that are in use.
>
> > +
> >  enum pca_type {
> >       max_7356,
> >       max_7357,
> > @@ -477,6 +492,41 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
> >       return ret;
> >  }
> >
> > +static int max7357_init(struct i2c_client *client, struct pca954x *data)
> > +{
> > +     struct i2c_adapter *adap = client->adapter;
> > +     u8 conf = MAX7357_POR_DEFAULT_CONF;
> > +     int ret;
> > +
> > +     if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
> > +             return pca954x_init(client, data);
> > +
> > +     if (data->idle_state >= 0)
> > +             data->last_chan = pca954x_regval(data, data->idle_state);
> > +     else
> > +             data->last_chan = 0; /* Disconnect multiplexer */
> > +
> > +     /*
> > +      * The interrupt signals downstream channels that are stuck, but
> > +      * there's nothing to do and it prevents using the shared pin as reset.
> > +      */
> > +     conf &= MAX7357_CONF_INT_ENABLE;
> > +
> > +     /*
> > +      * On bus lock-up isolate the failing channel and try to clear the
> > +      * fault by sending the flush-out sequence.
> > +      */
> > +     if (device_property_read_bool(&client->dev, "maxim,bus-lockup-fix"))
> > +             conf |= MAX7357_CONF_DISCON_SINGLE_CHAN |
> > +                     MAX7357_CONF_FLUSH_OUT;
>
> this function is identical to pca954x_init() except for the
> conf.
>
> If you:
>
>         u8 conf = 0;
>
>         ...
>
>         if (i2c_check_functionality(adap, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
>                 conf &= MAX7357_CONF_INT_ENABLE;
>
>                 if (device_property_read_bool(&client->dev,
>                                               "maxim,bus-lockup-fix"))
>                         conf |= MAX7357_CONF_DISCON_SINGLE_CHAN |
>                                 MAX7357_CONF_FLUSH_OUT;
>         }
>
>         ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
>         ...
>
>
> You basically should obtain the same thing, I guess and we make
> things easier.
Ack. Will do the changes as suggested.
Also based on feedback from Krzysztof, it was suggested that the dt
property might
not be needed & the settings can be configured/enabled by default. So
will remove
the DT property check ?

Ref: https://lore.kernel.org/lkml/9100e41b-291e-9723-4188-b4d3e5adb6f8@linaro.org/#t

Regards,
Naresh
>
>
> > +     ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
> > +     if (ret < 0)
> > +             data->last_chan = 0;
> > +     return ret;
> > +}
> > +
> >  /*
> >   * I2C init/probing/exit functions
> >   */
> > @@ -560,7 +610,11 @@ static int pca954x_probe(struct i2c_client *client)
> >        * initializes the mux to a channel
> >        * or disconnected state.
> >        */
> > -     ret = pca954x_init(client, data);
> > +     if ((dev->of_node && of_device_is_compatible(dev->of_node, "maxim,max7357")) ||
> > +         id->driver_data == max_7357)
> > +             ret = max7357_init(client, data);
>
> what happens if this is true and in max7357_init(); the i2c
> functionality check fails?
>
> Which of the two if's is redundant? Should they be merged?
>
> Andi
>
> > +     else
> > +             ret = pca954x_init(client, data);
> >       if (ret < 0) {
> >               dev_warn(dev, "probe failed\n");
> >               ret = -ENODEV;
> > --
> > 2.41.0
> >
