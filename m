Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41CE81174BE
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2019 19:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbfLISnr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Dec 2019 13:43:47 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:34234 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726584AbfLISmx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 9 Dec 2019 13:42:53 -0500
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 0E0D92E5CF1;
        Mon,  9 Dec 2019 18:29:16 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lee.jones@linaro.org, lars@metafoo.de,
        pascal.huerst@gmail.com, Daniel Mack <daniel@zonque.org>
Subject: [PATCH 10/10] ASoC: Add codec component for AD242x nodes
Date:   Mon,  9 Dec 2019 19:35:11 +0100
Message-Id: <20191209183511.3576038-12-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This driver makes AD242x nodes available as DAIs in ASoC topologies.

The hardware allows multiple TDM channel modes and bitdepths, but
as these modes have influence in the timing calculations at discovery
time, the mode in that the will be used in needs to be configured
statically in the devicetree.

The configuration applied at runtime through hwparams() is then
required to match the pre-configured settings.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 sound/soc/codecs/Kconfig  |   5 +
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/ad242x.c | 338 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 345 insertions(+)
 create mode 100644 sound/soc/codecs/ad242x.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4abf37b5083f..75365abc277f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -22,6 +22,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_AD193X_SPI if SPI_MASTER
 	select SND_SOC_AD193X_I2C if I2C
 	select SND_SOC_AD1980 if SND_SOC_AC97_BUS
+	select SND_SOC_AD242X if MFD_AD242X
 	select SND_SOC_AD73311
 	select SND_SOC_ADAU1373 if I2C
 	select SND_SOC_ADAU1761_I2C if I2C
@@ -333,6 +334,10 @@ config SND_SOC_AD1980
 	select REGMAP_AC97
 	tristate
 
+config SND_SOC_AD242X
+	tristate "Analog Devices AD242x CODEC"
+	depends on MFD_AD242X
+
 config SND_SOC_AD73311
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ddfd07071925..ec76448fc1da 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -7,6 +7,7 @@ snd-soc-ad193x-objs := ad193x.o
 snd-soc-ad193x-spi-objs := ad193x-spi.o
 snd-soc-ad193x-i2c-objs := ad193x-i2c.o
 snd-soc-ad1980-objs := ad1980.o
+snd-soc-ad242x-objs := ad242x.o
 snd-soc-ad73311-objs := ad73311.o
 snd-soc-adau-utils-objs := adau-utils.o
 snd-soc-adau1373-objs := adau1373.o
@@ -294,6 +295,7 @@ obj-$(CONFIG_SND_SOC_AD193X)	+= snd-soc-ad193x.o
 obj-$(CONFIG_SND_SOC_AD193X_SPI)	+= snd-soc-ad193x-spi.o
 obj-$(CONFIG_SND_SOC_AD193X_I2C)	+= snd-soc-ad193x-i2c.o
 obj-$(CONFIG_SND_SOC_AD1980)	+= snd-soc-ad1980.o
+obj-$(CONFIG_SND_SOC_AD242X)	+= snd-soc-ad242x.o
 obj-$(CONFIG_SND_SOC_AD73311) += snd-soc-ad73311.o
 obj-$(CONFIG_SND_SOC_ADAU_UTILS)	+= snd-soc-adau-utils.o
 obj-$(CONFIG_SND_SOC_ADAU1373)	+= snd-soc-adau1373.o
