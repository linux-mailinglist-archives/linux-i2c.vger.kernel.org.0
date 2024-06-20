Return-Path: <linux-i2c+bounces-4148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A1911053
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 20:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D269283AD2
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 18:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CC21BD00E;
	Thu, 20 Jun 2024 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="sxJrGWrb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938AB1BC08A
	for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 18:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906452; cv=none; b=eXv4evKurpGY6j7FERm/H+RVLCn1w9fbjpWScEiDvhmf2yyGx09bSKXaEOaPpEprhQU0qdAD1b079iz3I9JkebSid8xByEk0EIcGjzVaDeg6/qpQOGKhOd4rCgkun7UwqlN8nF3eZI2/UgLktdafwSqmtZWpchTGxVHka+g63OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906452; c=relaxed/simple;
	bh=6MQWjk9+Dzh27L3azGQ0+9cE7iXW1DcPz6p0bq0Z0gk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WhLPvpHnc2hyWTfqhq0d4A+D99I6ogfj2XAVo3yVHj8J96f+Mpr6mKZIl5iKUWt44c5xLjDE35Yz0LdDDIpBvv7sURgQ/+Bf4eouW8Rv1V3gUBG7DMKmWYSlRuXllJ3npIkb8XfIUMHxzjA6JFiK6yfKgPTEKUbIwapVVJucsAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=sxJrGWrb; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52bc335e49aso1281896e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906448; x=1719511248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16QUiXjV5RqLJm65NVMVeCxJAwMSscf6kIqElrOUYSA=;
        b=sxJrGWrbpCJZs9yABkdi0IFRnz14YVEJfvwLaLAD+EdgMe0fRzUhezbXVI405Qo4p2
         KX/sZx8C69gqMGdoI4iRLev19nUD5LZ01WbnNKXxCIulfUDE3MyWM9rLm3Qyn7pyucKC
         3vvONc+qp961IQH8Z2s5DDwFlNSGL3zzZW3JLxGLk0q/54N8DT+JWNDjk+mNfg3zG+4V
         s+HI6bVKR8keo0DlToeSVngnFRSchkoh+bLV5cGfQ27ao+KJCG6FhTcoSzTSK4tEImoe
         h0wvGRc4085n8dOeJE2pgJFiu51Z+VAMjE43Cf9HRhOdLcievmknSzchxFLzXS+B2867
         862Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906448; x=1719511248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16QUiXjV5RqLJm65NVMVeCxJAwMSscf6kIqElrOUYSA=;
        b=qMDs+1oRGLaHnQZj8nDgspMgsh9tudhbQstjfGQskp+8buRlvgJQ/ZSrNoeVdfzGVc
         1lv1I+Aje6HCrLPfltRh+DEwy6InweIPFuvNHkHHV2Zp0YvrB+1IQMd3raHUrK8GhBQV
         wPFLT2e4Bjbrkf1EV7nmkXY7dKo5YUr6EaOzxUSAbGWPn3R2pJsFtPczhIZaXNaFSnfq
         1Hr3hY27JrVb9shx09XgVl7f6aVHU9kun0U2+4TZ9PunpVHhCN823xdy7i+AbKgSIzAr
         LKXNHL2R06tJ6h7DJwIQUyw7qDEmXkcrUptEZkJsKFsyuzrliqmj1k8qkDGK/QCeS8X6
         KrDw==
X-Forwarded-Encrypted: i=1; AJvYcCVKKRY3rVVZov3+ZVal81fi5oRF2zjOXGY4yPpTg22iGvvNdasTKLgdxLrttU5lkMi0N9V+GNK7jWQDM2miVcxbFC61/gOs37vh
X-Gm-Message-State: AOJu0YylLzgWTiMr27SLUF1AEazZBMofJEegu8SW+IAQIEWk2eXRMYUm
	9eubJnSlgSkbJsngqMa69yhbxqRwsR4Uq9XDdrz8UL7KaEyHrO9uZ0krvM+I5gQ=
