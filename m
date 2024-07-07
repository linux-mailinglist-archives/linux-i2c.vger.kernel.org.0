Return-Path: <linux-i2c+bounces-4740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F192971E
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 10:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5504228189A
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 08:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC95B17BAF;
	Sun,  7 Jul 2024 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q9O4jZVM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A12D18C22
	for <linux-i2c@vger.kernel.org>; Sun,  7 Jul 2024 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720340944; cv=none; b=s5O4UcQTrLy2VD8FZpfn2/qUXmP0Uq21r/vAs6Ra2xQC+YPe79lwHz0p4Z722uMtWV3c3veQKCsXLP1bp9Daf9egp698nJywDtsUu1Fo6G8HJktTlrgyWPIO+Md6V3wZjA9p07OKOeTXzlJJfKlxRoaKTJ9TuWvP0KquiJxLIcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720340944; c=relaxed/simple;
	bh=cvanKG/Cf5mV7ly86t9o5qxcCv9C81kPQNxeBxtL6KE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DYmIru8xTeWhghBBxe66D83/rPYU0E7gxCCK5avzHiDiuZirpmTD787kuJh8hAFbGLohxFrZv+qTY1mBh/7r2bG/0sfa/e6224dXRVRMMqWLvOBSrw7ibdIofiGPfauD1i4sVfejDUUsUVo3jYwbdBmOMOssxzC34GrmOk4rWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q9O4jZVM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=dWULRCNFLS2MhlSInBBfsCGfT7ld7iNcRBI8KUxYBSk=; b=Q9O4jZ
	VMwgJo1OA/zdVwuf1QYlFTCOg5UYrmZ8R4O6VgnmU2x74Ml1HMO7QMH9RQjshYl/
	P+/wvAf2qUgVq/RF17wCpCUjMMLAKAIUX9lRj41Y208O6vrN4hRV6vlkrdgBstTK
	pxTbwFyOYpnI2z5JNDikt5023xRt7RphyhzCjTPuoMmmHLDEOyfNm6niQmFaqJ21
	Vs+CCUa4nBvK327ayRwSb7gpPMFJFOrFAgQ0dx5CVqFllmeY1/20zfoTmVpESrvw
	rTpcdZmrzyfzG1XpUI+IpW96PqK1SsrI3+q/DrjzIQ/JMZz14j+quJAyyWIVaL64
	y2SaUyVfLo8lPVSw==
Received: (qmail 4044229 invoked from network); 7 Jul 2024 10:28:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2024 10:28:58 +0200
X-UD-Smtp-Session: l3s3148p1@lu1/FqQcVJRQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] i2c: rcar: WARN about spurious irqs
Date: Sun,  7 Jul 2024 10:28:47 +0200
Message-ID: <20240707082848.5424-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240707082848.5424-1-wsa+renesas@sang-engineering.com>
References: <20240707082848.5424-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The FIXME is very old and probably needed because of some driver bug
like insufficient initialization. It may well be that it was fixed
meanwhile but we never know because the spurious irq is silently
ignored. Add now a call trace when this happens so we have more
information in case the issue still exists.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Should go to for-next.

Changes since v1:
* new patch

 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index ec73463ea9b5..d7688d702b65 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -553,7 +553,7 @@ static void rcar_i2c_irq_send(struct rcar_i2c_priv *priv, u32 msr)
 	u32 irqs_to_clear = MDE;
 
 	/* FIXME: sometimes, unknown interrupt happened. Do nothing */
-	if (!(msr & MDE))
+	if (WARN(!(msr & MDE), "spurious irq"))
 		return;
 
 	if (msr & MAT)
-- 
2.43.0


