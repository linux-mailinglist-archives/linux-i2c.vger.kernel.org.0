Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FABE71820A
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 15:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235353AbjEaNhL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 09:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbjEaNhJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 09:37:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC32E128;
        Wed, 31 May 2023 06:37:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205251136.34.openmobile.ne.jp [126.205.251.136])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77CD47F5;
        Wed, 31 May 2023 15:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685540206;
        bh=w7lhf4pqoBdHAL5bnCELqUSHKihCPYIdl1knpofvpWk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ppI5NFfD1GMtk9DtUm0oNVMn5Xp/QdC3CJ8e1gCVxtvw0/lb2ICBG5DvCMZFnV4ew
         NX57GbSCY2EA3Kdo2MYIjqFj+3zz+uQvrQScq08z3KJ60arf64BtJlGuejvOgb5BWh
         8p82Wx+HNiJt33NnSq+FwZPLJNujQzxoi/iUZXrE=
Date:   Wed, 31 May 2023 16:37:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Message-ID: <20230531133706.GI27043@pendragon.ideasonboard.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Geert,

On Wed, May 31, 2023 at 02:51:48PM +0200, Geert Uytterhoeven wrote:
> On Wed, May 31, 2023 at 10:59 AM Laurent Pinchart wrote:
> > On Mon, May 29, 2023 at 09:00:43AM +0000, Biju Das wrote:
> > > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
> > > > And why do you need this ?
> > >
> > > As per Krzysztof [2],
> > >
> > > The DT schema allows multiple addresses for children. But we lack
> > > implementation of parent child relationship, As parent owns the resources.
> > > Child device needs to parse parent node to get some resource
> > > like clocks.
> > >
> > > [2] https://lore.kernel.org/linux-renesas-soc/TYCPR01MB5933BFFD4EB556F5FB4EA82186729@TYCPR01MB5933.jpnprd01.prod.outlook.com/
> >
> > The I2C ancillary clients are not meant to be handled by separate
> > drivers. You're supposed to have one device node in DT, which causes the
> > I2C core to instantiate a main i2c_client, and bind it to one driver.
> > That driver then uses i2c_new_ancillary_device() to create other
> > i2c_client instances for the secondary I2C addresses. Those i2c_client
> > instances are not bound to a separate driver, so there should be no code
> > that needs to look at the parent for resources.
> 
> In Biju's particular use case, the i2c device responds to two addresses,
> which is the standard i2c ancillary use case.  However, what's special
> is that the second instance is a derivative of an existing i2c device
> with an existing Linux driver.  Hence the desire to make the existing
> driver match against the second instance, which requires these changes
> to i2c_new_ancillary_device().
> 
> As some resources are shared (knowledge about the clocks), splitting
> this in two distinct devices in DT (which is what Biju's initial patch
> series did) would need phandles to link both nodes together.
> 
> Do you have a better idea how to represent this?

MFD ? Otherwise, I'll delegate that to Wolfram, I've spent enough time
on this patch series I'm afraid :-)

> Wolfram: time to chime in ;-)

-- 
Regards,

Laurent Pinchart
