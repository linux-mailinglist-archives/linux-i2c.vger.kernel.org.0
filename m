Return-Path: <linux-i2c+bounces-12656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D170B44335
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E24D1679FD
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DB83164AA;
	Thu,  4 Sep 2025 16:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKG6ow57"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D3F2FDC27
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003993; cv=none; b=Unk4jOw2OLsAztfPo9DZ6oCt0CjDzaHwxkaaW/sBX2lYHxVBx3QuYle8OdOmcOellilCB0yQtxNDvfmGnw0CRuHADA73x2rTq+YLmm0+WKLJVAooqNllaEhE7PI3PNAzx5pQ7OceQyNMfZNim3Ywx77nXY4Y4Imawlg5whkZro4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003993; c=relaxed/simple;
	bh=smFcX8ezCgxfaauQ11dA4JFPET3ZGgByEqRN3eXWKdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+b0t0b+uFuNYKTP5J/xbf2cpXFZTEOdvrMFdDPMh1FBa0L2P8qwLg/+T/lFVjA8K2uSCBT8RdLDHxSJT/j1owQ2yOyz4rmTONNcsLb7yMvPROJRuSMmREFg964SOz80AIKEPCh7Ibx+carHVdtmOQh8XU/3HGze8BLFf321s0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKG6ow57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X9n8022989
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbq+DXdSP7cwBiqe8xvfggttCay/BKrNEnQjjAGNbvU=; b=XKG6ow57Au3OTTNb
	fNt5VvZsxQgDbMqrvnLKz1HdO8W7RUsKIU1mqQYe+7DoN3XmOL9NcAOOSvDcwb2j
	aJbQkluaShj25UAK8LaIcfLrqDNte1STSVf7MYWVIlE5TavBKtDgCAySIv130xiE
	iEdUAEpKqZ5zWJ9KmRvlg8F49nNd8GlHR2UK/YfXZ0pEPpdHW95Nv8Cl0+J8YMuH
	BCSr4ZwQ0hOYooHYiV2iIxKiRBzkBX6QO7wf3xvyTSWNZe6DmuIDDWp2MGLDvLFW
	67ldR8J42/K5DPsyMHy5sLgkrIs83ePZ9szy4CadIUOMazs9qHYatmjU9j7++sX5
	nqVL5A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0erau1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:39:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737e673so1451690a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003990; x=1757608790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbq+DXdSP7cwBiqe8xvfggttCay/BKrNEnQjjAGNbvU=;
        b=qBAEw5QQEirIRvQLdCADBmTeRemSIW/uA4dhgEdb+CLS0aVRs+P1xhkaPfvqPP8Y68
         qc+q3IGdGnV5qH2HFAN2zXweJ0ILtiwWcvpVN+AhzPOJmlQkvVw9fWsXPAGFqMWE5M1D
         KuaO5LQRW01o6r/BHUO027a4xEsAkBGfH1uhEg5XmjV27uNQkAGVpIa96po7QpJTTjBR
         qJJwM99ZOp2z9eQk5LM6QvfUrsEkemoFeuOg0bYzE5SfPN+N9rmWz1DlsCdNmXVlqwlG
         2X8Eh0S+gmPXKepGbabTFlpDOb1FP6MPvQKP+3ZnsZhTvKwSXnRpvy96Sgie0TnfATyO
         oJAw==
X-Forwarded-Encrypted: i=1; AJvYcCVhCg7tkhora3QBmQSkZIkzmJbpVpo17fHfrDJrJ9SRjJAvDtwIlCb4sSsPAkgKUub8EvpQLWGAuS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrkogEDfpIDK0cDqYu+WXkxIFBLOZ23/86iyKetBN8vP794hVZ
	h51kvck1ewtPEOJhe1fUAjf3kx5Z9bL5b9EjvvjLDZWjRLE4m6gudm4BAlmfBdOBmebtdHKjYRk
	7B2h+czhH/KW5QZLVfjO1oyjFnLcNcfRwNoC2GZSzRaJopOmwZz5DizlwVWjXCHewbghh5dw=
