Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77A787AAEDB
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Sep 2023 11:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbjIVJzT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Sep 2023 05:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232916AbjIVJzR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Sep 2023 05:55:17 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F5ACE
        for <linux-i2c@vger.kernel.org>; Fri, 22 Sep 2023 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=tAfi
        K8cS9czhyX0F3a88bl6GMG9utEwyy9exxIPdAJI=; b=DjfWvoP7+64J1aaAT7+9
        oRwxsGIwftxPU4Vl7TwAxMJQOcOu0csXh0UTzHYVgvkUGRC0nxjnLLGKp4cZHIzq
        JORtl6rCiCJV1Y9g/MyLYNEC1VRTBGnpP0R4cb3GYCmESNKyO+BDX/FTujJaJg+o
        9MIEJJtuUiPtAxXlFIxEhGxeN5FEs22xkZiO8T5w6yty6YQTWBlUmrmYUwUk7x53
        p7GbUqQKcjgy1Uuz1E8Z1Q7gR+cVHNNu38dOixIflz9+EpGriQsysPXAjR12ptZ/
        ykbQHiuFU3HpwSnQjrKj400QyxHvPJj+6Os2bODQf7q1WPeOIIfJ7iNdM78bZK39
        EQ==
Received: (qmail 1348334 invoked from network); 22 Sep 2023 11:55:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2023 11:55:09 +0200
X-UD-Smtp-Session: l3s3148p1@en2Tmu8F6pEujntX
Date:   Fri, 22 Sep 2023 11:55:08 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: rcar: improve accuracy for R-Car Gen3+
Message-ID: <ZQ1kfCMsKSZT+MI7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230921125351.3954-1-wsa+renesas@sang-engineering.com>
 <20230921125351.3954-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8bHNJYn9Z81j0dIf"
Content-Disposition: inline
In-Reply-To: <20230921125351.3954-3-wsa+renesas@sang-engineering.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--8bHNJYn9Z81j0dIf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 02:53:50PM +0200, Wolfram Sang wrote:
> With some new registers, SCL can be calculated to be closer to the
> desired rate. Apply the new formula for R-Car Gen3 device types.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--8bHNJYn9Z81j0dIf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUNZHwACgkQFA3kzBSg
Kba1LRAAjwYa1zSSQTCTSIIr8PHgbB9iEC5WeCeCj1rakYioIoAExFF3AhcOfS3F
nxqxs7wVXEJtOJwqueu78hsE5ZgqrzfR1oqwxssrA41SHKbKRrM31rbNkuazcTZM
Lg6Nb2/e/uT9i6MmzhPRzWKEJtg8/JkzU8JZZojS/6mou5CFiXenqshXYQwrZJVb
Lw+3kNomj6i4ShIhuBx3at+kNH/D8m0xMZB4tXB8fcRnQhvLa/Uwdukpf93FMl0Y
KDy8p03I2yDlj1Gz5h4P6d35DiURxBzjzkopw3mEviwz0i+DpTTF13GtlrloHWQ8
FY/3rHLtRDsPO4QAHEwa/SB8P/XLpheg/JocH3UrRju50+u0F3elPQyAXnYszUTz
yPi6D0SGJyNoGz18e9ILiBWfTHcvHB0hh/r4DJ6W3MRMbvtgHccR/9WDbtkqE8DI
r1G6l7b8hJeBd++nvDoNfp8dkuPrSoW/Nacuo2HTR7+0oCQqQiQsu6iP6INFR7BZ
1KdyAxgd/1uroAMLdQMqra9UVLdqLqtLbHtakbwY0ahPDrKtdGvMVtL3ZlJCil3u
14rqbDrsYGzcz2J5GCd/jPUWEsWeUSbVJCVnfzQE8VXqbhFZAdiuehAA9TqrR8rc
lE1UkIXwN3J+ucx2tS2nYumB2KUg8Kvlo74yJgQ+cyKjracciOI=
=1GIj
-----END PGP SIGNATURE-----

--8bHNJYn9Z81j0dIf--
