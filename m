Return-Path: <linux-i2c+bounces-5194-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ECA94A6E2
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 13:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A688C1C22475
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Aug 2024 11:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B651E3CA2;
	Wed,  7 Aug 2024 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Zm/iFYse"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5D1E487B
	for <linux-i2c@vger.kernel.org>; Wed,  7 Aug 2024 11:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723029734; cv=none; b=TYomgl8Vdai3yRjnNIUzDffdVSVzU6FDc4p3ZyLh3CD8MrYbGjPwThhQrHMkJJOifOWpaEm99BBBzP4j70e9SLbUonJ+l9VDUdPbKtEKVLCxX9NU2Y7yAnKipz0JSJDT1Y3e/14rc/w443/wsF2XOxRADYOD2OIslFlTJ/6P42w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723029734; c=relaxed/simple;
	bh=8e+pcsSgfgWifMQ/0sz6sL8iNOv0ZE0Jv2P3vOt2LP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKZHkxyre5u7efTJgTLIoHuNAyhv0oNQ8gcGLXeJHeiUhtuTKtmXep7PeokdEnbXUuMycg3/vC7QYmmeWbZfepazY9mA584XPF5iwhloQtXcnwKscs8KwvTkYKuKMtWIiK6f0m1l3m9TNJPAVWVvtN+Co+mqO32CNNQXrrJ4TsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Zm/iFYse; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3w40K+hpoJ5Sqdlb/k7ILXsFKaZoegkfAL5K/38G9V0=; b=Zm/iFY
	seyVQ2FkpPhwJa/2kME2nOzY3Kk8p8ZeyY1Z0pwX0nXbyHSDPKscmnAJKCpW8+8n
	cCnnh+ZWpse7AR4i6GgenQbEhvtUUvZbnk4sIRpFd8fhstfAnnBTWwNCACH7xjHJ
	Q1P7deMlYKlLErXwFA2q7wIZHu24BkT9eh50cpXRjMhRyMhzsiIM6G3GAg22CDZW
	QZ4qsZhKIi3x//NAYicDQ20snwTgcXNYGfkVJLHivwpEkn2Sh39AYCKatU7yy6bH
	8rK2zni7rYrICrvKKhsIcIBUVZisREw93TWBsXznlRY+kXWzN4+WjD2iTHFOKx9g
	fm16BCzoii8E6n0g==
Received: (qmail 534556 invoked from network); 7 Aug 2024 13:22:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2024 13:22:02 +0200
X-UD-Smtp-Session: l3s3148p1@3xyKHhYfuswgAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH i2c-tools 3/3] i2ctransfer: don't use plain 'unsigned'
Date: Wed,  7 Aug 2024 13:21:59 +0200
Message-ID: <20240807112159.14220-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807112159.14220-1-wsa+renesas@sang-engineering.com>
References: <20240807112159.14220-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make those explicit 'unsigned int'. I got used to the explicit Kernel
coding style and prefer it meanwhile.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 tools/i2ctransfer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/i2ctransfer.c b/tools/i2ctransfer.c
index a7bbbaa..c9a30cf 100644
--- a/tools/i2ctransfer.c
+++ b/tools/i2ctransfer.c
@@ -85,10 +85,10 @@ static int check_funcs(int file)
 	return 0;
 }
 
-static void print_msgs(struct i2c_msg *msgs, __u32 nmsgs, unsigned flags)
+static void print_msgs(struct i2c_msg *msgs, __u32 nmsgs, unsigned int flags)
 {
 	FILE *output = flags & PRINT_STDERR ? stderr : stdout;
-	unsigned i;
+	unsigned int i;
 	__u16 j;
 
 	for (i = 0; i < nmsgs; i++) {
@@ -147,7 +147,7 @@ int main(int argc, char *argv[])
 	int force = 0, yes = 0, version = 0, verbose = 0, all_addrs = 0, binary = 0;
 	struct i2c_msg msgs[I2C_RDRW_IOCTL_MAX_MSGS];
 	enum parse_state state = PARSE_GET_DESC;
-	unsigned buf_idx = 0;
+	unsigned int buf_idx = 0;
 
 	for (i = 0; i < I2C_RDRW_IOCTL_MAX_MSGS; i++)
 		msgs[i].buf = NULL;
@@ -333,7 +333,7 @@ int main(int argc, char *argv[])
 
 	if (yes || confirm(filename, msgs, nmsgs)) {
 		struct i2c_rdwr_ioctl_data rdwr;
-		unsigned print_flags = PRINT_READ_BUF;
+		unsigned int print_flags = PRINT_READ_BUF;
 
 		rdwr.msgs = msgs;
 		rdwr.nmsgs = nmsgs;
-- 
2.43.0


