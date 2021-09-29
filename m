Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A46C41CCB4
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Sep 2021 21:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245306AbhI2TkS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Sep 2021 15:40:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:59452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229561AbhI2TkR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 29 Sep 2021 15:40:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6D2D6142A;
        Wed, 29 Sep 2021 19:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632944316;
        bh=4OCALi93rE7qyvhEHg2FoJqKDsXZWaU/x/nyDuGV/YI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zmhk6W39Fe3imQOeh3Z/6LYPdndHUMgZ19hLv0neXm6FLLwsbwgmK3fRZE6nDcq5V
         DxIkaTiDbli6zNuFmERmDMCXMZnrsnUOCi+9Mn5ycOxdAqI7yhlCqA1RIdigDFQRyo
         xbL/nmsF/iindCE+2B1H/Ji/g+pdcp5WsyL7rf4YQ6ZlHS+oRxjQXnSmH/ZCjg+J04
         K3QyG7fgmcXBN7iW/s+KUEl+CLrpQaPL+Yd9RTuWAZTzoVm+5Wlsi/wmti+gVQqBz9
         IOMJdYym+5aUk471vXDA4jGWguj3IFrsGrAe90aKxmFYrMWMnV8sNMGhGPHlDib+PU
         pd8tDbl6jf8eA==
Date:   Wed, 29 Sep 2021 21:38:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 5/9] i2c: i801: Remove not needed check for
 PCI_COMMAND_INTX_DISABLE
Message-ID: <YVTAucAzk0b02z3q@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <9ac8ff4b-3e2a-278d-f7f6-65534b43eec7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NSrlfPRgA2WKz6Nd"
Content-Disposition: inline
In-Reply-To: <9ac8ff4b-3e2a-278d-f7f6-65534b43eec7@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--NSrlfPRgA2WKz6Nd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 06, 2021 at 11:15:51PM +0200, Heiner Kallweit wrote:
> do_pci_enable_device() takes care that PCI_COMMAND_INTX_DISABLE
> is cleared if a legacy interrupt is used.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--NSrlfPRgA2WKz6Nd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFUwLkACgkQFA3kzBSg
KbaCWQ/9HCXdt6Fu+cfxMwwSj+Q/l76MM03IgI0ME6yK5USOPD7cjN4MXeJHDlm3
qPuMBpkz6WrfurNhe3iyyyLaRQ1LF4eLmzCixDpTJCJcZvXUiQ6o57fB+UG7PvBX
5KjIQGSqy0VFfEFYgy/jeGy7cWygU1tlukI4hQ4kQYn/SZZTApzdhezPmo+YQ+T/
XFnG/bw0E2NcTribTfOMGzaJLzCK9itUbHQ2cdhaW43nwK50S1s0m1sVHA3sXZKS
JBBxNQQ5jQomlVYun2ZifWV8tUcQtN8OWNIdH6cuk+ifCDxhgtFi/RuePCPI/snb
jQGsHi0kNJWjrixv6UHMrK68K049DrWR77q6YD+BQH9+6pAYbXmD6V3eErp/MxQc
p7FDCW/69A8D5HpUabgxAlVViUcnzzZxJ979lf+ZGgIcqlV7ZUJVKp3qm70tPW3D
4stlpMoJzaMHlQfUknvtg6uW6eNS3+cTlLgzcYfIZZBI1zFN07/tPLTSLstKP0h3
yJ2BDoEnccDyFXnZbaUHVLgo9E6k68ULwqQbWkPcxYF89Z23rTQutGy+m3JEXn/D
cPiQHO/hEhF3wZOnO0UrucH8EyKPlMHQw7/4pnGgKHm7oEFlNKNW+0Z+Xrbs4ICF
xd7HKapLcG5PYzOfUuuu2ei62cPnLIrAAQ2UzVyKrVr4cLOoiWo=
=DsrO
-----END PGP SIGNATURE-----

--NSrlfPRgA2WKz6Nd--
