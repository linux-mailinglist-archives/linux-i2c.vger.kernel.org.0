Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A49BE7046D8
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 09:48:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbjEPHsG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 16 May 2023 03:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjEPHsF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 03:48:05 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4784330F8;
        Tue, 16 May 2023 00:48:04 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ba6d024a196so4754024276.2;
        Tue, 16 May 2023 00:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684223283; x=1686815283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f07seKr4m5/OlhMAPO3dIAn75k2cEFtJb88wHoo4wJk=;
        b=DwSMOLKrO0Q+bPw8lZhiQtcEcePWeXgTBYQG7PRg3QS5sSaovyPeHUNB8Mth+FFzal
         Wjc5S1JfKHzGiaM52+srZwgLRauVWBoiFaLkLqs0N5xpHvOmrmW3sn6iKfMg5EWUysgB
         j8Bz/srMCTUzwVORVGVPsPaLfOXHf7lhGvKtqugmmopx1Ezxr+DzJGGjq2pA19sHseOu
         VrWfbaFtGdZXuEWEOYVOFLBUCBdpZGXblq1/o7pgUZ3ZWLBXEx18mmTeJgyPbS1xjRH+
         LIwTrRF9ykQDstDmg1aAqlhL8U+z3V7boi+DTK0jylQcVujddsFf18l6kob3mNlRfTT/
         Dw5A==
X-Gm-Message-State: AC+VfDzpm/qbGhJq2ldHKcP/Kpr670VyKXxis6H7gTaihn4TxUi8lLdZ
        bt51pyk+lQHONKLYPX4Nahl61lCdIp4/KQ==
X-Google-Smtp-Source: ACHHUZ4Yo0dwPK7wYz4qOo3GLc7igKcdc78KtvLDgXPjDV5r7LcWYwJFncJKQ4C3e6VeXZDEMqPn5g==
X-Received: by 2002:a81:4897:0:b0:55a:e0db:5604 with SMTP id v145-20020a814897000000b0055ae0db5604mr33791437ywa.26.1684223283091;
        Tue, 16 May 2023 00:48:03 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id o8-20020a817308000000b00559f9e9eabcsm420982ywc.98.2023.05.16.00.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 00:48:00 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-55dc3431c64so111243467b3.2;
        Tue, 16 May 2023 00:48:00 -0700 (PDT)
X-Received: by 2002:a0d:df45:0:b0:55a:671b:4685 with SMTP id
 i66-20020a0ddf45000000b0055a671b4685mr32388112ywe.46.1684223280201; Tue, 16
 May 2023 00:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com> <20230513165227.13117-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230513165227.13117-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 May 2023 09:47:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYPZftcTP5E0f1uwkTsunn9KAOtLeDNqiFoKx+m7OQDg@mail.gmail.com>
Message-ID: <CAMuHMdVYPZftcTP5E0f1uwkTsunn9KAOtLeDNqiFoKx+m7OQDg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] i2c: Enhance i2c_new_ancillary_device API
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
        Lee Jones <lee@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
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

On Sat, May 13, 2023 at 6:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Renesas PMIC RAA215300 exposes two separate i2c devices, one for the main
> device and another for rtc device.
>
> Enhance i2c_new_ancillary_device() to instantiate a real device.
> (eg: Instantiate rtc device from PMIC driver)
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * New patch

Thanks for your patch!

Looks correct to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Some suggestions for improvement below...

> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1153,7 +1157,27 @@ struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>         }
>
>         dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
> -       return i2c_new_dummy_device(client->adapter, addr);
> +
> +       if (aux_device_name) {
> +               struct i2c_board_info info;
> +               size_t aux_device_name_len = strlen(aux_device_name);
> +
> +               if (aux_device_name_len > I2C_NAME_SIZE - 1) {
> +                       dev_err(&client->adapter->dev, "Invalid device name\n");
> +                       return ERR_PTR(-EINVAL);
> +               }

strscpy() return value?

> +
> +               memset(&info, 0, sizeof(struct i2c_board_info));

The call to memset() would not be needed if info would be initialized
at declaration time, i.e.

    struct i2c_board_info info = { .addr = addr };

Or, use I2C_BOARD_INFO(), to guarantee initialization is aligned
with whatever future changes made to i2c_board_info? But that relies
on providing the name at declaration time, which we already have in
i2c_new_dummy_device().

So I suggest to add a name parameter to i2c_new_dummy_device(),
rename it to __i2c_new_dummy_device(), and create a wrapper for
compatibility with existing users:

    struct i2c_client *__i2c_new_dummy_device(struct i2c_adapter
*adapter, u16 address,
                                             const char *name)
    {
            struct i2c_board_info info = {
                    I2C_BOARD_INFO("dummy", address),
            };

            if (name) {
                    ssize_ret = strscpy(info.type, name, sizeof(info.type));

                    if (ret < 0)
                            return ERR_PTR(dev_err_probe(&client->adapter->dev,
                                           ret, "Invalid device name\n");
            }

            return i2c_new_client_device(adapter, &info);
    }

> +
> +               memcpy(info.type, aux_device_name, aux_device_name_len);
> +               info.addr = addr;
> +
> +               i2c_aux_client = i2c_new_client_device(client->adapter, &info);
> +       } else {
> +               i2c_aux_client = i2c_new_dummy_device(client->adapter, addr);
> +       }
> +
> +       return i2c_aux_client;
>  }
>  EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
