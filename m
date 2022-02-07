Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE1EF4AC53F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 17:17:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbiBGQQc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 11:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442087AbiBGQE2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 11:04:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D1FC0401CE;
        Mon,  7 Feb 2022 08:04:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DA73361519;
        Mon,  7 Feb 2022 16:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969C3C004E1;
        Mon,  7 Feb 2022 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644249865;
        bh=0a6KWgDIwGsQreOTuboCpj+OcoV5SAHNcNpoKtW53vU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KBABG4X2nJFzGiunA/MeinaIyX+jf1x9+Lj/ewXDqgCgBzmmWGC4tXpjTRaK4dIrT
         kKMMn93eUoDRqoEiO5Lk51OZBYijZRCkcbVKsdjo4H9/ET/K8bq5A8HBpnPdlhqntc
         +vfU2c+xspZiCfSEg4k5CW1O16lG60UhkSvb9aHqpPiTXB4tQ6XIf256W5LloiJ8DP
         BC3dHh/dCyw/FGF8atG9NZrftqKaR/y1dDrVz1iJeaISaUg1JsQoLBZG+Hem3NdssH
         cQ0djSP2o+I1Cv0ae26rz+NkvD/gsz/NGHYORm+GmOw9j51QFcpoOlkPna4nU7MvIF
         TR9wHc8HHRVHg==
Date:   Mon, 7 Feb 2022 17:04:22 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-i2c@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: npcm7xx: Fix typos
Message-ID: <YgFDBjNNcdZTxq2m@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-i2c@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
References: <20220129093907.2196730-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+x8olvK+iClJ7JRj"
Content-Disposition: inline
In-Reply-To: <20220129093907.2196730-1-j.neuschaefer@gmx.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+x8olvK+iClJ7JRj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 29, 2022 at 10:39:07AM +0100, Jonathan Neusch=C3=A4fer wrote:
> The comments in this driver have a few typos. Let's fix them.
>=20
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Applied to for-next, thanks!


--+x8olvK+iClJ7JRj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIBQwUACgkQFA3kzBSg
KbYPSBAAgW7246nTpjLJ3sAaS/G0HlCLxjizARTo6bM6o0ScAmbPP29jr05YRwCx
cH7JuhDuaoGy5QIb6TD4AqtclHp0kDSZFkFNnkt8Y1R1SEWcNIIl2JyEQPe6HrQY
9l2jjj/LDc0NVtkbt/6iJ9V66qEWBvGFjgs1GSQgI/K47vWI3eeThjYfNINQFVIe
MsSAD8xOx65lxg9saxDGSqyKEwkohpo1qx2Z0DcR9Qt0uKSIuTPogJcPYCPO2AY5
VdMSTqHrlQ36DDUqlw1VXO+WuG4WKhI60DrRxzPko2gMGtYMq0HuHdnYQtriP03L
ofrJot6gE/PgcmYiAenAiQSJi1IgkgFTGRG/9frpkH0CAb6hkSOn/QGtQlmPJbwv
QJuEBP6iOPbsDjcD8kU5793CMlh+FwnRX9XMhCTKJrv76b56qJnBi8N78I3dOPvK
L0w4DTQyKe37dGJT5lfdMZYKRXxGv0v058+UZSpQSR1J9qdsAwTYHRpaPVwzkEyA
su2W8eqATI+Yn3hMYtTq7qtZFVGXJcdHQfV2nArpJQmnIVFprR/7znO0x3TVPVC6
ivkiTue/kcp2OJmOmN5OKxs0cccGuXaDy6ZmOgHQw6V+/ps9UB9bL05WLUMQEnK+
YN1dObLNkYVe/Qx+yZvzGKXU/NXgRcmHCvkuawo7C0r8o5zE+3Y=
=J/MV
-----END PGP SIGNATURE-----

--+x8olvK+iClJ7JRj--
