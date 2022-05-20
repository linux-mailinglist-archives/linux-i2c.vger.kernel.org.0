Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E9052E93F
	for <lists+linux-i2c@lfdr.de>; Fri, 20 May 2022 11:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347958AbiETJop (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 May 2022 05:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347929AbiETJoV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 May 2022 05:44:21 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC5F14AF59
        for <linux-i2c@vger.kernel.org>; Fri, 20 May 2022 02:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=s5o6Dxkm4Kk5hQacFpX0DYpbBAO3
        O65TmmY3kYElorI=; b=yNA0dfzl+gnRzqQfMEZJdf6nHUWncEweb9m3iKmTgZlD
        e9VYUM1WY0Cv2PZddIND5rkvPmB3x6dUjHxBnsUcWNXMo/ON5n3FJnY11AoH18gf
        HClUGNDmLtO40qgVM6RM9CjDfa+iYo8POwn9wEypHvLi56IBL71bSlReyCuMDLQ=
Received: (qmail 3717890 invoked from network); 20 May 2022 11:44:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 May 2022 11:44:01 +0200
X-UD-Smtp-Session: l3s3148p1@01V+VG7fKjRZD+8D
Date:   Fri, 20 May 2022 11:44:00 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: rcar: call pm_runtime_put() only if it has
 ID_P_PM_BLOCKED
Message-ID: <Yodi4D0p+XXF0uGu@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-i2c@vger.kernel.org
References: <874k2wtqgp.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ltYBr+14X2EgjKQM"
Content-Disposition: inline
In-Reply-To: <874k2wtqgp.wl-kuninori.morimoto.gx@renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ltYBr+14X2EgjKQM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> ID_P_PM_BLOCKED is controlling PM status.
> We need to check it for pm_runtime_put() on rcar_i2c_probe(),
> otherwise it will be duplicated put.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Yes, you found a problem here, thank you! However, the solution is not
complete and while investigating what else is needed, I already created
V2 myself. I hope you don't mind. I will send it in a minute.

All the best,

   Wolfram


--ltYBr+14X2EgjKQM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKHYuAACgkQFA3kzBSg
KbaKuw//T8JazgmzuhUWY4z3vZotKuwbXf7a82d4qtdasNVaqPQtbNvP/vxcuifI
UvYtSdG5q0BdP1E8vib24nT2kvYLf2NNdbDhUVB4/fYdjKWHAO89s6t2ZztW93oC
UvwC0G9Gn55dIc36vNsa0IROrF3mARncYQjOOC6Aw2VaGKPKy/YgfYHCvgTYDcYA
Jnujm1yW52omvyr9AfImBIVATp+TSoXjTjrsPVGK6NY9KO8PBaK+SMzpawzTawlv
N/2ZaJuNsa8wFkwtmO2ERotdYxAn9XARGcjGgv1DYQnH3YmPml+5V3Bg5tgFk4ok
ib9pnu/wK0jokPnPgxDPu0Lb2t/KhwP3pG81v08yXmJfDwV/zqtPDf/6YQJusf/1
aYubBfLm46dOtxjSmNk/Hs3q60RLp3u3fts/hTEhXU4dVwF77pTmCx4qH3SKHLVM
82/Ck7OjE0PZEQUTLsXm9vbl0db0hbcuwGWeTXo8HERH+eDu3win3daW+ZdGsKkM
9OnmuKK7zOdfSSZRRu/ae2tq/WrawBPPsWCGyzJH3RRvZ+BGtuO89aL/rxf+UnQf
h6HeYKc4Q7V7hvORRN8Qeda+5/TU5nF1Yoi/YDH5K/ctl4X6ytO8mhB8Ph2g8lKQ
ssuPYxOj/t9A/+wUOnW3JbSmPMhG51VnP0i+JMvPUe3HtZgYURo=
=VNxS
-----END PGP SIGNATURE-----

--ltYBr+14X2EgjKQM--
