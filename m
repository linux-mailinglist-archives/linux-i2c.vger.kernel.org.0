Return-Path: <linux-i2c+bounces-4714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BA492932F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE218B225F1
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9FB16DC06;
	Sat,  6 Jul 2024 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aab3VH7X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EAA15F400
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264935; cv=none; b=giMIrkgHa92Pzg9flxpHjdkONWuC59przsW5AJtsrcUi0G0bt1dfVqcF3XlYYVdiyhooNtJ/c640iRJe/qcdO1a55dl0LQsGiR3ultAkRyyTBwKCxWmtfL8kZkEfnXy7v354Jzi7hJGjwaeg9McGoPLWcQzleWI+9p4OdCRFhkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264935; c=relaxed/simple;
	bh=oe9kE7IlLNP12Xetii5tL+q+oVquoer3DC9xvAqBaHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZH6whkP6WKhe0htNCf0XPNSkxp5MiWIs6Ta6LKLXYyiaayezPwRAY0C57KguLOYGLG23dPKzrHLfnxh+dhr+tpx9hU7+qWuWGWl+YAO2+MuOQFkGzb/RZOS2v4S2HlkhhunBpIsGEnTsAovcYi1WuOUB2kvbyukTbn8gWlqE6v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aab3VH7X; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=JcAYAk0ghBJQVZv6kEqnQcCKNw8XhxvsQElmIK29aYs=; b=aab3VH
	7X0h+0AJL89UZ8LEAcoVykZR6OO9g5tMLldWc48a7mlqgFFTsZApN5j/VC7tssOj
	JitbYiLpl6JfTtCj2XOoxMkcJCG648UzivdPYPkjnlUi9vxhgBgu39vOAcIXyuEr
	FEfIAKHEHuTyZXGExSgavlf2KNLK328MVROVdjatT3aEUaiviS0ZV4EKOIx2b+e3
	9s/4sEvSZNp+ARpP3KNfBeorSdete7yPbY+BoJqkjOoQVFfopK9z9sSSheuICOjf
	QiTJz3iZz3xdHjIlAs2B/KatAIR+BDnzAEH2OQBYrF6jWQtcsPDR5DRM4KLWF5bT
	vQlTKlnGFi7Lp3Ow==
Received: (qmail 3810829 invoked from network); 6 Jul 2024 13:21:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:54 +0200
X-UD-Smtp-Session: l3s3148p1@+MYcY5IcZsJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 45/60] i2c: sis5595: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:45 +0200
Message-ID: <20240706112116.24543-46-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sis5595.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index 32476dc10ad6..ca06fffb8f61 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -257,7 +257,7 @@ static int sis5595_transaction(struct i2c_adapter *adap)
 	if (temp & 0x20) {
 		dev_err(&adap->dev, "Bus collision! SMBus may be locked until "
 			"next hard reset (or not...)\n");
-		/* Clock stops and slave is stuck in mid-transmission */
+		/* Clock stops and target is stuck in mid-transmission */
 		result = -EIO;
 	}
 
-- 
2.43.0


