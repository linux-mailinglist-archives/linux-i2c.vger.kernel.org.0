Return-Path: <linux-i2c+bounces-14218-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B62C7C747
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:01:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 09A1A35AB32
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33832BEC2D;
	Sat, 22 Nov 2025 05:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyOkEpo9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcNS+cYl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F85296BD8
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787651; cv=none; b=YYGBOrUKmFfQulCU9t+/zVXX634uLewnEAk9mUxR0OdwtggzBzZxsSc5iQS7k5TDVfMu1jljn5ag7hQorGTyIK1OYTChuJg8wt0X/uoc7SxvTmPia5UPBEKpNEmpjlRQvFITeu0hueycoeQlCp80k4fW4UN0MRv78JyPL6GCZAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787651; c=relaxed/simple;
	bh=85mnIBih5TefJNp/bHk7qTk7tspz31Q1DwJ4d0ufNMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AYwPM4mAedfw5TJkUx4XQ6peHSRZJ1x8GMHJa1GYd5eyBG3oxLKk7tIO+/JH7ts1TgWzhUp8plOgsij6LHobmeN/OO6Pdb6j7P8WVvfs07Agr18L6t7vUTM/9on/SSkABChH6qRBdBqaRNYasZ9rmZkX0gcQ/eLSgthVvvfuuPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyOkEpo9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcNS+cYl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4ZOpf1762050
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GkgK+E57psN
	HC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=; b=GyOkEpo9N5i7cFS6ASSkEzqofB6
	c3JRB9jFm8uM4O+/FeG846cO3wR2EtMnt5DY+Qj6Bx3iW7dr2hVjRPGpbJDbTWBD
	LmKPQlWRIPf9cbmxlETDueEKjkbDhSCzYGjxX8xE+dmN/1As1Gn6v3GhkcRKQqxJ
	wFz2JhM/5vj/SGFtRfygxb7EOq48d0NG5Lz5GPw8A3Fq042BjQ+YNwGKKtrL/gLH
	spKF6mAvnF0zYOiddcmARLDvt/gO8pd0gazayc5t8YJtyWDE7ayuXKhIgDAx6cGR
	OomNAB9dpIwoa6EBv1p25SxgoO+l7cx1VbDbXTk7xg/avpze7bU86KO/rlA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak691g1cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956cdcdc17so31643915ad.3
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787647; x=1764392447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=hcNS+cYlB6BVSK7wnEmTQnaskOPivACwl3+7VVEWqYirdsQOfE5RQgw3kOl2Ktf+Pm
         s/dVXyiq10kzdF7n5K4fXXOzuV62OGCVEqqDeB1mzkcDluaNcFbuCqxCSVvJD/rskCjA
         CR8Jl2rx0ll1Mz/IWk2TfCKy4bPllnfLnH16N8UOrIKQVRqYv35F+xKyUN6xDfuttHTV
         VPBsSzGPrD8C6Z6NvUmjv69QAOGOfiZH5rF4ScVyNfOfjcQuMrzK3OADNEKlE/ebVK7g
         ZCcPvAh8NIaEORV3bNazLPBCz0oBCm9dGPG1PdzBM7DjYZ9TnzMPW/YgE/L46+36Qomp
         fuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787647; x=1764392447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkgK+E57psNHC9wkY83ywNIDVuH2SOJteZ2XuiMuHCw=;
        b=jKZa8qXAAbjp8fPdyce0baOoCRm6LL+pmMuAgHUiGJ9czOIFMOEE6W5eFpGsfv1Q0V
         030J5xVHMxhcx0+YRc+KzSIf2IQdt58KSfykJumu7XXBAZ4Je/LdrTXQr3SsrNLhNyOy
         PdWzeitG1V1Iw9IiMYB1Qy+Jb6PSGQMWvSZOBGUX7pEI57yNV6cRd9vBt2yfrawrBoSw
         JK5+NgeRNcsBlshAMFW8O20W9rrxxXCP3f9e7ZZeHa7QxhZmTdPZV+UioucmQWt/6KvK
         tsVuZCOH/S0QC+kywZXv3+vIW348D73TLOMpQctz8iIBmieIeZFCQdPPMhnB9O8nbfWd
         HOIw==
