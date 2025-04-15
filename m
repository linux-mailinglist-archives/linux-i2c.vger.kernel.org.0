Return-Path: <linux-i2c+bounces-10353-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E277EA8A2EC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 17:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F394617174A
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 15:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150F729C354;
	Tue, 15 Apr 2025 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsTNqLfy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA58B2951D0;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731437; cv=none; b=gLns0qljovWzneguRiZSJRE/XWGY+HA0uXqsEg+VUuH9nCP7Z480ywQe17C3lsuEaxRpknzoF24krReHZx1iLA7FPPhra12foCr5m3FCn97+xVwhUFlsVpg1jx0ZIPayfLnVFntQBOTKS09u6OEXuWfWTmndnFhVJBObtvR637w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731437; c=relaxed/simple;
	bh=tKCZ1U57MVrN0lerBtOC7DMLUFHO1/PGHr6C3AN/kw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crS9bMegWwtxWbrUDLtQWKH2C27BAv12DCsosmd24yRXCMeUlfbqi+02VNUZGo5LI6Dz42yer1m7AvgcAl5zjDWcCBRcjNh6r1lkuUl8ix5XyZKbv/+4wjJThHge8kfYwutpDc8glSZkfHp6wu75IyiHw+6jMK3Ilqy+W8EAQp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsTNqLfy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45DBBC4CEEC;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744731437;
	bh=tKCZ1U57MVrN0lerBtOC7DMLUFHO1/PGHr6C3AN/kw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rsTNqLfyi72SZ2jdirJeSjURBXX62aZ3L4pWjWLptiWpw2cfwZe/aRXiQoEaOh4g5
	 RLBOosAfAdYQtJgmkQoTKYqqnhgD6zjHH2wtCPTV/YJltfh4aZs3h6P+ObW3x1zwWo
	 CtLJFr08sd65Rrec7g9PTaXiGScXZa3ArJQla2WLBTVQTRskWfFcRoTTpACdHw0GZx
	 /fbvokcvpvMPAZqSOZB9qn9hyf7MPRAYfpf92zozbk0aN42rIqjTfSw0J8WMc5sbjS
	 GaICvSypnddmjlIYeLpm4LrLFSX44d7INNmiyQA1ngqw98f+TNdtdO5ZGweFn9rBIu
	 qWr8fXD3ygmSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B65C369C1;
	Tue, 15 Apr 2025 15:37:17 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Tue, 15 Apr 2025 15:36:56 +0000
Subject: [PATCH v2 2/6] i2c: pasemi: Sort includes alphabetically
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-pasemi-fixes-v2-2-c543bf53151a@svenpeter.dev>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
In-Reply-To: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=d4SrViBETCvEIVGrCu813u0fCI79k8TBuEJCcmGpDI0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/q/WtWl7ddnLW1MubOp8d16cesWr2/7U2cXBHtceHk94
 Xb343vXOkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATyZrO8D+9Oq6hSL4vb+s3
 aes9x67wXZ7ywlla4kKDZuwqy/eW7yMY/ik9+WNdy5A+zzfXXDRK0vDdoZPBj/T0lJ3n3axrt+s
 uZwUA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Sven Peter <sven@svenpeter.dev>

No functional changes.

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 10 +++++-----
 drivers/i2c/busses/i2c-pasemi-pci.c  | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index 71cc8cfc7c5cbf3924269f6217712d42008c03ff..df1b0087dcacb0a3b94196368137d5e20b0e6d7e 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -6,15 +6,15 @@
  */
 
 #include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/kernel.h>
-#include <linux/stddef.h>
 #include <linux/sched.h>
-#include <linux/i2c.h>
-#include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/io.h>
+#include <linux/stddef.h>
 
 #include "i2c-pasemi-core.h"
 
diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
index 77f90c7436eda2df16afd7f1cac79355fb005bfd..b9ccb54ec77e22bb1b77848c858e2e0cc51db7e3 100644
--- a/drivers/i2c/busses/i2c-pasemi-pci.c
+++ b/drivers/i2c/busses/i2c-pasemi-pci.c
@@ -5,15 +5,15 @@
  * SMBus host driver for PA Semi PWRficient
  */
 
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/kernel.h>
-#include <linux/stddef.h>
 #include <linux/sched.h>
-#include <linux/i2c.h>
-#include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/io.h>
+#include <linux/stddef.h>
 
 #include "i2c-pasemi-core.h"
 

-- 
2.34.1



