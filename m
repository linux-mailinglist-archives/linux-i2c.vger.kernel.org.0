Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE66611329
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Oct 2022 15:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbiJ1Nlb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Oct 2022 09:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbiJ1NlK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Oct 2022 09:41:10 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16E71275E0;
        Fri, 28 Oct 2022 06:39:37 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id f27so13037681eje.1;
        Fri, 28 Oct 2022 06:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4dibky+EpldM0UVD7pV5+/wckEMIzaOQZHu0CZ9KjA=;
        b=UwU/VcsSY3Jkt0ndF7Zos3fs1bwS776Dl2VOHp5oS/yOtHbAj27YABvJXl1aN8SPE5
         So8DGxLj+3s4B7xZo0jKHOu/EXEUWsuBRO4zbGraogIbnQ6neXhlsxNarfdOF2/wth7G
         2iYTft50V8BTMnUlj5L33RlcA8gePJHKtKAvtTpzc55aO9WAkDVN8F6i6WUenBYWdTSY
         wPcVBfd2mijV0IieJNo0a+5GBJpejUUsl0bHlbDtX6tMm3FKwpAzRceoQyG0PtLtnmPP
         lXnNddJb0DJhdRiKA5GpUL/F7HDX2nnr4gk9vMxcpcL+jbr2f77xERDWIIMXAuO8W3pw
         bbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4dibky+EpldM0UVD7pV5+/wckEMIzaOQZHu0CZ9KjA=;
        b=fa23y31hTqZgc9d2GCdyLq8KoEC0gl+rhc3Ij9fu1kX1WeS95dyykparG4nQadqRsN
         IP2RO9rRKGg/CQn8mDWq5xqnwPlosURv8eftxPlCxRtT5lpiUEveNFqVqfqsoRvyaEos
         JgrgOfzfBxv3FstvDvkjQY+F3G/JHLRZOVRiQ1bYSaRV6o/IueiM1y0h8mJ43FKQUkFb
         on9xM5TNbMIyDHsIBlbkj08B/ZzRKN21nZ56jYx1CC65MgDzosSbVv9dQmB1i8LC/ZeR
         StGH5swCO/nXWt8ZpeL+sfmQa6SBBaBBA38+ZqDql/+AZ8726tJgeMqFmsrsDrJBBVfc
         ER9A==
X-Gm-Message-State: ACrzQf3LLRlHno419vbBEAutrY/ugXexWAURT0Xzszqrv6y860UxlMvT
        g4J/N3pyOYXAksAXMg0o2cI=
X-Google-Smtp-Source: AMsMyM5+zB9ahEZAx00qJKxi1+WbjtiqFBEfC+Ec/FLowk3R+2Ey6JhYEHGKxEH4UhaHmIbh4nUDog==
X-Received: by 2002:a17:906:db0c:b0:77b:7d7d:5805 with SMTP id xj12-20020a170906db0c00b0077b7d7d5805mr48761368ejb.726.1666964375220;
        Fri, 28 Oct 2022 06:39:35 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906538b00b0078ba492db81sm2195402ejo.9.2022.10.28.06.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 06:39:34 -0700 (PDT)
Date:   Fri, 28 Oct 2022 15:39:32 +0200
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
Subject: Re: [PATCH 10/11] usb: host: xhci-tegra: Add Tegra234 XHCI support
Message-ID: <Y1vblCOXOCtX/RTP@orome>
References: <20221024074128.1113554-1-waynec@nvidia.com>
 <20221024074128.1113554-11-waynec@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Mbj1VkMtzmZhLdX9"
Content-Disposition: inline
In-Reply-To: <20221024074128.1113554-11-waynec@nvidia.com>
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


