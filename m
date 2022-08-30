Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34335A604F
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Aug 2022 12:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbiH3KIF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 Aug 2022 06:08:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiH3KH3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 Aug 2022 06:07:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F38ED01B;
        Tue, 30 Aug 2022 03:04:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F26B46144C;
        Tue, 30 Aug 2022 10:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2723C433D6;
        Tue, 30 Aug 2022 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661853854;
        bh=fdP4HSDZA57Z5rG+BH+6jXwALKc82mOYSlsSjUOYm38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AilJL7LGnnpDVez7pwmnrJGd7krUAfPFMhPzmSrDfc0FQiTzC+N9diSRI3aUhXQvF
         MgsJoidKcA9K7cF+/3LNHoOhSRtTGEYC0JnzB8uX6P764sOdrogGjqmmt4sB6LHl1I
         fSFanjvLnptNIEGA/+3B1eLJqnVyCFgz+12PkCmCyxUISk+5DQcJ0qNPHSyTIT8wkJ
         SsWxfI+jvV1UPyYJTEqVOktXAvUocpVzhB2ZyVzjk/NhRKI1jxdZYUp4u516HBRl7c
         lDsB1SSG5Bj9SvFoaKH0eZwN4rVCGjM7J6cMU6R32aU2JqKQMrR4VOK6LegXunogU2
         bMdMCjdMcxPjw==
Date:   Tue, 30 Aug 2022 12:04:11 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>
Subject: Re: [PATCH V3 7/7] i2c: imx-lpi2c: use bulk clk API
Message-ID: <Yw3gm232rIBAUlJy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Clark Wang <xiaoning.wang@nxp.com>
References: <20220823030215.870414-1-peng.fan@oss.nxp.com>
 <20220823030215.870414-8-peng.fan@oss.nxp.com>
 <Yw0dvtRTkW/ISgna@shikoro>
 <DU0PR04MB941748F61D2C10BEF909B2F288799@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i8EgbLXLSK/8t4pj"
Content-Disposition: inline
In-Reply-To: <DU0PR04MB941748F61D2C10BEF909B2F288799@DU0PR04MB9417.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--i8EgbLXLSK/8t4pj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks, would you also pick up
> Patch 2,3,4 in this patchset[1]?

Ah, they are already reviewed. Yes, will do. Thanks for the pointer!


--i8EgbLXLSK/8t4pj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMN4JcACgkQFA3kzBSg
KbYjfBAAsUH57Jl0pvPcBtZFdH9aeOLRz0K05B3/dv6WqEm1RBzehhQy6gnJKlRL
YVG300DxrT0NG4qR4RCDuNQXAf8w86/sn5PyBhgvWq088R60MFo9Z9dT+Eet2Ka3
qKoHhTWa2YdLom2F8Gnqg/6AVsj3v8oEv1m7hXB1pPJw26RrWwoUGH6VZM7/TshA
pdhDaNsZNW+XyWftzaZ87PqBsw5ypalbtC4Y8AOkxR8IB/fTCdGcHYr2UhPZbgop
5WOI0K9l1Jas8NVzWmo7SFtNHOMAuRKyA6dC+7UB26Ct5HJCr1xSeauLR4sU7by+
j8b1h4Uv7hMx86UWdOUm7opBnaLva8In3rNApgJl8QCjOf9sM15xZCSKBcYi8dKN
EMQARpgf1YKFgbhcZzlVDA7aXI+xOIa/uK48ttwN83kSsj32qRnncy8EzW/Ytn4W
XFJ4joWezXHe/lsdSlu4Zqp51xKG4JqDQ7AH/hjN+eKD8KU0J91M4DULHBIc+K6Z
HEk1OoKULJ16GpXzGTxbUjt+zKa/VWtEhlzjYqV5OuB6UP/vBgUTr5EBuSCtQPK8
Yb82dOFu+tCbOTFR8qUUlmij6/pW/ougIXayS1hw/6yK+WD3g95VagEl88KoX37o
MawBqwf8efO+7ls9cMk9CBnjT00RcWFof4ZtWPvC8DgN81t59Q0=
=R91b
-----END PGP SIGNATURE-----

--i8EgbLXLSK/8t4pj--
