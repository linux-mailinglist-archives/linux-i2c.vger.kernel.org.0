Return-Path: <linux-i2c+bounces-3905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B339001ED
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 13:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BA1A1F21C81
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 11:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8451974F7;
	Fri,  7 Jun 2024 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="esa6aFNX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3560196D80
	for <linux-i2c@vger.kernel.org>; Fri,  7 Jun 2024 11:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759060; cv=none; b=seTReU766XV+hiFPL3pBesH0cLguj9G9PzEMZvXuFc1VwO2C+d9DLALYfVZxtsfahi4C97n+A2ata+8pf4p757I3TYAt2aG2NsRXV3rm2hI62LfIFVlQDsJ7iPKFzmbw09ptwV56wJUF5yBzcxXRefwnX1TqaSQ8BsTmnwkpYmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759060; c=relaxed/simple;
	bh=s40ACXO4ZuXKNj0KnFQuKb88ljSQWqN5mWfzw780FP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tz5vWggkU9Q8to5BoVFa93n57hRCYw0EmGGZySNd43Hdb6/7iPf6ec9fY5BEAK9ejVhpQbkK1qUgR2fXvT1kgN5ydU+WMFy/LpK7agycbke3n4Z+Id+me7C5Nnk7ymiiuzMMr6DIbrSEpjCsWcQpc8W7vPrgpZed46snCxZTljo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=esa6aFNX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding; s=k1; bh=m1KxijPx3KzjIwZYhj4lw3v7NJt
	XBikO2Jmfpzxazco=; b=esa6aFNX8QrWMKZ7W7mEtTJo+s7Vn62eqEYDvezdL8s
	gQQA+7fh5Qfr+yG0FA5g+3ymHivEIRiQaTmdBlznAxM7iyacwHCNnFPI5iLz8Sy1
	QoyO62VABAKe6VbVG0E6uY4JJP8o77LbpEzizpeD1Sfxq4qC3HBNFBeGCRILpWgJ
	XwE3klOel9x8z8fS+OmsdQatOBcHXNmfFYKq7QhwpBVAPe+IM4s3/k9ynItWMUw7
	NzQP7iun+OtfTSMzKxgSFkjIxiJd951NtJezQaS5sQE70UeNaBKMyBVcZQnMkb3n
	k3Fmsv8i/L1m264VQOTWAUm0wEWCkqdwdsnjnxRc4NA==
Received: (qmail 3292232 invoked from network); 7 Jun 2024 13:17:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2024 13:17:34 +0200
X-UD-Smtp-Session: l3s3148p1@ADJB8koaGrAgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-doc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] docs: i2c: summary: update speed mode description
Date: Fri,  7 Jun 2024 13:17:22 +0200
Message-ID: <20240607111726.12678-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
References: <20240607111726.12678-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fastest I2C mode is 5 MHz. Update the docs and reword the paragraph
slightly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/i2c/summary.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index e3ab1d414014..a1e5c0715f8b 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -3,8 +3,8 @@ Introduction to I2C and SMBus
 =============================
 
 I²C (pronounce: I squared C and written I2C in the kernel documentation) is
-a protocol developed by Philips. It is a slow two-wire protocol (variable
-speed, up to 400 kHz), with a high speed extension (3.4 MHz). It provides
+a protocol developed by Philips. It is a two-wire protocol with variable
+speed (typically up to 400 kHz, high speed modes up to 5 MHz). It provides
 an inexpensive bus for connecting many types of devices with infrequent or
 low bandwidth communications needs. I2C is widely used with embedded
 systems. Some systems use variants that don't meet branding requirements,
-- 
2.43.0


