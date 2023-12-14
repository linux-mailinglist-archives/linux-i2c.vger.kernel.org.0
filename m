Return-Path: <linux-i2c+bounces-778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CB9812D91
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 11:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2E0CB21334
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 10:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E92E3F8E7;
	Thu, 14 Dec 2023 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZRo+UjP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A6611A
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:52:59 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c60dfa5bfso7643615e9.0
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551178; x=1703155978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuS+45h2ga3aQkPKsayipRVsQ8w0E+s5uDXU4i8VrWg=;
        b=aZRo+UjPXLgFt4whs/qPqciVYMVoliRW4Ld94w6FwAIl5U/zh+prH9DxSNaOFSObpT
         6FgjPxNweVjcZGfdu+ZIkTlwIy2Z4vny/Ql26kDImvpbZ+KRbmPeQxiCegb47jiwhgBN
         GIM9CJ3fQQJxExHDhQ3J0l/jhHL42At48M8NcS4ecRLSmOz+V0eQPEbnIs4QLg/EDZh3
         4kv3L73CdLiVst6TdY3T2cy900PYSiJrfQsRvKcoqcyGlaA8L2bXo4Ksmd3vGvnQLH4h
         W8diypSWW0UUSZrfaCQKOoACVJpPNP+To1KYsms5iTW3kzfcxnJ+IsTFNspsV5fSrD/9
         6VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551178; x=1703155978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuS+45h2ga3aQkPKsayipRVsQ8w0E+s5uDXU4i8VrWg=;
        b=n93NrdbKtvuoNhAdS/cA3fm8xE9szh22IJioQGoh497yzMkDLhKTMMgf67E1IVVCWJ
         FbpVn42SSpdOISf8Fxs1siEAAp+R+1paj3cy34VQeRRrep0gif9F+hUsmGrMhSKsEHjA
         749OnhcgC4kobRjPbddvUKpoxx5Q0rAevnbbqrxKncLbJEgpMlMLbSYyqd1LymCRTQ7W
         G4rIwL1/FhuHxIaGByX7AHnejZF0gQxfsrspbeQHk0XTBRoIq18LQEy2buzBoM+ebdTG
         WXjPdZfEAJGwhgehmcOwki0MIWgKOYbYVODXFDls7Q4nmZcq5ebEoGajxhsU8pJWQKVI
         dDcA==
X-Gm-Message-State: AOJu0YybJoXGmvrv+pn8AhCNvAbbR3bXboJZgAIFfAL3S4pCp20pjBax
	fFRhyV3/9f0SwlTcGrhsCkWenQ==
X-Google-Smtp-Source: AGHT+IHAGC45+JA4KfBfVBo5MvsdcmfG4HWD//LZLINpHkMirvEDnQf0FMXjRjvFzd5QesYIFv2g5g==
X-Received: by 2002:a05:600c:2113:b0:40b:4520:45a6 with SMTP id u19-20020a05600c211300b0040b452045a6mr4416373wml.8.1702551178174;
        Thu, 14 Dec 2023 02:52:58 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm17614854wmo.22.2023.12.14.02.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:52:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 07/13] clk: samsung: gs101: mark PERIC0 IP TOP gate clock as critical
Date: Thu, 14 Dec 2023 10:52:37 +0000
Message-ID: <20231214105243.3707730-8-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing USI8 I2C with an eeprom revealed that when the USI8 leaf clock
is disabled it leads to the CMU_TOP PERIC0 IP gate clock disablement,
which then makes the system hang. To prevent this, mark
CLK_GOUT_CMU_PERIC0_IP as critical. Other clocks will be marked
accordingly when tested.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-gs101.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
index 3d194520b05e..08d80fca9cd6 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -1402,7 +1402,7 @@ static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
 	     "mout_cmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
 	     21, 0, 0),
 	GATE(CLK_GOUT_CMU_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu_peric0_ip",
-	     CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
+	     CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_CMU_PERIC1_BUS, "gout_cmu_peric1_bus",
 	     "mout_cmu_peric1_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
 	     21, 0, 0),
-- 
2.43.0.472.g3155946c3a-goog


