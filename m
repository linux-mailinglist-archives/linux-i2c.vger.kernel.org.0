Return-Path: <linux-i2c+bounces-787-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEFE812FB8
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 13:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB789283163
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 12:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1CC4176A;
	Thu, 14 Dec 2023 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="oGFvv+SO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rpXaCRpC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B5BBB9;
	Thu, 14 Dec 2023 04:08:33 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 755335C01CF;
	Thu, 14 Dec 2023 07:08:32 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 14 Dec 2023 07:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1702555712; x=1702642112; bh=I3zDpA1e2z
	4eS6eRyiMCBK2+M59mbhlW+pG/DGYz/0g=; b=oGFvv+SOy0v7tesgWGwsR/PzMC
	dTDTbiUR3yOb2/H0jiax16dyTyOtG91U6JDr4i4w8TA17z9crCyNQDd5YtG7lH9k
	iHpWa7U7E6kOmDuS4ZzNYyaOI9WotzcX+Rd4SYjxuwOA0qxr5eCcNnPAnKeLdID/
	xmhOwW6c6i8IpQuDupfUGea4b9748S0ACrfRUbPjn9OH7qOMpPFgr3KPiJZwFUhH
	9jhdZesPTHlIzBmnOWQ/tCU9gG7zdvVOvxujkIwHwnsVXMSlio+FpXuyKwPs/N1P
	2zH46eA4KxCJFKV9KZmApsWEhk7PMi4BHSWAMEc8XYNtZ++0AxEA+Wfu25dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702555712; x=1702642112; bh=I3zDpA1e2z4eS6eRyiMCBK2+M59m
	bhlW+pG/DGYz/0g=; b=rpXaCRpC8y2y+/vbyA4hrlBraidM7DVZtyM7y3AHm9wR
	Swmlp6Crp707NKwOucq+3+c3Aud55iUYGJGr/hvmDBbrrKp0lZsUdjVXCFORsz8u
	iKo2KWZmjfcGWY6qTyWjfmbha7AeZO0DP19/6v1X+eZvvqYnznjyb4wff9SVsWaN
	mv+5x6loZUJpsL0EuvGtXFxYM6Xev1yqk9R0M6sbyoRWX82rUPGUW9thD5NJD5z/
	5dv+jcd963lNqtXpCTVLboWXTh48MZ5SpyXKPHbuSKfOHnaYXh5qrSd6g6jLFynK
	jrWMXGgX45EOclPxucgkYB7lZay80WQtg1eL4MC51g==
X-ME-Sender: <xms:P_B6Zabwp5ulDsnlmdTRGFB-6do0y5BESrp8r2MRLfHZaN8UB-bWsw>
    <xme:P_B6Zda2tD1TZMr2I_CyLRIft80TpYeH4LLhpb5sOepG0fAqvwgJxbewAlb33Wni6
    0R8sciiZpsgJG8e0sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelledgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:P_B6ZU913rpDEYzsPH0SyTIKiphbc3u-eDMzJSLJ3ajgAvyqJ85CQA>
    <xmx:P_B6ZcpY1FlQW4f_kmD2_38RQiMil73nYRzrBIdaU4ub-30_vP9N7Q>
    <xmx:P_B6ZVoOq0mqtDKvZ_6ZyLlkDOXa26lKM6fsbSh-uCfGFYZ-deCvhw>
    <xmx:QPB6ZfYqTcPswEQsdgT5WdSQB7TUNk5e-YuxCveqhdfyI1-4Rm-7zA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9B050B6008D; Thu, 14 Dec 2023 07:08:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1153987b-a818-454a-a292-57f2b3898771@app.fastmail.com>
In-Reply-To: <20231214105243.3707730-13-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-13-tudor.ambarus@linaro.org>
Date: Thu, 14 Dec 2023 13:08:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 andi.shyti@kernel.org, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Tomasz Figa" <tomasz.figa@gmail.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Sam Protsenko" <semen.protsenko@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 saravanak@google.com, "William McVicker" <willmcvicker@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: Re: [PATCH 12/13] arm64: defconfig: sync with savedefconfig
Content-Type: text/plain

On Thu, Dec 14, 2023, at 11:52, Tudor Ambarus wrote:
> Sync the defconfig with savedefconfig as config options
> change/move over time.
>
> Generated with the following commands:
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- savedefconfig
> cp defconfig arch/arm64/configs/defconfig
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 144 +++++++++++++----------------------
>  1 file changed, 55 insertions(+), 89 deletions(-)

