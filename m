Return-Path: <linux-i2c+bounces-4231-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A01912ACF
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 18:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AA21289F49
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 16:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D099F156C69;
	Fri, 21 Jun 2024 16:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="grwNEHFP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C557757F8
	for <linux-i2c@vger.kernel.org>; Fri, 21 Jun 2024 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718985814; cv=none; b=InuEnF53eGNSODr/mjsgiWAZNpo3P87qXvTx4TUfkaaewoO/33lVYr+Wg3/vTMXDcgLwWyPbIBfDuFpO5MtmJj1BVZznw1diE0vaz1KplMoaB9RI9Ve/7CTyn2RZnxGRUn8dnVzjtOslr5p0dH0fnytHHqKhLvzxCtiWiKgGDfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718985814; c=relaxed/simple;
	bh=C7+hEro+OoY6d1+s3jjX8p/Z9b6dLlDprBdIarx022k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ci+j0R+uF/SPbeuIJgx019r7vFa6U/hc4HJeflK51T/4k5ZlZz7alDexUWPbih9strH+zF+zUk66gk8/C+oQ3ziFyCvGcf3w5NTSH+eTYMTidpRR45raH7dls52gqGWGFKFnb/v/ZoKNWV/qlro/gx3BTHoLXvZIGvZtXww8RL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=grwNEHFP; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B2B1187B77;
	Fri, 21 Jun 2024 18:03:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1718985808;
	bh=HOWYH8OXjB8IioZwQwqgOEEchQL6tOAWRwXFmNN8V+o=;
	h=From:To:Cc:Subject:Date:From;
	b=grwNEHFPixJEYxs9dA+iaP3CzagrzmFxTJnJ1dOssRC1m7VCJ85zsuQY+eoc67t88
	 PpMkqgv/KznimQeJsQAS3kFv4x26WTPkBf04toaMTp8bSUyfj43hKV4l15vs+YMM0o
	 LtyKdQWK/8lrlnXtuZJZNYg6oYtSts+8VSh+Td0UY2o9gm547oUaZXj9hV0Cyu4kHD
	 3v3oZN3sRG4J5h4nlmTTcjMS/tSq1SYi/xtjZtDUB7wOIG8rn1kUEh362rlNMQXY5B
	 lkVAuYrxJRWhX+5KRjHj7qBIP7xsznfOru19Q4Zjuc1TsafNVXKzMvS7Qt8ZL/ZJki
	 iA1Yp3dvZhfcg==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] nvmem: core: Implement force_ro sysfs attribute
Date: Fri, 21 Jun 2024 18:02:14 +0200
Message-ID: <20240621160309.97843-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
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
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-i2c@vger.kernel.org
---
 drivers/nvmem/core.c      | 44 +++++++++++++++++++++++++++++++++++++++
 drivers/nvmem/internals.h |  1 +
 2 files changed, 45 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index e1ec3b7200d7b..d263871b66dca 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -184,7 +184,30 @@ static ssize_t type_show(struct device *dev,
 
 static DEVICE_ATTR_RO(type);
 
+static ssize_t force_ro_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+
+	return snprintf(buf, PAGE_SIZE, "%d\n", nvmem->read_only);
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


