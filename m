Return-Path: <linux-i2c+bounces-11807-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D82AF7227
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 13:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 171763B96D5
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 11:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A092E54A3;
	Thu,  3 Jul 2025 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ce9zA/zE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0052E3B00
	for <linux-i2c@vger.kernel.org>; Thu,  3 Jul 2025 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542072; cv=none; b=RkY/Kqqtg/ho1VzlsGYiv6H4YQ7+dqfM4jYDe19nwppdAuMmIP1Tf/Wh8FH2UY7geHcYPyGxtiK8vTN63X+2w2x7FNrgcSdnSIcQv+wd9rmMsrNvcpgmHXzqp4+XMJBWd3CmQS3GrpJZb61VJ+aAI7lU1MA05vFGwRqY9tmUISI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542072; c=relaxed/simple;
	bh=VFHVp92oUtdD8O/al59Afa61BRyaZZLLREdoqIPcQBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1vDHv6iMmkIEjxUsdxCfXa0q7RplNlhgc1vYEzN9C/wJQa8l4CXgQAdsN36VjDj4tG6KjqTDY00E2VDr5wVL4TE5PATgB0TWiggovAbp04F/HL8QF3gOnBs23u7ZGDt5rcSdI9phaS59W90kmTC8+k8arJihhvHRpq6ksWdILs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ce9zA/zE; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so953118666b.0
        for <linux-i2c@vger.kernel.org>; Thu, 03 Jul 2025 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751542067; x=1752146867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00v7jImDBQ2eMu0i8J3EDPnWwIf7Eay4sawX2tdcIjU=;
        b=ce9zA/zEvvLqxk6gQN2n3Y1W4udkQvyd342x9EDUA/DKO4eeV4d+878b9lbaVA6P3V
         GPqS+Nr3UGfqjvK20PED5zHJjbnopkb/qAmi+Lq1ppJcsqlPQ8+p99FZHpgI21JUBxZX
         yUETSH2XYRlIBx/nMBZGMbnceR0jwjDGC158FKNSQmPvBeUTfq+lvw1s9v8Pc8R+97oC
         d6Y3HWPjpzeghPM/Ha+EncWl9K7tjDpLQrto5XP2JcItmnkA2jM0KzU74/ALQ3nrXo/2
         Dgu48ckltY1MjfnQ4Kl9t0dkofDf1YDvo06SZx39+8LsrQihhuLO0f8/JodmAGBbFMsp
         HLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542067; x=1752146867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00v7jImDBQ2eMu0i8J3EDPnWwIf7Eay4sawX2tdcIjU=;
        b=DunUZgiOIARl+aMPxSACksqVAzfbeI5sVwCwpIf9V+CRgk/NSaBASu+oU36E/OrX7F
         AWIyo6zl6YznxKw0gCUuDZFb9SEOvHahkioqiyYyhG5y6RnNjUQzgG/vAwZ2tGuBzkgx
         8KUoTGTd6WHZjMpu3TyEf0XoIFUB8g7afftgSo+Ug/ABhCc8zPT0dsWyahCMdD3/FbCE
         nAP7qT/BOEMf4BczvBJ1RZjoiPl2p2qy5uazVdxQQ51EH6FBgIzh7+sCQh6/BaXmMJzX
         PzMGexj2JXSembDy51UfZGmkroZROy6KFlym7KBWE5Yk+sCYIpUx0gh3nMauQWNL/IuD
         /WJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXP2MqfskIVHj1zClz2d+es6nDzWy3Ks/NgBvGSoh0zqGKpdD6ifFLFciUWygBVQm3ciWkvYno4pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVUbbE9x03el2Kfwu0+sf0ysfxPdggmXQd5NQi8mNQZqBYN0GS
	ti/hyTW3cOvzcHizffIHCn8cTwKVDbowQNivdY/7HWyUWJ45u9enUarKjK2hKBWSxz4=
