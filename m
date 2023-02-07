Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA07968DE03
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Feb 2023 17:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjBGQeL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Feb 2023 11:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbjBGQeK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Feb 2023 11:34:10 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E359B3864A
        for <linux-i2c@vger.kernel.org>; Tue,  7 Feb 2023 08:34:08 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id f15-20020a17090ac28f00b00230a32f0c9eso8009894pjt.4
        for <linux-i2c@vger.kernel.org>; Tue, 07 Feb 2023 08:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feOVtnjSZjGmTAyYmWKNjD+1i+clfm4gUti33NkjnFE=;
        b=QWndu82h99RLtpJE9U+c0/bTDJlFJzKzM9JyXRGUS5IxQpxbGwsN1vxTOHqvZJgLEs
         ZFgO/NcQhPCf4iyRAzJcyseyWcbFbXElxJP/Lo7c4kKzQ0RAhkmvY/TXB74x0sqsWGnu
         AEiEbXoigy7Mzf9i749C+j1vAy6do/vGGRcJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feOVtnjSZjGmTAyYmWKNjD+1i+clfm4gUti33NkjnFE=;
        b=aaLlkaV5xMtpwYMUz+mQM1awCbneC9nU+05TsVSTg97lCfbq1UO5ugx0mrVHrQXb5Y
         mHsflGvhpy1XA8duoNnGLK1Ut9OlQJ3gy5smXsm1tgfg/cWPl9kwxIGll2J3QG3Hkvgi
         QCwrAzPkE5ocp3YTGh+fks90zcJRWrntmiWL9N5Ss4EM44JPCwc3oVsGCzslUeTncMib
         9pGTUa8dgPHHvUrOoniSA2RoPiI704mhoROFe8ryIXh58dnbEhICfT/bu9QgIGwru8D8
         yjmsBZqNoILx/wVYD6nXPmjwDUlDe60hfChpUKKB0m5qlE6XJ12WDbsMcU8wXkeahHHx
         kKqA==
X-Gm-Message-State: AO0yUKVEcPgCeCnRC3N8Wd+F1b02a1mWJECUoJjMDaLxUS+bQxksL/AV
        9i0qskE275IGPAqislEnfIUSdK/FzyKmwugU
X-Google-Smtp-Source: AK7set/5Btmj7tcO/Pfh7XhVTeOX1fBctbYubJfCiIeH3Mt3CMa9BUp0D97sSq05wEF3HuaYQdKsZg==
X-Received: by 2002:a17:902:e5c7:b0:196:86c2:ee60 with SMTP id u7-20020a170902e5c700b0019686c2ee60mr4132272plf.15.1675787648244;
        Tue, 07 Feb 2023 08:34:08 -0800 (PST)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902710700b00196048cc113sm9075682pll.126.2023.02.07.08.34.07
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 08:34:07 -0800 (PST)
Received: by mail-pg1-f172.google.com with SMTP id 141so10859625pgc.0
        for <linux-i2c@vger.kernel.org>; Tue, 07 Feb 2023 08:34:07 -0800 (PST)
X-Received: by 2002:a63:7250:0:b0:499:7f08:40c3 with SMTP id
 c16-20020a637250000000b004997f0840c3mr772244pgn.80.1675787646796; Tue, 07 Feb
 2023 08:34:06 -0800 (PST)
MIME-Version: 1.0
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Tue, 7 Feb 2023 09:33:55 -0700
X-Gmail-Original-Message-ID: <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
Message-ID: <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sorry, resending in plain text mode.

On Tue, Feb 7, 2023 at 12:25 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
> set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
> devices if they announce to be wake capable in their device description.
> However, on certain systems where audio codec has been connected through
> I2C this causes system suspend to wake up immediately because power to
> the codec is turned off which pulls the interrupt line "low" triggering
> wake up.
>
> Possible reason why the interrupt is marked as wake capable is that some
> codecs apparently support "Wake on Voice" or similar functionality.

That's generally a bug in the ACPI tables. The wake bit shouldn't be
set if the power domain for the device is powered off on suspend. The
best thing is to fix the ACPI tables, but if you can't, then you can
set the ignore_wake flag for the device:
https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L=
31.
If that works we can add a quirk for the device:
https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L=
1633.

>
> In any case, I don't think we should be enabling wakeup by default on
> all I2C devices that are wake capable. According to device_init_wakeup()
> documentation most devices should leave it disabled, with exceptions on
> devices such as keyboards, power buttons etc. Userspace can enable
> wakeup as needed by writing to device "power/wakeup" attribute.

Enabling wake by default was an unintended side-effect. I didn't catch
this when I wrote the patch :/ It's been exposing all the incorrect
ACPI configurations for better or worse. Mario pushed a patch up
earlier to disable thes Wake GPIOs when using S3:
https://github.com/torvalds/linux/commit/d63f11c02b8d3e54bdb65d8c309f73b7f4=
74aec4.
Are you having problems with S3 or S0iX?

>
> Reported-by: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.inte=
l.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Hi,
>
> Sending this as RFC because I'm not too familiar with the usage of
> I2C_CLIENT_WAKE and whether this is something that is expected behaviour
> in users of I2C devices. On ACPI side I think this is the correct thing
> to do at least.
>
>  drivers/i2c/i2c-core-base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 087e480b624c..7046549bdae7 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -527,7 +527,7 @@ static int i2c_device_probe(struct device *dev)
>                         goto put_sync_adapter;
>                 }
>
> -               device_init_wakeup(&client->dev, true);
> +               device_init_wakeup(&client->dev, false);

This would be a change in behavior for Device Tree. Maybe you can
declare a `bool enable_wake =3D true`, then in the ACPI branch
(https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-core-base.c#=
L495)
set `enable_wake =3D false`. This would keep wakes enabled by default on
device tree and disabled for ACPI. This matches the original behavior
before my patch.

>
>                 if (wakeirq > 0 && wakeirq !=3D client->irq)
>                         status =3D dev_pm_set_dedicated_wake_irq(dev, wak=
eirq);
> --
> 2.39.1
>
