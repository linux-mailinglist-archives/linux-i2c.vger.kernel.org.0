Return-Path: <linux-i2c+bounces-9907-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C69A68869
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 10:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D056885E2F
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 09:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AFD25D90C;
	Wed, 19 Mar 2025 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbFbMl1y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A8725D911;
	Wed, 19 Mar 2025 09:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376783; cv=none; b=ilS4z3wE+wUjIZLfo8A5uELTCCPpF4RF/di5IaNhQ84vWieqL/fPcsM0fl2/fIZlQ5Ur7g/sNINENb+DSpnbW6kJFJ+kTSdoVe3eybi2oTOU6nEWpWmmFE8dP6dDhDRVs+HMO/Stoy/XHDqUDb+68HPeC7iDTx1TPFt7BYsmGZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376783; c=relaxed/simple;
	bh=8BBppKUFGvXCJbYFUIL2Djj0WLKw8yCOrQ1Pbo0ctj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8HgUnBgThZx50Z2h+qEEaPvJfjivfpmBbB0yobxZ7Lx4WdxlhJYIU1DX/9reYDquh+qFUi1QpkmbZq2q7jh3C4MNo3XgeEODMasYGfFqyIMzoSzvohS6wa+BQMQgf1U696q7Y9KkMKgKRAjTX0oWyW3DVeiJLZDaGVj/PAE2ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbFbMl1y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02513C4CEEF;
	Wed, 19 Mar 2025 09:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376783;
	bh=8BBppKUFGvXCJbYFUIL2Djj0WLKw8yCOrQ1Pbo0ctj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VbFbMl1yuID3ix/716z//kaPkLmSd2/9LF4Gerrve3SgcFxP1irS4i7Ipt5XTuHHF
	 RUPX2oj4MYfWYWhm1JeD2y+fPH0864QgdBL9hDXFGmyhcT/7up9S+FfQPDg25TiMMT
	 s7fgq/WiBg2oo1klZwhTMVbOhnp8gw2ygu1F+zkffnpKBvqmy8CU1X4zvclcAuybO1
	 S0nN8ukJNfxsoAb5LEsbcVhVA0g61NUWDcYSRHTJ6zxj0xy7wBYJnQWCCqNqInJc1h
	 09KK1aVZSZOE9P3QfLYFAUOo5ylKeAQXjtMuyw3ukZu+OyDscOoXkvEsMuEzBJqoHw
	 ZyYwPr33IlEsA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 45/57] irqdomain: i2c: Switch to irq_find_mapping()
Date: Wed, 19 Mar 2025 10:29:38 +0100
Message-ID: <20250319092951.37667-46-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_linear_revmap() is deprecated, so remove all its uses and supersede
them by an identical call to irq_find_mapping().

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index f6430db6c115..5bb26af0f532 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -414,7 +414,7 @@ static irqreturn_t pca954x_irq_handler(int irq, void *dev_id)
 
 	pending = (ret >> PCA954X_IRQ_OFFSET) & (BIT(data->chip->nchans) - 1);
 	for_each_set_bit(i, &pending, data->chip->nchans)
-		handle_nested_irq(irq_linear_revmap(data->irq, i));
+		handle_nested_irq(irq_find_mapping(data->irq, i));
 
 	return IRQ_RETVAL(pending);
 }
-- 
2.49.0


