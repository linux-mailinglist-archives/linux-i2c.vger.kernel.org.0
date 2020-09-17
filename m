Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B079926E6F7
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 22:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgIQU5I (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 16:57:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:43578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726180AbgIQU5I (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Sep 2020 16:57:08 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F5A520874;
        Thu, 17 Sep 2020 20:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600376228;
        bh=yioVQ2V47I4LfYvG7JgQOgciS8kwofLhOenDKNaa3XQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QM28TeKuU/FZvrhw0wWzwLsDqf2A6RT82P5IJYWJo17ZTE51enNCflKAXRRtaKwdO
         B8dHOKgWsAG1ppdT8v/LmtqC+78QGUZ3+VXom4JrK2Vl/Mg6aMU+QpoSiB8ntzNMqM
         YKDgjrvVISeTCzynyfXXJaZUMyD6wMkFJEQ+M3i0=
Date:   Thu, 17 Sep 2020 22:57:04 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sultan Alsawaf <sultan@kerneltoast.com>
Cc:     linux-i2c@vger.kernel.org, jikos@kernel.org,
        aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        jarkko.nikula@linux.intel.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com
Subject: Re: [PATCH v2 3/4] i2c: designware: Allow SMBus block reads up to
 255 bytes in length
Message-ID: <20200917205704.GA18027@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Sultan Alsawaf <sultan@kerneltoast.com>, linux-i2c@vger.kernel.org,
        jikos@kernel.org, aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hdegoede@redhat.com, hn.chen@weidahitech.com,
        jarkko.nikula@linux.intel.com, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mika.westerberg@linux.intel.com, vicamo.yang@canonical.com
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <20200917052256.5770-4-sultan@kerneltoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20200917052256.5770-4-sultan@kerneltoast.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2020 at 10:22:55PM -0700, Sultan Alsawaf wrote:
> From: Sultan Alsawaf <sultan@kerneltoast.com>
>=20
> According to the SMBus 3.0 protocol specification, block transfer limits
> were increased from 32 bytes to 255 bytes. Remove the obsolete 32-byte
> limitation.

Sadly, it is not that easy. We are trying to extend BLOCK_MAX to 255
(SMBus 3 specs) but there are various things to be considered,
especially with buffers and when passing it to userspace. Check here for
the discussion (and you are welcome to join, of course):

http://patchwork.ozlabs.org/project/linux-i2c/list/?submitter=3D79741&state=
=3D*

>=20
> Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/bus=
ses/i2c-designware-master.c
> index 22f28516bca7..5bd64bd17d94 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -433,7 +433,7 @@ i2c_dw_read(struct dw_i2c_dev *dev)
>  			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
>  			if (flags & I2C_M_RECV_LEN) {
>  				/* Ensure length byte is a valid value */
> -				if (tmp <=3D I2C_SMBUS_BLOCK_MAX && tmp > 0)
> +				if (tmp > 0)
>  					len =3D i2c_dw_recv_len(dev, tmp);
>  				else
>  					len =3D i2c_dw_recv_len(dev, len);
> --=20
> 2.28.0
>=20

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9jzZwACgkQFA3kzBSg
KbbyuxAAtVvk4z2xbQhHrVRJqygO8JzmyOFWL1J8QCn7/cwZ+Kf1OhainyVtGkuq
t36/lVl69MNwe7DNumQg3UdxpmSHdGTwd0QYkVRrHkQIEuCZEsvys7cWXcddvB/E
v/rSyY4XQsJBK1+NKQxEBe0CdZ3geZoIMcBYNP67DF5qTH41G7Hgo/PIoBAfXyL8
xqfpnr1zydL7ZtF4tRQ28moIbtuXO7sCxac8OpiDSFgJrLOby2eyw24nchu6aZL7
ZVhCb71CeAmVrnRWHoma0HplPvxBGjR97qPfb7Bpsl42A1F4bk/didb3xIRzQvtt
v6S1xQy6voytuBYzy/d1y6yss0aPeF7MZ4/W/953hspriVcd+D0kvHP8JyzG0AYo
tMmIUdDV18k/v/21IFynhvxXcoSu3+BF2tAcbE3tkSCu5YSfH31EnJESVKAszlxW
yCRgjpwN6cgcvlun4OHrRU+E2gnYVbY//Byt6zWUIEBt3QWhWALPhIHuHrLep4EZ
gnBIadvjYZ5zL5lyUo+tQd+QLBtvkUV14WdxQXfGFbqokmZXjGlrH7+YTjuZm/2p
U3Tft0oXVoT2ZSICejyCHEk/eYP1r4cEH5xupU/LPmnkIcxlQevQDbjek9+c23BU
FRGQMvoYApPk2xcrfBau9ailDzUedB9gw7otHdP5+pCz599a3iI=
=GStr
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