X-Gm-Gg: ASbGncvCXkG2CU7pFXAlFc86/29/bBLFMpt+3Fe3nA9aQtW+EE740834PYsVfSX066Q
	SWW/VEN5NEK81NZxKAsxGDs3t7bYiVwRoryCc3kOUOgRSQtoGTYjFF2+H/Ghd2A7mFkv/zm5oQ7
	W1doVRaBl7D754QxneP04g4J90NSnHcZ3eX56JdVpR7kEfVAdTDJ7FQ/e9dgF6ykyjqcGwJd6o8
	ht4w8sW/totIwrXG0PFmzH/8icf+okqQpY5YFGCTth4qNKNFH9nnQV/NKrDb6XhnsOOIqtrcbS+
	whPrPNytOcT3ivGmQKlPx3q6IGU4vsRk4SNm9AiVFxsT/VKjGjGtEjEklPyb0HvXWAcN3AwsW0W
	LhbCwJ2q0tFL6L68=
X-Google-Smtp-Source: AGHT+IEGjD3eSI1D9oPtbbf+Qd+7ik/ERcGzIN30TUY3t1ZpkWKdf4ycZcaIs03RCZW44chHMZB55g==
X-Received: by 2002:a17:907:d8a:b0:ade:4121:8d3d with SMTP id a640c23a62f3a-ae3c2b3bf4amr586271766b.12.1751542066863;
        Thu, 03 Jul 2025 04:27:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a75fsm1247016966b.67.2025.07.03.04.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:27:46 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: linux@armlinux.org.uk,
	gregkh@linuxfoundation.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	andersson@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	wsa+renesas@sang-engineering.com,
	ulf.hansson@linaro.org,
	mathieu.poirier@linaro.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	robh@kernel.org,
	jirislaby@kernel.org,
	saravanak@google.com,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 1/3] PM: domains: Add flags to specify power on attach/detach
Date: Thu,  3 Jul 2025 14:27:06 +0300
Message-ID: <20250703112708.1621607-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Calling dev_pm_domain_attach()/dev_pm_domain_detach() in bus driver
probe/remove functions can affect system behavior when the drivers attached
to the bus use devres-managed resources. Since devres actions may need to
access device registers, calling dev_pm_domain_detach() too early, i.e.,
before these actions complete, can cause failures on some systems. One such
example is Renesas RZ/G3S SoC-based platforms.

If the device clocks are managed via PM domains, invoking
dev_pm_domain_detach() in the bus driver's remove function removes the
device's clocks from the PM domain, preventing any subsequent
pm_runtime_resume*() calls from enabling those clocks.

The second argument of dev_pm_domain_attach() specifies whether the PM
domain should be powered on during attachment. Likewise, the second
argument of dev_pm_domain_detach() indicates whether the domain should be
powered off during detachment.

Upcoming commits address the issue described above (initially for the
platform bus only) by deferring the call to dev_pm_domain_detach() until
after devres_release_all() in device_unbind_cleanup(). The detach_power_off
field in struct dev_pm_info stores the detach power off info from the
second argument of dev_pm_domain_attach().

Because there are cases where the device's PM domain power-on/off behavior
must be conditional (e.g., in i2c_device_probe()), the patch introduces
PD_FLAG_ATTACH_POWER_ON and PD_FLAG_DETACH_POWER_OFF flags to be passed to
dev_pm_domain_attach().

Finally, dev_pm_domain_attach() and its users are updated to use the newly
introduced PD_FLAG_ATTACH_POWER_ON and PD_FLAG_DETACH_POWER_OFF macros.

This is a preparatory commit.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none; this patch is new

 drivers/amba/bus.c                       |  4 ++--
 drivers/base/auxiliary.c                 |  2 +-
 drivers/base/platform.c                  |  2 +-
 drivers/base/power/common.c              |  6 +++---
 drivers/clk/qcom/apcs-sdx55.c            |  2 +-
 drivers/gpu/drm/display/drm_dp_aux_bus.c |  2 +-
 drivers/i2c/i2c-core-base.c              |  2 +-
 drivers/mmc/core/sdio_bus.c              |  2 +-
 drivers/rpmsg/rpmsg_core.c               |  2 +-
 drivers/soundwire/bus_type.c             |  2 +-
 drivers/spi/spi.c                        |  2 +-
 drivers/tty/serdev/core.c                |  2 +-
 include/linux/pm_domain.h                | 10 ++++++++--
 13 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index 71482d639a6d..74e34a07ef72 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -138,7 +138,7 @@ static int amba_read_periphid(struct amba_device *dev)
 	void __iomem *tmp;
 	int i, ret;
 