--Mbj1VkMtzmZhLdX9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2022 at 03:41:27PM +0800, Wayne Chang wrote:
> From: Sing-Han Chen <singhanc@nvidia.com>
>=20
> This change adds Tegra234 XUSB host mode controller support.
>=20
> In Tegra234, some of the registers have moved to bar2 space.
> The new soc variable has_bar2 indicates the chip with bar2
> area. This patch adds new reg helper to let the driver reuse
> the same code for those chips with bar2 support.
>=20
> The new soc variables has_ifr indicates the chip with IFR FW
> loading support. IFR registers would be configured in
> MB1, and FW loading will be triggered in MB2.
>=20
> Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
> Co-developed-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> ---
>  drivers/usb/host/xhci-tegra.c | 277 +++++++++++++++++++++++++++++-----
>  1 file changed, 237 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index bdb776553826..86036eeece43 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -44,6 +44,9 @@
>  #define XUSB_CFG_4				0x010
>  #define  XUSB_BASE_ADDR_SHIFT			15
>  #define  XUSB_BASE_ADDR_MASK			0x1ffff
> +#define XUSB_CFG_7				0x01c
> +#define  XUSB_BASE2_ADDR_SHIFT			16
> +#define  XUSB_BASE2_ADDR_MASK			0xffff
>  #define XUSB_CFG_16				0x040
>  #define XUSB_CFG_24				0x060
>  #define XUSB_CFG_AXI_CFG			0x0f8
> @@ -75,6 +78,20 @@
>  #define  MBOX_SMI_INTR_FW_HANG			BIT(1)
>  #define  MBOX_SMI_INTR_EN			BIT(3)
> =20
> +/* BAR2 registers */
> +#define XUSB_BAR2_ARU_MBOX_CMD			0x004
> +#define XUSB_BAR2_ARU_MBOX_DATA_IN		0x008
> +#define XUSB_BAR2_ARU_MBOX_DATA_OUT		0x00c
> +#define XUSB_BAR2_ARU_MBOX_OWNER		0x010
> +#define XUSB_BAR2_ARU_SMI_INTR			0x014
> +#define XUSB_BAR2_ARU_SMI_ARU_FW_SCRATCH_DATA0	0x01c
> +#define XUSB_BAR2_ARU_IFRDMA_CFG0		0x0e0
> +#define XUSB_BAR2_ARU_IFRDMA_CFG1		0x0e4
> +#define XUSB_BAR2_ARU_IFRDMA_STREAMID_FIELD	0x0e8
> +#define XUSB_BAR2_ARU_C11_CSBRANGE		0x9c
> +#define XUSB_BAR2_ARU_FW_SCRATCH		0x1000
> +#define XUSB_BAR2_CSB_BASE_ADDR			0x2000
> +
>  /* IPFS registers */
>  #define IPFS_XUSB_HOST_MSI_BAR_SZ_0		0x0c0
>  #define IPFS_XUSB_HOST_MSI_AXI_BAR_ST_0		0x0c4
> @@ -111,6 +128,9 @@
>  #define  IMFILLRNG1_TAG_HI_SHIFT		16
>  #define XUSB_FALC_IMFILLCTL			0x158
> =20
> +/* CSB ARU  registers */

Weird double-space between "ARU" and "registers".

> +#define XUSB_CSB_ARU_SCRATCH0			0x100100
> +
>  /* MP CSB registers */
>  #define XUSB_CSB_MP_ILOAD_ATTR			0x101a00
>  #define XUSB_CSB_MP_ILOAD_BASE_LO		0x101a04
> @@ -131,6 +151,9 @@
> =20
>  #define IMEM_BLOCK_SIZE				256
> =20
> +#define FW_IOCTL_TYPE_SHIFT             (24)

This should use tabs for spacing, like all the other definitions. Also,
no need to wrap literal integers in parentheses.

> +#define FW_IOCTL_CFGTBL_READ		(17)

No need for the parentheses.

