Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20FD170973B
	for <lists+linux-i2c@lfdr.de>; Fri, 19 May 2023 14:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjESM3v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 19 May 2023 08:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjESM3u (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 May 2023 08:29:50 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADD019F;
        Fri, 19 May 2023 05:29:49 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5648e904593so1234397b3.3;
        Fri, 19 May 2023 05:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684499388; x=1687091388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2rjFEhE9nqYpWNzWZU8ZC8ez1/dbrPmPVy1nPH0KVOg=;
        b=k3MUAQx2jfkgjSoJdb3+TY/s4n3CFVwzc9GjVVAv7E36lNe3FRDkjuKhbUchdxJtKE
         OXBi9nRP3HFfbURrvQDwXjHoJsVZf0BmQyYkEQ/nLjlScSWWF+LXJFHfmKkyOnBgzr2K
         YqB+KfKqz+2KWFGX9cib7KtuUXk6AK4JJHP8ofy7hzjxSGkxwlrIfKYE1f1hzC3EpUYm
         Iye4oDYD9zqLmq/D1g4B43w3sepcM4TyxgSah2qZ3/DmxPK2fMs1HSVE3vD+gdHydn6u
         qroYieAVU2MQ9vyrOmjn6io3MwndW+rlSJmAhn+2UuEFTwuLwvZtf5eP6tLgwTjUJmxe
         i2TA==
X-Gm-Message-State: AC+VfDw4zR9CNrQlty6X+fb0e8gc1IVtUkTfb77OL3/WRoWlfUKs5Nns
        k1ROMxIKui9KSH+OVWbg1AEDyOBFbLUneA==
X-Google-Smtp-Source: ACHHUZ5UBz6qiyAxijrTJqHIiHNgKbk9uwTUJFee+gYVQK6Ubdbwf5b9wF6OxLwT5S4rYS/A+5Cr8g==
X-Received: by 2002:a0d:ead4:0:b0:559:fb52:7cf6 with SMTP id t203-20020a0dead4000000b00559fb527cf6mr1626712ywe.43.1684499386602;
        Fri, 19 May 2023 05:29:46 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id u202-20020a8184d3000000b00545a081847fsm1124061ywf.15.2023.05.19.05.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 05:29:43 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-561c46e07d7so43648737b3.2;
        Fri, 19 May 2023 05:29:42 -0700 (PDT)
X-Received: by 2002:a0d:d141:0:b0:55d:8768:4081 with SMTP id
 t62-20020a0dd141000000b0055d87684081mr2075196ywd.7.1684499382327; Fri, 19 May
 2023 05:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com> <20230518113643.420806-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518113643.420806-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 14:29:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHZqwW8e9zCZgx2mTBP_Tzcuswo04fxw-DCo__NDFS1w@mail.gmail.com>
Message-ID: <CAMuHMdVHZqwW8e9zCZgx2mTBP_Tzcuswo04fxw-DCo__NDFS1w@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang <wsa@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Thu, May 18, 2023 at 1:37 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Renesas PMIC RAA215300 exposes two separate i2c devices, one for the main
> device and another for rtc device.
>
> Enhance i2c_new_ancillary_device() to instantiate a real device.
> (eg: Instantiate rtc device from PMIC driver)
>
> Added helper function __i2c_new_dummy_device to share the code
> between i2c_new_dummy_device and i2c_new_ancillary_device().
>
> Also added helper function __i2c_new_client_device() to pass parent dev
> parameter, so that the ancillary device can assign its parent during
> creation.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Dropped Rb tag from Geert as there are new changes.
>  * Introduced __i2c_new_dummy_device() to share the code between
>    i2c_new_dummy_device and i2c_new_ancillary_device().
>  * Introduced __i2c_new_client_device() to pass parent dev
>    parameter, so that the ancillary device can assign its parent during
>    creation.

Thanks for the update!

LGTM, a few minor comments below.

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -893,24 +893,10 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
>         return 0;
>  }
>
> -/**
> - * i2c_new_client_device - instantiate an i2c device
> - * @adap: the adapter managing the device
> - * @info: describes one I2C device; bus_num is ignored
> - * Context: can sleep
> - *
> - * Create an i2c device. Binding is handled through driver model
> - * probe()/remove() methods.  A driver may be bound to this device when we
> - * return from this function, or any later moment (e.g. maybe hotplugging will
> - * load the driver module).  This call is not appropriate for use by mainboard
> - * initialization logic, which usually runs during an arch_initcall() long
> - * before any i2c_adapter could exist.
> - *
> - * This returns the new i2c client, which may be saved for later use with
> - * i2c_unregister_device(); or an ERR_PTR to describe the error.
> - */
> -struct i2c_client *
> -i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
> +static struct i2c_client *
> +__i2c_new_client_device(struct i2c_adapter *adap,
> +                       struct i2c_board_info const *info,
> +                       struct device *dev)

struct device *parent?

>  {
>         struct i2c_client       *client;
>         int                     status;

> @@ -1054,6 +1062,25 @@ static struct i2c_driver dummy_driver = {
>         .id_table       = dummy_id,
>  };
>
> +static struct i2c_client *__i2c_new_dummy_device(struct i2c_adapter *adapter,
> +                                                u16 address, const char *name,
> +                                                struct device *dev)
> +{
> +       struct i2c_board_info info = {
> +               I2C_BOARD_INFO("dummy", address),
> +       };
> +
> +       if (name) {
> +               ssize_t ret = strscpy(info.type, name, sizeof(info.type));
> +
> +               if (ret < 0)
> +                       return ERR_PTR(dev_err_probe(&adapter->dev, ret,
> +                                                    "Invalid device name\n"));

%s too long?

> +       }
> +
> +       return __i2c_new_client_device(adapter, &info, dev);
> +}
> +
>  /**
>   * i2c_new_dummy_device - return a new i2c device bound to a dummy driver
>   * @adapter: the adapter managing the device

> @@ -1122,15 +1145,17 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
>   * @client: Handle to the primary client
>   * @name: Handle to specify which secondary address to get
>   * @default_addr: Used as a fallback if no secondary address was specified
> + * @aux_device_name: Ancillary device name
>   * Context: can sleep
>   *
>   * I2C clients can be composed of multiple I2C slaves bound together in a single
>   * component. The I2C client driver then binds to the master I2C slave and needs
> - * to create I2C dummy clients to communicate with all the other slaves.
> + * to create I2C ancillary clients to communicate with all the other slaves.
>   *
> - * This function creates and returns an I2C dummy client whose I2C address is
> - * retrieved from the platform firmware based on the given slave name. If no
> - * address is specified by the firmware default_addr is used.
> + * This function creates and returns an I2C ancillary client whose I2C address
> + * is retrieved from the platform firmware based on the given slave name. If no
> + * address is specified by the firmware default_addr is used. If no aux_device_
> + * name is specified by the firmware, it will create an I2C dummy client.

Please add something like:

    The ancillary's device parent will be set to the primary device.

>   *
>   * On DT-based platforms the address is retrieved from the "reg" property entry
>   * cell whose "reg-names" value matches the slave name.

> @@ -1153,7 +1179,9 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>         }
>
>         dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
> -       return i2c_new_dummy_device(client->adapter, addr);
> +       return __i2c_new_dummy_device(client->adapter, addr,
> +                                     aux_device_name ? aux_device_name : NULL,

You can just pass aux_device_name.

> +                                     &client->dev);
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
