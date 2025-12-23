Return-Path: <linux-i2c+bounces-14695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4AACD8BAF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3AA33095333
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A229733B96B;
	Tue, 23 Dec 2025 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otwKbrxf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fg2mPTNx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339D0337102
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484183; cv=none; b=I+IrTz6WJ8us9Dz6SslWrrxhELeRrJ7E6r/mVUiCDm6Cc4cI28Bq+3AirsONqGkNsfsxAhnUG5pZlyQkAgviPxi82X68yxFzZ0b7vLjttw4paqs/nzp4s+TxFCajatVdpYverwTI0fc1ZDNW3be5DYHtW33Sr1AHuvYj5cBhdQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484183; c=relaxed/simple;
	bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoZ9XYAMJfrtf00dMHaJFb8FNvviTqmvKqkmlVn2M2y/tljRT0olMJAv4Xpl610ypbYJdUN+93itljL840zwsBTqVcHfP3CPDr7cikYLEz53qshaYm3t45ea2gUWzMx3d9gUbhoPyUEUXA1clJNhfQ+LVVb/Sb1cN0cEzlQViPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otwKbrxf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fg2mPTNx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3jDqh1358212
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=; b=otwKbrxfnL1TdBVC
	6WV4xwy/B/sUn11hn2Mc7GzTZGP3XqRyJ5xnM73dU14UKE6XUzKF6qaOA7b8UEXK
	wSt9BHWtZNlMiMqr+qTAO3he9wMSD+YQNzdxZer8gA15KLv+c4456bAg/IZZfHnr
	Fq8YbT3WD3s5fO7LpO67NGCN5mpvRZwDQIXSjD0Z/B5cvp1Ygi2DcajaNNdPYoE7
	5nvRXV96tuFd5JVvItjtJQQkmzvkUIA2XJGDrN4a7u7Q/dHDPv6JpY7FcQALcT5B
	JPJ8jK7uAUGPWRb6dmtSPb3MEN2s3nBA0y9pYNYuInrMOwwsM2aK1Y+nLM+Pok7P
	IYkqmw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2skx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so95800351cf.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484179; x=1767088979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=Fg2mPTNxDl4ixQ2hlJcQ8JIc80puml6XZ55HrbCX/ddwUz1w0F52l+QHBNHt4UFwty
         3Ml/S+Lo9KIJGceJdvnjPHS01Zg6WDjTcLlsqswxapIWZH1Hc9OgeWRSBMsdrK03rZPV
         6DlXmnC+eI8ZyTLeOixSilDgVsw/1jf/VmRXhZJlA5YSlWrqtIC4zjxhO7lXKGkCAKju
         PMn9enEytrNWy6tBDzSdhbQl/o5ZFuE637Nb4APu6oHAKKM7ZIpUnur9oHtQg7Hy5PD2
         9TfqOsx36/FqsDHq4n7DCVX+2hGkvnXEsuWv9WtYdXU+siRCXYcBYZkb+Y7Pn5hOts5J
         r/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484179; x=1767088979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r9uATJ82hYYI1P1Ta5M3mFlNuQ1YfP5cbyb+2iRgAqk=;
        b=PqaOXdOxipYv8ptKtB15sFF+cj/r1C5iGn9Nklk7D1i7AEAioeow8VSngCggt3jNyc
         LSj/C+Yu2FOCkJPteRxeW2fBmD9Pmq6drMTrCkl3bugDJ6QqAKtJN8HGcE3/b+/n52YS
         ARO+ZoLXNal3AOSVk0xR5ZtPKs6YObLSozQCQgg/wSwzh5lH/TH58G3im+kZwBJhLAaY
         ri91+B8T13HTYYFZKFH/UlPQfOxDxB+h2k0IoK4heAVmSLX1xwKoK3W93gEelAsMeDjf
         o1rmnOtEa+IS/3Wk+dRXTC/15G1kQLXQ8Mx3ty+3IVhlY3LHZQ4gbBUOcTD3jPGvT0W9
         sZGw==
X-Gm-Message-State: AOJu0YxiquQ+IGD3nMfRVvUOQF8IO/eOhCNq5ioRkJI96ZDBwjKEiV6n
	PcY7x00OlGTdO9+qMIdTVwhHtON8or6mneC0heyON7s01fG2qB3QxlZc/aHR2iR7ClnZ8T6Xdbc
	RWCNq/+RzxDtFu7iOQuSIsMxz65lM6gjpRYYkJ/p8e4yIzBZEuxQR5G25EUZyvoY=
