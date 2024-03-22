Return-Path: <linux-i2c+bounces-2508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D7886D0A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 021C9286E44
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B5D605B6;
	Fri, 22 Mar 2024 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IJqVo+FW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8571760250
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114017; cv=none; b=NGbm57VdGEEHWL2NaPDYuquvtH2uV5Tkw9Y+Mup1L/mLZ4ESer9+EMxr/054/8X8viP6Nk+WWLiI9vn6l1hL3ZORvIUalBexL+O4ZbSiqczVRQ8LTBSQ4+Qjj6PQYfUoS0FIoprV3F8ngFnE4mdDgQz38pxwcSg0Ubs51sKCE0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114017; c=relaxed/simple;
	bh=57ZUMg6x237by2el+JilG1Bn2dEehlLOFvNktc90J1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dv+QpszvOMzxD5xCZMpyPUGGI15V01UDWuIu0MrOGQc0JWumpdC5PiZy+Ozzse0u9CiBDuZSIrKPebJBc22+CVukxEbm7AXUX0QRwgnYS1YEaqCnH5rEHbEaCXOGor913QJJeCM336AE8EO01DJzxWIdh4ycAUuleckSjS4AWnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IJqVo+FW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SHhyecuZpSri2t3mYMVojQTj080dpu1S9qK76O6Iknk=; b=IJqVo+
	FWEY6rPPIMhSHn85Gcimka4V4pmS8o3xFVt2a/y36VFREAQCS0MAMSgAoTOPuBl7
	Q1LcRc7zZslbb28ZZAAgVsJ7RXF6cTi79mSyejIr6cHv99iJB0XMOIwnAxsqWeWB
	inCUh35UAlMWoAmoLStc1Gk1b8M4p8XNpCOrWcMrC5FsTWLdV2+CVdndWjhujMiK
	H/TutO3nDCIyPkLN8BWwrpyH4kZRs3M3Rc8juGMqT6av2krHkmeqK/jtKLQ/1JhT
	r9mtwXeo65rr+rZTLrDIzewZUZDb8+Metqwn/lwNhBfrsGc8tJyLpGlpj/blRMIM
	kc0+ycoA5R8/LSTw==
Received: (qmail 3870621 invoked from network); 22 Mar 2024 14:26:39 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:39 +0100
X-UD-Smtp-Session: l3s3148p1@tAcVxj8UBOFehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/64] i2c: highlander: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:15 +0100
Message-ID: <20240322132619.6389-23-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index 7922bc917c33..ec3546a5178b 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -331,7 +331,7 @@ static int highlander_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	/* Ensure we're in a sane state */
 	highlander_i2c_done(dev);
 
-	/* Set slave address */
+	/* Set client address */
 	iowrite16((addr << 1) | read_write, dev->base + SMSMADR);
 
 	highlander_i2c_command(dev, command, dev->buf_len);
-- 
2.43.0


