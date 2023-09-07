Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7A1797C99
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 21:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjIGTPm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 15:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjIGTPl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 15:15:41 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8540C9D
        for <linux-i2c@vger.kernel.org>; Thu,  7 Sep 2023 12:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=fmQ7
        7HCuij64JKsPwzj/UtMCmfu+C1bHJz9wVMrQtWc=; b=CczHYmzr/M8QP+qsYTLP
        qlNiCtDunym9ynv+irjk+ARgT+IV4O3bzUQENy4vYAsqeSlKkkTHHy2hNX1Hl1ih
        qiQ/yKDY8x5tgis4xWh7gc7jS44EMAj2VzOz2S+0y5Ege4fO6mIC/qF34ZB/3YfL
        K6j09a3AYtDhn9pV2zlKGj1Q3U8t1OYJWXVFveBOFOfAI8+EjZuJRfkD1m0JBAQt
        OzrtRZVXwkxwVriFgf7rYmvPRvH82onC4x1pSN251+47F9XrOH/eLB1189Ue29Zt
        wPg0GALLQqANmxD8a+ylkiEk7abuhkCTTj72rCeQJlEAMPktd9AOAKgdv4oRzOn6
        /A==
Received: (qmail 3139700 invoked from network); 7 Sep 2023 14:08:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2023 14:08:52 +0200
X-UD-Smtp-Session: l3s3148p1@TdE0ucMEaOVehhtN
Date:   Thu, 7 Sep 2023 14:08:52 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] i2c: riic: avoid potential division by zero
Message-ID: <ZPm9VBi+nLrSaUl6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230906200024.5305-1-wsa+renesas@sang-engineering.com>
 <20230906200024.5305-6-wsa+renesas@sang-engineering.com>
 <OS0PR01MB59221A1F4614F30669F3448D86EEA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YSL5EABNRscBDa20"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59221A1F4614F30669F3448D86EEA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--YSL5EABNRscBDa20
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -	total_ticks =3D DIV_ROUND_UP(rate, t->bus_freq_hz);
> > +	total_ticks =3D DIV_ROUND_UP(rate, t->bus_freq_hz ?: 1);
>=20
> Not sure clamping function min_t/min(t->bus_freq_hz, 1)
> Or ternary condition is good in this case for avoiding potential division=
 by 0?

Both work. I chose the ternary because I believe it involves less
computation and a tad tighter syntax.


--YSL5EABNRscBDa20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmT5vVAACgkQFA3kzBSg
KbbRAg/+K7Ngrza5kDkThVe4gz++Go2zi/m08rznb+YvC/XcJjT9ZQNOOQYwcmI7
HQEwVmYmCDXJ++vSiVKJ2W+fPAo9M7f6k/X/7BX4R1lB4NVl/dKL79f28Eadv2u9
mkR+J8U0pg7uG3UbXXfsXz3Y2b7WMuXyv89Jb9tnXgUgIgBvhdKNWosCaF/xtlZj
i5YzvfWZIER8h3AqHDukr0Q74WrP4JA5G4aMBDZXEdiEdd+q57eL2Ikt7gLtBECG
j53+FW6QSRJW+TqJRb605UeII/wu/h8wTOKnR8Ik0Pa/nalZJ1rKu6OujnC63WeJ
els1RydWO3fRM0zxXG7apwSnxdaVyAmLbYPcXmIHcxws1RgV7bxCDstvryuxUDa4
IA9Np0G9QBEwHpXwF+0mEIie/Co8YaHHYVkBUtBdV0XYvREfSLVqH6Y6aJGfXx6V
qj9FyaAlu/jK9F/wk1LHjwkwjJazBDa4kkSQ6K8jbQb1rbbr+UiTDg6zySIggtqy
6/kXk3X4iQoRRdM+UQ5P291z3gSkUBg45QZ4yLn4D8fcCXZj+ZD3FMGz2/jZbINx
MFbG2RoE6bFnjT75mcBL1eSbzwESO6d9jXp/Hx+8ImDM5jYWn+t6cikbfzshSMMO
uYRZYfr/efSPJqkMLHYvwCxCzX5rG0+2fiBsSJtm2asTzcpgtgw=
=hLmC
-----END PGP SIGNATURE-----

--YSL5EABNRscBDa20--
