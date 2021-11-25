Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 500B145D741
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Nov 2021 10:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345738AbhKYJiP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Nov 2021 04:38:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:34420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354097AbhKYJgO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Nov 2021 04:36:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04266610CF;
        Thu, 25 Nov 2021 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637832782;
        bh=LtCgSeMq4Nj9aV36OofJNPQSpqKGjBfqvw+CtKS+Z6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NQW4ZkLIde1LF6/Kgj4Y10Q26D1aFtiFkWyIgWlbVVBUyQDsdkZT2krgwUnQ4XKqd
         qR5r9uqIks2Upg5Ze9MGmeXdyanTMsQUPErkL9WsjCqUm7PIJ3IY3RQqaNz54/hrQP
         QHDD4zXUFiDEoygsfUIYtW0vpOe+t6JeLy2Wyz3v4jj2Tnq7V3WKG+g16KsrwCEv5c
         8Y/N/U3cco7PnPgR8W6jhiSP4yql+efFOFLttYP61kKD1bUyuy3bE5L9k7EigkDT/w
         A+0hpw+Pop1w/NKnHrbDqGchdUorJJw76ES7D28z+g77QTEwDrfWub91q/NheLOVtb
         F+i3gV7aCMQ8g==
Date:   Thu, 25 Nov 2021 10:32:58 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Peng Fan <peng.fan@nxp.com>
Cc:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: Re: [PATCH V5 0/8] dt-bindinds/dts: support i.MX8ULP
Message-ID: <YZ9YSkdpXIK/LwKh@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@rempel-privat.de" <linux@rempel-privat.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <20211120113454.785997-1-peng.fan@oss.nxp.com>
 <DU0PR04MB9417A88AC1808CBEE76A27E188629@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <DU0PR04MB94178AB147B5DA8C32F1531388629@DU0PR04MB9417.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Tsd6oFXSzdI9VGy6"
Content-Disposition: inline
In-Reply-To: <DU0PR04MB94178AB147B5DA8C32F1531388629@DU0PR04MB9417.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Tsd6oFXSzdI9VGy6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Seems there is conflict after Abel's patchset in next tree, I'll rebase.

True also for the I2C patch. A rebase would be great!


--Tsd6oFXSzdI9VGy6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGfWEcACgkQFA3kzBSg
KbbaCg/+NnWT4wcaSbbzPB7BWeiyRxc347BdDa5okGckaD5+rWvtgMTNQ5/lyOWI
VjfrLFYmCBLx2rznwcs6nX4ZITripFyIoDe65VMH7zcXLt/2A/LgOq544eCkbu5p
d+NmSV7O1RhdxpRtJqm3ZtrXWZC6aq6Cbh4DJRSWkFumICD9L1HvhR5rwgLYQKRN
wrWP4Uh1GVNqm1xZU31sScYqTykNL06Hih1xsJVGN4HFCLRJ1DsB9Bb2944WviN9
3/NEonimQfP3n7+3jS+xS029y0P40pERJg2riauWtzgUtYaOw+JSFpWRkrIl6gz4
OAQBeUP3hsePkHP426BJWxOKoNIUmEYkxgqDKYIaq9ahZjJe6E2amd+2rOzOdg+M
p/fTKPg+zgQ1xKyT31cHqT9fbva0Z+dn0gGhFujWpzEHDTk6GNEeP+0ruwLavtVW
kYmu5Bjho/ly7VtmZwRQ3/qqW87HdX9rtBQcNFQhCBQVxl+zyI0N03zXRMTmuXYa
Y5ZhZqHUG5al40IGDPfYG0gp+JPkmyIRby7iUNP9I2VWQPvdiIq8MS7VWUsHZz21
LINJOQ9/YqEAd3h1ufi2jOYBc0Jgx4EMshxxyFp0VuAsWEzW1TS72nnK30nF4Hl2
fS+y5rpZkxjIIUTYLGF0m2ypjkvw4ffxFDDsaBkqoM87/DI/i4g=
=8HuN
-----END PGP SIGNATURE-----

--Tsd6oFXSzdI9VGy6--
