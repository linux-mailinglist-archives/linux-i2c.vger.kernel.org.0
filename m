Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E81BA6CF2A4
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Mar 2023 21:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbjC2TBX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 15:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjC2TBW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 15:01:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE8F4C2C;
        Wed, 29 Mar 2023 12:01:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C8BE161DD6;
        Wed, 29 Mar 2023 19:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83686C433D2;
        Wed, 29 Mar 2023 19:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680116474;
        bh=1fcM3b9krHlsO5Snx/0pCVZjh+4M52SYgMLtCtPR/bs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S6xDW15xix0ogYtL7mwp+uLPOEhBNRfsyhTiWC3wbvbbnSzAfXkLtFPpemg87HfWr
         fU8z86NERRhUKbWMxHUGvGzaR+XQ3fGM0H3WNqPbeaH95WXPiRqY3ptNCS6tMDBGOi
         BNM6EewLbzeCg3j2Qp6i6CCFLD6izWykzSoOs7QN6Jnd1s7s83f2b1Xii1iiACtCku
         2FhVezAfD/fIRwFiPsUbv4ZqQmxh/Oo5XhAtApVlooVhjQHN9iyJn7AW7mtB+boZtP
         IX1sqrQECL2EBrGaNN6CMEV3jPCNIE3xNDMOnAsoyRbuywYjRCYqniKEshxTwqeiWN
         tSj3DQvfdiQyQ==
Date:   Wed, 29 Mar 2023 21:01:10 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] treewide: Fix instantiation of devices in DT overlays
Message-ID: <ZCSK9lf9m7p0ikA7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VcqNrUduYzya4aYk"
Content-Disposition: inline
In-Reply-To: <240155f20aae47e9f7461e2b7416120ba6238886.1679650087.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VcqNrUduYzya4aYk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 10:30:39AM +0100, Geert Uytterhoeven wrote:
> When loading a DT overlay that creates a device, the device is not
> instantiated, unless the DT overlay is unloaded and reloaded again.
>=20
> Saravana explains:
>   Basically for all overlays (I hope the function is only used for
>   overlays) we assume all nodes are NOT devices until they actually
>   get added as a device.
>=20
> Based on a patch by Saravana Kannan, which covered only platform and spi
> devices.
>=20
> Fixes: 4a032827daa89350 ("of: property: Simplify of_link_to_phandle()")
> Link: https://lore.kernel.org/r/CAGETcx_+rhHvaC_HJXGrr5_WAd2+k5f=3DrWYnkC=
Z6z5bGX-wj4w@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Mark Brown <broonie@kernel.org>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--VcqNrUduYzya4aYk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkivYACgkQFA3kzBSg
KbZTyg/+JmtqKwpf8rDuGRxTxPx0/p4sgTM+XIbYWkv0BEIR7cphrzWAX9CPNtqG
TZNmOEdTXAw0/UQnY70eVFJoMV8j8WPoGANBEUesg3aSM46xZjhLgtb6LEGw2SeP
J1EggS1DogDgwflj+WLRG4vbvoTId7n92HRWALypUrFM6hOD5SeG1wU3pgVjf4NN
8LPn0HcQD1RfN0BMo3h5l2MASWxONBMnD7gUBpQyP5zdOKg3GxF6rWxfORSMqwQq
Bq/Ov+yZ5IYwIzSnRgFmfT30GFfo4mqrvHee71TrPG1EnrofWlMx0fmaTxikvXFB
mUvL/pN+LRhdjYeqDzDZG2nCFqb7R6tqaRTt/Ydvtxg4M7RQW+srtg2XyLpoueD3
sJ5JFf8vmeH9S3rKInxbiO1JBD/dj3VWADve+D1a0luQ2gNqsDZxP4hwr56bxhSR
q8tWKtuFixklWESZMKxxHeAt9Up2YlKdo+xpsJz8yL36Y7BlhWPc7M5Hz5qcqRcg
GdRDqLCZrT9LaYHJB2WI6qhz7gtQ9rHQz2Oao4LsD1CVFTz/D9Ji900GfX53zyo1
n7UCdK2M2zXgcTktkVz0rv1vSy3JFhCI6fm/zdSohaY/bP4k9SMITuTrC2RMW6Y4
zr2euXaosZIYU6pMpP6/SVytm7BngxR27b4d118ZYeSwFEw8YHY=
=u3R2
-----END PGP SIGNATURE-----

--VcqNrUduYzya4aYk--
