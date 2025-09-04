Return-Path: <linux-i2c+bounces-12655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335CB44330
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23AB21CC3867
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C49B9311C33;
	Thu,  4 Sep 2025 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPrOq2X3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4E3126B5
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003988; cv=none; b=d0R22g5AvS9Q1vyuS8+7kIQxg+3D0RGW/O/mBGMYj64PH9fghI7BOPHKPmD+advXRPWscKa3rHeyKngz7BUu7/KN+kScGXpxi/b2Lav+j5E+5C4zkea1nSxDpsGb9dIWQkluq4t6/8A6tDt8EPCEmAmKEen+RoWAg5K9lHv/kBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003988; c=relaxed/simple;
	bh=HhL7R2sKeXiIqlZtecSPlVNqig495+ove8KywGSPyYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzoB50/0OwznJH313/iV18RYRz8d8tgsQMi7lKnKg+OzHnQuqRJGcqoWxnRK7bPBYD2i0r8NOb53Pkv43w5YfGSeTWxZGVJ4H/JUaJH3aoN/lXoIAjNJ8eb+rpb57MB6q28r2ZdXL6kpT4juiC3ynMVFf/lx5kQ/tZKyhbW+HGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPrOq2X3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X9v0002359
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKDDTZaIKoToqk8fUCVl9/PoEAVOsBabIY9X0ZzII60=; b=dPrOq2X30vuUjcqA
	qdDU5SBWGN61IJcp1GcTxGrJrHDKbP6MOFgss63MYZeZ8rrALkf/KhDPmwKE+3Yh
	AtPm1SlOx5XQhnSm30J60csq8lbT5MLJrfC4R3GuZHxqPD4k46HRuyD2zRhjT/Bg
	hfg089DB7yhUoBn4Y01T0SqPe6gsanl21ZNXCYqsq+1/QWa8UH0/biBhFqKEEIgM
	ClWfKbAQzX6scc0A+49oUPLSQH0iy8BM4lSQpQsGDgs2POXije92ocGphCeoPnfm
	vXz6UPwEkj38w2BYnKbxzluW1x5kFUy0yH9vrcEESWn451gi3D2vrwXU0v+KfRwG
	OvvCVw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush382pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:39:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3234811cab3so1426763a91.3
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003985; x=1757608785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKDDTZaIKoToqk8fUCVl9/PoEAVOsBabIY9X0ZzII60=;
        b=Cs8xKjn6VByIlAL+uF//rOMPMnlkT+WAsGNcFd8/eeLznxCWSAidicZfWSpb1zus/s
         0QUAi8TB8LNpFgnlBpClO/zq9z+VJooCKbA0LeFjNEAjnsbo+I+Za79WgSisJXiwErtF
         Msa9Veq1Und+IHssU6GDY8E9fC2Vp7mk8IVcwYq64yl3EkLBkl4/YidSjkekwfXmMRPG
         /Wf001nI1BgQAQYLyxJsiXYBuo6VEHG1tp3MnAznxZuwIMU6tAaEgNjFMCHuH45vu8rH
         YW2GAEkI7SvZ47h374a1eq2hjVRArjsimXwU4rJF05qUpKml+n5ReowY3+q7i/IUSeQm
         aPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCXeW6yJwq+K1sICmIjNiuH0EogsMfCpRbwIAIxq8lMaHJdDrSwHbEGe48CNjpd9Xl/qKnJptHUTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzd0U1QaizJb94ewWE8Wq13epdGKvL9w/fGqOWx0rlIXuBEOrf
	sMVpuAX7352puGUaGzLmzZUVRJu5f7La4H1+2HE7myi/olTHVX9CdoJm+vU7rIUDEvi6TMwH26v
	XTU7TEkddGBwFOmEgCtP5AnREUBvrRiEKfMwk5z8X7wJsS2gEE48FBAAvsLpJUTeEPQZcR1U=
X-Gm-Gg: ASbGncujDAQyTjvoFDbm8izcTwrlZrme4JgOK5rMmPnGuMNLu5qm+lKGPyYz+X0bZHZ
	UIp4OffgnXMI09hj07D3k0vfcZQcexPhqSK25IZtEUJGn3Vjixs4K0ab6hwRC2mUKWp2Nmi1cUz
	i9F3p5cHe89BNILSt0jll98HyAo6DvxIGGInefjG2koku5tL56tk+HH+G27o8LNo5lm69hymho5
	wwAccnAJ7YAo8fvnjD4XUfOFB/iIjYVmbs7YUlfDyIyIm1I+T+BvN5nbZhLAYdkqmw9dR/tkwu6
	FZqtbjHpUBTZSDrzHgoYrt3AnSizuuDBV0hztLnFlAaSpbBqpTWnOw0J5kc7+Ab+mE/B
X-Received: by 2002:a17:90b:3c91:b0:32b:6223:259 with SMTP id 98e67ed59e1d1-32b62230456mr7502199a91.13.1757003985499;
        Thu, 04 Sep 2025 09:39:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcJGB1HfigKhlcseZuGD2dtBOZEFUdCtR1Qdkw0I+kOZzDpeSQstZ3kbfO4q41mt5kED78NA==
X-Received: by 2002:a17:90b:3c91:b0:32b:6223:259 with SMTP id 98e67ed59e1d1-32b62230456mr7502162a91.13.1757003985074;
        Thu, 04 Sep 2025 09:39:45 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:44 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:01 +0530
Subject: [PATCH v3 05/14] dt-bindings: eeprom: at24: Add compatible for
 Giantec GT24C256C
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=724;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=HhL7R2sKeXiIqlZtecSPlVNqig495+ove8KywGSPyYM=;
 b=bgkk/VscrfaA2/hD0MOxPzz3j6BO3GCVxc+5R4gTrIIsO0E6coSAdgcyTz97r1uWzih4pZ74O
 0uVXMCw3Y02AEkF2PrgKKFK5vv/0lgO26zSG7N4OT1QRJWv4W77TVKT
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX++Um0H9i7Jrg
 VP0Pv/JLdMXTwR5SzmWXZvKorj8nQlCGlRc/OfPanQAljBb/VXkztZOLs7aQeNS2G/O8WoBpkVZ
 Y+dBnycJ0idW17LhRH9xFDx2vkrEuBJeUA3nL1nTEvC+tFv1YQ6AXwaN233Eqyszihz0R42RZS4
 pIJQyaCFNEJe9GN4YdfgpsHENz8P4Gyco9xeaP2lTIcoeabt8Najrk6GU9WRN1+QuU7RksifrqV
 Zo0bOonlKF5iTAbH/6KX90EXNWUGzHrkPcueVbs66GyJ8g4+aVi03cAmZAvO4RmCBT8r1NQpXhj
 9zvOuH7fijjUdSe90+30HQdXIgb+TZUudZz80RI209pnDeuMFEpct3VtE0knOebI25uUjqKyztG
 XPX5t900
X-Proofpoint-ORIG-GUID: xHPVe9qit41SLs8VhSQBm54UKpIlpzIJ
X-Proofpoint-GUID: xHPVe9qit41SLs8VhSQBm54UKpIlpzIJ
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b9c0d2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Yg4z3stHfqcsaZAJ4NoA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032

Add the compatible for 256Kb EEPROM from Giantec.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 0ac68646c077..50af7ccf6e21 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -143,6 +143,7 @@ properties:
           - const: atmel,24c128
       - items:
           - enum:
+              - giantec,gt24c256c
               - puya,p24c256c
           - const: atmel,24c256
       - items:

-- 
2.51.0


