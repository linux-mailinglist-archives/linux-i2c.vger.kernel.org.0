Return-Path: <linux-i2c+bounces-15056-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 529CCD12E7F
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 14:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E4933019268
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 13:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF163596F3;
	Mon, 12 Jan 2026 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ukpfmq4n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D127E06C;
	Mon, 12 Jan 2026 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768225753; cv=none; b=fhrqK2Th+ldoLVuc9U2JdW0Jm19Fb4x9QqN8DI1kz3MxY0RkvL2EjIgXy2tHvS+Ia6Nl3n2wDZo9y7aW7I6bnIiCR4mWFEjlX1KDtEkfD5klN/VZT21rZBJiqSK0J7J/u8OUq+FSOavlD8estWAiwvofOQarWTCZveYmCjwGj4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768225753; c=relaxed/simple;
	bh=qCWXBi+aTKd9zaGMwJOJjmzr111g+vvf73F56N3N8yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLQVBvwLihRtQtpMdELneF8IaxFDbiYNgB7NiNG0PrRKyfu1ufz+yZCnHu5F+pLAWh91AMqr989z9iXMAUlbUOwVNjP/FKXnHVtI1v5KpvHQ9pHafK7IfxDGMfB5jWkS8T3QoQN9GUvy10Ma+fJ7GQ5E5bnHT1sbWQrAcsxnrTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ukpfmq4n; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768225752; x=1799761752;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qCWXBi+aTKd9zaGMwJOJjmzr111g+vvf73F56N3N8yM=;
  b=Ukpfmq4nm1Qhch6q3j9t7Creg9K92L1jiDggxyw9QYEB6ZS9eQjwWrGb
   UBhgSp9q16n4QE31d1QJ+PJM5nY5X96KRJ/rwQ4HZ5BZF3e5mSYVHnaZf
   E8OgKiryaCW0iJkQEsPl1giPXRLfCrjEwAgHzIJUraYEnCls2wH6daQOH
   L/l3hw800LKbfeHTk593GtkGSgmoC10HtY85OkO+AGH8D/WZ69ShZVam5
   LIn0Xqjd2u6O7KCD/3ifl+SocI/bEPOcKzMK3SpmzB1hIbUwi55wScDia
   12gR7iaizZ8F4+6zaUFQg9P/aYyUUIzaRHBlZIiD8j3groVs2ItIw0Sok
   w==;
X-CSE-ConnectionGUID: RA0sbPSPTs2I3BnIbXH7eQ==
X-CSE-MsgGUID: DbieedHvSpSRXj/jYp26KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80604509"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80604509"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 05:49:12 -0800
X-CSE-ConnectionGUID: /tOT5H3WTR6cNGHY74iXbA==
X-CSE-MsgGUID: ZOLMNcZMSb+jYMwZW8Iclw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208568090"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 12 Jan 2026 05:49:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B394599; Mon, 12 Jan 2026 14:49:06 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi@smida.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v1 1/7] units: Add HZ_PER_GHZ
Date: Mon, 12 Jan 2026 14:46:09 +0100
Message-ID: <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The is going to be a new user of the HZ_PER_GHZ definition besides
possibly existing ones. Add that one to the header.

While at it, split Hz and kHz groups of the multipliers for better
maintenance and readability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/units.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/units.h b/include/linux/units.h
index 00e15de33eca..0c296a004e89 100644
--- a/include/linux/units.h
+++ b/include/linux/units.h
@@ -25,9 +25,12 @@
 #define MICROHZ_PER_HZ		1000000UL
 #define MILLIHZ_PER_HZ		1000UL
 
+/* Hz based multipliers */
 #define HZ_PER_KHZ		1000UL
 #define HZ_PER_MHZ		1000000UL
+#define HZ_PER_GHZ		1000000000UL
 
+/* kHz based multipliers */
 #define KHZ_PER_MHZ		1000UL
 #define KHZ_PER_GHZ		1000000UL
 
-- 
2.50.1


