Return-Path: <linux-i2c+bounces-15106-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1B8D194B8
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99718306CCE3
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62AA392C5E;
	Tue, 13 Jan 2026 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHspr5b9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB66392C33;
	Tue, 13 Jan 2026 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313081; cv=none; b=tHQtc6Pm1eAipJbvU0MHNoxd0A3CScZNQMAtDA8qcWqxdxGrKUCHArcytL5nXU9L8IqZiozFUFyCL4j9okmwJ6nwoxwVEejsKHT9oTGjvx/843uR86OfDTx23ctm+wU+Dj3GcXm2hPJyizkzZF94zscUlN7AYbrdacHxDPtuWMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313081; c=relaxed/simple;
	bh=xPZgH+6k11INydhdKYKex+vUnjrgixG/yfbcEXiepGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gherR2OVmAotneuVNUOYQWMRDuVLl+a/WeAvXIorMPytuYdWB9fsOY1ZsFKnypnuMlxv3mx2JFLeaHF0vxaxODuPXkOkuZrTVrDgkzOUMhPoL6A0ZgazNcsEcVkCpvjKAwqGqElaKGgHgluCDxLyaGMS/nmN8nEq1V8T96Y+jmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHspr5b9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768313080; x=1799849080;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xPZgH+6k11INydhdKYKex+vUnjrgixG/yfbcEXiepGs=;
  b=KHspr5b9yP/8+bbuQCirZqoyz1SZxNzvgcbielCEn5fDz4AUu9m0Gc/y
   XxaOuYZietA+SzzXo1derKXwd787tbzX9Aomgv44EOpngFIR7o4Q/R83Q
   UFzjg9TyCb4BHL2uPLguynXPTr/eQzBPy26wj7O5TotMil547gv0h5Gjv
   R1m6aUiSJlHLjvftKW82VBLji4t+c6bGDqHaqAXrtD8BJOtJsjNndCYjR
   rpuwSNJx/YdDKWRxHoBD3/5GZWYafa4vjsWJJpl4GG6XUnunsSuooDQiC
   sbuagw+ciKutSQ//qix09fahTBCKMTTY4+mvt2yAFGe23btISDyfbl9J6
   g==;
X-CSE-ConnectionGUID: y6Bttmj/SUeOi2RtVrVQ+A==
X-CSE-MsgGUID: zZ0fcPP4RPW4ppRcSKPfmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="95072082"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="95072082"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:04:39 -0800
X-CSE-ConnectionGUID: Iu7DwpsHR/ahdzqXLjsDQA==
X-CSE-MsgGUID: Qz1LK305SSqBGlac1jsuJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204667391"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2026 06:04:37 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] mctp i2c: Enable SMBus ARP discovery
Date: Tue, 13 Jan 2026 15:04:29 +0100
Message-ID: <20260113140430.207990-4-heikki.krogerus@linux.intel.com>
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

Since the SMBus Address Resolution Protocol (ARP) is now
supported with all I2C host adapters, every ARP-capable MCTP
device will get automatically enumerated. Those devices just
need to be bind to this driver.

The SMBus ARP-capable MCTP devices are identified by
checking the interface (MCTP SMBus/I2C Transport Binding
Specification section 6.5). The interface must match the ASF
protocol, so all devices that use the ASF protocol as their
interface will be probed by this driver.

Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_1.2.0.pdf
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/net/mctp/mctp-i2c.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/mctp/mctp-i2c.c b/drivers/net/mctp/mctp-i2c.c
index f782d93f826e..3a0ffe941c76 100644
--- a/drivers/net/mctp/mctp-i2c.c
+++ b/drivers/net/mctp/mctp-i2c.c
@@ -21,6 +21,7 @@
 #include <linux/netdevice.h>
 #include <linux/i2c.h>
 #include <linux/i2c-mux.h>
+#include <linux/i2c-smbus.h>
 #include <linux/if_arp.h>
 #include <net/mctp.h>
 #include <net/mctpdevice.h>
@@ -1096,6 +1097,12 @@ static const struct i2c_device_id mctp_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, mctp_i2c_id);
 
+static const struct smbus_device_id mctp_smbus_id[] = {
+	{ SMBUS_INTERFACE_ASF },
+	{}
+};
+MODULE_DEVICE_TABLE(smbus, mctp_smbus_id);
+
 static const struct of_device_id mctp_i2c_of_match[] = {
 	{ .compatible = "mctp-i2c-controller" },
 	{},
@@ -1110,6 +1117,7 @@ static struct i2c_driver mctp_i2c_driver = {
 	.probe = mctp_i2c_probe,
 	.remove = mctp_i2c_remove,
 	.id_table = mctp_i2c_id,
+	.smbus_id_table = mctp_smbus_id,
 };
 
 static __init int mctp_i2c_mod_init(void)
-- 
2.50.1


