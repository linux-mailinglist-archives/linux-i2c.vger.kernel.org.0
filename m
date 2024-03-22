Return-Path: <linux-i2c+bounces-2500-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F0886CF8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A32D1C21DBC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D1459B44;
	Fri, 22 Mar 2024 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N1vh2CY6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4F45C0C
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114011; cv=none; b=g+/T7JTxhad/5cXCKFQC4ZSezDU/hVzzHozGxIvh9AV1R/AoHonn4R6oPJR4AXtre74D1gW/jdoJeJ+Ut9PFhWcV8aWgedI5JjEcI+knHewWCl7SWPNarH1Gr57jT/+gUtLnGcXNLu5O9hgxxYo5f30nQXzMYmgnDMw7bV2Gwm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114011; c=relaxed/simple;
	bh=+VaxMN7cZnZJjhL9SNR43NWlUn9PaNRHhMOl/YlZsqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHYKjhIVKTKPNwfYv4hPomHTeQMKvIvuDyOi5sPc0BKSlcjguD3rlauQcenD5JZDJoZmqI7ifZ8ICj/ZOCjTvLc8/euxk5sr6A3UshaR8Nco34FyNcXl/lgT6eeKTzv7jyS3BsS/aAA8O3XtmSptTGg/8c2aWdP9SKlmA9+S1FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N1vh2CY6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EAolHBSknmyHAIRGgTuBToiKe0Qd+7DMZZj0gDF7Amc=; b=N1vh2C
	Y6glG5MRwaBGI0w+5dr2w3TJMvEHi9bZTIuPfPkRF5KOBkEpp3vSs/D/qqkgzmIq
	T0MfVmIJJF4mbd+yXDq4c34FSkEZTmJYkPenM6fqO1Z8f6EG0ORHWs63/hmmsMuP
	EBa4nCRh/MqZ5EP/akN7B3mCjK/kPe6vU4ir4v57dC4heOzWhCiLOm+L177TuC4O
	MK52+Sk5YYLO8NmakmY+hhkB64W/d6YcH/3Ihs0J4/sxLYG1dlfVK13wr2ri7kSa
	vQYOta2Hcw7EGIKwk3BvrTZ+4uUkU7ZOKATLhLFdoF2KxoTzzjgzE9g0o87yvrb8
	IbNMHGAOAYo5wvQA==
Received: (qmail 3870347 invoked from network); 22 Mar 2024 14:26:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:32 +0100
X-UD-Smtp-Session: l3s3148p1@F4KwxT8UrOBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jochen Friedrich <jochen@scram.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/64] i2c: cpm: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:07 +0100
Message-ID: <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-cpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 4404b4aac676..306e397fec0a 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -402,7 +402,7 @@ static u32 cpm_i2c_func(struct i2c_adapter *adap)
 /* -----exported algorithm data: -------------------------------------	*/
 
 static const struct i2c_algorithm cpm_i2c_algo = {
-	.master_xfer = cpm_i2c_xfer,
+	.xfer = cpm_i2c_xfer,
 	.functionality = cpm_i2c_func,
 };
 
@@ -570,7 +570,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
 	out_8(&cpm->i2c_reg->i2brg, brg);
 
 	out_8(&cpm->i2c_reg->i2mod, 0x00);
-	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
+	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */
 
 	/* Disable interrupts. */
 	out_8(&cpm->i2c_reg->i2cmr, 0);
-- 
2.43.0


