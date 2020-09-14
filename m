Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68752268561
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Sep 2020 09:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgINHDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Sep 2020 03:03:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:58050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgINHD2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Sep 2020 03:03:28 -0400
Received: from localhost (p54b331ca.dip0.t-ipconnect.de [84.179.49.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8ED81207EA;
        Mon, 14 Sep 2020 07:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600067008;
        bh=wAjRVfdFhWh/bDiZoa65sx2FX5XfapI0pSQaifbUliA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HxEOgdNBR9DPBW/NnCIrIhjdMnXHO1MKyMzjASWxumhJ+A9wO5liNapFb/ED1/3vw
         sfTdJrm8Bg8e53WFAOTjqkUCOr9MAfJFcyqfoWEa0oiqT9p1VLkH85XyD94H35TDr0
         UV1/yTJNwTaadHJaCUZ2hfkL2Qp8oB+af/oenC1Q=
Date:   Mon, 14 Sep 2020 09:03:25 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [PATCH v2 1/2] i2c: i801: Fix resume bug
Message-ID: <20200914070325.GB1088@ninjato>
References: <20200901152221.3cea0048@endymion>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline
In-Reply-To: <20200901152221.3cea0048@endymion>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 03:22:21PM +0200, Jean Delvare wrote:
> From: Volker R=C3=BCmelin <vr_qemu@t-online.de>
>=20
> On suspend the original host configuration gets restored. The
> resume routine has to undo this, otherwise the SMBus master
> may be left in disabled state or in i2c mode.
>=20
> [JD: Rebased on v5.8, moved the write into i801_setup_hstcfg.]
>=20
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Added stable and applied to for-current, thanks!


--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9fFbwACgkQFA3kzBSg
KbYQPw//ah+kvx6KaYaIOHs7syXODYrA9whLUnwc3zoURhxSx+7md7M0zi5teq/M
VjrYIZI/4ybTuvrdAYM7kw3MlP+wT490P6lmUWA+27v6VrZrjghJIO/+pm3HEr5x
4k8JESiPwENDLHqCvb58GA1QsswplanXUFqU1x4HTQTaLZE5bZcoFEw4lJDsBkqd
QsGLbo/bulyDOP5DEwJgzPSdF8+LurhUSY2L97cTTVqf5r3j0eVL6jHiLrjIcvX6
7wCI1qIfK6N4aW9+ne/F4sAnIdSjV3FAuciCTZ3L9qABEUI4C+MlMT4GZxqTdJ58
7emgvIa5561jxoOdbpym781z523QSBhqYOASCsZY4H01gQk2IdqWFEgHIRWwN25M
dhrPMEhSPmAkmbBvmTg7B66GqLGPxQT7rWrLPgd2IGNvMIFTN3j8qJi3+IQ/FbjS
+hoBfuJi9b6gxIsHo/FvBlDQ7tJr6gSxgkv90FaLXigvzIi3ajo8FZI8rjdtn4hH
6mNje6liJjmJSJAEED1JddKvrvvWf2Os3wyk2gmG939+piNatKNKkhlkh/jAYZ8d
qTnFHGeTtYPFTO7x3D/m70jkPwWPpi4e3IkT/hL8HJPRRszBzTK7zPPbAbwKAEPO
7dVIe8E4W9SHYskVguOtTjS3eZJqylLYLTE0ewtbf/6Qni9WTjk=
=dlbN
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
