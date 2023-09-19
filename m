Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A65F27A6BD7
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 21:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbjISTxs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 15:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbjISTxs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 15:53:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C36E1
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 12:53:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6CEEC433C7;
        Tue, 19 Sep 2023 19:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695153222;
        bh=eBkzlKtqJFmd4HXm1DCn2QLz1VALBPHjnrztLu49eDA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RmxgcNOGNS8JoeesZbtR1CPIPAi7YzB3wJLikTSzIJ/+ucJiy9VAmhrAJkwozZvaI
         p1aFsLRH/VWl6nzuv0JAWzxPqaR6J132waxm3QoEolzirIMMUZOJOIhP0MIzMe2wng
         UlcLwk5cOuyT7h9vaIfv22+NAUqgNCjhSBIop+X2/ZGlS+RfZZP0/RuJG5p2cojhWX
         yRuUNpkXE7yXFTy+l304PrZab5QfAyuyLDpzUM6gNZGKMJJWTv5XEXkX36JPYjjnOD
         B9IAdwlSlcS4c6ARUOfikmad/ZagCKV+2iNK0lTmQBdZl5tFWtxkbdhtLvInXzsT3D
         SOyPYpP2Qbp2g==
Date:   Tue, 19 Sep 2023 21:53:39 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: simplify module boilerplate code
Message-ID: <ZQn8Q+dL/bEsaF4P@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <2f01722d-bb57-4645-8995-4bfebafe41ea@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6BYqJoqe1iuA+zdV"
Content-Disposition: inline
In-Reply-To: <2f01722d-bb57-4645-8995-4bfebafe41ea@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6BYqJoqe1iuA+zdV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 02:16:58PM +0200, Heiner Kallweit wrote:
> Simplify the module boilerplate code.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--6BYqJoqe1iuA+zdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJ/EMACgkQFA3kzBSg
KbZR4w/9GQb/rkvurKeW8JXMTGmB/6GIZZB1nPjHD2UqXZSf4OJH7p/eqrSjKTr0
uofMQReO9tPubUccKycF3e9+AQuXqSqbBry8voY/9BJk3Mcckc4Eg8BA2wwANOm1
tCsKDXfPVUyQ9cBt6YIJS/CIHj9/zur0mPy3VpXs2s8cMe70gVRh0UaMvxBatiVB
adhDRECqrnXT9rgcPGskFwVgkj7qsEWd2/zKz17xlBD84YsKDIsIrah4qvUVHHTS
gU7uNBl7guINfHcwWmq88R5Q/zoQBoi7a/LNtb3/QZEQ+zpGr6EZ1QPsN2CE0qrs
pbJpb6uJadfZ2Z7XZFV5x4nIRuOFCyaqjHes0ijUvJJd+e572VA1/9NXtFDQmlze
u2QUPoNHxgGWwRYUZsxfs4AGA7zMr5vcXTRaTsAv8rI4s65XcW7JfJ/aj5OBdaPF
7fc5rF11wVW+LIVyjTilgO0F/xQYFBumF8n4XQ5c3qVj7onO/dgeBPGT1gZeTr4O
pWSZeeBy/38O66bLv3ScLrXmxHiN2tPa+2MZ/XhscOq0WaQh1QDqD/v/ckMn7ETU
wRezmZf/uaZp8FM2ILQn5Y7oqrjy2ZgYyBpLuWSZ4xnJ/zmLSZZKlP4DgdYv9NDq
u4c740JBmThPdkjCrtj1vyC1XJ8MtBvDxSQmRw84eG51Q5dej+w=
=8xNQ
-----END PGP SIGNATURE-----

--6BYqJoqe1iuA+zdV--
