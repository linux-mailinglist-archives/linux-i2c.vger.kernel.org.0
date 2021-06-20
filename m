Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 187323AE06C
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Jun 2021 22:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhFTUsq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Jun 2021 16:48:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:57680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229905AbhFTUsp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 20 Jun 2021 16:48:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 454E36109F;
        Sun, 20 Jun 2021 20:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624221992;
        bh=Ld8DsLuN9uxyfxOIjiJtuRFKzCbOVD9P45An2hX0fLE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ODlAsUemSl9Qu5lwmSdExvzujHRyL8qYs0KcT1NZD2TVMZy4sPGkHZji/Qm/bZooU
         vtrjcqdkU9TSRV+emzAJSXMO3QeVcsntW7b+iurlHdgt3OPzVGBtNybbwO0ok1w7Et
         FkVuEggFhY+E+aAq0QvPP3eWqz5SzhGxj1i+nhlkUvKHlkdJn/xkAE3uX4Ahj51HLc
         7egyRuzRjYEApoFHWAZrygIjEWXUa5HTlnxwbpz/Mr1FCRkOnP4DWbEFEwDtFkxcvs
         aIXSqGv+O3LNFqR+wdnZb5fOc7t4aQNaJS5h6IWWrU4/nk9Ck31fqaj6OEqfiMnblw
         y2YSjtRnCJNnw==
Date:   Sun, 20 Jun 2021 22:46:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, robert.foss@linaro.org,
        andrey.konovalov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:QUALCOMM I2C CCI DRIVER" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: qcom-cci: add sm8250 compatible
Message-ID: <YM+pJSOULPmlITIc@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:QUALCOMM I2C CCI DRIVER" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210513175518.6023-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="QiJGXfUyvzMgjqNF"
Content-Disposition: inline
In-Reply-To: <20210513175518.6023-1-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--QiJGXfUyvzMgjqNF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 01:55:17PM -0400, Jonathan Marek wrote:
> SM8250 CCI is the same as SDM845, add an equivalent compatible for SM8250.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

For the record: Applied to for-next on 2021-05-21, thanks!


--QiJGXfUyvzMgjqNF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDPqSQACgkQFA3kzBSg
KbaJVA/+PYq/2WzJj/80zSo/kaLH08GAfxSYvoch0h7HPkkufpYjzeBzkdVF19Qd
dPhzOxDqy9Z8zDP05ttEAtPPtKPHXUOxP7B5Sx3fXJ+ypv5OJznpMmFdvT6P9KpH
XHzxokK5PYg4J7feHKBS9hbM5gvq97WiYtD7xPb+iBDc1S4LSL38J0fdWHB19PWw
mpeA6Ummb4/jkhxHYMl0hay2NijxndTPBKa+uNvwRvOl++gV9bVM6KGDWZbv6dVI
/sbtT2Id+U0XYEijj8+eroEAGaCfJdWRYIPknCc0/aUU0nETwK1qLmE+KQ01Kbf3
ieiloxHmF95WdrNy5pnAu29sEAIvLPMdGqi8NCdP5UV4hepA5tzhmTYIUDqck6UC
Gpw0swi/nsR9NtcimJUVdICkVrSeLtler57PGJm1pOB9L7+2f585yl3USc9TM+qa
4JO+Be2ECa8VpSudcSOHC9DDkMIchKWCm0WUFoW07rxSEHUtiB3uyjAW+JX2cZG3
RdBwby5JNzSEzPHXg3IMGJVgmGsjv7m72+4V5IkDIRYMlLHrMvmtvqNIolIsKr3g
X4oaWDVTPWEcUzqPQXYo7VwsyWKdT9ehK7vnUKZrvAb+OfvhN26fESQ4VkiCX/H6
d/yMK77dKJfn6DB+fsgZIH2vfmWZCrid6Tmv65mFvVL7x6n2tbo=
=mqe+
-----END PGP SIGNATURE-----

--QiJGXfUyvzMgjqNF--
