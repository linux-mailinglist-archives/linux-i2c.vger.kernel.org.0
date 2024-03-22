Return-Path: <linux-i2c+bounces-2502-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEA8886CFC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1779B225CC
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB77E5CDC9;
	Fri, 22 Mar 2024 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K+HqkwMH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E3046558
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114012; cv=none; b=lipZQennL3fOiXUDTSno1hiL/QmAslvsslb7kq1mP23NO9siJod7Lm8Dz5RGnMYmwjdDTXs1V51SJOcVhK8ds+U22mZwXxafbJ5ww+lwV5+HRnPe83zzYP7P2/VLgD4rRyi3SC9OiD1omRXuaCQuer6PDe5EiyeENR4gcPyjufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114012; c=relaxed/simple;
	bh=060GHiUn1CwotzIl6MBVCwJ278n1ziyGC1UQUnT2QEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stqBNAoaIKGNxoQZAeVGYY0Dsx2ljN8q11n1/AyS20OUu3LCRNT7XuDG07mjo8EXX7zTa6fZGF5QgNNJnH1peZTISKTADBJQLnaR/v938A+wMKuWQvPXEOwaVuDs/rTUwh9nM5AG89+3g3w3+aVxV8U1iMTBDHhHaeRk+6BNWX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K+HqkwMH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Qu3vk6w/0m8AM5GY0guKeGtY0uhOhyvvrd8UxUlbHVQ=; b=K+Hqkw
	MHpY2i1IaxFUSVbDNRcfcIgO7dod5HZW8PGN+Jf/bHeKSiLOnfja1ibkdVOWbJLr
	P7PfSih92G7W1yW4k67T+t89P31K6PTCIPPJsPb5vK13mOqWPRt7b69cj0GH5Fuc
	/wLDqEvUpAJMvHp8VuUihYHvc6rUKnOeWx/NHhnKnGjqffgiMdcMs/6GPFReC3wJ
	OOrcMGR/57+W5jskecPllC/z/5I31wAUb1dZ9zBD0Ir5oyyz1BqL+FLJLFDs1MKc
	AAUmBnxgPjO4elSKGAzOzX5Sn5sKpzqkyjHXi5bqcsGXBeybzgUwN9rLJQ7PoJ0P
	GEjdfmcm6/BtYZhQ==
Received: (qmail 3870420 invoked from network); 22 Mar 2024 14:26:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:34 +0100
X-UD-Smtp-Session: l3s3148p1@XQbKxT8UxOBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/64] i2c: digicolor: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:09 +0100
Message-ID: <20240322132619.6389-17-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-digicolor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-digicolor.c b/drivers/i2c/busses/i2c-digicolor.c
index 3462f2bc0fa8..0d777f5c6b41 100644
--- a/drivers/i2c/busses/i2c-digicolor.c
+++ b/drivers/i2c/busses/i2c-digicolor.c
@@ -281,7 +281,7 @@ static u32 dc_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm dc_i2c_algorithm = {
-	.master_xfer	= dc_i2c_xfer,
+	.xfer	= dc_i2c_xfer,
 	.functionality	= dc_i2c_func,
 };
 
@@ -372,5 +372,5 @@ static struct platform_driver dc_i2c_driver = {
 module_platform_driver(dc_i2c_driver);
 
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
-MODULE_DESCRIPTION("Conexant Digicolor I2C master driver");
+MODULE_DESCRIPTION("Conexant Digicolor I2C controller driver");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0


