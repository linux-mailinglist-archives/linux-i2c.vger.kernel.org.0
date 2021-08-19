Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077013F1136
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Aug 2021 05:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbhHSDHb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Aug 2021 23:07:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39431 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235792AbhHSDHa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Aug 2021 23:07:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GqqRw47HGz9sVw;
        Thu, 19 Aug 2021 13:06:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629342413;
        bh=3CY+GC+/4FbWVWTR9SwmZRjFqyi6hW0w0sxX9wtxZ2g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EcY9FQD9xHkLJzKWddIICTtnVSADJTSBGCHqSZG1/ciVaw3IESCfGLzJ3hWvsbn5t
         usgGuEZMt8bafYKikvU4NaBej4avIVUMza0iA1lwm5EunCUasopHdW4DK6iztlEhKF
         VhsRR3NIC5Gsfh0LhSoPyKBHAaLu35BUjFF7SkDYHa3PmHOrIAx8my7cBz3Z/REO7B
         xrSmWfsM9M/o2dI1mgcTJzMAPZtThEOYjZJCIrgg7UkvZW6KztZxLtBlK7etSgHb9+
         OghhDLR4sHpUSEzkilJUuYJyrsCbQsJqLvKr46vygycM5JgPcuvl3fiDOmbYsnH9Tt
         e782oNJ34kwEg==
Date:   Thu, 19 Aug 2021 13:06:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, wsa@kernel.org,
        viresh.kumar@linaro.org, conghui.chen@intel.com
Subject: Re: [PATCH] i2c: virtio: Fix the compiler warning when CONFIG_ACPI
 is not set
Message-ID: <20210819130651.73945bcc@canb.auug.org.au>
In-Reply-To: <4309f869890e70810f2c40a8d60495240e318303.1629333590.git.jie.deng@intel.com>
References: <4309f869890e70810f2c40a8d60495240e318303.1629333590.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QJA95UnxUR0M=zAmKUp0atE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--Sig_/QJA95UnxUR0M=zAmKUp0atE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jie,

On Thu, 19 Aug 2021 08:48:41 +0800 Jie Deng <jie.deng@intel.com> wrote:
>
> Fix the compiler warning "drivers/i2c/busses/i2c-virtio.c:208:17:
> warning: unused variable 'pdev' [-Wunused-variable]" when CONFIG_ACPI
> is not set.
>=20
> Fixes: 8fb12751ac78 ("i2c: virtio: add a virtio i2c frontend driver")

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

> Signed-off-by: Jie Deng <jie.deng@intel.com>
> ---
>  drivers/i2c/busses/i2c-virtio.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-vir=
tio.c
> index d3e60d9..964c601 100644
> --- a/drivers/i2c/busses/i2c-virtio.c
> +++ b/drivers/i2c/busses/i2c-virtio.c
> @@ -205,7 +205,6 @@ static const struct i2c_adapter_quirks virtio_i2c_qui=
rks =3D {
> =20
>  static int virtio_i2c_probe(struct virtio_device *vdev)
>  {
> -	struct device *pdev =3D vdev->dev.parent;
>  	struct virtio_i2c *vi;
>  	int ret;
> =20
> @@ -234,7 +233,7 @@ static int virtio_i2c_probe(struct virtio_device *vde=
v)
>  	 * Setup ACPI node for controlled devices which will be probed through
>  	 * ACPI.
>  	 */
> -	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(pdev));
> +	ACPI_COMPANION_SET(&vi->adap.dev, ACPI_COMPANION(vdev->dev.parent));
> =20
>  	ret =3D i2c_add_adapter(&vi->adap);
>  	if (ret)

Looks good to me.

--=20
Cheers,
Stephen Rothwell

--Sig_/QJA95UnxUR0M=zAmKUp0atE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEdyssACgkQAVBC80lX
0Gxw7Qf/fdlmIsM8h5nIZGD7ptVdJSD3poHXXbuM7T9D+8HSLed0ci4jpDOaO7rW
cC4bcMYOQQHYT3ZgalMDSQmf+nlwWbgFyQ8RPZ6RnssrwOG0CH8LKtU+HBYSBgZu
ETkW58Ny+0dUUXD88MPatdr/1+VnSVEGNnUrQSoegkOBrbU3GNhQ0AnCG8CLh/5D
5chhc6aU2GumqlcsWcl6jhyEVtlzZyqTBe9GaC1sbCamsqHluIc7XV38vz+q1Q4R
nIWedufbBlcPNJWsyDQlzay2A1YaT/7QX+aEOqo/mClRADMJw9kxE7xF1hMecH+f
FcWBGpkAwyhDkZu/xpleFsc1+Pwg+w==
=Sc41
-----END PGP SIGNATURE-----

--Sig_/QJA95UnxUR0M=zAmKUp0atE--
