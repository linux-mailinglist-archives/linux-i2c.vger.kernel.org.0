Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAC32674F9C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 09:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjATImZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 03:42:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjATImY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 03:42:24 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C710D8534B;
        Fri, 20 Jan 2023 00:42:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6219F61E62;
        Fri, 20 Jan 2023 08:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63366C4339B;
        Fri, 20 Jan 2023 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674204142;
        bh=tB0MmybYo3CIQd+gytr6S3Y+F0W3ehGkmi3+XA96szM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AMV02sHEMtZDjobYL/T669czLEGSbDoQX6as42+vgygCGbcY+YD7ZUieJA7g8W5jn
         /B08jybxOVX+tZ3rgjLqVemGoktwZd1kraYFLy8zTFxuFZeHf7AI/iT+yqGe4mi4M9
         CU8QD1EFJ8RbnLM64LKZzBMuLPYgqPB3gENwjRjoOaQzza6CihZie+DgOgEixn3qDK
         oTeV3Kpz9bAIS6EUlzq3QATDPZPvQ19ScreBoX0em2WLMOFwT8SzfA56PfwISRs61x
         R4Y1X+uUjzJUO1IZFzN3mRmOdCZd7PgHdvVex4bPonMy7HTtrCPurvNlOBqe/1wafO
         XH0vZ22MYvTsQ==
Date:   Fri, 20 Jan 2023 09:42:17 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Alexandre Mergnat <amergnat@baylibre.com>
Cc:     Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-i2c@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: i2c-mt65xx: add binding for
 MT8365 SoC
Message-ID: <Y8pT6dhe8xcDEz9k@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
        linux-i2c@vger.kernel.org,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org
References: <20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com>
 <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FHiaATq8WsrcHDfa"
Content-Disposition: inline
In-Reply-To: <20221122-mt8365-i2c-support-v2-1-e4c7c514e781@baylibre.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--FHiaATq8WsrcHDfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 06:08:52PM +0100, Alexandre Mergnat wrote:
> From: Fabien Parent <fparent@baylibre.com>
>=20
> Add binding documentation for the MT8365 I2C controllers.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied to for-next, thanks!


--FHiaATq8WsrcHDfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKU+UACgkQFA3kzBSg
KbbYAg/+NvPont0Ra5ivgZMy0aWdgYNhPXjOIwbtl0vtaaU1ZeUbGnHll9skN77k
w2FSH9BR8dZiTgwgw1PGaVNhvFTU6BOkIrnN9TXAsTdUAj82JxHhQKer4kIM/uVf
cCjwDN+9rrapuUCBJbMqAhEWvWvm1ylodAs1lF5tik0WxBX/qPpiZn6MFkl3qCfm
Kr0zsZ3MRjj0A1eA9F3ptxL1Y7yvPBfFEDWjyaFxIQgkAkIlfOXi+Sv8QyUD4Ncs
o8Uy5Q0EZsTG2CElvnlPW6h0TSIc6uJbMzW/vuXH+3G1IUoYAHFxkNxyDbBoH6Dk
9BIeCj9VdQBSDYwvRrCvB5+eGrCB3NE94eI6ArUFiYA+ZNMIw74bFsIKYnJv/6Dr
VoPG0eOOkJEeWA4vKgPPJzWadCj/WvHlZp5mJ2JeY2zchRf4IuYhUiJiZW+gOhGr
Lp4eXYNxblarSF+9DwYZ+GK/oNVRE7M7JjD2j02eRTunVkkAOIBCzCt+egKq/gbW
53SnS5rSQRhHT+TixOtqdsY8li2pLdpF2Uj9k1eaIoLX1CaPSqo6UE5oijt+8Yi1
+jwAfNQ7Tdcw+PadlhCylVCUw/TLSZ1WTrJTPuLZ2dkWAoem1eLsLedyRiuu4DVV
G2qyr4BM86T+5gNypaj/uufkz2aB5BxwNFU/tJ+X9EjkRf/1m/s=
=mGx/
-----END PGP SIGNATURE-----

--FHiaATq8WsrcHDfa--
