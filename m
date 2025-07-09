Return-Path: <linux-i2c+bounces-11882-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDAAAFECFC
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 17:03:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85ADD64785B
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AAD28DB56;
	Wed,  9 Jul 2025 15:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMkFb4+p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD292DCF7D
	for <linux-i2c@vger.kernel.org>; Wed,  9 Jul 2025 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752073344; cv=none; b=ALEgInue9ZfoNwTiaNTbAtPYpoKuwdCF3g81lFUqi9nXmjX8pbBAh9srBRJ4qfE0FG/qUDG3SxsgmM5UNhBczn7QjskdQnHjuOm/JSwH7+V8CmfudWJGaJl+vMHDxigG/5lJsu0msJ+R0EYd0p2agFUhQyNFdKaVjqUpkM8kFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752073344; c=relaxed/simple;
	bh=t5+o59dyBvPA7bqoUaNy9Xz0kUitQAN0MDsbwVazwh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZcccQOGmG3kMpxwJy/lQuvcT6W+tb/cCayM6taf3x7GujFnJBqKxZoGnWmCTuugTAlTXjbDx3Clm84UWeY+KJhozUWubWz59Bu5duh/68GkJ5SN6voDWRvEFg8BQQXDMsoxkir2IGkehFlm3YeiAx5YEb3w7dCg4vbzKZOcjq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMkFb4+p; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23c703c471dso10111585ad.0
        for <linux-i2c@vger.kernel.org>; Wed, 09 Jul 2025 08:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752073342; x=1752678142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbLVmFbNIp84nKm/w3pwjDXrr7Sz2Qn+3ewjbseJhQY=;
        b=JMkFb4+pkhRirX8OlkMWiZLGNfpLnRrEORAt61gkRc6Pte4gHiuAMOKBQ00H1Dkxb9
         z4X/XXinBcGa+Izrd/VmC8c4IWXJctvpAkn36cYOQOjronvQ+dzimgOcryz2gEGSoPDJ
         fKqZ9uRQ5dW5VMRg6wa3cmSXyrG78TQu/FrL6noLGMBGrkMsFzJX/xi5PUNSR/VTZyXt
         mSlkfOEzWPy1glQ/SZH0fg2Rid7v+Xq6kdcEg8A1tZ4i1eou4B6Znd9ODrLc7j2OVtuD
         aSc/JbaNvUgKbT7NTXPeOeTJAmfhhOxjS7y/sEfLqgN4IHgQdjFpI/fw7GJRGTGXW+bq
         OdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752073342; x=1752678142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbLVmFbNIp84nKm/w3pwjDXrr7Sz2Qn+3ewjbseJhQY=;
        b=e9f1OMdNNdeK7NgGnrvYNzzqMKetg+BDlGJvfjfe0h0RDwsyMQwnjb+BmxRGNVPqCG
         1/d31YMB3RWEwCvyeOuZCPW4/Yo3sL6v9eOdm2rZ3j01sIZNnBssvEpbc6JeUVJaBtSO
         GkuRO0KPA6Jl1koo0jHP78ak3x2O8MPyB+qrbwEdTh0UQvamXcabNrKzcoEDsNkZ8AZc
         8Wc5NIHjh33kqe9dvthNQ73xCDmf9Rfvb4d1Bsl1ABKAn6IFZFN7q2LE/fSOmZkzEFRB
         sEOf+/+bNZ7NftniLERw8zQxHBoy0DhEDfH+PV8WIygbKENYzmsCRRa64NsQhSH172zJ
         Kyjg==
X-Gm-Message-State: AOJu0Yx6igkCvgYUKHxLRdOLfnz5oKZlqkMHBO5fgSwih2Pp32o897n7
	SaBtA67jy6sy3e04a4G1YP1lfGN/vJlcuNukUCNgEPsJNx+l4T3IiuLm
X-Gm-Gg: ASbGnctGpaVtj1ClXYfSi/VqkojWkjJNMTv046XUxYuGEmDfD/y0aSZP3ug7//eFE0/
	e80blusq3uy/VqBTucLhjmhKf8rECyVb//rWghSzF+0eEOtB1UdKjkZY9gEewN0HqbQXT6MGDsH
	Eda3I6E9E50F32szDIlK4pnjiAuO+NLHAzOnXz0J1XwIVWr2qQM/GoQFkqrrROZ+gv7hq/5P0EL
	nwvcX0//y19GFO7/XPZe4xHP042KhosD7oLKz/Gk7HVCHeMMXItpSC2vyKi1gCnbSsbmC/tMFcF
	knmqXVoINaugeR46Hl5Jl7GkeTv93r2+D/fNvwcN/0h0vnsuRja9bmkQJMtglp5WuZjWtRfjM7/
	tqe2LPG4KUAqNnSozZTCa
X-Google-Smtp-Source: AGHT+IEnuUF1zPXViFwZyRzDA3Z+5HeVtooayrBUBI9BctH13iVwKQfJ/72fZFPSc298qLHA+gngjw==
X-Received: by 2002:a17:902:cf0e:b0:236:71a5:4417 with SMTP id d9443c01a7336-23dd1a8b6d3mr117696335ad.5.1752073341539;
        Wed, 09 Jul 2025 08:02:21 -0700 (PDT)
Received: from localhost.localdomain ([223.181.118.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84351ae4sm143349455ad.72.2025.07.09.08.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:02:20 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	viswanathiyyappan@gmail.com
Subject: [PATCH v3] i2c: Clarify behavior of I2C_M_RD flag
Date: Wed,  9 Jul 2025 20:30:50 +0530
Message-ID: <20250709150203.7199-2-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709150203.7199-1-viswanathiyyappan@gmail.com>
References: <aCtgNpWs1tJ1FltB@shikoro>
 <20250709150203.7199-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the description of I2C_M_RD to clarify that not setting it
signals a write transaction

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 include/uapi/linux/i2c.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/i2c.h b/include/uapi/linux/i2c.h
index 92326ebde350..a2db2a56c8b0 100644
--- a/include/uapi/linux/i2c.h
+++ b/include/uapi/linux/i2c.h
@@ -21,7 +21,8 @@
  *
  * @flags:
  *   Supported by all adapters:
- *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001!
+ *   %I2C_M_RD: read data (from slave to master). Guaranteed to be 0x0001! If
+ *   not set, the transaction is interpreted as write.
  *
  *   Optional:
  *   %I2C_M_DMA_SAFE: the buffer of this message is DMA safe. Makes only sense
-- 
2.49.0


