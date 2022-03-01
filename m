Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375E54C97E4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Mar 2022 22:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234533AbiCAVpu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 16:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbiCAVpt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 16:45:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883194F463;
        Tue,  1 Mar 2022 13:45:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 445D6B81B0A;
        Tue,  1 Mar 2022 21:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7968DC340EE;
        Tue,  1 Mar 2022 21:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646171105;
        bh=3uwjHBi4Kpijzi8jIbSYaOoMSYmXzyJTEeVMSIbESIA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=koZS6u1JYkyQ/AsymFmTevOBEDEPaaFBGL6bIbEiw+654IcjZt5RiF8dHOJISRbT/
         JFeksndmw6/gr35h37+vXWL3eYm92pB4aIsercuDesP+jF+/RmkXOJHDAyXHkg4yMK
         UfnXJzS7je8f7jq1gI/FLooe0RYJjB29hB/b8J9fcwPZZHFuuJ9IjYmeSJsxR8/GfB
         kEGrJF2ElSyM3+7jZGYMOqG77Dk5BwPnvW7l1KPdsBKbLJeEjGJAfKbUQNp1d8GNWh
         biDlTh2kCDPfqMrxpWQ6nucjhgujHZpMRDGdhVjOuPyIHv1GvAt8iV6lmYyzc7EFzu
         ubgflTWfhuiMQ==
Date:   Tue, 1 Mar 2022 22:45:01 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Message-ID: <Yh6T3RSfvcXCi4sb@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        qii.wang@mediatek.com, matthias.bgg@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20220118133358.111886-1-angelogioacchino.delregno@collabora.com>
 <8725a111-0ee2-8935-86b5-01c61774a628@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RuPdci4FI09i3u+P"
Content-Disposition: inline
In-Reply-To: <8725a111-0ee2-8935-86b5-01c61774a628@collabora.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--RuPdci4FI09i3u+P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 12:26:30PM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/01/22 14:33, AngeloGioacchino Del Regno ha scritto:
> > Since depending on the SoC or specific bus functionality some clocks
> > may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> > but, by migrating to clk-bulk, we are able to remove the custom functio=
ns
> > mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> > APIs usage, hence (lightly) decreasing kernel footprint.
> >=20
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >   drivers/i2c/busses/i2c-mt65xx.c | 127 +++++++++++++-------------------
> >   1 file changed, 51 insertions(+), 76 deletions(-)
> >=20
>=20
> Hello,
> this is a friendly ping to request review on this patch as to avoid forge=
tting it.
>=20
> Adding context, I have tested this patch on multiple (older/newer) MediaT=
ek
> platforms.

Qii Wang, what do you think about this patch?


--RuPdci4FI09i3u+P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIek90ACgkQFA3kzBSg
KbafGw/9GFenif8e7sf8WDjqoiTJ19bnc5EA2wFP1yuCOK3ITglAu9Yya8tTY/3J
phPYTkQlqYXpth6+AndEsBGv2g4sDb8T7MkcNCi6rZYper8oyS6Xro7qkprCvzqZ
Nj6ltSANZqjsmKsQGNQjiZtXYG+uYzXMKGzbuf4SF9tSJ1GiC43usBv7KKW3wZie
n9iP2Ii76q0nqJ5v44a2E1AIxQkyn1DQOotD4F+TFZEgpUSIIWctq2Ez3G6LpjjW
YtERdPi5nCNB90V55nn13ksUKLv5pertnc4elqEbsFT6ZOtYUvUDYOo1oA/5sLIP
rlLVSM2kZyRbomIPFW4n3AAX+Ag60eDc/VtBOj9rR2ZpRTe1GZCfCokk03/UIqiq
CeWAEJPQ3kd1eqY2Hp46uNUMgS/zt5Xuc7uKNqZmSs9KIs6NUKi5ydH6/9AW1hrV
f4xP9pm+CyZv+2/qrcMG3INfL4QRAmRgaVCIThN5n0Rapr7PELa+0bpnXND1a/AL
SkRJUIX8r5nOMbeKGBkccTBnHr+asXr7FqY2EjO9fdzCj9CY7HaP/QXTjYzHdOsT
Dnpz6clEeaUPmdG2zeNeS+nmjnWFpJhdQPt6Ac9CBJ6mGTXYH1tJR4C960YBQ5wF
Tm92kQCkYCQDQE90ftGoq5AZVseXlmnPKXYiAndBXkX/9TmlUTU=
=cpdN
-----END PGP SIGNATURE-----

--RuPdci4FI09i3u+P--
