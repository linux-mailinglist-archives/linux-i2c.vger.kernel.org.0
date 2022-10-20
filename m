Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2204606B27
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Oct 2022 00:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiJTWUS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Oct 2022 18:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbiJTWUR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Oct 2022 18:20:17 -0400
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41D9CE992;
        Thu, 20 Oct 2022 15:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl;
        s=tartarus; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
        Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=rg9PF2cWJRiRYlck/ljQ+1z8FnRbQBWQJQ+kEQWkJkM=; b=p9Qjc/Rz3MaZGP842oDB1HutD9
        pyQvh/HAwIfGRAJp2Av8vVNxafbO+mjCjOggo2n4FiT03wBAzVT2RjrwI6Hu51yH4lAGd1mqoyYCI
        ikYlmxvNdq+jZU33TdZFN9mYB6yJbx+eqOHa4wvp2zUHwmJj9s5eor7zZw/ZfUv2A39c=;
Received: from localhost ([127.0.0.1] helo=valinor.angband.pl)
        by tartarus.angband.pl with smtp (Exim 4.94.2)
        (envelope-from <kilobyte@valinor.angband.pl>)
        id 1oldrk-009OEK-N9; Fri, 21 Oct 2022 00:18:16 +0200
Received: (nullmailer pid 33760 invoked by uid 1000);
        Thu, 20 Oct 2022 22:18:15 -0000
From:   Adam Borowski <kilobyte@angband.pl>
To:     linux-kernel@lists.debian.org
Cc:     Adam Borowski <kilobyte@angband.pl>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
        Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Brent Lu <brent.lu@intel.com>
Subject: [PATCH 0/6] a pile of randconfig fixes
Date:   Fri, 21 Oct 2022 00:17:49 +0200
Message-Id: <20221020221749.33746-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kilobyte@valinor.angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!
I've been doing randconfig build tests for quite a while, here's a pile of
fixes.  I'm not sure what's the best way to submit these: do you folks
prefer a series like this, or a number of individual submissions?

With these applied, it seems that archs I run (64-bit x86 arm riscv) are
clean now -- at least for the values of "haven't failed build in a while".

My restrictions were:
[amd64]
CONFIG_64BIT=y
CONFIG_COMPILE_TEST=y
CONFIG_AIC79XX_BUILD_FIRMWARE=n
CONFIG_AIC7XXX_BUILD_FIRMWARE=n
[arm64]
CONFIG_AIC79XX_BUILD_FIRMWARE=n
CONFIG_AIC7XXX_BUILD_FIRMWARE=n
[riscv64]
!CONFIG_ARCH_RV32I=y #yay "selects"
CONFIG_CMODEL_MEDANY=y
CONFIG_BPF_PRELOAD_UMD=n
CONFIG_AIC79XX_BUILD_FIRMWARE=n
CONFIG_AIC7XXX_BUILD_FIRMWARE=n
and applied fixes for dwc3-qcom riscv_cbom_block_size dump_emit_page
riscv:jump_label.

All builds were done with gcc-12 on Debian unstable.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁
⢿⡄⠘⠷⠚⠋⠀ Quis trollabit ipsos trollos?
⠈⠳⣄⠀⠀⠀⠀


From 0d8157cf874b80deb072cb26e0f84c02f5ef0b15 Mon Sep 17 00:00:00 2001
From: Adam Borowski <kilobyte@angband.pl>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Date: Wed, 14 Sep 2022 22:06:51 +0200
Subject: [PATCH 1/6] ASoC: mediatek: mt8186: fix an "unused" warning

This, and a whole bunch of referenced functions are not needed without
CONFIG_OF.  The warning makes the build fail under CONFIG_WERROR.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index cfca6bdee834..b15e97bd9d4d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -1000,7 +1000,7 @@ mt8186_mt6366_da7219_max98357_controls[] = {
 	SOC_DAPM_PIN_SWITCH("HDMI1"),
 };
 
