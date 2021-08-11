Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D783E93EF
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 16:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhHKOto (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 10:49:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:38326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232645AbhHKOtn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 10:49:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EC8760F21;
        Wed, 11 Aug 2021 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628693360;
        bh=/CJw5b1pCyhSz3381YQio2pIOiSBPkA2bxUUE6V75UU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kcd3zIPatJD26UVvgsyOAlZ+d5BQYO/JhIefq4R4XHioN/NtEE8zRXBAnnHCQZWp0
         VyEKJiO8A3O3mS7z7RBV46n6z8lEQZMWgRiqWes2Gm0YEYY54jJCG567KdDHcJ/QKq
         3KMPdoXuOMVZRGBxxIUNXO9+45lXijXAbs0AZeKIGTpRzgoZdJuZ1gRbDilhBcb3pG
         s3es1PMjpXCM/5HA6/1cygfcBfW5M3VlfXG3Yw3UPDLxzhpkUVq/1MAMXP/adYPdoK
         Q9c0PId3AcZtI+G03p3Dr6frTFfaks83fg2jGdF3x1ROoE7Pt91PDU0zw6v1Zu/cln
         /HPcj+ZBOnqbw==
Date:   Wed, 11 Aug 2021 16:49:17 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: dev: Use sysfs_emit() in "show" functions
Message-ID: <YRPjbXUjsKJw25fR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210712142323.23118-1-andriy.shevchenko@linux.intel.com>
 <20210712142323.23118-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iwPD7j4h5wJmQNtx"
Content-Disposition: inline
In-Reply-To: <20210712142323.23118-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--iwPD7j4h5wJmQNtx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 05:23:23PM +0300, Andy Shevchenko wrote:
> The sysfs_emit() function was introduced to make it less ambiguous
> which function is preferred when writing to the output buffer in
> a "show" callback [1].
>=20
> Convert the I=C2=B2C device sysfs interface from sprintf() to sysfs_emit()
> accordingly, as the latter is aware of the PAGE_SIZE buffer and correctly
> returns the number of bytes written into the buffer.
>=20
> No functional change intended.
>=20
> [1] Documentation/filesystems/sysfs.rst
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--iwPD7j4h5wJmQNtx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmET420ACgkQFA3kzBSg
KbYK3RAAs52saJpMK0qhpmSyHMA+Pmo9wlQZatuzSpCPekk1PPV8Rrh0bl5FM9hA
Q9Vn4yY5mGjWVYGXm9U0MVNpXtRMrLp3j9XZI4WRHyqF9Lgrex4iwCUhFKuW4GKD
SSHTa14xc4pShp0CDHz0sZ516MfWJtrz1j+RJDPQ+4jN9/kk5v6b23yMxzuIlxJu
U3TufpO9dMqZK4kclXrnjaSPYujK6gOxQU1L97J8aQaBUW4e2JVsDpqMbT7r4fcx
wqO+3sOh8KWlsFJLlyHTx7PLJ9ytx2HAs09ETw2EpSaiLY8KBJNd8I38QkiOGYeQ
NwwCmoeT3ICk7nWSWD8JzS5vrulsLN6SgqRaODnii3A+6Xss/+W5T4yFxFrEHr9M
RT3ad2z95bFsueLJ6OC8qdWLbTep3Y6MgZUbhPxnVYmJAs+ZkZasxOCb76DzwFMe
lj6WmqBLp2tJPEjHL9f74bhHr/0dO8vbP6/tY2vhkWGH08sSrJS7NcTkoNy1w8Kj
vMdo8pFnTLb/BSSgIWHpfnaIeAYCPVkBNjM8gCXw4SYJNioEqHPJEPO0gHxBMQvR
vITnsRnP0//zTRsQnE6VfHEajDISyiKKl0FNfa2Qu/xJc7ezn0pzapvPLVx0t+Dv
s2cY8hJ08MWqj4Ou2O5/Zq1Jn5SxAosCWFAjHyUnfAhYUcg497g=
=AQ8e
-----END PGP SIGNATURE-----

--iwPD7j4h5wJmQNtx--
