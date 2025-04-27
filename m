Return-Path: <linux-i2c+bounces-10639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B765FA9DF4D
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 08:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B9B017F6E4
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 06:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3702237170;
	Sun, 27 Apr 2025 06:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDTz8vrJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB4238C3C;
	Sun, 27 Apr 2025 06:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734590; cv=none; b=NkTFPfQqAiGr6j/95kkWrbewCU36Zl4YRtubxtUMevvCiZ0ZEt2j/eAKyDx2X7QRjKJVIlxFQxri22wT3kKrSn/zIEzUnG7sP76d37tR0Qe5/nH/ctyNw+9grdzmLQnrDE1VU6oVSFXrps4IMJuTdLqAbUEe9ER6kRWktLACqE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734590; c=relaxed/simple;
	bh=JHmA+1ZeQK8oyp8y9eMk6Hv0vqiXhbFGyjgYkZxY8Io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwGJUoKMFq3ZKCIkAJ5wOXEWVwRi8uwIFh6yrZIqedBCRrQXrKzhSKiAHsWZq1s/kpMXTvSrADI2+fTGvy4twIGTubzOE67h//BCtbxFJpVU+ZP6EfRI/CZ27MNhUdDJ1Pel9Atoscq0oOzGe5/xg2dJMceKZppPkZ3h2E2OyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDTz8vrJ; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-30863b48553so4383262a91.0;
        Sat, 26 Apr 2025 23:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734588; x=1746339388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arlXjTtgy3BAr37xUh1VQDxToO9hlb9HPCoLz/1bTAk=;
        b=iDTz8vrJCqfbfnb02QAkF0yOAgxJwpaczB1jLjFVksmJKH1WRviCaY4nsVT6GI66/f
         lEQ7xXeSKtiCswmczIirTFmcYaGXZce8Ty2c5HKHGN7mmFY4XtqH9JIinMdMxw8TDDeC
         l+2q6A0Ld8ASQP+33bWygribi0c+STLTPcInwXMoO4s38yjQUwK9CQl1wtdO440pOzqD
         ECeKvR/p5qfZEKlNrUSENw22sEVFzDNVQcNu5XBZ988jxTh87j/NA6vEN17WF4xjF6hG
         AqkLYjSdsKILB8+9rpj3prkJpi57CqVf2HH3o2+itau8IOu9v/6n+8171ofnTDENm053
         9VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734588; x=1746339388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arlXjTtgy3BAr37xUh1VQDxToO9hlb9HPCoLz/1bTAk=;
        b=JmctQVuITjjEyPrCRc27RIb5mPP23GrE8VDIWsJgdU2plqnKnWmDdgz2UAcpwQ/ic9
         kJczinIiyHR434Klwo4gEY/g7iaEXBhq2tuZ+OOzKB/4DHLvUuRlZe/nFRB/HyfAGVDk
         8PJPnqDJTokHWFXSMZaBtMk8kAql/wQtyZbz9ych4AQEeS1DtoZcuWDdgp2IIaCSIPvy
         q2tbZ+uPhTcRNOjQKoyPlQM5aGO7rB4ePb4/eSuXkrhVr5fe0OQTgNC0GDwd7DbP/IyA
         0MZGPznWuRzzrxxkMAuhPdZ9DIHbq/8sBj62aZ6aHNn8uxiDE4YNQRBwO2JssckdkwhK
         f6gw==
X-Forwarded-Encrypted: i=1; AJvYcCV7BgMwMlBdQftKf8oatktAiqUs9osDtd8dBjPM5LG/FqiWH1CgniGUgJ6VsdW3lwLsleJnOVj7ZKKXyis=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz4UGRr25+g3LLw0igEB5q3rfkXfICTvJX9Ic0uID0hYaVtvnk
	n3g8yptYimKShDWXDCzFaMQHAXdlZ8HYVpoSZg7h49L5ZbfEOHb/
X-Gm-Gg: ASbGncsTLo2eivIBEwCzrehSISql0iqs47l41v5FB+oXwAyxsQfastg6kcEeeHl0fHJ
	GwVca+AOSeLG3bi2k3jGCeGGp8VSKN91ekXJ5pRuLd6yC/rHwjBbAXYRlJ3JawiIIij9LBHt+6U
	0ddZQ+/ZDTC7iVdAuIXLbrkup9FLIcdejvugHyG38s9G5H9UJhM8pxYcH2blim6czf0SjSA8Aop
	51xHawl7QIyNAz6+76YYyAI/8OGOmbGGHQZmH4BWJx24352lLf3at7/IRPMVEBiSKRvYDjwdGST
	KofsNB1QJNgCIVe4Abmt7wCG
X-Google-Smtp-Source: AGHT+IHI7FfMmiHvegnH3jYRRExzK2Sstbajg7ZocUmpjDuKv+l+0QX83bfc8/fIIkBGnpajgMyTQQ==
X-Received: by 2002:a17:90b:42:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-309ee37b550mr17322947a91.7.1745734588534;
        Sat, 26 Apr 2025 23:16:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d461sm5080287a91.39.2025.04.26.23.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:16:28 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 27 Apr 2025 14:16:10 +0800
Subject: [PATCH v2 2/2] i2c: imx: drop master prefix
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-i2c-imx-update-v2-2-d312e394b573@gmail.com>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
In-Reply-To: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745734572; l=873;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=JHmA+1ZeQK8oyp8y9eMk6Hv0vqiXhbFGyjgYkZxY8Io=;
 b=brBU5+4z/15z6LPbx1Emc7dlsMzWr4mB+pXCEvGTacv+PnzSKbtWKD2fEFPLA/3wrRBLY49cj
 ffZoQ1gOG/EChkqymt2Edi//dG0kft8qcLuY1pf/DD6+0X0LiDOVCjO
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

In light of the recent updates to the i2c subsystem,
drop master prefix.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a98bf01c5dde..fca3d1adb627 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1689,8 +1689,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
 	.reg_slave	= i2c_imx_reg_slave,
 	.unreg_slave	= i2c_imx_unreg_slave,

-- 
2.34.1


