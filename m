Return-Path: <linux-i2c+bounces-2863-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9CE89F0B2
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70B128829C
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB9415ECE8;
	Wed, 10 Apr 2024 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jGE3GHSr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE6F15E5CD
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748320; cv=none; b=KuEzQqKCjIGW00z75cjDeNWhgZg02iwivbfBpU6yDMZaf2Z+UGOZuYeLX+/Cox7uIhN/R4ZLSd01gb8Lq4xW42nvLa99EJEMtFpMbz9uROzQwt45YOvXtNqpej9FI2rFmtgpEiRBN2lib//8W/peGMHpjU9bjBKxaUQQJxs1l8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748320; c=relaxed/simple;
	bh=sxi3WEpwgXQI9JfKHETzDTiVADUhdiDC54vmSGW+gcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1/o/Khl+ilPxK4e66JIzBR97zf9bRgTvPRamsix4mMUMtnGiN1xSIxZwQ1YmYm/y2x4rAqdLZ4AD5DuLAWGgH9Lj/aXDJwHYbds8ptn5D3XGC5LlUo9aDSOHhR9XbpLBhpWSbwzNJ6Fh9x4Lif4v6lZyg7uKX52Q4U29+aVNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jGE3GHSr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=k+7gyTeoVGWoiQtUP2kx99lHQC+xHgNqfgabFZlIt1A=; b=jGE3GH
	SrEt72iicQl3z+Wma4LyoJbEUhwq4GtkhjTCBT86qz3m3dKyZqNgvIgN9ulyjctM
	zLhTn30TwyJBvhhIIPmbV4hAa3R87lCupIZ3t+oD4PkwDA99PKFuG94FDI+dyrEz
	ZUA9x3+ENczhqRVFL1LWAb2IO9vnpQtip4k1s7DJu7RmyGmF6K8hhuMVpjV5zb5U
	y9zMdP26ZYjAvSqATF2aJ0iL7nOBFQgKWflgArrd4gQCViSeqV0NtV23+NkihG3F
	y32+rxjyjiMR+WFFmsSFDKxyeRRt6pzWF0PMRg88Zya8AKgv9km7NUci+W1GKuVo
	5+K/SLLwioe8w7jQ==
Received: (qmail 521729 invoked from network); 10 Apr 2024 13:25:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:12 +0200
X-UD-Smtp-Session: l3s3148p1@5xq1SrwVmi1tKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/18] i2c: qup: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:26 +0200
Message-ID: <20240410112418.6400-32-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-qup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 598102d16677..c9b43a3c4bd3 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -793,10 +793,8 @@ static int qup_i2c_bam_schedule_desc(struct qup_i2c_dev *qup)
 		dma_async_issue_pending(qup->brx.dma);
 	}
 
-	if (!wait_for_completion_timeout(&qup->xfer, qup->xfer_timeout)) {
-		dev_err(qup->dev, "normal trans timed out\n");
+	if (!wait_for_completion_timeout(&qup->xfer, qup->xfer_timeout))
 		ret = -ETIMEDOUT;
-	}
 
 	if (ret || qup->bus_err || qup->qup_err) {
 		reinit_completion(&qup->xfer);
-- 
2.43.0


