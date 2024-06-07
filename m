Return-Path: <linux-i2c+bounces-3909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9540C9001FA
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 13:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A75151C20C0D
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 11:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE96B1991AF;
	Fri,  7 Jun 2024 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DKKQptKF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F9B198A0E
	for <linux-i2c@vger.kernel.org>; Fri,  7 Jun 2024 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759063; cv=none; b=cihxMLd/n6UKspYzr9MCEYQlmVlN6FuZtGpd5cecUDqxCyTr8wmIJHJkSBf/OQYfYnPTdcmG+uzYGb8K9bL9Ta0UQabn4Q5Kmd4AffWsdC3jUbxEwaCdWlbeRsmkIZSXY9oaio5rBvqWA14VZOB883wgXE6Zm5XwjNqPxX3xhqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759063; c=relaxed/simple;
	bh=odnZcUxgDH8iNZUY4fM5Fn33ZzBiYho+JebXezitud8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fs01hfH5evqnNoL60nxdUQ6jMwWZFhQbM5dlehdSAKbRi9kne85YC71L5KUmGfzHVaCmHKfUid+BP0e5eCQhJMhU2oyP1a9JSvo4GRnaTr6gOqw19C4gBma0ZcQTlyZ+gEDPRyizbCUvp9SnPaj47czniWszTjuCTxJAqfMrP0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DKKQptKF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=i/9DhNw/Sqych1Hue4MHcp9y0tLeOrdKyRgfTtEuZPI=; b=DKKQpt
	KFyxX+Ipae+BHV1d98v+lVHf+shQ8zWgFxOdaiXzVFu0HNft3a1sdGgsW3bSuuoU
	PSCaZV3G90qTFddBDTLp2yynxrg1UQX/Vi5Hw/CQVAuGhg8jXaRLPE8QrPjic+zu
	5K0Z/3W+YCQx0ALqk0nGdba9Z39Q5+Hc0ds7HmouAh0adC2jjor/DF8YTR7/ddc4
	zPEhlXYToVBoIWqsKn6PkJQHm9ze4gg5xn1oDqEDQR/27EZsa5TU1cv+zzBRcRpW
	WzolN/5cmpOQKAK6QYLbKglvrU4ZgkJgeVqxYrPpyjOvPkxBRQIFfHm7gvRbq0t6
	FOywwCCTxYRxLIeg==
Received: (qmail 3292291 invoked from network); 7 Jun 2024 13:17:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2024 13:17:36 +0200
X-UD-Smtp-Session: l3s3148p1@FxJZ8koaMLAgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-doc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] docs: i2c: summary: rephrase paragraph explaining the figure
Date: Fri,  7 Jun 2024 13:17:24 +0200
Message-ID: <20240607111726.12678-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'controller/target' and 'adapter/client' pairs consistently.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/summary.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index b10b6aaafcec..1b5bc7ed46aa 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -55,9 +55,9 @@ in a directory specific to the feature they provide, for example
 ``drivers/media/gpio/`` for GPIO expanders and ``drivers/media/i2c/`` for
 video-related chips.
 
-For the example configuration in figure, you will need a driver for your
-I2C adapter, and drivers for your I2C devices (usually one driver for each
-device).
+For the example configuration in the figure above, you will need one adapter
+driver for the I2C controller, and client drivers for your I2C targets. Usually
+one driver for each client.
 
 Outdated terminology
 --------------------
-- 
2.43.0


