Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E27722235
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 11:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbjFEJav (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 05:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbjFEJat (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 05:30:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F0CBD;
        Mon,  5 Jun 2023 02:30:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3C37621D3;
        Mon,  5 Jun 2023 09:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D5CC433EF;
        Mon,  5 Jun 2023 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685957447;
        bh=GGlOcAGW9SPn7EFuuc+2lfe0AlLGsZAzDDEdxTJef1Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V6uOjxAi9MmOwLBwkTvJkBBvBCqMcaVaAJMzHP6bUiUvgkALI70C2AN4MdHOl9iyA
         sfpivVDM72hepyGW51mrIo8s6e7vvo9fE3LN6umUHO8ch7TS7KcJ4TZdtHREVnRuH7
         PJR319PiAXThyr48ZeOzh/6oqf4DyAJzJ4FE7Tln2x8aflIy7GEr2qBPiwvX0kEDB6
         3LVeMSvqkuFMTyO5EJEqk4PlZZUOtmoT2ZeU8jyRHyqFqwrQDouDiTWWA1CGMayfKx
         lr2FOZ5uw/iFpDkapMt05pOgAHInRThFUSnq2eAASZ4XTdIlRi+uIfM1PppYtHtdbQ
         nzkaZ5rHQMLaQ==
Date:   Mon, 5 Jun 2023 11:30:44 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <ZH2rRAMe7+MATuao@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nY4I2iNGV/UDZ0aJ"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--nY4I2iNGV/UDZ0aJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Wolfram: time to chime in ;-)

I'll have a look this week.


--nY4I2iNGV/UDZ0aJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmR9q0QACgkQFA3kzBSg
KbZhhQ/+Iqw/3I/2FLvudgR69quUiOsVQrtXBrBAiLONcFRBzf0k0ko+dYhxxorr
nxUcHocBSM8AxRIhv6nmaLxdQQTyU1MBHObbfX4zjmTgQFECbUWt4mVDTVJZOErZ
F08SZ5KR1aqVWtDXFZuEjE8TXZBWttvjzAinW+uevqPw3wrH8SCSv9AW1h2V8IMr
j8D4aFQVdylLvQelx38YqMQ+IhqMdtFZy4ojX5nbRDY6SaZMZQzG6qL2UWp9dVT5
tJaDag3ca+XGan33m/3biglwZJMxpzVxDlGCNJKhbfTkk+Wyqn7ZLH8xaBkMNDJS
RRSAPHL109hysXnc1sYFH3Rj5cPO2xluOHDKNFxkNx5mHzIBqzOx7NYJVElHKU6h
U1dAual3MdcCx2F1zXxA6Cy7NwB/JM5dNaXGpXxlOt3ITY8G8U9TNNnn+pWEMEbc
TOIcgVC0JOFX76cUclAwCxOPuPI2NYgeiSCw+A0gNbRxz3PMnJ65qyKtbAZp9r9m
mkdRe/Bw0scaE4dGhvVP3CVjiNcJgtYY/DiDfuGmiiMx1JRLnOqFa2DkYib5GwM0
KdSxRJTAfFF/RJchU9Br/xmo60frJnho0GIHWB6dNJuouw6022JBHpqZ3TLOfQ13
HZoa6+zK3XItBJujN/LDXqSTYUwa3Nu/jNoAaFifv3AbkVU4g4M=
=duGk
-----END PGP SIGNATURE-----

--nY4I2iNGV/UDZ0aJ--
