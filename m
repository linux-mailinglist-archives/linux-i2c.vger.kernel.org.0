Return-Path: <linux-i2c+bounces-12371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C55B31054
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 09:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF3A65C8745
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 07:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072632E88B3;
	Fri, 22 Aug 2025 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrxRkAjY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8DA2E9EB9
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847631; cv=none; b=p0OwWKHsN3RZ0HTO95A7ZO4yQQhbcfwe6aJDFh/E9g6NNSJBjHPjuK9enEctESMBUBqlOu5jcCPBc4k9OwClxKjsoVyRxtfozQMHv0o45kRZltuLJM4PlVAIwssLdxQgpwZV9R2eQFMK1T54Fq+nTYDwLdu4yL++SjPmxoqT9tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847631; c=relaxed/simple;
	bh=CLvam64GpjkvK9z9EBex7fnXV+Xe1Yh5pbFJp8bR21M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DNAhoWTwHoCekAIvr9y1gS8F0MwnrY9dMaBU/0febwrQm/Q89oieV94KCmEoQUz7v7D6N2VKQ4CmNhqtAdAc9OxkwGWo9G//1NnUIZzieruwpyJh0E+IedngzpJ6SgNyBY1h1XGnALhYhOUyFXFTlTnHy0fkFOQYJ6Jod2UDCdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrxRkAjY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uT9w021005
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CgYC/weqOyG
	d9M8cE9Fo8jaIsPKmSKrevJQt6OIFqZ8=; b=VrxRkAjYRFYtY1uJpVxGFOCV4i3
	Nf6fA4M3nksP5zGbPWmdbOLJ2Kj0EpKReni8pCtQCVnvyKxOj0OwBf3Paqw/6ovm
	XykPBouT9fRPG6nMwYgxFWdP9UhngEyVN/A6jbX7ltVZlruMGpLl+qlhi4rm5RZg
	U7/EYU9qmTPCSi0RNsRMD+Vh7ECVd5KcbfQjmS15uNW07d7SyBHLJQ0hg5LXHpRK
	AmlVSDjMGcv7vJ1CR7TqZHFYVv8DDoaP6A6Bb2Gbefyg5JxDRpu45bIYOVrXdSqG
	9Bv9Y950SzIhVuMf1ZEA/Ttc7emwUnmaWtyWYEBgfP7hhRDqmw61nwhg/Kw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ag9d3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-325228e9bedso921897a91.1
        for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 00:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847628; x=1756452428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgYC/weqOyGd9M8cE9Fo8jaIsPKmSKrevJQt6OIFqZ8=;
        b=iuhxMK/ySaZfAerl8PuTNXDbfvXoyCu7Y3x8flW6CDatfTyr/znKatNdn+a0IJBQ0N
         p1IpCb9AMq97odqtAyy/g3+gUjfXzuWSzW+xU2j5tFeGiyprsXXhZ8NlMbSqFSHOX27c
         f28lpmPy6HDBccFtoGqT05q4F137iZI5vEAtsyJmp3RNo4yva8ZBzD8a/TSNg4cNhWfk
         lY+TxUkCQj/gpLUAlMhjt7EJVTjf8Gn2DMyF1uQrIhNaypSpcjJVOgDqseLlNjr1Ln2o
         7etjJq15PRzmzXIImqxXaM1jBotyvN5MlEckIxS9WZ5qV4tAH340AaoPfBBIutTp/7MA
         gBiw==
X-Forwarded-Encrypted: i=1; AJvYcCUW+SbMwWOCUdIuI8kQUOWW7x4S6h/uPYwGU1/ZeH+GYa6+5/M0uk2Mgtrih8MNwzxphGbG5KksD5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQVEnWv/hP9SnOYs83yzzr9pmXElCjLTm5VtqtAfXWgV0rilHc
	Rm0F+YwOK9IAKP0E5CiUift0Ysri2ga75b3ag80BMB+mUtOOsPT0f/VD5Y/ohwxbGSkHW67caWo
	gLvmrxfU1mRo4udgNIskF3qT5tt4ZRT0f/ngQFX11Cto/nPsRvat71nlP7R5g5wA=
X-Gm-Gg: ASbGncvePhomaIuW4N69njt8A2PRFR7lRY3aRIJnW/bfbssdUUJn1ZFxN9gl7iyv/Zh
	A+Xi/tmv9GJoAtieW8naweFNS8sbaqzxKulE6E8xjxXRiPs0gO/IO/ni6XRInNrLMyUEJnJ318S
	FRNYqvlapCgoxHqqOQG8fJj7DR1wp9lHLr9Xn3yisMJVvKwC1Um5+Bv2r5PDIvteyIFIEqvhEV2
	Cc6PXn4JKEVfDoz9QZuMxe6/i9B8+Fkr+9qqHWw4j3nws+4Fc3Ww4gdnaMsr55xaE0MDfbjcqSg
	xrN5P5QMRWhnESarqMO5XfKcEC7FzDlzHYFNiFKk4Y2V/BCV75/Dyav4kjVGEKWVehmdnfo0GH/
	n
X-Received: by 2002:a17:90b:3b8d:b0:321:c4f9:e5b5 with SMTP id 98e67ed59e1d1-32515eda512mr2721210a91.28.1755847627822;
        Fri, 22 Aug 2025 00:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPXSm6bqwkB+lq/+CeeHKNmwDCs1TpmePhgenu74kzGX2ngcV6qC7lpHpf4+TyFgCMwrYB2w==
X-Received: by 2002:a17:90b:3b8d:b0:321:c4f9:e5b5 with SMTP id 98e67ed59e1d1-32515eda512mr2721181a91.28.1755847627235;
        Fri, 22 Aug 2025 00:27:07 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fe3047sm6416367a12.17.2025.08.22.00.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:27:06 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, broonie@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/6] dt-bindings: qcom: se-common: Add QUP Peripheral-specific properties for I2C, SPI, and SERIAL bus
Date: Fri, 22 Aug 2025 12:56:46 +0530
Message-Id: <20250822072651.510027-2-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6qEfnAtTBQUTh2tDVUL7ERLNsxhNHp4f
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a81bcc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=M1Du_JTgEIh7wHf307cA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6qEfnAtTBQUTh2tDVUL7ERLNsxhNHp4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3qSf1ZETfrXK
 lBnXA2z3HWY+Lm5Z0Rutr6Y+a4bIFU9zWiuKh/RwQNW83LWPdSy4wrwDVwbWBKbHd9kPsJy7gjK
 2LIoF+cVr6nRysP2MltAAgPWoSvVc6FDqAz0Zljxvih+S3dZdr44vNfhh3qWnJbD9Mc83CEthhh
 Gv4eT8zq1zDDyPk/IyYcL0SBzdmMvPtpljlhImR85np0/iMaYhrMB/s0RHlB25TdYKKZQLg2VvF
 SDHnV+t7nYMGOsfCqORK+mt1SKDH4kF60nyPr44XsJJlrmyleQQOoSP01WnH6XQC9Ws75mfiTLk
 06amgn6fyL4T5FtsUDINGJCwMfbHD3BHrnx3geM8Ws/5cXyRxfsXgZTFkrJn1T4MDA0wEaZy2os
 nFiuoimV3w8+zTUwy3utH0i5yVA9aA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

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
v5 -> v6:

- No change.

v5 Link: https://lore.kernel.org/linux-i2c/20250624095102.1587580-2-viken.dadhaniya@oss.qualcomm.com/

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


