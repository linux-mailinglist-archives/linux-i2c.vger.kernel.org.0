Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F65370A973
	for <lists+linux-i2c@lfdr.de>; Sat, 20 May 2023 19:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjETRYu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 May 2023 13:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjETRYt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 May 2023 13:24:49 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FD4114;
        Sat, 20 May 2023 10:24:47 -0700 (PDT)
Received: from mercury (unknown [185.209.196.239])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8126C6603276;
        Sat, 20 May 2023 18:24:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684603486;
        bh=oxTRyxsphn4GR87OpmItJ3OxVBS5GUkh8fmJiQoHf6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RnrMOoxknAwrog0d8jseXb3KA2e6BxNsrN/VvwV0FtweLgpcikryhUVHZQhuo8iP6
         o0HVe17qvr9BS+9N6P2Jz6jezpmi+VfKIIQpuwJPWWSIk0mt8TxofOQnn0jYti0iun
         h0DI8tgEeet8U+jDEbmLrEjw5D0srNVwYu9+P2zi92UQjoyMEK/92aAi5QkFKPhiAh
         cabGt4lfiBJmcICQ5swWsvv9dMrfWWSJKP+3DPA9PxadbTLPXFNXYlEVIQJfbto2pK
         pbecbQf9TnQYxIiauuYaGX+He/KshTJ1p1pp5Mz05dyjACzQ3nEdCVH0jFJaNg/ew/
         KMtWI56/PU/qg==
Received: by mercury (Postfix, from userid 1000)
        id 711B310628E0; Sat, 20 May 2023 19:24:43 +0200 (CEST)
Date:   Sat, 20 May 2023 19:24:43 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     heikki.krogerus@linux.intel.com, ajayg@nvidia.com,
        andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Evan.Quan@amd.com, Lijo.Lazar@amd.com,
        Sanket.Goswami@amd.com
Subject: Re: [PATCH v2] usb: typec: ucsi: Mark dGPUs as DEVICE scope
Message-ID: <20230520172443.ovowis2qsufd2ely@mercury.elektranox.org>
References: <20230518161150.92959-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tfuvqcbmuuomgpx6"
Content-Disposition: inline
In-Reply-To: <20230518161150.92959-1-mario.limonciello@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--tfuvqcbmuuomgpx6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 18, 2023 at 11:11:50AM -0500, Mario Limonciello wrote:
> power_supply_is_system_supplied() checks whether any power
> supplies are present that aren't batteries to decide whether
> the system is running on DC or AC.  Downstream drivers use
> this to make performance decisions.
>=20
> Navi dGPUs include an UCSI function that has been exported
> since commit 17631e8ca2d3 ("i2c: designware: Add driver
> support for AMD NAVI GPU").
>=20
> This UCSI function registers a power supply since commit
> 992a60ed0d5e ("usb: typec: ucsi: register with power_supply class")
> but this is not a system power supply.
>=20
> As the power supply for a dGPU is only for powering devices connected
> to dGPU, create a device property to indicate that the UCSI endpoint
> is only for the scope of `POWER_SUPPLY_SCOPE_DEVICE`.
>=20
> Link: https://lore.kernel.org/lkml/20230516182541.5836-2-mario.limonciell=
o@amd.com/
> Reviewed-by: Evan Quan <evan.quan@amd.com>
> Tested-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> v1->v2:
>  * Drop patch 1, merged into a maintainers tree
>  * Fix title
>  * Add tags
>  * Fix terminators
> ---
>  drivers/i2c/busses/i2c-designware-pcidrv.c | 13 ++++++++++++-
>  drivers/i2c/busses/i2c-nvidia-gpu.c        |  3 +++
>  drivers/usb/typec/ucsi/psy.c               | 14 ++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/bus=
ses/i2c-designware-pcidrv.c
> index 782fe1ef3ca1..61d7a27aa070 100644
> --- a/drivers/i2c/busses/i2c-designware-pcidrv.c
> +++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
> @@ -20,6 +20,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/power_supply.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> =20
> @@ -234,6 +235,16 @@ static const struct dev_pm_ops i2c_dw_pm_ops =3D {
>  	SET_RUNTIME_PM_OPS(i2c_dw_pci_runtime_suspend, i2c_dw_pci_runtime_resum=
e, NULL)
>  };
> =20
> +static const struct property_entry dgpu_properties[] =3D {
> +	/* USB-C doesn't power the system */
> +	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
> +	{}
> +};
> +
> +static const struct software_node dgpu_node =3D {
> +	.properties =3D dgpu_properties,
> +};
> +
>  static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  			    const struct pci_device_id *id)
>  {
> @@ -325,7 +336,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
>  	}
> =20
>  	if ((dev->flags & MODEL_MASK) =3D=3D MODEL_AMD_NAVI_GPU) {
> -		dev->slave =3D i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, NULL);
> +		dev->slave =3D i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, &dgpu_node);
>  		if (IS_ERR(dev->slave))
>  			return dev_err_probe(dev->dev, PTR_ERR(dev->slave),
>  					     "register UCSI failed\n");
> diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c=
-nvidia-gpu.c
> index a8b99e7f6262..26622d24bb1b 100644
> --- a/drivers/i2c/busses/i2c-nvidia-gpu.c
> +++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
> @@ -14,6 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/power_supply.h>
> =20
>  #include <asm/unaligned.h>
> =20
> @@ -261,6 +262,8 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
>  static const struct property_entry ccgx_props[] =3D {
>  	/* Use FW built for NVIDIA GPU only */
>  	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
> +	/* USB-C doesn't power the system */
> +	PROPERTY_ENTRY_U8("scope", POWER_SUPPLY_SCOPE_DEVICE),
>  	{ }
>  };
> =20
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index 56bf56517f75..384b42267f1f 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -27,8 +27,20 @@ static enum power_supply_property ucsi_psy_props[] =3D=
 {
>  	POWER_SUPPLY_PROP_VOLTAGE_NOW,
>  	POWER_SUPPLY_PROP_CURRENT_MAX,
>  	POWER_SUPPLY_PROP_CURRENT_NOW,
> +	POWER_SUPPLY_PROP_SCOPE,
>  };
> =20
> +static int ucsi_psy_get_scope(struct ucsi_connector *con,
> +			      union power_supply_propval *val)
> +{
> +	u8 scope =3D POWER_SUPPLY_SCOPE_UNKNOWN;
> +	struct device *dev =3D con->ucsi->dev;
> +
> +	device_property_read_u8(dev, "scope", &scope);
> +	val->intval =3D scope;
> +	return 0;
> +}
> +
>  static int ucsi_psy_get_online(struct ucsi_connector *con,
>  			       union power_supply_propval *val)
>  {
> @@ -194,6 +206,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
>  		return ucsi_psy_get_current_max(con, val);
>  	case POWER_SUPPLY_PROP_CURRENT_NOW:
>  		return ucsi_psy_get_current_now(con, val);
> +	case POWER_SUPPLY_PROP_SCOPE:
> +		return ucsi_psy_get_scope(con, val);
>  	default:
>  		return -EINVAL;
>  	}
> --=20
> 2.34.1
>=20

