Return-Path: <linux-i2c+bounces-2862-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050489F0AE
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1F041F22E3F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB5B15ECC4;
	Wed, 10 Apr 2024 11:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O35o9sA/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C58515D5D7
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748319; cv=none; b=S5t8KW3eWYPHTARsYSJho0QGrUCMPw2COoArMV/meCHtYYGAEBPYXFs2qYD797gP40XPaBs9yPLt6RNAZjwRMteNaonltnGM1/H7DZtuuH6b/rDw0UK9GDdGjzMifRmBrVrWMQ16hBw5Txb8Hxnt53R2qNWqQrxNJ79Q4x3PmSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748319; c=relaxed/simple;
	bh=+pdjM1s6Ki6mrvtt2IV5vM61l9m948tojzNqs2Jkx7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNok9+Rja85aHyEqYISOrK/HwK8Dqpks8zoj7/dvtT5eZQW/EwYicVnv3KLjaDNQ3ED/W1WSYL6J40k+rMInG3KQ9DDQq5KGaNJhxsROwgmfdP2X2R48AwyHKxYWguj0l3tTkk6jOv7cVKj0QE1slDczLr6pN3ZKmn25uBynxCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O35o9sA/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=MIh2Te8HRB16dLWCZQy/u503SxPLZR4I/XrMPIptOnE=; b=O35o9s
	A/QrxQdnKtCJc5CK2Acr3z8X5R8hpnyPciX8LmYASeqN1ZEpbMmFbgFXvLwgE7YN
	kH6BRRwlzqFFXmQwHItosHjSMm/ZqdZXrBq/lG1SckthpkilUm2XBK1MJtP+q/2x
	qXfy62rIR+sHfUj65K7+0R83adECJYhroq9Llm1isGbk3b+0gaM1dKkOORdPbN5a
	05o2Zb78BVnIfGCC/gZIa84AhHuTdo23+0FgxYAsqigAklFoWVFR9IWAn9Hb/tQE
	YUx8UctlUXT1kj5xY5Dcyw0WU8bxD4vZ8yEE41Tg2cbQhrhWGbZg/QZcq7toT0uW
	aVcRr7QRkCZdT/1g==
Received: (qmail 521651 invoked from network); 10 Apr 2024 13:25:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:10 +0200
X-UD-Smtp-Session: l3s3148p1@A06eSrwVZz1tKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/18] i2c: qcom-geni: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:25 +0200
Message-ID: <20240410112418.6400-31-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-qcom-geni.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 11dcfcf13d8b..6054c62cd2ff 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -642,11 +642,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 		dma_async_issue_pending(gi2c->tx_c);
 
 		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-		if (!timeout) {
-			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
-				gi2c->cur->flags, gi2c->cur->addr);
+		if (!timeout)
 			gi2c->err = -ETIMEDOUT;
-		}
 
 		if (gi2c->err) {
 			ret = gi2c->err;
-- 
2.43.0


