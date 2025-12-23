Return-Path: <linux-i2c+bounces-14688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 548B3CD8EF7
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B3C53046EC9
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE1032ABF9;
	Tue, 23 Dec 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXZPQwMV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsNxcFMp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C29A327208
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484172; cv=none; b=GeEfz7Hyr4AgZLPODMnEtJgfe2H82Qbv6tGDAzXBqKdi1ZkngMzdVkjzeCuHLAXDaT8TjDc0LJQEFRxiFsUPmKMNyZwBZkpccF/+S3CWtZZKcm6zkVKjXRLrYiEl4eBbutn07wpuC2ofhNP2efMf6S9ki9ChUt+WogrrBYlL2Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484172; c=relaxed/simple;
	bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsUVlthXpfKh2+ShjUwZlmZKYxPXU1BBzatr2SQ4YW5R+hFVpbhQViUgemFkCx/jtTJT7ACvvoN3zu2c13hIefi9IA55/YWvJmzR0WmJF1Vd3pK4EA8LRdVBQ7HHzarCPbShYFZyOW9nhwryHvDCPIJH1MI0AL+50mV+Id19uPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXZPQwMV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsNxcFMp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7e8Kd4044456
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=NXZPQwMVokntHKv+
	fa6fgpAlsALdTn0FhVHe/OI0/RAIFpi2EQ58j0PO6zNyNNJW3dkpCjnpyNrjserh
	0SN0Q5/JAdL9cCtjSI6i/4w2C4hlJ7yQ+fChan94YkDrFXAGQoHib/7didgwTuF4
	OSQuTsubDEpoFEg0tMw9DJtVRzDg2TkTTRXbW8CpAvm/g2f81OlpsAqR/N/F0Y3F
	Xunn3GCHzcOoyAhkp0N4OUssKO4zl+U6PUa7fM/Wmd2FMAXFbgxpYpgWha9ZujNF
	bA1ERz0aVQvCCImvoWp+nrwJqnYphez/xoXSXQmkV819WcAWZNfP0n5o1tby7f+N
	UTSBKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha6es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso85023371cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484166; x=1767088966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=UsNxcFMpF6DyA6ni5kGF8DS74OezFg0f8WIxVPPor05+drp2c+zU3nQn9MSghvBoJo
         9kyL4Qov0sn9449SDDxQmLucRpQQCmVnxRcOB5ZcAGhmPEzlHWGtaUOJ/YtNrrcAvRF1
         bkm44IFyHvqq2VgREMZR0kkthX5zDRzhRqKC2B715TKNBmJJ2xyrNxA4mTMnNC7H/aHB
         hBa9+5gUZU2NBGP2CHLUPT4VFxt9tNQF1XXOM50d8UlrszH9bfBUVDUqqUp1slRbrgp4
         yEKTH4apj2Ar0ibMbamgPm6kzhoCzKWqOA4lCzQsWHPZLh/JbLB8hLrWiXwkHtSh2Cx2
         PrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484166; x=1767088966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=sjuySzqWcZIDSnMxgdSNUEzpnU2zgIrnsILQP+IL8ii2I0uEtumjuOSVunNKevJw+C
         dyhNz9GJQ25vOP21GoTKYUbgoFvISU93D7kKVzvIr/qGL4nBEEkycsPmZbx1F+ppq8kn
         +k6HoeUkCVaA7iISV+DNSrYNqs/s1fDF0/pA/jUhvtX+I7LeAYsoULwdD3WUSYqb8dfQ
         1a3WR2I84ygUYYfj2UIzhcYJQQtdzuJuO+M/KSZDrugfLMgqlbXUyHMP+DviEDAJNCCt
         B/wiAfXvN4RjZwctq9cI+W7vn6CCHNu4o2BNW/VEqv0w7TMMeyi6Xednb63T/oesoqyq
         duuw==
X-Gm-Message-State: AOJu0Yxqw4XGKCdtMode0STEmDvFosvFPA/EyxtFWHxDqPJjsjPUKdg8
	59vJqVC2XpmgIaew+G08K/2J12iZisZrs6QMYz6/wg3NI1jgTM8+YLkdJfOAN/YR0runbziqthR
	owaJwvKyLSBkq6HOf4E3d94FU6gRhlZHNQ6BKLFcUAWmZRVj/gx0KtGh2q+Otm4U=
