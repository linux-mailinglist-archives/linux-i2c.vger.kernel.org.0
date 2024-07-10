Return-Path: <linux-i2c+bounces-4834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C6292CDA0
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51CC21C22BAF
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF3017B43B;
	Wed, 10 Jul 2024 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KiZNg4Xu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E4B17D34F
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720601757; cv=none; b=uESZtwa2gOxQKouT8DcHEsGtbMAJlCOBaH2VGFc6x/SURPZw0YiF/u1ylfz93GSwPdhMDdxOn//uRYFx0FNQ5+PXGYQYDFNrFs7iifMuvL+GIVNO0hgOltABv3DtfXf/k+9ygxol+8bOjgEXpD0mfETGK9KaqnXfUATH8qpNmGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720601757; c=relaxed/simple;
	bh=Tt0Jl2tU3zO/Wh7c+LAq5u72FP7J2tjQ9tyd8S/2bFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDKJQ2ENkdflORMMGNSzhDiDz11KdKT0Reid4YyWZ9jzqV7x4z59XviQtkEtIr6SozGyjz6q83hHRVvCKrkrWQxBtT+0qiRQvFp7H6EN+TKnR9JD0yCv4Gm7ddrZfiPwXRck3uRcLCNbT0YFW2vFoGa2AzKQrQcHImbwcH1pEVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KiZNg4Xu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=koCGvESJ3Imm6Y
	IVfEKZUOMd5g8GfRwpvXlAJ7OyOYY=; b=KiZNg4XuCOXhRVuBIVA4V9ds+FVFVX
	TXIy1+VDRIQIpaoSSFutXpmN/qZZNI9ECi2pShKksw4YRs0fUbqUSiLwwEjzJn3l
	3gGN0vPUHDRRw9fziodi/qZ08QwOgbUzRAdJTwHH5D+3A+XdYGNjTPIeLvilEBWn
	IOYxJy73KmNfR9vHj+QIargdCEPdp4uBOHqP+0YNFjxN5BaCfF3lviz6CFwWjgjj
	zlJXr2rQ7tl3JPzdCqMSO6MTDxQ0b2oP6mSX7U2VSZACeboawkZmq0C9j1nO6YaT
	iJ6OJTu74KBtxJKXTQcaQhCFlGmZEGc0fh4zx3B5cfTTdydsJRLnZyeg==
Received: (qmail 470350 invoked from network); 10 Jul 2024 10:55:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jul 2024 10:55:21 +0200
X-UD-Smtp-Session: l3s3148p1@jydhzuAcPNsujnsa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
	Alain Volmat <alain.volmat@st.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mark HostNotify target address as used
Date: Wed, 10 Jul 2024 10:55:07 +0200
Message-ID: <20240710085506.31267-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C core handles the local target for receiving HostNotify alerts. There
is no separate driver bound to that address. That means userspace can
access it if desired, leading to further complications if controllers
are not capable of reading their own local target. Bind the local target
to the dummy driver so it will marked as "handled by the kernel" if the
HostNotify feature is used. That protects aginst userspace access and
prevents other drivers binding to it.

Fixes: 2a71593da34d ("i2c: smbus: add core function handling SMBus host-notify")
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index d6213d251336..57f03cbb1f48 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1067,6 +1067,7 @@ EXPORT_SYMBOL(i2c_find_device_by_fwnode);
 
 static const struct i2c_device_id dummy_id[] = {
 	{ "dummy" },
+	{ "smbus_host_notify" },
 	{ }
 };
 
-- 
2.43.0


