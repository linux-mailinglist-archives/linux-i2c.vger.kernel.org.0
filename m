Return-Path: <linux-i2c+bounces-2864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D204089F0B5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ED531C2032E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A33215EFBC;
	Wed, 10 Apr 2024 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="e61aOThH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1257C15ECD4
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748321; cv=none; b=SWaaGBS5klbbainiuYOPV25RTTkwwrSPjf5kE4qVBMd5TtPtDTIqS5C8/mFhPbQqsLdx0FFGMQ9+HRDNgU7PBDZuGrlOJB4bc34h0W5sv0U9co6UUu+SpULYxSRM1rlpqVFGnbKjsv222TM8w66N2wO5shyUZuW6BNeSssWoH9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748321; c=relaxed/simple;
	bh=y2QeXjoOMiwMA543m/jKRgEBhto40dDwX/umjYl1yiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQn/Pn/nC7YgIe1zk1gfvVWQlkyPQ9t494WpQlCy5HvfasU/mqE0ezltN1NTqC4Vfnt03HPxFZTZBjhuCaUvq/3oCuHmLa7TzhuknUrbIhsMRuiV6bJGiM74uvX9TMm7gzC2NzJprnwjbqovUPx7adoputrfft87Qkwgqx3NMek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e61aOThH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tTh5gHnHTO8tnn3N/EUqm3Hs/2cCwpj+zf5vzhI2jO4=; b=e61aOT
	hHkW2NOKlDMp0TsvrVPjYTmQqz9G6Xfcy4dHz+uo7EKsZwsdYFgTTcGXuAn7f+hN
	PfX+75V6R6IdoC8PKSbQrHZht+Z8lwzqghjNxgf6NDV/Q1eq6+QWkooxVjjytOoF
	m+j5jM1//kWHUH3M65OJFa6CFln6Z20DJE5R68iZuhIAtGClWAkld7cvKeWG96gq
	OytNpo2VNSVE5AKSL8nl3TZvZW9zWokIbnswIEBw7J9RzT2+6qsa8QkyX9Kae2vF
	KPk41mjCQLuUsJZWVYzYK/4n6kn3jL9Y6ZwEmUDbCUkn4AUTtb3+EjN1DBxsliIn
	68yvSpKSLylj7xwg==
Received: (qmail 521797 invoked from network); 10 Apr 2024 13:25:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:14 +0200
X-UD-Smtp-Session: l3s3148p1@25HGSrwV9SJtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:27 +0200
Message-ID: <20240410112418.6400-33-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rk3x.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 086fdf262e7b..8c7367f289d3 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -1106,9 +1106,6 @@ static int rk3x_i2c_xfer_common(struct i2c_adapter *adap,
 		spin_lock_irqsave(&i2c->lock, flags);
 
 		if (timeout == 0) {
-			dev_err(i2c->dev, "timeout, ipd: 0x%02x, state: %d\n",
-				i2c_readl(i2c, REG_IPD), i2c->state);
-
 			/* Force a STOP condition without interrupt */
 			i2c_writel(i2c, 0, REG_IEN);
 			val = i2c_readl(i2c, REG_CON) & REG_CON_TUNING_MASK;
-- 
2.43.0


