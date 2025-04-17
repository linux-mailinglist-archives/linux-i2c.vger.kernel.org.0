Return-Path: <linux-i2c+bounces-10451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2FA91667
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 10:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F038445801
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 08:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9492622FACA;
	Thu, 17 Apr 2025 08:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ea2R1M5N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBDB22F3A8;
	Thu, 17 Apr 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878323; cv=none; b=ikQRaSHTtOQuKNaaJKsujT4OEEnqg73X9E7z+gwG904GKUpllnnIRPjkYvNBDGgrz4+mtLVK4tp66P2ZtXMjtv9C6cGnCe3cYhj0YU65d3QKHv4QKAzmJHA89uIROLvmN4fMZ+aCWktkt9LNjsLqDeuCEeO0LRvR8BuhV7kqv4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878323; c=relaxed/simple;
	bh=yzHrg+rkgUvxrzdi1fRil713s99SCk5tLba9qmsqsPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBC1joiIh9f0UgWIm03dwOZHsi9BNXUWf0lpNTc0Ki9sQOUsso/rkPr2/J28UH6GpIGqGrZszv2QWIbZjmiyvEQk+F0D3Nccf2EAdzqFly58RRXrr5tVLkhbcwIDlegPgiXfYUP/sPj+7lprIZqFRAued24XrLM+FkkDnKxNB7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ea2R1M5N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DE6C4CEE7;
	Thu, 17 Apr 2025 08:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744878322;
	bh=yzHrg+rkgUvxrzdi1fRil713s99SCk5tLba9qmsqsPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ea2R1M5NQa87Pi4uoXS1JyE99ALdHRU2br8FRT/gTD0jmlXZOt/OeCLgPmp7EY+el
	 BMZl/F79cTXHCO/tXXvPaHYSlfBu7bYw1qi+SiPnMwOUz69CxNMsqxBRV4cBon7AhX
	 Hbwswp4BupVUu1MoxkKK9aKryWABfqzbwCJf3/vqQmT9T9YTTte2rc/ZsDgaevIh/x
	 nwVFua6yKAIDkqxWoa4rnwd3vH02UJz5EN+kbgMwoLa5KpHx+JUORgyavQ8f+NEL/4
	 MsJQsVJF6lkpRpjLfhBUwNEvwlqRbXzZ/yQ8Np0eP9+FK/9QlrodDYAk7+CGhJ558S
	 B7eyDSVEFr3Hw==
From: Philipp Stanner <phasta@kernel.org>
To: Seth Heasley <seth.heasley@intel.com>,
	Neil Horman <nhorman@tuxdriver.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Robert Richter <rric@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 2/2] i2c: thunderx: Use non-hybrid PCI devres API
Date: Thu, 17 Apr 2025 10:25:12 +0200
Message-ID: <20250417082511.22272-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417082511.22272-2-phasta@kernel.org>
References: <20250417082511.22272-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

thunderx enables its PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_regions() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Replace the call to sometimes-managed pci_request_regions() with one to
the always-managed pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/i2c/busses/i2c-thunderx-pcidrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
index 143d012fa43e..93c18c99178d 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -175,7 +175,7 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	ret = pci_request_regions(pdev, DRV_NAME);
+	ret = pcim_request_all_regions(pdev, DRV_NAME);
 	if (ret)
 		return ret;
 
-- 
2.48.1


