Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEC17A5E34
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 11:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjISJhR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 05:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbjISJhH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 05:37:07 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D611B8
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 02:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=HWLP
        fI01KZohB/1GOGLxTPNllKzeM+HqgsDWNu38w9c=; b=P3f/njRaxT/ghHSY9YuQ
        uXRqYj9iPHlDRdklCj+KjiX1OuH9LgtEX4Gmixo5TtM+bk/HFs4mmpDqYsH06eDx
        6Bjl0Wf1EJ37ddWZUlR3IEeKuLs8HkYhXXQv5nnPp4q2MV+UAXXIzsMJBIYw3u5I
        VCKOBVoxu2j5eNbP9lOqJ2jxosHeiq+uzxyzJRuRZp84bO+wAdqTyT1Jw0b632ha
        apIZT8d/85wnb5Ekn4H4ALdo0JOkneNsn/jZqkwDFviG/x8vnkD4R7jjVqv0kwql
        39urWYABzdZRq/DbwvPtk2AbeIK+vsOrXpmyBSRNIvKhT5KM4jUqWjK/YC2ZSJEX
        Ag==
Received: (qmail 164169 invoked from network); 19 Sep 2023 11:36:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2023 11:36:44 +0200
X-UD-Smtp-Session: l3s3148p1@kYsy/7IF2lYucraB
Date:   Tue, 19 Sep 2023 11:36:43 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 2/2] i2c: rcar: improve accuracy for R-Car Gen3+
Message-ID: <ZQlrq68kQNWESkkC@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
 <20230913062950.4968-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdWO2KVpg50Zxak6e_7-5c5Xg6O2PJkPkTfrR=treOtUig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yvMLh94UaA2UoAoN"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWO2KVpg50Zxak6e_7-5c5Xg6O2PJkPkTfrR=treOtUig@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yvMLh94UaA2UoAoN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > +       u32 scl_gran;
>=20
> You may want to store just u16 schd and scld instead, so you don't
> have to calculate them over and over again in rcar_i2c_init().
> They are calculated in rcar_i2c_clock_calculate() (called from .probe())
> anyway to validate ranges.
>=20
> That would also avoid the need to come up with a better name for
> scl_gran ;-)

I like that idea! Will do.

> > +               /* Bail out if values don't fit into 16 bit or SMD beca=
me too large */
> > +               if (x * RCAR_SCLD_RATIO > 0xffff || RCAR_DEFAULT_SMD > =
x * RCAR_SCHD_RATIO)
>=20
> The second part of the check looks wrong to me, as it would reject
> all the recommended register values for SMD and SCHD in the docs .
>=20
> What does "SMD became too large" mean here?

Seems you clarified this on your own.

I will resend this series with the u16 variables and the cosmetic issues
fixed. And figure out how this slipped through my checkpatch hooks...

Thanks for the review!

   Wolfram


--yvMLh94UaA2UoAoN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUJa6cACgkQFA3kzBSg
Kbb2Rg/8DeIFVUDkin+Ck1fKs7dpkMwFXX0bB1xkx6VWsNuQKclA9e3e9ZfHt/tT
jIqUoPCg7GU3+eeh81jmagTHzjwQR7Ne2f0FledAB0HG8jKQ2/eSqb8nPurKkuTf
punOPSs8cJkqiAE/kyb5eFesu1sZV1fdZej4WGMgm/9z/5tKDTVCCfCP63S7Wx12
QVhxIwSALydcTqnmHOjypRNLu4DSQiE8J/Tr7E0++H/QFwXGL9sHsulROX++ZgRA
wUQ3ZxfPK/TygVyF+eOKvVCBsypxCQzy42b42C3GERg2sycFtvKZos5v6nGPbs0D
TgAWibNgW0bTul/Ni4gbXlPljpvUZZU0c4eFMbAMu6vHNAl/zbnKHnPeGCcYUr3x
YjclaBnoEYD3tY9rdZLWhLy+w+4OkTtTcEbJe+58BmFmboQQEb7ahWgR1Ba/DLh5
KObMOU7oLAvZNQOhhFU456JKUVyL/ev5QdyD5q6WxZ93LmXomf9ihkgqNU1hobQv
hfaXDN3pEblL1FpTzvL64LfDRLaOI3CJ8J6zyAjY0vkIcXjvT0t8LVYnoxHcCWs0
L4YDo+jfYIqrb3SnUiIXtga3D2UxKJ5A9AmWs0yShXbFEyhRvcoZ/htFspQNgNJ3
aH4Yec6Foww3AGyolF9rrF3d0pM960YNOeSo+BFgKFhKNb4gLbs=
=gaFB
-----END PGP SIGNATURE-----

--yvMLh94UaA2UoAoN--
