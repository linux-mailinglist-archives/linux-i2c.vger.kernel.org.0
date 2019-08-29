Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E39FCA2639
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 20:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbfH2SkG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 14:40:06 -0400
Received: from sauhun.de ([88.99.104.3]:42000 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728122AbfH2SkG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 14:40:06 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 10EBE2C001C;
        Thu, 29 Aug 2019 20:40:04 +0200 (CEST)
Date:   Thu, 29 Aug 2019 20:40:01 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: make i2c_unregister_device() ERR_PTR safe
Message-ID: <20190829184000.GA3740@ninjato>
References: <20190819204825.2937-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <20190819204825.2937-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2019 at 10:48:25PM +0200, Wolfram Sang wrote:
> We are moving towards returning ERR_PTRs when i2c_new_*_device() calls
> fail. Make sure its counterpart for unregistering handles ERR_PTRs as
> well.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oG/wACgkQFA3kzBSg
KbZ57hAAmus8MGUdw2okfQlv9wcR0+7m0TkzMvgirKQdlEymJtLqGIqjMlOsJE/K
QvNqqd2P8foJoOQHG/YA9zK8BBwkuu/5Z0SbgmXipxSNbm1QuMMb4IhWwd1fM71H
0a1N7Bld7o5o+HehYnl++jPPFb0CBc2qkQCReSM5o0VIWDod4BbwDzY6zgF2MSy4
U9Y/Ao7Un4eQHEzSM9a4z15EcqmY831+5VPo7Wr5Ap4M6VDhL+hFOwmn3I92v6mn
IF9lsQBzZj+valc6WpK3vHeEcMBM4jQpjUdrWxyGYBXAG9yOxbB3umn5DF7qRTh0
+xdq/Yavdz+z4TlmHduLogES2otChDMO6B9uLebpvapkl/tHmZa5Q5qJsyb9jiHB
Ps7dzA4+V3ty6+tb5yqYUthXOIXqEQar4iZJyZ5B4eJqLODNdMu/KkEuTuu7dnxa
GHk3THYOXfYUPlHULDwq7ZO074IZP+xRIXGyg6o+bJZU0FBos4ZKg4JXmTbKvoDV
2O3VtRS4sPUdWtJFkLJS5HTDdQZlxJ2JMjJuEQ68xXSnXRKpdUVEMSbYUhvFEwbO
Ioz7GWUjZ2ikmqElDZdfNh2K+W/wZOpDwN/jC3I2Fr/x81doAfZ0evgDJ8BqjjiG
BnaLyEPcaQFMh+xMenOet8vn7I4fHwgfS2sAoBoOludeoUmDGxo=
=oLN0
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
