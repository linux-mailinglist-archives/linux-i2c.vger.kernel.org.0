Return-Path: <linux-i2c+bounces-4990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1EC9321F1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 10:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C86B51C2128C
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 08:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B81171742;
	Tue, 16 Jul 2024 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Hgw/PsrY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82B8146A7D
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jul 2024 08:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721119006; cv=none; b=arzji1bKVd6gbWPcW7/0dr27WmoRaZoJCGc/tJhJcr1ftkXVGVvOSj9tsJphBF68TdrGXeiol06AIz0FqTwPmbY5DwCI/ytZh2U9l4OQP4SQ/Ty0EHHTIlpw52xGgxtHguGYmMdH7HA2hDnKH1GWlUnPBql0XoU65e4JUx6AJKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721119006; c=relaxed/simple;
	bh=m618bS4dgPRz+UEdWJwJkN4f9d8tpWxpyRZ5WRGEnT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWdoHlX8EpZzl+kta6qWeqXPDpM3PrpR/8MN6yWrxY7tdtV8Xy2a3ksGJkbasXL+gDSSL80NTfF5VsFO1QpgudKpriznAuaPdP3BrVQ1qbSPbW+ckiVe97M7hdfg6jGWi304T3xUwEUxHpcsNf3LHP9TBoMtTFsj9EYM0QqcE4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Hgw/PsrY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PBjJgSAjn3LKrCn/Md3Wv9O7ZDHj8OzgjeFry/QIc2U=; b=Hgw/Ps
	rY9vmY6NJu6EikKsfj3JPHNuntjS22gNr/+2oLyMJ587xEWHFUh/YPsXnuO+3QYy
	KUs7qVJYeFK/C/4Dqh3C2fmoq5yQiHb4nqcLPcH+UrnJViqYIrtQSILqWDlKkmK1
	abh5RRS8GIwYQmIVRoraDUjxR7VAy7+fprYkB+jIsSI5N/FjbT0WndBIh8pkngY7
	K2lcnSCoi5IMb/lLb8bM1tG5m8Rsy+oZc8Vxp9YTZymGpdpNLbm9N4YEHmaXvvRQ
	CmjJXTuUXg1w7LZ4dfrDmqzeA7Px95+B18x3nfZ0yCF36o4dF+wDK3VxRfFkbRo7
	N1H8kMaXA9gflqYw==
Received: (qmail 153612 invoked from network); 16 Jul 2024 10:36:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jul 2024 10:36:34 +0200
X-UD-Smtp-Session: l3s3148p1@9rRCPlkdzR5tKPND
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] i2c: header: remove unneeded stuff regarding i2c_algorithm
Date: Tue, 16 Jul 2024 10:36:24 +0200
Message-ID: <20240716083623.7737-5-wsa+renesas@sang-engineering.com>
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

The forward declaration is not needed anymore. The sentence about
"following structs" became obsolete when struct i2c_algorithm became a
kdoc. The paragraph about return values can go because we have this
information in kdoc already.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i2c.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index e9cc14b1f9a1..1e34b486f604 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -30,7 +30,6 @@ extern const struct device_type i2c_client_type;
 /* --- General options ------------------------------------------------	*/
 
 struct i2c_msg;
-struct i2c_algorithm;
 struct i2c_adapter;
 struct i2c_client;
 struct i2c_driver;
@@ -533,8 +532,6 @@ i2c_register_board_info(int busnum, struct i2c_board_info const *info,
  * @reg_slave: deprecated, use @reg_target
  * @unreg_slave: deprecated, use @unreg_target
  *
- *
- * The following structs are for those who like to implement new bus drivers:
  * i2c_algorithm is the interface to a class of hardware solutions which can
  * be addressed using the same bus algorithms - i.e. bit-banging or the PCF8584
  * to name two of the most common.
@@ -550,9 +547,6 @@ struct i2c_algorithm {
 	 * to NULL. If an adapter algorithm can do SMBus access, set
 	 * smbus_xfer. If set to NULL, the SMBus protocol is simulated
 	 * using common I2C messages.
-	 *
-	 * xfer should return the number of messages successfully
-	 * processed, or a negative value on error
 	 */
 	union {
 		int (*xfer)(struct i2c_adapter *adap, struct i2c_msg *msgs,
-- 
2.43.0


