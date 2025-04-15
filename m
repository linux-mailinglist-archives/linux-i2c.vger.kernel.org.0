Return-Path: <linux-i2c+bounces-10339-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B902FA895AF
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 09:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C885417E3C4
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 07:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959FF2750E7;
	Tue, 15 Apr 2025 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EK+yQOjB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBDB24169D;
	Tue, 15 Apr 2025 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703597; cv=none; b=svEQzrLm0Mp/dOZ+lbq5IMnx/5N6w1WQ3gNaRjaeSoEJCRFjZIYYBPU9k//ScR0DkrmSPiYZngJFfXjBtcJ8hddpm+nNuiDn5Jq38tlExrn2sZOcp5zfKV/0n+gIiELEskBZQN1q19z7Fkf9f2lvlvakNTeRhyaCvd+HQwIF4og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703597; c=relaxed/simple;
	bh=fj87Ge4+Z4L8TW3BbiLnnTXesT/+hsNjN1y3z7e+Mkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gbB/nKkRZ5OVUvI57qxsG0WPdpCAjCBBxYd3WPw0nUK5mRDcxP+gwGsCcxrAILk3rWpLxVeO8AkIYVKagXzoxFoqoewv/ZIpIehULCryyPYF7dv0mAEPCLOisMcVaHgcvjTQOFSIJBJiKTa0Dqc+3liXVyVrzH46mLIbs9A6m8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EK+yQOjB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2ABC4CEDD;
	Tue, 15 Apr 2025 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744703596;
	bh=fj87Ge4+Z4L8TW3BbiLnnTXesT/+hsNjN1y3z7e+Mkg=;
	h=From:To:Cc:Subject:Date:From;
	b=EK+yQOjBOmd1XzZmqH7iP2Xe3e3aND27IbJfvw8ZYNElItdtNokMw7lNo74YbaFhG
	 v6USctTyL8CB7JDBfT0RPEHH+1PckBdZw17dp9r8C4pC4ZPka3r1X0Z2G0sB2oiGoE
	 gHt9hZeYXpEzRVDh1vM7r5WiUmiaActjbPERtoeAYE4s9JlRxMiBlXdQgNZmDi79c3
	 2ypjm1SCHU04YgGiglJTNlDUgoOtCCIfkF5FvedMP/2oZR5FrBJ42yi2nNqJzQGd4g
	 EBgG+o2tXr0xS9QNHMWVIPWtwnl64lKpVbChBtH8EKsk8aRNnL4KM2SIGdpOq5nkwo
	 TW6lShjOzf8Dg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u4b6X-000000004Eq-1Ib1;
	Tue, 15 Apr 2025 09:53:13 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vignesh R <vigneshr@ti.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Jayesh Choudhary <j-choudhary@ti.com>
Subject: [PATCH] i2c: omap: fix deprecated of_property_read_bool() use
Date: Tue, 15 Apr 2025 09:52:30 +0200
Message-ID: <20250415075230.16235-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using of_property_read_bool() for non-boolean properties is deprecated
and results in a warning during runtime since commit c141ecc3cecd ("of:
Warn when of_property_read_bool() is used on non-boolean properties").

Fixes: b6ef830c60b6 ("i2c: omap: Add support for setting mux")
Cc: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/i2c/busses/i2c-omap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 16afb9ca19bb..876791d20ed5 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1454,7 +1454,7 @@ omap_i2c_probe(struct platform_device *pdev)
 				       (1000 * omap->speed / 8);
 	}
 
-	if (of_property_read_bool(node, "mux-states")) {
+	if (of_property_present(node, "mux-states")) {
 		struct mux_state *mux_state;
 
 		mux_state = devm_mux_state_get(&pdev->dev, NULL);
-- 
2.49.0


