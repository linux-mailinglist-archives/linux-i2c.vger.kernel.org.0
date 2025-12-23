Return-Path: <linux-i2c+bounces-14718-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31187CD8C00
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA7283022B66
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA4E3590CD;
	Tue, 23 Dec 2025 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mx9M+uSF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BV3RP2nB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12B73590A8
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484434; cv=none; b=aNM2mdStFEeklRvB7BCBi4IpLmO+Tx/Cf8kHLH3hXldddl33VIT5A9GkL1Wc4Ql3pjVCslHByk1gXJzeyZcp9HXkh2apsRKZEDo3ka30A8pasDO/xQM416PZWgR3cbksi7VzOwSBpDW9ce3Hb4tRb+9G388Nb+2l74G0B222rN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484434; c=relaxed/simple;
	bh=LaDwcSTleyoMio2oeMmIjv8Nu6RMNVq72nWxGSk8+IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=be6Jf4c9tPo8lVx2c2nJ4T/kxR96jqEsIlaPxeZZ47oLS9V0nTkZwfzr5/w9f7CISfag0PbiAQQbhGhpHRrKMn8ykkzTcLPIXQaCumDQNG2y3UPeD/gJtH/gAFTdoUtiDVe80k6VuuZWsSXH8uNV1m8J3M5XZDEKG6ef6JCAv+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mx9M+uSF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BV3RP2nB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6goFi1632644
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ad4ndIJDzJiRbOX6MY2XKjK5qKiS6VPoBcQB89guD4=; b=Mx9M+uSFYJ3KGh9S
	ZU225lx9pXocVTQ7hP+mBNkp+aDfSYhAEDZ6Wt7hoy0yspyHUYKu9w40/HyOOU18
	HeOfvW1pZmp30qtQYCQgjHiDnXeaqjAe5oG0QeYfjcy1/uiqhuzz4WJH+9Vs9Y94
	v1xYbAMYfoLEufAKVY4keP9zXMBRriCSJf1u6Vc0ySCXxLdu/5x4vUFQYwxVY4zi
	3ek8hgP8jit1kr/4rwkMsj29hsDYuRpZDtBqhLw5y2Q9zHyrf64s2NsKtxsEHCD4
	EK2ASuX3uNWSQXEeV6QnNahIIHzk4kDmaLGKqWwdymLOE6TmV6Wxp9GOYEeWhhZI
	tL6pbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8ja82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:07:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6855557aso126090081cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484429; x=1767089229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ad4ndIJDzJiRbOX6MY2XKjK5qKiS6VPoBcQB89guD4=;
        b=BV3RP2nB2/LWdsQ4hYVLcPr2ET6L0L4WGryU0NYCrANFKOw6tyFGvvU808elYwVivA
         7nQs4Y8BRvxvj2RLMgGAb5/sqQofAEj6FJX5kerK1++8oEqDI/tDyvnR0I7Bmn+xAsTB
         1iXMph0FijcPvrdxF2Q74XfpK6cpO8Zm1vmfM5TApWOaT5UWbZSfRDT8LaNTXTI4nDF+
         Qg/UVr5VHoErPl744T5AKvI58LxvXhmgczylbgvlvL27YORx+NXH40f2WJvst++n1sAM
         LF/hSaaVJ8DiXIbPAEYYVpbEfQj+h9H+/N0xkvZ5ZV/1yosMC3g9JDnt4tXWxHov76vU
         StvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484429; x=1767089229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ad4ndIJDzJiRbOX6MY2XKjK5qKiS6VPoBcQB89guD4=;
        b=BnKuKRUWMTM8VCnBVE/Q+r0yPRTd+ko+jRbyL9yF62tEtjZP4iVPoIgkXEONnCRTMd
         PN2PWu6GmKX2ofNxjAh5b4oNGfWYAlw5ElhX4U8cZJxC1V8AQv9856yxWfawpe+YiLHY
         ScGKrKnj6pRZq63SyD9I99ytN/avM3BC0LzUCrAf6XpCoy6fHOQ9t07arBlvRlh93FyS
         rF/XzSGt8J2FXMTgrHksX53bi5Nexg3gM7QzUs1l/9wF9zaO05KATOV/fSkEaMeqSiz9
         nIz3lyRb3fxJJvromdwXY/bCAO6dyedjt5UjIIVVgUsA18FTbj8HANKV+5DIamZ7gZ49
         +4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt2XVG9BudjBayc4mpCByLsKj7IMPV7YHfZtjGKObnebnM++e8eBofLzQvKsobX1AUcNEerbUT4RE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfpKyVWRAjYH8SeSgI5GP+aWYEsZ6k/2FoJ8cSZRpvqckNc1lt
	IQVk1N6s82Jmve6DAO3uqwJ6UGtOJaR6MQS03ZaWRmp0A/GlG73GZ3I0w8NnMk0nlAnFjA5b8jG
	bCF0rfc15LmYzc2c3KP2LWhe13SxG0soCtIl/9SF5zwN6N+f7nhYNh8spIDjhBZCsu9DJsAg=
