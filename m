Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD1B777B977
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 15:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjHNNNF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 14 Aug 2023 09:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjHNNMj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 09:12:39 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8596CE6E;
        Mon, 14 Aug 2023 06:12:38 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d6a5207d9d8so1545802276.0;
        Mon, 14 Aug 2023 06:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692018757; x=1692623557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSgqut+JHlQUbB4Bd/FI8orZtwhhcAep0ucawImk8r8=;
        b=S6CFp9bjlVo2MLbyJ+XyKa4kUnGsop4qB3jguxwG65I7ijvj55GkO7lj0YFBY94TgC
         5KZQEfRttg297W2g1DBgvNEpexbazzzhtz7UMu720mzfWBzIOS+aPxSwJqPcaniDcTiD
         UZ6K2QzOfviIkHcAemUNYaDE38KV7QSZ1nr/DuovwuPQsdfzksBwgqZ8tMBcB891g5Lm
         w+qyRkQu9e+9enT1imMPSaLg8/Y8rDT/xWx/sj9XI6PxGTp9TfpyO+3o1whfhSH/v9s4
         LU+7k/wwfvPrHD9uLE99dQPF/EcxtqZBFfKH1Z6ddf2Kyv3l52fgnyepivmAo5ibj/GY
         MXJA==
X-Gm-Message-State: AOJu0YwNels3wHdfljeccvDFY5aP4v9/zjkJegEHyHAOYS2X4nzmyqQY
        TER/PyD/jBAw5tjJUCua/YHcnv9x8aAgeA==
X-Google-Smtp-Source: AGHT+IFhPHRvUhhj3UWfHfsFGEqkY264d6jRqnAsh/AeEtCoU9+CuBeEQXY/MMPKPoP/4XAizAZajg==
X-Received: by 2002:a05:6902:149:b0:d07:b677:3349 with SMTP id p9-20020a056902014900b00d07b6773349mr10364672ybh.25.1692018757455;
        Mon, 14 Aug 2023 06:12:37 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id w6-20020a259bc6000000b00d06d47fd0b8sm2324160ybo.53.2023.08.14.06.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 06:12:36 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d6a5207d9d8so1545745276.0;
        Mon, 14 Aug 2023 06:12:36 -0700 (PDT)
X-Received: by 2002:a25:2d16:0:b0:d52:6882:1032 with SMTP id
 t22-20020a252d16000000b00d5268821032mr14671149ybt.28.1692018756289; Mon, 14
 Aug 2023 06:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230805174036.129ffbc2@jic23-huawei> <OS0PR01MB59220491C7C8AA40BEFAAD82860EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230806142950.6c409600@jic23-huawei> <ZNEFjyAloqlkMWn7@smile.fi.intel.com>
 <ZNFV+C1HCIRJpbdC@google.com> <ZNIyrG/2h/PeS9Oz@smile.fi.intel.com>
 <20230809182551.7eca502e@jic23-huawei> <OS0PR01MB59221A1ADB67E96E9E39D0198613A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNT+NY99n7y3abwa@smile.fi.intel.com> <OS0PR01MB5922DD3C809B78F1E9C5949B8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZNZF6cjx5N+ZsIJx@smile.fi.intel.com> <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922E09340CDCFF54A9A6CBA8610A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Aug 2023 15:12:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6LhvnZ5FE_3BxyH7reVi69Rjcircquk=jYZ6-j3cqug@mail.gmail.com>
Message-ID: <CAMuHMdU6LhvnZ5FE_3BxyH7reVi69Rjcircquk=jYZ6-j3cqug@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct bus_type
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <jic23@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Fri, Aug 11, 2023 at 4:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v7 0/4] Extend device_get_match_data() to struct
> > bus_type
> >
> > On Fri, Aug 11, 2023 at 01:27:36PM +0000, Biju Das wrote:
> > > > On Thu, Aug 10, 2023 at 09:05:10AM +0000, Biju Das wrote:
> >
> > ...
> >
> > > > I'm good with this approach, but make sure you checked the whole
> > > > kernel source tree for a such.
> > >
> > > Checking against 16 is too short I guess??
> > >
> > > drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h has 18 enums.
> >
> > So, what does prevent us from moving that tables to use pointers?
>
> I think that will lead to ABI breakage(client->name vs id->name)
>
>         match = device_get_match_data(&client->dev);
>         if (match) {
>                 chip_type = (uintptr_t)match;
>                 name = client->name;
>         } else if (id) {
>                 chip_type = (enum inv_devices)
>                         id->driver_data;
>                 name = id->name;
>         } else {
>                 return -ENOSYS;
>         }

I don't consider that part of the ABI, as e.g. converting from board files
to DT would change the name.
In addition, using id->name breaks multiple instances of the same device.

I applaud more unification ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
