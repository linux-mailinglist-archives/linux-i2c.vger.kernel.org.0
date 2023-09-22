Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6E67AAF06
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 12:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbjIVKAX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 06:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbjIVKAW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 06:00:22 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E4594
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 03:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=K1aO
        Wab9I+DUxFLoqZNWzCk1GjcZH7mf1jIQVv0mxgg=; b=hOv83P/ROgDu3Yp2qM26
        qYqzOCWcE5gafIs/Co/vVAhE4gQ6Sueifnt78+Lr9MZEffZzbmPAILXr6vQZyXqU
        SeU1JFF8joU3p+6oFv4p6xXj81SytyKfwXejtFplSJ0R4Gvai1uKMgPXymNFhWDm
        LLGZFtNe2wyK3GELxYHVHaDVFnjcy8Qv+wZIsSS10nVjiq93E3j1ffUyPkK7Tte0
        OUaaNjQDMvk/baHEultQp9w9TyPMgFBV7lurfB7DY/QIwhzq3CDWExRjXxg/bxDt
        8TwnKfLD04486SiXog7NXfuSz3HO14oYsoevd7ZjG1dwrIGFhDGb1ZAqmjkcz7YI
        1w==
Received: (qmail 1349780 invoked from network); 22 Sep 2023 12:00:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2023 12:00:14 +0200
X-UD-Smtp-Session: l3s3148p1@KazJrO8FtoIujntX
Date:   Fri, 22 Sep 2023 12:00:14 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: gpio: adhere to coding style
Message-ID: <ZQ1lrvJG3TK+ypCV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230921085752.8686-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xaTqkrHEkG4mncZK"
Content-Disposition: inline
In-Reply-To: <20230921085752.8686-1-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--xaTqkrHEkG4mncZK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 10:57:51AM +0200, Wolfram Sang wrote:
> Advertise our coding style by following it :)
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--xaTqkrHEkG4mncZK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNZa4ACgkQFA3kzBSg
KbblMg/+JTR0td37WXdqZXNMxeCaYpXT1wFEmMgAsHo1Oaom0ExJD0iwu53J9ie8
YZt9+wcLjqtepX/YMbRAIG101EngEgD35vdtZUsUfLGyhBOorxRD4I4qw3dgyioi
qYmdYf/361rTZ69ZphMmch6p8j/klq3uim/1xaFpjBb7nopFYneaChdA0juVmwGs
wZzwJuD3v22/DpMSJ0SZK3f960kd+WA9E4LeNad5xH9wRx49vdZLUaiwQ4+PpgV+
mjjz85SMr/xtu3caQ3hXQm7gNMCnKqfEVkvvCvxRsBcTlSLTkXN2OD25OVMk1kbv
t8FZMTwUfOBMqBnDuY29FVLgVRjoct+8c6yJVnSWPT2vXHAlEAlVQr/e0WVDpo+A
+U/BAsm6ioA+cQypfZKrZDZ3N1ZslLoqoMAL+J6O3C8KNkqjhPDIH7JXAl6oDATu
d0EldDL3TcCbl/wEZK62/7Hy7LG8r2k0wmVsJVxJ6sNA8GAzGqWNFXec7yrh8BtP
AthE8lslCNVW7wIOdQEUjLv+InaOU8ke0D0omnd0ZhGNIAivKY4aqsuHk05onTa3
ajVaXP/7/QVzgbBV5XAy0Q0JWzpS3iWH8AusD5HLRjQ3UAsFjsnlgRQzMcwUn+Xr
VaypRmAwOhdF/PPkfgK/vUv0xqTPHrN6zC+DMQxZ5P0Il4Qqcv0=
=A8EE
-----END PGP SIGNATURE-----

--xaTqkrHEkG4mncZK--
