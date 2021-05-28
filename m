Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3EB3394475
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 16:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbhE1Ov1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 10:51:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:35160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234677AbhE1Ov1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 10:51:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDFF6613D4;
        Fri, 28 May 2021 14:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622213392;
        bh=HW5gpAOajiaaDbUKDPQUwX1k4WKIkDBYYV5yjj9Tss0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sHZ2h26nrNJzzgaALyHnTxn/t0jq2asszflc0ijAIknp93GBlRXW3/n6wSPM3a7AH
         1Igi9EBji7zi2nXeRLKv8MHc3rU+YF9yS12R2+SaZPkByrWcbHFaS/pa2D/ZDagCov
         hkcBKRxm3b5dybwjoPeXfp2hrPGLb5mnqLfVWXDBP801sstDv3BmECovWz7pNJRlPd
         inBc8qexF5eplX1fKGJTce8nQP2//V1jAlsktqB3QEgXcA99/xdNG/LyNGTsOeHq1X
         gaaQRlTJwfSNaAOcsCCM90N5q4aPkYYZhARChiOr2YO5l2Q2uTVzuSi0IdM42meI7t
         1olDK7YlDcaMA==
Date:   Fri, 28 May 2021 16:49:49 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>, linux-i2c@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust to removing i2c designware platform
 data
Message-ID: <YLEDDbkH9pIufslp@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>, linux-i2c@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/SYVXHJ05aITRah3"
Content-Disposition: inline
In-Reply-To: <20210419061809.15045-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/SYVXHJ05aITRah3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 08:18:09AM +0200, Lukas Bulwahn wrote:
> Commit 5a517b5bf687 ("i2c: designware: Get rid of legacy platform data")
> removes ./include/linux/platform_data/i2c-designware.h, but misses to
> adjust the SYNOPSYS DESIGNWARE I2C DRIVER section in MAINTAINERS.
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains:
>=20
>   warning: no file matches F: include/linux/platform_data/i2c-designware.h
>=20
> Remove the file entry to this removed file as well.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to for-current, thanks!


--/SYVXHJ05aITRah3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCxAw0ACgkQFA3kzBSg
Kbbqbw/+JFzwGVl90rpGi1N/ORK4mem/yngh+TDVOYgTyNI8to6K+pz05/RZiM/w
XTvVniRp554zDdQUUwFoLRo8FmuGvzqwwRG+dqR0rAeQhuap4mS1oya+uz+PB8sx
dbvmVhjixLQKaI3adwYoWacGgtQzE7lIR0w3JZCdXUqrRM/l8gscNQ7tURGC7nlY
7hw8SdwST8Cu5mJ0vgl+I3QJxStk4cld2kIKW4y9622T0dDtuGYR/rnzibf6Q4cR
F1OXRdX3Yt+kYbs5ZGL1Qs0LcsBLSC0mtKFBtAElcFcemxCfD8wXtHANrt4j6sAS
aTd8abVrPDWKBtoCnpUOkImYl1otkiaIC7MJ/nSOfr01/UrIJdMhTm4XU9572H1B
kNFL+XGFAggvxhPmQ5QuYVuUqDa+ora5BoN9t7AUs8FZhSkBONUj1NMSVslTWtOj
mEK9DcFWIWuqvoWCpMz36yKvovFnuEfmqdQ8Yveqe+OQTRo5NNzIJr66sXXSoPH4
xoGes3RB709eDIYcBa4JK3kjjbqCaFt9Xwphn2jn0QekS23Gr1k8jXiBee74/H9F
Mm6xtyUSz5pVspS3s8GV427KE2uvKikpbiid7YymdnY7NWxYK162PIrzqRWDtwoV
jss/oz3HzP+VBU4s9LblTeW2ct7+sv1LzTV2oGubIgbBsxYrcec=
=zICk
-----END PGP SIGNATURE-----

--/SYVXHJ05aITRah3--
