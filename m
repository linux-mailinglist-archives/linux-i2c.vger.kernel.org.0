Return-Path: <linux-i2c+bounces-508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 441C17FB6F6
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 11:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8453B21878
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 10:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED754D5B8;
	Tue, 28 Nov 2023 10:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernkonzept.com header.i=@kernkonzept.com header.b="YiMizUZj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58152E1
	for <linux-i2c@vger.kernel.org>; Tue, 28 Nov 2023 02:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kernkonzept.com; s=mx1; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description;
	bh=OiK1HHbIXuMrAQ5QDzllvRpmyyLDkj2IJBFpzigf0F8=; b=YiMizUZjDfol4zngmd/CaqLY6e
	V4MuDVK7b2vYS1CU+49F7YIFkbuklqZpFsmSWURnZdt/xpgwlnKN2iHei1T5B2B3c7O9OoW51ZFPv
	HpHEEjgw+7pXvL4sunAwcbXjN4VgZCoG4scBaigslD7iHQatNsd2Zv7B2y69Wx7SiO61cqXgn1QcY
	KXrLF3umCaDNISI9B3aWU2JdiXjRrYqunZBw0MLFefXswK1VyY8kgMCPiTM5x5GEcurHu4+iFjvVa
	bb2ULa8PJZic4HrQznL0lTn6m395r7rqFl+HKSt63gPZhyrzVZP5MlW9+JCgF4k23MaZTUESq6WPV
	PTQhsO2A==;
Received: from [10.22.3.24] (helo=serv1.dd1.int.kernkonzept.com)
	by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.96)
	id 1r7uhu-008Pi6-1q;
	Tue, 28 Nov 2023 10:48:42 +0100
From: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Date: Tue, 28 Nov 2023 10:48:36 +0100
Subject: [PATCH 2/3] dt-bindings: i2c: qup: Document interconnects
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-i2c-qup-dvfs-v1-2-59a0e3039111@kernkonzept.com>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
In-Reply-To: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stephan Gerhold <stephan.gerhold@kernkonzept.com>
X-Mailer: b4 0.12.4

When the I2C QUP controller is used together with a DMA engine it needs
to vote for the interconnect path to the DRAM. Otherwise it may be
unable to access the memory quickly enough.

Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
index fc3077a7af0d..758d8f6321e1 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-qup.yaml
@@ -40,6 +40,9 @@ properties:
       - const: tx
       - const: rx
 
+  interconnects:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
@@ -73,6 +76,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+    #include <dt-bindings/interconnect/qcom,msm8996.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
@@ -91,6 +95,7 @@ examples:
         pinctrl-1 = <&blsp1_i2c1_sleep>;
         power-domains = <&rpmpd MSM8909_VDDCX>;
         required-opps = <&rpmpd_opp_svs_krait>;
+        interconnects = <&pnoc MASTER_BLSP_1 &bimc SLAVE_EBI_CH0>;
         clock-frequency = <400000>;
 
         #address-cells = <1>;

-- 
2.39.2


