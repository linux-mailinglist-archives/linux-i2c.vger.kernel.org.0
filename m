Return-Path: <linux-i2c+bounces-11420-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD98AD8AEA
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 982C33ABA13
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6122E2E3389;
	Fri, 13 Jun 2025 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="plC9ULUn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE72E6138
	for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814931; cv=none; b=WT0NS904vhZRebLV7bbGsA2rq2nKfA//x3LTmFOdVmKsf/gXbvUaHJVzZMdZMqQi9dW5NdpVlkJiB5/THpYqe8ntm4+Rimhtj7LRh7uRfya60EI3zhPIZI3vM7f/BEWJhhbkZaPCmuJnzQk76Y55Vqv8ofdmk+0z/bBHR/zQ0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814931; c=relaxed/simple;
	bh=UjOVwgtEo33Ysf1DyH6d5ldmTFzYDqKUhAyLQVB9wK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tg999t277mOgG9CQjF5l0lGJ+sueBXvM3ik9lMEOb0u2ypjpByhZiVf3N/xF3D1Zzvi5NY2SxSGyf6ReOaPLKlUGIy7iANnNo0nkT+8qOtqxP132cnLxvIk17wE0h7Rwa6jmFNql2xZ9H+YHJZLU50tw1Gnyebux8Pr63LtKx08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=plC9ULUn; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a58d95ea53so21444161cf.0
        for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814928; x=1750419728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WlKCQdBK9LWxBVakFnX+t2/73xtUBtXu9i2PrxiazI=;
        b=plC9ULUnylGNLltJ/YPUOz5o61tneqDQCbYUViWc8yRcJPbUutA6Wh91Nks0pGLaRf
         U4qg6GhJ7CdVGxJ61wwfrMgPl+Uim6usuvApWZXRXE7eIDHJfsnoRUIStFDxnv3bLLyH
         XE8XCoNTQ8G3ivf1V+3FwUh0Ru9V4giBSI2c/69kHiqgVwM2hNzL+8lEkRWWVEmZYKHr
         BuJDBHycreZiGgXiTAQMuO9ZOAWIofniBOkiLCZPn6c0C8USAc75ectbFb0iyNEREENB
         IZVZxKnNkiYbvyxMRcBnD0Igmgmkr4mjbCZia+NHjd381jTdr8OgVywYSAEvF7iD5hGD
         MZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814928; x=1750419728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WlKCQdBK9LWxBVakFnX+t2/73xtUBtXu9i2PrxiazI=;
        b=pWIzDIaHPtc1fttmwqZYbO+W9JFrxgGpsJqznLTrUFU2wOm6EzLlKCDNDMdXeZ1wDg
         1iV0GqGztzT7BskwLpdcjxBQXzYqcmwUF5kFWtvAT80z7fMWRN3w3b2hAbBM4oKbC+u9
         ADwEIBXo0IBl10bdXtQF808P4yh2ONBGqjnrfsyksJBpMI/eZKFoqPcHjYPdffB1d47E
         8MkMo4aTVDuTp3AXCNexg6H7agrfUh1KhigFbaCW4e4RIeQDkeVHWIVYpEmU7sQahmEH
         ao4vdElvVAX03PZ7hIkBU1epNR2p3hwbW88XX4UU8fAsEAgukqaUpvRARmMBEfNMtkb6
         +LZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL1f8UaFMlUurieVRhU0lpTLaXvHUNl98oj1pmuaOwh5+LX0kNW/PSY4RVGoVaQu/Uy5y65xlsqwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUEkA9xsXA6cV/ezTwF3b6kp5+5v7rMWVSHz716PH4zkijoM9
	dBEAUZuNSw9Bby/uH1lWj025qZE5advlXjIodTbOqECP3tflGIDulR8m5rkkKWrdqDg=
X-Gm-Gg: ASbGncvg3v6guLB4aQ5DyOAPYGqTwQwdyzxEfKvgBbIpAPjf2ZCJ58urLyweyTH962g
	N7wT1N0sc4qzgOKW8X8QM7enKgMhwu5DzyMR3BO3c6qyURcqK8Wu+eigT4cUqhcTv3Bay/9dlvr
	6iqLnD99H6s9W3Tzx0wvR/3oWAyJ8VCw786F8D18go6LE/9Xucfs/6TrzciY4h0zMbi05wX9Wwj
	4qgKBU4JIs9HGRg8+CTrGiFHQbfdsiB7r2NclV1EcLKt6zG2lVKwzmLDPKtbK8eCXmZfSa8sCcK
	eN2xH7W3rM+6ZqjnfPYtqfcM9zvvbQ9oZpXbMQuGcOEtRppr5JQZROGjiYkjS5LuA766lcwSLaj
	iUCNJPlj8Uq1V1O5fv5+0GA==
X-Google-Smtp-Source: AGHT+IGoxDxx9zyPnLwBJu/HgiS6b9JD+b3qfzp8/xdsORghv63P60xiRPkYDDUy+K9jds0kDneIzQ==
X-Received: by 2002:ac8:7dc2:0:b0:4a4:310b:7f0a with SMTP id d75a77b69052e-4a739328f1bmr4762501cf.10.1749814928381;
        Fri, 13 Jun 2025 04:42:08 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:08 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 4/6] dma: xdmac: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:39 +0200
Message-ID: <20250613114148.1943267-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the Atmel XDMAC, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index db87dd2a07f7..0c3f14ab569f 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -111,7 +111,7 @@ config AT_HDMAC
 
 config AT_XDMAC
 	tristate "Atmel XDMA support"
-	depends on ARCH_AT91
+	depends on ARCH_AT91 || ARCH_LAN969X
 	select DMA_ENGINE
 	help
 	  Support the Atmel XDMA controller.
-- 
2.49.0


