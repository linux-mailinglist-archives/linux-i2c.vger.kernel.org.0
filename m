Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7995D611207
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 14:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiJ1M5O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 08:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbiJ1M5N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 08:57:13 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C4A1C2EB9;
        Fri, 28 Oct 2022 05:57:11 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p8so8102102lfu.11;
        Fri, 28 Oct 2022 05:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlgtcNEkHLSQxefrkLYDw2NI8A0VX2rYADSe4gp+IWI=;
        b=D6FMWgHVGm2MYqfbdj0u7uO5JT3gly5wkvLMYoc6KhZFvUtbMnX5WjaXdFUzqOaXoU
         YuB+Px71m/4/RzDdCnm6a8ZQXgiyQXYXkqkWZFlXnF5CqOlxR3Zja3XrjiF8B4S5py39
         b10lnlEbDnaT4cA776AOOUkpzOjD8s6sghfU2bsnLi7+L3WsM78WP6nU7ogn7NxYJ+IS
         YEREx1IauNmb2f0n/5EKjze2Ryq1aCosxgiAmddNq2BnyyLluONUsey51gzP+VWJbOAA
         t/uw93tPxSXBBddWx9foO18esl9c1fXG2ZJgD5P/AKdSSveuSRRXSo9wnZ8pXU6BPJSa
         aW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlgtcNEkHLSQxefrkLYDw2NI8A0VX2rYADSe4gp+IWI=;
        b=aMxoLfo7XpHvRNjHftFYVGetoRcMXY/l99aHvSbpNjojHb+VpztJPDWWNjfMlkr1jK
         pmhiY1P+nrL0Q8PPa5ZX6GgPmk3XOBmdH2TNwgVERFdsy6+nyVSeVKPv62bM8LCE12Nk
         fYlcmELk6mlcBqUYmUwfihka5XDE5SgMA32C/F+De9B6/8Y6OkNAyfIBp9AU1KFltxvM
         zsDN3edrm9D3APWOE7NAfMPndLJ8H5i0ufpY5+qSkk6rpn1jLpTj7AStiH2dP5cz64v+
         OUxinmzhZyzSfI+OPhL6HmYdPFELqtVvt4SrEI7lElnoOs7AUroEqx34g8yyv3f2lWS3
         NCPA==
X-Gm-Message-State: ACrzQf2dyZ7lY9WAmnCuWHcB7uj/TiqLPmUXtIA9mGC+T8rGF5JNLNzu
        POEzhVbZbaTZOai9yZ36tsaISiqgjYw=
X-Google-Smtp-Source: AMsMyM5YC5NBUNMVLvqpGOhKxFPABiSIffwZ0JUtOGTuxf/IrQHJu+GkhJXcz7H9cWgYw2s9wH8WPw==
X-Received: by 2002:a17:907:3f04:b0:741:4bf4:fe42 with SMTP id hq4-20020a1709073f0400b007414bf4fe42mr47994915ejc.664.1666961818654;
        Fri, 28 Oct 2022 05:56:58 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id oz13-20020a170906cd0d00b007ad2da5668csm2134066ejb.112.2022.10.28.05.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 05:56:57 -0700 (PDT)
Date:   Fri, 28 Oct 2022 14:56:56 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Wayne Chang <waynec@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, treding@nvidia.com,
        jonathanh@nvidia.com, heikki.krogerus@linux.intel.com,
        ajayg@nvidia.com, kishon@ti.com, vkoul@kernel.org,
        p.zabel@pengutronix.de, balbi@kernel.org, mathias.nyman@intel.com,
        jckuo@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        singhanc@nvidia.com, linux-i2c@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 09/11] phy: tegra: xusb: Add Tegra234 support
