Return-Path: <linux-i2c+bounces-10643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCED1A9E2BC
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 13:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB9B53BAADC
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 11:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E4D1251783;
	Sun, 27 Apr 2025 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEgItdNt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132B012E5B;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745753466; cv=none; b=i9vE8fKMGCjBWWO2kE2clRrIMvw+h9ssiGmTn6p7u7muw7sOyLR0k0Y0fWbZu2lpZ5WVToD/z0Pitfpoa+29wE3GpINDRzpckor2e65kGZOxBRSOrlcQvyK+ndGI/XKZnaIzmQhgo5RrdmHT6hajEQWoqnALqwyinFajD/KuGYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745753466; c=relaxed/simple;
	bh=R6oSEObaTaH0Rzyp6urqUx5bFx9N32/+kpJdZz3z61A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=razP5WGUr+G8xUstrNcz7P2Xn2OpbjrOunRWLghhw4O6zLp6uFoXFEuOnGesRSYZ8K2KL4/pU7M9BSA8NcpWMWp1shmj4+mLMkbiZ/zR+KTL8ZBmrDxmPccBWbP+djkU17TDJI0VKEqqWCW5E/ylIVSiKOoWeT39zL2Jp9hSeTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEgItdNt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 995F0C4CEED;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745753465;
	bh=R6oSEObaTaH0Rzyp6urqUx5bFx9N32/+kpJdZz3z61A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hEgItdNtoXNGeDRKKF2+f7EaObMTpIzx34T5OV3ZjtkWF4JNLx467w/QJLmcgdYoj
	 XQqQNZ1vEuM0zUtdIkZVdapJNARIMy2Fy4zoWfqvYzAms5cn9UM+ZHNvMYqHHcVmhD
	 RivTJNiyy32UlHGta0qh5ssW3bvB+XsnISPikcMrVUoTY0CR6/5PFjAN6y1xFF8TUj
	 UPvFrniZoXqAsIKi/gW7VJAG3iiZoLyJ+QEMNIeKlg6ha7/dW0DAplpSrTuAb3NTQQ
	 r/s5RlpICdjqMIqJrF/S/gd3yZ8Rhyt9piPaDaD1J9i13FCmY5VUZESpZTAQOyBwwX
	 /urBMdP1lcn6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B3CC369D3;
	Sun, 27 Apr 2025 11:31:05 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 27 Apr 2025 11:30:43 +0000
Subject: [PATCH v3 1/4] i2c: pasemi: Enable the unjam machine
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-pasemi-fixes-v3-1-af28568296c0@svenpeter.dev>
References: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
In-Reply-To: <20250427-pasemi-fixes-v3-0-af28568296c0@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=9e+uBDc/DvIOiwP1SNDeg2HD118JGZSQxiaK6ReJfNw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQwafaFHGRN/pm9qYmMSf79lsPWPLjOhVt4wOceQ6n+U6Z
 LZbUCq7o5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRX2EM/8y3Nq/qURNX6vr1
 sGbbZH5LpeNrftl+MbQvP/deIjIrgJ/hr0jOQpE37RWKl0sn5OmuliuMVPZ7Gtx7OeSad/zkPvP
 PDAA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Hector Martin <marcan@marcan.st>

The I2C bus can get stuck under some conditions (desync between
controller and device). The pasemi controllers include an unjam feature
that is enabled on reset, but was being disabled by the driver. Keep it
enabled by explicitly setting the UJM bit in the CTL register. This
should help recover the bus from certain conditions, which would
otherwise remain stuck forever.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index df1b0087dcacb0a3b94196368137d5e20b0e6d7e..3f5571a90c1d268ea2a9d95285f1a5e47f0481ff 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -71,7 +71,7 @@ static inline int reg_read(struct pasemi_smbus *smbus, int reg)
 
 static void pasemi_reset(struct pasemi_smbus *smbus)
 {
-	u32 val = (CTL_MTR | CTL_MRR | (smbus->clk_div & CTL_CLK_M));
+	u32 val = (CTL_MTR | CTL_MRR | CTL_UJM | (smbus->clk_div & CTL_CLK_M));
 
 	if (smbus->hw_rev >= 6)
 		val |= CTL_EN;

-- 
2.34.1



