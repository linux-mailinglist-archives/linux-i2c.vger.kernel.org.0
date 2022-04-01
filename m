Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 954544EF847
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Apr 2022 18:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349562AbiDAQqv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Apr 2022 12:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242816AbiDAQql (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Apr 2022 12:46:41 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B198C16BFAE
        for <linux-i2c@vger.kernel.org>; Fri,  1 Apr 2022 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ktNL83zFsqcHZQmH520XjhHZQ3xo
        saNUtB3KzFboe7w=; b=Z5/UmC+Dx1eQX67RWkfQO7/vMBet/5A8gUjIpC0M2wtT
        cvpen/Hf236XtVjuCiah4V1UR+JBRLFyxIgkQJK7bKhO3m0q5enTdHPtoS3WuTxm
        N6daqHx8sL1meXnzP9m2Y5xE+dlnBZRv0quy3PEBAIPVTY8SxpqWvpPCQTJ8HTY=
Received: (qmail 803177 invoked from network); 1 Apr 2022 18:29:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2022 18:29:43 +0200
X-UD-Smtp-Session: l3s3148p1@xUQ1SZrbeqYgAQnoAGGbAFirbAEmXd1u
Date:   Fri, 1 Apr 2022 18:29:43 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <Ykcod/XOYvGfUsga@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
References: <20210922160649.28449-1-andrew_gabbasov@mentor.com>
 <CAMuHMdVVDpBAQR+H1TAnpf65aVbAL0Mm0km7Z9L7+1JuF6n1gQ@mail.gmail.com>
 <000001d7badd$a8512d30$f8f38790$@mentor.com>
 <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <0a07902900bc4ecc84bd93a6b85a2e0c@svr-ies-mbx-02.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mF/tvCESj+ud+RK9"
Content-Disposition: inline
In-Reply-To: <0a07902900bc4ecc84bd93a6b85a2e0c@svr-ies-mbx-02.mgc.mentorg.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mF/tvCESj+ud+RK9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> >  	/* If next received data is the _LAST_, go to new phase. */
> > -	if (priv->pos + 1 =3D=3D msg->len) {
> > +	if (priv->pos + 1 =3D=3D msg->len && !recv_len_init) {
>=20
> If a message contains a single byte after the length byte,
> when we come here after processing the length (in the same function call),
> "pos" is 1, "len" is 2, and we indeed are going to process the last byte.
> However, "recv_len_init" is still "true", and we skip these corresponding
> register writes, which is probably incorrect.
> The flag in this case should be re-set back to "false" after length
> processing and "pos" moving, but I think the variant in my patch

Confirmed. Tests fail with only one extra byte and clearing
'recv_len_init' fixes the issue. I don't think this is the proper
solution, though. I think it will create more readable code if we update
the checks. So people will understand what we are aiming for. The
current code is already implicit enough.


--mF/tvCESj+ud+RK9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJHKHYACgkQFA3kzBSg
KbY3RRAAjBujpOTFoM4N3pzMYiwyeRWB9MO733t7w+Ds9VMMxXdAp/nAR5zTj6NK
CqEyWDL6Mjahp6Ajwmp1XQg+tOX7xV+Bz+4VFe0vlCFsi7t9vzEjPYnVevjP/BBq
JH1/v/iUkJlb70M/+/7tpDkPKFcBP+fEl2mLe1aRAPCf1KOXgnsoTqYeMcZyFYor
qCDN5Tku2N9y1zRe9x48BYZcHwzuH3FQ/lYEu/BhAsYaChHP+fnfS+Ax3zY5Sa7V
t3XYgEi8aREHqZD5njV/YCukS75PGeu33AWlQnguBxNc/hdkt/HtqS/foqDop6Ok
qxMh/ETZXkUoq0QJL9ChPf+8+zh+EWeuXt7EuH6XedBJYkFcr0Og9gwvKYnuFp6f
+5FMik3Xz19rsoGoVP+C+a/G6zUvCurnDFZTlBvU05JpA99gWagcHjn1jdnlYlp1
l/6Dv/cKdER+af2Rc8Ixz3t6pJvFffOGSqKJRcaJSxWDhiT7wc3xKEbevMYv3+/f
PMKXLkvaPihsRjvsuTMbJ9wbxU5AtYE9C/o5E+t9ZdkTgT8P9WOqMixkxorQDJmP
tc99oRHnLyuOWo1sE+GHIIfuxdFhTLW3Df4so//r5BKcX6VqqnuJXBb7q6D1jjRh
2J+BVpbjNSPxbnvd1g3Kz4tsFCav2VR+jotcJc38rKPoeGuS8ck=
=20pe
-----END PGP SIGNATURE-----

--mF/tvCESj+ud+RK9--
