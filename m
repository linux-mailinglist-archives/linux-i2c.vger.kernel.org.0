Return-Path: <linux-i2c+bounces-4724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6820929345
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E81BE1C212C3
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C71F17BB23;
	Sat,  6 Jul 2024 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DuPP6ygb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74034179972
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264944; cv=none; b=Sg5RsIclNq+LEt0n3Ei5iwgo5uN+pbAyTVIjlWUiPvCE+g+Tv/0QwthwtCcpRHxrGr1unqqFCiUIoOQdD+2rhmX3YFoeM4Ppqh/d/QxHANU28LO523G4dWOUEtj59DVbrdyUcZql5zpGS0dchN1nMOHhitObq8IsKBAUo/yW2rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264944; c=relaxed/simple;
	bh=jhh9MUfaWQ65I6far/Diyix9dtImPeXZAPXOIGlV7jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B/U3cREfUKv2nZ2TnsxqFvgKj7c6se4mIV7FShdbHNj6SOFOQcRnqZpUk21aPz/4ewfCTHvvSyoSS0RgcHx0qn0fcAtZVGrw3ahjUTEV0mFqBzlBfscdg6NeSIxAgrmmos/yuHB1W0FCGDn8SL7fzZVeaX6e+gqXZiatjrGY2Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DuPP6ygb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=LoDH+LfNyRYCgqYP8zmglvDfnEc2xA8iAA75gS5oYPs=; b=DuPP6y
	gbxy4DVm3r8QAgEs+xzpJALRQekxkqR0j3I5XxJrYIIl/6VcV18r90lkPG9okx4/
	qdaOa4DMEED9jAwmGFTyRrn11GL8PRLu3oAEH1yW162xOkT+132rcpeZiwHNVrzo
	N+LlGxNPh1zzPpyAZ92Ivm//yPVLpM4PIHQ/d2PhSCe0BCdZlFFkO3OkpGWWawow
	xsYyN5oDGLMc73G3+3pGbqrreUZe6rtrCft/gHILIeLb9FGhvTwNerwpq1Iu4B1Y
	feEJkWiVy6cMpkGyHczsE6CNYzHzWQGn1ljwH+bCmJKEjZc7KnHN9R+v83wnJ/TR
	MGmqWMHLv1yyabJw==
Received: (qmail 3811228 invoked from network); 6 Jul 2024 13:22:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:22:02 +0200
X-UD-Smtp-Session: l3s3148p1@u0WeY5IcuOFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 57/60] i2c: nvidia-gpu: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:57 +0200
Message-ID: <20240706112116.24543-58-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-nvidia-gpu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 26622d24bb1b..9bcaa29a7191 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -163,8 +163,7 @@ static int gpu_i2c_write(struct gpu_i2c_dev *i2cd, u8 data)
 	return gpu_i2c_check_status(i2cd);
 }
 
-static int gpu_i2c_master_xfer(struct i2c_adapter *adap,
-			       struct i2c_msg *msgs, int num)
+static int gpu_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct gpu_i2c_dev *i2cd = i2c_get_adapdata(adap);
 	int status, status2;
@@ -234,8 +233,8 @@ static u32 gpu_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm gpu_i2c_algorithm = {
-	.master_xfer	= gpu_i2c_master_xfer,
-	.functionality	= gpu_i2c_functionality,
+	.xfer = gpu_i2c_xfer,
+	.functionality = gpu_i2c_functionality,
 };
 
 /*
-- 
2.43.0


