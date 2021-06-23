Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB603B1E7C
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 18:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhFWQVR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 12:21:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:53966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229726AbhFWQVQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Jun 2021 12:21:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9DC560FEE;
        Wed, 23 Jun 2021 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624465138;
        bh=nFxDX3ob+5lrr19ZRCiRLVmW1vX1e+NTnnN+gVbSdx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h7IWxKWOYuMGPnptAXVpdupWM233lGFswGdu03Vw2NdlsTi+IM17AoN46iYQZzozU
         ZWrpXu/oN685eSERGJzz85apt8LDgtA+YCbc/4YX5YLDDyje8R7jWdn3P6nplpAxOx
         uhPbBFObjU/M9K0O82sO3Ea/mYp+ECJdceAixCVfDKyl9fdwOIHvkGra/L3Mwjmyv7
         9VjW2rcaF1nMpkR4FHTpVYNipv9SxH1q4o+w0t3PFKBenI6HBPHcBsDxsp4Ahh2wb/
         Z+9gEMy1jXbg/Ke0cD/Mt9UK2yZBqQz6PcNIOJTlhGWEIC6r7gMWmF/r3SvgCbNXCK
         R/i0bTstCaing==
Date:   Wed, 23 Jun 2021 18:18:51 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: Re: [PATCH] i2c: cadence: Clear HOLD bit before xfer_size register
 rolls over
Message-ID: <YNNe63q2T/9ndSgg@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
References: <1606203965-31595-1-git-send-email-raviteja.narayanam@xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OyBLtaJDLVkSju19"
Content-Disposition: inline
In-Reply-To: <1606203965-31595-1-git-send-email-raviteja.narayanam@xilinx.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--OyBLtaJDLVkSju19
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 01:16:05PM +0530, Raviteja Narayanam wrote:
> On Xilinx zynq SOC if the delay between address register write and
> control register write in cdns_mrecv function is more, the xfer size
> register rolls over and controller is stuck. This is an IP bug and
> is resolved in later versions of IP.
>=20
> To avoid this scenario, disable the interrupts on the current processor
> core between the two register writes and enable them later. This can
> help achieve the timing constraint.
>=20
> Signed-off-by: Raviteja Narayanam <raviteja.narayanam@xilinx.com>

Applied to for-next, thanks!


--OyBLtaJDLVkSju19
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDTXuYACgkQFA3kzBSg
KbYIdg//exVtEUi0D2HX1w/0woHDZRYQ/uFHs4XoH8Ptbj2eWqUTHEKz+9tepW91
vtkbu2vGzNeP8m4aEVB1zg9ncCn0aj+EYJGb68JvLFGGgoHf2R7i1ko2PoAV4d47
q3ZNU1F54QRvUScOc5soabUQBVJ0NFRQJJ841ZAEqL0ODHmkrZYa4ki8EvV6zPEH
FI1g2ccETNrBGoS3no8u9ecAMV5RFEP3zYHDjnpyLyPSODnkB/eH8fhjCMmvyE39
3/PwLQGpT0qlj0yDk1T38ohUUucDD6V9YbrHvKw9w0F3Pfq21w8fGSKL/sIRkhwo
spbt7lCT9ao1rLgd/8NXVqRl69tLv+fqJI0vl0YvJyOVTyddWRTHZDw8D9qDiS5Z
8iGbgWU3UAgfTFkm9l2IyZZikzBCWuTwYWMfxwP9ZHrlmR/28V3jAjL9/AOXm/sd
x5d0qMKsJHta9yKqnmERGiTFSRTKrBk4RhEhMVD89a131VyMfoHnNZQOnHLhjAgh
wDnvDz5TQthhCQzeLKWfUPTMMsNojfg/qsbXWrOoUySqVYD8nlHsuvNUopKno6MA
Y5SdLK5NetL3qvED/0MmchTZbNgWsnvhbTjpxbnuaLfvtGlu6G2w2gfQ3VRuPflc
jptjt3QNgph9TwVra44sl04QHp3+1/kXO7UgfWiARuKFoAJHcXw=
=1t/y
-----END PGP SIGNATURE-----

--OyBLtaJDLVkSju19--
