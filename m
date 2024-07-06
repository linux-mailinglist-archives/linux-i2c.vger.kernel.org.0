Return-Path: <linux-i2c+bounces-4686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CAC9292F6
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 827E01C20F11
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763131474BE;
	Sat,  6 Jul 2024 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PxgarKUx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B92143C47
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264913; cv=none; b=LQe/AiTbXyr2rf8iLeyE80R42BGRDPOUXtyGqHaCupCk491+WA8LR14KxTEsYsZYWFEnAzSZzYTL7UDE2xuF6idWaFjm1M41oJYkT6HO1Zlolq34VXYxR8FffwWyoZXv1qIOp3mFmf2lUrNTk5REkVV+FCq8i0dgETILRunH+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264913; c=relaxed/simple;
	bh=clHHUD3oc7AiBgTgg8PgDukw25LL9yUiiPzfbEuUbVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocRwqTfsS9gGDp6wWH/vyWB0497H2VElREdSUxRyQvobDeM8D8B8ijK05hLsMdig7ayl1sI51+lQkda5hxAV/VHAaZghA7ySHkqbg7ex9nhvy3qpniYwWdJGJS/XO6ZoPVC2mqP03zvKwnylNWjanPfc/1iRvxz76Ner5IW9oIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PxgarKUx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=iLZVl4e6/KmvptbLtSauaumo0amjB//eFIbpOtdLBZ0=; b=PxgarK
	UxdxYJy7BE/1Hhyo0BrGXFuHKYuK/CBJm3qY3SbWVuqS0o+5xqTkEZ+KGb/XRuqk
	my5fW0qGz2JKVRFDpKM0twjHEpuMDSywhABStg0Sjs4SPIKm3gfI8rfv6k/+PLZS
	9oqnmy3OZMjuzsESumPbPMmu1fLFuuJvcNgF0+nJQr12kHcgiSlU8VAaqjXvDcdF
	NmBq4AgqPjHOAm6YpZm5wABnae4Zn0G//IeMXFb7kCJ9TqJjsRLtr1nasXlhwx+0
	6BaKLa/ksbSHjC++CQlJSMJhj+GHksP1DaUoskPag4fB9vEb9UShkWUNVPlckeTM
	fom4zkXgVzFaJ89A==
Received: (qmail 3809940 invoked from network); 6 Jul 2024 13:21:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:35 +0200
X-UD-Smtp-Session: l3s3148p1@ovYFYpIcMoZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 19/60] i2c: hix5hd2: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:19 +0200
Message-ID: <20240706112116.24543-20-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-hix5hd2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index a47b9939fa2c..64cade6ba923 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -200,7 +200,7 @@ static void hix5hd2_read_handle(struct hix5hd2_i2c_priv *priv)
 		/* the last byte don't need send ACK */
 		writel_relaxed(I2C_READ | I2C_NO_ACK, priv->regs + HIX5I2C_COM);
 	} else if (priv->msg_len > 1) {
-		/* if i2c master receive data will send ACK */
+		/* if i2c controller receive data will send ACK */
 		writel_relaxed(I2C_READ, priv->regs + HIX5I2C_COM);
 	} else {
 		hix5hd2_rw_handle_stop(priv);
@@ -384,8 +384,8 @@ static u32 hix5hd2_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm hix5hd2_i2c_algorithm = {
-	.master_xfer		= hix5hd2_i2c_xfer,
-	.functionality		= hix5hd2_i2c_func,
+	.xfer = hix5hd2_i2c_xfer,
+	.functionality = hix5hd2_i2c_func,
 };
 
 static int hix5hd2_i2c_probe(struct platform_device *pdev)
-- 
2.43.0


