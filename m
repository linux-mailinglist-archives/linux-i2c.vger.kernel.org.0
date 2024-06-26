Return-Path: <linux-i2c+bounces-4358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E5491772C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 06:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A1951C227F7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 04:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5539A13A869;
	Wed, 26 Jun 2024 04:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Fz0zW3Jz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA691369B6
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719375165; cv=none; b=udmq0RRM2JALB6KOs0DyzwR2tDogtUiW1IA58iCeTo5MUDtsPhNvfMSyVqsRLakJ71Uboe4F1CAg9b2pDtJbKb8rVv53y2mNmQLmT0NXGKILTvyfWg7nk3GGgnfwauSqQRR6s5yhtEBAz16fuKLrLV66NapcC+PrM08iAV+Q0zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719375165; c=relaxed/simple;
	bh=zJXSuPTm2iFg66Kuu5zIAzQ0wZWatD4sATsUE8YFJXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciEmIEH7dO3/u2RsklJt225Sa8bOSvxQsxJy1mW8tGxhoQ8dsb+67QULZEZkSkExtGJ2SVLbPB5VIOC0/F5UBFlPvExIDDiYTHgwxVtmWy3RSUDLE2z9CEC9NhS4BGIhdZtYNj3xJXtRhqod3p9Ns6kXBdcgKglb8lEVAgXP47s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Fz0zW3Jz; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E82EA8844F;
	Wed, 26 Jun 2024 06:12:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719375161;
	bh=3BhXKe+7/0qtKfP5AeeYitbsXZHR+OjtZSCYf5GAxeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fz0zW3JzL3uxuILj492SC6n4qfmWYzBQOKXhj0hp2Nn8k/HMsnnz0v8H/Sf/sLVaF
	 PXS5MmqaicvBTUwYUxlImcAj4i2UfrqgZxxpalQyRy5E1u8Q51ZgRnMVpPMEimxcOP
	 J359LOPQB0SHaGRU6l4pPtk/TWM/A1zFi55t7sqI4SdJwNMca/Rkhhk733GiNlTm+k
	 HIjKDBi6F4WlqslbRTr31IvK9OliP9o1PC2ymf+bIyqnt2NMz8fBxJGqk9VvwHjPfh
	 3mfGLha5fou90mC/MGUnDJsUBxMD2VXbQ7NdLTlocY4hCcVINqFPIL+PhB91x7xwmi
	 YsjJ6GAPEVrJA==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 4/4] nvmem: core: Implement force_ro sysfs attribute
Date: Wed, 26 Jun 2024 06:11:17 +0200
Message-ID: <20240626041214.513242-4-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626041214.513242-1-marex@denx.de>
References: <20240626041214.513242-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Implement "force_ro" sysfs attribute to allow users to set read-write
devices as read-only and back to read-write from userspace. The choice
of the name is based on MMC core 'force_ro' attribute.

This solves a situation where an AT24 I2C EEPROM with GPIO based nWP
signal may have to be occasionally updated. Such I2C EEPROM device is
usually set as read-only during most of the regular system operation,
but in case it has to be updated in a controlled manner, it could be
unlocked using this new "force_ro" sysfs attribute and then re-locked
again.

The "read-only" DT property and config->read_only configuration is
respected and is used to set default state of the device, read-only
or read-write, for devices which do implement .reg_write function.
For devices which do not implement .reg_write function, the device
is unconditionally read-only and the "force_ro" attribute is not
visible.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-i2c@vger.kernel.org
---
V2: - Document the force_ro attribute
    - Use sysfs_emit()
V3: - Expand ABI documentation with what the force_ro attribute
      returns and what it can parse.
---
 Documentation/ABI/stable/sysfs-bus-nvmem | 17 +++++++++
 drivers/nvmem/core.c                     | 44 ++++++++++++++++++++++++
 drivers/nvmem/internals.h                |  1 +
 3 files changed, 62 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
index 3f0a95250aa84..aa89adf18bc55 100644
--- a/Documentation/ABI/stable/sysfs-bus-nvmem
+++ b/Documentation/ABI/stable/sysfs-bus-nvmem
@@ -1,3 +1,20 @@
+What:		/sys/bus/nvmem/devices/.../force_ro
+Date:		June 2024
+KernelVersion:	6.11
+Contact:	Marek Vasut <marex@denx.de>
+Description:
+		This read/write attribute allows users to set read-write
+		devices as read-only and back to read-write from userspace.
+		This can be used to unlock and relock write-protection of
+		devices which are generally locked, except during sporadic
+		programming operation.
+		Read returns '0' or '1' for read-write or read-only modes
+		respectively.
+		Write parses one of 'YyTt1NnFf0', or [oO][NnFf] for "on"
+		and "off", i.e. what kstrbool() supports.
+		Note: This file is only present if CONFIG_NVMEM_SYSFS
+		is enabled.
+
 What:		/sys/bus/nvmem/devices/.../nvmem
 Date:		July 2015
 KernelVersion:	4.2
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 5b3606114628b..91ff5e2ce613c 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -184,7 +184,30 @@ static ssize_t type_show(struct device *dev,
 
 static DEVICE_ATTR_RO(type);
 
+static ssize_t force_ro_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+
+	return sysfs_emit(buf, "%d\n", nvmem->read_only);
+}
+
+static ssize_t force_ro_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+	int ret = kstrtobool(buf, &nvmem->read_only);
+
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(force_ro);
+
 static struct attribute *nvmem_attrs[] = {
+	&dev_attr_force_ro.attr,
 	&dev_attr_type.attr,
 	NULL,
 };
@@ -285,6 +308,25 @@ static umode_t nvmem_bin_attr_is_visible(struct kobject *kobj,
 	return nvmem_bin_attr_get_umode(nvmem);
 }
 
+static umode_t nvmem_attr_is_visible(struct kobject *kobj,
+				     struct attribute *attr, int i)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+
+	/*
+	 * If the device has no .reg_write operation, do not allow
+	 * configuration as read-write.
+	 * If the device is set as read-only by configuration, it
+	 * can be forced into read-write mode using the 'force_ro'
+	 * attribute.
+	 */
+	if (attr == &dev_attr_force_ro.attr && !nvmem->reg_write)
+		return 0;	/* Attribute not visible */
+
+	return attr->mode;
+}
+
 static struct nvmem_cell *nvmem_create_cell(struct nvmem_cell_entry *entry,
 					    const char *id, int index);
 
@@ -341,6 +383,7 @@ static const struct attribute_group nvmem_bin_group = {
 	.bin_attrs	= nvmem_bin_attributes,
 	.attrs		= nvmem_attrs,
 	.is_bin_visible = nvmem_bin_attr_is_visible,
+	.is_visible	= nvmem_attr_is_visible,
 };
 
 static const struct attribute_group *nvmem_dev_groups[] = {
@@ -945,6 +988,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	nvmem->read_only = device_property_present(config->dev, "read-only") ||
 			   config->read_only || !nvmem->reg_write;
+	nvmem->default_read_only = nvmem->read_only;
 
 #ifdef CONFIG_NVMEM_SYSFS
 	nvmem->dev.groups = nvmem_dev_groups;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 18fed57270e5e..0667937ebb86b 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -16,6 +16,7 @@ struct nvmem_device {
 	int			id;
 	struct kref		refcnt;
 	size_t			size;
+	bool			default_read_only;
 	bool			read_only;
 	bool			root_only;
 	int			flags;
-- 
2.43.0