X-Gm-Gg: AY/fxX4o/3AmzMWkzfrmQv1N5tFDZ/FuzoQSTCSvDlDhQvQHuO5IgOoE2nC1gj7vNbG
	rZMolEU2OgBr+1GgMORdUeqrnbu8XY2lCCW3uKRsuyRz8sq3rTa4ZE6q5zmaDLsdo5FykViMODZ
	mGjp7gxHlTgY7zH28caPF6k6w00c9QajV42DwIFp9HQXkViW9d/HLf1EzI8TlqKVv8mAdfSH1YT
	JKCoo6SSGOx+E3aw2Itr7lNYDkpJTGucOFbVJEL1VrXh1UpfilTcWPyf9k0l538qNepKwwF8RTp
	msYRIH333mGInf+YsgxTli4aut/VHdzDd+QesC73YP5xRSYIk+K0lTg4Jo967w3fSOif1cIffFs
	iizfAAtEjn15gQb7B0dC/6O0RFpZlc+OaW2P/7pg=
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id d75a77b69052e-4f35f3a0de5mr257804221cf.7.1766484429378;
        Tue, 23 Dec 2025 02:07:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+cHG7GqRDrxscn4lHGCmHlJqVvvO8uEXje3/gX0/2APyFoaq6qkgLDVSWQDa5aUjakS8P8Q==
X-Received: by 2002:a05:622a:344:b0:4f1:c1fe:ba3d with SMTP id d75a77b69052e-4f35f3a0de5mr257803881cf.7.1766484428837;
        Tue, 23 Dec 2025 02:07:08 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:06:52 +0100
Subject: [PATCH 5/7] i2c: ls2x: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-ada-dev-set-node-v1-5-2e36e0e785b4@oss.qualcomm.com>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
        Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LaDwcSTleyoMio2oeMmIjv8Nu6RMNVq72nWxGSk8+IE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmnBB9tya2xPeoeXroSb0s1kjuyPNmcil1Bza
 qVM73JmgY+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppwQAKCRAFnS7L/zaE
 wzawEACJHPYPefdLnsUjri9x3myqF3vV+4mCv+44HAPvoX14iVFXRKz9SSi5veCQL7fxwkQLzsm
 02qEXeKy6gGzwX5Ukif944il7TB1DGIcoCkLLwjmBJft4MZXniyDWH+kcNscZjMJ5qKQP1FWCeb
 hwmqf0iKPrf1+bxQY/dFLXQEIwTvyLu2EipPvdX/NwRlzV51KExWcBNsUtkTu9wiAQnniAb6KJQ
 rXORxaisBn6ghO4NMWuspCgerVYGhly0aTonYEo+GuLMk1gHgY7xgxkLhFIIhlaOY07ThoG0Yop
 OVY/KeXPxsCf0KVoXR0NZvc7VDOAyowqX391NXsIzeJPRBQG3lOW7Ff4osKE2Du97ZJDNeOtpDQ
 ciko5wYNwkQX/ScLIinPMZcPGFiEb9LOfFVuqVOxr7lA9VwOL1M6yA5uloqZiZkwB725hAp2M/U
 WcemV62gKqjfYqnBuhnj6pKUwvivLdS8ayh7f/miObTT05Xk/AIxc9lOej008asS3lGbyiiL1FC
 008PDMPLVM7V427ppvPnRItpNiJDH7paIcw31IRo0SoIsKsdG/R0IPaxv+CZPYm3KrOkzq4nHlY
 QvOimKk7GHkbJKqD9sfMwhclXJMRSTojA46Myiz0GnKYMUqRD3r6VoDLRHVbkj6P5bnzEJeE7Eu
 yB4MzRelHYntzkw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: tOmb8XcBDrKTyfxErNRj_sVBWbaohrUU
X-Proofpoint-GUID: tOmb8XcBDrKTyfxErNRj_sVBWbaohrUU
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a69ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MpW9BNkUf3hr-pSqHTMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX86bnizG8her8
 JNyJoKHjm9QFCdsBY/1ZoAlnjqAS1Ty4lEDUFtIpqNJ9dqgO7EVLujRcJl0LDVwqKiucMZePRvS
 FK+bKE6gwVv5UrG/xytDcq4q+gX8yW2QqYE8rYXW9/6bxR6oulJHGjXmG4N42msUS1ownsEiCnY
 Zmo3Jf1b+oZ2K+5IjhN+iv3fVHw4Ay0JtIK1M91AXuRnUH1hlxHZX572DSgHASzV5xz49Jqq1e/
 +D8igpCqJb24FdLxTQPYlUIT1MWaxp3BZGQ995glqrOaxiPKQNiwP4TzSuY5Nyw9jXMZf1bdl8p
 XsZ4ej7of7mq67Gupm5JWDpe5XBqD3oLqAgaHrxhUQFzNL5DSjlhgEL0wPy4Aeu02L3bWw9hpg2
 BdMiyANqTMJfGBk2aOtxI5JpZLOPdVAnqf48UHZS2Pq8w7dxOl+1pk3d7qx1pdr0ZxuwcyK4u5S
 erobri1t0rIGpYIRreg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ls2x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
index b475dd27b7af94a22537f1000e95606774d6c7f2..217a55d7d90b2e515ef33e9014263958d9258b00 100644
--- a/drivers/i2c/busses/i2c-ls2x.c
+++ b/drivers/i2c/busses/i2c-ls2x.c
@@ -312,7 +312,7 @@ static int ls2x_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->algo = &ls2x_i2c_algo;
 	adap->timeout = msecs_to_jiffies(100);
-	device_set_node(&adap->dev, dev_fwnode(dev));
+	i2c_adapter_set_node(adap, dev_fwnode(dev));
 	i2c_set_adapdata(adap, priv);
 	strscpy(adap->name, pdev->name, sizeof(adap->name));
 	init_completion(&priv->cmd_complete);

-- 
2.47.3


