Return-Path: <linux-i2c+bounces-15035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C045DD1207D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 11:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CB823153479
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 10:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29B2346AEC;
	Mon, 12 Jan 2026 10:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VspeZzG1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOuAEypx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9541028000C
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214871; cv=none; b=L4W4iyEVNigITuB6/GMbvB+AXUHRrdZPfvQ4ULtzFhA2GXmTW5asVF46T9o14nBIfrW4lP3UFMfnfdszHv6QIjcaSgzfRkxnpvU7iV9W+7k5qX0CXPP+a1rmwopnrca5N54iveDL+NsATB2/I21QvjsuJPBORPIy6NijHXj10IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214871; c=relaxed/simple;
	bh=Eck/D6KmwOrBysTJIIaZmSoFBAq/RlW1moTUSu+Xl3I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fta7JViKsf6k/MoO/QginuBITDnIE4OITVRPqcuqZZZVVt8DVvGUxlfyDyRxgH83Q+28sSErkZ80JiTC1mCujpxclZayb2aZosnvWOp/tDCkAK6/dttE+nVDTGP+0BX2okAYSAgaZEDahjJ++hjhLoU5h5pqC8eaUfxtVbGFbnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VspeZzG1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOuAEypx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C84PpP3353785
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KnpiwG0d//X
	/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=; b=VspeZzG1QNj+jHWhyOS7+P1dKmW
	TLj3Dn5Sri2LWtrNEQnmB6XdXfBQ2KGSbZKF22sUaUBieuYbYAjQ9vz0wiq3jCjA
	kAOkxQlkI1nSH/0bvGZFo8hw/DuTd6jHRTxy7OcyayA9uhoFAgBgjpdx6xvUdDbz
	qg3j/rcXn6U1TUPCOIAiWIGSiB5pmDz1AzYd5m+Yfw2xTalrsce7bw9J/f5EL/Cv
	cicd9Tv0t9yXv9u+CdAvLrldXLtgLzAKLW/5nz+PVQyjCtePO3OVZIqvQJhMIMVS
	VJDK9J2Xm3hecc5kVZa2OpRMwKgxrrjXS0SOx5am5vvD490Bm+s1APKKjbg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e4pgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 10:47:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so2702092b3a.3
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 02:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214860; x=1768819660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=HOuAEypxzOp50jgnV/AhUUthISA1HGy8iZ0pWccz2TA7swqE04BJK2LmpK1dBSe1Ph
         axDYMQLUvbJDI1WaDKd0gyQI9cxlbyg2nd9zs5ydVN2FG5LHh0z3TwgfoNOyJppLeUA+
         47Xj9eTJRiVqabbGvOFTRhT8OcoFCm7+SvmFRwmIp7yX9WLY1Vi2Xstf4u18bdXlSZj7
         v+teLMm1YQMQOqJuc61E1FxH7SRKE4PvplerZGGhiNUa9tmEIutAqdpwgn7NJwkSy2ia
         4ReJUpHWOwvBJ9J1jHzRaf5mKxF5IFHUof8fI3I1uCsh3op2ckySpoYHgf+rJWMvu1/K
         sjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214860; x=1768819660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnpiwG0d//X/Doe7m+7TdtdTnhg6HQ3OqoiGCkLu8T8=;
        b=EqCD6bpkXacXlDgQVNCwLpO/Ilei7ncFsDWG8ugM10qvITR8eQk0ym2/F3SQ3NTpfU
         vcpYkHUQ0ddSQnl5ssSvITgr3tGitEc3TLZh9SH+kkojX7A4DPSQI1Xd0VY7eiuf0vvz
         q08z4ja1AiszbPTOFTPaz3TSby8e2r81W/dbqPvexntznO0qLvZSOYYDLzpcQIU5iuog
         8tCwHTg9RhVHO5l4ISPfpb+zeBLq+yBcrxlBGVCmAFws4RUAZD5s5VBYBda5RZRZerTX
         kWgJqRob1AOwqi6ZCmpEx4GyUclYqUO2oi16ndJGUeK6scJiiNEQQyJXTn/MmJcT4rsz
         4o3g==
X-Forwarded-Encrypted: i=1; AJvYcCVt4EGrJ5Z3/+vy3TLeXfAoSCzheJpBaHTDX9SCipN2tma9d5C4otGM4sN6QUPtjy2zMNrcOsU71Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQQU52najVyXQ3rngeMJSWm3mCP/wJmt+tgWhl3c/var/7WmGm
	FKw/N4wl3yh/AvdhXq9AxxDFdJEX2nN1p+8KcLpmWTUmt4in8pu7WuZbefUQniTteT9uzyRiV7N
	Xi1GFJQ6+gEpwm54q6y0Q0BxXAeMGhggP8MW9arwV+AOVxad7Zx64wpRbr8NCRi8=
X-Gm-Gg: AY/fxX5LtvUI36cdskYn+2Dyv+5Mxqrq73jgPhiLBwmYoucyg/aLLsOIMN+LjQyXCQT
	8Qi417Om7Li0y6fHhgfOkg6TrLaqRh2Fl9RWSXlvGtXZuPZ9qO25iij4x0lbyLXlt+q1iBJR/yS
	Gqs2IRmf59BPQbGDx0WEOuk2UGws/FIMJuhkGXuRfWl12cp2aPkZ5PcXx9aS+JuFbcOSjvtKAZC
	h/U4f2xw8VPRtoGj+IAlxahVFsT0aHZQBFsHcV6A/mqMJ7TWS6kBjxrSfkO3Ytv3R1SLTc4Dhho
	EwK8x3SP3KQInM+onuibjFC9Klczk9agjS99MpY9TyRA7W2gXNgO31BlOKIVftoqJgbBlWkzz02
	XFbuXlpFPwSshv0VFtIivSGyK/pluA2ij7GxahONKhOM=
