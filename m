Return-Path: <linux-i2c+bounces-9406-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421A6A32D7A
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 18:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20D2B7A2470
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E7C2580EF;
	Wed, 12 Feb 2025 17:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="tla25Y++"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECA72135A1;
	Wed, 12 Feb 2025 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739381306; cv=none; b=p5YCRyF/wnMHVfn8UfE9QVK0PAH4Gcd08SIVTWrkLruPIs5A3OnLtL5yjeTSZKtqFQj7D7WpSySiw8bouHD0YU0aGEvFr8+EnF/9k33gmV+c8k523e4OxOokhvibHE/9uYFlFWQut3FJ7FCHGIWA8PNNIoaWIDKsVQDw6tbaeBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739381306; c=relaxed/simple;
	bh=YoMJb8qxdaBZ2FfPKSJ6aNSi1+hv2FaDmvUktVaXuPI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b3uL+6A7b++lv4s14HxDBK7LHfBR66l6T14Ac+gkRAgpPaSg7FrQ2HT48XtQt3Te7tvVfeHh1EGNOLLLavi8RlWWjTcU2//5YfuP7XYu+Yu1U0Qeu2EFy6zvahvatAJ3wMviImMknw6RK6v0cyIIOzwkO2gaWkiMv3vIhnYmd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=tla25Y++; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 38A5442248A0;
	Wed, 12 Feb 2025 17:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 38A5442248A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1739381294;
	bh=BbEQoxYm368J0enW1RIgZkEgaJNVK0+oOkgYpGQJm3g=;
	h=From:To:Cc:Subject:Date:From;
	b=tla25Y++86LJqqUH7GJV2DiAbaWfmTc0A/aO5jJt5TgP3wVA45MdpMuExC1Ixmyhf
	 FQpTMxgYLzCEc0eirdY15G1KVArI28XTGG8zTshb/1HftMYExai24JsvD7UM+yt45f
	 CeTyQLosuWYVz9BAekmgFDW/aIiZHkRSrCfc0H+g=
From: Vitalii Mordan <mordan@ispras.ru>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Russell King <rmk@dyn-67.arm.linux.org.uk>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] i2c: pxa: fix call balance of i2c->clk handling routines
Date: Wed, 12 Feb 2025 20:28:03 +0300
Message-Id: <20250212172803.1422136-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the clock i2c->clk was not enabled in i2c_pxa_probe(), it should not be
disabled in any path.

Found by Linux Verification Center (linuxtesting.org) with Klever.
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
v2: Use dev_err_probe() helper function, as per Andi Shyti request.
 drivers/i2c/busses/i2c-pxa.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index cb6988482673..c4e938c667f0 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1503,7 +1503,11 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret) {
+		return dev_err_probe(&dev->dev, ret,
+				     "failed to enable clock\n");
+	}
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
-- 
2.25.1


