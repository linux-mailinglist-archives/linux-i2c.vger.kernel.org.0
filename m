Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A153E93E9
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 16:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbhHKOrc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 10:47:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:37110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232456AbhHKOrc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 11 Aug 2021 10:47:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D248760E93;
        Wed, 11 Aug 2021 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628693228;
        bh=/zsU7DYNDgNARnB0g1dZmMw+/dbZ0ppjRqy+YOX0LyY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZIKW2cU6ldwNIBgWMOja+Fxc3h8eXxOMM4Ru+ZI7wU9qwfstCzI743pBn+wato3Tv
         ngtv+wM8YI5zEM2Ir+wdPclDhHEEc/ITO8PJhEzf33HQqvnQW3FhMk4zChe8Qea/Db
         SeRZ4kc9xCCm7VfBnK3BaO5cy+9Q5LG/r3keTt1i1HgC9sbgcPRR/59CcVV1k2Ljr3
         4aZxXI/MnV37xGW3jBZAmnp3JQ1XQCRqLegSO0r9rLk8iAMk29OpvYc3MG5w1qxZFV
         5vyGb6hJZUBnuXpB7SAC6LdzEMRsr99e92rrLDytRTcfq+r5yeiYUYTDr4xX35rWUk
         MNL3lAMpE7cuw==
Date:   Wed, 11 Aug 2021 16:47:05 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: dev: Define pr_fmt() and drop duplication
 substrings
Message-ID: <YRPi6SIVf379tYOW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210712142323.23118-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t7OT+ZOopNOJ3c7H"
Content-Disposition: inline
In-Reply-To: <20210712142323.23118-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--t7OT+ZOopNOJ3c7H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 12, 2021 at 05:23:22PM +0300, Andy Shevchenko wrote:
> Define pr_fmt() to print module name as prefix and at the same time
> drop duplication substrings in the messages.
>=20
> While at it, convert printk(<LEVEL>) to pr_<level>().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to for-next, thanks!


--t7OT+ZOopNOJ3c7H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmET4ukACgkQFA3kzBSg
KbbXtw//bOqkcl0K1UM1xdgy7I0Hjyg/fjUJrusTTIw9XAVyQv+oPWy6rllfQsGZ
dTSES6I3ni2yKfyjNzH3F8bEGInOamAO9FTtd2r0qSwONe+mx3yVvbK2cEjQDBeh
e1ZO6AHuRd7HIqOet6IqstLPQu3GFPjW38GRF1C52o5fWnPvpptYbr8BawWukE1u
/iRx5imE3fdFkfq0c7hyVVf2BUrf9CB+LleWvFlzpWBID9qVjyzjuOYXBoKpMLLW
HOT68R44HvofrxS2esVYgflYkMaY63CcGfRfVrS8c+LI5y0HHJh7cZqCvbenQcB/
GPJYLqHLzLjHKa34nnh+TcrcWbadX6Gy+IHaKTcdAbWdGcMyMa6pAEkiZgdcjX7T
vuDf1OCUlhB9Acx2tvZNf8K0bCSvY0aJ4ac0eQvkKRpKWqofGP8FH2w/NAniSEri
327TGxKbsE/u2wltxu/GHxI5frgrhVdaLDyqRJEQrfGDyaFG2DZXh9GEo382lGxM
EKtNHAqo6mIyffKKrHqDNuF1t9e/gUHVvCJWM4foj4p/GLDpYllPttHD+RNKp4rC
K+JfB5zRAxkOX36h6q6TO2Iw2mop9DqahlsradasVvrhWSt9ui2vW/wkiQUdPvBr
JWJmGiujBTz++JkBAs6dXhKdljeMUGPHNPTKH+JzZAoQlYmMzdo=
=rUap
-----END PGP SIGNATURE-----

--t7OT+ZOopNOJ3c7H--
