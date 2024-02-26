Return-Path: <linux-i2c+bounces-2014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC2B868310
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 22:29:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98A47B22120
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 21:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD26E12F593;
	Mon, 26 Feb 2024 21:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvfIGU9N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA013172B;
	Mon, 26 Feb 2024 21:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708982973; cv=none; b=DSj4nH5YlEHW9QiAFmtijGPjL3inVGPn0CmWno9wVvHl3panIH1Gu69TuPgHol2Xvnx1qc1M4kNNT+ZCR8dbtCu6rQ91Bt9W2LjNnPJzB5yEuAGoG6VlqaxKnL5vRpulpUqus59cDMQBfyDqHqPZvIKSoqdErkIcLuWHAbHEIYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708982973; c=relaxed/simple;
	bh=2rkHSH3OXibBHquAGoNmanbJaTrZopPHIqDs6Th/QeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tObGiCJa8yNwxS5I/gY8llG1C9TTsJDoiWdPxmzT5IT94k3FBCY5b+wqeSxxDiD3H1v0Yrtf6y8amQ2edjFJr9xQjG24CcmkTrGRgsNUTE4/myG6EGpQRv6RDrBGFFJVei/WHVFSXMHclr53oHgxOwmravEpkiHk8qRlQosGHBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvfIGU9N; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708982972; x=1740518972;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2rkHSH3OXibBHquAGoNmanbJaTrZopPHIqDs6Th/QeE=;
  b=FvfIGU9N+/f/tnmhIAfmlr9LunIJzfLDsrDVScDoiXmgLZaSgFKj8j/7
   AGWiNFagYdWOxWx6gJIxOq9uTAqvWHeYPmvbR9fpeuRiC4PBc68r7nw8w
   eeiAbHSVuxqpCAmxmjq0WMp1Wy6aerPQ3u43kE9iUt8hKJQb3647YhTND
   CgVAcQ8Zp/3fmMrnuFgRi52svZOhQ2kKV8nkGsLG9e93ARx4Js64lecFA
   OBKkByuBCSb+jRv0NLcJ0khhYJR9wXpd2JKHLjgK/I6szFdci8ZNO6WOz
   1f79DlfvE4SbgTpn88BXPsQEYjMrnw20zW0JparcTEStCW4RInHTV3Nez
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3457807"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="3457807"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 13:29:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="7166216"
Received: from jekeller-desk.amr.corp.intel.com ([10.166.241.1])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 13:29:31 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
To: Kees Cook <keescook@chromium.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gustavoars@kernel.org,
	Peter Rosin <peda@axentia.se>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH v2] mux: convert mux_chip->mux to flexible array
Date: Mon, 26 Feb 2024 13:29:25 -0800
Message-ID: <20240226212925.3781744-1-jacob.e.keller@intel.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mux_chip structure size is over allocated to additionally include both
the array of mux controllers as well as a device specific private area.
The controllers array is then pointed to by assigning mux_chip->mux to the
first block of extra memory, while the private area is extracted via
mux_chip_priv() and points to the area just after the controllers.

The size of the mux_chip allocation uses direct multiplication and addition
rather than the <linux/overflow.h> helpers. In addition, the mux_chip->mux
struct member wastes space by having to store the pointer as part of the
structures.

Convert struct mux_chip to use a flexible array member for the mux
controller array. Use struct_size() and size_add() to compute the size of
the structure while protecting against overflow.

After converting the mux pointer, notice that two 4-byte holes remain in
the structure layout due to the alignment requirements for the dev
sub-structure and the ops pointer.

These can be easily fixed through re-ordering the id field to the 4-byte
hole just after the controllers member.

This changes the layout from:

struct mux_chip {
        unsigned int               controllers;          /*     0     4 */

        /* XXX 4 bytes hole, try to pack */

        struct mux_control *       mux;                  /*     8     8 */
        struct device              dev __attribute__((__aligned__(8))); /*    16  1488 */

        /* XXX last struct has 3 bytes of padding */

        /* --- cacheline 23 boundary (1472 bytes) was 32 bytes ago --- */
        int                        id;                   /*  1504     4 */

        /* XXX 4 bytes hole, try to pack */

        const struct mux_control_ops  * ops;             /*  1512     8 */

        /* size: 1520, cachelines: 24, members: 5 */
        /* sum members: 1512, holes: 2, sum holes: 8 */
        /* paddings: 1, sum paddings: 3 */
        /* forced alignments: 1 */
        /* last cacheline: 48 bytes */
} __attribute__((__aligned__(8)));

To the following:

struct mux_chip {
        unsigned int               controllers;          /*     0     4 */
        int                        id;                   /*     4     4 */
        struct device              dev __attribute__((__aligned__(8))); /*     8  1488 */

        /* XXX last struct has 3 bytes of padding */

        /* --- cacheline 23 boundary (1472 bytes) was 24 bytes ago --- */
        const struct mux_control_ops  * ops;             /*  1496     8 */
        struct mux_control         mux[];                /*  1504     0 */

        /* size: 1504, cachelines: 24, members: 5 */
        /* paddings: 1, sum paddings: 3 */
        /* forced alignments: 1 */
        /* last cacheline: 32 bytes */
} __attribute__((__aligned__(8)));

This both removes risk of overflowing and performing an under-allocation,
as well as saves 16 bytes of otherwise wasted space for every mux_chip.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
Changes since v1:
* Rebased and updated the commit message slightly.

 drivers/mux/core.c         |  7 +++----
 include/linux/mux/driver.h | 10 +++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 775816112932..9225abca7897 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -98,13 +98,12 @@ struct mux_chip *mux_chip_alloc(struct device *dev,
 	if (WARN_ON(!dev || !controllers))
 		return ERR_PTR(-EINVAL);
 
-	mux_chip = kzalloc(sizeof(*mux_chip) +
-			   controllers * sizeof(*mux_chip->mux) +
-			   sizeof_priv, GFP_KERNEL);
+	mux_chip = kzalloc(size_add(struct_size(mux_chip, mux, controllers),
+				    sizeof_priv),
+			   GFP_KERNEL);
 	if (!mux_chip)
 		return ERR_PTR(-ENOMEM);
 
-	mux_chip->mux = (struct mux_control *)(mux_chip + 1);
 	mux_chip->dev.class = &mux_class;
 	mux_chip->dev.type = &mux_type;
 	mux_chip->dev.parent = dev;
diff --git a/include/linux/mux/driver.h b/include/linux/mux/driver.h
index 18824064f8c0..84dc0d3e79d6 100644
--- a/include/linux/mux/driver.h
+++ b/include/linux/mux/driver.h
@@ -56,18 +56,18 @@ struct mux_control {
 /**
  * struct mux_chip -	Represents a chip holding mux controllers.
  * @controllers:	Number of mux controllers handled by the chip.
- * @mux:		Array of mux controllers that are handled.
- * @dev:		Device structure.
  * @id:			Used to identify the device internally.
+ * @dev:		Device structure.
  * @ops:		Mux controller operations.
+ * @mux:		Flexible array of mux controllers that are handled.
  */
 struct mux_chip {
 	unsigned int controllers;
-	struct mux_control *mux;
-	struct device dev;
 	int id;
-
+	struct device dev;
 	const struct mux_control_ops *ops;
+
+	struct mux_control mux[];
 };
 
 #define to_mux_chip(x) container_of((x), struct mux_chip, dev)

base-commit: 45ec2f5f6ed3ec3a79ba1329ad585497cdcbe663
-- 
2.41.0


