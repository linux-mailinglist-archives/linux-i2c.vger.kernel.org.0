Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C8F8D371
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2019 14:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfHNMsZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Aug 2019 08:48:25 -0400
Received: from sauhun.de ([88.99.104.3]:48534 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726821AbfHNMsZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Aug 2019 08:48:25 -0400
Received: from localhost (p54B33326.dip0.t-ipconnect.de [84.179.51.38])
        by pokefinder.org (Postfix) with ESMTPSA id 642CA2C311C;
        Wed, 14 Aug 2019 14:48:23 +0200 (CEST)
Date:   Wed, 14 Aug 2019 14:48:23 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>
Subject: Re: [PATCH RFT] i2c: emev2: avoid race when unregistering slave
 client
Message-ID: <20190814124823.GB9716@ninjato>
References: <20190808195417.13482-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6sX45UoQRIJXqkqR"
Content-Disposition: inline
In-Reply-To: <20190808195417.13482-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 09:54:17PM +0200, Wolfram Sang wrote:
> After we disabled interrupts, there might still be an active one
> running. Sync before clearing the pointer to the slave device.
>=20
> Fixes: c31d0a00021d ("i2c: emev2: add slave support")
> Reported-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1UAxYACgkQFA3kzBSg
KbZQBw/+JQr7bNsCyqYWDjrf2T/+h7iFxyOUnbsEJxeThCxUSfk8mNCgEe+OhM2e
/fKn2iWYoA8QvwItJwyWVrCoQKyG9AA21tuZLWuF5l4MfCJx9KzNOJlwlUy5tmVw
lVNaZ4D5bC+jUH5SaOGzU+9//SrQjaxFG5Y0/jhn9Ea9Z4gUB6TcQOAj/IH2mJSo
wKSRJIs9RrbasX/7x61A580oo4vdsBioc6s/14yw93LfljPpTNu8RAQnnZ8hWZfF
V0kZQD9s6TEmnpI8KrEVDeESco3s6gjKJI3X0Or3ylCLWXTurh6msQfJZhMjAqfW
os6IvUZ+u/MppUEWhGzGn/8wDqXbmDBYtZxkqlgQ9lNwimnm3b/hVNTchIE+qN25
4kH1t1kTU8CN6NZ6ScxK1G2SXrlfB7g3wNDLjjS7KM5J1yU6txiR5ZXTGQGz1Y/E
IojoiaMuqya09GXHGhFVq/cglzappZ2wPovV0nZ0/do78KAokOgyDMKyRAFbjEjK
I56tKnBAte+GkMqiJaEpk2DYbws7jTiCquhhUKZQeAXQNSVT0LKz5a2UpKLYYyvU
gS3EIMb15CAY51W4BT++ZcpEhc6sEFihBBmCpv3l0FJbdc0ZvmdS+a1RMVwElk1k
IU8QCrGeW+IW4Uv8dODm6rLtFe03DCs4PzLni9gzMqzMosUsmOM=
=AxdP
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