--tfuvqcbmuuomgpx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmRpAlsACgkQ2O7X88g7
+pqd3g/+M0fo1hmqhIArUZisa8pBD0qxUC7QszKAGFb/5KZrrhYVBTN0BZirs+0Q
IOJobvzAH82DUuC5jOT2gmbhm9j29mcp27mnqgeHlG6KC7KHwzlSXQedNZHFEr8o
Lg1rLLVUruL0/36jJCX/bAVEjKj+rlB1mc4oB6J0pKmOaCpOtXYuU/2SVDdS/pSz
X9rEj1AutnjLcuosGjJWBTbbhCJRzAlu5RX9BtAuGChdtj2OAE5pu0cYrM5AGvkr
XZyD3DexBT/dJCTHYgZUiGmFr4QsVCITnxxteFUf5hQtips3yLmT+2DTFEpUCVUD
ISkHAFe1o3Nc5BBoFPbB72aaSXdvYDvvBB02v8TkYppNgCfV8ZgXtOeCvE8yJd5O
hNqZrjsIn1vNRvNDl2beJQscWs6RWWGJ7mrBzesA7F+V7VPmNFrVBwgWh1zsgsi0
yYlfu2bDSU3XzOu+p77T43aQQ7KUP34kMDQTo0m/v4R/d915vGHrIPOWYI6KNGOD
I+Pi3hTnaXRpNdhGOtG8W66SKj9uEfIXsgnicVzLI7l7KQ3pH7LpFUvXuMZGdPqv
AAQTZuTtrGG+sVoG8MNvIPhNcj/qkIVPt0h0/Kdr4vckPkGnguMcgw1tB2kFxkeV
zPVyj6BJiUSaCuxpzoCrxTx81ZseevDWVArHRmQCkknR44RAsTs=
=wtSR
-----END PGP SIGNATURE-----

--tfuvqcbmuuomgpx6--
