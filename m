Return-Path: <linux-i2c+bounces-15105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D70D3D19479
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E0D1301679D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD8C392C26;
	Tue, 13 Jan 2026 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtiHItD+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0813392B7E;
	Tue, 13 Jan 2026 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313080; cv=none; b=g5n34k5Hcuy8Aiu54hbSw2QkkW34UJl2G1yrk4gKPRjBuZq81e2uz3D47LASE1ohsmsniNnvexGHKyc9r0KxlX06kBdnzfftHGhvbbBFL2MxXFQ2Jz4/5ZhobiNLu7Qpu8klKjLVnQ5vxFH42r4SN6V7UbGxJzKVmgT3yFwVPj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313080; c=relaxed/simple;
	bh=Qxt7df73JWrwJSICgGr9I1eeQABKyG8t6l3ir7lsl3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NES69IOvTowKCBnDV2modpfKHwNXyaWqdzgmGcaHfP/YUtGMyYyBGxmPFDsTwLCmHYWKwffahOVBHfMyBv+FJxVAebrOtnuVMSbBG8FhfD4E8hpQBbfLknwPSGyZti+3j3yZFsCAWdE4g+KcQs6yo80o6vSMW+iXCx1UlMGblHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtiHItD+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768313078; x=1799849078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qxt7df73JWrwJSICgGr9I1eeQABKyG8t6l3ir7lsl3A=;
  b=WtiHItD+BZkzAVfAL8gWdq9BtROUllmfy71KBWM+8ZRkp9m3BP0w5HUT
   fWVdjhqD9oUKiPtxcz25MEdbpn4JSDS3eZ/MZZm9MtcBmBK9f2xOMXWym
   rKZjvpszterA/InvBIW9hOknNbNnNaBOlEr8Zjj/+/RMSVseOtLzcIFfi
   zekDwBKCupJPAtEz/mIYVGl7lWOS78r48BXZKDbNNeuOUbS3+mC6uO0Y5
   TcL1I4HlwSUXpnvI9zF/eLR7V5EMAaysXElxj8+Uu7H7906Xxd8Vv4YPK
   R65jFYobohRXfdJrXhbqu6z87Vif/M/Hwp4ErwLyg4aRi/umX0MhQDPbA
   g==;
X-CSE-ConnectionGUID: ed2b9P+TTl6XASbUOFNdzA==
X-CSE-MsgGUID: rEmJvCJxRRiyoMlcA2sg3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95072079"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95072079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:04:37 -0800
X-CSE-ConnectionGUID: NfwDFGNsTf2VD9dfrDhv4w==
X-CSE-MsgGUID: KETPDm+7RtyFMeaHAIOyGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204667385"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 06:04:35 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] i2c: Sysfs attribute files for the Unique Device Identifier fields
Date: Tue, 13 Jan 2026 15:04:28 +0100
Message-ID: <20260113140430.207990-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260113140430.207990-1-heikki.krogerus@linux.intel.com>
References: <20260113140430.207990-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to utilise the SMBus Address Resolution Protocol's
(ARP) Unique Device Identifier (UDID) also in user space,
the UDID details need to be exposed. With ARP the address is
also dynamically assigned (and may be reset) so it also
needs to be exposed to the user space with its own file.

The UDID details are only visible with ARP devices, but the
address file is made always visible for all I2C client
devices.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-bus-i2c |  53 ++++++++++++
 drivers/i2c/i2c-core-base.c             | 107 +++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c b/Documentation/ABI/testing/sysfs-bus-i2c
