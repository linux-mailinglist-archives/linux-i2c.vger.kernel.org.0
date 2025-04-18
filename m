Return-Path: <linux-i2c+bounces-10487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31581A93F94
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 23:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBFEC1B6340B
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Apr 2025 21:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B21121171F;
	Fri, 18 Apr 2025 21:53:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 2.mo561.mail-out.ovh.net (2.mo561.mail-out.ovh.net [46.105.75.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C001B6CE0
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.75.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745013234; cv=none; b=Vru47/M0XbGEl8Rb6nFwEmDJQbwwKW5RVqmVGBRQoh8sEmkwdQRXgME1hwkgAgr4irjV/WG9wH7LDQkwGkhOOXCBAcbHvfInwx4mH6XTt6WJazAnqmR2CpEifjKD1pz2GEJ5gn35LQgC/4zzxoKocOl/Mg13pPMmqLkjMQ2Cdkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745013234; c=relaxed/simple;
	bh=GElmE044h5cSHZYW7tOeuvVEqudlN30eQflvguUHTKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IksBqJELWNFI9fS1EuNOLvW/+6V2nnd5jOYSXilReZHa4eMPVvicbiXABvai7TcrjFd2/+9MMXq+rUV/5l9YPbpmoQSV5U8kVfxWunCOvKbYexDOc4ole88TbnYXQIvvbFZY24ebvBOrPC/hv15CT4ibvaYu7BFpYUq8bAB1iMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.75.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.9.127])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJB35JXz1LVj
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:58 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-lm9kv (unknown [10.110.96.7])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2C6D81FD50;
	Fri, 18 Apr 2025 21:16:58 +0000 (UTC)
Received: from etezian.org ([37.59.142.111])
	by ghost-submission-5b5ff79f4f-lm9kv with ESMTPSA
	id D526AkrBAmjJPgkAYJzoiA
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:58 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-111S005cce18062-f229-41d5-a2c3-6abe90f982d8,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 07/10] i2c: iproc: Fix indentation of bcm_iproc_i2c_slave_init()
Date: Fri, 18 Apr 2025 23:16:32 +0200
Message-ID: <20250418211635.2666234-8-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418211635.2666234-1-andi.shyti@kernel.org>
References: <20250418211635.2666234-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13927944798707780167
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrdduuddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht

Adjust the indentation of the bcm_iproc_i2c_slave_init() function
definition to match standard kernel coding style. Don't end the
line with an open parenthesis.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 2e04ea157e8e..d25b393f456b 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -264,8 +264,8 @@ static inline void iproc_i2c_wr_reg(struct bcm_iproc_i2c_dev *iproc_i2c,
 	}
 }
 
-static void bcm_iproc_i2c_slave_init(
-	struct bcm_iproc_i2c_dev *iproc_i2c, bool need_reset)
+static void bcm_iproc_i2c_slave_init(struct bcm_iproc_i2c_dev *iproc_i2c,
+				     bool need_reset)
 {
 	u32 val;
 
-- 
2.49.0