diff --git a/sound/soc/codecs/ad242x.c b/sound/soc/codecs/ad242x.c
new file mode 100644
index 000000000000..76189a7c3c92
--- /dev/null
+++ b/sound/soc/codecs/ad242x.c
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/mfd/ad242x.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <sound/asoundef.h>
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+struct ad242x_private {
+	struct ad242x_node	*node;
+	bool			pdm[2];
+	bool			pdm_highpass;
+};
+
+static const struct snd_soc_dapm_widget ad242x_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("RX0",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("RX1",  NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX0", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TX1", NULL, 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route ad242x_dapm_routes[] = {
+	{ "DAI0 Playback", NULL, "RX0" },
+	{ "TX0", NULL, "DAI0 Capture"  },
+	{ "DAI1 Playback", NULL, "RX1" },
+	{ "TX1", NULL, "DAI1 Capture"  },
+};
+
+static int ad242x_set_dai_fmt(struct snd_soc_dai *codec_dai,
+			      unsigned int format,
+			      unsigned int index)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct ad242x_private *priv = snd_soc_component_get_drvdata(component);
+	int ret, val = 0;
+
+	/* set DAI format */
+	switch (format & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		priv->pdm[index] = false;
+		break;
+	case SND_SOC_DAIFMT_PDM:
+		priv->pdm[index] = true;
+		break;
+	default:
+		dev_err(component->dev, "unsupported dai format\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Setting clock inversion is only supported globally for both DAIs,
+	 * so we ignore the settings made for DAI1 here.
+	 */
+	if (index == 0) {
+		switch (format & SND_SOC_DAIFMT_INV_MASK) {
+		case SND_SOC_DAIFMT_NB_NF:
+			val = 0;
+			break;
+		case SND_SOC_DAIFMT_IB_NF:
+			val = AD242X_I2SCTL_RXBCLKINV;
+			break;
+		case SND_SOC_DAIFMT_NB_IF:
+		case SND_SOC_DAIFMT_IB_IF:
+			dev_err(component->dev, "unsupported inversion mask\n");
+			return -EINVAL;
+		}
+
+		ret = regmap_update_bits(priv->node->regmap, AD242X_I2SCTL,
+					AD242X_I2SCTL_RXBCLKINV, val);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (ad242x_node_is_master(priv->node) &&
+	   ((format & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS)) {
+		dev_err(component->dev, "master node must be clock slave\n");
+		return -EINVAL;
+	}
+
+	if (!ad242x_node_is_master(priv->node) &&
+	   ((format & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBM_CFM)) {
+		dev_err(component->dev, "slave node must be clock master\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ad242x_set_dai_fmt_dai0(struct snd_soc_dai *codec_dai,
+				   unsigned int format)
+{
+	return ad242x_set_dai_fmt(codec_dai, format, 0);
+}
+
+static int ad242x_set_dai_fmt_dai1(struct snd_soc_dai *codec_dai,
+				   unsigned int format)
+{
+	return ad242x_set_dai_fmt(codec_dai, format, 1);
+}
+
+static int ad242x_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *dai,
+			    int index)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ad242x_private *priv = snd_soc_component_get_drvdata(component);
+	unsigned int sff_rate = ad242x_master_get_clk_rate(priv->node->master);
+	unsigned int rate = params_rate(params);
+	unsigned int val, mask;
+	int ret;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		if (priv->node->tdm_slot_size != 16)
+			return -EINVAL;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		if (priv->node->tdm_slot_size != 32)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (priv->pdm[index]) {
+		if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+			return -EINVAL;
+
+		if (index == 0) {
+			val = AD242X_PDMCTL_PDM0EN;
+			mask = AD242X_PDMCTL_PDM0EN | AD242X_PDMCTL_PDM0SLOTS;
+		} else {
+			val = AD242X_PDMCTL_PDM1EN;
+			mask = AD242X_PDMCTL_PDM1EN | AD242X_PDMCTL_PDM1SLOTS;
+		}
+
+		switch (params_channels(params)) {
+		case 1:
+			break;
+		case 2:
+			val = mask;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		mask |= AD242X_PDMCTL_HPFEN;
+		if (priv->pdm_highpass)
+			val |= AD242X_PDMCTL_HPFEN;
+
+		ret = regmap_update_bits(priv->node->regmap, AD242X_PDMCTL,
+					 mask, val);
+		if (ret < 0)
+			return ret;
+	} else {
+		if (params_channels(params) != priv->node->tdm_mode)
+			return -EINVAL;
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (index == 0)
+				mask = AD242X_I2SCTL_RX0EN;
+			else
+				mask = AD242X_I2SCTL_RX1EN;
+		} else {
+			if (index == 0)
+				mask = AD242X_I2SCTL_TX0EN;
+			else
+				mask = AD242X_I2SCTL_TX1EN;
+		}
+
+		ret = regmap_update_bits(priv->node->regmap, AD242X_I2SCTL,
+					 mask, mask);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (!ad242x_node_is_master(priv->node)) {
+		val = 0;
+
+		if (rate == sff_rate / 2)
+			val = AD242X_I2SRATE_I2SRATE(1);
+		else if (rate == sff_rate / 4)
+			val = AD242X_I2SRATE_I2SRATE(2);
+		else if (rate == sff_rate * 2)
+			val = AD242X_I2SRATE_I2SRATE(5);
+		else if (rate == sff_rate * 4)
+			val = AD242X_I2SRATE_I2SRATE(6);
+		else if (rate != sff_rate)
+			return -EINVAL;
+
+		ret = regmap_write(priv->node->regmap, AD242X_I2SRATE, val);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ad242x_hw_params_dai0(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	return ad242x_hw_params(substream, params, dai, 0);
+}
+
+static int ad242x_hw_params_dai1(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	return ad242x_hw_params(substream, params, dai, 1);
+}
+
+static const struct snd_soc_dai_ops ad242x_dai0_ops = {
+	.hw_params	= ad242x_hw_params_dai0,
+	.set_fmt	= ad242x_set_dai_fmt_dai0,
+};
+
+static const struct snd_soc_dai_ops ad242x_dai1_ops = {
+	.hw_params	= ad242x_hw_params_dai1,
+	.set_fmt	= ad242x_set_dai_fmt_dai1,
+};
+
+#define AD242X_RATES (					\
+	SNDRV_PCM_RATE_22050  | SNDRV_PCM_RATE_32000  |	\
+	SNDRV_PCM_RATE_44100  | SNDRV_PCM_RATE_48000  |	\
+	SNDRV_PCM_RATE_88200  | SNDRV_PCM_RATE_96000  |	\
+	SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000)
+#define AD242X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver ad242x_dai[] = {
+	{
+		.name = "ad242x-dai0",
+		.playback = {
+			.stream_name	= "DAI0 Playback",
+			.channels_min	= 1,
+			.channels_max	= 32,
+			.rates		= AD242X_RATES,
+			.formats	= AD242X_FORMATS,
+		},
+		.capture = {
+			.stream_name	= "DAI0 Capture",
+			.channels_min	= 1,
+			.channels_max	= 32,
+			.rates		= AD242X_RATES,
+			.formats	= AD242X_FORMATS,
+		},
+		.ops = &ad242x_dai0_ops,
+	},
+	{
+		.name = "ad242x-dai1",
+		.playback = {
+			.stream_name	= "DAI1 Playback",
+			.channels_min	= 1,
+			.channels_max	= 32,
+			.rates		= AD242X_RATES,
+			.formats	= AD242X_FORMATS,
+		},
+		.capture = {
+			.stream_name	= "DAI1 Capture",
+			.channels_min	= 1,
+			.channels_max	= 32,
+			.rates		= AD242X_RATES,
+			.formats	= AD242X_FORMATS,
+		},
+		.ops = &ad242x_dai1_ops,
+	},
+};
+
+static int ad242x_soc_probe(struct snd_soc_component *component)
+{
+	struct ad242x_private *priv = snd_soc_component_get_drvdata(component);
+
+	component->regmap = priv->node->regmap;
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver soc_component_device_ad242x = {
+	.probe			= ad242x_soc_probe,
+	.dapm_widgets		= ad242x_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(ad242x_dapm_widgets),
+	.dapm_routes		= ad242x_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(ad242x_dapm_routes),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static int ad242x_codec_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ad242x_private *priv;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->node = dev_get_drvdata(dev->parent);
+	platform_set_drvdata(pdev, priv);
+
+	priv->pdm_highpass = of_property_read_bool(dev->of_node,
+						   "adi,pdm-highpass-filter");
+
+	return devm_snd_soc_register_component(dev,
+					       &soc_component_device_ad242x,
+					       ad242x_dai,
+					       ARRAY_SIZE(ad242x_dai));
+}
+
+static const struct of_device_id ad242x_of_match[] = {
+	{ .compatible = "adi,ad2428w-codec", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ad242x_of_match);
+
+static struct platform_driver ad242x_platform_driver = {
+	.driver  = {
+		.name   = "ad242x-codec",
+		.of_match_table = ad242x_of_match,
+	},
+	.probe  = ad242x_codec_platform_probe,
+};
+
+module_platform_driver(ad242x_platform_driver);
+
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
+MODULE_DESCRIPTION("AD242X ALSA SoC driver");
+MODULE_LICENSE("GPL");
-- 
2.23.0