new file mode 100644
index 000000000000..b9ebfc2e1b9d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c
@@ -0,0 +1,53 @@
+What:		/sys/bus/i2c/devices/.../address
+Date:		September 2025
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file has the target address the I2C client responds to.
+
+What:		/sys/bus/i2c/devices/.../vendor
+Date:		September 2025
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file is only visible for ARP devices. It returns the Vendor
+		ID field from the SMBus ARP Unique Device Identifier. It is the
+		device manufacturer's ID assigned by the SBS Implementers Forum
+		or the PCI SIG.
+
+What:		/sys/bus/i2c/devices/.../device
+Date:		September 2025
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file is only visible for ARP devices. It returns the Device
+		ID field from the SMBus ARP Unique Device Identifier. The
+		device ID is assigned by the device manufacturer.
+
+What:		/sys/bus/i2c/devices/.../interface
+Date:		September 2025
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file is only visible for ARP devices. It returns the
+		Interface field from the SMBus ARP Unique Device Identifier.
+
+What:		/sys/bus/i2c/devices/.../subsystem_vendor
+Date:		September 2025
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file is only visible for ARP devices. It returns the
+		Subsystem Vendor ID field from the SMBus ARP Unique Device
+		Identifier.
+
+What:		/sys/bus/i2c/devices/.../subsystem_device
+Date:		September 2025
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file is only visible for ARP devices. It returns the
+		Subsystem Device ID field from the SMBus ARP Unique Device
+		Identifier.
+
+What:		/sys/bus/i2c/devices/.../vendor_specific_id
+Date:		September 2025
+Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+Description:
+		This file is only visible for ARP devices. It returns the
+		Vendor Specific ID field from the SMBus ARP Unique Device
+		Identifier.
diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2e61f1be8de6..6a3452a25972 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -685,6 +685,13 @@ name_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(name);
 
+static ssize_t
+address_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "0x%02x\n", to_i2c_client(dev)->addr);
+}
+static DEVICE_ATTR_RO(address);
+
 static ssize_t
 modalias_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -712,11 +719,109 @@ static DEVICE_ATTR_RO(modalias);
 
 static struct attribute *i2c_dev_attrs[] = {
 	&dev_attr_name.attr,
+	&dev_attr_address.attr,
 	/* modalias helps coldplug:  modprobe $(cat .../modalias) */
 	&dev_attr_modalias.attr,
 	NULL
 };
-ATTRIBUTE_GROUPS(i2c_dev);
+
+static const struct attribute_group i2c_dev_group = {
+	.attrs = i2c_dev_attrs,
+};
+
+static ssize_t
+capabilities_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return sysfs_emit(buf, "0x%02x\n", client->udid->capabilities);
+}
+static DEVICE_ATTR_RO(capabilities);
+
+static ssize_t
+vendor_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return sysfs_emit(buf, "0x%04x\n", client->udid->vendor);
+}
+static DEVICE_ATTR_RO(vendor);
+
+static ssize_t
+device_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return sysfs_emit(buf, "0x%04x\n", client->udid->device);
+}
+static DEVICE_ATTR_RO(device);
+
+static ssize_t
+interface_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return sysfs_emit(buf, "0x%04x\n", client->udid->interface);
+}
+static DEVICE_ATTR_RO(interface);
+
+static ssize_t
+subsystem_vendor_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return sysfs_emit(buf, "0x%04x\n", client->udid->subvendor);
+}
+static DEVICE_ATTR_RO(subsystem_vendor);
+
+static ssize_t
+subsystem_device_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return sysfs_emit(buf, "0x%04x\n", client->udid->subdevice);
+}
+static DEVICE_ATTR_RO(subsystem_device);
+
+static ssize_t
+vendor_specific_id_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return sysfs_emit(buf, "0x%08x\n", client->udid->vendor_specific_id);
+}
+static DEVICE_ATTR_RO(vendor_specific_id);
+
+static struct attribute *udid_attrs[] = {
+	&dev_attr_capabilities.attr,
+	&dev_attr_vendor.attr,
+	&dev_attr_device.attr,
+	&dev_attr_interface.attr,
+	&dev_attr_subsystem_vendor.attr,
+	&dev_attr_subsystem_device.attr,
+	&dev_attr_vendor_specific_id.attr,
+	NULL
+};
+
+static umode_t
+udid_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	if (to_i2c_client(kobj_to_dev(kobj))->udid)
+		return attr->mode;
+
+	return 0;
+}
+
+static const struct attribute_group udid_group = {
+	.is_visible = udid_is_visible,
+	.attrs = udid_attrs,
+};
+
+static const struct attribute_group *i2c_dev_groups[] = {
+	&i2c_dev_group,
+	&udid_group,
+	NULL
+};
 
 const struct bus_type i2c_bus_type = {
 	.name		= "i2c",
-- 
2.50.1


