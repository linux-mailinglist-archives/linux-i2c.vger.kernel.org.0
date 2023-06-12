Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEB2872C4BB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 14:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234600AbjFLMpB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 12 Jun 2023 08:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235591AbjFLMov (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 08:44:51 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B2B310E3;
        Mon, 12 Jun 2023 05:44:47 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-56d0776f668so10453677b3.3;
        Mon, 12 Jun 2023 05:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686573886; x=1689165886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxM/ZduSHHc2ByKfhrDNrtQdTcq/pb0XRbipJ1pyZng=;
        b=Ud89RTr2uxuszkrIw9fYs1QXtO6bwNDoXr8418gPkozOc8GLp1yQiFBdtM4xOWCRcU
         czQEK2GgKhCcQDPJ9XQI2cWv6CBJel1DyaYUnbglNQ+XRU9Bwgp8pUzPjd+IZ4Gwvwmz
         IpaBETRp7cCOcdYOSoLSiwUSe/ki6Ho01JKVNFxUG9Nnc4HC+7n3vs2MbP8b6+fRgxPx
         95bRMD81wHJA15XtlTCG+IqlU2fUONbp5rQRChmTV2B+JPdGmqwCRIt4j4XPUnrleHlu
         r9rp2ko/tNi7SDiS8Iq476nBl6Q/lXHA/dHz5jizZ+6SFv2M6EZVuQilYxbAMcLo08Hv
         mpeg==
X-Gm-Message-State: AC+VfDxJw5f9iQValVfuIPPpLTUl0tIclQZx7/uUaXxbXxPKcMIe2f5F
        YcVn41XX/5WZ0WB1I0acURvZPtD7QTTbCw==
X-Google-Smtp-Source: ACHHUZ7eJmCTILKbDo8vW9ZYZpfn9B1Z78DpGdBKAT2w6KKwbyT9qp0uC1gQSmQeJWp/Yth1XDP3fA==
X-Received: by 2002:a81:7454:0:b0:56d:3327:825 with SMTP id p81-20020a817454000000b0056d33270825mr1388094ywc.48.1686573886253;
        Mon, 12 Jun 2023 05:44:46 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id w66-20020a817b45000000b0054f50f71834sm2474004ywc.124.2023.06.12.05.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:44:46 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso657961276.1;
        Mon, 12 Jun 2023 05:44:46 -0700 (PDT)
X-Received: by 2002:a25:e7c4:0:b0:bc9:a420:994e with SMTP id
 e187-20020a25e7c4000000b00bc9a420994emr2304847ybh.10.1686573885869; Mon, 12
 Jun 2023 05:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro> <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com> <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com> <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612122353.GA22391@pendragon.ideasonboard.com>
In-Reply-To: <20230612122353.GA22391@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Jun 2023 14:44:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVciwfbcnqXy=gmMjyv1_pJtvxp5Sp4osx73M-jxVKRg@mail.gmail.com>
Message-ID: <CAMuHMdWVciwfbcnqXy=gmMjyv1_pJtvxp5Sp4osx73M-jxVKRg@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
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

Hi Laurent,

On Mon, Jun 12, 2023 at 2:23 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> > Hi All,
> >
> > How do we proceed here between [1] and [2]?
> >
> > DT-Maintainers suggestion:
> > [1]
> > raa215300: pmic@12 {
> >       compatible = "renesas,raa215300";
> >       reg = <0x12>, <0x6f>;
> >       reg-names = "main", "rtc";
> >
> >       clocks = <&x2>;
> >       clock-names = "xin";
> >       /* Add Optional shared IRQ resource and share it to child and handle it both in parent and child */
> > };
> >
> > Laurent/Wolfram suggestion to split it into two nodes and get rid of this patch:
> > [2]
> >       raa215300: pmic @12 {
> >               compatible = "renesas,raa215300";
> >               reg = <0x12>;
> >
> >               /* Add Optional shared IRQ */
> >               renesas,raa215300-rtc = <&rtc_raa215300>; /* Parse the handle and Enable RTC , if present.*/
> >       };
> >
> >       rtc_raa215300: rtc@6f {
> >               compatible = "renesas,raa215300-isl1208";
>
> Make this
>
>                 compatible = "renesas,raa215300-isl1208", "isil,isl1208";

"renesas,raa215300-rtc", "isil,isl1208".

However, that would suggest the RAA215300 RTC can be treated as
an ISL1208, which is not true for all revisions...

> Btw, it would be nice to convert
> Documentation/devicetree/bindings/rtc/isil,isl1208.txt to YAML.

Hey, look at patch 2 in this series ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
