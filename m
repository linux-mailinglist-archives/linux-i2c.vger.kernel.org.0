Return-Path: <linux-i2c+bounces-4429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD47C91B2E2
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 01:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C3A2B20FD3
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 23:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842181A2FD3;
	Thu, 27 Jun 2024 23:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Nu33VSrz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3111A2FC8
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 23:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719531489; cv=none; b=ldEpRVrTYVuuvaSW8GSjfuR6O0gzCga20YfK0cDpgqzDqiOpWb948QG1chxFp+Llp/Bce5YxNXwk0xk6b+Tid/gDoWoOa4uC1Ud3d1BSw6qJq90bNmAR+fnU+l/MuQAdkS0k9qmy06p5QckwKm1cRoYhfn5BvkWK6YyCvb7awF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719531489; c=relaxed/simple;
	bh=7rIJsqAXH5jFMao9VAX81Y2Lh1Fr7TVm2e1pyOVOloc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJAjbBD4piJYtLuuCrC8hTVaptc4OraKZyIb6GZ7wf04vqoMQDtC40KKv5NinuwHAxh/xof+L0D38XhbWoQ5EDetZyQzVU0yLEP16o/NG4oPib+ptwIXLu+qrajtfoVPhk0FpG+kPnpYbMwjmlfkHLJFK9OrdCCQWH0u17Uvh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Nu33VSrz; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 500868857D;
	Fri, 28 Jun 2024 01:38:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719531485;
	bh=mXm5ooJAECfblFWtjVhUsv+lssDk8YMCerljmu5cWWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nu33VSrzNoUG6NpluK5ty15jjytYcZToOvW7wGINLevHntGH08mBgECXD5VyHMnPm
	 HPxCBtl8vQ1/XqLcYsV4mfCFrk19IE5nMDmC3wJ4XwHtDvSSdSZ+zILjMH0vD3JUol
	 mhXCMYKfTLygRlHRThGRsyELE6tP5xzltqwWlsTvjG4EFogpyxzyy2fY9EwSHelVrq
	 chbinE0oL1G6hvOIgMfE3VyMCPfG6jlCMDt0ndz7yHd6vYt2r12SfJsC8GgmSY25RB
	 jqtN846ZT2ElfbrWmSstLYCrfVVawBkTcq/EpyGWJRryW7KvMsFrXWnzFHeg8Tqe6L
	 +ETvK4fE1+j7Q==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 4/4] nvmem: core: Implement force_ro sysfs attribute
Date: Fri, 28 Jun 2024 01:37:30 +0200
Message-ID: <20240627233747.82341-4-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627233747.82341-1-marex@denx.de>
References: <20240627233747.82341-1-marex@denx.de>
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
V4: - Drop default_read_only , that is superseded by nvmem_attr_is_visible
      which outright hides the force_ro attribute for read-only devices,
      so they cannot be switched to read-write.
---
 Documentation/ABI/stable/sysfs-bus-nvmem | 17 ++++++++++
 drivers/nvmem/core.c                     | 43 ++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

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
index 5b3606114628b..628d4f940a2b2 100644
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
-- 
2.43.0


