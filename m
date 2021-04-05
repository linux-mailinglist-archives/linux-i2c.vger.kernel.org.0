Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B913547DF
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Apr 2021 22:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237351AbhDEUzD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Apr 2021 16:55:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:57930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236040AbhDEUzC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 5 Apr 2021 16:55:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69DB161019;
        Mon,  5 Apr 2021 20:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617656096;
        bh=TZECcf04A+kZXqwkIon0Qe2mhbm/d9UADh5U5/niO2Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tg2M6LMYvMaN/q6MpkbS21TzTuSuzQiCGU4H4i75lMhc33tS97B/r/edS235IjCUo
         +reYZogjlEfW7l8FA3Likvu9ad9ZaLFIMEdRuiuhpOyrLTivoW7FNSOEouZi0a1eiY
         +Gy53dj8p0y0dmK340MKn0SBJ8zKzfruMgWCExBjHWMHLR7HVfeF4vS98yoe1F8a6f
         MV9icQ5zGSv1lvhhi8N8/Ec03LRuPmx2vF0Y6bFcoaMfyWK96zLQffDUkcAq3dp9GR
         OzZhcoRd6x6nJl5Unm49oRCpMYgwsvV0teqI0zey3TW376GFD+UrqN1+o6vwOmfUJi
         9s2zKPJCNE77g==
Date:   Mon, 5 Apr 2021 22:54:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
Subject: Re: [PATCH v4] i2c: designware: Add driver support for AMD NAVI GPU
Message-ID: <20210405205452.GD3945@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
References: <20210331140730.2058967-1-Sanket.Goswami@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline
In-Reply-To: <20210331140730.2058967-1-Sanket.Goswami@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 07:37:30PM +0530, Sanket Goswami wrote:
> The Latest AMD NAVI GPU card has an integrated Type-C controller and
> Designware I2C with PCI Interface. The PD controller for USB Type-C can
> be accessed over I2C. The client driver is part of the USB Type-C UCSI
> driver.
>=20
> Also, there exists a couple of notable IP limitations that are dealt as
> workarounds:
> - I2C transaction work on a polling mode as IP does not generate
> interrupt.
> - I2C read command sent twice to address the IP issues.
> - AMD NAVI GPU based products are already in the commercial market,
>   hence some of the I2C parameters are statically programmed as they
>   can not be part of the ACPI table.
>=20
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Co-developed-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.shah@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>

Applied to for-next, thanks!


--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBreRwACgkQFA3kzBSg
KbZpmQ/+M/EzdpGfiogWWOy774LR7sr7Ie5c1RuEa4hbEFdltiTs997CJ09Xofsw
VJigg6qFdYMFIRB8K2fdMN++hlHu4kPVK3TGtHcQ9pWT66eCiCQ9Wj1yhcQgJL1U
yKU+BNyX/S/FBfYqEZMXymB0pTyoXYpbHdIE3PUGdqhvTrkpW6qvckkVgq4zVndn
SD2M6c0VPNG+6Q/E+ghR/HczZYuzQnzvJb7pFdJ9nYcbIv3je9AURh7QMrkHCVNH
hfyYTxEWNRHYkvhjiVkBEKrQFVb15xomVpi+ANSKTiFbFJ3/CaVeROJ6xja/83ZF
J1yJ96B4Yt34jKycwuhOATOCGGh14lztbVfDNYL4mOjy96+ElxAqEENpSJ+mIMSH
uLqkEj5g/Rbot+KRy+gUNaQJ/3v4uo3B7XgvQNYHnXKOE9qvklupy4e8qEn4D0lm
B0N1u/pfNe4VdI3b3mfKVHCa0qjg7BII7IIQZVSaeiKB++r53Hhrp5fY9dSFOWxa
zfbIS5k5LNykqxJI4QMkg8ivPraHategI8GofGj46xmd2t9jTLfI+qCLp/y3RY93
9dmSEteXy/CKth4ua3M9NJ96pCYt8we078Tko6ethIgsdPN7UKZXNBvJj82yJ5+A
3wBTQMl4yIQQx0rVXdBaxh06Af3Iq7nEn5u2A2sJcOFwH2sEl20=
=J46Q
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
