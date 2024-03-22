Return-Path: <linux-i2c+bounces-2543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D35FD886D62
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5D7D1C22089
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B283C64A89;
	Fri, 22 Mar 2024 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HHeNgDj5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6225C664BB
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114051; cv=none; b=bpj5fq99Ex28KfpOHsY+63t90Y71Y+HLg0ePNn1XigCqsymmGPiyDgpmWXcqpGMM3cAWU3LaaWoyFrcLzQcDTN3lG4d4it6p+1ysxsspX9iWZPUo29midAL40/GWQZmNdt0WJ8pRdf565BAz7/GkURDNzg+TNeGMmDTXE7/w5zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114051; c=relaxed/simple;
	bh=keBBjANmZEAG5ti6G+/K6pZJny5cyPijU0Et7tidAZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnuKPBgTGg1OnKT5CMbGhxjUi0gtBnff7l5K34UdFcVOieaMI5cUrBGonaI6zxg8ZfhU/WXhhOh6oL1yxv6BgJ+GR3CnGr+SGVgoSGbOMdehcJ0uZE6ZW938aEo9pRco6mwm1M9csatGV7ZeLKrZU30QTdjnLlTC++/CizK7mVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HHeNgDj5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=LATMV+ftB6Wzcslw/1km6fP5fTaQpx9jv+n5ET3YDxA=; b=HHeNgD
	j5Q79pRAf24P7ToKboQzgZB54htEVJNHQ2z7UAXO6JYvIa7lIPHgJtp3hC5TMbr3
	oueR1jWNecd5as35NhQRPQ+7BHg6N++12j1zY5O5pXSBDV03/Q2ELCC/pKRfTogJ
	fwJNZklq6pGMb3YFDnyBUjnABi1dGNwU1SE/QjgmwyLNR4illLNVgt9Us8Y3rgpC
	SHkhcdhJpFQbb5FadzRs1QIvocpGLvwKXC2zb/mFVPRyx4/byC1/MqHndDJuDBHz
	pB8/hkM8w+VqvJ7ELtTwksvWDgcccqmpZeXsuWK3nDItbdIcyFdt7YREBRJNRV3o
	8OXOnKxElKCddO/w==
Received: (qmail 3872103 invoked from network); 22 Mar 2024 14:27:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:08 +0100
X-UD-Smtp-Session: l3s3148p1@OFDSxz8UVpRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 57/64] i2c: taos-evm: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:50 +0100
Message-ID: <20240322132619.6389-58-wsa+renesas@sang-engineering.com>
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


