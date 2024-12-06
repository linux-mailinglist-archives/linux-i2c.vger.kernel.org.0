Return-Path: <linux-i2c+bounces-8355-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A39E68E8
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 09:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 665C11886A23
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Dec 2024 08:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009271EE02E;
	Fri,  6 Dec 2024 08:28:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73B51DF742
	for <linux-i2c@vger.kernel.org>; Fri,  6 Dec 2024 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473703; cv=none; b=XLribp+Hrs+6C3LGQPPeBaDWhsC4QKVDMb6dZjZGsG71kDiPDxeeWTmMRhXYOlQLpIJcmveD9X/7cgG9byGVIsWlAYKUIzTPrckB74+IWCZjepMGhadK2CXzq7oHWdmn1G8QHbwPV7Hw7ZiqxYwQnBOyrHA0LRV6JtaiB9s51H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473703; c=relaxed/simple;
	bh=NUj/RIy+KYjCQKVxkvNDJUc5nB/rN6da3u3e3JSP5Fs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O9/y50KhQD5/HLNrWImjGrXXwazI/wRk6vq9oYXAZcahkComDOfmg+CazzpiYSETwa5IJLL3Ti2AZF/4dxS4ulTM4Vrej8B5r8Brb7egJPvfj2leAsuxlWStqPcxlf0m6pCp1B02p4LV6TDBdG+7bxWxP3UHoC+gJLUwJoZCS8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9701:674a:6aea:a85b])
	by xavier.telenet-ops.be with cmsmtp
	id lLUC2D00a0YidY701LUCQk; Fri, 06 Dec 2024 09:28:13 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJTh5-000Oma-RK;
	Fri, 06 Dec 2024 09:28:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJTh1-00FqMu-H0;
	Fri, 06 Dec 2024 09:28:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: nomadik: Add missing sentinel to match table
Date: Fri,  6 Dec 2024 09:28:06 +0100
Message-Id: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OF match table is not NULL-terminated.
Fix this by adding a sentinel to nmk_i2c_eyeq_match_table[].

Fixes: a0d15cc47f29be6d ("i2c: nomadik: switch from of_device_is_compatible() to of_match_device()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/i2c/busses/i2c-nomadik.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index efb33802804fdde8..d2877e4cc28d42c9 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1075,6 +1075,7 @@ static const struct of_device_id nmk_i2c_eyeq_match_table[] = {
 		.compatible = "mobileye,eyeq6h-i2c",
 		.data = (void *)NMK_I2C_EYEQ_FLAG_32B_BUS,
 	},
+	{ /* sentinel */ }
 };
 
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
-- 
2.34.1


