Return-Path: <linux-i2c+bounces-10372-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2ACA8A6E6
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 20:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446283BD5B9
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Apr 2025 18:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C5B22157E;
	Tue, 15 Apr 2025 18:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBPhepYP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05222256C
	for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742159; cv=none; b=btKPpbD4MPBI90sZvAvWge8ZlO0wl9IUdXcdHOoj0hp5AK/h2BQAda4n8c8L/ECN2sOVVa8iWNrFI6Z+nomfuEAp2Xfh5h1JCBjeA8XZZ++rPyHvuPU/IsYQrJWw885C0UdGidBEFcA+Cvh1Y4W5YG/Xs2ahkO4/UAGR668OU8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742159; c=relaxed/simple;
	bh=y+CRr+GiYVZ/5maNcUQ6xt5fsEZnNSCJwGQqGM3YG08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLq0pooNAD3fLK7iFX2lNw2NhEAVKkALslKCGQnDQ+X9B+PogYeFb+6kjo8NOGKv57zVI637DJ97MmnUjVhUQcrqj3FJeqPKrhrrOC0xtqPxnqherv/jXauqrLg/w8oLGUf366zzJI4mgVCLntTxm1acvWwzR3puTERCsf7Fi44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBPhepYP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac34257295dso1106337466b.2
        for <linux-i2c@vger.kernel.org>; Tue, 15 Apr 2025 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744742155; x=1745346955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpMdRmBpZFKtd62mzmIPIR4gQqjqZQRlAvxRyrE6pXU=;
        b=OBPhepYP3BtpwB8QeigCReXo1gL5aTFAC8sql/jpa/6Atvf5Ho1iCG+mJA31FiPaYc
         3E5DKVlXaMqKdKsWYmQHvWI2coh71xTlZGX/hCnmSnAlbhxmfT5PNe29FvdkGmBj5e9c
         kyFLRDAh8qSoRt/19ABlh2V9ppn+EKY2dCoc/aumP3zJss/zrqIRVplBTgGmLXwKr0gu
         gnIHfLDMvef2z5Imyg3DfZ/1P2ovMJenla0FM4K+TkY9vTdTJv3hXFzoyHMcaruD5suQ
         vOo5o1fLgHzENhAjn6VUZib6FsQcTYg360BsH3lYOrJR5ZU9BChCJ3VACAtWyBT/Q2WF
         ZXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742155; x=1745346955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpMdRmBpZFKtd62mzmIPIR4gQqjqZQRlAvxRyrE6pXU=;
        b=ZfAWqUIzi86zfTDESC3SMVCMaqv0GLr7Z4Es5211kXlX4xNQVv2hxJCNUF5ecwEJis
         nB2ofw4GF16O9466At0xKosTBYOcwLtlS9d3K6o5EVBt46iuZNsLcgRnHY/Zpt4my1JZ
         VaabC8yPwVrFJ3OC8BfB+gxC1sJ8fdQoqiwLzLWu1RTrs9UyfaYdWxKkx8k4P1BABwEt
         mig4OXsM5ihfu6DVGO/nCHHviSC0+XAFBGCYjZHuR/pMMrwkEFVstRweLzXRHuoD5UsR
         kI7ilkDWRAqHOb0fUdkhDfhfzeGfDUQ7dsLbFWHIedaWcqBKqqcV9V3xvLVWrMa1Mk5T
         ul0Q==
X-Gm-Message-State: AOJu0YxYMtw6A3gMVbJwjqGN7797j5MeCB+dTclvDa1GfPKCbisUVZ3o
	GD4iDbbKo1MA2Iq8CJZhSoar+Ur9+pJHDOlH6iQNbWrp3dUZH6YqXarNu/VW
X-Gm-Gg: ASbGncu9aSrW92za6XY9+0OHiHwF2wJZB1e7WoeAexfXI0Vrfdu8KKNqRTWsYjvmtG0
	S0lW3z6nlctuVvqkD7xwKVay0LniaTI8LeibwbNMTJ4pN1QNsyKJvffG3FE+osnKLqwd7PshY0H
	Xg20UmdGbfa9Axho/j57WAN1R82HSQzKhJWb1WvGVJNJzEY4uKl8ULgVs+pcuR7U/uHK1INUng4
	r7AbMecHSbICpC/oprhiPg84VFYDxaVzdObyWCsBq993oWtQh6chBFYDcGEaPoMLpbQw51AyF9y
	Ysu2HOHo6muwnU4118pxSNu/LeP2Q/mkBg7Y9QycBBJldWayxxXJro7su9k3eXZ9TUVcO/Ll9OJ
	k4TMJlw==
