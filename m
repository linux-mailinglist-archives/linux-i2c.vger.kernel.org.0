Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7122477B954
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbjHNNCT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 14 Aug 2023 09:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbjHNNCG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:02:06 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D341738;
        Mon, 14 Aug 2023 06:01:53 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-589a6c2c020so61635517b3.1;
        Mon, 14 Aug 2023 06:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692018096; x=1692622896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ri/aAhV9V1QKg7f5IB5V2rWz5Gg5B1mduf0Q//YtRKw=;
        b=TdW/cEEx1B47rEg/w44vUWBwTbSwnVJ6raS93GmpebRkmvR3kAgv5SKG5EQtNNELUE
         2Q3HNHhveh8lY4SfTHFMkLuV/XKB/KoWfMZ7uOdi1tBuGznLzA/iTdLtz1VszyXTdOjS
         OlM0emgQ3Hy1HqT8xqMJzoCniTLCUVFUX2pmULh0C7qrDr/2PcKIwXOwCgFJNlHDMeIS
         wlSrPxqu0JRfYyrxoXCRnDa8l+7/8QOkA7igbJUoCd+1pegSl2KsU/XopT79uepqJNHc
         SHMKusT/Ea7KmZvinANULLeqOcwlRdfxIMsrgOz4+b3lYRsyWUCDDZjk66ryZeKg3q8O
         RIIw==
X-Gm-Message-State: AOJu0YzYLjBLdQSs0yNr8efdBnweIKZgEeqeTvcRBf17kmSHfwyrkIuV
        ju3pR8xbO37ywMVCUH3Tz8f7n+jx0Vul4A==
X-Google-Smtp-Source: AGHT+IEMeRQYvn22++yzjtAWK3gd9orQ/RXnamvbeDfRBA9FXiU4VWSUM6P6Jab0/J7qK5/Mp4+vEQ==
X-Received: by 2002:a5b:60a:0:b0:d09:22c0:138d with SMTP id d10-20020a5b060a000000b00d0922c0138dmr11861914ybq.7.1692018094963;
        Mon, 14 Aug 2023 06:01:34 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id b8-20020a252e48000000b00d0d080074f3sm2311971ybn.31.2023.08.14.06.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 06:01:34 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d67305c80deso3901354276.1;
        Mon, 14 Aug 2023 06:01:33 -0700 (PDT)
X-Received: by 2002:a25:361f:0:b0:d48:8ff1:dd12 with SMTP id
 d31-20020a25361f000000b00d488ff1dd12mr15424802yba.18.1692018093136; Mon, 14
 Aug 2023 06:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230804161728.394920-1-biju.das.jz@bp.renesas.com>
 <20230805174036.129ffbc2@jic23-huawei> <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei> <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
In-Reply-To: <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Aug 2023 15:01:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHjema72HrmghH6ozVYHEBHZhnS4+mkrJJZPu2pQNUxg@mail.gmail.com>
Message-ID: <CAMuHMdUHjema72HrmghH6ozVYHEBHZhnS4+mkrJJZPu2pQNUxg@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

On Mon, Aug 7, 2023 at 4:54 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Sun, Aug 06, 2023 at 02:29:50PM +0100, Jonathan Cameron wrote:
> > On Sat, 5 Aug 2023 17:42:21 +0000
> > Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > On Fri,  4 Aug 2023 17:17:24 +0100
> > > > Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> ...
>
> > > + * Besides the fact that some drivers abuse the device ID driver_data type
> > > + * and claim it to be integer, for the bus specific ID tables the driver_data
> > > + * may be defined as kernel_ulong_t. For these tables 0 is a valid response,
> > > + * but not for this function. It's recommended to convert those either to avoid
> > > + * 0 or use a real pointer to the predefined driver data.
>
> > We still need to maintain consistency across the two tables, which
> > is a stronger requirement than avoiding 0.
>
> True. Any suggestion how to amend the above comment? Because the documentation
> makes sense on its own (may be split from the series?).

I do have an idea how to handle that (inspired by the macro-heavy
R-Car pin control drivers ;-)

    #define DEVICES(fn) \
        fn("vendor1", "device1", &driver_data1) \
        fn("vendor3", "device2", &driver_data2) \
        fn("vendor3", "device2", &driver_data3)

    OF_MATCH_TABLE(driver_of_match, DEVICES);
    I2C_MATCH_TABLE(driver_i2c_ids, DEVICES);

and in the of resp. i2c headers:

    #define EMIT_OF_ENTRY(_vendor, _device, _data) \
            { .name = _vendor ## "," ## _device, .data = _data) },
    #define EMIT_OF_ENTRIES(_name, _devs) \
            static const struct of_device_id _name[] = { \
                    _devs(EMIT_OF_ENTRY) \
                    { } \
            } \

    #define EMIT_I2C_ENTRY(_vendor, _device, _data) \
            { .name = _device, .driver_data = (void *)_data) },
    #define EMIT_I2C_ENTRIES(_name, _devs) \
            static const struct i2c_device_id _name[] = { \
                    _devs(EMIT_I2C_ENTRY) \
                    { } \
            } \

I didn't try to compile this, so I may have missed something (e.g.
a required intermediate macro to ensure proper expansion).
Unfortunately this would break grep'ability for compatible values...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