> +
>  struct tegra_xusb_fw_header {
>  	__le32 boot_loadaddr_in_imem;
>  	__le32 boot_codedfi_offset;
> @@ -175,6 +198,7 @@ struct tegra_xusb_mbox_regs {
>  	u16 data_in;
>  	u16 data_out;
>  	u16 owner;
> +	u16 smi_intr;
>  };
> =20
>  struct tegra_xusb_context_soc {
> @@ -189,6 +213,7 @@ struct tegra_xusb_context_soc {
>  	} fpci;
>  };
> =20
> +struct tegra_xusb_soc_ops;

Probably better to move the definition of the structure here and instead
predeclare struct tegra_xusb.

>  struct tegra_xusb_soc {
>  	const char *firmware;
>  	const char * const *supply_names;
> @@ -205,11 +230,15 @@ struct tegra_xusb_soc {
>  	} ports;
> =20
>  	struct tegra_xusb_mbox_regs mbox;
> +	struct tegra_xusb_soc_ops *ops;

const please.

> =20
>  	bool scale_ss_clock;
>  	bool has_ipfs;
>  	bool lpm_support;
>  	bool otg_reset_sspi;
> +
> +	bool has_bar2;
> +	bool has_ifr;
>  };
> =20
>  struct tegra_xusb_context {
> @@ -230,6 +259,8 @@ struct tegra_xusb {
> =20
>  	void __iomem *ipfs_base;
>  	void __iomem *fpci_base;
> +	void __iomem *bar2_base;
> +	resource_size_t bar2_start;

Maybe just store struct resource *bar2, here.

[...]
> @@ -664,6 +754,7 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb =
*tegra,
>  static irqreturn_t tegra_xusb_mbox_thread(int irq, void *data)
>  {
>  	struct tegra_xusb *tegra =3D data;
> +	struct tegra_xusb_soc_ops *ops =3D tegra->soc->ops;

const

> @@ -709,6 +800,15 @@ static void tegra_xusb_config(struct tegra_xusb *teg=
ra)
>  	value |=3D regs & (XUSB_BASE_ADDR_MASK << XUSB_BASE_ADDR_SHIFT);
>  	fpci_writel(tegra, value, XUSB_CFG_4);
> =20
> +	/* Program BAR2 space */
> +	if (tegra->soc->has_bar2) {

You could make this depend on tegra->bar2 if you make the change above.

> +		value =3D fpci_readl(tegra, XUSB_CFG_7);
> +		value &=3D ~(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
> +		value |=3D tegra->bar2_start &
> +			(XUSB_BASE2_ADDR_MASK << XUSB_BASE2_ADDR_SHIFT);
> +		fpci_writel(tegra, value, XUSB_CFG_7);
> +	}
> +
>  	usleep_range(100, 200);
> =20
>  	/* Enable bus master */
> @@ -881,21 +981,36 @@ static int tegra_xusb_request_firmware(struct tegra=
_xusb *tegra)
>  	return 0;
>  }
> =20
> +static int tegra_xusb_wait_for_falcon(struct tegra_xusb *tegra)
> +{
> +	struct xhci_cap_regs __iomem *cap_regs;
> +	struct xhci_op_regs __iomem *op_regs;
> +	int ret;
> +	u32 val;

Use "value" for consistency with the rest of the driver.

> +
> +	cap_regs =3D tegra->regs;
> +	op_regs =3D tegra->regs + HC_LENGTH(readl(&cap_regs->hc_capbase));
> +
> +	ret =3D readl_poll_timeout(&op_regs->status, val, !(val & STS_CNR), 100=
0, 200000);
> +
> +	if (ret)
> +		dev_err(tegra->dev, "XHCI Controller not ready. Falcon state: 0x%x\n",
> +			csb_readl(tegra, XUSB_FALC_CPUCTL));
> +
> +	return ret;
> +}

This refactoring could be a separate patch. It makes the rest of the
changes harder to review. Not necessarily something that needs to be
addressed, though.

> +
>  static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
>  {
>  	unsigned int code_tag_blocks, code_size_blocks, code_blocks;
> -	struct xhci_cap_regs __iomem *cap =3D tegra->regs;
>  	struct tegra_xusb_fw_header *header;
>  	struct device *dev =3D tegra->dev;
> -	struct xhci_op_regs __iomem *op;
> -	unsigned long timeout;
>  	time64_t timestamp;
>  	u64 address;
>  	u32 value;
>  	int err;
> =20
>  	header =3D (struct tegra_xusb_fw_header *)tegra->fw.virt;
> -	op =3D tegra->regs + HC_LENGTH(readl(&cap->hc_capbase));
> =20
>  	if (csb_readl(tegra, XUSB_CSB_MP_ILOAD_BASE_LO) !=3D 0) {
>  		dev_info(dev, "Firmware already loaded, Falcon state %#x\n",
> @@ -968,26 +1083,43 @@ static int tegra_xusb_load_firmware(struct tegra_x=
usb *tegra)
>  	/* Boot Falcon CPU and wait for USBSTS_CNR to get cleared. */
>  	csb_writel(tegra, CPUCTL_STARTCPU, XUSB_FALC_CPUCTL);
> =20
> -	timeout =3D jiffies + msecs_to_jiffies(200);
> +	if (tegra_xusb_wait_for_falcon(tegra))
> +		return -EIO;
> =20
> -	do {
> -		value =3D readl(&op->status);
> -		if ((value & STS_CNR) =3D=3D 0)
> -			break;
> +	timestamp =3D le32_to_cpu(header->fwimg_created_time);
> =20
> -		usleep_range(1000, 2000);
> -	} while (time_is_after_jiffies(timeout));
> +	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
> +
> +	return 0;
> +}
> =20
> -	value =3D readl(&op->status);
> -	if (value & STS_CNR) {
> -		value =3D csb_readl(tegra, XUSB_FALC_CPUCTL);
> -		dev_err(dev, "XHCI controller not read: %#010x\n", value);
> +static u32 tegra_xusb_read_firmware_header(struct tegra_xusb *tegra, u32=
 offset)
> +{
> +	/*
> +	 * We only accept reading the firmware config table
> +	 * The offset should not exceed the fw header structure
> +	 */
> +	if (offset >=3D sizeof(struct tegra_xusb_fw_header))
> +		return 0;

You technically still allow reading 3 bytes past the header structure.
Or does the firmware's CFGTL_READ IOCTL mask out the lower 2 bits of the
offset?

> +
> +	bar2_writel(tegra, (FW_IOCTL_CFGTBL_READ << FW_IOCTL_TYPE_SHIFT) | offs=
et,
> +			XUSB_BAR2_ARU_FW_SCRATCH);
> +	return bar2_readl(tegra, XUSB_BAR2_ARU_SMI_ARU_FW_SCRATCH_DATA0);
> +}
> +
> +static int tegra_xusb_init_ifr_firmware(struct tegra_xusb *tegra)
> +{
> +	time64_t timestamp;
> +
> +	if (tegra_xusb_wait_for_falcon(tegra))
>  		return -EIO;
> -	}
> =20
> -	timestamp =3D le32_to_cpu(header->fwimg_created_time);
> +#define offsetof_32(X, Y) ((u8)(offsetof(X, Y) / sizeof(__le32)))
> +	timestamp =3D tegra_xusb_read_firmware_header(tegra,
> +			offsetof_32(struct tegra_xusb_fw_header,
> +				fwimg_created_time) << 2);
> =20
> -	dev_info(dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
> +	dev_info(tegra->dev, "Firmware timestamp: %ptTs UTC\n", &timestamp);
> =20
>  	return 0;
>  }
> @@ -1403,7 +1535,7 @@ static int tegra_xusb_probe(struct platform_device =
*pdev)
>  	struct of_phandle_args args;
>  	struct tegra_xusb *tegra;
>  	struct device_node *np;
> -	struct resource *regs;
> +	struct resource *res, *regs;
>  	struct xhci_hcd *xhci;
>  	unsigned int i, j, k;
>  	struct phy *phy;
> @@ -1435,6 +1567,11 @@ static int tegra_xusb_probe(struct platform_device=
 *pdev)
>  		tegra->ipfs_base =3D devm_platform_ioremap_resource(pdev, 2);
>  		if (IS_ERR(tegra->ipfs_base))
>  			return PTR_ERR(tegra->ipfs_base);
> +	} else if (tegra->soc->has_bar2) {
> +		tegra->bar2_base =3D devm_platform_get_and_ioremap_resource(pdev, 2, &=
res);

If you store struct resource *bar2 in tegra, you can pass &tegra->bar2
here and ...

> +		if (IS_ERR(tegra->bar2_base))
> +			return PTR_ERR(tegra->bar2_base);
> +		tegra->bar2_start =3D res->start;

=2E.. skip this.

>  	}
> =20
>  	tegra->xhci_irq =3D platform_get_irq(pdev, 0);
> @@ -1651,10 +1788,13 @@ static int tegra_xusb_probe(struct platform_devic=
e *pdev)
>  		goto disable_phy;
>  	}
> =20
> -	err =3D tegra_xusb_request_firmware(tegra);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to request firmware: %d\n", err);
> -		goto disable_phy;
> +	if (!tegra->soc->has_ifr) {
> +		err =3D tegra_xusb_request_firmware(tegra);
> +		if (err < 0) {
> +			dev_err(&pdev->dev,
> +				"failed to request firmware: %d\n", err);
> +			goto disable_phy;
> +		}
>  	}
> =20
>  	err =3D tegra_xusb_unpowergate_partitions(tegra);
> @@ -1663,7 +1803,10 @@ static int tegra_xusb_probe(struct platform_device=
 *pdev)
> =20
>  	tegra_xusb_config(tegra);
> =20
> -	err =3D tegra_xusb_load_firmware(tegra);
> +	if (tegra->soc->has_ifr)
> +		err =3D tegra_xusb_init_ifr_firmware(tegra);
> +	else
> +		err =3D tegra_xusb_load_firmware(tegra);
>  	if (err < 0) {
>  		dev_err(&pdev->dev, "failed to load firmware: %d\n", err);
>  		goto powergate;
> @@ -2070,7 +2213,10 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb =
*tegra, bool runtime)
>  	tegra_xusb_config(tegra);
>  	tegra_xusb_restore_context(tegra);
> =20
> -	err =3D tegra_xusb_load_firmware(tegra);
> +	if (tegra->soc->has_ifr)
> +		err =3D tegra_xusb_init_ifr_firmware(tegra);
> +	else
> +		err =3D tegra_xusb_load_firmware(tegra);

Might be worth extracting this into a new function since you use this
twice now.

>  	if (err < 0) {
>  		dev_err(tegra->dev, "failed to load firmware: %d\n", err);
>  		goto disable_phy;
> @@ -2271,6 +2417,13 @@ static const struct tegra_xusb_context_soc tegra12=
4_xusb_context =3D {
>  	},
>  };
> =20
> +static struct tegra_xusb_soc_ops tegra124_ops =3D {

const

> +	.mbox_reg_readl =3D &fpci_readl,
> +	.mbox_reg_writel =3D &fpci_writel,
> +	.csb_reg_readl =3D &fpci_csb_readl,
> +	.csb_reg_writel =3D &fpci_csb_writel,
> +};
> +
>  static const struct tegra_xusb_soc tegra124_soc =3D {
>  	.firmware =3D "nvidia/tegra124/xusb.bin",
>  	.supply_names =3D tegra124_supply_names,
> @@ -2286,11 +2439,13 @@ static const struct tegra_xusb_soc tegra124_soc =
=3D {
>  	.scale_ss_clock =3D true,
>  	.has_ipfs =3D true,
>  	.otg_reset_sspi =3D false,
> +	.ops =3D &tegra124_ops,
>  	.mbox =3D {
>  		.cmd =3D 0xe4,
>  		.data_in =3D 0xe8,
>  		.data_out =3D 0xec,
>  		.owner =3D 0xf0,
> +		.smi_intr =3D XUSB_CFG_ARU_SMI_INTR,
>  	},
>  };
>  MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
> @@ -2322,11 +2477,13 @@ static const struct tegra_xusb_soc tegra210_soc =
=3D {
>  	.scale_ss_clock =3D false,
>  	.has_ipfs =3D true,
>  	.otg_reset_sspi =3D true,
> +	.ops =3D &tegra124_ops,
>  	.mbox =3D {
>  		.cmd =3D 0xe4,
>  		.data_in =3D 0xe8,
>  		.data_out =3D 0xec,
>  		.owner =3D 0xf0,
> +		.smi_intr =3D XUSB_CFG_ARU_SMI_INTR,
>  	},
>  };
>  MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
> @@ -2363,11 +2520,13 @@ static const struct tegra_xusb_soc tegra186_soc =
=3D {
>  	.scale_ss_clock =3D false,
>  	.has_ipfs =3D false,
>  	.otg_reset_sspi =3D false,
> +	.ops =3D &tegra124_ops,
>  	.mbox =3D {
>  		.cmd =3D 0xe4,
>  		.data_in =3D 0xe8,
>  		.data_out =3D 0xec,
>  		.owner =3D 0xf0,
> +		.smi_intr =3D XUSB_CFG_ARU_SMI_INTR,
>  	},
>  	.lpm_support =3D true,
>  };
> @@ -2394,21 +2553,59 @@ static const struct tegra_xusb_soc tegra194_soc =
=3D {
>  	.scale_ss_clock =3D false,
>  	.has_ipfs =3D false,
>  	.otg_reset_sspi =3D false,
> +	.ops =3D &tegra124_ops,
>  	.mbox =3D {
>  		.cmd =3D 0x68,
>  		.data_in =3D 0x6c,
>  		.data_out =3D 0x70,
>  		.owner =3D 0x74,
> +		.smi_intr =3D XUSB_CFG_ARU_SMI_INTR,
>  	},
>  	.lpm_support =3D true,
>  };
>  MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
> =20
> +static struct tegra_xusb_soc_ops tegra234_ops =3D {

const

> +	.mbox_reg_readl =3D &bar2_readl,
> +	.mbox_reg_writel =3D &bar2_writel,
> +	.csb_reg_readl =3D &bar2_csb_readl,
> +	.csb_reg_writel =3D &bar2_csb_writel,
> +};
> +
> +static const struct tegra_xusb_soc tegra234_soc =3D {
> +	.firmware =3D "nvidia/tegra234/xusb.bin",
> +	.supply_names =3D tegra194_supply_names,
> +	.num_supplies =3D ARRAY_SIZE(tegra194_supply_names),
> +	.phy_types =3D tegra194_phy_types,
> +	.num_types =3D ARRAY_SIZE(tegra194_phy_types),
> +	.context =3D &tegra186_xusb_context,
> +	.ports =3D {
> +		.usb3 =3D { .offset =3D 0, .count =3D 4, },
> +		.usb2 =3D { .offset =3D 4, .count =3D 4, },
> +	},
> +	.scale_ss_clock =3D false,
> +	.has_ipfs =3D false,
> +	.otg_reset_sspi =3D false,
> +	.ops =3D &tegra234_ops,
> +	.mbox =3D {
> +		.cmd =3D XUSB_BAR2_ARU_MBOX_CMD,
> +		.data_in =3D XUSB_BAR2_ARU_MBOX_DATA_IN,
> +		.data_out =3D XUSB_BAR2_ARU_MBOX_DATA_OUT,
> +		.owner =3D XUSB_BAR2_ARU_MBOX_OWNER,
> +		.smi_intr =3D XUSB_BAR2_ARU_SMI_INTR,
> +	},
> +	.lpm_support =3D true,
> +	.has_bar2 =3D true,
> +	.has_ifr =3D true,
> +};
> +MODULE_FIRMWARE("nvidia/tegra234/xusb.bin");

Can you prepare a patch to add this firmware to the linux-firmware
repository? I don't see it there yet.

Thierry

> +
>  static const struct of_device_id tegra_xusb_of_match[] =3D {
>  	{ .compatible =3D "nvidia,tegra124-xusb", .data =3D &tegra124_soc },
>  	{ .compatible =3D "nvidia,tegra210-xusb", .data =3D &tegra210_soc },
>  	{ .compatible =3D "nvidia,tegra186-xusb", .data =3D &tegra186_soc },
>  	{ .compatible =3D "nvidia,tegra194-xusb", .data =3D &tegra194_soc },
> +	{ .compatible =3D "nvidia,tegra234-xusb", .data =3D &tegra234_soc },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
> --=20
> 2.25.1
>=20

--Mbj1VkMtzmZhLdX9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNb25EACgkQ3SOs138+
s6F7cw//UeHVl36CYig4HEaNFyNXLFCrs557GkVBx+bcayvmjHalwDjibi/AjNmp
+J6NsmxD/Jh1NOtq4EIyetWQ0lHKjAAVkb8YJ2CgdKDD1aQLIkceTxHRlKdgrVbh
dPupJmtiwZf9qodUbwtV/vtuV8B/Xkr+BH5fDvtCNsiRsrdzirxpnti7kAME6v2/
TFl1nXSKzvQqnLdgOZAuli9KPW9Z91KtsJs2pgnOFREcmkHOqvMlsWCV+xv7uJrz
tUOwm67ApPdGwlo4MNDtJ4i8jA2enGT9xedhx36YKfYUBnpqEjcLXHxvnHdTXAnD
ctK1cBLLxWrgaZjmgKmMuL4oo9g3SJI5Mld/Ye4l56bJhEHwBEaXLNnhRxSftiB8
E/Pfckjjqoi6R0Ph5KT8KPnohGCcA5pPPxkvphCijAtuGP01YkSYVWbN9a5SS8YI
8khrJXqn3EnOcsf6e5LJxLM6ebTsQQPhgA//nKxR859zI5dL6o2nlNkkkA6BDT6u
Re0WdJQ34qHv1fWTzIynoi48w8WQDr3ZtnHOMxcW8lLFStMK+1RayB/UUz17Pl5a
S6UtiaAoRbc9lCXLmeHD4hoQWVSeSsTdhxs3Z7oG9bQ3g+KBrJ89UNL5aCEYpq0l
iu+VunOevd2YFmqpLVJBi+BVghxIK0N3QUdSRxnunPeVrIRF9S8=
=6tE+
-----END PGP SIGNATURE-----

--Mbj1VkMtzmZhLdX9--
