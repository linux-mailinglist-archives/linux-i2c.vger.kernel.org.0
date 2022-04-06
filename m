Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6CA4F6C16
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 23:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235149AbiDFVII (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Apr 2022 17:08:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235684AbiDFVH3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 6 Apr 2022 17:07:29 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F05107AA9
        for <linux-i2c@vger.kernel.org>; Wed,  6 Apr 2022 12:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=b/yv+G2D/AyXnxxxBegRVdVItcYI
        qK+AIz+rFuNHmlk=; b=lsonHqlCA/T9AMMb6/TL6M6sGUf+PMDYuq2sNXPAO2Jy
        RCl231zou34UZHbyPff7W/8mH6r+fw27c0jtbpFoeB0WXNvyvKUjxNFd6nF96EV1
        JQGtuHI1akI3RYHX10rbfUN5BIU1d/zMXhyiLq67UVGerijLNSstFDc4+TzY6eY=
Received: (qmail 2875506 invoked from network); 6 Apr 2022 21:44:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Apr 2022 21:44:00 +0200
X-UD-Smtp-Session: l3s3148p1@BgA8lQHcxscgAQnoAH8rAHnYTrcYCkZJ
Date:   Wed, 6 Apr 2022 21:44:00 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH v2] i2c: rcar: add SMBus block read support
Message-ID: <Yk3tgDr0/OHHAsj8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
References: <20211006182314.10585-1-andrew_gabbasov@mentor.com>
 <Yg6ls0zyTDe7LQbK@kunai>
 <20220323215229.GA9403@lxhi-065>
 <YkQ31VMqj1MXqBd3@shikoro>
 <YkQ6XRITOFZ7hLXV@shikoro>
 <20220331160207.GA27757@lxhi-065>
 <YkcqoIMF2uw4FSZh@ninjato>
 <20220405093048.GA7151@lxhi-065>
 <YkwPQSPed18iyHox@ninjato>
 <20220406173245.GA14970@lxhi-065>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vvvA8QkHvg0eR6XU"
Content-Disposition: inline
In-Reply-To: <20220406173245.GA14970@lxhi-065>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--vvvA8QkHvg0eR6XU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Well, yes, that shows that I am mostly successful with reporting back to
> > the BSP team :D
>=20
> 100%! I remember the early days of Renesas R-Car Gen3 kernels, with
> literally thousands of patches on top of v4.2/v4.4/v4.6 vanilla tags.
>=20
> It felt like mission impossible to upstream those. But here we are. Kudos!

Wow, thanks! I am glad you appreciate our work!

All the best,

   Wolfram


--vvvA8QkHvg0eR6XU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJN7XsACgkQFA3kzBSg
KbY49Q//Vsun4MCNLYIWAolcD5l+Zi3fPQD1emTij4M1JjtdzeO/x2L7BAoHaAu/
oD31uZcLL3Vu0fD8SKhhax68LONGOfzic0x/c5VG3X07MGXKyDrfjfac8sVeLt4s
wkxrgWGrsMQCdwIsRce86zD6pPjUvDsJxRWQO/o5WbCAAStTEng269fWlHx+G6RJ
f59dHOabUQWuxmLv+3piZ5Ou+OIHUNhwRZS0l8NZZDs8qer6SagUvJN2YONhx8y0
Til6gFE1qJaRNR9oEfmu8WpB21dmY9SfTqc6L/DFVx9c2ZApgSpszsizJ3XaHPQq
wqjAaftHYRtSC25cfbrs22r9zwTN/SHRb7665EuwO2kZfqxnn9hk18XXCzrgqjZ2
S/eugRZXmz/mmid8A7fjW/duuQQCx46l7YbcqPmafoGAkWMViiEjDuw44efPw8Zr
znx7dptSZa+NPtfOKlGopPqSSDShMdK/mXi1DWbkyP7yxpVyXqdeMeytWGByjHsP
GfNTWmdFLDwcxCSrnmnokkeJL05BhlsqPcSmOdPxFzp+XPA4mozS8a4z0Pb4ZWQd
/WhEsht+6uHJnxJvRa6NRw/4zBgAVROi2BbXjwOU2e36OiXSutdE5IQTtDeLKtET
EK/5e23Xt0nWg8yvyb+tmQ1ngzH3rawUMyUQSYZDQ0/UZJYbcQ8=
=OkMM
-----END PGP SIGNATURE-----

--vvvA8QkHvg0eR6XU--
