Return-Path: <linux-i2c+bounces-4726-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4192934A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71B5B1F21A35
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EE217B428;
	Sat,  6 Jul 2024 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kcJY/IXj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6857C17B437
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264945; cv=none; b=SauFw5M0sSv6WnNirwtTgbqqgVgZllsjuwQtSyj3mKrLmF/dwr9MIVLoF2EOfokbT6zrSrrayY/RtnwpLDqO8Wz6h0WEvY1VFRsvGHBoCzKPgLFhKltuzqXA6eL42Hv060NePMx1SR7HayCcu4qWm59/H5U8c4Lo70M2C7hXQHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264945; c=relaxed/simple;
	bh=nRZFPOR2dutX85ljeXMRi0ghy+9aPAwH6ruBUPb9I3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrzVRrh9aFvccKNYZJiSg4QKaCsbdLNS2TUht470X/miT/VtmDBhLsxG8jLX/cldYi+dSz3mJwcGN1KD4vVYQqoRcFgNSdB4HnqfTRd07cb1ZVbwdf9vQWithyqyR/AsrfI00xewA4H3pEb5tIMfftXq66L/yqaGicfZGepVvCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kcJY/IXj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3fwRgUirFZkfXKcJC7Vv4K4A/Dc48+trUOny3ev4Fh8=; b=kcJY/I
	XjUawthxhRKCMxtL1TNK9RqG22zDCp9Tr3p/+YF4aDqSxkppG+ld2jdpRoeBexWc
	3ahuv1kD2Ym41tevqXsOGNcFIosuswGFy31+TkZ5mxZv3jQHf/Fk2t1jNe9lS7/K
	T7SPe5BtpjUYGVPsVVj2K2ASDTrRxsNilO91rD7eWowhPxY3x33TYjolfGELRMSy
	U04Rq04OF+AtvXWA9t6XgUjVjoUB1Cd5IR3B2LRBJ7WNHw39M4Oyhq1SPBYcIBrE
	U/Hytu85jskq9IB4HBku0oewZF45TbmG2f5mbViGSg2uwPlD3t7pc86TjZHF9/il
	tqR8q9Bawf+2SLWA==
Received: (qmail 3811298 invoked from network); 6 Jul 2024 13:22:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:22:03 +0200
X-UD-Smtp-Session: l3s3148p1@heixY5IczOFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jochen Friedrich <jochen@scram.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 59/60] i2c: cpm: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:59 +0200
Message-ID: <20240706112116.24543-60-wsa+renesas@sang-engineering.com>
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
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Jochen Friedrich <jochen@scram.de>
---
 drivers/i2c/busses/i2c-cpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 4404b4aac676..4794ec066eb0 100644
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
+	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);
 
 	/* Disable interrupts. */
 	out_8(&cpm->i2c_reg->i2cmr, 0);
-- 
2.43.0


