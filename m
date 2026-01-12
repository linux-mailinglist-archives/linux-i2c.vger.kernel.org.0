Return-Path: <linux-i2c+bounces-15041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5021D120CA
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 11:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5ADF30B8FEB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA48634C137;
	Mon, 12 Jan 2026 10:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRnwlfqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXXtvE3z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB3634B664
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214906; cv=none; b=ZRPCz3ODzTJ4ElnZFxZHyDTN7Uq5gWjIo90IK3E7IPwgYmUJX4lMMyn27iSgb+Lx5hROw9oJHmm7XOxBnuICzT7xlR6ZXXwNsE+FOoYvp5ZJp4aJyxnMCFAYyTs6im1nbxygOAGAZFGTLZnRbJBitfdz9ynQvymydYeiT6H/EO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214906; c=relaxed/simple;
	bh=fLcHXdKV5/hDu2wr6i98ZasPwufFwNkdfF36wyuIx94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KaQt4zDJ87xVCrPWdslEWTtz9H60C2acABR9jVb/+dG3YqzAlqyF6IC06fwnoYboIoGsPt+x44cGgdjhAEmqbYp1uW6wZSMUmIuXB7+SPtdi0PBEeSOxJ2h5m8EmF6ya/593SV27C697DTey7gLiMTySGbxTnZ74dG7gFPBCZNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRnwlfqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXXtvE3z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8aIts113636
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cbpTgWXazdO
	AfAdL49uExcjxZu696DCuIHbDLPHFMMY=; b=WRnwlfqasDUl0BLuMVm86b2XjPM
	6kaRplcT105sFvfBokd0frHN5PrW/gmMukvVg8EFsXXAeOZpleYtC/y7R9MYBWYZ
	q7/HAZKAnDHGCtdcJrwsi0tit36M7yHwcKzoQjZPARpKvR29KOaep9Y6jN8l9wuA
	YgD1Tu9VRj6/Own1Ay2GVU7UR4ZB9+6yH6zXha72GABBQu7G+g25E/ofkZUMMWA5
	YiwBf5Dlq/dDQ4Uu894P7Uay2RAHw0Z21pTIBZKn+SeWhem0timiT5v+8j2y3281
	1n1yUa8rhypge0JBRyLZXE9G50tOCBjfObovfCrvNGCo+XBEZnMU4fdZ4YQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhe71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:48:19 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f42368322so1192134b3a.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 02:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214899; x=1768819699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbpTgWXazdOAfAdL49uExcjxZu696DCuIHbDLPHFMMY=;
        b=ZXXtvE3zrS6Kg7UwhSnP2ksq8NANei+4UCEKTSRmZ51yZFcqNsYh5YUENbTBhBdUpx
         XEdPEhb+667o2LQUg/b9Z1SWgbTa+Opr7Pkg492vmqOsAowdA2qpyaqAL0FgMuz6fPEz
         0WDrICKfF+siEJr+55aJ/beBdmvnd9hWo8ngx4R6pJj6Hq5YZTNcQ/IXhX3wP44zhptq
         ClWm9vwlTl/1IYSEz/8mc4806GnAV2nuCWUXM3hKOpRh5KtZ0Qs/F68/iLiLiWXiWRk8
         oWt5U6c5sglqK3ssPQd/wnRgU0G+kp9v6U4rB0jNb6XbMm/zrriIeuAYXWlS7VxfUtCU
         2wzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214899; x=1768819699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cbpTgWXazdOAfAdL49uExcjxZu696DCuIHbDLPHFMMY=;
        b=wXHqJM44g3JdSRyMRR/JZJpjD41ZdRTMukq8WbbU/ViBMwDo8htQc2mGcch5gwdRjl
         MFsjOjjSKN4G6G3m2rTZhkYyYKkpkNaNpk5qN9i7QWZfq5TE4uJQI+7JN9QQBeUDj2ta
         Rdd4N/Q/DGLWtSyHn3zyJv9IHWOkXCFxe4zsE1lIIZQIKSu0i2Kiui/O1a2KJq3iV7om
         712wMvx8AlJff2OsZjHLWLGVVIS0x4R8PZlVY+fJdKfKvOgdhHfeTSLFSxS+cdlSus0C
         WWn7Jy7g6250CSlW8XeQ/fJYgjRhj+/Vc4FReEc03eSlZ4LynxkLqDFefbDqa08IbAUG
         sD3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV39h1n87O+D2lutI+TzsP2GtlsbWPnvcif/kKf5DxbsZntVfZvlXvyE7ipvRhNAwyt+ARPFMm2/xQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTAjsX2XDBMEEYqnmdrI0CFVm0h1X78l8y0RwRcIPaBJ7oAmaO
	TazuJYxlYhytZ/e5AL72PhCYjfEIIRvzqJRs5O2Rbs1ncuvwLKxjb+JTCB3Hzu6vJcmoh5vvblA
	tdMlQ92OymxHvnu0wPYJeQ2uJxGVAB/9oZ0k0Q+tgRsZcj5wJLtuAwnl3LGc8P7M=