X-Forwarded-Encrypted: i=1; AJvYcCXarVVsep63+phEthLqYvFKppYRufhdiD0dUgMJMOUdqSzKe7vdWfoxsAk58yM7hLAe+UTwlsn2mso=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAgkIgFcbN7NvZeFsNcqXRiukjzV2Orsu43Ra8fMeLll0bOkEA
	cTWnURC4cSqVh6u4StD99YKScgqJnW9NKxUhhlH64SZtgCcWBv3FJemGsxx/ektCis00qjHM44h
	Fx6Zt91XFH5Fv93OXGb4gfK0NkWy+pZmhasUcMXyhXS6+i7mZ5pAeB/lkBvN+cSo=
X-Gm-Gg: ASbGncv+vNe7cQfbLpdNM/74MtRJe+wAYAO7xcCQ8+44RJzWsczRuk29FG6gfe57gps
	Ow50QdHdOuf4c1iyasGW7eccW52/U232pRp9fOTF3SA23ph9ZtmdObGNojRbHDa51yx0leqba8F
	L5w7+wgWutz/Oz8Ljyu75v+plDzbJ/FfEQNhn7zuYLUVzmFYA6ZrNpzpHLMcZP18PeV+GPd/vZs
	bJ71Htp+UYteMdST93Pc4ouyKRlGLrgW+rY7WVg65LZrkA5kyN6Gzxf0FKYJp8GRIhUZG7th/2I
	aCHA+hr6h3Y1eDBmR8AxsxuFNGSpNTdAyuyfwDdPhErHrR8Xd9biODNmxxh8wYKFu0Ryj96bsrK
	NksOrufYt7nQidbX/Uv9Z/fNIzA9yiJHUkIRM8hZci2k=
X-Received: by 2002:a17:903:1246:b0:27d:c542:fe25 with SMTP id d9443c01a7336-29b6c68decdmr59205255ad.41.1763787647510;
        Fri, 21 Nov 2025 21:00:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCzAeTkDoZIFezANE6pQeR1B/0k80n1mCUu+ZCT323/locWcBGgSUCV5GN5Fm8qjDomlAeVg==
X-Received: by 2002:a17:903:1246:b0:27d:c542:fe25 with SMTP id d9443c01a7336-29b6c68decdmr59204845ad.41.1763787646930;
        Fri, 21 Nov 2025 21:00:46 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:00:46 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v1 02/12] soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
Date: Sat, 22 Nov 2025 10:30:08 +0530
Message-Id: <20251122050018.283669-3-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Be3VE7t2 c=1 sm=1 tr=0 ts=69214380 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BVB3BO4C9w_THQaB-9MA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: NVB5DzVqAEVCq7oRVcKaVlN4JvmtpOID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX20u7Zs55MEqN
 NMl3Evk1eqmi8rWLhz0vkqc+KXRdF4JNo3hl+g0BYhupHJSGiXmTTO6qRNXl/A+DzbqZsy1fIzC
 pMbcN3IkFsoKKnXdzVCCERhaCt4z406rIau1Kmx/GjeNfYQHDU/9ufI9PJtDUx+t3ZdgpmIePU3
 6hcr0u0q3tdtJu9LsUxqVDjoLCG2839Whap5cpw4DC0VutM0TJSJezrVohF+sH4/27Iw2GLMf9i
 erCJrARaw7eyJ6y7p5AdOz7yFGrgrxlrPvPQI6givHdLZnSrCGndsxY2PFPzFFCfN71qirpZFj+
 a44qoJiDzGj7822XGS31ZN2nbuFLpdGdpppdU8SDI+SHlPU+LCXdEEOq9War9Grr7H5Vp7KzkL/
 MAsgJXaBRDjBH66WgVxSUeEBrCXEFA==
X-Proofpoint-GUID: NVB5DzVqAEVCq7oRVcKaVlN4JvmtpOID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511220037

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


