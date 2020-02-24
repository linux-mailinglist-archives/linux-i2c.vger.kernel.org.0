Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2245616A19D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Feb 2020 10:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgBXJQG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Feb 2020 04:16:06 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:51351 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728318AbgBXJQF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Feb 2020 04:16:05 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 5AF454CD;
        Mon, 24 Feb 2020 04:08:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 24 Feb 2020 04:08:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=8vrsYnMg3+xlG
        wkxA2xqTXt5S7dQQOBwNLJokfKT5TI=; b=MeEGm8ydYTSDljDyxAs5wLbVVWQrV
        ZLc+D4bpc6kIWpyJTtjbRUZAdIm7Ho4neycCK2r7oX5b2WQI9O4AzKdlL+6zzD9z
        eMCb0E8IAaRikxxmmaHPI7zNa6oaMXBPgho3XFDnZPz+B8muLWHE+JnIAtPMbST2
        WdqreU0RTYMSF5vcnSBLgUTYhP/FTo9lRBtqt90SUajuBoeWphrqja3NHLAtJTS6
        h7BL0HGfEE9KUUfOTuOmIcUYR/6dd0cEJCF8Ta6jc0hmC+3Ms+YXvSxbbY5WV129
        By0cqCutzcXGKC8E2by+EnNBJlvoqtgGMjR9FE0Y/cHbnHh0twqb1BtjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=8vrsYnMg3+xlGwkxA2xqTXt5S7dQQOBwNLJokfKT5TI=; b=zzlQpzty
        TQi+s9EWJWK2dZJ3xg6Rrr/ChaWBFHaPKGXqTxduw6vEWfblw87uof8xbmFmV0gL
        OIMvoutCNzlimhGippaMJBNmnY4cpX/eoQuovotdlX2c581aEfwKruTrQfnQm5zc
        VRMs8gUwP9ELDykd49fk7oJrrN3rCYShYffseJQvf9ARD4xiVlohsb9/KoVgWg8A
        WJLsLegxr3un88Js5NBTyDIjCvOoIa7f7xf1PHhBg5ljrEFHe40tB9riscSvmK+2
        YZax7iskHT1iH3bBjKnTujW1TF/Nw4wxjMvde5xhVebtGILX5orSXl7ffljcDmsu
        Zsvn3NTHszT1qA==
X-ME-Sender: <xms:ppJTXjTmQpTuM8_FjJ4Lcv_wIY6cYU5OJjn656Dm8k2QC7jyeh2s4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrledtucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhi
    phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
    eikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ppJTXsWL0OGsKJoUQUu_qHB-GBs4IF5zq4_afrl4OfY2LE01e5Y-uQ>
    <xmx:ppJTXoeLpU0IHK2dJP-nL9wOWpJ8K7n9H_DjmfWma_018eFICKL2-A>
    <xmx:ppJTXvwR_zBnusltx-lZlhZShIXI-9zuW-QuSh6E4tbH3lE8Vzjxww>
    <xmx:qJJTXsdgiH4mN_Q1Y_kAZwvirdItS31sFpZWycjD-4YKr5qjkm-WTw22ksI>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E275F3060F9B;
        Mon, 24 Feb 2020 04:08:53 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>
Cc:     dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Subject: [PATCH 03/89] i2c: brcmstb: Support BCM2711 HDMI BSC controllers
Date:   Mon, 24 Feb 2020 10:06:05 +0100
Message-Id: <1ed75ec6dc9310afd768c0bbfd8e73268e8cdfa9.1582533919.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The HDMI blocks in the BCM2771 have an i2c controller to retrieve the
EDID. This block is split into two parts, the BSC and the AUTO_I2C,
lying in two separate register areas.

The AUTO_I2C block has a mailbox-like interface and will take away the
BSC control from the CPU if enabled. However, the BSC is the actually
the same controller than the one supported by the brcmstb driver, and
the AUTO_I2C doesn't really bring any immediate benefit.

Let's use the BSC then, but let's also tie the AUTO_I2C registers with a
separate compatible so that we can enable AUTO_I2C if needed in the
future.

The AUTO_I2C is enabled by default at boot though, so we first need to
release the BSC from the AUTO_I2C control.

Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/i2c/busses/i2c-brcmstb.c | 33 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 506991596b68..169a2836922d 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -580,6 +580,31 @@ static void brcmstb_i2c_set_bsc_reg_defaults(struct brcmstb_i2c_dev *dev)
 	brcmstb_i2c_set_bus_speed(dev);
 }
 
+#define AUTOI2C_CTRL0		0x26c
+#define AUTOI2C_CTRL0_RELEASE_BSC	BIT(1)
+
+static int bcm2711_release_bsc(struct brcmstb_i2c_dev *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev->device);
+	struct resource *iomem;
+	void __iomem *autoi2c;
+
+	/* Map hardware registers */
+	iomem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "auto-i2c");
+	autoi2c = devm_ioremap_resource(&pdev->dev, iomem);
+	if (IS_ERR(autoi2c))
+		return PTR_ERR(autoi2c);
+
+	writel(AUTOI2C_CTRL0_RELEASE_BSC, autoi2c + AUTOI2C_CTRL0);
+	devm_iounmap(&pdev->dev, autoi2c);
+
+	/* We need to reset the controller after the release */
+	dev->bsc_regmap->iic_enable = 0;
+	bsc_writel(dev, dev->bsc_regmap->iic_enable, iic_enable);
+
+	return 0;
+}
+
 static int brcmstb_i2c_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -609,6 +634,13 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 		goto probe_errorout;
 	}
 
+	if (of_device_is_compatible(dev->device->of_node,
+				    "brcm,bcm2711-hdmi-i2c")) {
+		rc = bcm2711_release_bsc(dev);
+		if (rc)
+			goto probe_errorout;
+	}
+
 	rc = of_property_read_string(dev->device->of_node, "interrupt-names",
 				     &int_name);
 	if (rc < 0)
@@ -705,6 +737,7 @@ static SIMPLE_DEV_PM_OPS(brcmstb_i2c_pm, brcmstb_i2c_suspend,
 static const struct of_device_id brcmstb_i2c_of_match[] = {
 	{.compatible = "brcm,brcmstb-i2c"},
 	{.compatible = "brcm,brcmper-i2c"},
+	{.compatible = "brcm,bcm2711-hdmi-i2c"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, brcmstb_i2c_of_match);
-- 
git-series 0.9.1
