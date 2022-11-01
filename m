Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3759C614AF2
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Nov 2022 13:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiKAMlw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Nov 2022 08:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiKAMls (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Nov 2022 08:41:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA139193D4;
        Tue,  1 Nov 2022 05:41:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 66A2161157;
        Tue,  1 Nov 2022 12:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C65C433D6;
        Tue,  1 Nov 2022 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667306506;
        bh=8jgiz81LfMDnh1i1jRq/N+QDaXUx5gxBcrHBgxl01Wg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m3ZnawNuuV31Op9VrdDGcKViEbokbP1IioDKDywoeD7QTDDRGtpdY6a1CM4RHRi2G
         uB9o8WAiiOPc07IpRO45jz4yOk0XsCCRGPC+ZvE7L3/DvAXK63WwMFHPoRGAGFGden
         W454Jum43tzXvObveAGPk/++t1w64SIxEFuy0ijdvC2t+5DWbjNs8uOYKSqkI8VB34
         w7UactYLewvyM290wdlq7/2btgYx9NpG5QWpQ1D6F0LpEsxF3wyyPRzFjuF6cld1xo
         ARgN3baTfFYygyZn8H5gF2sEmavkh6Q2JGOnWqbqKBJVp8G/826w8+aovU7jsJTyT9
         zhHiEXcVUnNOQ==
Date:   Tue, 1 Nov 2022 13:41:43 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Frank Wunderlich <linux@fw-web.de>
Cc:     linux-mediatek@lists.infradead.org,
        Frank Wunderlich <frank-w@public-files.de>,
        Qii Wang <qii.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: mediatek: add mt7986 support
Message-ID: <Y2EUB4fNykwas9/U@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Frank Wunderlich <linux@fw-web.de>,
        linux-mediatek@lists.infradead.org,
        Frank Wunderlich <frank-w@public-files.de>,
        Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221009101631.82380-1-linux@fw-web.de>
 <20221009101631.82380-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UtZpHD59sJ0nSnvF"
Content-Disposition: inline
In-Reply-To: <20221009101631.82380-3-linux@fw-web.de>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UtZpHD59sJ0nSnvF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2022 at 12:16:31PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add i2c support for MT7986 SoC.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied to for-next, thanks!


--UtZpHD59sJ0nSnvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNhFAcACgkQFA3kzBSg
KbYgTQ//VQ2t9ksOXBL57DNCUocjol3yUOAxdKPK1xvXyUdHIVea/f77QHqQHhs9
QX4JoSozwlp4jVnxMLoq/I2xMN/nhKV9Xfq02gWDG1yl02/iCN+B/DbvtKDJzTWi
WvllbSYmcDSgFxWKb4LRwnC0V7bfqRdxW5CN6gulAYePfFRuUgSRG4Dc1pA3UVh2
5SvJeDJuF8jzjyw8MgehYcYKorFwErgRKHASkoDSBWYT71wvAA5+PIj8t6PJGM0/
rSiOoeIYzX7OFZIY17HqJ7095Uis/bpjwspfbf8ThszlGV7/+alrZLKM6JaJzIcu
ypRw7cXtW2zvtxs0/M93yfWtZIp71oLuEUZ+YOPnBg6Zj5z2fl8S0og29wsKLmO3
W8TCI/Fe5ijNDfPlpfvWb//P0VSTnyoHrgmpba50kJ4DGuHwqV/aJMNGCP+MRixo
xM0ls2iglbYaOFrYGM3T02uR3dKTW48FTWGeGx3BsMUJVoq/RdNBtGMliki70q4F
xiSAJ39i+9CN5E1SlqJ/85M0L4OOqLMrZaXSO0Tl0aC/Qivnd+h/MxD+n0PsaAK1
WtNu8+t8BTHhXVgNhlByfFMJbXodTyh8smsyfv16b/Epoj7h5F5N5b5wL/ImP9Rv
bGoIjk6dgNjVBO4MpzlkhgaiuGIccNEYZ4W736IDo8iUjQD85gs=
=6hmY
-----END PGP SIGNATURE-----

--UtZpHD59sJ0nSnvF--
