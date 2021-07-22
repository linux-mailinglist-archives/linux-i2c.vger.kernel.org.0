Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C399C3D26CB
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Jul 2021 17:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbhGVOy6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Jul 2021 10:54:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:37974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232754AbhGVOy6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 22 Jul 2021 10:54:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B4CC6052B;
        Thu, 22 Jul 2021 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626968132;
        bh=JkBVrKoKv3hGTuuYXwD37fKvGgt44OKz27uuFeV0da8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vv3aGZGZTJ+L3r0dDzcvVVe21DJOzbthP1bEG82ssciZzP+aY9jAslFoX9y0RaKm7
         6wcnceAHtzK0tXRk2sCQEMX60Na2ygOYCpfmxupaJax3S8iFu7PxjbewBwjw0Rj/lv
         s0qictjNvNdt+Hxs+i9DVVgueqNF2UkocAQs6lfAMgFFN6oS5Sxrti1QTg5gLX0ia0
         XNjl4+xUTrUpEhuCMmqJjFnk64DondHiTQaO6lNXPFnEZPSNbyLic9qDm3CoORwJv2
         ZzrrvXMOr+RF+9jQ3+UKrmaf2RsH+UTd2MVpYlKNlNI/lxzod5PfBANN+URv2UudOD
         eyM7o1n0KzXxw==
Date:   Thu, 22 Jul 2021 17:35:29 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Jie Deng <jie.deng@intel.com>
Cc:     linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        viresh.kumar@linaro.org, stefanha@redhat.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v14] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YPmQQelKfa4J7zdA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Jie Deng <jie.deng@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com,
        yu1.wang@intel.com, shuo.a.liu@intel.com, conghui.chen@intel.com,
        viresh.kumar@linaro.org, stefanha@redhat.com,
        gregkh@linuxfoundation.org
References: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="otDcexng5nFQdyBJ"
Content-Disposition: inline
In-Reply-To: <984ebecaf697058eb73389ed14ead9dd6d38fb53.1625796246.git.jie.deng@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--otDcexng5nFQdyBJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

so only minor stuff left from my side.

> @@ -21,6 +21,17 @@ config I2C_ALI1535
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-ali1535.
> =20
> +config I2C_VIRTIO
> +	tristate "Virtio I2C Adapter"
> +	select VIRTIO
> +	help
> +	  If you say yes to this option, support will be included for the virtio
> +	  I2C adapter driver. The hardware can be emulated by any device model
> +	  software according to the virtio protocol.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called i2c-virtio.
> +
>  config I2C_ALI1563
>  	tristate "ALI 1563"
>  	depends on PCI

The sorting is not good. I think your entry should go to the bottom of
the Kconfig file.

> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 69e9963..9843756 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -147,4 +147,7 @@ obj-$(CONFIG_I2C_XGENE_SLIMPRO) +=3D i2c-xgene-slimpr=
o.o
>  obj-$(CONFIG_SCx200_ACB)	+=3D scx200_acb.o
>  obj-$(CONFIG_I2C_FSI)		+=3D i2c-fsi.o
> =20
> +# VIRTIO I2C host controller driver

This comment can go, I'd say.

> +obj-$(CONFIG_I2C_VIRTIO)	+=3D i2c-virtio.o
> +
>  ccflags-$(CONFIG_I2C_DEBUG_BUS) :=3D -DDEBUG


> +		/*
> +		 * We don't support 0 length messages and so masked out
> +		 * I2C_FUNC_SMBUS_QUICK in virtio_i2c_func().
> +		 */
> +		if (!msgs[i].len)
> +			break;

I recommend using struct i2c_adapter_quirks with I2C_AQ_NO_ZERO_LEN. But
let's wait first if zero length are possible or not.

Also, checkpatch:

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?

So, is one of you interested in maintaining this driver?

All the best,

   Wolfram


--otDcexng5nFQdyBJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmD5kEEACgkQFA3kzBSg
KbbhXxAApwJ5WpX+cqUoQAt42qaLOBNMYLSFQiV9zL4JFbDq19zFWx/5cSEEXXlG
lv3dRJp6an2ne+UBqrNAhcMhzWrlaypD7UKWrCMi100i3litwh3UtfwOYPXqNt1F
xJJ/z1YvukRobsrg/sZnFREFgI0jgQMzeDdIEnG+K0Y60LHGp3pTuvgu4DP97BbT
Iz4nMwlmFxPghn3cjTKFJnHrTrMuK9qVD/BtIcP7+uzkoynfAN5zPJW0U8J1k0HO
xlSEAny9exJJWboeurW+RAvDCJkek5e6whq7qkqzp3GoOCmt6TGCjZY/Uzrwt82h
LirIvqXWzYFqTD2K7BDwRO8wCXcJsTwy4zZJW26SUXyMkNhJJiTEV1fOvKgUIQti
djXFpkqKKcRbwHFbWqfGnotR0ku8iMjw4TJQoEipc2yKT0mKS4cLZ/WVKKZ2byDl
XvvhyTs3lxN5dFXb2/vmrff2MfCRzJ7jt8BNrS5e4IWpcb1CBcQbU4Xj7rv/tfNh
2qsXQx5fTKRBvAAqHmuJk9cZaQj9jM5DRvSdTH5fXRiZwEPOSrBnDkSpli2sUfJ5
VG2dS+JNZQvS4t0WbqhysIVZ16Y9ICpSLuv/7LFz+0ueyk7XWeSewLvyGdIajLjN
6n6fIGKtOlogpgY6dgdbzE3O8btFGvDOlnfYxMEjWpYtxcAAKYI=
=O1Lp
-----END PGP SIGNATURE-----

--otDcexng5nFQdyBJ--
