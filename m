Return-Path: <linux-i2c+bounces-12658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C574BB44343
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43C5D17E07B
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97045320CBA;
	Thu,  4 Sep 2025 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQykeKbh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71AB31DDAF
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004003; cv=none; b=DB1vTdTfZBgQmojy0+CUB939uOp2UkO5eiUiNiborFM0UY6zbvj8i3RemCaZZ+Dmwyq3D/eRR8VM2by+f2zMq7NIAtmWAeeR+bP1lt0O1AFO6ccMlvsULKsnmLG0teE5V9dUJfyVwaw9dC+A7Cr6QB9ZUf2/seZXx50LvzSfrFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004003; c=relaxed/simple;
	bh=Z17R4uxUgU+bBwcNXl4EOOFcTTKHC04Ru6ei0RAupaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t7nnzjjxTkWnC3uMiCU5tsVBiPKorY+6AoG3XfSZaPKsNvuqYF0xvCZxowbZklgLLtsGHP1M/6jDOAjAdpHiygr/wAXgpcAKIl5EJ68IyiBoR9J5Xcvou2zVfcCBab21mKjijRPOAFAUfNRGm+iptlcqb39fuLBgHy+ZzGO0zvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQykeKbh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XK3e031993
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykjIJ/h7cv7PVigxcwlijPGxTqDBl4Xmlevg1Vg/7XY=; b=cQykeKbhoL0yn21P
	Y8X/m1b4TwbKZOf7eFDv/XelBpBXiwG7rnOpPr7ecnqd/c/OjGZ2spiz+Ort8Qm7
	3oOqcIPMP23f0RM7EB8F6cy9tnZtocGFKtuyZRJm9E38I7uo2QreUwLcmcwHNcio
	lRqFldMUnMj4J3LHHJyZ70GlVI5hRweA7WkUm8SBfSt/xoB1nNphYCVNZzdRCAFT
	890K9Q6FXcW07BmKd4cJMk56I9VLUKgC+cc+HlzB+kV0KhBA3l9ErhjcWovRLE8D
	WoYecHq5mMPuOLg4LPBhqUHZ1RrNKcNJGWzmGvRZtBvLxEIWxos80ui/4bx8Gz8e
	bvFZ8A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw088q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:40:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7724877cd7cso1387255b3a.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003999; x=1757608799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykjIJ/h7cv7PVigxcwlijPGxTqDBl4Xmlevg1Vg/7XY=;
        b=T2OiBTZ2aHAoh4zqTN4hS0TpbwAKeR52FShOj4QXZey529Ys6i8Nw5xbVFd4dExkng
         XiGsPeq3UrlERcfzhu/LYAELcCufxuFx1jxgHXHZ9k97L83kbex4qXxkAER/Jo26Drl/
         lF21B8kHNP8uqyp/8avGa71kZ8Pyy8ee54RYS01IZjufgxkGTSg7yd5+wPvHr6gCckEq
         1Wgze99JpPPy9zva0R5zXXBzvUBKTerhAwvcFeH1yqGSqLVVpsXiqTspCbA9XAiJy3Bz
         KjaWgdgBBswi2Mc0Gywa8X9LC5vXw3Fq+X1e1TjoRMPg/e6BXAKdOeJV9BvgqLdKsEHO
         pfcg==
X-Forwarded-Encrypted: i=1; AJvYcCWD3KRBJ4VY9S4n2f2ZJpKBFi0/c5ELFTvaB44gcxsDk7o1Cr+qe1QmOryMDbbCNHOU/DBgIvuGeJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL48t9opdP4OTHvH2UKN9Us1iRyoYaZ+w3malIEcJExbk2sto2
	ZdY46ycTc1II94+AjTw5RXltxsxJpT+MbxMDKwaF6dGaOrk+jJkYkfECmILgFRC3lBydpa1O43K
	5mUgcd/IXclZXk3Nu2KgxhiD+yvMq5iVTs/nkfIS/aPolQoKRvaASgiNLsdeM/1gbvYFp5fk=
