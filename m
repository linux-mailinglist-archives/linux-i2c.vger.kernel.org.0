Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39123B3740
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Jun 2021 21:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhFXTuz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Jun 2021 15:50:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:37534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232684AbhFXTuz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Jun 2021 15:50:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F857613EE;
        Thu, 24 Jun 2021 19:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624564115;
        bh=OQezVEYhjFzcaI+rY4Y9xK11XSOl6xBaI9YhRYP+A/Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PPzTml/HBEqAdBJS1HbmPktPntsFfj6Ia/h0qQwELXQTaAh3LPlpbcnGE89MUGeB+
         eo1j4ygYLZG2xSfA5YRw/O6wziArR3yR4QI1B6C1iJY3/qxVO9Itt+1hNmhdVN/aon
         ln1KIuiwp9NeA4BHgunUmHF4xkqClZ2Rtjgc41/FEmHBvA6/ioVLOhppU+vfEwlOJf
         QR887xJeVVyzrPjw/Ny+hPsccAcxkrnOS99qN2umfv26L0HZ8peeJbmt0133HljLiF
         C+bt75yN/UDabUty+g7zNxOjKbLv4Y35hStDld0WC8HxTXDXTW1/fQFcDiX8eXpZyx
         OocOL6QCfH0uw==
Date:   Thu, 24 Jun 2021 21:48:31 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Andreas Hecht <andreas.e.hecht@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i2c-dev: Add __user annotation
Message-ID: <YNThj3wA0P7/twn3@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Andreas Hecht <andreas.e.hecht@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210624152535.4949-1-andreas.e.hecht@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9fA+NkiHXMciafc6"
Content-Disposition: inline
In-Reply-To: <20210624152535.4949-1-andreas.e.hecht@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9fA+NkiHXMciafc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 24, 2021 at 05:25:35PM +0200, Andreas Hecht wrote:
> Fix Sparse warnings:
> drivers/i2c/i2c-dev.c:546:19: warning: incorrect type in assignment (diff=
erent address spaces)
> drivers/i2c/i2c-dev.c:549:53: warning: incorrect type in argument 2 (diff=
erent address spaces)
>=20
> compat_ptr() returns a pointer tagged __user which gets assigned to a
> pointer missing the __user annotation. The same pointer is passed to
> copy_from_user() as an argument where it is expected to have the __user
> annotation. Fix both by adding the __user annotation to the pointer.
>=20
> Signed-off-by: Andreas Hecht <andreas.e.hecht@gmail.com>

Nice catch. Applied to for-current, thanks!


--9fA+NkiHXMciafc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDU4YsACgkQFA3kzBSg
KbZ1ug/+IrIJz/aSwJSEQI+BMw0FLJYPznzSZzTlMQq4rmUaUGSj2/kZ137bZht9
yIOrK6wa2PTjpyt6M/f4ixv7GAWM6e8peAITZllHbvur+Qx6v6BsxCytSJDcvdtW
IQtppQWVHaqBU+U97XIh9FzK6uOHcnr3nUB4FlkE4G85EnfImU/fDMfbdDg2fPsk
1D+hIZo9qfun+BB+AhRUvMhaFoLCIUNPHbZVYN/P0rOup8/pAylVj/reHmYIm3qy
lYP0+wA5ZuQR78zIj/OUdE2JHs3cfISmLf1223gFUSvHAWdTkS9D8obn0HEWRmsf
DQSFE1xaSWIIQ/wCI1Igjyg/zsQMWZTrTQhrqKBNEfoeASntGUlHwsbEMhxEwuQT
xBLtkiSQo4hHmYkSmcf5ZNfWIgU+L7A1NFUqytBMMtzAnh1H5XDN5hKw2LhbZIZp
nWwd6Q1wIUKZ4RRKy2TVqZ/tN6CCob8Zh92TsTf1/KAntPH/nTSKYj20cJfvPNXx
ICI1SZ8qstp50Qgb8EVZzW4AWDomgZNXxHBhUM/+cYIU9j/cijqOxUEUHbjYaG2J
ZuEnUvwIzyrP9zmy5Av/BP0WDMzxdWNztFSVioM6IUELifi83Z2fcKku7hqopzt7
rtSdhntowts/yCTAyMDGUm4ZFEesGnRxCCKXcp5ryh8hvhIrurQ=
=Ah+d
-----END PGP SIGNATURE-----

--9fA+NkiHXMciafc6--
