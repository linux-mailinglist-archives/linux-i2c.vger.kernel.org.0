Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96FC871821B
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 15:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbjEaNjz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 31 May 2023 09:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236113AbjEaNjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 09:39:49 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F731101;
        Wed, 31 May 2023 06:39:48 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-19f56608dc2so1880440fac.3;
        Wed, 31 May 2023 06:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685540387; x=1688132387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rSOChSb4Rql4ADuqVo8nyBzIdfufwXtQLzEn6jqADzE=;
        b=NqxZR4bpMz3NxuAEMIVKm13sYZoGkMvY8ROmN//1rVod+A/4e4fIIRZXbpozl6PYDR
         BLPLcTsf/2HHsdz51Bw6vBQiJRIT9an7/yG1/a/7d+jsHZUWiWmjlfv3teZo3Xnk1AWq
         3wolaYja30YcAETFoMJOKG3fPEH7GdvyUwqcjKTLtlA0d3RUem1WAJSkKsPMuXnstbxK
         VLKR79teol3fuOUAmT/tELusICpVU9THXQ0evEeOO23K+/aE+IMwTPQj+cBWkDzlktJz
         4U3S5iZLiwqjHi3+RlZt/YXftnop4SqQdvJ4/zR8KdrUZiT3B/Nx4ak08KBJpjzMFc+f
         O08g==
X-Gm-Message-State: AC+VfDw6kl8GJuCPMxbMs0ScPZZ/yWTwl8ShhfTNFTwZt7/H13znrNz5
        0Fzlw/uDZ3A2P7RKVECXZIa1AGiViEP89A==
X-Google-Smtp-Source: ACHHUZ4X7pNeQ8tFNP2s3GCxS9J9KB1oWMSUXqUCK8ZxgK7yyx8L9yOwZuYIyw1ssp01CKhuLBPptQ==
X-Received: by 2002:a05:6870:3a2b:b0:19e:c953:d854 with SMTP id du43-20020a0568703a2b00b0019ec953d854mr3091895oab.52.1685540387215;
        Wed, 31 May 2023 06:39:47 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id w3-20020a9d6743000000b006ac98aae2d3sm472016otm.40.2023.05.31.06.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 06:39:45 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1a1293c8e25so312518fac.2;
        Wed, 31 May 2023 06:39:45 -0700 (PDT)
X-Received: by 2002:a05:6870:5ab4:b0:18e:dec0:8d09 with SMTP id
 dt52-20020a0568705ab400b0018edec08d09mr3880986oab.34.1685540385002; Wed, 31
 May 2023 06:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com> <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com> <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <20230531133706.GI27043@pendragon.ideasonboard.com>
In-Reply-To: <20230531133706.GI27043@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 May 2023 15:39:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDmyn00sX0n=KTL+HuxQc3SpfJQKJR4uhfTvTW-U8=ig@mail.gmail.com>
Message-ID: <CAMuHMdVDmyn00sX0n=KTL+HuxQc3SpfJQKJR4uhfTvTW-U8=ig@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

On Wed, May 31, 2023 at 3:37 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, May 31, 2023 at 02:51:48PM +0200, Geert Uytterhoeven wrote:
> > On Wed, May 31, 2023 at 10:59 AM Laurent Pinchart wrote:
> > > On Mon, May 29, 2023 at 09:00:43AM +0000, Biju Das wrote:
> > > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > > > And why do you need this ?
> > > >
> > > > As per Krzysztof [2],
> > > >
> > > > The DT schema allows multiple addresses for children. But we lack
> > > > implementation of parent child relationship, As parent owns the resources.
> > > > Child device needs to parse parent node to get some resource
> > > > like clocks.
> > > >
> > > > [2] https://lore.kernel.org/linux-renesas-soc/TYCPR01MB5933BFFD4EB556F5FB4EA82186729@TYCPR01MB5933.jpnprd01.prod.outlook.com/
> > >
> > > The I2C ancillary clients are not meant to be handled by separate
> > > drivers. You're supposed to have one device node in DT, which causes the
> > > I2C core to instantiate a main i2c_client, and bind it to one driver.
> > > That driver then uses i2c_new_ancillary_device() to create other
> > > i2c_client instances for the secondary I2C addresses. Those i2c_client
> > > instances are not bound to a separate driver, so there should be no code
> > > that needs to look at the parent for resources.
> >
> > In Biju's particular use case, the i2c device responds to two addresses,
> > which is the standard i2c ancillary use case.  However, what's special
> > is that the second instance is a derivative of an existing i2c device
> > with an existing Linux driver.  Hence the desire to make the existing
> > driver match against the second instance, which requires these changes
> > to i2c_new_ancillary_device().
> >
> > As some resources are shared (knowledge about the clocks), splitting
> > this in two distinct devices in DT (which is what Biju's initial patch
> > series did) would need phandles to link both nodes together.
> >
> > Do you have a better idea how to represent this?
>
> MFD ? Otherwise, I'll delegate that to Wolfram, I've spent enough time
> on this patch series I'm afraid :-)

That was v2... (do I need to repeat I don't like mfds? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