X-Google-Smtp-Source: AGHT+IFVjG6OxlqsV0jNomIZa08ujwP9GIncUbRlmCYjEhgAIYwUU7qYmfHbHKXMk0pQ2b59dpN8qw==
X-Received: by 2002:a05:6512:2396:b0:52c:ce28:82ae with SMTP id 2adb3069b0e04-52cce288450mr3294335e87.55.1718906447653;
        Thu, 20 Jun 2024 11:00:47 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.11.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 11:00:47 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 09/10] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
Date: Thu, 20 Jun 2024 19:56:40 +0200
Message-Id: <20240620175657.358273-10-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver was ported from an old version in linux 2.6.27 and adjusted
for the new ASoC framework and DMA API.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- Add to MAINTAINERS
- Use guard(mutex)(&i2s_info_p->lock) when possible
- Request dma chennels using DT entries in devm_snd_dmaengine_pcm_register

Changes for v3:
- Split previous commit for separate subsystems
- Add support and <jonathan.downing@nautel.com> as a maintainer for the driver
- Replaced `SND_SOC` config dependency with COMPILE_TEST
- Moved `snd-soc-fsl-lpc3xxx-y` in Makefile up in the list to maintain alfabedical order
- Changed comment to c++ format
- replaced custom absd32() with standard abs() function
- Added clock provider check in lpc3xxx_i2s_set_dai_fmt()
- Removed empty lpc32xx_i2s_remove() function
- Reworked i2s regs definitions to include LPC3XXX prefix
- Replaced custom _BIT, _SBD with standard BIT and FIELD_PREP macros

Changes for v2:
- Coding Style cleanup
- Use dev_err_probe() for error handling in probe function
- Removed unneded err_clk_disable label
- Removed empty function
- Droped of_match_ptr in lpc32xx_i2s_match DT match table
- ASoC struct adjustmes for the latest 6.10-rc3 kernel

 MAINTAINERS                 |   1 +
 sound/soc/fsl/Kconfig       |   7 +
 sound/soc/fsl/Makefile      |   2 +
 sound/soc/fsl/lpc3xxx-i2s.c | 376 ++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/lpc3xxx-i2s.h |  79 ++++++++
 sound/soc/fsl/lpc3xxx-pcm.c |  73 +++++++
 6 files changed, 538 insertions(+)
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
 create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
 create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ffe988ee282..2705f48c967d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8927,6 +8927,7 @@ L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
+F:	sound/soc/fsl/lpc3xxx-*
 N:	lpc32xx
 
 FREESCALE SOC SOUND QMC DRIVER
diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 270726c134b3..72f2d4d15696 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -130,6 +130,13 @@ config SND_SOC_FSL_RPMSG
 	  This option is only useful for out-of-tree drivers since
 	  in-tree drivers select it automatically.
 
+config SND_SOC_FSL_LPC3XXX
+	tristate "SoC Audio for NXP LPC32XX CPUs"
+	depends on ARCH_LPC32XX || COMPILE_TEST
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Say Y or M if you want to add support for the LPC3XXX I2S interface.
+
 config SND_SOC_IMX_PCM_DMA
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 2fe78eed3a48..2a61e2f96438 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SND_SOC_P1022_RDK) += snd-soc-p1022-rdk.o
 snd-soc-fsl-audmix-y := fsl_audmix.o
 snd-soc-fsl-asoc-card-y := fsl-asoc-card.o
 snd-soc-fsl-asrc-y := fsl_asrc.o fsl_asrc_dma.o
+snd-soc-fsl-lpc3xxx-y := lpc3xxx-pcm.o lpc3xxx-i2s.o
 snd-soc-fsl-sai-y := fsl_sai.o
 snd-soc-fsl-ssi-y := fsl_ssi.o
 snd-soc-fsl-ssi-$(CONFIG_DEBUG_FS) += fsl_ssi_dbg.o
@@ -29,6 +30,7 @@ snd-soc-fsl-qmc-audio-y := fsl_qmc_audio.o
 obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
 obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
 obj-$(CONFIG_SND_SOC_FSL_ASRC) += snd-soc-fsl-asrc.o