X-Gm-Gg: AY/fxX7c8NwGijHeEOsJhTMTZGtERBvq37ZVKqPLuvkk3afNCU2eDhYkYUB5DsdNTIs
	9BarnB2vl0qRCrVOciNgL8VUc0l1y7qDjZc8+YTgr9Ltjr5yo2Wi+zIftkOEhZeveeAP1cgFIMX
	rnBb2iwlid3kDwC8hkW2OeYnFrS+vbuuPAUM5JbKgWUQovvSnVFv5w7aGe3h0vP8TyWHvzxfaoW
	uUkESoVHasgeztdMNqLTbMUVMNBp/Le89pDrLqhxcRC2sl9czIG3txhjfwlUg880xGof95lOxPz
	16/ZD5MKdtTjvReFOWsoYHlzZRzhmKdLvetEOn5j2upBCMabfLxr5oT8VHWQulAAvQxco0Knk4b
	8+IznBsLrBdnbm9p87HAySSCxIMg8JPbdJoV37w==
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr222573301cf.18.1766484166175;
        Tue, 23 Dec 2025 02:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWaznzSTQAYQqKEgVN6mwd6iFax1OFCffRzJ59eXXh79VnM9WyrAcyYRh+zK9tRY8IGJfXzQ==
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr222572751cf.18.1766484165645;
        Tue, 23 Dec 2025 02:02:45 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:23 +0100
Subject: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi3cNvVUsgYZCpEuC46abxeRT7pA49Xu64UD
 uziUkVt6sOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpotwAKCRAFnS7L/zaE
 w0ZoD/wM32Bmp3WE+s9el7ws2B8x4OdFoCdcSdX26uMDCnLnt8YtAI8LOsVEEMb6fazPKj6jB3A
 jMHY2S8MeFGIwey/wve2wcUUgB60vRFoCZY+E/dcCGlPQUVhOMO3PC2AhTxwmhkBmfkzDQIquqC
 YfNbf1IdKLBGn9WdVNJaTeo9B8YtMcnX0ZDUKzJuc60m7ulpEF9QqYjLU82JgKNWzllIdtiPLVX
 E684v0yaaD+u8JcHb4qv1yORIxoyhBVKX2DauwcCXPFMlnEN6UYvC+JQTE1mtGICrPrK/mTMyeK
 gxxc5Gj1ENA8Pr3SMUWoPnBF0AoKGWF3CJWRBGsjK1G5vdfyJp9fH8gvBxcdzNXKcAis4Ed3Hbn
 u6faKfE7YzPznFltsBGJGmWNTEdH3N+syfZQgnQr6AdM7NJkPtD91sNAk+g33YMN2lg4BbobqcU
 ++fSFCzby4D85+5WOfn6Am0AFpRgoXSmqqdQwvilG1fiDeXTAx5F86G8I3NKjn3+AmJ3fQFwQ93
 patNHd2OQStX1Jed6F6tfhajOxUvbvZkYwb9LRwX4WBzdiCEej9pxvmzMSDqs73urZJt2Z/41/E
 aAQ15tsTH1dl0aqGratG04wZFTAxiF6I7R3axfNL/mTIyehWRw7qi3fMW+IUk5V1RfiNArrrg8+
 z9zRlaDNDfxGWPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: yw9dCqGIlhPjm1fS-hivUqY4vePlNV1n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/K8rdWr5D125
 46ThXXhI54yaCuyKfbTuDarFbJ3M1IZckXYB8+bFioiC5rXHpY5LVhDU3UE+iylBvIXLlU1tQk7
 wVqTx1IkDxTN4AGb2L4Lf3U4RVQZlv7Wnz0UYqTvXyFSOTZ6xkJ0LVlZZiml1JEwbb4tUileyn9
 Y7DghBgICROmOuwi6UZUv88DbUkDQUS3OedoItwkmzoOKlgAjfWSUiYwPM6M24+gK+11jpM5QMr
 AJM9OSHxHWIna36WjDOg8IRlwHvaB0DwJJHV6pDf4EsMZe+X1KrdhGbOJh9YuzDKNz88qR+D/gQ
 oVeH6UhuEeSsdM9o+nCVv5z2DePTWKNevT1yZYHfQDuxYy+x/0WcF90YrgOQylYbeuZ7ssoDFgo
 +Da+nr6zD43WnaYUiopO7kKwg3eI/XC7yXTfleklVZvFtEet5Rahx6eeKS7K/1E9WGOnzyxekNH
 K4X5bAdiLnc8CekIW3g==
X-Proofpoint-GUID: yw9dCqGIlhPjm1fS-hivUqY4vePlNV1n
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a68c7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PEwmxbnAXTcU586h74A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Add a set of i2c-specific printk helpers that wrap their device-level
counterparts and hide the dereferencing of struct device embedded in
struct i2c_adapter. This is done in order to allow moving this struct
device out of struct i2c_adapter into memory managed by i2c core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/i2c.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..2225696c859f617479be4d5c9d304bb32cbf5e9d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -768,6 +768,12 @@ struct i2c_adapter {
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
+#define i2c_err(adap, fmt, ...) dev_err(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_warn(adap, fmt, ...) dev_warn(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_notice(adap, fmt, ...) dev_notice(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_info(adap, fmt, ...) dev_info(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);

-- 
2.47.3


