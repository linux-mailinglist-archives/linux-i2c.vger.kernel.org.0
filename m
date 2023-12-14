Return-Path: <linux-i2c+bounces-779-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C002C812D93
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 11:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CCC928169D
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 10:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563E73F8F9;
	Thu, 14 Dec 2023 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWmrLSaN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEA6A1A5
	for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:53:00 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c2a444311so76940365e9.2
        for <linux-i2c@vger.kernel.org>; Thu, 14 Dec 2023 02:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551179; x=1703155979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Megaf9f9M4nt2nVACiBPuppJXE2rpfqhEX+FbrDDmrA=;
        b=eWmrLSaNshz1uXxFUxh65YDl61DlGJpl4+UghogrCooJdDIg2hY4E865PujS3/dJcq
         O04v16i+jDsPMwMztSompMN+MtZGqDtCu9GpYhFCY7Bt5T8VqSirffi1WL7PaDFPJ8sd
         5cPubnPiKyj6rWcAs5UGww7gGhlOxdcEk81xnMWs6H7HekFK64K5PCBQVDhiNr5K3HfR
         EXyaAVFWk7dPgC8YsAeUCNYUh89EVswqyh1X05JVeQQ5KDLhgu0QAcnm4AD9JGAw6xvx
         BRghvpBMOSz4esE5UO+CGxK/wbiiJfN7p7Oj20E2frPrnj7X42HN5haFFUHVoXyLOaeN
         XenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551179; x=1703155979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Megaf9f9M4nt2nVACiBPuppJXE2rpfqhEX+FbrDDmrA=;
        b=uEoEK6rjKHsJccQUZha5wkN99a9xSBc2gNO7EQ9gtnT0VgXizaZ9F5cJ9kTiPqpyEC
         e0tcnPPkHqRxGTmHmF4pUHU++bT2/U9b9wGGxidu0RgwdGtQwTezE/eDI5PJUxelIec8
         gynTL/hJdxACPEJHnlf5/QU6QkxV+RCVCeXQLIHMuLOrrMUwuVZ3IeS6O8FeCqhZuG85
         utAWd9AZ4nktKAQzdOv+V3ylROY7yYjwid9cPRbSuKeYvk34MbCnPJAqaCbz76NATbRW
         qsPuR9/Cx+Pony+GzMZ8YasZPj9hYb3vKsZvUTLfJCwVow0qqDcukVvnpcF6Pel0+4Yn
         NbTg==
X-Gm-Message-State: AOJu0Yxk6O4FeUPB8NM2TzXK7xvAWW/gJNHbhwYrFVt6G4HcTWG+1mr/
	JcctiXGLcxL8RImagj5tp0l3iA==
X-Google-Smtp-Source: AGHT+IFs51FthL1Nr91swtXQkkGdZ40yp7FNgHHvmg/tGaEZe1O3ayiAy2cT5rDzRcynaO2ozABYHg==
X-Received: by 2002:a05:600c:18a3:b0:40c:2548:2e29 with SMTP id x35-20020a05600c18a300b0040c25482e29mr2796189wmp.334.1702551178958;
        Thu, 14 Dec 2023 02:52:58 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm17614854wmo.22.2023.12.14.02.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:52:58 -0800 (PST)
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
Subject: [PATCH 08/13] arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
Date: Thu, 14 Dec 2023 10:52:38 +0000
Message-ID: <20231214105243.3707730-9-tudor.ambarus@linaro.org>
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

Enable the cmu-peric0 clock controller. It feeds USI and I3c.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9747cb3fa03a..d0b0ad70c6ba 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -339,6 +339,18 @@ ppi_cluster2: interrupt-partition-2 {
 			};
 		};
 
+		cmu_peric0: clock-controller@10800000 {
+			compatible = "google,gs101-cmu-peric0";
+			reg = <0x10800000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
+			clock-names = "oscclk",
+				      "dout_cmu_peric0_bus",
+				      "dout_cmu_peric0_ip";
+		};
+
 		sysreg_peric0: syscon@10820000 {
 			compatible = "google,gs101-peric0-sysreg", "syscon";
 			reg = <0x10820000 0x10000>;
-- 
2.43.0.472.g3155946c3a-goog


