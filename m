Return-Path: <linux-i2c+bounces-9427-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AEBA3417D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 15:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94A5F163855
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 14:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCED281366;
	Thu, 13 Feb 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGVXhOM8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA1281345;
	Thu, 13 Feb 2025 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739455857; cv=none; b=HP40rgPJ8vGediZYKj1VCcZeVXjJniRWYqvtFog1HEsA/WWNG1CgmywPatGuUqmDTpqGCXFo3+MIGT/gtDhhaUN7jr8+kjMN6jOrZ1zrTUf3QhMNn61SCMde7GZGUCGkdaoV25Ww0ksvel9fxl5tsWt66R1Sevp3C6xLJOWKsNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739455857; c=relaxed/simple;
	bh=ToTyMsihtZioDgRW6E04wgRS/tvQ6CsQiomouIaR97s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CkLmWiguTPDRiOrDxZ8eBbNI0GF2FW0JPAKY1WYPBg5kiSRECFRtuZhpsfoJ1/VqpiEv72tNZXNDkRzPpqBYBsuHt/XEG3QM65pIxxIZ0caiD53xXI8r05K5KGhpbo5OA+nKatEBZY9MIRwVxUZ18XXVE8ZaGx+71varrBMlqSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGVXhOM8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739455856; x=1770991856;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ToTyMsihtZioDgRW6E04wgRS/tvQ6CsQiomouIaR97s=;
  b=CGVXhOM8lTHl6CEflJu/a+SkF3SsNbIGDOn9EcT8W+NFllOjXya/RUxd
   tOAdPIHRga3Ng9v74gr1KSA9UfGSIx0pReQ1lWu06oT9i/qG5XMRA7X59
   CJwi70w0+onhEVf/NbxSOhD5o8xBtX+ZCL7x/PSX2FCsIrvY4a7nenr3C
   yZnaj043BrNkQKYctS8h0+aZV6n1BmRNB67VM/TC3bpp/h4Yusxfxwrbj
   LdRQRSTDDgf9RHwUdJEUq7vzSjBWOZyXAmgqxaXPEp6fpkJeSD3oBAtKi
   knIMLu1QG1JQufA/j8Gln4SHOG0sWtPz3Im2oUGbipd7gaEEz9LwAcWDT
   g==;
X-CSE-ConnectionGUID: JpqVpUKSQKmAp69mQcrQmQ==
X-CSE-MsgGUID: Qr/ay57IQRiQHTZzh3JCuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40273324"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40273324"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 06:10:54 -0800
X-CSE-ConnectionGUID: 74s6Vg81S52j4/6jpBZxHA==
X-CSE-MsgGUID: femaWunTSu+NHGOUW7Rs2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113815326"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Feb 2025 06:10:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 214361FD; Thu, 13 Feb 2025 16:10:47 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 00/10] i2c: busses: Introduce and use i2c_10bit_addr_*_from_msg()
Date: Thu, 13 Feb 2025 16:07:14 +0200
Message-ID: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For 8-bit addresses we have a helper function, define similar ones
for 10-bit addresses and use it in the drivers. It allows to remove
some boilerplate code.

Fabrizio, I haven't collected your tags as code changed more than 50%, however
semantically the parts you reviewed stay the same.

In v2:
- introduced hi/lo helpers (Geert)
- rewrote series based on the above
- added a couple of new converted drivers

v1: https://lore.kernel.org/r/20250212163359.2407327-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (10):
  i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
  i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
  i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
  i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers

 drivers/i2c/busses/i2c-axxia.c    | 21 +++------------------
 drivers/i2c/busses/i2c-bcm-kona.c |  6 +++---
 drivers/i2c/busses/i2c-brcmstb.c  | 11 +++++------
 drivers/i2c/busses/i2c-eg20t.c    | 28 +++++-----------------------
 drivers/i2c/busses/i2c-ibm_iic.c  | 14 ++++++--------
 drivers/i2c/busses/i2c-kempld.c   | 10 +++++-----
 drivers/i2c/busses/i2c-mt7621.c   | 20 ++++++++------------
 drivers/i2c/busses/i2c-mv64xxx.c  | 12 +++---------
 drivers/i2c/busses/i2c-rzv2m.c    | 15 +++++----------
 include/linux/i2c.h               | 14 ++++++++++++++
 10 files changed, 57 insertions(+), 94 deletions(-)

-- 
2.45.1.3035.g276e886db78b


