Return-Path: <linux-i2c+bounces-5163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2FA948F9D
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 14:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 409C11C20B24
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 12:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393021C3F32;
	Tue,  6 Aug 2024 12:53:39 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311D11DDE9;
	Tue,  6 Aug 2024 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722948819; cv=none; b=phpAeUX3co38OPj0U8aLgmPOAo87FJS6A1dJGvpNE//ytjb+yk8Dc4XNhBbd3a7jUnL3OGamw1DPfoEIOtsuFYPXOuiWHVKpxmqp7/RMaJry9uQsp0NbM6coNaohQIuN/fOyim7a4Hy3yqeMLXWJ/14iG2my/zGATkWsRqlgGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722948819; c=relaxed/simple;
	bh=ajt6j/Jp9mf/uuR6GEvivnYXMPzlJycXGffmwcIUsNc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sDedxxbjuMIkD7rjGJCLUigSpqjRmuqsWr1jlg1VmycWEBFNW3OoI1SQTfsvK//f4sPIEuxtw5tPKrOu6cFY6c1QydXR6d5K68SnU1TcLBrLTuXhi4wfMZykg0oJmTWHRkfwi8Wg7ZIT1tHcyWNgsdbQcnCx0WTBpY360LoSyqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WdYBd1XRNz1L9s7;
	Tue,  6 Aug 2024 20:53:13 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 80097180102;
	Tue,  6 Aug 2024 20:53:32 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 6 Aug 2024 20:53:31 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <andi.shyti@kernel.org>, <mka@chromium.org>, <akashast@codeaurora.org>,
	<andersson@kernel.org>, <wsa@kernel.org>, <cuigaosheng1@huawei.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [PATCH -next] i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume
Date: Tue, 6 Aug 2024 20:53:31 +0800
Message-ID: <20240806125331.3170546-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200011.china.huawei.com (7.221.188.251)

Add the missing geni_icc_disable() before return in
geni_i2c_runtime_resume().

Fixes: bf225ed357c6 ("i2c: i2c-qcom-geni: Add interconnect support")
Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 8bc4040ba8be..2deaf502e6ff 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -992,6 +992,7 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
 		clk_disable_unprepare(gi2c->core_clk);
+		geni_icc_disable(&gi2c->se);
 		return ret;
 	}
 
-- 
2.25.1