X-Gm-Gg: AY/fxX5Xdyvzzrh8I4WCckpByNgbNoUcRWodMuRGUMW/raz226LsEvDPXGZu2AV8sqj
	RG0aPH3BAn5kTKTvhPr9N6ijezIUMYbSERT4qNxbcQ652apORdp6IA6zJ6VdQgFuIXq4M0IhErl
	CvWqsE9pM1swtCVn4Nvb+cRWPPhLkdiQEIfgVcwkrzAsptyHb65bXed+ARXfLQ71DKkybFCPV24
	A40ggqoY4WQWrV2cg6GJlNy+710vFA1FOx0BiuQC/oePvhV1m0BM+Nt6SLoQ1QLW+pR37sZ0e5i
	T6VjJEJ6m1CdRDuKYU95PVtrzGuEQ/Z/GUOZN/i+nfaxxo1nQykvxcyrBDdWQLlo8x5mPeMKXvN
	fvjEY3Fuir7pI+DbMF+0hCYO1aDuV6xGDmkMOIQ==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr222266301cf.63.1766484178978;
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYXi/jHhONsfaUYfyqVZi+bmTDlvcyn169B42+SyCfOiYjgT7JBB+81IGnemThpNA20OAzag==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id d75a77b69052e-4f4abdbe4c5mr222266011cf.63.1766484178619;
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:31 +0100
Subject: [PATCH 09/12] i2c: owl: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-9-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+nrztrv3eun2Q963Kt+vOIIxHNHM2moiogYKDHo0wls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjAhdbFloNWEKAbQOt2D2f5/84o4352KnQVG
 qC6sU/ezyyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowAAKCRAFnS7L/zaE
 w7epD/9rDuuAuMrijZz+HznnGHSdCAeNvsyqHlql+M1L3UpFuJyrk4GpvYgN1asIGCxHuiIFf1f
 bXtwKF9d3aIJdQVpRiUqimlYz2hnFRxxS75WMWMzENRiho/uW/5Eqt+0cy2tDr/0s5hx0L/A0su
 +GlAUQJjYyIMHUuHqFGK5mnOcmufBxbSXsae+2b0qsOkJufCrsrrSJYqKOp1taATIiBemTJZBpU
 VxbKBW0hXg0LR1fhLovLl1CVuOgukNLNVQqMjcTwe7GqYQ978CIp9weEtETbxvuRelLQJynHcSZ
 KL/6FadBg1u2JjG6wfiUDTij0xfm+4hCrKIkVPrqlxOSOMGUpLzefUV0l/maqjvOgQ0LppSNR5X
 A934pNHJp/+0V5FSaHBftfwPWbxFQXdbRFgAwfkGkhposEp+iccTtfHyhJXgYcCvmoMLAn7/cfL
 NAZQ46Hi9rWpzZm5iYEHBL+Bf2/h9OLBSHlpbfWDLqxzMeGEI4hx1bLS7mba2o1qCM/5rln6Gj6
 mcT0wSiIUGkhRD8ScfYZWZDeU5m/ZMu7UdZko7fXjAuwqBiTEBJssvjkaKzVeh+47B/R5rCi5tX
 6RP3KTEzVW0U0Mrk/v1FkjrmB+jDbxnBnhc2dGQqllDFHvfAFCbO1KYYTpv+84WgRnGB1qad/uE
 eSV/XsXnlHU5OnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: WY2ontFrMMVPJlmfQ8LZIt8G4mxBxeX1
X-Proofpoint-ORIG-GUID: WY2ontFrMMVPJlmfQ8LZIt8G4mxBxeX1
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a68d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=td_-LIo_6SHiI0BopBAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXyqS8veYcGimU
 1KoOQcI7i0izJyDaAIPZWvMoK/I/h35aclcA/HrnV8+WfmbCIpGrrOMuKPBffIwsNQxQPcIPTsz
 V+79YfhYcxtpUifJj8rZgXcg6OAeWpoQVtofjUmufcxIJ9Whc+bMNY8mSAIyy7HAVYhQYtf2JXn
 9qed/ihDARfEvuBoLXLV6Dou9OSZt/lPYdSBhQBKHN5JpQZCfrGPJ7/CUj8fAGFiYtmgrz9k2YO
 O2QQqvotGTr8IbhGXoy+nb4Z5EX5CS3v04w4G4LWNNczxkx3U3K/pFRfq3yocePH4la+bKOaQEp
 Z+gHuLxdtgKmTivBOfaFAdHa8dSvdOIKMc/0jBDpN9Ktnwuh3t4FKc7UyoeGSP5cVFRqQxSZDRv
 rpQByTOybuJHM43Z8M+E2eN22oJp/l9tfznVSncedfjfX7RqCV8lXdLlMcFTmX0GzNWWAe+7mjs
 3SzfDeE2//5dVSCIvlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-owl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
index 84a195e358866d693fb6d435a5beaaee640fd2e2..17718f15a0f1fd238bb4a6f23dbb4f9696969ed5 100644
--- a/drivers/i2c/busses/i2c-owl.c
+++ b/drivers/i2c/busses/i2c-owl.c
@@ -241,7 +241,7 @@ static int owl_i2c_check_bus_busy(struct i2c_adapter *adap)
 	timeout = jiffies + OWL_I2C_TIMEOUT;
 	while (readl(i2c_dev->base + OWL_I2C_REG_STAT) & OWL_I2C_STAT_BBB) {
 		if (time_after(jiffies, timeout)) {
-			dev_err(&adap->dev, "Bus busy timeout\n");
+			i2c_err(adap, "Bus busy timeout\n");
 			return -ETIMEDOUT;
 		}
 	}
@@ -383,7 +383,7 @@ static int owl_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	spin_lock_irqsave(&i2c_dev->lock, flags);
 
 	if (ret) {
-		dev_err(&adap->dev, "Transaction timed out\n");
+		i2c_err(adap, "Transaction timed out\n");
 		/* Send stop condition and release the bus */
 		owl_i2c_update_reg(i2c_dev->base + OWL_I2C_REG_CTL,
 				   OWL_I2C_CTL_GBCC_STOP | OWL_I2C_CTL_RB,

-- 
2.47.3


