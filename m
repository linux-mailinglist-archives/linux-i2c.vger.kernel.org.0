Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F5C46681
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 19:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfFNRy7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 13:54:59 -0400
Received: from foss.arm.com ([217.140.110.172]:39354 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726837AbfFNRy7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 13:54:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEF05346;
        Fri, 14 Jun 2019 10:54:57 -0700 (PDT)
Received: from en101.cambridge.arm.com (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF5FE3F718;
        Fri, 14 Jun 2019 10:54:53 -0700 (PDT)
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
To:     linux-kernel@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, rafael@kernel.org,
        suzuki.poulose@arm.com, Alan Tull <atull@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Jiri Slaby <jslaby@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Moritz Fischer <mdf@kernel.org>, Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Joe Perches <joe@perches.com>
Subject: [PATCH v2 06/28] drivers: Add generic helper to match by of_node
Date:   Fri, 14 Jun 2019 18:54:01 +0100
Message-Id: <1560534863-15115-7-git-send-email-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add a helper to match device by the of_node. This will be later used
to provide wrappers to the device iterators for {bus/class/driver}_find_device().
Convert other users to reuse this new helper.

Cc: Alan Tull <atull@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-fpga@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Moritz Fischer <mdf@kernel.org>
Cc: Peter Rosin <peda@axentia.se>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thor Thayer <thor.thayer@linux.intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Joe Perches <joe@perches.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/base/core.c           | 6 ++++++
 drivers/fpga/of-fpga-region.c | 7 +------
 include/linux/device.h        | 2 ++
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index fd7511e..9211908 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3328,3 +3328,9 @@ void device_set_of_node_from_dev(struct device *dev, const struct device *dev2)
 	dev->of_node_reused = true;
 }
 EXPORT_SYMBOL_GPL(device_set_of_node_from_dev);
+
+int device_match_of_node(struct device *dev, const void *np)
+{
+	return dev->of_node == np;
+}
+EXPORT_SYMBOL_GPL(device_match_of_node);
diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
index 75f64ab..e405309 100644
--- a/drivers/fpga/of-fpga-region.c
+++ b/drivers/fpga/of-fpga-region.c
@@ -22,11 +22,6 @@ static const struct of_device_id fpga_region_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, fpga_region_of_match);
 
-static int fpga_region_of_node_match(struct device *dev, const void *data)
-{
-	return dev->of_node == data;
-}
-
 /**
  * of_fpga_region_find - find FPGA region
  * @np: device node of FPGA Region
@@ -37,7 +32,7 @@ static int fpga_region_of_node_match(struct device *dev, const void *data)
  */
 static struct fpga_region *of_fpga_region_find(struct device_node *np)
 {
-	return fpga_region_class_find(NULL, np, fpga_region_of_node_match);
+	return fpga_region_class_find(NULL, np, device_match_of_node);
 }
 
 /**
diff --git a/include/linux/device.h b/include/linux/device.h
index 4d7c881..7093085 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -163,6 +163,8 @@ void subsys_dev_iter_init(struct subsys_dev_iter *iter,
 struct device *subsys_dev_iter_next(struct subsys_dev_iter *iter);
 void subsys_dev_iter_exit(struct subsys_dev_iter *iter);
 
+int device_match_of_node(struct device *dev, const void *np);
+
 int bus_for_each_dev(struct bus_type *bus, struct device *start, void *data,
 		     int (*fn)(struct device *dev, void *data));
 struct device *bus_find_device(struct bus_type *bus, struct device *start,
-- 
2.7.4

