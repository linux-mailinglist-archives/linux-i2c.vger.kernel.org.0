Return-Path: <linux-i2c+bounces-11564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF7AE616A
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 11:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5CD916F050
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 09:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E037B28642F;
	Tue, 24 Jun 2025 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9DI2SKQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E283C28137A;
	Tue, 24 Jun 2025 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758681; cv=none; b=aCO7UApJ+S+elreTBG8zWpoNsXdpL4JgbMwUNCi+wY0tGUGOIUGT36jXJ4yI4YJuwLAAHnYIVnWElgmJrU2gjflHtSSahMSUDppP6wBDsL3TBQQkJomX31Fc+stxdYfzeMGPDGR10ujVsb4/GL7w7NNSlNcktNnJXGBwk0hOGpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758681; c=relaxed/simple;
	bh=nmzf9813SKsBoWGeQPO+qvNCVHdpSTFMRavfmAxC0Sg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gbZzfvv8tH0FxOvGfyAUW9jmQiCjDtEKWd//sr5qVPTggc5c9KH20ifQqpQ3BL3QT5Uc3UAJtmAuuQiTMR3tpKm/8uhgYnI9x5hPLRxIhjhQUsP6EShXCuScjZ+9w/RbxQnPvVKEEgcR2DPrLtrKOzxB2FENKYNOzIdQaYUOv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9DI2SKQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O7KXwe026798;
	Tue, 24 Jun 2025 09:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dhNfP5uQ0OZ
	cm8KjOOAh0vpLVPaOEN5AMu3WfIxWi08=; b=L9DI2SKQY7WKfO/G/RmyM3CRpBU
	kjMcOI32bOapr0mnCZtNvT9GzA1A5VMgTmN/+Ozt3Kmjqgs9tyt2//Sb+VrRID8v
	Mox3VK7MNiU1x5PVfHxkHm7aHBxIBiUf3pJJBvixKTcQcfuBJa74xvmz3Uu+q6Yj
	HYTAgaCg4e+7/BJ/m+LShfdaxNshdmBJQfmJmhct3794qo+tDskacjh+ogK7KbT+
	MZCeEtbU+80caSkG530GDVdjxpeEeZwE9RScxahYm2ar2qVmkeeiw1uEpsNSDpHp
	mKshNb2anKj9/9w8wuosF2P8/daB1fXhjEgrwDo64CWbP0cOL9K2KGdKf5w==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqj36b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:10 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55O9lm1R021303;
	Tue, 24 Jun 2025 09:51:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntktdsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:07 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55O9lNo6021166;
	Tue, 24 Jun 2025 09:51:07 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55O9p7fv024167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:07 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id C1EBD56E; Tue, 24 Jun 2025 15:21:06 +0530 (+0530)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/5] dt-bindings: qcom: se-common: Add QUP Peripheral-specific properties for I2C, SPI, and SERIAL bus
Date: Tue, 24 Jun 2025 15:20:58 +0530
Message-Id: <20250624095102.1587580-2-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j24p89NU9LI_YLio1hoAb7bobLwXR3RS
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a750e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=M1Du_JTgEIh7wHf307cA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: j24p89NU9LI_YLio1hoAb7bobLwXR3RS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4MyBTYWx0ZWRfXzXt8dH8wd/5u
 Aya6ZiSLx0GpFkdobrTFg7ASdxkcyP5GAKN1G8WEmIEwzvLI91AIA9keMt9ykS22FyFIN5C0rpC
 2O/fGQDh/ldysCeNV6WIxad9VcUHr/SRcee0FWan/1k2utDdK0wpinwOtqXWwIgdPWNf4ywpIp4
 qDmM4Zel2RynetUly7LMQ6fFy0kuUGb/GNs7x5St/YfMNn6dxIS4Sh3DtFwj+xaWJKu/aeditgl
 vhQlU6ignFg79gM1cVxZIZtc8DvPgmDchGvX4901BG6J2D+Hivb1jMVfDFTbBLJN9OZ80zWZzI8
 y6CXqtjsuyYN/FnGl9xIDVszFRPNwpe8zUivu0+rdgSehW1BH8EkxxWXSWZbyR/dZYBiBe/yZP+
 HKn/YDX2Y4+YOYUyj2SX+DSK2xBwC15eYI+LnI+J0U1ickuTeBvqER8AbZgY9DpJ5pUmM65W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240083

Introduce a new YAML schema for QUP-supported peripherals. Define common
properties used across QUP-supported peripherals.

Add property `qcom,enable-gsi-dma` to configure the Serial Engine (SE) for
QCOM GPI DMA mode.

Reference the common schema YAML in the GENI I2C, SPI, and SERIAL YAML
files.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v4 -> v5:

- Add Reviewed-by tag.
- Update the email domain from 'quic' to 'oss'.

v4 Link: https://lore.kernel.org/all/20250503111029.3583807-2-quic_vdadhani@quicinc.com/

v3 -> v4:

- Update qcom,gsi-dma-allowed property name to qcom,enable-gsi-dma.
- Remove full stop form title.
- Add reference of common schema YAML in the I2C, SPI, and SERIAL YAML files.

v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-3-quic_vdadhani@quicinc.com/
---
---
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  1 +
 .../serial/qcom,serial-geni-qcom.yaml         |  1 +
 .../soc/qcom/qcom,se-common-props.yaml        | 26 +++++++++++++++++++
 .../bindings/spi/qcom,spi-geni-qcom.yaml      |  1 +
 4 files changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index 9f66a3bb1f80..51534953a69c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -75,6 +75,7 @@ required:
 
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
+  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
index dd33794b3534..ed7b3909d87d 100644
--- a/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,serial-geni-qcom.yaml
@@ -12,6 +12,7 @@ maintainers:
 
 allOf:
   - $ref: /schemas/serial/serial.yaml#
+  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml
new file mode 100644
index 000000000000..6a34f05a07e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,se-common-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QUP Peripheral-specific properties for I2C, SPI and SERIAL bus
+
+description:
+  The Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) is
+  a programmable module that supports a wide range of serial interfaces
+  such as UART, SPI, I2C, I3C, etc. This defines the common properties used
+  across QUP-supported peripherals.
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+
+properties:
+  qcom,enable-gsi-dma:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Configure the Serial Engine (SE) to transfer data in QCOM GPI DMA mode.
+      By default, FIFO mode (PIO/CPU DMA) will be selected.
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index 2e20ca313ec1..d12c5a060ed0 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -25,6 +25,7 @@ description:
 
 allOf:
   - $ref: /schemas/spi/spi-controller.yaml#
+  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
 
 properties:
   compatible:
-- 
2.34.1


