Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1550672F706
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 09:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243599AbjFNHy3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 14 Jun 2023 03:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbjFNHyN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 03:54:13 -0400
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C782135;
        Wed, 14 Jun 2023 00:53:20 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-56fff21c2ebso4526997b3.3;
        Wed, 14 Jun 2023 00:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686729198; x=1689321198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVKO0F3nSwUgNwvgXxZdykhH7Fe6dy1ubUvaHr+R9rs=;
        b=JqQ+zhEdg8dkmXAMzpItDbPUBtABA7k/UucnSimivV6Crsaohs3rnMRHdLC7GsmY2/
         IpKPfOPyqgWi4vQzmFbcFF/rzrA78weP2sJw8zgtM+jj7Y4Wv2LznFsYmKSMvtRZE+yI
         gDYIVBMm80JYMP5FJ5tw2MBKM5viI7GS0HpzO5Zd8mz8mw9gfp2GZe8r8m53seD6zJmO
         pwUJo/FqbRhbcN5KBuKzuFwevQ5XGoclefRiJg3Ujt60l5S1stGShUQgutYk6MIi1+OJ
         1xluiCw6JWiOuhqb9dON1lE0YxniFx/k5kN0vdz/JEo/bLnWqXdy9LfKlirb7Tsd6imO
         Zmkg==
X-Gm-Message-State: AC+VfDx51o2OOkJHS/22Dlo8y948I0Gk40PfMkPRiOP6SsTQz+IsC8YI
        jlachLcBbGBHNmVQIiMYu27b+Jej7+zxVg==
X-Google-Smtp-Source: ACHHUZ5MGVQPc1tOSReza0QL5UzNpT1FpmVRBFh7tv++FWyfVZ5fmoHhyuwDeazAsVffQ8Kj++mfMA==
X-Received: by 2002:a0d:d6c9:0:b0:568:b10a:e430 with SMTP id y192-20020a0dd6c9000000b00568b10ae430mr1153467ywd.25.1686729198206;
        Wed, 14 Jun 2023 00:53:18 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id k126-20020a816f84000000b0056ffdec590csm283537ywc.41.2023.06.14.00.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 00:53:17 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-bc9782291f5so366027276.1;
        Wed, 14 Jun 2023 00:53:16 -0700 (PDT)
X-Received: by 2002:a25:fc13:0:b0:ba8:66fb:dd84 with SMTP id
 v19-20020a25fc13000000b00ba866fbdd84mr1309725ybd.20.1686729196541; Wed, 14
 Jun 2023 00:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com> <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com> <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato> <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato> <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro> <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
 <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com> <OS0PR01MB59224D7C95B9B0037046FCF78655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59224D7C95B9B0037046FCF78655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 14 Jun 2023 09:53:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
Message-ID: <CAMuHMdUhaSKiuVkmoYt1sm87emFZu7HSSCK-e95-Yy=g8Sgo4w@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
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
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Tue, Jun 13, 2023 at 6:11 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > On Tue, Jun 13, 2023 at 12:45 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > > API On Mon, Jun 12, 2023 at 10:43 PM Wolfram Sang <wsa@kernel.org>
> > wrote:
> > > > > > Perhaps we should first think through what an ancillary device
> > > > > > really is.  My understanding is that it is used to talk to
> > > > > > secondary addresses of a multi-address I2C slave device.
> > > > >
> > > > > As I mentioned somewhere before, this is not the case. Ancillary
> > > > > devices are when one *driver* handles more than one address.
> > > > > Everything else has been handled differently in the past (for  all
> > > > > the
> > > > uses I am aware of).
> > > > >
> > > > > Yet, I have another idea which is so simple that I wonder if it
> > > > > maybe has already been discussed so far?
> > > > >
> > > > > * have two regs in the bindings
> > > > > * use the second reg with i2c_new_client_device to instantiate the
> > > > >   RTC sibling. 'struct i2c_board_info', which is one parameter,
> > should
> > > > >   have enough options to pass data, e.g it has a software_node.
> > > > >
> > > > > Should work or did I miss something here?
> > > >
> > > > That should work, mostly (i2c_new_dummy_device() also calls
> > > > i2c_new_client_device()).  And as i2c_board_info has an of_node
> > > > member (something I had missed before!), the new I2C device can
> > > > access the clocks in the DT node using the standard way.
> > >
> > > Looks like, I cannot assign of_node member like below as it results in
> > > pinctrl failure[1] during device bind.
> > >
> > > info.of_node = client->dev.of_node;
> > >
> > > [1]
> > > pinctrl-rzg2l 11030000.pinctrl: pin P43_0 already requested by 3-0012;
> > > cannot claim for 3-006f pinctrl-rzg2l 11030000.pinctrl: pin-344
> > > (3-006f) status -22 pinctrl-rzg2l 11030000.pinctrl: could not request
> > > pin 344 (P43_0) from group pmic  on device pinctrl-rzg2l
> > > raa215300 3-006f: Error applying setting, reverse things back
> >
> > Where do you have a reference to pin P43_0 in your DT?
>
> The reference to pin P43_0 is added in the PMIC node.
>
> I have done modification on my board to test PMIC INT# on RZ/G2L SMARC EVK
> by wiring R83 on SoM module and PMOD0 PIN7.
>
> > The last versions you posted did not have any pinctrl properties?
>
> By default, PMIC_INT# is not populated RZ/G2L SMARC EVK, so I haven't added
> Support for PMIC_INT# for the patches posted till date.
>
> Yesterday I checked with HW people, is there a way to enable PMIC_INT#
> and they told me to do the above HW modification.
>
> Today I found this issue, with this modified HW and PMIC INT# enabled on the DT,
> while assigning of_node of PMIC with info.of_node. It is just a coincidence.

IC.

So you now have two Linux devices pointing to the same DT node,
causing pinctrl issues...

I know this won't solve the core issue, but what is the exact pintrl
configuration you are using? Is this using a GPIO with interrupt
capabilities, or a dedicated interrupt pin? In case of the former,
you don't need a pinctrl property in DT, as the GPIO controller itself
should take care of that by asking the pin controller to configure
the pin properly through pinctrl_gpio_request().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
