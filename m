Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32E437D1F2E
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Oct 2023 21:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjJUTz0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 Oct 2023 15:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjJUTzZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 Oct 2023 15:55:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95671A3;
        Sat, 21 Oct 2023 12:55:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E416DC433C7;
        Sat, 21 Oct 2023 19:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697918120;
        bh=SL/hcOv59qKo7ZWTGHs9joohW/5eC1ELIbxsk+1bozo=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=lGnFdBlI3d/NyjWNPrFUowko2MJAkEuCRPhAb+ppIR+k2qAlEDQKAV+p2QWedttpA
         29eWEgUeJ26yYS56TC4vjglgQTMdgNz3T93PiyQ1xY58BaHGWli1SlYPImk45Vab12
         w1ffljgEOfjw7s9w1joedRh5JNEhiGr78BzQLJ8B/hjklnWB6zkaIXdTgeFKjJRY/f
         fn29Hrne6zdY/tK8IvFOYthAE+GTA8DU8BRiCocJ8FLHs47gt+AnOFLw2eJjrH7myl
         PS+2lMXHkA14atWBCmDEwuVLmo4al6wO01J6eCk2yS8a/4+YmoTimLf7XUh3ym/5qA
         mg4jH041Tn6Ig==
Date:   Sat, 21 Oct 2023 21:55:14 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3] i2c: exynos5: add support for atomic transfers
Message-ID: <ZTQsohbemoDB6tTV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
References: <CGME20231006150811eucas1p1a9e2b98d191bb8093daf38daba14e9a0@eucas1p1.samsung.com>
 <20231006150804.4113844-1-m.szyprowski@samsung.com>
 <ZTQcJ0gixlvWgWiN@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o6t9XrjrTUeQDojD"
Content-Disposition: inline
In-Reply-To: <ZTQcJ0gixlvWgWiN@ninjato>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--o6t9XrjrTUeQDojD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 21, 2023 at 08:44:55PM +0200, Wolfram Sang wrote:
> On Fri, Oct 06, 2023 at 05:08:03PM +0200, Marek Szyprowski wrote:
> > Add support for atomic transfers using polling mode with interrupts
> > intentionally disabled. This removes the warning introduced by commit
> > 63b96983a5dd ("i2c: core: introduce callbacks for atomic transfers")
> > during system reboot and power-off.
> >=20
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>=20
> Applied to for-next, thanks!

Marek, since you have hardware, are you maybe interested in reviewing /
testing this patch?

http://patchwork.ozlabs.org/project/linux-i2c/patch/20220912085943.1098651-=
1-camel.guo@axis.com/


--o6t9XrjrTUeQDojD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmU0LJ4ACgkQFA3kzBSg
KbZS4BAAn9YB/X0C3Ye2E9J5JNVGqkxG+6TKyDM/ZJMIXix2pV5j6SrteOH8mBT4
CmMGm4KepKbSNxc+Wh2FJAw2ygqCG19wTD6ThPLE4Bf9Z7ATeJX9ZVRAfq7Aavuz
OrnbrV47Lo7+M7HkgwHtcZ0huJR0EVAxKumfNQmMOYUSTpXbO6WT2vM2jCzzba08
EEv61xUwYaD3YCREo7r+B2zs4ANg8q8RemW8gzZ5HRwrhWni71TtaJpWVutSiK2i
6rnMr/k5jXHPtMi58rg/knX0RG0tfDaMQ/nY6zwOlKAa6KO7xbv/evKf1nKltS2h
ljp6e5sK2lXnHNEjpMd2mOJgBBFV2DDAVxJ7DmVnpGeXeztNBZm2/96bSOBuo6/T
6MGldQWHkVJmevArn6RwrIWC5O7GU+/E1acunWV88gg4NXPc7kdDi3gbvxljVX6Z
cYhoze90NqDl068d9Yo2MJAOj5JjEkboe9MKZWW/EaR8aS0ihPMcjQNhbf9W05cb
h31zJ711o/L1KF+fmtkeVASTfTZliG6f3AO19IRi47Pbd+f/GZX8nt9HcshjuR10
PdJOXQAT1pLhyvnRYzEWZlZZx8Lb96lcSNcmdg2Bm38Gof1s/A+HEoCb/HPmS/3j
YX80AJVCrtd4mzKAr7kCaAzQ0Xozy4wlSRBIyTth9JltTTutI3M=
=rplA
-----END PGP SIGNATURE-----

--o6t9XrjrTUeQDojD--
