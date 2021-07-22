Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0583D203A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 10:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhGVIRS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 04:17:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:58324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230330AbhGVIRR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Jul 2021 04:17:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99CD661357;
        Thu, 22 Jul 2021 08:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626944272;
        bh=tc8sPFMKwT3zte/xbHzAu5PklQhZyrdcie7BAgiVsRE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SR1r2DoomEKMfNGrsXhzKMpg6lUU+J22URA4BqZtVrI3k4JNNL2N167GlyeF61PMW
         vRiWDT3CXPPD44U0qrgRsEbyRJU4TjqgTm0J3WqwldTCgWhUjsU+G62ehmf80FPi/Y
         dec0NiAluE/b4dCnl77tmwF2Sb1QvJeUQARkscXjBAg+MQr8rHOtnZ5WD9imi+Zl2r
         X5Gu8KtM0Lq7tMw7xRwWegU76+h0zFMD4hwdw6YmarBGFX2vA4oZfcmT/Yh/3Pf6z1
         rmIr1Y4cwgaZpdPzmqhQmjTIa1+/VQHt1s+2Dndif9vkvAFf62hccbPyamK8UGniRt
         +b3WkQy60LG4w==
Date:   Thu, 22 Jul 2021 10:57:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/6] staging: atomisp: Replace open-coded
 i2c_acpi_find_client_by_adev()
Message-ID: <20210722105744.4a94d58d@coco.lan>
In-Reply-To: <20210526124322.48915-2-andriy.shevchenko@linux.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
        <20210526124322.48915-2-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Em Wed, 26 May 2021 15:43:18 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> gmin_i2c_dev_exists() is using open-coded variant of
> i2c_acpi_find_client_by_adev(). Replace it with a corresponding call.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

At least on the top of v5.14-rc1, this patch causes a compilation
issue:

	drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c: In function =E2=
=80=98gmin_i2c_dev_exists=E2=80=99:
	drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:386:19: error: i=
mplicit declaration of function =E2=80=98i2c_acpi_find_client_by_adev=E2=80=
=99; did you mean =E2=80=98i2c_acpi_find_adapter_by_handle=E2=80=99? [-Werr=
or=3Dimplicit-function-declaration]
	  386 |         *client =3D i2c_acpi_find_client_by_adev(adev);
	      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
	      |                   i2c_acpi_find_adapter_by_handle
	drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c:386:17: warning:=
 assignment to =E2=80=98struct i2c_client *=E2=80=99 from =E2=80=98int=E2=
=80=99 makes pointer from integer without a cast [-Wint-conversion]
	  386 |         *client =3D i2c_acpi_find_client_by_adev(adev);
	      |                 ^

The reason is because such function is static:

	$ git grep i2c_acpi_find_client_by_adev
	drivers/i2c/i2c-core-acpi.c:static struct i2c_client *i2c_acpi_find_client=
_by_adev(struct acpi_device *adev)

IMO, a patch like that should be applied at the same tree as a patch
dropping "static" from drivers/i2c/i2c-core-acpi.c. If you want to do
so, feel free to add:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  .../staging/media/atomisp/pci/atomisp_gmin_platform.c    | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/=
drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 135994d44802..a1064d1a3d6b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -378,19 +378,14 @@ static struct i2c_client *gmin_i2c_dev_exists(struc=
t device *dev, char *name,
>  					      struct i2c_client **client)
>  {
>  	struct acpi_device *adev;
> -	struct device *d;
> =20
>  	adev =3D acpi_dev_get_first_match_dev(name, NULL, -1);
>  	if (!adev)
>  		return NULL;
> =20
> -	d =3D bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
> -	acpi_dev_put(adev);
> -	if (!d)
> -		return NULL;
> +	*client =3D i2c_acpi_find_client_by_adev(adev);
> =20
> -	*client =3D i2c_verify_client(d);
> -	put_device(d);
> +	acpi_dev_put(adev);
> =20
>  	dev_dbg(dev, "found '%s' at address 0x%02x, adapter %d\n",
>  		(*client)->name, (*client)->addr, (*client)->adapter->nr);



Thanks,
Mauro
