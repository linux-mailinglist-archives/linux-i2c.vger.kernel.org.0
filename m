Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9C84CB0AA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 22:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244593AbiCBVJw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Mar 2022 16:09:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243247AbiCBVJv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Mar 2022 16:09:51 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A7F3D4B8
        for <linux-i2c@vger.kernel.org>; Wed,  2 Mar 2022 13:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=YVPonQqpEW/osiSkp2w5/19iAhJL
        mXpMKKI4FyqWK1w=; b=V9rQ7AZbdbm8XDP19OJft5vyngmhg1u0v65JSKkWkVjI
        jkJkq9AhqSzJp5QtkNnMoydkw5Q+X5ivdglaKX1mT6OgkfnyAGNQzB8CgOTxokr/
        NzhXhdw7uH/mE5xKBdVkKPxDUnLBQiRYUcCem/KKTb7ptZ6mXQ+iZOepqtzmfc4=
Received: (qmail 255582 invoked from network); 2 Mar 2022 22:08:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Mar 2022 22:08:56 +0100
X-UD-Smtp-Session: l3s3148p1@Bw45sELZ9MMgAQnoAGk1AHiBA1wHs4oK
Date:   Wed, 2 Mar 2022 22:08:51 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,riic: Document RZ/V2L SoC
Message-ID: <Yh/c42fHi+aJNMYV@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Rob Herring <robh@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>, linux-i2c@vger.kernel.org
References: <20220301125046.17737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Yh+2T/Mny15X+pOq@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oSnu0q8D7Aj2Z3Vb"
Content-Disposition: inline
In-Reply-To: <Yh+2T/Mny15X+pOq@robh.at.kernel.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--oSnu0q8D7Aj2Z3Vb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I already applied v1. I may have missed this because PW stopped getting=
=20
> mail the last 2 days.

Can you revert v1 and apply v2? Or I apply v2? Works both for me.


--oSnu0q8D7Aj2Z3Vb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIf3N4ACgkQFA3kzBSg
KbZ1ng//bzpLhbdUikOqpGN1QLqpmSmhCeZpCSQC4yX3UgLb6B9hIH03cfLYW2Sb
r4u46CDHljP8c8jgwKvTksB5ZNebosw5dKasgXAM7jdDw2XFtNw2YFuyZIRxMFwX
mCDpwlIpcngrivz4nxiJXeNP5yC4mKV2mOI8Dewc/K+3a0zX5P7ejl4T0VRanv4m
O8vdrXzaW5UROf8wNzbllW6UHuXxnaKTAMha0qkj8mn3Rfm2OlYxcOl5P1jgvLKD
NeHxmp5IBRHI6LYgLyX/BkMZzaTAjqQ7nLlr6onRtTDHiGHm9ZHZhNMg1X68S+GV
wNmTAEbiPY7UUjoPLelmmYcF6KPvNOb6ufKi4T6GIycMYu+u951pbeXCGol51X2I
t+hU8tBc840OqqUUbgV9Z8+T0NYzlrTuGuirCYKMCi4P3WZHOVhFENDA8/EPSKut
qFy3cQ297mAQXO9+nRjAg5Lr3qt4oIjPKnyKYgAiHE7opliFCXBl0ZPUIkW2Frxs
720+BN0fkN9SbKH6MSjbf/sRhy9qe73TRyHJbS6Lwi+Axl9e098gP/VFdU1GGHVO
dZbG6/dscALNkThixglXPawvy6K9SChkNhuxc5CsBVI0uOKvOmRsjFA25/DAPzFz
aGhPa0wy5Cdrei/AuHAcIlHghBfnveOA36AAsyMUasOAKgZRuZM=
=kQuV
-----END PGP SIGNATURE-----

--oSnu0q8D7Aj2Z3Vb--