X-Gm-Gg: ASbGncuuD9xe6RzrEvvZWEFuD0Cd8N7W+m/A3tqaCt+JXIyoehFnfEwxpVXzAIrce8W
	o3KLIMSZF727L83PPp5zpOddCHanHP1LQYpcHHDnbKHILDD0kpcS6YI28zhWspPDcQ0oH7SzVlg
	b+WEkdODczUtwjZhVenj4k/jgkYS0NBRWmjkthPTgtVsA4tHM+hdm5tCkAkRWWO9rtcUBt4JCOj
	ARkwDDFkvMM+AgnnjEvIQuQlINv7WbgwMt2EZQYmZM3hekmBFIVGBKiX/JXjgbpfWuX5st53pfS
	/AxRXz4Svd9PmVHpaZE0WnkxYvsIn802yXSEFWpBgvl+Pm+yhVfXNhEDNBS8zvspBtGE
X-Received: by 2002:a05:6a20:38a0:b0:245:fbee:52e2 with SMTP id adf61e73a8af0-245fbee5703mr12170838637.36.1757003999308;
        Thu, 04 Sep 2025 09:39:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3yfPjFoXT4zW9IB0D+yJDheXIOMZ6xE5nc9ficLH7236+y8wL6rRb8AwET6KzJXDdeLk4+w==
X-Received: by 2002:a05:6a20:38a0:b0:245:fbee:52e2 with SMTP id adf61e73a8af0-245fbee5703mr12170806637.36.1757003998820;
        Thu, 04 Sep 2025 09:39:58 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:58 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Date: Thu, 04 Sep 2025 22:09:04 +0530
Subject: [PATCH v3 08/14] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-lemans-evk-bu-v3-8-8bbaac1f25e8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=1181;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=Z17R4uxUgU+bBwcNXl4EOOFcTTKHC04Ru6ei0RAupaI=;
 b=6wJJPLyeumdxPLCldgh1JOuob6GxTwr8kMoGGD6GLMkZW8vNN/3nshAnmnbA3DbR+4Ey8ngm9
 kyFXXI26djnAJbLFGIm4NztHyRSyViW35R1jwZLpy2wWw1zo5nKNT6O
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: JmEEjZ5QcjcdYhVxRUjRX-7XmMkw8diG
X-Proofpoint-ORIG-GUID: JmEEjZ5QcjcdYhVxRUjRX-7XmMkw8diG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX41uyhsY2snNu
 5+8m0iYZGr0cX0VOqf/6tKfcUcOskD/OcdoNOs+al2InIIah3rZm4jX6rO45lqhvlfvcATkAiQK
 FTt8bNO0kVSzdfs/KWWPBKKZTDhZLGzvjqS7SxtI+RkDSaBZZAfFThYyV83bbEjPA5JaMpdJ1v3
 +rGQhnpOeP2kuuLemIb41SUzFhMh0oXIqkgIS9lkooKeXWAqedv/idZOFB4VBztSeZMtDSDYOCx
 Xb0FQ+SMxD/kvfwsxSq2CtUyB/Hnag2tyYyCBSRNN4SLdH7LVC8T0BQSLxYNXk7E/AvBMZeqTF3
 K6mTxc4brXvq5iyvV9JdWPUmzToSUObLiOmEa+PvYAsG8tthv6Uwgb9mHWh2kpaM8V3gEkmAPJF
 thfzzimH
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b9c0e0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=08pr6S3s0jzPFaFj3AwA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

Enable remoteproc subsystems for supported DSPs such as Audio DSP,
Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
firmware.

Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 17ba3ee99494..1ae3a2a0f6d9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -425,6 +425,36 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sa8775p/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/sa8775p/cdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/sa8775p/cdsp1.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp0 {
+	firmware-name = "qcom/sa8775p/gpdsp0.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_gpdsp1 {
+	firmware-name = "qcom/sa8775p/gpdsp1.mbn";
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32768>;
 };

-- 
2.51.0