Message-ID: <Y1vRmGss43zEcN/I@orome>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-10-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="EpD9Cm4/iJG55pEf"
Content-Disposition: inline
In-Reply-To: <20221024074128.1113554-10-waynec@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EpD9Cm4/iJG55pEf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2022 at 03:41:26PM +0800, Wayne Chang wrote:
> From: Sing-Han Chen <singhanc@nvidia.com>
>=20
> Add support for the XUSB pad controller found on Tegra234 SoCs. It is
> mostly similar to the same IP found on Tegra194, because most of
> the Tegra234 XUSB PADCTL registers definition and programming sequence
> are the same as Tegra194, Tegra234 XUSB PADCTL can share the same
> driver with Tegra186 and Tegra194 XUSB PADCTL.
>=20
> Introduce a new feature, USB2 HW tracking, for Tegra234.
> The feature is to enable HW periodical PAD tracking which measure
> and capture the electric parameters of USB2.0 PAD.
>=20
> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
> Co-developed-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  drivers/phy/tegra/Makefile        |  1 +
>  drivers/phy/tegra/xusb-tegra186.c | 65 +++++++++++++++++++++++++++++--
>  drivers/phy/tegra/xusb.c          |  6 +++
>  drivers/phy/tegra/xusb.h          | 23 +++++++++++
>  4 files changed, 92 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
> index 89b84067cb4c..eeeea72de117 100644
> --- a/drivers/phy/tegra/Makefile
> +++ b/drivers/phy/tegra/Makefile
> @@ -7,4 +7,5 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) +=3D xusb-teg=
ra124.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D xusb-tegra210.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D xusb-tegra186.o
>  phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D xusb-tegra186.o
> +phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D xusb-tegra186.o
>  obj-$(CONFIG_PHY_TEGRA194_P2U) +=3D phy-tegra194-p2u.o
> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index f121b4ffbbfd..cc02cea65a21 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -89,6 +89,11 @@
>  #define  USB2_TRK_START_TIMER(x)		(((x) & 0x7f) << 12)
>  #define  USB2_TRK_DONE_RESET_TIMER(x)		(((x) & 0x7f) << 19)
>  #define  USB2_PD_TRK				BIT(26)
> +#define  USB2_TRK_COMPLETED			BIT(31)
> +
> +#define XUSB_PADCTL_USB2_BIAS_PAD_CTL2		0x28c
> +#define  USB2_TRK_HW_MODE			BIT(0)
> +#define  CYA_TRK_CODE_UPDATE_ON_IDLE		BIT(31)
> =20
>  #define XUSB_PADCTL_HSIC_PADX_CTL0(x)		(0x300 + (x) * 0x20)
>  #define  HSIC_PD_TX_DATA0			BIT(1)
> @@ -609,9 +614,32 @@ static void tegra186_utmi_bias_pad_power_on(struct t=
egra_xusb_padctl *padctl)
>  	value &=3D ~USB2_PD_TRK;
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> =20
> -	udelay(100);
> +	if (padctl->soc->poll_trk_completed) {
> +		err =3D padctl_readl_poll(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1,
> +					USB2_TRK_COMPLETED, USB2_TRK_COMPLETED, 100);
> +		if (err) {
> +			/* The failure with polling on trk complete will not
> +			 * cause the failure of powering on the bias pad.
> +			 */
> +			dev_warn(dev, "failed to poll USB2 trk completed: %d\n",
> +				err);
> +		}
> =20
> -	clk_disable_unprepare(priv->usb2_trk_clk);
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +		value |=3D USB2_TRK_COMPLETED;
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> +	} else {
> +		udelay(100);
> +	}
> +
> +	if (padctl->soc->trk_hw_mode) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +		value |=3D USB2_TRK_HW_MODE;
> +		value &=3D ~CYA_TRK_CODE_UPDATE_ON_IDLE;
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +	} else {
> +		clk_disable_unprepare(priv->usb2_trk_clk);
> +	}
> =20
>  	mutex_unlock(&padctl->lock);
>  }
> @@ -637,6 +665,13 @@ static void tegra186_utmi_bias_pad_power_off(struct =
tegra_xusb_padctl *padctl)
>  	value |=3D USB2_PD_TRK;
>  	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
> =20
> +	if (padctl->soc->trk_hw_mode) {
> +		value =3D padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +		value &=3D ~USB2_TRK_HW_MODE;
> +		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
> +		clk_disable_unprepare(priv->usb2_trk_clk);
> +	}
> +
>  	mutex_unlock(&padctl->lock);
>  }
> =20
> @@ -1560,7 +1595,8 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_pa=
dctl_soc =3D {
>  EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
>  #endif
> =20
> -#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
> +	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
>  static const char * const tegra194_xusb_padctl_supply_names[] =3D {
>  	"avdd-usb",
>  	"vclamp-usb",
> @@ -1616,8 +1652,31 @@ const struct tegra_xusb_padctl_soc tegra194_xusb_p=
adctl_soc =3D {
>  	.supply_names =3D tegra194_xusb_padctl_supply_names,
>  	.num_supplies =3D ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
>  	.supports_gen2 =3D true,
> +	.poll_trk_completed =3D true,
>  };
>  EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
> +
> +const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc =3D {
> +	.num_pads =3D ARRAY_SIZE(tegra194_pads),
> +	.pads =3D tegra194_pads,
> +	.ports =3D {
> +		.usb2 =3D {
> +			.ops =3D &tegra186_usb2_port_ops,
> +			.count =3D 4,
> +		},
> +		.usb3 =3D {
> +			.ops =3D &tegra186_usb3_port_ops,
> +			.count =3D 4,
> +		},
> +	},
> +	.ops =3D &tegra186_xusb_padctl_ops,
> +	.supply_names =3D tegra194_xusb_padctl_supply_names,
> +	.num_supplies =3D ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
> +	.supports_gen2 =3D true,
> +	.poll_trk_completed =3D true,
> +	.trk_hw_mode =3D true,
> +};
> +EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);

I'm beginning to wonder if we perhaps went a bit overboard with this.
These symbols are used exclusively by drivers/phy/tegra/xusb.c, which
ends up in the same link unit as xusb-tegra186.c, so the export should
not be necessary.

Not necessarily something that needs fixing right now, but certainly
something to circle back to eventually.

>  #endif
> =20
>  MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index 95091876c422..23d179b1a5b5 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -71,6 +71,12 @@ static const struct of_device_id tegra_xusb_padctl_of_=
match[] =3D {
>  		.compatible =3D "nvidia,tegra194-xusb-padctl",
>  		.data =3D &tegra194_xusb_padctl_soc,
>  	},
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_234_SOC)
> +	{
> +		.compatible =3D "nvidia,tegra234-xusb-padctl",
> +		.data =3D &tegra234_xusb_padctl_soc,
> +	},
>  #endif
>  	{ }
>  };
> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
> index 8cfbbdbd6e0c..ec0b5b023ad1 100644
> --- a/drivers/phy/tegra/xusb.h
> +++ b/drivers/phy/tegra/xusb.h
> @@ -8,6 +8,7 @@
>  #define __PHY_TEGRA_XUSB_H
> =20
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/mutex.h>
>  #include <linux/workqueue.h>
> =20
> @@ -433,6 +434,8 @@ struct tegra_xusb_padctl_soc {
>  	unsigned int num_supplies;
>  	bool supports_gen2;
>  	bool need_fake_usb3_port;
> +	bool poll_trk_completed;
> +	bool trk_hw_mode;
>  };
> =20
>  struct tegra_xusb_padctl {
> @@ -475,6 +478,23 @@ static inline u32 padctl_readl(struct tegra_xusb_pad=
ctl *padctl,
>  	return value;
>  }
> =20
> +static inline u32 padctl_readl_poll(struct tegra_xusb_padctl *padctl,
> +	unsigned long offset, u32 val, u32 mask, int us)
> +{
> +	u32 regval;
> +	int err;
> +
> +	err =3D readl_poll_timeout_atomic(padctl->regs + offset, regval,
> +					 (regval & mask) =3D=3D val, 1, us);

Do we really need the atomic variant here? The function that calls this
already uses a mutex for protection, so it can already sleep anyway.

Also, do we really need the helper here? We use this exactly once and
this doesn't make the invocation more readable, either.

Thierry

> +	dev_dbg(padctl->dev, "%08lx poll > %08x\n", offset, regval);
> +	if (err) {
> +		dev_err(padctl->dev, "%08lx poll timeout > %08x\n", offset,
> +			regval);
> +	}
> +
> +	return err;
> +}
> +
>  struct tegra_xusb_lane *tegra_xusb_find_lane(struct tegra_xusb_padctl *p=
adctl,
>  					     const char *name,
>  					     unsigned int index);
> @@ -491,5 +511,8 @@ extern const struct tegra_xusb_padctl_soc tegra186_xu=
sb_padctl_soc;
>  #if defined(CONFIG_ARCH_TEGRA_194_SOC)
>  extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_234_SOC)
> +extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
> +#endif
> =20
>  #endif /* __PHY_TEGRA_XUSB_H */
> --=20
> 2.25.1
>=20

