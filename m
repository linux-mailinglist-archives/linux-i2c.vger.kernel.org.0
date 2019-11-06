Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 174ABF191D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2019 15:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbfKFOtd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Nov 2019 09:49:33 -0500
Received: from sauhun.de ([88.99.104.3]:53808 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727275AbfKFOtc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Nov 2019 09:49:32 -0500
Received: from localhost (p54B33505.dip0.t-ipconnect.de [84.179.53.5])
        by pokefinder.org (Postfix) with ESMTPSA id 2518A2C053B;
        Wed,  6 Nov 2019 15:49:31 +0100 (CET)
Date:   Wed, 6 Nov 2019 15:49:30 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 08/12] media: pci: cx88: convert to
 i2c_new_scanned_device
Message-ID: <20191106144930.GA25832@ninjato>
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-9-wsa+renesas@sang-engineering.com>
 <faa29a3b-c939-eec3-355e-8c0ddc873391@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <faa29a3b-c939-eec3-355e-8c0ddc873391@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 12:18:28PM +0100, Hans Verkuil wrote:
> On 11/6/19 10:50 AM, Wolfram Sang wrote:
> > Move from the deprecated i2c_new_probed_device() to the new
> > i2c_new_scanned_device(). Make use of the new ERRPTR if suitable.
>=20
> This commit text is a bit out-of-sync with the actual patch.

Ha, true :) Thanks for pointing out (and the other reviews, too, of
course!)


--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3C3XIACgkQFA3kzBSg
KbZirA//X36v9Slo0cUGXuxTQ9RfKip30Dw3SpKsmSvrjs225Zx3qTp+1j9NaTQG
einz6gUyFGFngP8gMFbUx3eBY+0Y1wWfpF3R76NilUR9aIoCKvahHQznpiNeZZ+Z
Vqj/fGVB6xPMRLdGlHACHh7XXXmCm4zyQ72Mco0o2YmTQBpoP6LM6YYd1+VgVlXN
3PrM96cUdTCyxFfeHXXr0XFRW5FB+3sgxSNgIJzC8Rrl1j2bfYD6BXPF1Ov8Tmgo
fBd9DOIJWG4djlw4zVc3l83zNliEDXlzVQfsyVKgn3U5jXsdiX2fSzFGvb7hR9Nv
U9z+Ap1DF0rq8jzAlgwso8/IlUnV9SrLml5+P+eA4d8+aBNEifqy63S7svDXp75Q
4ixqa76r/VLfV/yC8i5ib3NJVjZ7BI+Tq033LrFTujOxJW4O/wXE5XrbtDMXVVik
q7UVbjkpslXQz+2/cCUtU/z+tSlKjGu4ylKSSi0mPY9Nq92l6XvbQOoL0+icFURM
tFnLaM5ZIDvhZaO/nLmcwPHMgrbChkneTGkfbfZLUJhzLtmbG5KIOoJ8DAsMx7vD
svZKcFzxJCpkGrrNBRDMWXFbnb0gx+0WMSPITIgcFp5YGF6BJOHIBe4x032789Li
IPuhi8lSj+khmz84vFYaqINDdlx4zvO38zaEgxjgDTwPLKYUkXE=
=p3Ys
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
