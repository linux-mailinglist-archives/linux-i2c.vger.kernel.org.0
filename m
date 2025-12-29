Return-Path: <linux-i2c+bounces-14818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE37CE5ED3
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 05:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0775301A195
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 04:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982E9246BD5;
	Mon, 29 Dec 2025 04:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GV7v7k8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SaNjJY1q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A14233D9E
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984117; cv=none; b=FiHhyKMPKhm66Jv69btD2lMf+NgTX08Csk2ngNG36HCpGm8KBPpXnfk4QBTdQvFplO9zt5oBprxPQiWQGowoE1VwTiheNQlyQVClueUMJ+jOjljSZVLsXcVFalWkN/QPQY5COsVXnOzLALh+msxEdEfreJIxWS6YsmR7DQpRaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984117; c=relaxed/simple;
	bh=85mnIBih5TefJNp/bHk7qTk7tspz31Q1DwJ4d0ufNMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=upe0+KZ/gvo50r+8bD8fqwze77gF6x9semwiTx9v9+jD7foHOTp0PHaaXdI/TnduAJ9BG9VmFJ+EdaeAKR1IqCX3CldYiwvzsixvIaPQ/qPe6dhgkoXLh/iXErCeP2+mDenQEYuEHhZoATK7jTaNU3K9KRv10M4VTriggn2H1e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GV7v7k8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SaNjJY1q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMQgZe181140
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GkgK+E57psN
	HC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=; b=GV7v7k8T51YdK/twBk+LEWtMGa9
	En6yFOXZXDf1wAtwkVwUx04FgsTJ/NxSPwYWgM6Qz/Lk2FbUKqQ2YgnExHamM8AC
	Wi4g8hhGsmKk0PjDDo+5wnrEMAC6yCH7+BuasRsgak7lpVeqBJl51fMO9Mke0jlg
	PIJTAfW190BFPRTjg+fP2tLXht5EN/prXnaTYmP0WOZ7UH7wygUJZelkHcirqryK
	BPfBOCRvopl+dGdYrAkjyz4xltbZUUhodKRww0DF0ZLpDi9kJbkAKi8p7XMbNa/r
	U6RKiDwxY+MyARv2zqYke+SrSFMYWtYsK5+7ChY9bqs41YsJmHKUb9fzMyA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v0md9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:55:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so16803531b3a.3
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 20:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984113; x=1767588913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=SaNjJY1qPr5sWcY4340XmYUXPlua9cHwldd2HHLcOcvGc4PYWY/jajJ6qnLLmAQiC9
         l5OLCbNjDgr3aESjT9f7+On1cRecyWDKujmiNU9NfQYXk8yJL5Epm7GrjFYP80dETIsq
         8TcgHHdDgMfK6UuS4+Fgx2DuORwnWEqetzYQPAiX9DlQ7IBHZDLEsSmKKFkeMry0Z2Nu
         7PyvlXwUTBDpvLb1XwcAdsXTB0khJ7bEPrr2utLsGw+EvsXmgLzK5aMoR8stGXbV46Pd
         J6bDIv9VzOdzJwRwEmn3PZ5k812HliXTOtpCMr7XXbURgp5ziaZ/AwDZVjksZQFT+u0U
         VdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984113; x=1767588913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=daGRKDpDKp2nJXSS7I90nOG/xVqZDQp5tzxnq7b8ib/7CKpICJNeidOKSR4lQPmKKv
         ZqP2FCVP/uDCCnn4pEEdQAQF1D8+ugPQnmPWhCwEXaKmlha3fj03tM0Kb87UitbGw6yl
         LtMwdpyxObuQpT4UV95oxZrlK0MHipHeZciGe+RCpPDP1qIYUdd1si201LlP+rrpfLEI
         E0Aqjlj6pUSc1RzpHP2tOcLcTlpF48fpEw2vk7e1/vWmrRTQooUQIrmMESjKg0WNFA3b
         GdHe1XAJQU1fWZepgPgVWc0MeW68RvZS3aE70OW0+wVIHUrI3gNdIiA8N+7A8VZELlDr
         LHew==
X-Forwarded-Encrypted: i=1; AJvYcCWfDhUIVnF8jofM9OGoPjAtee3nXC7c/cjdAZPerAqXhLFh9DoX5Xi0QJC16j11WWxiylnGDhfj5Is=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjzY6q217VCxT5HjYp7WnZML0AB/MIYXAMzoaK3Fhu6QsZeZDd
	yO519yKVXplQ0C9oBS9MpW9JdiHYjxQdsrDKUlr/ilCQl8k79dBIC/UdTuG778XDW1cD2QXFvqY
	cEses+T/T8CBBJTI25zdHbf/z30Ls3RAOGJJXIX+Wrv28KPM093wBYwy0c+c1RCA=
