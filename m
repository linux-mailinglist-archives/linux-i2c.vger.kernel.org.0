Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE1A35B058
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 22:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbhDJURE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 16:17:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:53410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234708AbhDJURE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Apr 2021 16:17:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4265610E5;
        Sat, 10 Apr 2021 20:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618085809;
        bh=THmUQfRMXLhShuTI+Hjasf5j34UjJD6Ys3G2mYZWHuY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aLh9NAEV+Q+F9J1RFtYk2hOPHzETL8ljRfA13eBZ65qZQ5MqNBNKAe9E0JAPuEwOr
         XUV1EiWANhTRINO+jf5gpAkf3Cne2xJrZdL6Y2FyvP/84Lj3iGid/MqUp6KxDq3yqy
         pL/kNFH8mbj4xXJbNTCH70fBojKkAou+mhMiNTRCB7oGR9WPsLO7WjW0NjNc0pgTgc
         eXCgoJWTlH72NkESgJ7OEPliunr/JhjcJgw2babOmd8333S7qwQQR+EcsxPk81WtWP
         BJbV0DMnAxVxioQamhLmCyrc2AEVgRepZff0xKIryAV5icoG6vFgSk0s80IDOSZVIj
         rbc6wOVvnyuNQ==
Date:   Sat, 10 Apr 2021 22:16:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] i2c: mpc: make interrupt mandatory and remove
 polling code
Message-ID: <20210410201646.GD2471@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210329015206.17437-1-chris.packham@alliedtelesis.co.nz>
 <20210329015206.17437-5-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6Nae48J/T25AfBN4"
Content-Disposition: inline
In-Reply-To: <20210329015206.17437-5-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--6Nae48J/T25AfBN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 02:52:04PM +1300, Chris Packham wrote:
> All the in-tree dts files that use one of the compatible strings from
> i2c-mpc.c provide an interrupt property. By making this mandatory we
> can simplify the code.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

After I applied this patch, cppcheck reports:

    CPPCHECK
drivers/i2c/busses/i2c-mpc.c:401:47: warning: Either the condition 'div?(in=
t)div->fdr:-EINVAL' is redundant or there is possible null pointer derefere=
nce: div. [nullPointerRedundantCheck]
 *real_clk =3D fsl_get_sys_freq() / prescaler / div->divider;
                                              ^
drivers/i2c/busses/i2c-mpc.c:402:13: note: Assuming that condition 'div?(in=
t)div->fdr:-EINVAL' is not redundant
 return div ? (int)div->fdr : -EINVAL;
            ^
drivers/i2c/busses/i2c-mpc.c:401:47: note: Null pointer dereference
 *real_clk =3D fsl_get_sys_freq() / prescaler / div->divider;
                                              ^
Can you check this? I'd think we can fix it incrementally...


--6Nae48J/T25AfBN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmByB64ACgkQFA3kzBSg
KbZ/uhAAn8GSLmd5BCWI2zKQZc8j26M4q/byWsMRIZgxbTXpT+IhSOn9b7rr6hTD
SLJI3SUrF/lVd4BuoH6T3+Ose0MdaJMhHCyRF4nO6aLdRfuMCVYxy7Ei837L8fJ9
DoTDA9odEcYDQRpdhxPiebHUCLA6eGZGlHIHAzVEpj1T7hwDYxBhO4dRagJmj0/g
RdE8QT5+Y/KIP9b5hC4CjNlsJ78bVBiVnE+hiQeEo3o8hLmfWaVfnI0ERyYBHYIF
OfkmG07x51JyJYIFM8m7X80G8/V1SAV4m3Eh4B/nnJ2ZzK2DOWv1VcuE0+e/13K4
BPtRlmLen89NGSUptMs+pfjjZWP1qhE8S+lSuyXj7vvlP7B753bgunUyv5ePaD/4
IQJfhq7A3vhtRm19vvaQ7IMzPSiYP/nZydSaPuhqFvjyau5x/b1r3HeK49ayU3cy
YLHGRIPEjSuXo9OtOgi6Nbgbv6toaGnfiJshBzhVhplzmLawUgvc8gzfhldutR64
A6p8LcXJGlvg6z7UfPKW9mvCQ+3cIBOpcKORPK8XYcVdGsHaXRCKUjjJyVQxGrZP
DxspnN/6I87JolS8W2S8LsW1MHUMsJoCo9VpWgEcEDN4fDRTIDKoPPjt9tDnTn8S
fTZu3CKNFBBfGMtWhCiZ6lwnJaHg2UsxrWWU4KXukHSazNKxqZ8=
=ONjN
-----END PGP SIGNATURE-----

--6Nae48J/T25AfBN4--
