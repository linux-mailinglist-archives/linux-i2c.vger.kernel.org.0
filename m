Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DEAD2EB037
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 17:37:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbhAEQg1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 11:36:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:41486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbhAEQg1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 11:36:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D30622CA2;
        Tue,  5 Jan 2021 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609864547;
        bh=PU1mA8oiJZ5yxPQ25ArwKHkpQcUB6AsCKQqgN3IiMsc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VS7N3RU+i594TYqbDOsZ4SGHJ77+K4i0A4WCfHaUELqmghBiTBWIAmeR/qpzvHHHN
         CVEBTTCS/4si7OkqqcyX5WM11LyxgY9XSdfWOOdI2VNh0oaErL7s2FjUOKD74q4+IC
         N4E2eS1oXzoDqi2Kv5N5cCecmAq2WKgr5pif7Tf8mlJKnVR/u+XxVvM5wC9BKfQTMZ
         AJoderhd+10/6QecKkVvivJ8VzNVJvQ2T1sAmA33HdmckYyOmaKruFJ+ufaeC//eI+
         egrQB1+Np45BAeNbvXiLsjMVUc8PD7eFsmjL8H/8JTidmrjNOYQ0OdAFPeAbGJ0xK/
         BhHLKzuvjMM/w==
Date:   Tue, 5 Jan 2021 17:35:42 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     rrichter@marvell.com, thor.thayer@linux.intel.com,
        manivannan.sadhasivam@linaro.org, linus.walleij@linaro.org,
        zhengdejin5@gmail.com, hslester96@gmail.com,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: fix platform_get_irq.cocci warnings
Message-ID: <20210105163542.GK1842@ninjato>
References: <1608885606-1962-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bWEb1MG/o7IKOlQF"
Content-Disposition: inline
In-Reply-To: <1608885606-1962-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bWEb1MG/o7IKOlQF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 25, 2020 at 04:40:06PM +0800, Tian Tao wrote:
> Remove dev_err() messages after platform_get_irq*() failures.
> drivers/i2c/busses/i2c-hix5hd2.c:417:2-9: line 417 is redundant
> because platform_get_irq() already prints an error
>=20
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied to for-next, thanks!


--bWEb1MG/o7IKOlQF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0lV4ACgkQFA3kzBSg
KbZkoA/9E5k12SWFY8nBUeXr6+kPyfPhVFGL2g8JG3RxGIwH3YPYliKGyp9P2Z4G
tXdXaWr6PnvVUKFCe7m8qu+1hujHdUxyj12aevzwMV+AYKobNjeSXNqiwmo2cCVr
vgvd/7xK/Q+dwqeBoGRmvRZ5nobknyF5TMCKgkKfjZUg1Fm4+UIZrW9iZhe74n28
79CXmfMK94LRNcAhP+Vgk1qq2Gtqy664BEPE10AfUOkyRJ+8w72DiPk49LfKQi7i
EC9K6wRi0E4q3FFQKMX5/vJw8iY9WV31Z2w6LHrDG14xi1B2wEPRJWv5m2vkYnwn
ZIIigkG2VxdTs5xb4CXqmqLcsz1W1pjEAW0n0lI4Z3lxx6YUDCuiAR9ZnCR6F6hO
GPAttqYFRGNOqlroBVbAyKG36Gz1nWoWX8lBaPhZoogCjEs2Sh4AUnKxlh3n3hNJ
dTQv0dsMDbGjLGBLNCqQLp6eFTklZyEvx/JwV+erQImxc1uJpuXPsKD/kLin5XKL
St1EDYvp3O1/RDSTvKLyTRBWu/uEcDC2FRiTaRoNpYh7zrx6xUJP6EsK7MzQ0EJx
ldOVnJaU8cP3uaRMW3Y8jpeCHBXc6dfHV+m3I/KTk3NDbWjFkxKy3x7mMLnaT3gp
izUh6VDnyH6Xnxj/KAJxZBbvmPoNUc98ZYZ21TBRfn006NzVy4c=
=ZrzI
-----END PGP SIGNATURE-----

--bWEb1MG/o7IKOlQF--
