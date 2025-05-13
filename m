Return-Path: <linux-i2c+bounces-10956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C1AB5506
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 14:39:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8AD61B4601B
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 12:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1509328EA51;
	Tue, 13 May 2025 12:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="T9BrkI16"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565E728E60B
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 12:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139894; cv=none; b=R5YMVh14/MZyRvUMWZ2lbewaQbaz+cPJ1Zd0XXcNY0hWITRVhg7udWat0QDxeIigeriqRkFvO7dkmt6BnAGjC4WqhKpAVgOiItBJZhRlDevqyseeMyY5OA1XEywiCl/7d2TuhOzPkhCTnBLzGR5TUUqiuuqeV03MndaF+l0Cys0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139894; c=relaxed/simple;
	bh=B4HNPGlb8RLmVynWPqZbQF5JMCh297nnDceOIvWjfg8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XjagRjT7R3Q48q3q94tUZ+4eRcX5n54tl6qQPcycfdXDFAMbHjhDuHg8uyX5fjOz573jzJSn4eHnTAuRNenOFdkX7HQUqNOcgksXKzU/snOba7pxtfZbgYvH8nmQfrWD90aodcIN/sLraSKYuHa2N3a1+v+fhJade+kxgnSSIXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=T9BrkI16; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=QS
	I4ojMELuD/cIxrHe2nbcxcvUn/5KaEh+E4bLt83oU=; b=T9BrkI16Ejo8dyag2i
	o8PBiCDux9jdd0r4flJ37y53gFyMaPfrw7BL4ilG/Z4AoKPEjvBPfVFnL70ULbBj
	j37klTDXgjAoCj25QatkrrZHhi5jfq0o4XKeJDjaIbk4GHUokO3dak0PmuL1AH1L
	W0ZZUmXRp8TJA/yRe0eefHsmo=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3fxUjPSNoLauXBA--.49976S4;
	Tue, 13 May 2025 20:37:59 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] drivers/i2c: fix a potential null pointer dereference
Date: Tue, 13 May 2025 20:37:54 +0800
Message-Id: <20250513123754.3041911-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fxUjPSNoLauXBA--.49976S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr15WF1xGw1kKFykJF17Awb_yoW3WrcEgF
	1xCwn7Gr1DCwn5Gr1Yya13Xr90kF1kuF4Ivw1vyayayr9Fvw1UuF1kZa93A39rXrWUKFyq
	ga4jvF4xZwnrXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMID7UUUUUU==
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiJw1M5WgjNnygwgAAsg

Add check to *priv to make sure the input *dev is not NULL,
and to avoid a potential null pointer dereference.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index d2877e4cc28d..ebc600f3a7c8 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -968,6 +968,9 @@ static int nmk_i2c_runtime_resume(struct device *dev)
 	struct nmk_i2c_dev *priv = amba_get_drvdata(adev);
 	int ret;
 
+	if (!priv)
+		return -EINVAL;
+
 	ret = clk_prepare_enable(priv->clk);
 	if (ret) {
 		dev_err(dev, "can't prepare_enable clock\n");
-- 
2.25.1


