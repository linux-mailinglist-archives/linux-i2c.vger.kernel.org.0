Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 430FC27317F
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 20:08:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgIUSIm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 14:08:42 -0400
Received: from sauhun.de ([88.99.104.3]:55840 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgIUSIm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Sep 2020 14:08:42 -0400
Received: from localhost (p5486cf2a.dip0.t-ipconnect.de [84.134.207.42])
        by pokefinder.org (Postfix) with ESMTPSA id 41A842C08AC;
        Mon, 21 Sep 2020 20:08:41 +0200 (CEST)
Date:   Mon, 21 Sep 2020 20:08:40 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH] i2c: nvidia-gpu: use dev_info for timeout error
Message-ID: <20200921180840.GA18032@ninjato>
References: <20200921173426.2636-1-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <20200921173426.2636-1-ajayg@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 10:34:26AM -0700, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
>=20
> Timeout error may be seen due to missing i2c client such as
> USB Type-C UCSI controller on some NVIDIA GPU card. Currently
> we don't have a correct way to identify these cards.
>=20
> Tools like Plymouth (splashscreen) doesn't like dev_err so
> changing timeout status log to dev_info.
>=20
> Bug information:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D206653
>=20
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>

Hmm, a KERN_INFO message saying "error" does not make much sense. Maybe
this is an argument to simply remove the message?


--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9o7CQACgkQFA3kzBSg
KbY7Rw//aSLV0mSR7QKdhIXuml7xcq208J6jTCMXJL3sL9u5T0BdcNplxU972t/q
wyP+PVOAoyzkr+KpEUVxopU2nMKIRR0CAYbeomD5frK4vrseMKz8kAcMoY5Hidlw
10MjjIMGzb0Pdob3V5UUQXKWLq/yCMn/WPqPYtv7ZcQkmvwFFXMWqI1rIoeR6jAo
Q6wzr53lBR+nrwxcGLo64a5HE9qPgxGWyFalGXWzA21/owQfPpxiEyeamEWyaXbd
1J3XNRkCl76zfgegNCCNDRzS7sLBrQfUs7ZJug73CpjzHN3Q7tcbyn0TiDQfi0PX
qSNlEX0xUQTsbmYssev7jTMK+XTZ4PLIIKiZz9ld6SLkBXKkrHegkPwq+rjP1+Ww
ThKSB67ybCaph7uoMY7ZZpD6+hL3LO2KIsl1oEF69s2BUsGc1yVdWSHXoH9SId3H
U3R7ovUDZt82gc4L+jht2TEa+utqx1jnOthXH+gAY3+Pl+yzPZQaaO7yFE3FavYT
MOckRaontddNFoJEZtzUoAmURBqMHbHeJyyg/EJpBpLoGhBq7ddRLHxxIqkANPI9
c4e6pRDhFRoFEbyUcTcwAL6PGIiBQQvRTPdx/swaoNBXna62i1Cwc6LTz4xA3FCF
1XCGaAP0dLGbx+KKR0TBP2pXCOfJtjoV6Y/WmWD7sCela9NJvio=
=kab1
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
