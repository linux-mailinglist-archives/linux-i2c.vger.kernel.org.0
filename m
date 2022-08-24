Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7254B59F31D
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Aug 2022 07:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiHXFre (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 24 Aug 2022 01:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiHXFrd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 24 Aug 2022 01:47:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0896F560;
        Tue, 23 Aug 2022 22:47:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9E52FB822F0;
        Wed, 24 Aug 2022 05:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7D1C433D6;
        Wed, 24 Aug 2022 05:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661320048;
        bh=hqmLRG66G3VXJWEyh+sdnePdhDkvWz1Hi3kb7meLWhg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b6QVN48Yf5S4EjQ+KiI48QiRIjg4xzhfg53IIp8nUdtxPHLEpMDZk5qm58+ASKYHD
         DJvyUVRdNBl6ilHxmQnifA6bsvuWNks4UBd7Gt63PVilZ3rznsPnKV3c/t975jvQFv
         WZLyW622S6prMpxWMB50IzC9XoS2dogMKt36HzNaZj7Gm68Cxzy7Z63saXwafmrL99
         TCFuBrEHR4LssGh0Z9ezs94SuPd4C3hVgrX1vCEut20YDaUpckSByzrLtsvEjBABgF
         Jg2Ljx7KctDhphAJZIwb1BWezzh4ajrHid0wob4YXnIPsJCfOCz4ZyuoTRzVoHEdzh
         7T2RCthA6sPkg==
Date:   Wed, 24 Aug 2022 07:47:21 +0200
From:   "wsa@kernel.org" <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peng Fan <peng.fan@nxp.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
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
Subject: Re: [PATCH V2 0/7] i2c-imx-lpi2c: add IPG clock
Message-ID: <YwW7aROy3kSkumKQ@shikoro>
Mail-Followup-To: "wsa@kernel.org" <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
References: <20220816125526.2978895-1-peng.fan@oss.nxp.com>
 <DU0PR04MB9417E7BD5F1FB7A8E00BAA3F88719@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <7eb3cca0-1be6-8f7f-a7bf-f0c9478e7080@linaro.org>
 <DU0PR04MB9417CA946AD601F900500A5488709@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <15fdd5c2-9c01-ee4e-98f9-559e926d9925@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="25+iC2upX42eIGGl"
Content-Disposition: inline
In-Reply-To: <15fdd5c2-9c01-ee4e-98f9-559e926d9925@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--25+iC2upX42eIGGl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

> Awesome! But you don't need my ack after such update. The ack or review
> is expected from maintainers and I am not the maintainer of IMX I2C
> driver or IMX platform/DTS.

Despite the fact that the ping was in deed too early, I think Peng Fan
has a point. If you suggest a change (Thanks a ton for that!), a quick
comment on the new version if the change reflects what you had in mind,
is fair, I'd say. Something like "Yeah, looks basically good, but the
maintainers have to check the details." I understand the "all too busy"
part, of course...

Thanks,

   Wolfram


--25+iC2upX42eIGGl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMFu2UACgkQFA3kzBSg
KbaLrg//ZQR1by58/D+EoZeqOxURRxLGkgjcTZZU7BS4AarhtiVtSlIs3AhTPL6V
aG7JJECEhe7LOtCNAYrh/+ZINPsB9OLsMgCWGFssntZuMXiKpB8p9sbfa+4zZkA1
xjCc3vNbHUq4gdZSrPzGT6RY3VrDHSgwYBnoGic2o8MSQb/Ih+E/5+wNdBPwTeKy
ky52exNTSzolgUGJsJPmiCK2QYMHysKNLDV7o/jJWkpPBAqtAE+N2il7hjSBGdTZ
IhBneFnJ/0C1kVBUoR75z+p0ShQpuTkqIc6S/DQ5+sayHJZfovEBf33VKS+XIm/o
PdP6Whp0SNQBveB9r8y7RznSIHd3X+vnwn5fV7rvcCRzi7f7NqHz4Pfu67G4NUkm
VpByVnyEN7yOXnSyb1gxgKPPLyujBd89MIH1OxCWY1zqmgjuJvkGnnMI9gnVqGkX
NfyFWXM9zqtbHzNZUi7o4Y5XiwvP3nqSaMT5JP9pIRrR460eEDpkMgAVmoh3dOd6
7qOQUDdwdaqu67eViXrVhMsBLHinUkY8wuEAHU71Wf6JeQhH4MmXsJi+ziZfCHQs
6rV++bDOrtK/sUt4xTdpBJ5Bfk0PbXi+wTCheF6+dto/CByht+zkZRkUjh61WLta
DqeLd7iI7vL+lGlhXLeCs8qenOIZWaKxRe/3qUMZejdF369/6SA=
=CThz
-----END PGP SIGNATURE-----

--25+iC2upX42eIGGl--
