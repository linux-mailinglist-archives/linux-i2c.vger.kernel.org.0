Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9D32CFCF9
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 19:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbgLEST1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Dec 2020 13:19:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:42900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727922AbgLERte (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Dec 2020 12:49:34 -0500
Date:   Sat, 5 Dec 2020 15:12:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607177550;
        bh=CIg1dKdZ01j4X7aWOWsE5DYxc5DliM0YMIs1RD+O+ME=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=i8IOIjDQTsJhAL/9CwrhMCBBe8k3MRfUu/7G8dpEfX+uS/LGMeRF0snMryfw87flL
         r5s3GeKQE02CTRRGWQL5+MTJgh3bJbS+wxZJfe2fbTJ7nOEtODsqHwGT6gR+n8kE6v
         pv5FG5zE9TqNR7HytvPk/dkmMc1NuNOxGxKXqYixaiLODc6ssY3gGIxPcUBsyivwba
         222almcB+JmHOy0sDbItS08zozEuU7EyvhE9aqtdA6veC1e27NICOtFBU2J9PwIifr
         RHLzELVUTOxBFZlcPBmNcEsowPlje5fYulwQ5/oX52RS2LUmgAmOaS5ZHypx6Yg9wm
         2uZT5VG/MqqmQ==
From:   Wolfram Sang <wsa@kernel.org>
To:     Wang Xiaojun <wangxiaojun11@huawei.com>
Cc:     kblaiech@nvidia.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: mlxbf: Fix the return check of devm_ioremap and
 ioremap
Message-ID: <20201205141227.GB5761@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Wang Xiaojun <wangxiaojun11@huawei.com>, kblaiech@nvidia.com,
        linux-i2c@vger.kernel.org
References: <20201203014647.3468430-1-wangxiaojun11@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline
In-Reply-To: <20201203014647.3468430-1-wangxiaojun11@huawei.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 08:46:47PM -0500, Wang Xiaojun wrote:
> devm_ioremap and ioremap may return NULL which cannot be checked
> by IS_ERR.
>=20
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>

Applied to for-current, thanks!


--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/LlUsACgkQFA3kzBSg
KbZHfQ//SZv/0jg4PQcNbp73t3976kUqQXhy/mwPP9Hx9F4LVWrGfoP/BNxfhCLs
PoWrSV+NPouAsZpZC13KgVZbQvsCzxCGsVGF2DrvGdLlCrgE3uyv/hn9N/RYsjpA
P0KAYtmZoqH6kziMPDfrA3N9fwsm4a1V6+2jBqY+pZRMCKrS7BEeTh3FkhsejqbY
Vm9I3f7FGBM0o01VhPgP8QdjEpEJJmNU+CQNGl40sHKIM0fLyERD21qwpEBATCjc
TqcN+ibRPbh9E1a+U1nZCa1YvhMr8/sdJ6eoOTUXzkeVlnu2bsB3+CA+Bqo/x4c9
LuPPD3ruof6iCJM10sKJbkLAm12CcNZji6/9ott1rANBgxBRgMLFuNXkMh0k5KeB
CQl5bIRAKxQAgztBzp9oqli5EAP0gFl5LLP8GV0XWpsMClkSCLEqpRosRFLY/IbO
fLBbYp5qz4vl9OB+V3iZYLamEa3MDAnLg+BWCB5jnIAUN6FrmBr+9iDICIsWAVgG
ZUeYMXueIOB15+lRRllDHhbfgWZwtmgBIj40Xd7++1UeDo9YjJgCpVv5Oc6/HjgX
A0sksjw/HHaNM9kA/C3PwRb6ZjkiIGDYLzoLd14F8lgwsOnK2UMhIVW46DohcnP8
d7r+brycQZSFDzxxTGrvjraqfZ/zAwUDamBR+GABiVQg5fm2VUg=
=79Vn
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
