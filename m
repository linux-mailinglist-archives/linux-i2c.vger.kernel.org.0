Return-Path: <linux-i2c+bounces-4710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDD8929327
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 098612820DC
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27818156F42;
	Sat,  6 Jul 2024 11:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lPs95hzk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB62C163A9B
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264932; cv=none; b=k95ubMR06h+f7bPUT7LNg+lXiR8/tr3fH6g2F1SORAKmC1hcVEhdytZWRa6uWhOIv9SnJPrDxyT8GAWw8RHpRVdztpc7Qr+UOhRn6zmwaCigg99O8KpOi3c0rt3GBgNTsp47I0/LeDs4AUd3fCpf2pt+8STtPUdNg/zEBoHP+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264932; c=relaxed/simple;
	bh=w5GcCkcs6imTks9IbKCY9YoQgcB5kKw6KzWCMSJTC/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hh3TTA5FW23r2xzWcr3Ta1PJUnrMF0JrR23dggYploZg7YNzLz77EkP5MVL4WBSmjXm7VZ1QXNdZLHChhinsGrMPEBARMfYpW+39NBEB9DgRykHZY1rbLMFDnvU0km1xdCLrIGjjlPvyasQrU1CShGYQ29M6pYFpm0IF8+EVn+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lPs95hzk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=yWAWcS0izyrYqOoxdBOC0Ijbo75Su8wsUQVwvGrthAo=; b=lPs95h
	zkLE/aXldtIAgeBtkAresAdHyssWgy+CtCdE6x3UkOa6J1lxlzSGhH+OzrA2Qh9W
	3xFDi4CkZEPH5OLpVhZ4QKvroFfkNft6oAV3FFcFTxXcP2jCXnHGx+ExDx8emf0m
	PvXCVuweON6f+Q0HPBLFaFf92ulvHiwdym2vasLmZbh8mh72CxlbM88R4X/7F2CM
	+3lsi+mbBl792EzYrLT4lT7kOVN7GOmdhvMLFoGG+HJWx/zAYEJRAMoOnm8WBGM7
	CAojjl1231e1VTHvxV0H6rCYGlx0TwS3QCjxZbvkNRIkaneXYE02d0mpW2fs5Tee
	rUIZ5qK6mFnZDV+A==
Received: (qmail 3810766 invoked from network); 6 Jul 2024 13:21:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:52 +0200
X-UD-Smtp-Session: l3s3148p1@UuIGY5IcWsJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 43/60] i2c: robotfuzz-osif: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:43 +0200
Message-ID: <20240706112116.24543-44-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-robotfuzz-osif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-robotfuzz-osif.c b/drivers/i2c/busses/i2c-robotfuzz-osif.c
index 66dfa211e736..80d45079b763 100644
--- a/drivers/i2c/busses/i2c-robotfuzz-osif.c
+++ b/drivers/i2c/busses/i2c-robotfuzz-osif.c
@@ -112,8 +112,8 @@ static u32 osif_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm osif_algorithm = {
-	.master_xfer	= osif_xfer,
-	.functionality	= osif_func,
+	.xfer = osif_xfer,
+	.functionality = osif_func,
 };
 
 #define USB_OSIF_VENDOR_ID	0x1964
-- 
2.43.0