+obj-$(CONFIG_SND_SOC_FSL_LPC3XXX) += snd-soc-fsl-lpc3xxx.o
 obj-$(CONFIG_SND_SOC_FSL_SAI) += snd-soc-fsl-sai.o
 obj-$(CONFIG_SND_SOC_FSL_SSI) += snd-soc-fsl-ssi.o
 obj-$(CONFIG_SND_SOC_FSL_SPDIF) += snd-soc-fsl-spdif.o
diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
new file mode 100644
index 000000000000..7fdba451c643
--- /dev/null
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Author: Kevin Wells <kevin.wells@nxp.com>
+//
+// Copyright (C) 2008 NXP Semiconductors
+// Copyright 2023 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
+#include <sound/soc.h>
+
+#include "lpc3xxx-i2s.h"
+
+#define I2S_PLAYBACK_FLAG 0x1
+#define I2S_CAPTURE_FLAG 0x2
+
+#define LPC3XXX_I2S_RATES ( \
+	SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 | \
+	SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
+	SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
+
+#define LPC3XXX_I2S_FORMATS ( \
+	SNDRV_PCM_FMTBIT_S8 | \
+	SNDRV_PCM_FMTBIT_S16_LE | \
+	SNDRV_PCM_FMTBIT_S32_LE)
+
+static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clky, int freq, int xbytes, u32 clkrate)
+{
+	u32 i2srate;
+	u32 idxx, idyy;
+	u32 savedbitclkrate, diff, trate, baseclk;
+
+	/* Adjust rate for sample size (bits) and 2 channels and offset for
+	 * divider in clock output
+	 */
+	i2srate = (freq / 100) * 2 * (8 * xbytes);
+	i2srate = i2srate << 1;
+	clkrate = clkrate / 100;
+	baseclk = clkrate;
+	*clkx = 1;
+	*clky = 1;
+
+	/* Find the best divider */
+	*clkx = *clky = 0;
+	savedbitclkrate = 0;
+	diff = ~0;
+	for (idxx = 1; idxx < 0xFF; idxx++) {
+		for (idyy = 1; idyy < 0xFF; idyy++) {
+			trate = (baseclk * idxx) / idyy;
+			if (abs(trate - i2srate) < diff) {
+				diff = abs(trate - i2srate);
+				savedbitclkrate = trate;
+				*clkx = idxx;
+				*clky = idyy;
+			}
+		}
+	}
+}
+
+static int lpc3xxx_i2s_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_info_p->dev;
+	u32 flag;
+	int ret = 0;
+
+	guard(mutex)(&i2s_info_p->lock);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		flag = I2S_PLAYBACK_FLAG;
+	else
+		flag = I2S_CAPTURE_FLAG;
+
+	if (flag & i2s_info_p->streams_in_use) {
+		dev_warn(dev, "I2S channel is busy\n");
+		ret = -EBUSY;
+		return ret;
+	}
+
+	if (i2s_info_p->streams_in_use == 0) {
+		ret = clk_prepare_enable(i2s_info_p->clk);
+		if (ret) {
+			dev_err(dev, "Can't enable clock, err=%d\n", ret);
+			return ret;
+		}
+	}
+
+	i2s_info_p->streams_in_use |= flag;
+	return 0;
+}
+
+static void lpc3xxx_i2s_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regs = i2s_info_p->regs;
+	const u32 stop_bits = (LPC3XXX_I2S_RESET | LPC3XXX_I2S_STOP);
+	u32 flag;
+
+	guard(mutex)(&i2s_info_p->lock);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		flag = I2S_PLAYBACK_FLAG;
+		regmap_write(regs, LPC3XXX_REG_I2S_TX_RATE, 0);
+		regmap_update_bits(regs, LPC3XXX_REG_I2S_DAO, stop_bits, stop_bits);
+	} else {
+		flag = I2S_CAPTURE_FLAG;
+		regmap_write(regs, LPC3XXX_REG_I2S_RX_RATE, 0);
+		regmap_update_bits(regs, LPC3XXX_REG_I2S_DAI, stop_bits, stop_bits);
+	}
+	i2s_info_p->streams_in_use &= ~flag;
+
+	if (i2s_info_p->streams_in_use == 0)
+		clk_disable_unprepare(i2s_info_p->clk);
+}
+
+static int lpc3xxx_i2s_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
+				      int clk_id, unsigned int freq, int dir)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+
+	/* Will use in HW params later */
+	i2s_info_p->freq = freq;
+
+	return 0;
+}
+
+static int lpc3xxx_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_info_p->dev;
+
+	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_I2S) {
+		dev_warn(dev, "unsupported bus format %d\n", fmt);
+		return -EINVAL;
+	}
+
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_BP_FP) {
+		dev_warn(dev, "unsupported clock provider %d\n", fmt);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int lpc3xxx_i2s_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct device *dev = i2s_info_p->dev;
+	struct regmap *regs = i2s_info_p->regs;
+	int xfersize;
+	u32 tmp, clkx, clky;
+
+	tmp = LPC3XXX_I2S_RESET | LPC3XXX_I2S_STOP;
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		tmp |= LPC3XXX_I2S_WW8 | LPC3XXX_I2S_WS_HP(LPC3XXX_I2S_WW8_HP);
+		xfersize = 1;
+		break;
+
+	case SNDRV_PCM_FORMAT_S16_LE:
+		tmp |= LPC3XXX_I2S_WW16 | LPC3XXX_I2S_WS_HP(LPC3XXX_I2S_WW16_HP);
+		xfersize = 2;
+		break;
+
+	case SNDRV_PCM_FORMAT_S32_LE:
+		tmp |= LPC3XXX_I2S_WW32 | LPC3XXX_I2S_WS_HP(LPC3XXX_I2S_WW32_HP);
+		xfersize = 4;
+		break;
+
+	default:
+		dev_warn(dev, "Unsupported audio data format %d\n", params_format(params));
+		return -EINVAL;
+	}
+
+	if (params_channels(params) == 1)
+		tmp |= LPC3XXX_I2S_MONO;
+
+	__lpc3xxx_find_clkdiv(&clkx, &clky, i2s_info_p->freq, xfersize, i2s_info_p->clkrate);
+
+	dev_dbg(dev, "Stream                : %s\n",
+		substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+	dev_dbg(dev, "Desired clock rate    : %d\n", i2s_info_p->freq);
+	dev_dbg(dev, "Base clock rate       : %d\n", i2s_info_p->clkrate);
+	dev_dbg(dev, "Transfer size (bytes) : %d\n", xfersize);
+	dev_dbg(dev, "Clock divider (x)     : %d\n", clkx);
+	dev_dbg(dev, "Clock divider (y)     : %d\n", clky);
+	dev_dbg(dev, "Channels              : %d\n", params_channels(params));
+	dev_dbg(dev, "Data format           : %s\n", "I2S");
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		regmap_write(regs, LPC3XXX_REG_I2S_DMA1,
+			     LPC3XXX_I2S_DMA1_TX_EN | LPC3XXX_I2S_DMA0_TX_DEPTH(4));
+		regmap_write(regs, LPC3XXX_REG_I2S_TX_RATE, (clkx << 8) | clky);
+		regmap_write(regs, LPC3XXX_REG_I2S_DAO, tmp);
+	} else {
+		regmap_write(regs, LPC3XXX_REG_I2S_DMA0,
+			     LPC3XXX_I2S_DMA0_RX_EN | LPC3XXX_I2S_DMA1_RX_DEPTH(4));
+		regmap_write(regs, LPC3XXX_REG_I2S_RX_RATE, (clkx << 8) | clky);
+		regmap_write(regs, LPC3XXX_REG_I2S_DAI, tmp);
+	}
+
+	return 0;
+}
+
+static int lpc3xxx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+			       struct snd_soc_dai *cpu_dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(cpu_dai);
+	struct regmap *regs = i2s_info_p->regs;
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_update_bits(regs, LPC3XXX_REG_I2S_DAO,
+					   LPC3XXX_I2S_STOP, LPC3XXX_I2S_STOP);
+		else
+			regmap_update_bits(regs, LPC3XXX_REG_I2S_DAI,
+					   LPC3XXX_I2S_STOP, LPC3XXX_I2S_STOP);
+		break;
+
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_update_bits(regs, LPC3XXX_REG_I2S_DAO,
+					   (LPC3XXX_I2S_RESET | LPC3XXX_I2S_STOP), 0);
+		else
+			regmap_update_bits(regs, LPC3XXX_REG_I2S_DAI,
+					   (LPC3XXX_I2S_RESET | LPC3XXX_I2S_STOP), 0);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int lpc3xxx_i2s_dai_probe(struct snd_soc_dai *dai)
+{
+	struct lpc3xxx_i2s_info *i2s_info_p = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &i2s_info_p->playback_dma_config,
+				  &i2s_info_p->capture_dma_config);
+	return 0;
+}
+
+const struct snd_soc_dai_ops lpc3xxx_i2s_dai_ops = {
+	.probe	= lpc3xxx_i2s_dai_probe,
+	.startup = lpc3xxx_i2s_startup,
+	.shutdown = lpc3xxx_i2s_shutdown,
+	.trigger = lpc3xxx_i2s_trigger,
+	.hw_params = lpc3xxx_i2s_hw_params,
+	.set_sysclk = lpc3xxx_i2s_set_dai_sysclk,
+	.set_fmt = lpc3xxx_i2s_set_dai_fmt,
+};
+
+struct snd_soc_dai_driver lpc3xxx_i2s_dai_driver = {
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = LPC3XXX_I2S_RATES,
+		.formats = LPC3XXX_I2S_FORMATS,
+		},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = LPC3XXX_I2S_RATES,
+		.formats = LPC3XXX_I2S_FORMATS,
+		},
+	.ops = &lpc3xxx_i2s_dai_ops,
+	.symmetric_rate = 1,
+	.symmetric_channels = 1,
+	.symmetric_sample_bits = 1,
+};
+
+static const struct snd_soc_component_driver lpc32xx_i2s_component = {
+	.name = "lpc32xx-i2s",
+	.legacy_dai_naming = 1,
+};
+
+static const struct regmap_config lpc32xx_i2s_regconfig = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = LPC3XXX_REG_I2S_RX_RATE,
+};
+
+static int lpc32xx_i2s_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct lpc3xxx_i2s_info *i2s_info_p;
+	struct resource *res;
+	void __iomem *iomem;
+	const char *filter_data;
+	int ret;
+
+	i2s_info_p = devm_kzalloc(dev, sizeof(*i2s_info_p), GFP_KERNEL);
+	if (!i2s_info_p)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, i2s_info_p);
+	i2s_info_p->dev = dev;
+
+	iomem = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(iomem))
+		return dev_err_probe(dev, PTR_ERR(iomem), "Can't map registers\n");
+
+	i2s_info_p->regs = devm_regmap_init_mmio(dev, iomem, &lpc32xx_i2s_regconfig);
+	if (IS_ERR(i2s_info_p->regs))
+		return dev_err_probe(dev, PTR_ERR(i2s_info_p->regs),
+				     "failed to init register map: %d\n", ret);
+
+	i2s_info_p->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(i2s_info_p->clk))
+		return dev_err_probe(dev, PTR_ERR(i2s_info_p->clk), "Can't get clock\n");
+
+	i2s_info_p->clkrate = clk_get_rate(i2s_info_p->clk);
+	if (i2s_info_p->clkrate == 0)
+		return dev_err_probe(dev, -EINVAL, "Invalid returned clock rate\n");
+
+	mutex_init(&i2s_info_p->lock);
+
+	ret = devm_snd_soc_register_component(dev, &lpc32xx_i2s_component,
+					      &lpc3xxx_i2s_dai_driver, 1);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't register cpu_dai component\n");
+
+	i2s_info_p->playback_dma_config.addr = (dma_addr_t)(res->start + LPC3XXX_REG_I2S_TX_FIFO);
+	i2s_info_p->playback_dma_config.maxburst = 4;
+
+	i2s_info_p->capture_dma_config.addr = (dma_addr_t)(res->start + LPC3XXX_REG_I2S_RX_FIFO);
+	i2s_info_p->capture_dma_config.maxburst = 4;
+
+	ret = lpc3xxx_pcm_register(pdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't register pcm component\n");
+
+	return 0;
+}
+
+static const struct of_device_id lpc32xx_i2s_match[] = {
+	{ .compatible = "nxp,lpc3220-i2s" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, lpc32xx_i2s_match);
+
+static struct platform_driver lpc32xx_i2s_driver = {
+	.probe = lpc32xx_i2s_probe,
+	.driver		= {
+		.name	= "lpc3xxx-i2s",
+		.of_match_table = lpc32xx_i2s_match,
+	},
+};
+
+module_platform_driver(lpc32xx_i2s_driver);
+
+MODULE_AUTHOR("Kevin Wells <kevin.wells@nxp.com>");
+MODULE_AUTHOR("Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>");
+MODULE_DESCRIPTION("ASoC LPC3XXX I2S interface");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/fsl/lpc3xxx-i2s.h b/sound/soc/fsl/lpc3xxx-i2s.h
new file mode 100644
index 000000000000..eec755448478
--- /dev/null
+++ b/sound/soc/fsl/lpc3xxx-i2s.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Author: Kevin Wells <kevin.wells@nxp.com>
+ *
+ * Copyright (C) 2008 NXP Semiconductors
+ * Copyright 2023 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+ */
+
+#ifndef __SOUND_SOC_LPC3XXX_I2S_H
+#define __SOUND_SOC_LPC3XXX_I2S_H
+
+#include <linux/types.h>
+#include <linux/regmap.h>
+
+struct lpc3xxx_i2s_info {
+	struct device *dev;
+	struct clk *clk;
+	struct mutex lock; /* To serialize user-space access */
+	struct regmap *regs;
+	u32 streams_in_use;
+	u32 clkrate;
+	int freq;
+	struct snd_dmaengine_dai_dma_data playback_dma_config;
+	struct snd_dmaengine_dai_dma_data capture_dma_config;
+};
+
+int lpc3xxx_pcm_register(struct platform_device *pdev);
+
+/* I2S controller register offsets */
+#define LPC3XXX_REG_I2S_DAO		0x00
+#define LPC3XXX_REG_I2S_DAI		0x04
+#define LPC3XXX_REG_I2S_TX_FIFO	0x08
+#define LPC3XXX_REG_I2S_RX_FIFO	0x0C
+#define LPC3XXX_REG_I2S_STAT	0x10
+#define LPC3XXX_REG_I2S_DMA0	0x14
+#define LPC3XXX_REG_I2S_DMA1	0x18
+#define LPC3XXX_REG_I2S_IRQ		0x1C
+#define LPC3XXX_REG_I2S_TX_RATE	0x20
+#define LPC3XXX_REG_I2S_RX_RATE	0x24
+
+/* i2s_daO i2s_dai register definitions */
+#define LPC3XXX_I2S_WW8      FIELD_PREP(0x3, 0) /* Word width is 8bit */
+#define LPC3XXX_I2S_WW16     FIELD_PREP(0x3, 1) /* Word width is 16bit */
+#define LPC3XXX_I2S_WW32     FIELD_PREP(0x3, 3) /* Word width is 32bit */
+#define LPC3XXX_I2S_MONO     BIT(2)   /* Mono */
+#define LPC3XXX_I2S_STOP     BIT(3)   /* Stop, diables the access to FIFO, mutes the channel */
+#define LPC3XXX_I2S_RESET    BIT(4)   /* Reset the channel */
+#define LPC3XXX_I2S_WS_SEL   BIT(5)   /* Channel Master(0) or slave(1) mode select */
+#define LPC3XXX_I2S_WS_HP(s) FIELD_PREP(0x7FC0, s) /* Word select half period - 1 */
+#define LPC3XXX_I2S_MUTE     BIT(15)  /* Mute the channel, Transmit channel only */
+
+#define LPC3XXX_I2S_WW32_HP  0x1f /* Word select half period for 32bit word width */
+#define LPC3XXX_I2S_WW16_HP  0x0f /* Word select half period for 16bit word width */
+#define LPC3XXX_I2S_WW8_HP   0x7  /* Word select half period for 8bit word width */
+
+/* i2s_stat register definitions */
+#define LPC3XXX_I2S_IRQ_STAT     BIT(0)
+#define LPC3XXX_I2S_DMA0_REQ     BIT(1)
+#define LPC3XXX_I2S_DMA1_REQ     BIT(2)
+
+/* i2s_dma0 Configuration register definitions */
+#define LPC3XXX_I2S_DMA0_RX_EN     BIT(0)       /* Enable RX DMA1 */
+#define LPC3XXX_I2S_DMA0_TX_EN     BIT(1)       /* Enable TX DMA1 */
+#define LPC3XXX_I2S_DMA0_RX_DEPTH(s) FIELD_PREP(0xF00, s)  /* Set the DMA1 RX Request level */
+#define LPC3XXX_I2S_DMA0_TX_DEPTH(s) FIELD_PREP(0xF0000, s) /* Set the DMA1 TX Request level */
+
+/* i2s_dma1 Configuration register definitions */
+#define LPC3XXX_I2S_DMA1_RX_EN     BIT(0)       /* Enable RX DMA1 */
+#define LPC3XXX_I2S_DMA1_TX_EN     BIT(1)       /* Enable TX DMA1 */
+#define LPC3XXX_I2S_DMA1_RX_DEPTH(s) FIELD_PREP(0x700, s) /* Set the DMA1 RX Request level */
+#define LPC3XXX_I2S_DMA1_TX_DEPTH(s) FIELD_PREP(0x70000, s) /* Set the DMA1 TX Request level */
+
+/* i2s_irq register definitions */
+#define LPC3XXX_I2S_RX_IRQ_EN     BIT(0)       /* Enable RX IRQ */
+#define LPC3XXX_I2S_TX_IRQ_EN     BIT(1)       /* Enable TX IRQ */
+#define LPC3XXX_I2S_IRQ_RX_DEPTH(s)  FIELD_PREP(0xFF00, s)  /* valid values ar 0 to 7 */
+#define LPC3XXX_I2S_IRQ_TX_DEPTH(s)  FIELD_PREP(0xFF0000, s) /* valid values ar 0 to 7 */
+
+#endif
diff --git a/sound/soc/fsl/lpc3xxx-pcm.c b/sound/soc/fsl/lpc3xxx-pcm.c
new file mode 100644
index 000000000000..80f3780d1a0c
--- /dev/null
+++ b/sound/soc/fsl/lpc3xxx-pcm.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Author: Kevin Wells <kevin.wells@nxp.com>
+//
+// Copyright (C) 2008 NXP Semiconductors
+// Copyright 2023 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/dma-mapping.h>
+#include <linux/amba/pl08x.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/soc.h>
+
+#include "lpc3xxx-i2s.h"
+
+#define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S8 | \
+			SNDRV_PCM_FMTBIT_U8 | \
+			SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_U16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_U24_LE | \
+			SNDRV_PCM_FMTBIT_S32_LE | \
+			SNDRV_PCM_FMTBIT_U32_LE | \
+			SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
+
+static const struct snd_pcm_hardware lpc3xxx_pcm_hardware = {
+	.info = (SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_MMAP_VALID |
+		 SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		 SNDRV_PCM_INFO_PAUSE |
+		 SNDRV_PCM_INFO_RESUME),
+	.formats = STUB_FORMATS,
+	.period_bytes_min = 128,
+	.period_bytes_max = 2048,
+	.periods_min = 2,
+	.periods_max = 1024,
+	.buffer_bytes_max = 128 * 1024
+};
+
+static const struct snd_dmaengine_pcm_config lpc3xxx_dmaengine_pcm_config = {
+	.pcm_hardware = &lpc3xxx_pcm_hardware,
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+	.compat_filter_fn = pl08x_filter_id,
+	.prealloc_buffer_size = 128 * 1024,
+};
+
+const struct snd_soc_component_driver lpc3xxx_soc_platform_driver = {
+	.name = "lpc32xx-pcm",
+};
+
+int lpc3xxx_pcm_register(struct platform_device *pdev)
+{
+	int ret;
+	int flags;
+
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, &lpc3xxx_dmaengine_pcm_config, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register dmaengine: %d\n", ret);
+		return ret;
+	}
+
+	return devm_snd_soc_register_component(&pdev->dev, &lpc3xxx_soc_platform_driver,
+					       NULL, 0);
+}
+EXPORT_SYMBOL(lpc3xxx_pcm_register);
-- 
2.25.1


