Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9E44309B6
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Oct 2021 16:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238173AbhJQOYV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Oct 2021 10:24:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:48166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231156AbhJQOYU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Oct 2021 10:24:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B94960E74;
        Sun, 17 Oct 2021 14:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634480531;
        bh=GUiahCSDrD8J6IIWMDZtmEEy4K50EAWbaUrB/r7dK8I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=taswiWj6N5VxmlW6rfycTtYTkfkQBVWWxiYDxUmjbCft7EyznB95j4JmWvOTk2psX
         CP0pHPHINt+AKCjc51uudA1cn+1gWoRu+NVU8NLjzW0jK4JLdiUEB9wyfVHrfKiClX
         wZ+WMAmiZqPIR1SwH90CNi3YoyAWmCdoKKm6GhsubgOQ00D0PSrxx9op1vXEo/OqX9
         NqR9yiicr2je7ot/ZOEc1tneDcR7jnnkH6jDaooa2l8nENj66/W0HG7U0F1EV5L/mz
         LVrP/c45HcmXzocNEbxMYnPC85DaRBYk9X9f/5Oz1+56j3owQ7T80uWhMlgo05a2+z
         3kslXyxP7G9qQ==
Date:   Sun, 17 Oct 2021 16:22:07 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux ACPI <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 3/7] i2c: i2c-amd-mp2-plat: ACPI: Use ACPI_COMPANION()
 directly
Message-ID: <YWwxj4CQIbDRkITs@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux ACPI <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        linux-i2c@vger.kernel.org
References: <4369779.LvFx2qVVIh@kreacher>
 <3647069.kQq0lBPeGt@kreacher>
 <1823250.tdWV9SEqCh@kreacher>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ICLe6aBUuDu4DwGj"
Content-Disposition: inline
In-Reply-To: <1823250.tdWV9SEqCh@kreacher>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ICLe6aBUuDu4DwGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 06:09:39PM +0200, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>=20
> The ACPI_HANDLE() macro is a wrapper arond the ACPI_COMPANION()
> macro and the ACPI handle produced by the former comes from the
> ACPI device object produced by the latter, so it is way more
> straightforward to evaluate the latter directly instead of passing
> the handle produced by the former to acpi_bus_get_device().
>=20
> Modify i2c_amd_probe() accordingly (no intentional functional impact).
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Applied to for-next, thanks!


--ICLe6aBUuDu4DwGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFsMY8ACgkQFA3kzBSg
KbYAvQ/+KkX/TyMoXgHkVUp2Z6sm51r1NeYGhhnhOIt2dIYEjAKfjyCswsgF7H4u
6ncL2XO/ms7cMMEE6ACHih6FNWsssoPtSkxhFfk7bNWEoazd6T+0pCV4NgY5dPqC
iPS8D2znQmn61fCVCOyucM0SG0iD1boMKu9cnjHUD4BOuqxb6NB9jLYGrDvPubmY
2ToD+raPu0sqybEtbwtsTD3oZl5wyHINGXfXHiasynh08XI4eMZz8xZ5HzPX8GIG
nAdqXboEqpo5yE9nCUXrAZOukfoAJhspJE1gLkhEcfldGPzTy5iOFIR9g+YAamub
VZtZrn+zRwOaNe5x/lG7mZm8/zPInAETNTvHj953QbPhWPvdL6L/ksZFVhHEkWTp
ntrDB//McYIcQGnpJ7x364IL5q7u95eAfK5Pla+ZU0rad1QBR4avg0ML6oaeRGD1
wi0SGfC4uncyvhLtUvXi8qfJQP9ZjJ4MfFv8+KACfKx/ThsKrVzMeIFe8tRDh9aV
mE8oVYaFnGsSq7CxOoO7AlhPTQT8DN5kcv+GX7EFHztmIiPZAZ5IWGjT6NBO0oe/
v+jDRoe3cTNcKrbzrSP7TB32CAS3yAXcwp3o68nfUl/keV5yE7V/E3oTVDf1GJHc
+BWRvxTM2sZAlTdbrFWQFM5j3b0MuQM6Y/xcen6Av8h5rRdG5as=
=PhsZ
-----END PGP SIGNATURE-----

--ICLe6aBUuDu4DwGj--