-	ret = dev_pm_domain_attach(&dev->dev, true);
+	ret = dev_pm_domain_attach(&dev->dev, PD_FLAG_ATTACH_POWER_ON);
 	if (ret) {
 		dev_dbg(&dev->dev, "can't get PM domain: %d\n", ret);
 		goto err_out;
@@ -291,7 +291,7 @@ static int amba_probe(struct device *dev)
 		if (ret < 0)
 			break;
 
-		ret = dev_pm_domain_attach(dev, true);
+		ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
 		if (ret)
 			break;
 
diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index dba7c8e13a53..44cd3f85b659 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -217,7 +217,7 @@ static int auxiliary_bus_probe(struct device *dev)
 	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
 	int ret;
 
-	ret = dev_pm_domain_attach(dev, true);
+	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
 	if (ret) {
 		dev_warn(dev, "Failed to attach to PM Domain : %d\n", ret);
 		return ret;
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 075ec1d1b73a..df1ec34fdf56 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1396,7 +1396,7 @@ static int platform_probe(struct device *_dev)
 	if (ret < 0)
 		return ret;
 
-	ret = dev_pm_domain_attach(_dev, true);
+	ret = dev_pm_domain_attach(_dev, PD_FLAG_ATTACH_POWER_ON);
 	if (ret)
 		goto out;
 
diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
index 781968a128ff..fecb85fa85ac 100644
--- a/drivers/base/power/common.c
+++ b/drivers/base/power/common.c
@@ -83,7 +83,7 @@ EXPORT_SYMBOL_GPL(dev_pm_put_subsys_data);
 /**
  * dev_pm_domain_attach - Attach a device to its PM domain.
  * @dev: Device to attach.
- * @power_on: Used to indicate whether we should power on the device.
+ * @flags: indicate whether we should power on/off the device on attach/detach
  *
  * The @dev may only be attached to a single PM domain. By iterating through
  * the available alternatives we try to find a valid PM domain for the device.
@@ -100,14 +100,14 @@ EXPORT_SYMBOL_GPL(dev_pm_put_subsys_data);
  * Returns 0 on successfully attached PM domain, or when it is found that the
  * device doesn't need a PM domain, else a negative error code.
  */
-int dev_pm_domain_attach(struct device *dev, bool power_on)
+int dev_pm_domain_attach(struct device *dev, u32 flags)
 {
 	int ret;
 
 	if (dev->pm_domain)
 		return 0;
 
-	ret = acpi_dev_pm_attach(dev, power_on);
+	ret = acpi_dev_pm_attach(dev, !!(flags & PD_FLAG_ATTACH_POWER_ON));
 	if (!ret)
 		ret = genpd_dev_pm_attach(dev);
 
diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
index 3ba01622d8f0..90dd1f1855c2 100644
--- a/drivers/clk/qcom/apcs-sdx55.c
+++ b/drivers/clk/qcom/apcs-sdx55.c
@@ -111,7 +111,7 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
 	 * driver, there seems to be no better place to do this. So do it here!
 	 */
 	cpu_dev = get_cpu_device(0);
-	ret = dev_pm_domain_attach(cpu_dev, true);
+	ret = dev_pm_domain_attach(cpu_dev, PD_FLAG_ATTACH_POWER_ON);
 	if (ret) {
 		dev_err_probe(dev, ret, "can't get PM domain: %d\n", ret);
 		goto err;
diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index 7b9afcf48836..2d279e82922f 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -58,7 +58,7 @@ static int dp_aux_ep_probe(struct device *dev)
 		container_of(aux_ep, struct dp_aux_ep_device_with_data, aux_ep);
 	int ret;
 
-	ret = dev_pm_domain_attach(dev, true);
+	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to attach to PM Domain\n");
 
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2ad2b1838f0f..38eabf1173da 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -573,7 +573,7 @@ static int i2c_device_probe(struct device *dev)
 		goto err_clear_wakeup_irq;
 
 	do_power_on = !i2c_acpi_waive_d0_probe(dev);
-	status = dev_pm_domain_attach(&client->dev, do_power_on);
+	status = dev_pm_domain_attach(&client->dev, do_power_on ? PD_FLAG_ATTACH_POWER_ON : 0);
 	if (status)
 		goto err_clear_wakeup_irq;
 
diff --git a/drivers/mmc/core/sdio_bus.c b/drivers/mmc/core/sdio_bus.c
index b66b637e2d57..656601754966 100644
--- a/drivers/mmc/core/sdio_bus.c
+++ b/drivers/mmc/core/sdio_bus.c
@@ -161,7 +161,7 @@ static int sdio_bus_probe(struct device *dev)
 	if (!id)
 		return -ENODEV;
 
-	ret = dev_pm_domain_attach(dev, false);
+	ret = dev_pm_domain_attach(dev, 0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 6ee36adcbdba..bece5e635ee9 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -479,7 +479,7 @@ static int rpmsg_dev_probe(struct device *dev)
 	struct rpmsg_endpoint *ept = NULL;
 	int err;
 
-	err = dev_pm_domain_attach(dev, true);
+	err = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
 	if (err)
 		goto out;
 
diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 75d6f16efced..bc1e653080d9 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -101,7 +101,7 @@ static int sdw_drv_probe(struct device *dev)
 	/*
 	 * attach to power domain but don't turn on (last arg)
 	 */
-	ret = dev_pm_domain_attach(dev, false);
+	ret = dev_pm_domain_attach(dev, 0);
 	if (ret)
 		return ret;
 
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 1bc0fdbb1bd7..8200b47b2295 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -427,7 +427,7 @@ static int spi_probe(struct device *dev)
 	if (spi->irq < 0)
 		spi->irq = 0;
 
-	ret = dev_pm_domain_attach(dev, true);
+	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
 	if (ret)
 		return ret;
 
diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index 0213381fa358..d16c207a1a9b 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -399,7 +399,7 @@ static int serdev_drv_probe(struct device *dev)
 	const struct serdev_device_driver *sdrv = to_serdev_device_driver(dev->driver);
 	int ret;
 
-	ret = dev_pm_domain_attach(dev, true);
+	ret = dev_pm_domain_attach(dev, PD_FLAG_ATTACH_POWER_ON);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 0b18160901a2..62a35a78ce9b 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -36,10 +36,16 @@
  *				isn't specified, the index just follows the
  *				index for the attached PM domain.
  *
+ * PD_FLAG_ATTACH_POWER_ON:	Power on the domain during attach.
+ *
+ * PD_FLAG_DETACH_POWER_OFF:	Power off the domain during detach.
+ *
  */
 #define PD_FLAG_NO_DEV_LINK		BIT(0)
 #define PD_FLAG_DEV_LINK_ON		BIT(1)
 #define PD_FLAG_REQUIRED_OPP		BIT(2)
+#define PD_FLAG_ATTACH_POWER_ON		BIT(3)
+#define PD_FLAG_DETACH_POWER_OFF	BIT(4)
 
 struct dev_pm_domain_attach_data {
 	const char * const *pd_names;
@@ -501,7 +507,7 @@ struct generic_pm_domain *of_genpd_remove_last(struct device_node *np)
 #endif /* CONFIG_PM_GENERIC_DOMAINS_OF */
 
 #ifdef CONFIG_PM
-int dev_pm_domain_attach(struct device *dev, bool power_on);
+int dev_pm_domain_attach(struct device *dev, u32 flags);
 struct device *dev_pm_domain_attach_by_id(struct device *dev,
 					  unsigned int index);
 struct device *dev_pm_domain_attach_by_name(struct device *dev,
@@ -518,7 +524,7 @@ int dev_pm_domain_start(struct device *dev);
 void dev_pm_domain_set(struct device *dev, struct dev_pm_domain *pd);
 int dev_pm_domain_set_performance_state(struct device *dev, unsigned int state);
 #else
-static inline int dev_pm_domain_attach(struct device *dev, bool power_on)
+static inline int dev_pm_domain_attach(struct device *dev, u32 flags)
 {
 	return 0;
 }
-- 
2.43.0


