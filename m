Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AACA2E9D17
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Jan 2021 19:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbhADSco (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Jan 2021 13:32:44 -0500
Received: from sauhun.de ([88.99.104.3]:60550 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbhADSco (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 4 Jan 2021 13:32:44 -0500
Received: from localhost (p54b33105.dip0.t-ipconnect.de [84.179.49.5])
        by pokefinder.org (Postfix) with ESMTPSA id ACDC52C04DF;
        Mon,  4 Jan 2021 19:32:02 +0100 (CET)
Date:   Mon, 4 Jan 2021 19:32:02 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     qii.wang@mediatek.com
Cc:     matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        leilk.liu@mediatek.com
Subject: Re: i2c: mediatek: Fix apdma and i2c hand-shake timeout
Message-ID: <20210104183202.GD935@ninjato>
References: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
 <20210104182959.GC935@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Content-Disposition: inline
In-Reply-To: <20210104182959.GC935@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 04, 2021 at 07:29:59PM +0100, Wolfram Sang wrote:
> On Thu, Dec 24, 2020 at 08:26:07PM +0800, qii.wang@mediatek.com wrote:
> > From: Qii Wang <qii.wang@mediatek.com>
> >=20
> > With the apdma remove hand-shake signal, it requirs special
> > operation timing to reset i2c manually, otherwise the interrupt
> > will not be triggered, i2c transmission will be timeout.
> >=20
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
>=20
> Applied to for-current, thanks!

Any Fixes:-Tag we could add?


--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/zXyIACgkQFA3kzBSg
KbZdEA/+P3rD8ApQef9W5LjRrab8KDgGqnMXQu09AfuzyQBnshelxTMu8B4MZqjI
NhfB/xNdPXXc/FsG4tr+48/KERJh/QtQG8t+WvWzbHjNASse1qwKjAHX2iP0Wf5x
PWj3Y63EVSX13vLLCqMnF1B1Cwn5LXgyAqoR1gPbt8SuT2TSyiE0/UMIEEkJE6AV
4Ta+16BLmuYsi8F6e5gp6Gn+YjNbbJqzzUJ0OSWM/vjsLHyajYlvORwHgjMnVy3R
GDMM3OEuFWEyFf1dZZqM6Ex7jq1huehNQH+9r/04XGHLatrw3J5nhcxgI8uVgkPw
5DVzj8m8vGs9R8UgCFE49sFTZfqjyxThRKzeWOInwambhKfBwj+1PNcEQvTgDOLs
ePpVhlBpbw3UxeV2ieit3PeEMiq2ULYMtdA7LxWHp2yFBjuY07nd/Nb3bu9lmtnH
K0RED212ymkP1g+D6zc6LQvH+A+IvX9fXPNWFpHnllbrnqSwHuwAL+2sKaFXdPdl
ok0rCMGRggqAEtorg2y/4ihytL/xtrmAkuNSc5NoandtWdHTMXT9nSOZvw/fQxEN
NwEnhX9GmHa6DR7BoK81Pz0Gpn//d5w0FIQxS+8Xp8JXneNvyL40WC0+6rHVRCey
QMCzjbg7igEfYR8J1x8mcHSIZyGVjdAQZ2236sG5OKVg8j6LnDU=
=DbV2
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--
