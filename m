Return-Path: <linux-i2c+bounces-10793-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A475AAA0AB
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 00:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A29E4461608
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 22:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028DC27CCDF;
	Mon,  5 May 2025 22:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u06bKsIN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCDF294A14;
	Mon,  5 May 2025 22:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483517; cv=none; b=lk0VSoxsuPsQXPRbWxFgwQpoeY8q7fIUShODXE8GRyBj+W86bwCvRRCuqXYukWv+nS/oioZH4wbX653zmfAXqCBM/yYjj9pFfVCb09DYv5g3iwTMOKwLEOPUHcS4KLzEwoF4MhPpDxbron2yvcbLCJv+Jp5NNVxHFvsQ3w2LNSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483517; c=relaxed/simple;
	bh=JFmXk/rXJiiaZIElLGrGEt9UTRxBH46Otd+X+9+OKkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k4HIz+GgG18AMltHHbEmDQT/v+YcBVW2yLU/sNBxs9wxqJWf+/sdMKEtz58KZ+0Wv3t4EkBLbiEAQdMuldxt8WIU2WsDXAKH2L3CfrgaFE+xKfO2ywqkAKGjh+SfSmp1w+5K8w+TvqzylrPvwT7nFHEVP7zCeQLZV4cdJMyjkiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u06bKsIN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D13C4CEF1;
	Mon,  5 May 2025 22:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483517;
	bh=JFmXk/rXJiiaZIElLGrGEt9UTRxBH46Otd+X+9+OKkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u06bKsIN78nkxx9fy9XdVF5y2Lj0jqr2IJthJfFUS/O4LDuAyiNy3jrdVxmsnaOZa
	 8sbVI42M7aURPSSt4RedZRJx0F10Mj42EASuvZes3+I7YmFSAHdfWEuDue+PxFpp7O
	 92qVHL/85zGkatiILRWRNO0o88j039NGsEa32+jkHal1W+b426FRH/d9Zuwc6iPJ0j
	 7vCTZu9q86UUCdq97sIF+fGpF0PQ6pQBam3bzfyJHknBfWbqurPb5Qs1IlkkCnjAzS
	 1dluZm4DTpWrcFeOi7Sn3h9DGqCocuxJsQXybH69+TDnIdZXr+8C0r6YtCcQPH2+tK
	 Y1/WdZaTvzVJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 092/642] i2c: pxa: fix call balance of i2c->clk handling routines
Date: Mon,  5 May 2025 18:05:08 -0400
Message-Id: <20250505221419.2672473-92-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Vitalii Mordan <mordan@ispras.ru>

[ Upstream commit be7113d2e2a6f20cbee99c98d261a1fd6fd7b549 ]

If the clock i2c->clk was not enabled in i2c_pxa_probe(), it should not be
disabled in any path.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20250212172803.1422136-1-mordan@ispras.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-pxa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index cb69884826739..4415a29f749b9 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1503,7 +1503,10 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(&dev->dev, ret,
+				     "failed to enable clock\n");
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
-- 
2.39.5


