Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D33A234730
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 15:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgGaNtx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 09:49:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:54456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727851AbgGaNtx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jul 2020 09:49:53 -0400
Received: from localhost (router.4pisysteme.de [80.79.225.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0694C208E4;
        Fri, 31 Jul 2020 13:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596203392;
        bh=IXwFqQHjP2sDj/CKwA+w73Rr9wgrcjVyVnpFMoC7OjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UBriO0JOczpijNoQcc6SIWS7AffbF+7ldQJy+zYnulcMLP8iwwdjPVVMcChn/guKy
         F0oJ95Rwx8ArimT40TgjCIAGGNEf9lj8jsaCOBs1UDCZRbrDoSU9W4peFokXG1XMDw
         0jsXfWF8aCKUM9PYHIfbiZ/10bvc4F0YjrtZyaYA=
Date:   Fri, 31 Jul 2020 15:49:50 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Pu Wen <puwen@hygon.cn>
Cc:     rjw@rjwysocki.net, lenb@kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: Add device HID for Hygon I2C controller
Message-ID: <20200731134950.GB1679@kunai>
References: <20200731084845.24459-1-puwen@hygon.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline
In-Reply-To: <20200731084845.24459-1-puwen@hygon.cn>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2020 at 04:48:45PM +0800, Pu Wen wrote:
> Add device HID HYGO0010 to match the Hygon ACPI Vendor ID (HYGO) that
> was registered in http://www.uefi.org/acpi_id_list, and the I2C
> controller on Hygon paltform will use the HID.
>=20
> Signed-off-by: Pu Wen <puwen@hygon.cn>

I can take this via I2C, but I'd need an ack from Rafael or Len.

Or it can go via ACPI, fine with me

Acked-by: Wolfram Sang <wsa@kernel.org>

> ---
>  drivers/acpi/acpi_apd.c                     | 1 +
>  drivers/i2c/busses/i2c-designware-platdrv.c | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index ba2612e9a0eb..f24f6d3f1fa5 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -240,6 +240,7 @@ static const struct acpi_device_id acpi_apd_device_id=
s[] =3D {
>  	{ "AMDI0020", APD_ADDR(cz_uart_desc) },
>  	{ "AMD0030", },
>  	{ "AMD0040", APD_ADDR(st_misc_desc)},
> +	{ "HYGO0010", APD_ADDR(wt_i2c_desc) },
>  #endif
>  #ifdef CONFIG_ARM64
>  	{ "APMC0D0F", APD_ADDR(xgene_i2c_desc) },
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/bu=
sses/i2c-designware-platdrv.c
> index a71bc58fc03c..0dfeb2d11603 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -55,6 +55,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] =
=3D {
>  	{ "HISI02A1", 0 },
>  	{ "HISI02A2", 0 },
>  	{ "HISI02A3", 0 },
> +	{ "HYGO0010", ACCESS_INTR_MASK },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
> --=20
> 2.23.0
>=20

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8kIX4ACgkQFA3kzBSg
Kbapvg//XojrXKWxAnwxZ4yM08TGa5ZO4BFLsrF2TAc/GlLtSahmH5JO7t9fkYOB
jn5HbtxIGEqYEP6uQLVMgT+WGdAdCu1kXI9BbzZNYG2Gm7J8EI7ui1CWrdXkXm8/
R1yQ/AhszXe1BUm9Y3UWaioqpyTqN8bB5fgsgWTFEjuxneLNoA0T+kduXPiRsyTA
nUqL/7rl/8BWCvpVd26aPGIUgQFXftFBXhjMBzyPRrBEZUcDITAdhYG5LoATQjz1
O6kcRszY3wcNFtxiC84oI4KbMErnExHSvcugI7x7jIAFGyEeQBUubdRychckMLEN
Oma3uXCDWt/AfkUc67fWAF75sToFV830StjoKmT+pqMQiLI7c8Nv4FjHdz/p/Quv
UyrYhh2hynaq0+4UQATEqvCMulGdw5tchPhOVIMkNFGyw24iQkTh7guFkmA5jAwB
/i7sPVt3AzyJ/u/JyG/aFPkHa3xAVD4RZd0EPwMNisL+tBnUQlTedaMkUMPuBEFU
5/OymFfNhKYMjTAn/EHsVJtEZir3dT9bQyeCPyulOpo0SHHlBY87CbY0b74wMRNj
m5J+TCn0xtiiILXe1+p6iwbj6vdALpsbQcLHx96JQxy9gfgUMmlx8MNZm4V3pucg
KtlfyUfaUkw+/eSbCPm0U3iQWSVZTLCR7wscP6dlje+98+tz8Q8=
=gqTO
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
