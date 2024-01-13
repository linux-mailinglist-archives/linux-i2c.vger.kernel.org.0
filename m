Return-Path: <linux-i2c+bounces-1293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F256C82CE50
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 20:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D4A41C20CB5
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 19:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C7763CB;
	Sat, 13 Jan 2024 19:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EkQrlm9F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9531963B9
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 19:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=NEicbFM6ufiWn2
	F+93/G45Dh99cE/lbny42DPAanW0A=; b=EkQrlm9FwnvUN00REf2wH5jQCumnyy
	h6oObSkvaqxRKOCeOhBhB3cwzB4ffF7WbMl7qgFIqRhIUU+PJYbkHNLDvHss92cV
	MDuNQiZlt/N3GmQY6OQ6tBKS0ED4CosLt44L8FnQYjkpWLFlaIymlWU3Q3+iYrs/
	D6IXpF5+5pITzZHAucU5kRUQcQxmiEGdSQHEPnDqpWa82FN5Rq58O5G+7fhW6WFm
	ne3kmR6Q4QMI9qC7y+ZH6NcxkvJUUtGkv+yl5dOGD5zlcolGNx8TOABsqFmF7o6y
	r3xjnvmUt5nbrlR4CPLjLdcb2TlNl1yXrZbiiWxZb05KgAqSElIjJ4zQ==
Received: (qmail 1629115 invoked from network); 13 Jan 2024 20:39:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2024 20:39:55 +0100
X-UD-Smtp-Session: l3s3148p1@Z4Lr8dgOMnZQk7GI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: use proper email for my I2C work
Date: Sat, 13 Jan 2024 20:39:43 +0100
Message-ID: <20240113193942.2388-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas is solely funding my I2C maintenance meanwhile, give them credit
for that by using this email address.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 012df8ccf34e..1a1824790239 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9988,7 +9988,7 @@ F:	Documentation/i2c/busses/i2c-parport.rst
 F:	drivers/i2c/busses/i2c-parport.c
 
 I2C SUBSYSTEM
-M:	Wolfram Sang <wsa@kernel.org>
+M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 W:	https://i2c.wiki.kernel.org/
-- 
2.43.0