I usually ask for defconfig changes to be merged when someone just
adds a single line per patch, but a 144 line change is clearly too
big, please split this up.

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b60aa1f89343..09fb467303ba 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -30,6 +30,8 @@ CONFIG_SCHED_AUTOGROUP=y
>  CONFIG_BLK_DEV_INITRD=y
>  CONFIG_KALLSYMS_ALL=y
>  CONFIG_PROFILING=y
> +CONFIG_KEXEC_FILE=y
> +CONFIG_CRASH_DUMP=y
>  CONFIG_ARCH_ACTIONS=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_ALPINE=y
> @@ -77,9 +79,6 @@ CONFIG_ARM64_VA_BITS_48=y
>  CONFIG_SCHED_MC=y
>  CONFIG_SCHED_SMT=y
>  CONFIG_NUMA=y
> -CONFIG_KEXEC=y
> -CONFIG_KEXEC_FILE=y
> -CONFIG_CRASH_DUMP=y
>  CONFIG_XEN=y
>  CONFIG_COMPAT=y
>  CONFIG_RANDOMIZE_BASE=y

These two hunks seem to go together, but it needs an explanation
why you are removing CONFIG_KEXEC.

> @@ -119,7 +118,6 @@ CONFIG_KVM=y
>  CONFIG_JUMP_LABEL=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> -CONFIG_IOSCHED_BFQ=y
>  # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_MEMORY_HOTPLUG=y

No, I definitely want CONFIG_IOSCHED_BFQ=y, it is essential
for performance on certain classes of machines. It would
be better to drop the 'imply IOSCHED_BFQ' in two Kconfig
files.

> @@ -129,8 +127,6 @@ CONFIG_MEMORY_FAILURE=y
>  CONFIG_TRANSPARENT_HUGEPAGE=y
>  CONFIG_NET=y
>  CONFIG_PACKET=y
> -CONFIG_UNIX=y
> -CONFIG_INET=y
>  CONFIG_IP_MULTICAST=y
>  CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y

These also seem kind of essential for almost any machine,
I assume you are doing something wrong here.

> @@ -180,8 +176,6 @@ CONFIG_NET_ACT_GATE=m
>  CONFIG_QRTR_SMD=m
>  CONFIG_QRTR_TUN=m
>  CONFIG_CAN=m
> -CONFIG_CAN_M_CAN=m
> -CONFIG_CAN_M_CAN_PLATFORM=m
>  CONFIG_BT=m
>  CONFIG_BT_HIDP=m
>  # CONFIG_BT_LE is not set
> @@ -384,6 +372,8 @@ CONFIG_DP83869_PHY=m
>  CONFIG_DP83TD510_PHY=y
>  CONFIG_VITESSE_PHY=y
>  CONFIG_CAN_FLEXCAN=m
> +CONFIG_CAN_M_CAN=m
> +CONFIG_CAN_M_CAN_PLATFORM=m
>  CONFIG_CAN_RCAR=m
>  CONFIG_CAN_RCAR_CANFD=m
>  CONFIG_CAN_MCP251XFD=m

These just get moved around in the file, please don't
mix those changes with other changes that change the behavior.

> @@ -215,27 +209,27 @@ CONFIG_PCI_PASID=y
>  CONFIG_HOTPLUG_PCI=y
>  CONFIG_HOTPLUG_PCI_ACPI=y
>  CONFIG_PCI_AARDVARK=y
> -CONFIG_PCI_TEGRA=y
> -CONFIG_PCIE_RCAR_HOST=y
> -CONFIG_PCIE_RCAR_EP=y
> -CONFIG_PCI_HOST_GENERIC=y
> -CONFIG_PCI_XGENE=y
>  CONFIG_PCIE_ALTERA=y
>  CONFIG_PCIE_ALTERA_MSI=y
> +CONFIG_PCIE_BRCMSTB=m
>  CONFIG_PCI_HOST_THUNDER_PEM=y
>  CONFIG_PCI_HOST_THUNDER_ECAM=y
> -CONFIG_PCIE_ROCKCHIP_HOST=m
> +CONFIG_PCI_HOST_GENERIC=y
>  CONFIG_PCIE_MEDIATEK_GEN3=m
> -CONFIG_PCIE_BRCMSTB=m
> +CONFIG_PCI_TEGRA=y
> +CONFIG_PCIE_RCAR_HOST=y
> +CONFIG_PCIE_RCAR_EP=y
> +CONFIG_PCIE_ROCKCHIP_HOST=m
> +CONFIG_PCI_XGENE=y
>  CONFIG_PCI_IMX6_HOST=y
>  CONFIG_PCI_LAYERSCAPE=y
>  CONFIG_PCI_HISI=y
> -CONFIG_PCIE_QCOM=y
> -CONFIG_PCIE_ARMADA_8K=y
> -CONFIG_PCIE_ROCKCHIP_DW_HOST=y
>  CONFIG_PCIE_KIRIN=y
>  CONFIG_PCIE_HISI_STB=y
> +CONFIG_PCIE_ARMADA_8K=y
>  CONFIG_PCIE_TEGRA194_HOST=m
> +CONFIG_PCIE_QCOM=y
> +CONFIG_PCIE_ROCKCHIP_DW_HOST=y
>  CONFIG_PCIE_VISCONTI_HOST=y
>  CONFIG_PCIE_LAYERSCAPE_GEN4=y
>  CONFIG_PCI_ENDPOINT=y

