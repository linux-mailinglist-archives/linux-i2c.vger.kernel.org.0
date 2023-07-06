Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8B474A456
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 21:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjGFTV1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 15:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjGFTVZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 15:21:25 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B52D61BF0
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jul 2023 12:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=date:from:to:cc:subject:message-id
        :references:mime-version:content-type:in-reply-to; s=k1; bh=1jKj
        8xlJjrL7Y6d+UIx7pLRi8e65njUFajIyuSqjsRI=; b=A49pKfCR1YwszuZ2aVOY
        lpewxm+/2nHsoMN8RiYmTNUKvi3ssR93nI4Ktme3NLiJ6AWQ+zcmiuc5cVa5nNyk
        +BNAN3LHJB3IoymjMSWhskpF/+4EAaFcypPt6J8HnI9kq4wpbTbzyWXu+DETtST4
        CLM60gSlcME/k/5Ws3/MOU3P099sAf9U6MIBG+5AuhczY2xnOVI97fnDZh0Jx9ua
        K467cEAKO+0y3t38G5QCELzhvPRLWzwxfJrRRPpkDm7lP1KPPr2/LkmtQX40k2uv
        0FNUzrejA6dW4QYbS/8V5go0zndzVBJuVsuuSTyTsVdnB1GY1QNYk8BiCILDqQv6
        cw==
Received: (qmail 2037485 invoked from network); 6 Jul 2023 21:21:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2023 21:21:18 +0200
X-UD-Smtp-Session: l3s3148p1@kch4a9b/Lt0gAQnoAGA2AJvT6+/P6uKA
Date:   Thu, 6 Jul 2023 21:21:14 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yangtao Li <frank.li@vivo.com>, Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] i2c: sh_mobile: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <ZKcUKv8isBzgPRFk@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yangtao Li <frank.li@vivo.com>, Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230705135159.33327-1-frank.li@vivo.com>
 <20230705135159.33327-8-frank.li@vivo.com>
 <CAMuHMdXCibwJ0jBYu3Cr3-hW-GykQ7UANeKo=qjJAbQTtmah3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7wyTI6ITA1MNV4aj"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXCibwJ0jBYu3Cr3-hW-GykQ7UANeKo=qjJAbQTtmah3A@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--7wyTI6ITA1MNV4aj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Please try to at least compile-test your patches before submitting them.

Yes and no. Not "please try" but "please do". Rejecting this series
until it has been build tested.


--7wyTI6ITA1MNV4aj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmSnFCcACgkQFA3kzBSg
KbYxbhAAoPURiCuIwLEUFVbfsE9pd24PMV3hNuDlovUi6FXkUOWyNq65N1lgFWIY
SVF5Rgb9Cb5LWu5sNW9eX0Mzyt3vvuzfZovxQc3z1smduT3x7DkgWVhhOzpHzwAr
I6TewQ5x2jI28N2HNc8q+Ccvx7RoBasXrD3hM3OFL7N8di9gJI9EU/755Zisva1v
vPPore1ehZSqQPf2TA/o/NpjueWb60wPGhgjlOseYPn1uCpvSCutT2v/jkp+Qni0
QuPNOeAZYftmJJ5IzYEng5u5ML/WOgxkwL/dgvB0SV7QBxRg7r0QA8lLPDYYJp9o
Xi6XmygbWt9bMHDKduwDRw6b7wmP0V+v7LuGMbWlsJbRbRSA4TjxG8jN8Sf4Um+u
fDJWomC0qsblsSWJBonjdeHCTexQ/U/Gra01UZaxjzFcuakAsbA/mmg6vSutkp6z
p4Ifc7/fJXXQFfwub6ls7Oe0GnHbLOyQBFgI5X92cn1bdwI8MRrgLh5rCZ+KCKz5
z/HQznndsRdjR9pboOU/5NKVYEy6e2y8veTDou1zGaZSgc5y3F+Pwmj1DuoSWsV5
q4RWqF9d0eSGm7D0F0D/gjI1Ml4yKP+3qe/R+dCFE9ocZf6hb/1fbBnqkApD5Iis
HPf9yAH7JljaodIEZ8JMczKOlIQjkUcWQ91DsfTM3LjzaW26vyQ=
=kUOf
-----END PGP SIGNATURE-----

--7wyTI6ITA1MNV4aj--
