Return-Path: <linux-i2c+bounces-4274-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3519913780
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 05:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10C851C20F0E
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 03:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DDA10A01;
	Sun, 23 Jun 2024 03:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="G1511dks"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2555ED28D
	for <linux-i2c@vger.kernel.org>; Sun, 23 Jun 2024 03:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719112720; cv=none; b=uG26MXYgkkRgOwaWbQXD3BPbLy4tcAYsjSK8TMLTfUjul3cTwdPmLyr2gT54eJQAwQ+BGqr49ud+Ah/ZoD6H/A0Vgaq7bZ/imbpKCcx6pE+6T46xSMLpyBDW00YZXt2yDO2zHP5xzenQLDzr+4RXVjIuICML0r1jnJqk8h+d3RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719112720; c=relaxed/simple;
	bh=B2c2CsHDD9NyewOFfogYZbPU3T0EvUVf5iMLy9lRl8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tub7y6+CnQIn6SYaV4E58PjhbvEEfVaVsZry8gRSNAsH3mvVs7Hxp4xfV+wxxcPpBNeMBXBPJlZhQaX4i4LsqMXUKNhmWSZ9OtDPsPdH+dvioMj1EgnBlcUuiChjv+raXq9YPv9ZWyH96Ed/rqCDSviuQr9sENRHG6sr918vYqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=G1511dks; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 138C288239;
	Sun, 23 Jun 2024 05:18:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719112710;
	bh=MzT/5dZOOgyDG5iz7+8iu5vEqWZpSgyPcjU/F6d2NqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G1511dks30MnC/gsz0anfx+CXDr0HXraBOf+sPiSg9c/4/Zwv8Gm00J8G9O7XLeam
	 1ZtbGMiitzj8/IzHGoK7H14DbxYcS3YxcMWvCL5/wbVvEM6NhMgoLIk/0v9+TxPeS/
	 myMDk1nf8vL4LNYPq2GbppSUrAwPLTCC7Gf9mN2uG5m90c/esVlkzacZpKopv+pnLF
	 euuDq//j8FEnUu3ZWoK+gnq8igNPXdEo2YECqc4rvsTKy0IWRlPq/HOZ016WYkCxFd
	 Gx/NlL7StcPI1A5Ze4UkE7UyHu9CUZ55l8OIxH5J4Kvf+Hgbt6iWXI19+j5XDk2MS0
	 39vL+snswh19w==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/4] nvmem: core: Implement force_ro sysfs attribute
Date: Sun, 23 Jun 2024 05:15:47 +0200
Message-ID: <20240623031752.353818-4-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623031752.353818-1-marex@denx.de>
References: <20240623031752.353818-1-marex@denx.de>
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
---
 Documentation/ABI/stable/sysfs-bus-nvmem | 13 +++++++
 drivers/nvmem/core.c                     | 44 ++++++++++++++++++++++++
 drivers/nvmem/internals.h                |  1 +
 3 files changed, 58 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-bus-nvmem b/Documentation/ABI/stable/sysfs-bus-nvmem
index 0e3a8492a1082..c713c4e6cecb1 100644
--- a/Documentation/ABI/stable/sysfs-bus-nvmem
+++ b/Documentation/ABI/stable/sysfs-bus-nvmem
@@ -1,3 +1,16 @@
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
+		Note: This file is only present if CONFIG_NVMEM_SYSFS
+		is enabled
+
 What:		/sys/bus/nvmem/devices/.../nvmem
 Date:		July 2015
 KernelVersion:	4.2
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index b31abffcdfc00..2321fb7da1e92 100644
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
@@ -299,6 +322,25 @@ static umode_t nvmem_bin_attr_is_visible(struct kobject *kobj,
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
 
@@ -355,6 +397,7 @@ static const struct attribute_group nvmem_bin_group = {
 	.bin_attrs	= nvmem_bin_attributes,
 	.attrs		= nvmem_attrs,
 	.is_bin_visible = nvmem_bin_attr_is_visible,
+	.is_visible	= nvmem_attr_is_visible,
 };
 
 /* Cell attributes will be dynamically allocated */
@@ -971,6 +1014,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
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