X-Gm-Gg: AY/fxX4BkP5e3LxxCCDHYf/82MslWOKjylUZ4bCEIMTT/d8X9zfyUUyATLdpm3rCaEb
	yDjLdWjIk0QqmKyqGW9Uxd1IX2nWoaVtC0aX7odALJBrt8q3fpMnOU67lhmq9JKahRrQY5J+Jpa
	MhNeTOmZzx2TlvVu1vbVKhL2hXl6TnjObwKBoD301YWlTPp6d+2boeWy5BadVsKn3G6NFhahhh2
	ZrbjgU5+6l2DJVU7rNvFl/0bOqqMKAUQiJ/JGa/3I7wxHwu+epJiJ0LynnLs5T82plmcV8kTupP
	66eligVkI5tfQ4ql0p0p1i/PiZ+4jm+6IdBiHGqoxzy57GlVf4wHUMm7fCVyAJ5DN8fGB3P/UPV
	JeXqt+0uSJJiAElccNoxa49eyiKHznV569PwzFVIU5cQ=
X-Received: by 2002:a05:6a00:1d8e:b0:81f:45a9:1a58 with SMTP id d2e1a72fcca58-81f45a91edbmr4163615b3a.23.1768214898963;
        Mon, 12 Jan 2026 02:48:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJ3W1mhtnP81TT7rA8CaAxZF5ThR6whPQLnhdPJ6U4K+wELKglf5ayQHvoRKYCyXBHXXqZbA==
X-Received: by 2002:a05:6a00:1d8e:b0:81f:45a9:1a58 with SMTP id d2e1a72fcca58-81f45a91edbmr4163585b3a.23.1768214898405;
        Mon, 12 Jan 2026 02:48:18 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:18 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH v3 07/12] dt-bindings: i2c: Describe SA8255p
Date: Mon, 12 Jan 2026 16:17:17 +0530
Message-Id: <20260112104722.591521-8-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfXyVUb83asyun5
 IWaw5bhqaQRaHDxKgQTyJKCPa6AyPn+V5vpdBNfDpB7j+nYWeCviVZAPCAuRJBcANEA2dJfDrq6
 0zeKJPsI080afguuk/l48INN920aQnLxLw4tOdI+QdhNho4T/dIgrr/q0nSkErWS41+nYfoE7N1
 uXM+5Pu7BloAKyWUkP6zDFCA+EGyr0H6LBnuukLHIZp/QSukWfDE3slKiz+EYtoQH7CRx9P+3NB
 sqBajRFWIxcSRPZQtVRtDPfEDv7X/Dhx0o6ejhu4TWCrz+KIcFsKNKNdJrBh62FpiGBEpdyO1Lc
 xRqOLq1R8jjqRq0ic/N/nr48onMGn9C/TpPSeXYSTnoFcab6oNAxk5VeIrtcd3zqzhKYahxLyom
 /N7xr30C1V1FmtaoDwV+A16RL/PUSj1hE1hDgIm6Txr9oZJoUeMkjjOtIWgOCDrw8YR2UpJ1nj6
 wWlIs8hS55yaSB7d/og==
X-Proofpoint-ORIG-GUID: M9EyIXbg8eC2j06KodDDc50PL4jXTUof
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964d173 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=apMzWF-kzHp83YoYYzAA:9
 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: M9EyIXbg8eC2j06KodDDc50PL4jXTUof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

Add DT bindings for the QUP GENI I2C controller on sa8255p platforms.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocol
are utilized to request resource configurations.

SA8255p platform does not require the Serial Engine (SE) common properties
as the SE firmware is loaded and managed by the TrustZone (TZ) secure
environment.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Added Reviewed-by tag

v1->v2:
Krzysztof:
- Added dma properties in example node
- Removed minItems from power-domains property
- Added in commit text about common property
---
 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
new file mode 100644
index 000000000000..a61e40b5cbc1
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255p QUP GENI I2C Controller
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-i2c
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+
+    i2c@a90000 {
+        compatible = "qcom,sa8255p-geni-i2c";
+        reg = <0xa90000 0x4000>;
+        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+               <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+        dma-names = "tx", "rx";
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };
+...
-- 
2.34.1


