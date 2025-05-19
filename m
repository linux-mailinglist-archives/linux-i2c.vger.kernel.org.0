Return-Path: <linux-i2c+bounces-11016-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BF6ABBC21
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41A8517C722
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C362750FB;
	Mon, 19 May 2025 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FlgA5dG8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B1D224895
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 11:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653208; cv=none; b=V8Ml3gXvmguriUCnfHCm8PA0+zwBGwB2RxXZ/ZWV9FxMYmE2gFvxQ+SSCn1256wQNbWUQfAwOOosPf/13/o6brKwid5jkN99d9TrVwGMJVhbMR0GaUtrN0WLK2XDeQDvs3f1CbI84FX2+5nv6S5MEd1rmPxvQqmbqmWNhhIq+YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653208; c=relaxed/simple;
	bh=d0YH/RUQ2Y9+RUrzEbOSu6slh6dkfZWjG6vLO7QPACc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dVqUdwu942S/yH2tQAFxaRbMk3/ndEmOsTvMcZAvgWC67C4ZOn8YIAqtNizvB/fb6TmX7JZ+hCemJwff3UC+4lfprD/NkXcXgy4UKIUoA7dn5GamDdRwuc6wfjce+8SOLxZOQppQ5UlKYrZv5Vs1ofwQPzIN/xlyUCjmjFeTsyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FlgA5dG8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Pg/h+3AUuXh+Lp//vEQMpLvp/Pda67WjMagYQLQYIHw=; b=FlgA5d
	G8GgeflPZkA3xueZMltVQcJhbp0y8nMWJgZ3oNs6jLij1j5LdEDjvj+BvITOrNa6
	rNNdINIX0aIGFIkDrYKLy29isibdUvofLEdqu1Eucx9GawQFTpqZz+BFa8UDM1Hv
	xCrX4SKz9V46cFD3s9IdtbPOG+D95OrHU+Rq7tMLertpU4PVjCJ/eRHwAgcP8cbm
	m2YNGJLellYWSgvYk/9CwoAUImH/xPqpNS9kelaph2PsRvwtZSMpbzTG05W53skF
	tNnO6rVSwliO6kkv8iF21N1+Lq+BoovqRY5zTmDM662HQV3JqtTQbo+udRBGLT3Q
	8mBVy0hFBbFc1EAA==
Received: (qmail 2453716 invoked from network); 19 May 2025 13:13:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:13:21 +0200
X-UD-Smtp-Session: l3s3148p1@q6k3OHs1estZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Date: Mon, 19 May 2025 13:13:12 +0200
Message-ID: <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'of_node' in i2c_boardinfo is deprecated in favor of 'fwnode'. The I2C
core handles them equally, so simply convert this driver to fwnode.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-powermac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index 9a867c817db0..f99a2cc721a8 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -349,7 +349,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		/* Fill out the rest of the info structure */
 		info.addr = addr;
 		info.irq = irq_of_parse_and_map(node, 0);
-		info.of_node = of_node_get(node);
+		info.fwnode = of_fwnode_handle(of_node_get(node));
 
 		newdev = i2c_new_client_device(adap, &info);
 		if (IS_ERR(newdev)) {
-- 
2.47.2


