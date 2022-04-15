Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2553503101
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Apr 2022 01:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356108AbiDOVjK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Apr 2022 17:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356118AbiDOVjF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Apr 2022 17:39:05 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539133C705
        for <linux-i2c@vger.kernel.org>; Fri, 15 Apr 2022 14:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=KcELiUq4UXkjbcAbGj+sesWF2rJC
        rUIBupy8gzNtfbU=; b=ubFGBk2TPg6e9D+xvl4vLucv3Fo5xV6Zojj1Zboa09Gq
        /qCx1WsqXPlEnog9q4IbbCvSvzI2I+Etb/4x7xrKeV9S4rLNPozj29lQqCOQtWzy
        zhfC0cPO+K9V2w4o39wb5VtlCFBRtPYSNPMMxrU3aQrE6juArOETszvoZANYMPw=
Received: (qmail 2350265 invoked from network); 15 Apr 2022 23:36:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Apr 2022 23:36:31 +0200
X-UD-Smtp-Session: l3s3148p1@a500NLjcurIgAwDtxwyoAOfJPDZkSTZ/
Date:   Fri, 15 Apr 2022 23:36:31 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>
Subject: Re: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Message-ID: <YlnlXwHTqFR7yRs+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>
References: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VzUhE8JpOvSImoqk"
Content-Disposition: inline
In-Reply-To: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--VzUhE8JpOvSImoqk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2022 at 12:07:56PM +0200, Wolfram Sang wrote:
> With this feature added, SMBus Block reads and Proc calls are now
> supported. This patch is the best of two independent developments by
> Wolfram and Bhuvanesh + Andrew, refactored again by Wolfram.
>=20
> Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
> Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--VzUhE8JpOvSImoqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJZ5V8ACgkQFA3kzBSg
KbY5bw/9HolaQiOxvC5o9RMyWkwnUjCjG5ltNOHIXF5JCj76/SubNH0YoVSEH7Bh
BiwTJDuV/O9Db0SUUzmD/RKpZcyC7QS/iiWqdnwP0xYlBxWi3pgXYmD/+rBLlefP
PGD8+igxJV5guKHzz2RQhZIAjBcbX8LQRLzJOKRD6ydD3uYMuGvGiXJWfehjlH9+
b3IsYolXsS2nDBjql2mu6/helqrlJQnmhjME4tijKz3cUrx6/CvWXflE7aAHn4KF
gHHwif/QT1VqZuCpkc2sjElmjt6pbbu4vo6iDZz/luXUoOq27aC4LaHENXoDvOyi
iwZR6x0evOH0AmuucL0Pv3B0Bc5ERaUNWHfp1bfGwpGwMGIhfxuORh66RMgUKsDo
qwX+S0YvO9gnjVgBZYYvrphMGaTRsvtDdvoSgyXFebD1uSDLmZ/iGkVoaj1U359O
BaHR2PYBg0n+qXuKnw1fwkJFeNW3jti/li64fhJXSFxM46jiXNV6gVQSUgmNIGF3
Gf9GwgTz1xGIxreJyk3wmvNGyGFreIZNW9xUre2gq5lnCmHawcqRx+ZQ1JQYd8WO
rX0ppWNkjdEpUK5omxXEsRKoSRJMU4M9Ie/EKWkmlHN01su2qnMDGIfqctTXemF8
OOofkyZb0mO1xyZ6ctcGBOiRrEC26HolF4QxlXPSfG5VA0r/ts4=
=rVkV
-----END PGP SIGNATURE-----

--VzUhE8JpOvSImoqk--
