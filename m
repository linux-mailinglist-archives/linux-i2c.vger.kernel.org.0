Return-Path: <linux-i2c+bounces-4988-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3A9321EF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 10:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9998F282668
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 08:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E88E17D371;
	Tue, 16 Jul 2024 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XyVrXN6J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449117B4E9
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jul 2024 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119006; cv=none; b=uKVb4NXZxjZbzkbnr7FVIm66CLfmRKAD15BFrdggGo87MHHL8LI/3h8op0br8lkiTUq6EskuLmeMUaGgO2VNFC+pD+pgJCDbiueh1bU/cXN5VaVmEr0qep74PLJ/v8SQG4S0oRYAPNJFZA5jVPd0xI2NZ6enijCkG4p4ZCbOlq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119006; c=relaxed/simple;
	bh=B8E6UP6diPfn/BrnoeLQBTCu55NxBPnre+m7Sjdhq00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGYuGn1386W5iJncrBBQaTeZ6jhZMmQQspXI1yos6capGnYwLjQAi8pDJZq6bDLxUU9moaiaQynMl+NVb5hjW4+ek8WYzpKh6w0K33kqCzuTiyrDZRuJvHNHfXJT8LGJbVHfm8HnMfeA2kP9mOwGEY8lGRF8ylx+uKKt94oDOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XyVrXN6J; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=EIdAZlvdMfK8TFKGY0fBUKMfj/zD3Ooy0VraEJcDpuE=; b=XyVrXN
	6J4HhyfFF105vYHwFMx4eeEIov/sQqkuqXbhgd6PWOwezs2FpNTJ2DUzDHNM7kaY
	Z5EuZP5CvoxTbESlkNjOvpZR4ePKoslctzJ2JIXQh23bfSf7MzXNQMfvdY9qNMZO
	8iaZ7DEVtDz36Yta7Wg3cvLd+ers3eiWjjs6YQaXySxkQBl6a+iylJNmDCxsNj6w
	QAM3MryeigvxdNExCjsY2FMPV+qJxHZ1NBPmlHNXixLxBrcEjFSrtckVPgv+zuwe
	9XCqrsZ2r1QbmyMidar1yX+TPRTjO285RjGPLijnSpElTbhOhzM8tV96UvkMx9xC
	LdeNPJlk9TOVIufQ==
Received: (qmail 153636 invoked from network); 16 Jul 2024 10:36:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2024 10:36:35 +0200
X-UD-Smtp-Session: l3s3148p1@1U9SPlkdonhtKPND
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] i2c: header: improve kdoc for i2c_algorithm
Date: Tue, 16 Jul 2024 10:36:25 +0200
Message-ID: <20240716083623.7737-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240716083623.7737-4-wsa+renesas@sang-engineering.com>
References: <20240716083623.7737-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reword the explanation of @xfer, the old one was confusing and mixing up
terminology. Other than that, capitalize some words correctly and use
full line length.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i2c.h | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 1e34b486f604..8caaa13834bf 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -511,16 +511,15 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
 #endif /* I2C_BOARDINFO */
 
 /**
- * struct i2c_algorithm - represent I2C transfer method
- * @xfer: Issue a set of i2c transactions to the given I2C adapter
- *   defined by the msgs array, with num messages available to transfer via
- *   the adapter specified by adap.
- * @xfer_atomic: same as @xfer. Yet, only using atomic context
- *   so e.g. PMICs can be accessed very late before shutdown. Optional.
- * @smbus_xfer: Issue smbus transactions to the given I2C adapter. If this
+ * struct i2c_algorithm - represent I2C transfer methods
+ * @xfer: Transfer a given number of messages defined by the msgs array via
+ *   the specified adapter.
+ * @xfer_atomic: Same as @xfer. Yet, only using atomic context so e.g. PMICs
+ *   can be accessed very late before shutdown. Optional.
+ * @smbus_xfer: Issue SMBus transactions to the given I2C adapter. If this
  *   is not present, then the bus layer will try and convert the SMBus calls
  *   into I2C transfers instead.
- * @smbus_xfer_atomic: same as @smbus_xfer. Yet, only using atomic context
+ * @smbus_xfer_atomic: Same as @smbus_xfer. Yet, only using atomic context
  *   so e.g. PMICs can be accessed very late before shutdown. Optional.
  * @functionality: Return the flags that this algorithm/adapter pair supports
  *   from the ``I2C_FUNC_*`` flags.
-- 
2.43.0


