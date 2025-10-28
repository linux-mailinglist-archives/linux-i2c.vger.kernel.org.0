Return-Path: <linux-i2c+bounces-13851-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1E8C143CA
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 12:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73A2F1AA3A28
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Oct 2025 10:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0430B2D5C74;
	Tue, 28 Oct 2025 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CrQINSfd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A466280033
	for <linux-i2c@vger.kernel.org>; Tue, 28 Oct 2025 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761648826; cv=none; b=IH4YyonqfksvnQ9AYqsndhw6gNwdvcErmXgvg9UlgScYqSRpIhTVrAKcMWMRLAOPpvKjmrhyG5CutV5SRh8Zd76MKrOhJFh/tTgdggu9VuC+uB7AyEOMVX4g6lNDSXi0ORX4dCBSQMYrmpdvmbkBAiKwFQm5nUDkkBZzuoL3DGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761648826; c=relaxed/simple;
	bh=bsHvein7eSvYOUnBQTCUssXW2X7MpgNF6i6SL5Zj9oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dD5/g1fidia82HLzPsPm1gI8BfT/lRKf6K5S+0z/LUTRm7nXAR1U0JA5aNhFBcsR3UI9tF2JPMSXrb+TlmF+HNGJul++QxK/iMWv2jWVqX+v8EeZeaeKeT5Wf5MDJGgyCmGb7ijaX1K16UkbpglHGbJy4QuUd3MdzLK+YxQXOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CrQINSfd; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761648824; x=1793184824;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bsHvein7eSvYOUnBQTCUssXW2X7MpgNF6i6SL5Zj9oI=;
  b=CrQINSfduyExsU6FtAKnsJRwMVtMdBHKtQx+rcC5/JQWpbThRp7b/r4r
   B1FAutNaJ+DzA3A3FpM7Z35Y9Wj51M+tlOJE1K9GgOagOiZUhuWDRg3Gu
   faX7vaJ/D0pEftZpdAjix15OsYQC6G3yaXav83Iv9Gq/hDuHyTU537HT4
   DOt4kMy3Fwx9QA9ZodklgKojiOqLiMcHDVUdyHkhKzXTcPSSEGjBTVcV5
   o+GyjcEvvTuyxr4ZXvVORSURppJsbJh83TPYLtMTPccueobrv7lMNT9Se
   m3ADuQ8Z+eeDzaXS4I0ntlzKvFor8IYwz8rxkL25k4E2PWZz44a+NFpba
   Q==;
X-CSE-ConnectionGUID: sqTCiInRQZi+QJVedZcsYg==
X-CSE-MsgGUID: EaaULcGoS9e5uj71rZAMQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67583501"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67583501"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 03:53:44 -0700
X-CSE-ConnectionGUID: NdWn8H1KQ5GMM8oqgOM6kQ==
X-CSE-MsgGUID: D6N8/HZ1Siemne8yo2MsRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185228397"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2025 03:53:43 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: i801: Fix the Intel Diamond Rapids features
Date: Tue, 28 Oct 2025 11:53:42 +0100
Message-ID: <20251028105342.2281687-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Diamond Rapids does not support the iTCO feature.
Adding also the missing comment describing Diamond
Rapids while at it.

Fixes: 084cbc58e720 ("i2c: i801: Add support for Intel Diamond Rapids")
Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 91d4d14605aa..81e6e2d7ad3d 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -84,6 +84,7 @@
  * Panther Lake-H (SOC)		0xe322	32	hard	yes	yes	yes
  * Panther Lake-P (SOC)		0xe422	32	hard	yes	yes	yes
  * Wildcat Lake-U (SOC)		0x4d22	32	hard	yes	yes	yes
+ * Diamond Rapids (SOC)		0x5827	32	hard	yes	yes	yes
  *
  * Features supported by this driver:
  * Software PEC				no
@@ -1055,7 +1056,7 @@ static const struct pci_device_id i801_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_SOC_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, METEOR_LAKE_PCH_S_SMBUS,	FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, BIRCH_STREAM_SMBUS,		FEATURES_ICH5)			 },
-	{ PCI_DEVICE_DATA(INTEL, DIAMOND_RAPIDS_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
+	{ PCI_DEVICE_DATA(INTEL, DIAMOND_RAPIDS_SMBUS,		FEATURES_ICH5)			 },
 	{ PCI_DEVICE_DATA(INTEL, ARROW_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_H_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
 	{ PCI_DEVICE_DATA(INTEL, PANTHER_LAKE_P_SMBUS,		FEATURES_ICH5 | FEATURE_TCO_CNL) },
-- 
2.50.1


