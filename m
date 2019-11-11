Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D735EF806B
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 20:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfKKTrn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 14:47:43 -0500
Received: from sauhun.de ([88.99.104.3]:49470 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbfKKTrm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Nov 2019 14:47:42 -0500
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
        by pokefinder.org (Postfix) with ESMTPSA id 134692C0428;
        Mon, 11 Nov 2019 20:47:41 +0100 (CET)
Date:   Mon, 11 Nov 2019 20:47:40 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Max Staudt <max@enpas.org>
Subject: Re: [PATCH] i2c: icy: no need to populate address for scanned device
Message-ID: <20191111194740.GF1608@kunai>
References: <20191106150231.26605-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H4SyuGOnfnj3aJqJ"
Content-Disposition: inline
In-Reply-To: <20191106150231.26605-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H4SyuGOnfnj3aJqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 04:02:31PM +0100, Wolfram Sang wrote:
> i2c_new_{probed|scanned}_device will update the address after scanning.
> No need to preset it.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--H4SyuGOnfnj3aJqJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3JutgACgkQFA3kzBSg
KbblURAAgjqfXvG6PIG12aVSKq0pYH+4RokwCFm0RwFMqqGmghKtMZkJfE5DdwzW
x72oypDQEk68ho+5gHy5vSsP0YlSauny07J3loE/jTS3Bt0+c2FObpVEyq/RJoQ9
fEzrfqB0G0xaJ7QXqOROiQQQAySOJVEmTcVtu0nKLqyKa9B58At9vV3/ejfybXyN
LTEWKZKxpOBvEKtKUVT/CjEGgnyZI4N7LLqgAn29QKELsqq9+bFggi0pu2c8QDbr
e8COLl8z431aPmt2ERCZhVQyJ+W4/g57IBuXT3srVI4WaVBOt72WojODZNq67aLU
p+nv+sBGz6Yl7URN9BDTrw5rUvs3Mbv4OsCinN4ThVU3wibj9iemLpE2pLmcPbg3
YtmP3J64/VHR2YchbBy36vRlgstoCQ0zFHk3vCBAoQt+HGpM/TP8BkmcabiCRtaY
1c2hDtZdxW84zgZgsXHcoEEmJgPXUUhUYISEcwkGJxBSsHHAFLC7KGsLWYWy4I8I
Sy05I+5AK/Cd6B/MplVSnCoI9x/Ikqqj37LETUc40xIPUXb5LbCRIqcw4B3LyD7m
AVb+E8becYayLxH0MMAT471oY6C0/yejaNqLq3Go02lPLVTvA7wTgTmMDANXIr6M
suoduqVDfiS8p2qMFkDr0a9+MPQwa2SPFphIVjCIcBqaSP26Uuw=
=Doj4
-----END PGP SIGNATURE-----

--H4SyuGOnfnj3aJqJ--