X-Gm-Gg: AY/fxX4SnOXHFtdvwlIuRGRuoGsSkx7Txhp0gwXPTtr1ic12FOF1BSxM52SqEm0T08k
	uymeCnRBlYjeKfMIOoFJHzpEckkBwKUBNO5aj2OyXtn/dzVALF2PgWsk1bpQYC/aMtorbgfW9AL
	i9kFCJSmLrS7bDSfMhDnX8luM0SN+I8t70NQhMQ9C2peiDP/OGXDiFpnXou7v1HaZ3Nv/fLmB/7
	QMr+0Esbvfnz8ml8REuOmFuxh75RaGbhtqLHtHj3XCAV7iKuIigaZ8+CV03VtrbVLzG1FGBckBe
	41DIsCcAbF8st7lP872S4aCNAqoNGXQ9zQsQJ/Ym/JkpzFIvPnZTKvs4mlb0k+fW3r6BR2JtHOW
	dLwXPXlOvX+KSiv+Ww96GVbTtcreI9UkbkOMgV5QzCy8=
X-Received: by 2002:a05:6a20:9389:b0:371:5a31:e477 with SMTP id adf61e73a8af0-376a8eb7dfamr28547951637.25.1766984112640;
        Sun, 28 Dec 2025 20:55:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc4PuiwdgzDZb+xxr1sxqynI1rfl3suzhuUd0zvQG+2VVLBW+Y6kO4bDWv9ThKKaUyLcmt/g==
X-Received: by 2002:a05:6a20:9389:b0:371:5a31:e477 with SMTP id adf61e73a8af0-376a8eb7dfamr28547914637.25.1766984112044;
        Sun, 28 Dec 2025 20:55:12 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:55:11 -0800 (PST)
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
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 02/12] soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
Date: Mon, 29 Dec 2025 10:24:36 +0530
Message-Id: <20251229045446.3227667-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QQ7jHUs5D6ekUt-VlEVzij1uA97xRepE
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=695209b1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BVB3BO4C9w_THQaB-9MA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfX0FdVuopckGnS
 zLHcVP/NsWB4H08kIzpcYkbSFAtooGbDDQfC4RMit22sZHtsJ2Xzf6OhByr9Xs6Xovi1xr/nYg9
 xc7QQyVJn16CeGGxR/lqzVXCXe2SI7SuuierdW249pWVRGbzheRgau5h+qU+DKqtfO597N/6Jr2
 g9rDDNS49+PswausMfjyCGUAjrOR/r6cxu0T668RaS6w8mj8ZuqJEi1Tnf+GwI36YVUDrxXCY9J
 KMc+YgtMPItVvfex0aJshq1szEcQb40XBjPUGGKAUL/bDIeHpMOkOYC4crWv7dulrCnjgRq9oWb
 xumqbka4VXEpNkKAJ+F5wWF43THSiR0NBTQy7UqvvoWjKQC3x2KVSl5DgvJJDEfLn9qi9BCBXif
 6W2hKP/v9Z3yY2Oh9dbHCOpAPLXg0PP3FHD9jyaJjb9Lgkpw6Gb6eVu7OsEn1KUmr4Br6uvxurX
 jfGcAC4S+7PvJzGAAfQ==
X-Proofpoint-ORIG-GUID: QQ7jHUs5D6ekUt-VlEVzij1uA97xRepE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

Add a new function geni_icc_set_bw_ab() that allows callers to set
average bandwidth values for all ICC (Interconnect) paths in a single
call. This function takes separate parameters for core, config, and DDR
average bandwidth values and applies them to the respective ICC paths.

This provides a more convenient API for drivers that need to configure
specific average bandwidth values.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 22 ++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index b6167b968ef6..b0542f836453 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -946,6 +946,28 @@ int geni_icc_set_bw(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_set_bw);
 
+/**
+ * geni_icc_set_bw_ab() - Set average bandwidth for all ICC paths and apply
+ * @se:		Pointer to the concerned serial engine.
+ * @core_ab:	Average bandwidth in kBps for GENI_TO_CORE path.
+ * @cfg_ab:	Average bandwidth in kBps for CPU_TO_GENI path.
+ * @ddr_ab:	Average bandwidth in kBps for GENI_TO_DDR path.
+ *
+ * Sets bandwidth values for all ICC paths and applies them. DDR path is
+ * optional and only set if it exists.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int geni_icc_set_bw_ab(struct geni_se *se, u32 core_ab, u32 cfg_ab, u32 ddr_ab)
+{
+	se->icc_paths[GENI_TO_CORE].avg_bw = core_ab;
+	se->icc_paths[CPU_TO_GENI].avg_bw = cfg_ab;
+	se->icc_paths[GENI_TO_DDR].avg_bw = ddr_ab;
+
+	return geni_icc_set_bw(se);
+}
+EXPORT_SYMBOL_GPL(geni_icc_set_bw_ab);
+
 void geni_icc_set_tag(struct geni_se *se, u32 tag)
 {
 	int i;
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 0a984e2579fe..980aabea2157 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -528,6 +528,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
 int geni_icc_get(struct geni_se *se, const char *icc_ddr);
 
 int geni_icc_set_bw(struct geni_se *se);
+int geni_icc_set_bw_ab(struct geni_se *se, u32 core_ab, u32 cfg_ab, u32 ddr_ab);
 void geni_icc_set_tag(struct geni_se *se, u32 tag);
 
 int geni_icc_enable(struct geni_se *se);
-- 
2.34.1


