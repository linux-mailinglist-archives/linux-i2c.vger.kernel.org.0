Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB3872E67C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 17:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241084AbjFMPAW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 13 Jun 2023 11:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbjFMPAV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 11:00:21 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD0DE5;
        Tue, 13 Jun 2023 08:00:19 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-75d4b85b3ccso104572085a.2;
        Tue, 13 Jun 2023 08:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686668418; x=1689260418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCZylnYVESKbr03w+qaTawlaNs+/D1wETaN7cDLoL5w=;
        b=h7mRRon1AfdXBSb6VNymN7CiInAtR3zN3Ebf2osauCNC1OYvVZEAM+xz4omZb+fymp
         P2EeEIGh9CmqzShvQT3BKXL+WCQGJd83adbQlEl9f0I8zwQkGMy6Xpi2cOqYp2+L8jdd
         XYZThbqhsU2sM40b1lG4vvOXxWOFGIW8mzNPZXuNED8NmeH1Y0gYbJByQEJbAL9BuL4r
         /Owka2tU8Uky9TaVzdzYbcj1zlAd2Mpmk8+ucs5zOzszLrQG86UmH7JG6DJxTxk8iH6f
         ahgO4IzhwnQ/52IgRFZkGAQgXvsP4vhTkZjy4DFldPoprWyv6pGfOU66IP0er4nSwp+s
         A23Q==
X-Gm-Message-State: AC+VfDyi3jscrAbCBKn6xZ2iGrioL/iwQKG9grzuqx/asBu8uZUvOXRz
        9594G5CtqeFg7xlwXLawxTXHkDZB/uO+Okuh
X-Google-Smtp-Source: ACHHUZ7aNbfLovc1tsSZwLxUh7v5Tw+sr+IXn+vOfC6FjwUse7rGt63HRqJy1YxpEnImUZl1CVtTfQ==
X-Received: by 2002:a05:620a:8c96:b0:75b:23a1:362c with SMTP id ra22-20020a05620a8c9600b0075b23a1362cmr12349100qkn.61.1686668417521;
        Tue, 13 Jun 2023 08:00:17 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id h24-20020a05620a10b800b0075772c756e0sm1474651qkk.101.2023.06.13.08.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 08:00:17 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7606bc82639so105016385a.1;
        Tue, 13 Jun 2023 08:00:17 -0700 (PDT)
X-Received: by 2002:a25:9f07:0:b0:bc3:cc17:6250 with SMTP id
 n7-20020a259f07000000b00bc3cc176250mr1355567ybq.1.1686667920065; Tue, 13 Jun
 2023 07:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com> <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com> <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato> <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato> <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro> <CAMuHMdV_Ty=rkcMzsrnJ3YHZngRbyWvYjR_K9Zh7RiAJ4LbvKg@mail.gmail.com>
 <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59225195B4F2C771F302F7EE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Jun 2023 16:51:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
Message-ID: <CAMuHMdUTAerddXG3zJVRZEAwcrR6V=NFeHwsKV9_tE+ccfw6_w@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

On Tue, Jun 13, 2023 at 12:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > On Mon, Jun 12, 2023 at 10:43 PM Wolfram Sang <wsa@kernel.org> wrote:
> > > > Perhaps we should first think through what an ancillary device
> > > > really is.  My understanding is that it is used to talk to secondary
> > > > addresses of a multi-address I2C slave device.
> > >
> > > As I mentioned somewhere before, this is not the case. Ancillary
> > > devices are when one *driver* handles more than one address.
> > > Everything else has been handled differently in the past (for  all the
> > uses I am aware of).
> > >
> > > Yet, I have another idea which is so simple that I wonder if it maybe
> > > has already been discussed so far?
> > >
> > > * have two regs in the bindings
> > > * use the second reg with i2c_new_client_device to instantiate the
> > >   RTC sibling. 'struct i2c_board_info', which is one parameter, should
> > >   have enough options to pass data, e.g it has a software_node.
> > >
> > > Should work or did I miss something here?
> >
> > That should work, mostly (i2c_new_dummy_device() also calls
> > i2c_new_client_device()).  And as i2c_board_info has an of_node member
> > (something I had missed before!), the new I2C device can access the clocks
> > in the DT node using the standard way.
>
> Looks like, I cannot assign of_node member like below as it results in pinctrl failure[1]
> during device bind.
>
> info.of_node = client->dev.of_node;
>
> [1]
> pinctrl-rzg2l 11030000.pinctrl: pin P43_0 already requested by 3-0012; cannot claim for 3-006f
> pinctrl-rzg2l 11030000.pinctrl: pin-344 (3-006f) status -22
> pinctrl-rzg2l 11030000.pinctrl: could not request pin 344 (P43_0) from group pmic  on device pinctrl-rzg2l
> raa215300 3-006f: Error applying setting, reverse things back

Where do you have a reference to pin P43_0 in your DT?
The last versions you posted did not have any pinctrl properties?

v6: https://lore.kernel.org/linux-renesas-soc/20230602142426.438375-5-biju.das.jz@bp.renesas.com
v5: https://lore.kernel.org/linux-renesas-soc/20230522101849.297499-12-biju.das.jz@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