X-Google-Smtp-Source: AGHT+IGzWSZSjrC69Dkk01UK6Gs3szfFAprYngIblnXtEm/w0yyffRHjoJoY+Crm2Uj92w1SjSQ/pg==
X-Received: by 2002:a17:907:db03:b0:ac2:baab:681c with SMTP id a640c23a62f3a-acb38310b43mr11508166b.28.1744742155162;
        Tue, 15 Apr 2025 11:35:55 -0700 (PDT)
Received: from ez-X1.. (mob-194-230-145-83.cgn.sunrise.net. [194.230.145.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccd1adsm1148844266b.145.2025.04.15.11.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:35:54 -0700 (PDT)
From: Enrico Zanda <e.zanda1@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: andi.shyti@kernel.org,
	Enrico Zanda <e.zanda1@gmail.com>
Subject: [PATCH 08/10] i2c: xgene-slimpro: Replace dev_err() with dev_err_probe() in probe function
Date: Tue, 15 Apr 2025 20:34:45 +0200
Message-ID: <20250415183447.396277-9-e.zanda1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415183447.396277-1-e.zanda1@gmail.com>
References: <20250415183447.396277-1-e.zanda1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
---
 drivers/i2c/busses/i2c-xgene-slimpro.c | 27 ++++++++++++--------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xgene-slimpro.c b/drivers/i2c/busses/i2c-xgene-slimpro.c
index 663fe5604dd6..82cad0e9c384 100644
--- a/drivers/i2c/busses/i2c-xgene-slimpro.c
+++ b/drivers/i2c/busses/i2c-xgene-slimpro.c
@@ -457,10 +457,9 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 		cl->tx_block = true;
 		cl->rx_callback = slimpro_i2c_rx_cb;
 		ctx->mbox_chan = mbox_request_channel(cl, MAILBOX_I2C_INDEX);
-		if (IS_ERR(ctx->mbox_chan)) {
-			dev_err(&pdev->dev, "i2c mailbox channel request failed\n");
-			return PTR_ERR(ctx->mbox_chan);
-		}
+		if (IS_ERR(ctx->mbox_chan))
+			return dev_err_probe(&pdev->dev, PTR_ERR(ctx->mbox_chan),
+					     "i2c mailbox channel request failed\n");
 	} else {
 		struct pcc_mbox_chan *pcc_chan;
 		const struct acpi_device_id *acpi_id;
@@ -480,17 +479,16 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 		cl->tx_block = false;
 		cl->rx_callback = slimpro_i2c_pcc_rx_cb;
 		pcc_chan = pcc_mbox_request_channel(cl, ctx->mbox_idx);
-		if (IS_ERR(pcc_chan)) {
-			dev_err(&pdev->dev, "PCC mailbox channel request failed\n");
-			return PTR_ERR(pcc_chan);
-		}
+		if (IS_ERR(pcc_chan))
+			return dev_err_probe(&pdev->dev, PTR_ERR(pcc_chan),
+					     "PCC mailbox channel request failed\n");
 
 		ctx->pcc_chan = pcc_chan;
 		ctx->mbox_chan = pcc_chan->mchan;
 
 		if (!ctx->mbox_chan->mbox->txdone_irq) {
-			dev_err(&pdev->dev, "PCC IRQ not supported\n");
-			rc = -ENOENT;
+			rc = dev_err_probe(&pdev->dev, -ENOENT,
+					   "PCC IRQ not supported\n");
 			goto mbox_err;
 		}
 
@@ -511,15 +509,14 @@ static int xgene_slimpro_i2c_probe(struct platform_device *pdev)
 							pcc_chan->shmem_size,
 							MEMREMAP_WB);
 		} else {
-			dev_err(&pdev->dev, "Failed to get PCC comm region\n");
-			rc = -ENOENT;
+			rc = dev_err_probe(&pdev->dev, -ENOENT,
+					   "Failed to get PCC comm region\n");
 			goto mbox_err;
 		}
 
 		if (!ctx->pcc_comm_addr) {
-			dev_err(&pdev->dev,
-				"Failed to ioremap PCC comm region\n");
-			rc = -ENOMEM;
+			rc = dev_err_probe(&pdev->dev, -ENOMEM,
+				      "Failed to ioremap PCC comm region\n");
 			goto mbox_err;
 		}
 	}
-- 
2.43.0


