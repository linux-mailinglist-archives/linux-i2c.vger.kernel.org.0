Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4A1675DC04
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 13:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjGVLvJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 07:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjGVLvI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 07:51:08 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D122D45;
        Sat, 22 Jul 2023 04:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1690026657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=iRVy6KWUyqulQ6zTq7bMa84y6yN8EmR7H7VKy0sjKtE=;
        b=n4zwvlMym2vdJ00/UlAVj3FjsE2TU+U7vSjoThcE2+recQVCBh1IdkeNaVYe3ifIRHs7sM
        L8RAa8oT4UZAw6dns2dD1d4Zf8elkDru3MQw1w0IiXtSk06cteDJbXP6wHbsn2P7Sk7Vn0
        Ld7Zipv0p8lxj9QR80JCNcmqKk+NXpc=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        Elie Morisse <syniurge@gmail.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Jean Delvare <jdelvare@suse.com>,
        Qii Wang <qii.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Conghui Chen <conghui.chen@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Peter Rosin <peda@axentia.se>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v2 00/22] i2c: Use new PM macros
Date:   Sat, 22 Jul 2023 13:50:24 +0200
Message-Id: <20230722115046.27323-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Here is a revised version of my patchset that converts the I2C drivers
to use the new PM macros.

Changes since V1 include:
- Previous patch [01/23] that updated the amd-mp2 driver has been
  dropped per Jonathan's request.
- [09/22]: Unfold _DEV_PM_OPS() macro
- [10/22]: Convert to use regular device PM instead of using
  platform_driver.{suspend,resume}. I figured it was OK to also change
  it to use the new PM macros and keep it in one single patch.
- [13/22]: Rewrap runtime PM line

Cheers,
-Paul

Paul Cercueil (22):
  i2c: au1550: Remove #ifdef guards for PM related functions
  i2c: iproc: Remove #ifdef guards for PM related functions
  i2c: brcmstb: Remove #ifdef guards for PM related functions
  i2c: davinci: Remove #ifdef guards for PM related functions
  i2c: designware: Remove #ifdef guards for PM related functions
  i2c: exynos5: Remove #ifdef guards for PM related functions
  i2c: hix5hd2: Remove #ifdef guards for PM related functions
  i2c: i801: Remove #ifdef guards for PM related functions
  i2c: img-scb: Remove #ifdef guards for PM related functions
  i2c: kempld: Convert to use regular device PM
  i2c: lpc2k: Remove #ifdef guards for PM related functions
  i2c: mt65xx: Remove #ifdef guards for PM related functions
  i2c: nomadik: Remove #ifdef guards for PM related functions
  i2c: ocores: Remove #ifdef guards for PM related functions
  i2c: pnx: Remove #ifdef guards for PM related functions
  i2c: pxa: Remove #ifdef guards for PM related functions
  i2c: qup: Remove #ifdef guards for PM related functions
  i2c: rcar: Remove #ifdef guards for PM related functions
  i2c: s3c2410: Remove #ifdef guards for PM related functions
  i2c: sh-mobile: Remove #ifdef guards for PM related functions
  i2c: virtio: Remove #ifdef guards for PM related functions
  i2c: mux: pca954x: Remove #ifdef guards for PM related functions

 drivers/i2c/busses/i2c-au1550.c             | 15 +++-----------
 drivers/i2c/busses/i2c-bcm-iproc.c          | 10 +---------
 drivers/i2c/busses/i2c-brcmstb.c            |  8 +++-----
 drivers/i2c/busses/i2c-davinci.c            | 12 +++--------
 drivers/i2c/busses/i2c-designware-platdrv.c | 22 ++++++---------------
 drivers/i2c/busses/i2c-exynos5.c            |  8 +++-----
 drivers/i2c/busses/i2c-hix5hd2.c            | 10 ++++------
 drivers/i2c/busses/i2c-i801.c               |  6 ++----
 drivers/i2c/busses/i2c-img-scb.c            | 10 +++-------
 drivers/i2c/busses/i2c-kempld.c             | 19 ++++++++----------
 drivers/i2c/busses/i2c-lpc2k.c              |  8 +-------
 drivers/i2c/busses/i2c-mt65xx.c             |  8 +++-----
 drivers/i2c/busses/i2c-nomadik.c            | 12 +++--------
 drivers/i2c/busses/i2c-ocores.c             | 10 +++-------
 drivers/i2c/busses/i2c-pnx.c                | 12 ++++-------
 drivers/i2c/busses/i2c-pxa.c                |  8 +-------
 drivers/i2c/busses/i2c-qup.c                | 16 ++++-----------
 drivers/i2c/busses/i2c-rcar.c               | 10 ++--------
 drivers/i2c/busses/i2c-s3c2410.c            | 14 +++----------
 drivers/i2c/busses/i2c-sh_mobile.c          | 12 +++--------
 drivers/i2c/busses/i2c-virtio.c             |  8 ++------
 drivers/i2c/muxes/i2c-mux-pca954x.c         |  6 ++----
 22 files changed, 67 insertions(+), 177 deletions(-)

-- 
2.40.1

