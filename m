Return-Path: <linux-i2c+bounces-5156-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3988948C52
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 11:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76EF4B25D2C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 09:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D041BDAA0;
	Tue,  6 Aug 2024 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=angelogioacchino.delregno@collabora.com header.b="Scpag60O"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268601BDA9A;
	Tue,  6 Aug 2024 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722937558; cv=pass; b=sZLrFuLY8+EU1fosUlIOVnXusNd3kq/vc0J7X1xVaxB67RgMpknTEXe+FQgjyOD2vlExKkCITS08SuO+IQctuEAD4Uk1iezvorW0QgmNKJIiJi8SjJfHR9yYzVzMTIr05+1XXZyJR4J+BgRfDBAg5oqgOeRrnSuHUgYrOQAIiZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722937558; c=relaxed/simple;
	bh=29KL4w7YAbNwitGR9raEiDDwJFtodKNQ+SX6Q3frtBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nd8E0hXY8EFMH06Z6huNj8FNI4oNyyNJ8Ex8TO6oMgbyRghli/z8NHxJOHAt9Y8orcMeNhuEcUbE96ugHbyoUumrcsBsuDEy3KX7Au4iX2ieSS8JchuUTxMRcdE3vqNmb602/InXiuKyoKfmVA9319K7GjWZds9SD9IGg2KvAFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=angelogioacchino.delregno@collabora.com header.b=Scpag60O; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: angelogioacchino.delregno@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1722937543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZctF7vNs94TXVz4Rm9jy4hDUQ6a9qtayt2LgYT34yiS/1s7P+6KtR+88tM6MR8Q6uOUMFrwBMXGdmMtff5tCKlFihNZEkdkzxMHH3LnLQ2j1SPvk64azZCpppCE2xlfEhWPj97fEnBRI9xH6kRVf8qJa1hVCZxJW+/eWOtD05W0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722937543; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LUy6mtPdj2DuYs9x688gR5X6TBdY76K1VdtXWohu5IE=; 
	b=fCIMPjgS6J2yLdEv2js4Od7DDY+d8uBVAtqhGq6Jr9dvmffbLIsmiDHOZllRT6utXbfyt3IiA7WuR4IW+XFmvDyLPYB+TyeBNrd+19unKP9E5wTRsG1aq+nFceIsb28/pVCOoFqOtu76QJle3RmQUjWnka7y+xB+V3PqMcpDxBI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722937543;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LUy6mtPdj2DuYs9x688gR5X6TBdY76K1VdtXWohu5IE=;
	b=Scpag60OL0XahnB2muQd3E/rU96vhvtYY1iR7o9njCbXKIA9hINwanTBHwjfN33o
	r64sS4zlRrzUXRy1JZx3PtHFetxql1+snioKSKj6gXx0VwwqqO33Imk8KEdh8oasREf
	lvyx6t3uDOyBFwmuFRR1MzlnU/cTcZBCVNadzGVM=
Received: by mx.zohomail.com with SMTPS id 1722937543110540.4230663378206;
	Tue, 6 Aug 2024 02:45:43 -0700 (PDT)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: qii.wang@mediatek.com
Cc: andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] i2c: mt65xx: Avoid double initialization of restart_flag in isr
Date: Tue,  6 Aug 2024 11:45:37 +0200
Message-ID: <20240806094537.90747-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

In the mtk_i2c_irq() handler, variable restart_flag is initialized
to zero and then reassigned with I2C_RS_TRANSFER if and only if
auto_restart is enabled.

Avoid a double initialization of this variable by transferring the
auto_restart check to the restart_flag declaration.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a8b5719c3372..e0ba653dec2d 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1306,12 +1306,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
 {
 	struct mtk_i2c *i2c = dev_id;
-	u16 restart_flag = 0;
+	u16 restart_flag = i2c->auto_restart ? I2C_RS_TRANSFER : 0;
 	u16 intr_stat;
 
-	if (i2c->auto_restart)
-		restart_flag = I2C_RS_TRANSFER;
-
 	intr_stat = mtk_i2c_readw(i2c, OFFSET_INTR_STAT);
 	mtk_i2c_writew(i2c, intr_stat, OFFSET_INTR_STAT);
 
-- 
2.45.2


