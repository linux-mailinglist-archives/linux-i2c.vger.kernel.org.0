Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D75C4F6C28
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 23:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbiDFVJ4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 17:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235196AbiDFVJp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 17:09:45 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C71A210468
        for <linux-i2c@vger.kernel.org>; Wed,  6 Apr 2022 12:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=X9Cngu67PWm5WFKCe01hgIdKd40a
        JF/2Ej2X7I7Qjvw=; b=HtzhfUKLLSkbzF6HaWvh4i2YkNXKw6syxXUro+P8wXYd
        uqor9MsDBRT1ej2aiILkpmeNAfvuSy/7053v0roWLSJepM1FlNvB7sgI/XNdIe19
        KmcydiIfybYVqFRfw6ZRtCTYmOOx8usMx5JX8fZ2ZSalVX4JaL8TMSZv93GTkaw=
Received: (qmail 2876538 invoked from network); 6 Apr 2022 21:48:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Apr 2022 21:48:56 +0200
X-UD-Smtp-Session: l3s3148p1@uYLepgHczMcgAQnoAH8rAHnYTrcYCkZJ
Date:   Wed, 6 Apr 2022 21:48:56 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v4] i2c: rcar: add support for I2C_M_RECV_LEN
Message-ID: <Yk3uqJRaoubfYd0n@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <20220405100756.42920-1-wsa+renesas@sang-engineering.com>
 <20220406171834.GA14741@lxhi-065>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vubMijlA6Fgi11dj"
Content-Disposition: inline
In-Reply-To: <20220406171834.GA14741@lxhi-065>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vubMijlA6Fgi11dj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eugeniu,

> Thank you for your friendly support and cooperation.

Same to you, thank you for the extensive testing! Much appreciated.

All the best,

   Wolfram


--vubMijlA6Fgi11dj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJN7qgACgkQFA3kzBSg
KbYbOBAAmb0XKsfMVJiZY8SROrZUozIZytTiK+i38WhpyC8ellupY39RPeds7hWG
Rq7p279F2y5n6MVReuMzkzgagmmcM96e+S/Uaanh+EJldSmlT/UAEXqeIxAcO676
396s7G40t552P27jqCbhzTpeR70kpMqvSqC3EKlvZcn3h9nJk0GS3IHWygaSbPDk
lGu8cRgGDOhbSIyiJuWqpmWqMv9vvrsDfJLWQrn9Y6F/I+XJSewb5dny2AszWAz3
Pw/MAm8P+EwptrSpgrl4nF+DZl7fdsPy6ZMfocWpZa2t+Ll3Ott4MnKhLTFyIbKQ
BgEogldLkIJkFNfO88366JsPMLR4HXAtGHfGzZ9ljYnupPSNkuw1RO2aFvB+JyXA
VVm+DAZYWTZsQpuKtFyJ6MAfHLs5dsKlm675USHqCV7s+1UXY0pLCjYjBq4aoDPo
0SiDJv2Li91cd09UqW+IFQm+0vr9kO439yrIJzfjsKtihumDEKQ/XIf2kuEy2Jv5
nRx5U6XMLl1PBLe1hzq8t7SVHZBa1DR8M/pmQXOSt/ng+xHNwvJL7560VwgJcADq
745+wUvaem0YHUv0vO/LlODYbGFtOJ54rQqy2NwLLq48ZKvOLzfgfxvRLwLd0ZRD
o0r+jdoxe1BcTGgvmxWt1D/PDpGSEbceT3fwhSzH0Mi9G0gkMVk=
=iKjg
-----END PGP SIGNATURE-----

--vubMijlA6Fgi11dj--