-static struct snd_soc_card mt8186_mt6366_da7219_max98357_soc_card = {
+static __maybe_unused struct snd_soc_card mt8186_mt6366_da7219_max98357_soc_card = {
 	.name = "mt8186_da7219_max98357",
 	.owner = THIS_MODULE,
 	.dai_link = mt8186_mt6366_da7219_max98357_dai_links,
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 2414c5b77233..22ce2f849909 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -976,7 +976,7 @@ mt8186_mt6366_rt1019_rt5682s_controls[] = {
 	SOC_DAPM_PIN_SWITCH("HDMI1"),
 };
 
-static struct snd_soc_card mt8186_mt6366_rt1019_rt5682s_soc_card = {
+static __maybe_unused struct snd_soc_card mt8186_mt6366_rt1019_rt5682s_soc_card = {
 	.name = "mt8186_rt1019_rt5682s",
 	.owner = THIS_MODULE,
 	.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
-- 
2.37.2.609.g9ff673ca1a


From c11d7b580c8237a5445bf043db9f37cbdf6e5590 Mon Sep 17 00:00:00 2001
From: Adam Borowski <kilobyte@angband.pl>
To: David Howells <dhowells@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 14 Sep 2022 22:13:43 +0200
Subject: [PATCH 2/6] certs: fips test: fix build failure with
 PKCS7_MESSAGE_PARSER=m

ld: crypto/asymmetric_keys/selftest.o: in function `fips_signature_selftest':
selftest.c:(.init.text+0xcd): undefined reference to `pkcs7_parse_message'
ld: selftest.c:(.init.text+0x103): undefined reference to `pkcs7_supply_detached_data'
ld: selftest.c:(.init.text+0x10d): undefined reference to `pkcs7_verify'
ld: selftest.c:(.init.text+0x135): undefined reference to `pkcs7_validate_trust'
ld: selftest.c:(.init.text+0x157): undefined reference to `pkcs7_free_message'

Fixes: 3cde3174eb910513d32a9ec8a9b95ea59be833df
Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 crypto/asymmetric_keys/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index 3df3fe4ed95f..fe007db96c69 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -83,6 +83,6 @@ config FIPS_SIGNATURE_SELFTEST
 	  for FIPS.
 	depends on KEYS
 	depends on ASYMMETRIC_KEY_TYPE
-	depends on PKCS7_MESSAGE_PARSER
+	depends on PKCS7_MESSAGE_PARSER=y
 
 endif # ASYMMETRIC_KEY_TYPE
-- 
2.37.2.609.g9ff673ca1a


From 582ea8837c41dc1bc738c2bd4e01c85bc2bd3ba3 Mon Sep 17 00:00:00 2001
From: Adam Borowski <kilobyte@angband.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 14 Sep 2022 23:29:09 +0200
Subject: [PATCH 3/6] mtd: eject cfi_interleave code to its own header

This fixes build failures for stuff that doesn't care about that, such as:

In file included from ./include/linux/mtd/spi-nor.h:10,
                 from drivers/spi/spi-intel.c:13:
./include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support
   62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
      |  ^~~~~~~

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |  1 +
 drivers/mtd/chips/cfi_cmdset_0002.c |  1 +
 drivers/mtd/chips/cfi_cmdset_0020.c |  1 +
 drivers/mtd/chips/cfi_util.c        |  1 +
 drivers/mtd/chips/gen_probe.c       |  1 +
 drivers/mtd/chips/jedec_probe.c     |  1 +
 include/linux/mtd/cfi.h             | 75 --------------------------
 include/linux/mtd/cfi_interleave.h  | 83 +++++++++++++++++++++++++++++
 8 files changed, 89 insertions(+), 75 deletions(-)
 create mode 100644 include/linux/mtd/cfi_interleave.h

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 54f92d09d9cf..efbf06fce95b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -34,6 +34,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 
 /* #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE */
 /* #define CMDSET0001_DISABLE_WRITE_SUSPEND */
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 67453f59c69c..70d00c3641d8 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -37,6 +37,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 #include <linux/mtd/xip.h>
 
 #define AMD_BOOTLOC_BUG
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index d35df526e0a6..007e37faff56 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -31,6 +31,7 @@
 #include <linux/interrupt.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 #include <linux/mtd/mtd.h>
 
 
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 6a6a2a21d2ed..608315032f9e 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -22,6 +22,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 
 void cfi_udelay(int us)
 {
diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 4d4f97841016..8703890ff20e 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -10,6 +10,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 #include <linux/mtd/gen_probe.h>
 
 static struct mtd_info *check_cmd_set(struct map_info *, int);
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 6f7e7e1b3fe5..88a979bb59bb 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -20,6 +20,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/cfi_interleave.h>
 #include <linux/mtd/gen_probe.h>
 
 /* AMD */
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index d88bb56c18e2..4a8ddb51afee 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -8,87 +8,12 @@
 
 #include <linux/delay.h>
 #include <linux/types.h>
-#include <linux/bug.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi_endian.h>
 #include <linux/mtd/xip.h>
 
-#ifdef CONFIG_MTD_CFI_I1
-#define cfi_interleave(cfi) 1
-#define cfi_interleave_is_1(cfi) (cfi_interleave(cfi) == 1)
-#else
-#define cfi_interleave_is_1(cfi) (0)
-#endif
-
-#ifdef CONFIG_MTD_CFI_I2
-# ifdef cfi_interleave
-#  undef cfi_interleave
-#  define cfi_interleave(cfi) ((cfi)->interleave)
-# else
-#  define cfi_interleave(cfi) 2
-# endif
-#define cfi_interleave_is_2(cfi) (cfi_interleave(cfi) == 2)
-#else
-#define cfi_interleave_is_2(cfi) (0)
-#endif
-
-#ifdef CONFIG_MTD_CFI_I4
-# ifdef cfi_interleave
-#  undef cfi_interleave
-#  define cfi_interleave(cfi) ((cfi)->interleave)
-# else
-#  define cfi_interleave(cfi) 4
-# endif
-#define cfi_interleave_is_4(cfi) (cfi_interleave(cfi) == 4)
-#else
-#define cfi_interleave_is_4(cfi) (0)
-#endif
-
-#ifdef CONFIG_MTD_CFI_I8
-# ifdef cfi_interleave
-#  undef cfi_interleave
-#  define cfi_interleave(cfi) ((cfi)->interleave)
-# else
-#  define cfi_interleave(cfi) 8
-# endif
-#define cfi_interleave_is_8(cfi) (cfi_interleave(cfi) == 8)
-#else
-#define cfi_interleave_is_8(cfi) (0)
-#endif
-
-#ifndef cfi_interleave
-#warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
-static inline int cfi_interleave(void *cfi)
-{
-	BUG();
-	return 0;
-}
-#endif
-
-static inline int cfi_interleave_supported(int i)
-{
-	switch (i) {
-#ifdef CONFIG_MTD_CFI_I1
-	case 1:
-#endif
-#ifdef CONFIG_MTD_CFI_I2
-	case 2:
-#endif
-#ifdef CONFIG_MTD_CFI_I4
-	case 4:
-#endif
-#ifdef CONFIG_MTD_CFI_I8
-	case 8:
-#endif
-		return 1;
-
-	default:
-		return 0;
-	}
-}
-
 
 /* NB: these values must represents the number of bytes needed to meet the
  *     device type (x8, x16, x32).  Eg. a 32 bit device is 4 x 8 bytes.
diff --git a/include/linux/mtd/cfi_interleave.h b/include/linux/mtd/cfi_interleave.h
new file mode 100644
index 000000000000..03d94a6d11fc
--- /dev/null
+++ b/include/linux/mtd/cfi_interleave.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __MTD_CFI_INTERLEAVE_H__
+#define __MTD_CFI_INTERLEAVE_H__
+
+#include <linux/bug.h>
+
+#ifdef CONFIG_MTD_CFI_I1
+#define cfi_interleave(cfi) 1
+#define cfi_interleave_is_1(cfi) (cfi_interleave(cfi) == 1)
+#else
+#define cfi_interleave_is_1(cfi) (0)
+#endif
+
+#ifdef CONFIG_MTD_CFI_I2
+# ifdef cfi_interleave
+#  undef cfi_interleave
+#  define cfi_interleave(cfi) ((cfi)->interleave)
+# else
+#  define cfi_interleave(cfi) 2
+# endif
+#define cfi_interleave_is_2(cfi) (cfi_interleave(cfi) == 2)
+#else
+#define cfi_interleave_is_2(cfi) (0)
+#endif
+
+#ifdef CONFIG_MTD_CFI_I4
+# ifdef cfi_interleave
+#  undef cfi_interleave
+#  define cfi_interleave(cfi) ((cfi)->interleave)
+# else
+#  define cfi_interleave(cfi) 4
+# endif
+#define cfi_interleave_is_4(cfi) (cfi_interleave(cfi) == 4)
+#else
+#define cfi_interleave_is_4(cfi) (0)
+#endif
+
+#ifdef CONFIG_MTD_CFI_I8
+# ifdef cfi_interleave
+#  undef cfi_interleave
+#  define cfi_interleave(cfi) ((cfi)->interleave)
+# else
+#  define cfi_interleave(cfi) 8
+# endif
+#define cfi_interleave_is_8(cfi) (cfi_interleave(cfi) == 8)
+#else
+#define cfi_interleave_is_8(cfi) (0)
+#endif
+
+#ifndef cfi_interleave
+#warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
+static inline int cfi_interleave(void *cfi)
+{
+	BUG();
+	return 0;
+}
+#endif
+
+static inline int cfi_interleave_supported(int i)
+{
+	switch (i) {
+#ifdef CONFIG_MTD_CFI_I1
+	case 1:
+#endif
+#ifdef CONFIG_MTD_CFI_I2
+	case 2:
+#endif
+#ifdef CONFIG_MTD_CFI_I4
+	case 4:
+#endif
+#ifdef CONFIG_MTD_CFI_I8
+	case 8:
+#endif
+		return 1;
+
+	default:
+		return 0;
+	}
+}
+
+
+#endif /* __MTD_CFI_INTERLEAVE_H__ */
-- 
2.37.2.609.g9ff673ca1a


From e11b2e2d16ac6af2d2ee35b009cdb156ccf6c98e Mon Sep 17 00:00:00 2001
From: Adam Borowski <kilobyte@angband.pl>
To: Yong Zhi <yong.zhi@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Dan Scally <djrscally@gmail.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 16 Sep 2022 01:33:18 +0200
Subject: [PATCH 4/6] media: ipu3-cio2: make the bridge depend on i2c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

drivers/media/pci/intel/ipu3/cio2-bridge.c: In function ‘cio2_bridge_unregister_sensors’:
drivers/media/pci/intel/ipu3/cio2-bridge.c:258:17: error: implicit declaration of function ‘i2c_unregister_device’; did you mean ‘spi_unregister_device’? [-Werror=implicit-function-declaration]
  258 |                 i2c_unregister_device(sensor->vcm_i2c_client);
      |                 ^~~~~~~~~~~~~~~~~~~~~
      |                 spi_unregister_device

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/media/pci/intel/ipu3/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
index 39bd3be0b43d..65b0c1598fbf 100644
--- a/drivers/media/pci/intel/ipu3/Kconfig
+++ b/drivers/media/pci/intel/ipu3/Kconfig
@@ -21,6 +21,7 @@ config VIDEO_IPU3_CIO2
 config CIO2_BRIDGE
 	bool "IPU3 CIO2 Sensors Bridge"
 	depends on VIDEO_IPU3_CIO2 && ACPI
+	depends on I2C
 	help
 	  This extension provides an API for the ipu3-cio2 driver to create
 	  connections to cameras that are hidden in the SSDB buffer in ACPI.
-- 
2.37.2.609.g9ff673ca1a


From 6da77c7f9af144a6a35020e2000e990ce285800f Mon Sep 17 00:00:00 2001
From: Adam Borowski <kilobyte@angband.pl>
To: Khalil Blaiech <kblaiech@nvidia.com>,
 Asmaa Mnebhi <asmaa@nvidia.com>,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 10 Oct 2022 20:33:51 +0200
Subject: [PATCH 5/6] i2c: mlxbf: depend on ACPI; clean away ifdeffage

This fixes maybe_unused warnings/errors.

According to a comment during device tree removal, only ACPI is supported,
thus let's actually require it.

Fixes: be18c5ede25da39a0eda541f6de3620a30cf731f
Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 drivers/i2c/busses/Kconfig     | 1 +
 drivers/i2c/busses/i2c-mlxbf.c | 9 ---------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 264e780ae32e..e50f9603d189 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -764,6 +764,7 @@ config I2C_LPC2K
 config I2C_MLXBF
         tristate "Mellanox BlueField I2C controller"
         depends on MELLANOX_PLATFORM && ARM64
+	depends on ACPI
 	select I2C_SLAVE
         help
           Enabling this option will add I2C SMBus support for Mellanox BlueField
diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index e68e775f187e..1810d5791b3d 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2247,7 +2247,6 @@ static struct i2c_adapter_quirks mlxbf_i2c_quirks = {
 	.max_write_len = MLXBF_I2C_MASTER_DATA_W_LENGTH,
 };
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id mlxbf_i2c_acpi_ids[] = {
 	{ "MLNXBF03", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_1] },
 	{ "MLNXBF23", (kernel_ulong_t)&mlxbf_i2c_chip[MLXBF_I2C_CHIP_TYPE_2] },
@@ -2282,12 +2281,6 @@ static int mlxbf_i2c_acpi_probe(struct device *dev, struct mlxbf_i2c_priv *priv)
 
 	return 0;
 }
-#else
-static int mlxbf_i2c_acpi_probe(struct device *dev, struct mlxbf_i2c_priv *priv)
-{
-	return -ENOENT;
-}
-#endif /* CONFIG_ACPI */
 
 static int mlxbf_i2c_probe(struct platform_device *pdev)
 {
@@ -2490,9 +2483,7 @@ static struct platform_driver mlxbf_i2c_driver = {
 	.remove = mlxbf_i2c_remove,
 	.driver = {
 		.name = "i2c-mlxbf",
-#ifdef CONFIG_ACPI
 		.acpi_match_table = ACPI_PTR(mlxbf_i2c_acpi_ids),
-#endif /* CONFIG_ACPI  */
 	},
 };
 
-- 
2.37.2.609.g9ff673ca1a


From 22212623b9fbffbe4e6e1490049a895d1d8591bc Mon Sep 17 00:00:00 2001
From: Adam Borowski <kilobyte@angband.pl>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Brent Lu <brent.lu@intel.com>,
 alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Date: Mon, 17 Oct 2022 08:17:12 +0200
Subject: [PATCH 6/6] ASoC: Intel: boards: add missing dependency from
 realtek-common

These boards use code from sound/soc/sof/sof-audio.c

Fixes: e1d5e13324020c4b405e63cae34560c7992bec2e
Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 sound/soc/intel/boards/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index aa12d7e3dd2f..3179ba061d87 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -34,6 +34,7 @@ config SND_SOC_INTEL_SOF_MAXIM_COMMON
 
 config SND_SOC_INTEL_SOF_REALTEK_COMMON
 	tristate
+	depends on SND_SOC_SOF
 
 config SND_SOC_INTEL_SOF_CIRRUS_COMMON
 	tristate
-- 
2.37.2.609.g9ff673ca1a