X-Received: by 2002:a05:6a00:bc91:b0:81e:5d52:53c3 with SMTP id d2e1a72fcca58-81e5d52567amr8230824b3a.18.1768214859864;
        Mon, 12 Jan 2026 02:47:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3ldgLP/Xx+f0G+ZCY7b1fwuj/2H7N1WZN6H9rB33UYGPFQpyBaw1Rf885x63RbmMWxbdSzQ==
X-Received: by 2002:a05:6a00:bc91:b0:81e:5d52:53c3 with SMTP id d2e1a72fcca58-81e5d52567amr8230789b3a.18.1768214859256;
        Mon, 12 Jan 2026 02:47:39 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:38 -0800 (PST)
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 01/12] soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC path optional
Date: Mon, 12 Jan 2026 16:17:11 +0530
Message-Id: <20260112104722.591521-2-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: mC_ECsUaIpJtjL5RWa_L3QnDUd5h1Mbg
X-Proofpoint-ORIG-GUID: mC_ECsUaIpJtjL5RWa_L3QnDUd5h1Mbg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX31B+1Z90Us6+
 0Qas3fvs99quwizcmrEW7rbHa41cUxSv/JcQzsiMBqEcLXnfDUMSQwhoN51+YzDmIDbQle5Vcf3
 Sc2oLOoU/m9y9dO7Cb5rAnHZt27m3HH+6M/sIQDddRoo/I6SzA+WHoR9qv3eoozGkJcslBEgNHv
 3mXxQaQGxNLoP5VLD/1r1MPjUFOm99S+xc/12czFOicRC+uAT6EdhuPPklPVEsJ/HQb7BxKvKwG
 XaaDbLsmTusBP6RW8q7nnw/uCbO8zgybQUcSTSuLK/9ToGm1YQNIMeWVDB4VkDftBfcJO3IlzuU
 fmkSo+X+iicIMaD72hr0KXgYO5zO/fo9JPTs6FrZLAWxblbLby8M7S+ISoC2Z7kVfTNg1DgF/lO
 3YQxG1/FXv8WV/9GRrszJWFg5Y3Eqc2sToyo7iqV4qdoGxgXZEXnSi/Zh10RMe0fOm+JF9OpFBR
 jWExMkChJkBT4f8I+IA==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6964d14c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Wptve8LSCQjy2B8HgooA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120085

The "qup-memory" interconnect path is optional and may not be defined
in all device trees. Unroll the loop-based ICC path initialization to
allow specific error handling for each path type.

The "qup-core" and "qup-config" paths remain mandatory and will fail
probe if missing, while "qup-memory" is now handled as optional and
skipped when not present in the device tree.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Updated commit text.
- Used local variable for more readable.
---
 drivers/soc/qcom/qcom-geni-se.c | 36 +++++++++++++++++----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index cd1779b6a91a..b6167b968ef6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -899,30 +899,32 @@ EXPORT_SYMBOL_GPL(geni_se_rx_dma_unprep);
 
 int geni_icc_get(struct geni_se *se, const char *icc_ddr)
 {
-	int i, err;
-	const char *icc_names[] = {"qup-core", "qup-config", icc_ddr};
+	struct geni_icc_path *icc_paths = se->icc_paths;
 
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++) {
-		if (!icc_names[i])
-			continue;
-
-		se->icc_paths[i].path = devm_of_icc_get(se->dev, icc_names[i]);
-		if (IS_ERR(se->icc_paths[i].path))
-			goto err;
+	icc_paths[GENI_TO_CORE].path = devm_of_icc_get(se->dev, "qup-core");
+	if (IS_ERR(icc_paths[GENI_TO_CORE].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_CORE].path),
+				     "Failed to get 'qup-core' ICC path\n");
+
+	icc_paths[CPU_TO_GENI].path = devm_of_icc_get(se->dev, "qup-config");
+	if (IS_ERR(icc_paths[CPU_TO_GENI].path))
+		return dev_err_probe(se->dev, PTR_ERR(icc_paths[CPU_TO_GENI].path),
+				     "Failed to get 'qup-config' ICC path\n");
+
+	/* The DDR path is optional, depending on protocol and hw capabilities */
+	icc_paths[GENI_TO_DDR].path = devm_of_icc_get(se->dev, "qup-memory");
+	if (IS_ERR(icc_paths[GENI_TO_DDR].path)) {
+		if (PTR_ERR(icc_paths[GENI_TO_DDR].path) == -ENODATA)
+			icc_paths[GENI_TO_DDR].path = NULL;
+		else
+			return dev_err_probe(se->dev, PTR_ERR(icc_paths[GENI_TO_DDR].path),
+					     "Failed to get 'qup-memory' ICC path\n");
 	}
 
 	return 0;
-
-err:
-	err = PTR_ERR(se->icc_paths[i].path);
-	if (err != -EPROBE_DEFER)
-		dev_err_ratelimited(se->dev, "Failed to get ICC path '%s': %d\n",
-					icc_names[i], err);
-	return err;
-
 }
 EXPORT_SYMBOL_GPL(geni_icc_get);
 
-- 
2.34.1


