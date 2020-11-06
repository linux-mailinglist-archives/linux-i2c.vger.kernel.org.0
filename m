Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA93A2A97E6
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Nov 2020 15:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbgKFOxB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Nov 2020 09:53:01 -0500
Received: from www.zeus03.de ([194.117.254.33]:58074 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgKFOxB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Nov 2020 09:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=BEbiNDUmMQ6geahesJjzQpcoku6T
        fF1gHpAWToTeumc=; b=d5PgrrJlcsyl573gCVXzmIaE2HxOHNSSbKCrLmf0benp
        9vvnrQCKK8K8fjIFUc8+vUlegVSm0R1dbbQ40QA0qr8WIylbaU9BwINBR+KR4UNE
        WV4HsAPBHNtmFzHW9fdZZiaE+NgNWmWNesRt1Fiax6kU8tsm7FsOGANQpXPDQKg=
Received: (qmail 982304 invoked from network); 6 Nov 2020 15:52:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 15:52:59 +0100
X-UD-Smtp-Session: l3s3148p1@iHpbXnGzrKIgAwDPXxn+AAvEwmht7CYV
Date:   Fri, 6 Nov 2020 15:52:58 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-next v2 1/6] i2c: mlxbf: Add CONFIG_ACPI to guard
 ACPI function call
Message-ID: <20201106145258.GB1059@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Khalil Blaiech <kblaiech@nvidia.com>, linux-i2c@vger.kernel.org
References: <cover.1604432921.git.kblaiech@nvidia.com>
 <93942ac7e4e5443325d9f024901db5872ec0d16d.1604432921.git.kblaiech@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Content-Disposition: inline
In-Reply-To: <93942ac7e4e5443325d9f024901db5872ec0d16d.1604432921.git.kblaiech@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2020 at 02:54:38PM -0500, Khalil Blaiech wrote:
> The build fails with "implicit declaration of function
> 'acpi_device_uid'" error. Thus, protect ACPI function calls
> from being called when CONFIG_ACPI is disabled.
>=20
> Fixes: b5b5b32081cd206b ("i2c: mlxbf: I2C SMBus driver for Mellanox BlueF=
ield SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> Signed-off-by: Khalil Blaiech <kblaiech@nvidia.com>

Applied to for-current, thanks!


--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl+lY0oACgkQFA3kzBSg
KbYuJBAAgrEjxcTP8Kwaf4iMgMN9lJtaY4DMmybUs2dFyoM2Agwbcnx7MepOYP9i
0ZapmQLqHD0J8fCsepuD7iM8x4qfovCNUZln3wGrmVmZ7KFozH1BIp0+Ib278gGH
/17+2GWfSJlIv/X77sZ90jvtQCUcH+mVKasNnc1dehY5Ty82+TyySEzr65vskn8a
2PDIOGCSMIxS0bBnPdARmnhgLMoce8I+6Vq5qLugWEiClySDKZOMAegbD0UXi7fn
i5o+2uf1Mxlwa/RCTBaVo5EzJnRTlVLZ7mq9n4Pp7RqxXQnN/JTcDUR2bymQambj
diwaLQpyRg7+dtbQd926qN+j3/pJV2ZHtJ6FBeBMPvZixfzYIYQhUz3MelpBW1Rf
/jW4Hqa/VTmZj83nbfXdpyw45FGRfDSsPkKz+jIUztfdxW00cp4zUh6a41VA/ey1
8pXEUY+yZm1tn3UPSpaTL7YwBoZZr1+GrE8dPxf3FXnZd9923LQ1nUgVJOPaCCy6
m8dNBEk6SktFjV0LkrDuoihRV8mu4aOiUuG2BLTG5vpChkfTbb4iPkvNFQo+IpDT
1DOaaHhDYWkJ5f1O3m1basIoPs2cwhg1l8jdVrO4OlcS96u/71e6sBi7opWvrw1b
wf7WjowwSsY8GW/+mdqIZLVo4UPuluqAfmHXQD/LaexnO1/2SL0=
=aNLy
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
