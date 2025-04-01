Return-Path: <linux-i2c+bounces-10075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D3BA775EE
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 10:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DDE77A30F7
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 08:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019041EB186;
	Tue,  1 Apr 2025 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RxNGMpSR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA411E9B3C;
	Tue,  1 Apr 2025 08:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495065; cv=none; b=hvBVDGoLujO3LovpKg4rg5y4wcgKm7/oPXxGNAHPsActtWTqgeYudEBWvG/v8BTzPxWr8gKDcWytZUwSLUBAOZAYfhD5TqNNtcny/8UU98vrmRPfLgnfYlcfxLrW9JXfUUx3s8ocUz4hHlA4veSf8ZxOEEhV8lDZuTrApARLdFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495065; c=relaxed/simple;
	bh=0/XEeqL3S2KUXmALG2T2yy1ksxatgEi2IgV/5+0o/Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pEaOgIKlTaysH86QVfPNOTjbgFJXIAW0VIrNcUv80Klmuvub9CQSNbdB7ILwjHPyoMhQ1ZmKp+ik9Ped4UUkxZ7wJ8ah3x5xbBQPVtHGd0WZH8kH6veRCujfs7PQdM+EBPVlJ6/QxoBDP6Vg09qztQvvC8WkPxjtkmlsl6pC8AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RxNGMpSR; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 9A770433F6;
	Tue,  1 Apr 2025 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743495056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igMWkyz++SDitFI41TTlJl8kgNuFossuqgfrszue8Go=;
	b=RxNGMpSRdhy5XE9XwtMvKTNgeio+ZJFCO+OvXvnKbLpf/9qA3Ibk/3YMMkrBB5ChiRDzMV
	xTrNL0htswUUhdPqPQWYFhOVv0J6t1xGm70ec2ZbPosNG/nudgXKFEvAIYMHnSEmE1biaA
	eWXqT1UMkxil909gFj7fmfAKDtesN8tKm0caPzg+1/+3gnnBAVPgdBg08OALo7eIuYebM9
	fFjNmdb7I0hAPCxERBnT2ujzRwn++rv/SqWI5VZNhob5ZxvQwFt4QAG+dh8pirCiKuY5o1
	yDFFHDirX4asHAzTkP3RLzKm0rblinjGWRFiUWxp3PKDHFfyJnIl1S8kC4rFQA==
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 1/2] schemas: i2c: Avoid extra characters in i2c nodename pattern
Date: Tue,  1 Apr 2025 10:10:39 +0200
Message-ID: <20250401081041.114333-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401081041.114333-1-herve.codina@bootlin.com>
References: <20250401081041.114333-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Current nodename pattern doesn't limit the end of name for an i2c node.
It can match 'i2c@10-foo'.

In order to avoid matching to an incorrect name, avoid any extra
characters in nodename pattern.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 dtschema/schemas/i2c/i2c-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtschema/schemas/i2c/i2c-controller.yaml b/dtschema/schemas/i2c/i2c-controller.yaml
index 487e669..018d266 100644
--- a/dtschema/schemas/i2c/i2c-controller.yaml
+++ b/dtschema/schemas/i2c/i2c-controller.yaml
@@ -14,7 +14,7 @@ maintainers:
 
 properties:
   $nodename:
-    pattern: "^i2c(@.*)?"
+    pattern: "^i2c(@.*)?$"
 
   i2c-bus:
     type: object
-- 
2.49.0