--EpD9Cm4/iJG55pEf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNb0ZUACgkQ3SOs138+
s6E1aw//crfqY/5h5onKaE4z03lnf4wf7h/85cKbxHTyLFhR98XdmCX22+FJmwbl
lXrf5GVPv/GUtdTnUdVs/7wErNgwGpkAPA7w3sIw6e/U1RpGqeLPgU9DB24Kcl6V
rYa84SwrFtKeVuIEK9jYWUz1GGBP9VNgqclESvxqxtiS483+/tfT8YqB6hZL0SYh
fqL/Ve6WMSP63YPIDhDRUSSH+UjK8bjbabU0tCPf/bw8nw9Q9/QLv15KCAPhtjAv
P4UocDKIC5znZWokFn54kaxpBjla6cugK8mym7NISF+WsCptwfnezMs0XGaTlwhN
0hyiqspCaOKJnZxVD7lEKtIiFZIplY39xQypL2O8KfiKAPL1waPKyypgrUNRM5pe
oUKOA7FbsZq0fDn2gi6jrIX2jQXPuj8xY5/PWWq5J6ZR1c3KhfSm2s3X6Fu0Amfg
ielsTghZiaNa8oysxCmh1sLnwwyHx3cfLQjghl8mzW+uqgnDiK3z5WXM2qKmSF6d
oo/d9srqpcISk+GxyxpOMu8dvxeUv62dVXdtlP3S5ixle+uBD1hf1+dM7QLBbpxU
OETl2JIw69eqPMJTqLwHsm3t915GkINmSDUk9+HrObSNIO6cuSI+znAprGo+Jvyi
Jyfa8SFhriQu2MhaRikXVthS7gp33gkqjAyW3qAp/lDcfFFKXtY=
=W2tL
-----END PGP SIGNATURE-----

--EpD9Cm4/iJG55pEf--