Same here

> @@ -247,14 +241,12 @@ CONFIG_FW_LOADER_USER_HELPER=y
>  CONFIG_HISILICON_LPC=y
>  CONFIG_TEGRA_ACONNECT=m
>  CONFIG_MHI_BUS_PCI_GENERIC=m
> -CONFIG_ARM_SCMI_PROTOCOL=y
>  CONFIG_ARM_SCPI_PROTOCOL=y
>  CONFIG_RASPBERRYPI_FIRMWARE=y
>  CONFIG_INTEL_STRATIX10_SERVICE=y
> @@ -1185,7 +1168,6 @@ CONFIG_CROS_EC_RPMSG=m
>  CONFIG_CROS_EC_SPI=y
>  CONFIG_CROS_EC_CHARDEV=m
>  CONFIG_COMMON_CLK_RK808=y
> -CONFIG_COMMON_CLK_SCMI=y
>  CONFIG_COMMON_CLK_SCPI=y
>  CONFIG_COMMON_CLK_CS2000_CP=y
>  CONFIG_COMMON_CLK_FSL_SAI=y

This was caused by commit 9e4e24414cc6 ("arm64:
introduce STM32 family on Armv8 architecture"),
which selects ARM_SCMI_PROTOCOL and COMMON_CLK_SCMI.
I think we should instead revert those and enable
them in the defconfig for consistency with the other
platforms that need the same driver.

>  CONFIG_INTEL_STRATIX10_RSU=m
>  CONFIG_EFI_CAPSULE_LOADER=y
>  CONFIG_IMX_SCU=y
> -CONFIG_IMX_SCU_PD=y
>  CONFIG_GNSS=m
>  CONFIG_GNSS_MTK_SERIAL=m
>  CONFIG_MTD=y
> @@ -276,15 +268,12 @@ CONFIG_MTD_NAND_FSL_IFC=y
>  CONFIG_MTD_NAND_QCOM=y
>  CONFIG_MTD_SPI_NOR=y
>  CONFIG_MTD_UBI=m
> -CONFIG_UBIFS_FS=m
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_NBD=m
>  CONFIG_VIRTIO_BLK=y
>  CONFIG_BLK_DEV_NVME=m
>  CONFIG_QCOM_COINCELL=m
>  CONFIG_QCOM_FASTRPC=m
> -CONFIG_BATTERY_QCOM_BATTMGR=m
> -CONFIG_UCSI_PMIC_GLINK=m
>  CONFIG_SRAM=y
>  CONFIG_PCI_ENDPOINT_TEST=m
>  CONFIG_EEPROM_AT24=m

Again, just moved around.

> @@ -308,7 +297,6 @@ CONFIG_AHCI_XGENE=y
>  CONFIG_AHCI_QORIQ=y
>  CONFIG_SATA_SIL24=y
>  CONFIG_SATA_RCAR=y
> -CONFIG_PATA_PLATFORM=y
>  CONFIG_PATA_OF_PLATFORM=y
>  CONFIG_MD=y
>  CONFIG_BLK_DEV_MD=m

For the ones that got removed for a good and trivial reason,
you can probably combine the patches and just list what
happened.

> @@ -635,7 +625,7 @@ CONFIG_GPIO_PCA953X_IRQ=y
>  CONFIG_GPIO_BD9571MWV=m
>  CONFIG_GPIO_MAX77620=y
>  CONFIG_GPIO_SL28CPLD=m
> -CONFIG_GPIO_SYSCON=y

Apparently caused by GPIO_SAMA5D2_PIOBU, please change that
to 'depends on'.

> @@ -856,7 +843,6 @@ CONFIG_DRM_LONTIUM_LT9611UXC=m
>  CONFIG_DRM_ITE_IT66121=m
>  CONFIG_DRM_NWL_MIPI_DSI=m
>  CONFIG_DRM_PARADE_PS8640=m
> -CONFIG_DRM_SAMSUNG_DSIM=m
>  CONFIG_DRM_SII902X=m
>  CONFIG_DRM_SIMPLE_BRIDGE=m
>  CONFIG_DRM_THINE_THC63LVD1024=m

DRM_EXYNOS_DSI should probably depend on this rather than
selecting it.

> @@ -1203,18 +1185,6 @@ CONFIG_CLK_IMX8QXP=y
>  CONFIG_CLK_IMX8ULP=y
>  CONFIG_CLK_IMX93=y
>  CONFIG_TI_SCI_CLK=y
> -CONFIG_COMMON_CLK_MT8192_AUDSYS=y
> -CONFIG_COMMON_CLK_MT8192_CAMSYS=y
> -CONFIG_COMMON_CLK_MT8192_IMGSYS=y
> -CONFIG_COMMON_CLK_MT8192_IMP_IIC_WRAP=y
> -CONFIG_COMMON_CLK_MT8192_IPESYS=y
> -CONFIG_COMMON_CLK_MT8192_MDPSYS=y
> -CONFIG_COMMON_CLK_MT8192_MFGCFG=y
> -CONFIG_COMMON_CLK_MT8192_MMSYS=y
> -CONFIG_COMMON_CLK_MT8192_MSDC=y
> -CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
> -CONFIG_COMMON_CLK_MT8192_VDECSYS=y
> -CONFIG_COMMON_CLK_MT8192_VENCSYS=y
>  CONFIG_COMMON_CLK_QCOM=y
>  CONFIG_QCOM_A53PLL=y
>  CONFIG_QCOM_CLK_APCS_MSM8916=y

These looks legitimate

> @@ -1275,7 +1244,6 @@ CONFIG_TEGRA186_TIMER=y
>  CONFIG_RENESAS_OSTM=y
>  CONFIG_ARM_MHU=y
>  CONFIG_IMX_MBOX=y
> -CONFIG_OMAP2PLUS_MBOX=m
>  CONFIG_PLATFORM_MHU=y
>  CONFIG_BCM2835_MBOX=y
>  CONFIG_QCOM_APCS_IPC=y

Again we have a mix of select and depends:

drivers/remoteproc/Kconfig:     select OMAP2PLUS_MBOX
drivers/remoteproc/Kconfig:     select OMAP2PLUS_MBOX
drivers/remoteproc/Kconfig:     select OMAP2PLUS_MBOX
drivers/soc/ti/Kconfig: depends on OMAP2PLUS_MBOX

We probably want the latter for all of them.

> @@ -1462,7 +1431,6 @@ CONFIG_PHY_J721E_WIZ=m
>  CONFIG_ARM_CCI_PMU=m
>  CONFIG_ARM_CCN=m
>  CONFIG_ARM_CMN=m
> -CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
>  CONFIG_ARM_SMMU_V3_PMU=m
>  CONFIG_ARM_DSU_PMU=m
>  CONFIG_FSL_IMX8_DDR_PMU=m
> @@ -1471,6 +1439,7 @@ CONFIG_QCOM_L3_PMU=y
>  CONFIG_ARM_SPE_PMU=m
>  CONFIG_ARM_DMC620_PMU=m
>  CONFIG_HISI_PMU=y
> +CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
>  CONFIG_MESON_DDR_PMU=m
>  CONFIG_NVMEM_LAYOUT_SL28_VPD=m
>  CONFIG_NVMEM_IMX_OCOTP=y

Just moved

> @@ -1498,10 +1467,8 @@ CONFIG_TEE=y
>  CONFIG_OPTEE=y
>  CONFIG_MUX_GPIO=m
>  CONFIG_MUX_MMIO=y
> -CONFIG_SLIMBUS=m
>  CONFIG_SLIM_QCOM_CTRL=m

Please fix SOUNDWIRE_QCOM to no longer 'imply SLIMBUS'.

>  CONFIG_SLIM_QCOM_NGD_CTRL=m
> -CONFIG_INTERCONNECT=y
>  CONFIG_INTERCONNECT_IMX=y
>  CONFIG_INTERCONNECT_IMX8MM=m
>  CONFIG_INTERCONNECT_IMX8MN=m

I think the problem here are some Tegra device drivers that
incorrectly 'select INTERCONNECT' rather than using the
'depends on' that every other interconnect driver has.
Please fix those instead.

> @@ -1544,8 +1511,8 @@ CONFIG_OVERLAY_FS=m
>  CONFIG_VFAT_FS=y
>  CONFIG_TMPFS_POSIX_ACL=y
>  CONFIG_HUGETLBFS=y
> -CONFIG_CONFIGFS_FS=y
>  CONFIG_EFIVAR_FS=y

For CONFIG_CONFIGFS_FS, we have a mix of 'depends on' and 'select'
in the Kconfig options that use it. Before you remove this here,
let's discuss with all the users which of the two should actually
be used and then change them to be consistent.

> @@ -1593,7 +1560,6 @@ CONFIG_DEBUG_INFO_REDUCED=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
>  # CONFIG_SCHED_DEBUG is not set
> -# CONFIG_DEBUG_PREEMPT is not set
>  # CONFIG_FTRACE is not set
>  CONFIG_CORESIGHT=m
>  CONFIG_CORESIGHT_LINK_AND_SINK_TMC=m

These looks sensible. Can you do the same thing for
arch/arm/configs/* in a combined patch?

      Arnd

