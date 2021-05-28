Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1FF393E99
	for <lists+linux-i2c@lfdr.de>; Fri, 28 May 2021 10:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235980AbhE1ITY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 May 2021 04:19:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:45216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235827AbhE1ITY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 May 2021 04:19:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B2AA613E3;
        Fri, 28 May 2021 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622189866;
        bh=+DN1ThzyYacOd78DdXId0ReCsSm1yKrKrqXQsuX6Tgg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E7I7n353qAm5esYh8/ZWh9FVS6zyc2KHDgqVr0Q7ikH+FFKSkKP8O4hhvW0kY4VN9
         8Y9yDtVXVExLeqa5A/hs6+xXK4xEk16+5klHk31nkPhE6/LMxFts0aULHkrqjF3HTj
         hCnIzpjnzs2BSjcop/qd+/SpyQi6qQv06rOsVrDmP9fu8qbbBMiYLdPAvQuzqbnP/s
         /YAO47trusAn3KDv7MHDoj/s3ew4001csQ7fHidCSK8QAEPYZObshLmlV+RMggsdyx
         Ko0HZmsslk9Z/NzP4Op3/z5TIFGv0xIog5ksrT475PXQIpjUd88W8OPxeFjDWyGbvy
         RaA7pUQ0sJUxw==
Date:   Fri, 28 May 2021 10:17:42 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RESEND PATCH] i2c: s3c2410: fix possible NULL pointer deref on
 read message after write
Message-ID: <YLCnJgjVmJ7uMBxz@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>
References: <20210526123937.22958-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9VHmpeKQ8kPImJHj"
Content-Disposition: inline
In-Reply-To: <20210526123937.22958-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9VHmpeKQ8kPImJHj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 08:39:37AM -0400, Krzysztof Kozlowski wrote:
> Interrupt handler processes multiple message write requests one after
> another, till the driver message queue is drained.  However if driver
> encounters a read message without preceding START, it stops the I2C
> transfer as it is an invalid condition for the controller.  At least the
> comment describes a requirement "the controller forces us to send a new
> START when we change direction".  This stop results in clearing the
> message queue (i2c->msg =3D NULL).
>=20
> The code however immediately jumped back to label "retry_write" which
> dereferenced the "i2c->msg" making it a possible NULL pointer
> dereference.
>=20
> The Coverity analysis:
> 1. Condition !is_msgend(i2c), taking false branch.
>    if (!is_msgend(i2c)) {
>=20
> 2. Condition !is_lastmsg(i2c), taking true branch.
>    } else if (!is_lastmsg(i2c)) {
>=20
> 3. Condition i2c->msg->flags & 1, taking true branch.
>    if (i2c->msg->flags & I2C_M_RD) {
>=20
> 4. write_zero_model: Passing i2c to s3c24xx_i2c_stop, which sets i2c->msg=
 to NULL.
>    s3c24xx_i2c_stop(i2c, -EINVAL);
>=20
> 5. Jumping to label retry_write.
>    goto retry_write;
>=20
> 6. var_deref_model: Passing i2c to is_msgend, which dereferences null i2c=
->msg.
>    if (!is_msgend(i2c)) {"
>=20
> All previous calls to s3c24xx_i2c_stop() in this interrupt service
> routine are followed by jumping to end of function (acknowledging
> the interrupt and returning).  This seems a reasonable choice also here
> since message buffer was entirely emptied.
>=20
> Addresses-Coverity: Explicit null dereferenced
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>=20

Applied to for-current, thanks!


--9VHmpeKQ8kPImJHj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmCwpyYACgkQFA3kzBSg
Kbb/kw//T7waTI2rTUt3EK3y5G8OPDqTTBlZL+EwZjchuocWvogNJDub/VtuFZ4C
Ky4IGJgkNL+7yEK5SkA26/WfqjEFHELY3SdVODfpEkSM2wz2obgZKTBAEzsZgsP4
hyWqTV73FyvUhwloeHmZf+9/PNYakcYY/ZPDDnPNZ7vwVHR5uQ+IvFDwepg3GYHg
Opbke1DZdG4jwe/lpo9yy03CcTUFIF0MlbiaNLb7/HsVqmvGeX4xlVi4hzRSAUM4
H4PiVTYANU8mOFmkg7Z70n3vF2aQaz+9hfbjC5xUtrpGRWgdR+0AewTOVx3RtslU
X+uyvEP8uNqML96b1OTZ6vSD3g4HsM26ViXfXR7dXhs/p7vM95OvUeYl7G+7W1u9
nKl7PjYqzJQvNbWPmi4qb7Jsb+WjOM3l9KvrlKiX7TVZA6re+hBh/Pr9lqwrHYD9
PGDzJJ2pHVKHuhlh2W23XYE0qqwtgwh8mQJiRQsz1WVIe2HOu0bAZ0fmAmFTvshy
JAipX0NPQqEv2AAwsbckGhgJfwIcKTAadleGpgJXh98G+/dMPKRuI+dhfpvf2FTm
7git6e9EUXCtqee72GKSlGa9iAOlDOi3J8UkpZpUh7+aELr1MAG2pixHctwPE7l/
yI2V5kW2cGW7tCtLG2MoIHmRkT0lSd/yixPHxQezVmKPB5iYZ7w=
=B7Ab
-----END PGP SIGNATURE-----

--9VHmpeKQ8kPImJHj--
