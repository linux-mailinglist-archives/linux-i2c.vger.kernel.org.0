Return-Path: <linux-i2c+bounces-10450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73686A91665
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 10:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF6A3AE6E7
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 08:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C78E22E403;
	Thu, 17 Apr 2025 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7TtqNLv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B322E011;
	Thu, 17 Apr 2025 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744878321; cv=none; b=n9/kRfUpNNuimqN5zmd17qPbyIi0q3vhI3Sn0swnwMuDQ/5cOvG9GEsyZq4qyD6rX/knfgAbyp3iCG6vRjBA8sbTdaX6/wuySO6CtJcR+sCvZRDHi4SEUNqGoBky2zeoRB4tE3/yiFXnG8yiS4D8C+N4gDQrvgHRFyud1gilSJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744878321; c=relaxed/simple;
	bh=8L1voKG5qXOIBBuMnJMvx1MQh/Oz9nEc8hHGq/1Vog8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EIaRjt0jnpTDsWeXgD4s8rtqP+2drkIWcCzZgEPveovtoWYZBlxuHKIiAxycihEq2LsIcJNKBCmii6dKJse5dria6K+TBqEo5UbBoQ7DePLkAT1dUPsq7vBRt2ZCrr5hqQTY+ClDnwLmhwKDOlUDjQioWgJXp1YJXd8VPQ4H/p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7TtqNLv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C24C4CEE4;
	Thu, 17 Apr 2025 08:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744878320;
	bh=8L1voKG5qXOIBBuMnJMvx1MQh/Oz9nEc8hHGq/1Vog8=;
	h=From:To:Cc:Subject:Date:From;
	b=Q7TtqNLvoVx6yLrNA1yTYw8iLvswSTOsea8EA9zb2VekL74Hs5m3SbcaCpkXw6GUq
	 QimjfSI0dVa00WGwxBwAbaoqUwlggOUdGipC5mJx9OfhLn0j8De88oYZtrl3MyQ+QN
	 ags7ABemahDgVNDQvc6znspqk4h3U4dL0vZs33HMyMdOzTswTk72RsCWvTNXtBYZ1d
	 +e7lJAfji5lC14M1x0VFmEZxhbpJcSHjs0GlA3MTvwHZg4yzqR8VQo0yLuxSO2rI6E
	 GQm2u2HrwOMVXKvNzOjyom2o6syX1BETUMfwgv2MS1nzRVtqQpBuYAH/mYiBZqNBfp
	 QJJb5BOREu10A==
From: Philipp Stanner <phasta@kernel.org>
To: Seth Heasley <seth.heasley@intel.com>,
	Neil Horman <nhorman@tuxdriver.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Robert Richter <rric@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 1/2] i2c: ismt: Use non-hybrid PCI devres API
Date: Thu, 17 Apr 2025 10:25:11 +0200
Message-ID: <20250417082511.22272-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ismt enables its PCI device with pcim_enable_device(). This,
implicitly, switches the function pci_request_region() into managed
mode, where it becomes a devres function.

The PCI subsystem wants to remove this hybrid nature from its
interfaces. To do so, users of the aforementioned combination of
functions must be ported to non-hybrid functions.

Replace the call to sometimes-managed pci_request_region() with one to
the always-managed pcim_request_region().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/i2c/busses/i2c-ismt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ismt.c b/drivers/i2c/busses/i2c-ismt.c
index c93c02aa6ac8..7aaefb21416a 100644
--- a/drivers/i2c/busses/i2c-ismt.c
+++ b/drivers/i2c/busses/i2c-ismt.c
@@ -933,7 +933,7 @@ ismt_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return err;
 	}
 
-	err = pci_request_region(pdev, SMBBAR, ismt_driver.name);
+	err = pcim_request_region(pdev, SMBBAR, ismt_driver.name);
 	if (err) {
 		dev_err(&pdev->dev,
 			"Failed to request SMBus region 0x%lx-0x%lx\n",
-- 
2.48.1


