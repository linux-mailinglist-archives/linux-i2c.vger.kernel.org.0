Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA8372D0E4
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 22:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236558AbjFLUq7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 16:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236860AbjFLUqn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 16:46:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67ACE171C;
        Mon, 12 Jun 2023 13:46:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 95A6E622C1;
        Mon, 12 Jun 2023 20:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E758C433D2;
        Mon, 12 Jun 2023 20:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686602617;
        bh=21JfPTParSLQtiX/dtliNty5l5Vn4im61cRIbAqOqfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=soi73ChJhvjFrASn3WpwMpFtiNfzmW8kSFLhK2pUhqr/takPd99yDS5m/YhncdwUN
         y1sM0LUSuAsG0mrllJtLx2MA+mudBNHqjB2HVZJcgSRm2nWbAIT+lvZCjV54XB23qE
         el3gxA3FmdpVZb0Ck/Oi9Kq+txyt9T2C0sIuCAaKQo7mslC66R6Fdpas6WKM8br4lt
         6NaQWbKLIqv108cZc3af4uDfgjmkKT75bRf4Kr52N1wzfkj4FJMF1ydCxYxpZZ6eNF
         cDO9XFMqgfbZ5vx+SM7gHWm/OPfF4TGnIQRrJMrn6llyJp+0ATg4P81IKFTdAn66fS
         72mcrFv0DgKvw==
Date:   Mon, 12 Jun 2023 22:43:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
Message-ID: <ZIeDcVcfxfcMx/BP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JQD6/ViKqbjI8+zP"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JQD6/ViKqbjI8+zP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

> Perhaps we should first think through what an ancillary device really
> is.  My understanding is that it is used to talk to secondary addresses
> of a multi-address I2C slave device.

As I mentioned somewhere before, this is not the case. Ancillary devices
are when one *driver* handles more than one address. Everything else has
been handled differently in the past (for  all the uses I am aware of).

Yet, I have another idea which is so simple that I wonder if it maybe
has already been discussed so far?

* have two regs in the bindings
* use the second reg with i2c_new_client_device to instantiate the
  RTC sibling. 'struct i2c_board_info', which is one parameter, should
  have enough options to pass data, e.g it has a software_node.

Should work or did I miss something here?

Happy hacking,

   Wolfram


--JQD6/ViKqbjI8+zP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSHg24ACgkQFA3kzBSg
KbY/MA/9FGoFtfL8yjced9NBJXfmzXXa3OhewlHwumj5oCkCOPlzma9ZNis/NDcQ
z8XapX8noWSLHEcHDr6rByEC89Nmkm2gAdSGUh1Z1K4fuQNU0l2mSc2OZzrZtG3e
YjbJiWuLajtrJF0OFn4hKGAKivPLwVW0BjUmn/jgtebQfU7LzjjM4b7Yqik4VJnk
H+7DAsMBOdqFT3Q0XlQOaAR9AXJtQDOprmcUEo7dfMsmW+Z9tgn8edyTnEEo6dOt
ocCR4Eorj5fccYVh3RlbF0rSeuU0NAmy+6kK64fTwxAzp1S6akhQXUyF3QXGaaTz
206Qb12HV/FE97nv3pH41AufRmTxC0goIweXX4Y71oGKRNt8cJvidHtxgNBw8X5M
mYTsj8ddS6ktOT7Kivxtoq4dJe6HJIwJpzKfBVfiRbX4G9lH5kdbIrUYGhNrdKcD
sCQ38/4CL83BetGFFlit3sNZXziZKyBG/fpWezk8UE31Wv/JP1BbVJHMt1TfxjGa
qQuC03AAclMKVZfoL2niUKeDGj1nCUHAfXOHnqPOHnLgcjI2rTwA7BNO9YGPZQ2s
UMlIhhL1VTEwqjH00o7YSbfbhXeWPYmO1pwlSPU+D+TGd3Y+TCz3NI9NR/3Gocyw
jtQYtrvShQIn7wmVgZpRBnoLSb5rt+YNwsOZ1gG77iVdrE79by8=
=2Hse
-----END PGP SIGNATURE-----

--JQD6/ViKqbjI8+zP--
