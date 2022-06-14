Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61EDD54BB57
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jun 2022 22:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358137AbiFNUP5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Jun 2022 16:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359115AbiFNUPl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Jun 2022 16:15:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7164722B0B;
        Tue, 14 Jun 2022 13:12:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 54237B81882;
        Tue, 14 Jun 2022 20:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3FCC3411F;
        Tue, 14 Jun 2022 20:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655237556;
        bh=K5sMYcQa8KcOJXSCKfv+sFO+l852HartgdnTcv4p7so=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f3BmAGBn6NGciCmPlQayj2yDq9jL2NaTEe/GRV2ekXUGGZAM/MJsq7FdEVj+21EgB
         k2abiF7N9LvGSWcmr3Ymx/F1yo5VTktL44TSyZVG/QCjvdi1vecgXCRaCYrOsOSSrc
         RXwyoSHObgEPZTTSFHabkqMuFsHfYvj3DET5kw9QKSmuzOlRKsMOgeUJWsdo5InnUV
         N6rERiBymHuvCZp3UA3q6ZiFkyjqEf+p0Aevb85pNWXgUeqGGJwNNynQ9eQL52yuKl
         nADPCjAz9GdoAyEkMXS6x6FLslDQ4WiqVEOAlc9PeeasgwqVocSmBTYnap0uk2Fchk
         D6jfQaRBg695w==
Date:   Tue, 14 Jun 2022 22:12:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dan.carpenter@oracle.com, Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] i2c: mediatek: Fix an error handling path in
 mtk_i2c_probe()
Message-ID: <YqjrsJLXEyAJU40B@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dan.carpenter@oracle.com, Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LPJ/UywH79b/GoGa"
Content-Disposition: inline
In-Reply-To: <8001bcdbee9f8afc85118c99b8166eb6473dcba5.1653222111.git.christophe.jaillet@wanadoo.fr>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LPJ/UywH79b/GoGa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 22, 2022 at 02:22:07PM +0200, Christophe JAILLET wrote:
> The clsk are prepared, enabled, then disabled. So if an error occurs after
> the disable step, they are still prepared.
>=20
> Add an error handling path to unprepare the clks in such a case, as alrea=
dy
> done in the .remove function.
>=20
> Fixes: 8b4fc246c3ff ("i2c: mediatek: Optimize master_xfer() and avoid cir=
cular locking")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-current, thanks!


--LPJ/UywH79b/GoGa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKo67AACgkQFA3kzBSg
KbYsUQ//RC/VArnR3VlNNgSKRNoCEEel97zMSxrWxq65CjNsnO8W3zD/9DyqzyQS
cJyDJkxEdKcDK8EQSF+iW0qLRPg4HLCs6WBoOsdgcSCmxv5YiTOmluHkO+kGP7ne
tYYUuvhihoHqLAOtYXYYWi9kNH0cFOvIur0h2J/EHno/2LA+6fJEGMSI942PNbV8
o6vTD9i7xhMIa8wpGE/Bwg0vMB7aBzuR2MfHoMmRTVJd/EsSNOLY+Eb6si+1mQLt
3g8JsGEKiU7yRPcQBUl6aWQjT6OrHRHI0z6JCcFsDibkVn0W8FyKw6HG+xQo9ZZy
lgfNdquCbZcs2fVnCTgXTtj4S/NRxYrDqN1KC3H76EmwouJ5ha7C0R+Yh+6Se8/f
V463JjPsZWzQhIHTYcZ87bfte3w5/4iTgGhGMkddmKTRFv4WYkJZxDbX84f15ktB
HTngGpZqNx/25++2fiZ+32V3NlPL9tRf/h2CXw9rFATe+72SbXKvNGVLgKvC0EfM
nSdZJg9lXsD49Ds2/UtYnBXtCQ0yYiGsSbvAzP/CC6tHn/vwGcVVqJixGAE7bUUu
M/S60KHdu3GP6m400nWh4r+C2TWzL9QFZML2X+gYuWxWD9Xubx72EqdzXoGKwDZU
NZjihxOZB2V5KDIJ7unDrC/octpmuAMLGE+ZMxFgJL9hadYZGrA=
=SD9T
-----END PGP SIGNATURE-----

--LPJ/UywH79b/GoGa--
