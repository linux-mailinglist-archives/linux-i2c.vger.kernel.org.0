Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD2274EF83C
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Apr 2022 18:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346190AbiDAQpw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 Apr 2022 12:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349447AbiDAQpU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 1 Apr 2022 12:45:20 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B7E326E1
        for <linux-i2c@vger.kernel.org>; Fri,  1 Apr 2022 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Kh7Hqlzc7MnS43AS8ze4d+2/TLzg
        ccHyyFDZONfz9aw=; b=1Ro4RrC4DeK48wEb/yrhZGMHT8cqP/8epvE4fBWV6uf9
        q+T+zKmc6fjTyYzh50uIFIgcwcMgAFWGVBFpC9O+rf7vlx8N/1HOiYgJGODCBTRH
        H+y3rcbP477REzJkvKvdaH9US2itoEICNXTFfu2yIGddPlu49mrohE11iBOaQOY=
Received: (qmail 802408 invoked from network); 1 Apr 2022 18:27:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2022 18:27:01 +0200
X-UD-Smtp-Session: l3s3148p1@x4+GP5rbeKYgAQnoAGGbAFirbAEmXd1u
Date:   Fri, 1 Apr 2022 18:27:00 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     "Gabbasov, Andrew" <Andrew_Gabbasov@mentor.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <Ykcn1Kw+9OgznFd/@ninjato>
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
 <YkQ5LkUyicWFLlSJ@shikoro>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="IrrbXKcUvrUAvBpE"
Content-Disposition: inline
In-Reply-To: <YkQ5LkUyicWFLlSJ@shikoro>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--IrrbXKcUvrUAvBpE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I use the EXIO connectors on a Salvator-X(S).

Sorry, I confused things. The EXIO connectors on Salvator-X(S) are not
so helpful. I use the EXIO connectors on a Lager board (R-Car H2) for
testing.


--IrrbXKcUvrUAvBpE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJHJ9QACgkQFA3kzBSg
KbbFtw//RsRMa8hB7ahID29cpyXTQ0O9Ja2S9jXk5mVcgewFnQPzsYahvQl3dYJb
ssJLVp/oPiU4fYuro0COAoFo5vSTGpO9W1P3FO3mF1WYRCUxpGVhBF0muOqQRkbA
1CJRnzTfvXZXfpl9k68IR9oFymIY9eSy0Mg5mg0m1/s0HabC/30m1bBMmWHM0Exp
0+QyP5OEaanhRZJ798hxXdc3NyESFhpB3iesRfHnGYH980VPIWaUdFZORfH9pTh/
QYjJH0EOVS/R6AzNYGgBQG9MvJACCsBaOX6nzm30RGGg5M/i5gdgnfdvmv/kWb8v
vFgY6tvbFW2OD22PtKwUjGEwvcRF2Tf6LHwUj7mNB8UmdwUS2ARFK+gzURf5ytto
ipoAWjuHGZgWOWI5YHsILxnI+50uJYYWE+ijNQ0ukGyibJVWRUGimpuuCdCVf3An
iv1KR0zlenXO/JySoLL16/4xGS+5S0/AOuGR9+QrW6T5UqGE/zY16zxfK/T3wmn2
RVUh/7q1o0CFXIevcdiq1gt0HUFpcLIGH6XEOvo5sB1spzRDU7TC3+sN2VmKlj/j
g1W7F3n0fKrGPHS/o1oc0Y8oSvwviiSlsp4xde5zpJ9ZK5PJuxAyA92vdzwZkj2v
xABxW59jvJMyIjcrbansWepfvnf1Wxz2nhn8ZNUM+eqEema2qoQ=
=T2KR
-----END PGP SIGNATURE-----

--IrrbXKcUvrUAvBpE--
