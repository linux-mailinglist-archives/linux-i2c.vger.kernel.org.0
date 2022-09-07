Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7CC5B0F3B
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Sep 2022 23:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbiIGVhx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Sep 2022 17:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiIGVhv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Sep 2022 17:37:51 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11480B6D10
        for <linux-i2c@vger.kernel.org>; Wed,  7 Sep 2022 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=11nEAHckupy5h8iY1Ot6l21GKf+e
        C5dMXo7dHfpTQVU=; b=Vu0XbYIQRql5aYKTNArSA5RltZjAiJ2B/nhqI3pwte/V
        zsBOwDX1yd421bsBlabeuhjnpZCgmVVXepa3aqmOCjbVnuPlNRqFGXMv6fB0sdox
        qd5YIJNo5sbtOPyu3bZrODHSQXLOc+Y/KhCyg9F/wPXtw85Q09jRhUDXnxhFZJ0=
Received: (qmail 3895811 invoked from network); 7 Sep 2022 23:37:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Sep 2022 23:37:47 +0200
X-UD-Smtp-Session: l3s3148p1@yWmsHx3o0O8ucrBp
Date:   Wed, 7 Sep 2022 23:37:46 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     "robh@kernel.org" <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/9] i2c-mlxbf.c: bug fixes and new feature support
Message-ID: <YxkPKpPNXg8wEIDf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220822195725.12656-1-asmaa@nvidia.com>
 <Yw0fNuOWtJbe/OT1@shikoro>
 <CH2PR12MB38951B9B8F189E1B991A7950D7769@CH2PR12MB3895.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="frkXDeiDSCuV5bXm"
Content-Disposition: inline
In-Reply-To: <CH2PR12MB38951B9B8F189E1B991A7950D7769@CH2PR12MB3895.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--frkXDeiDSCuV5bXm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> What did change since v1 and where did Khalil's Rev-by tags go?
>=20
> Khalil told me to remove the rev-by : ) since it is supposed to be reserv=
ed for the reviewers.

But he reviewed the patches, or? Which makes him a reviewer? I mean he
is the maintainer of the driver, so I basically a Rev-by from him.

> I will add it back and describe what has changed in my next set of patche=
s.

So, you are planning a v3 already?

> As a note , this is what changed from v1->v2:

Cool, thank you for doing that.

> I think this is a bug fix because we have an i2c driver also in UEFI
> so we need this lock mechanism to avoid race conditions over acquiring
> the i2c bus. Not using this lock resulted in unexpected behavior.

OK, thank you!


--frkXDeiDSCuV5bXm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMZDyoACgkQFA3kzBSg
KbaTZg/0DA+GNflERNi84KEPRQ6HpnO6CBkmRAGpigMHS3zbIm0FtSIVmZ5XNr50
SXqK7IBm9r+aDjPv8x8M+GIWlUpLIvCHc7uuI4qq/pznpbibEjY1I1QuBZEzz/z4
6V3D99kFxJZjxJKJ7w48sQNaqJiF10Ll6n8nU9+ZfWKaQWcGOE15/xo9f72kF8wf
JrMSWkELgycljoRr/mfevjN5kFk4veXj5YbTkroocBvhryZBylcANba0+zFc0Q8P
0fVIeCl0y1M9kHoZGKe5eKhjhNzxgbalXqG10x3PBM5SQIW8sgl/IldsluZ04WEd
dtvVhqcx+6xX0hrrAmCtyuviZxxtPrHtJ7ogsw57YVh5s178WKqB4gTkJ6I0WZtm
dWSu7E6kbyvDNIcTp6TdHmji1WTCc1SWadRNhdDQn+Wz0AvvBAIgt8A0Bph+90AD
06xQ3j4SM2cmlVhCuWLN5l5C46n0YVzpKzXl68iE6EiJKIrhGqSCdGkOG4Dg23Zr
3RFg6rpYHmlAvLMdYoShMJF7dVq408q93765mWX9dpa6dzQW5Nmi50dPceTk9irQ
8/pokz94gsd/imYnNlxJx/P2XKfOGcKsjR132E+c1vvRgnOh6n1Ns6NY1OYHR3GU
hVwb7hc9fOMl0XpszT8F1crzeUwDIEx7btm9/ZeldpXckFVTjw==
=Ksm5
-----END PGP SIGNATURE-----

--frkXDeiDSCuV5bXm--
