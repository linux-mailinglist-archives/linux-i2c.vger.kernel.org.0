Return-Path: <linux-i2c+bounces-1237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D4782869E
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 14:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4864CB24984
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jan 2024 13:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FA23A8E0;
	Tue,  9 Jan 2024 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ambpe2Bt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689C33A269
	for <linux-i2c@vger.kernel.org>; Tue,  9 Jan 2024 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-336788cb261so2624041f8f.3
        for <linux-i2c@vger.kernel.org>; Tue, 09 Jan 2024 04:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704805122; x=1705409922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzoEE5PLx3WRPb0R+UBAoAAnvkztgFUqzYVVDoII6wM=;
        b=ambpe2Bt1HFcLigmRNc/avgV5KYS7g/LeDr+WXepIudCRCjrhJw3vDt9oztGVoQx+U
         0w69EeEAebcBNxU2SEs7qtlcYtHNZADSEreHnefGRml1xSMo+oqw63SJ50j7dXneJNpr
         78WY/mt/ICJvxmTBOCgJRXoKjN8Bg4fufr1zq4W9Ru7IQKI1hPXOudA/WiIjpGkQM4Xw
         RlfjfsdDDm5y81YocdxY3LWAaGaXlfgT51z+2RvSZkoEGAHPk7IPBl/DCvDPF3924zTF
         Waf7rkhvG60tdl9dzAw1MwaZg9EGLbvX9PMWnjcFq8M0bEpdENFnpOA3IFJC6+YqSc6x
         3oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805122; x=1705409922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzoEE5PLx3WRPb0R+UBAoAAnvkztgFUqzYVVDoII6wM=;
        b=sMEUHSX9kU+hEZljioXrMu+mclf4GLopOubfFn+VS9ILQDPp2DRFhFdagSWP7DPr4v
         jIjg5Wop17HCHXBbXmTafLzV/GtpsQIJHxO+y9ap4ddj8QRijugm/22P5+nIWFs2zAiP
         q2p4xjA2OyKfLEk/Da2QOajDYeA+3LBeDQ4aAs5RLbmxh6ZvrTV7DYw56MZBPYGgxG5l
         46+WRlXG+mU/ipHGpZ2fApbSVuBA3V7kU7t8ci7IbvyCllfWcC6W2NC5hWNhLTOVaCc+
         /GVcEOUKxl4qHZ/rMy9Hlklnz9znECqLi+l0pQl/hQCR+psXxHHliLkgh5uU/W2tfAt9
         DLSw==
X-Gm-Message-State: AOJu0YwQQIy+rSCHm1IztD7pihugn10hDFrXx30Ky5H+x0udij4J9nsP
	sDrkNzNOUnhZJa3V1rywXmQr8FC6ji9Geg==
X-Google-Smtp-Source: AGHT+IHnzxsCCm/HNg2HHqErus8BQHdl5sV5n8eEODKKGDLsEgoRlPc0eelp+pMKNq5BCbvjmbiXtg==
X-Received: by 2002:adf:e941:0:b0:337:3f72:3de1 with SMTP id m1-20020adfe941000000b003373f723de1mr555630wrn.37.1704805121855;
        Tue, 09 Jan 2024 04:58:41 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id cw16-20020a056000091000b0033753a61e96sm2351302wrb.108.2024.01.09.04.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:58:40 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v3 09/12] arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
Date: Tue,  9 Jan 2024 12:58:11 +0000
Message-ID: <20240109125814.3691033-10-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the cmu-peric0 clock controller. It feeds USI and I3c.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3:
- comply with the renamed cmu_peric0 clock names, "bus" and "ip"
- collect Peter's R-b tag
v2: collect Sam's R-b tag

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 4e5f4c748906..2d1344a202a9 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -339,6 +339,16 @@ ppi_cluster2: interrupt-partition-2 {
 			};
 		};
 
+		cmu_peric0: clock-controller@10800000 {
+			compatible = "google,gs101-cmu-peric0";
+			reg = <0x10800000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
+			clock-names = "oscclk", "bus", "ip";
+		};
+
 		sysreg_peric0: syscon@10820000 {
 			compatible = "google,gs101-peric0-sysreg", "syscon";
 			reg = <0x10820000 0x10000>;
-- 
2.43.0.472.g3155946c3a-goog


