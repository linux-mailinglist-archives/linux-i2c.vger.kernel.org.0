Return-Path: <linux-i2c+bounces-4716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A34929334
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8066B281E56
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE3416D4FD;
	Sat,  6 Jul 2024 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eaeuSlPf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D616DC34
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264938; cv=none; b=q/CiADs2QEocN81UkNZAyO3btsWAkHD8EPs8qYeJMa6yvfqk24bXNf5nVL6fvnpYj6y9XtSCfxw4XQhJW0NzM3EmtB207LIDC4ml3kyxa4uctvea6qU/wTR7QZQtKt7ZDWfcOBUR6Nzjocj015b25cSTrk+Ryrxozb5fV3KpIEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264938; c=relaxed/simple;
	bh=eBHrHkI6Nd4d5SCWQASyR9US5Mg6JBED6ehzIwuKkTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qexrc6eFuXd3q4RCMkfsjtB968t93Bv6axk4rFZ0IJiIAezApiRQdhFGBPe28PlAJ6N5VccqkN3z0nQfSk8EU2bs2o18yq2jqJkQexMylXG2kQMKsBpZi2PkG2Hl6JkgV3Bh7lo2iQiz04Q3itr8ejpdE8k2oncNUmu7N5th/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eaeuSlPf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PXtdsFJxyZ9m8awyqCgDuxOaIoekKdLAdMsXbGbMzfs=; b=eaeuSl
	PflF/EcGuJKwitEEMAX6Wvm2iAHCo9Bt6Ua7JQ3WeL5o6X72L9Rb83zvVyiNwfWX
	z51+ZV2X34wnVDyhfPgyh+9JACk2ag84yrzN4qqlDhFG6i4SHzuUiTi3b6uYejLx
	C7BVTWJQ/r7Xwjd8X+d87FD7G5mEfoldRu9xLn6dsXFwU6EboEuxRWW1Qu7TCRBG
	3ClnKYC/QOGyL07zOXIdkJi1Z4DCaOrHPSu2bN8t9/pt9WX9c0MdGzW+CHa1Qs2/
	Q/JUW6hi9GKkywLMkc2ng0wFTZFt5oqgESjuSZ84BFi8B5OkHrKQNMg50qV7eI/H
	mIFbBZzlisYWkRew==
Received: (qmail 3810957 invoked from network); 6 Jul 2024 13:21:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:56 +0200
X-UD-Smtp-Session: l3s3148p1@mTdGY5IcXOFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 49/60] i2c: taos-evm: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:49 +0200
Message-ID: <20240706112116.24543-50-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-taos-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-taos-evm.c b/drivers/i2c/busses/i2c-taos-evm.c
index b0f0120793e1..cb97f72291bc 100644
--- a/drivers/i2c/busses/i2c-taos-evm.c
+++ b/drivers/i2c/busses/i2c-taos-evm.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Driver for the TAOS evaluation modules
- * These devices include an I2C master which can be controlled over the
+ * These devices include an I2C controller which can be controlled over the
  * serial port.
  *
  * Copyright (C) 2007 Jean Delvare <jdelvare@suse.de>
-- 
2.43.0