X-Gm-Gg: ASbGnct5xL+GEbNZS/S/qmfzP1229Yy9kKXXAQmjZADQpVOiQpW719D56OTFTWZf7kY
	7vIz9LGLB1ZRiLzhCmUGUMn1a7H5uahGz7FoskiX3rRzrhLiNOfZb5SFI8T4ghfCGL93EC+gqk+
	deZpt7efPYhQH24KM6VsOz8f0EcAw2N2uMouYPNawSWGTEGkkvSXdagtfSx/9oYYwbN4C8a9bgk
	IpkO/EJROnG2aLjxWU1efoQ+nTz5YXo5jxL1ZXV3hVjkfQq267FUkCYNczb284iq6lfxQX/VJpC
	wzpVVU3jCVyyKk0oGTXvD5d+LdRbdtbku1gJ/B48NFmLpi23FHA0i1h1fF5ThpUmJ0pM
X-Received: by 2002:a05:6a20:918c:b0:243:c9e0:8b06 with SMTP id adf61e73a8af0-243d6dc8090mr27501109637.5.1757003990228;
        Thu, 04 Sep 2025 09:39:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzD1cTEmn46NSwuPKASFsNepjo9nil4ymDu/y3d+JRFqWGfDQaJarZ32y2Y0+rG6IDPPIl4g==
X-Received: by 2002:a05:6a20:918c:b0:243:c9e0:8b06 with SMTP id adf61e73a8af0-243d6dc8090mr27501054637.5.1757003989802;
        Thu, 04 Sep 2025 09:39:49 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:49 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:02 +0530
Subject: [PATCH v3 06/14] arm64: dts: qcom: lemans-evk: Add EEPROM and
 nvmem layout
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-6-8bbaac1f25e8@oss.qualcomm.com>
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
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=1094;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=knYck7yyW6VH/Q+lPTq9YrCWE79eVzE8DYwVhqZMEi4=;
 b=KiUQmzDNRdHpUoNNOOZwRETiT45RXOL7r1Avo9JLIX/1LpA5Sp/Jj+CgPqyqoaxYKbexO/E08
 DO7S+I1Z0LEBfPOruprdSDNbvw4+O9N5yOMAIHLSc7r9qgpqb2rb0sj
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: 7feeFbgp1-wduynZbJmL5smCwGEU8OA-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX2d6Hb0WRLjHk
 6G1I8VV0bRDgt6lek0f/BikHp7v60/XVFdZRUG/Z6LHdkRSjvsPTXjFQf2qfow4fbmYxGwZiLCn
 v3laHRyj3m0VjvHzFuqn8w/L8EygO7oYyvthurygJQxABhSF60Ts/oitD6HWBhumktzzd/JcpWh
 9HFwswV/n54yx+5D926A9BlEtRrYwlB6WbOqAQsVmpjrbnEen0rXbZemcgVKfDsCbrKuPoTU7gk
 h/zjOixS+EVPC22i8lfIDwcwAv5tCGGf9aELlQ92uHYpY7PM3AMres/BGit3WYjaq2MsYQh2kVi
 H6ZUnip997VXF1vFYxiKemyhXr2ury3Sq1MVdV2c7KQS8Uz+kBky+/N6I9mss7lt5UhShqUH25F
 osp6hFGd
X-Proofpoint-ORIG-GUID: 7feeFbgp1-wduynZbJmL5smCwGEU8OA-
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b9c0d7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=cq19zQBcvAJi0RM8MkQA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

From: Monish Chunara <quic_mchunara@quicinc.com>

Integrate the GT24C256C EEPROM via I2C to enable access to
board-specific non-volatile data.

Also, define an nvmem-layout to expose structured regions within the
EEPROM, allowing consumers to retrieve configuration data such as
Ethernet MAC addresses via the nvmem subsystem.

Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c48cb4267b72..30c3e5bead07 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -319,6 +319,18 @@ expander3: gpio@3b {
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
+
+	eeprom@50 {
+		compatible = "giantec,gt24c256c", "atmel,24c256";
+		reg = <0x50>;
+		pagesize = <64>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
 };
 
 &mdss0 {

-- 
2.51.0


