Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8F072C557
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 15:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbjFLNCP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 09:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234576AbjFLNCO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 09:02:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8059DC;
        Mon, 12 Jun 2023 06:02:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55540C4C;
        Mon, 12 Jun 2023 15:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686574901;
        bh=myI2OsDKPlAivJwq8XHEp21SionS1U4YLnRbxXj2LGM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nEvpQz3C+gVmmfjX1TWlXKZadMDfgm7VXB+hbeXpYCo/EwWR8ziagLTg7r1u2qAM7
         eGV8lH3OnJtndQCZyYybiXS9leMtWb+SgKqU9fd0WU8NTKZatD5cwCE8oYOEH877Kn
         iS4L85ifZlV5qrB+6pQyzXNHIW2edRov0Y3Y3nJk=
Date:   Mon, 12 Jun 2023 16:02:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
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
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230612130210.GB23921@pendragon.ideasonboard.com>
References: <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230612122353.GA22391@pendragon.ideasonboard.com>
 <CAMuHMdWVciwfbcnqXy=gmMjyv1_pJtvxp5Sp4osx73M-jxVKRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWVciwfbcnqXy=gmMjyv1_pJtvxp5Sp4osx73M-jxVKRg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 12, 2023 at 02:44:33PM +0200, Geert Uytterhoeven wrote:
> On Mon, Jun 12, 2023 at 2:23 PM Laurent Pinchart wrote:
> > On Mon, Jun 12, 2023 at 09:53:02AM +0000, Biju Das wrote:
> > > Hi All,
> > >
> > > How do we proceed here between [1] and [2]?
> > >
> > > DT-Maintainers suggestion:
> > > [1]
> > > raa215300: pmic@12 {
> > >       compatible = "renesas,raa215300";
> > >       reg = <0x12>, <0x6f>;
> > >       reg-names = "main", "rtc";
> > >
> > >       clocks = <&x2>;
> > >       clock-names = "xin";
> > >       /* Add Optional shared IRQ resource and share it to child and handle it both in parent and child */
> > > };
> > >
> > > Laurent/Wolfram suggestion to split it into two nodes and get rid of this patch:
> > > [2]
> > >       raa215300: pmic @12 {
> > >               compatible = "renesas,raa215300";
> > >               reg = <0x12>;
> > >
> > >               /* Add Optional shared IRQ */
> > >               renesas,raa215300-rtc = <&rtc_raa215300>; /* Parse the handle and Enable RTC , if present.*/
> > >       };
> > >
> > >       rtc_raa215300: rtc@6f {
> > >               compatible = "renesas,raa215300-isl1208";
> >
> > Make this
> >
> >                 compatible = "renesas,raa215300-isl1208", "isil,isl1208";
> 
> "renesas,raa215300-rtc", "isil,isl1208".
> 
> However, that would suggest the RAA215300 RTC can be treated as
> an ISL1208, which is not true for all revisions...

It depends. If we add a renesas,invert-xtoscb DT property, then it
becomes true for all revisions.

> > Btw, it would be nice to convert
> > Documentation/devicetree/bindings/rtc/isil,isl1208.txt to YAML.
> 
> Hey, look at patch 2 in this series ;-)

-- 
Regards,

Laurent Pinchart
