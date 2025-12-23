Return-Path: <linux-i2c+bounces-14711-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 020CFCD8C37
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4B463067596
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46ECC352942;
	Tue, 23 Dec 2025 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pogOhgER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UJUDV1Ug"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A30F3502B6
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484324; cv=none; b=bBTjF0TIvUtuOv2ump44pbIlmE7KyZZ1QpEA7bI2mGZw9rVMayfCAL+M1zU4QP0eQOLNFLMByqW+hQyv0au3uOtus6koSxlG0AENeo4pMbpU/DZhuCNUsS7OrU99fl9A2AwgMIfVmxVExXkR60G3haXPh8zEIz7SvoGVGkj3ft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484324; c=relaxed/simple;
	bh=Kz3aoETjpXt/sy8S8XSk2Nfc0c3D2LQVFEQrK7qt+cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pMSdfbsJNGAsGErssLTjhSAtN4Li1+kcUTZa8Agyi05RNBt1smguXZPjL1I97MsruE0KH4ODA9vtr7jq42zKYrBrZP2n6R4NprU2JAZ/1uiy7TD7TW1vAStAeLYCVOnhAPbqOYCKejix908PB4mq3tVAFXpbiU5H1GKPAYVedJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pogOhgER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UJUDV1Ug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3URME1356364
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=; b=pogOhgERHMDldIkt
	KAhEDEfQfbo81lUnBP+JJYv8YmjHQu3ASOwq2syL8tnlHWf7xY9raerg4qvN4u7F
	jQ+T2OdTMuBz2x1zwTmH6s2kkqeXBbPOBTpQ+nOlPO4h+WI6sX0xZIA/AuW9uYNe
	opgpoMkieUBaqC4C5mFZ/m7bXyfvWemFDSKuB/XXQLoEqeCBLJagRawrw1rAtZFA
	GxaQF43ozUaaNu3B3GOrAS4DKMVArFToRyCwSd+Fcr6w31/mIPZg2koLqiuDxo1a
	xJ1P13mIpYGxOwoYb01spCOOFodqQZJgL3wKDyEMZrc4Gk2bdVwYIb3rpeBzy9W1
	akZw0g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2svc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a5dba954so113269141cf.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484319; x=1767089119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=UJUDV1UgBQ5isXWEmji8DCloAcT4TYIQXweUFQlIzp1i9aO3FsaPwjh/QUMQLjgLzF
         rDbqZCQ683J7PZCgeXE/DaOxwz36fppVtGTO/kJOO470Wy4Y18mO0rVvgEjXiYpqHWxe
         bRb/SzVVboBQTARqVdhmm/dEST4pRAsfd37HAfLWJIWCcEGirOHNyMvfve9hMKGgAp7r
         /kPOKuciUgSsy7ymVyMt0TOj6KtU9A6i9p5OJo7NzVLFqlFQD6kuUiA6Fdqjq5dZCXAW
         Kfu/RjVV91yvIptWK4iTDudNbPDq3qKIwbkw74FEIgbuO7Gw3ghuA7UkMGNrHC9LLLSR
         QoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484319; x=1767089119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jUjtAsv0D/nDX9g0K0Dow7TqBy7ZhnMWXpaEBz4vKwg=;
        b=XIwNtqyilKMoBsiSR9kgt8Z2ND3T3oF6VRf70KNtmnFIEhm9EXawxa2omdI1LRd+H6
         CO5Zj4vm0qKJSLS4elZKbp4d2HWznG7hFj/y8qRpRY7fwfSvWZmUSauiKqWU3TYSOXdt
         Ur/kPgkucjczKwJn/dh7He0Z3iAPOBtXSgli7ijjPN9E+FvfPsJQ/OreVdx9jswKkPIw
         FXtM3julVgw8iezIDUJpwmtqiADDcP3u95mZ8/DJ0CQG/OfntJf8ZB5f9bZ+O5Gsa9HA
         Q0vGQMCZHF1C+zNgehuscn4jNzUmIOxDd4jmlSspOOle3ZQ1FPLMVIS6ba7UqgyYtm0K
         hGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvK8zufHbfRQnu+vDofxv6t5wOqIoSKcGeYBFQqJwer/NxycXR/c8MPdkIK1MWj99inGSgf7JcWb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAV/IMw/9IAJg9shPql+fNhbGOgTO/03keFlkoyHfMkN8ViBvk
	sARa8KH6JunVY0zx0Ks6gAdFkGQL7mU9dKnK8VR+sdztpHUTogGgVHYR53uq6HR18yNELIfewLF
	eBfcueeI85HpHElmfqhrTkKeNJLwG5Gr4AH0BH6eFsUx7AoPtp2U9+rXjDNBzhrc=
X-Gm-Gg: AY/fxX6N4S+ULmOSbxcUHI/IPNoV0EMu4Y41QiCHm2ND81jY1qF47Y3/R5akgDdDx+c
	4l85B9mcHij8m+wOmVCqRGUEBhoOLQUKaCdGAigiyvngMTiJkUEMNNBMB+bOn0+OhpB9b2/TuxW
	c1XxBgXvE3QUjcC1pu7mzyAeiaRpXhIW6VFjikCfYRSxgpbmT/FhIdZ4mVBhV1lAylmym+aK2ua
	kFs/QkmarJ0NUIgM9SKW+dvRx02hxomp4BrO/37uqpbq3gNlq19mcK9sX2BaWqNMSTxMpVtBp7v
	ahC2QTCMmlx9fev919lDAPuXZdh6VpTad2dMwMGuQ3iFVyuT7wS7kLCkqCIm164UtvxvjFFiBF+
	qhIGddTWmIRHtce9eDTekdHtcwAtrOtjazxysQDY=
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198668941cf.35.1766484319011;
        Tue, 23 Dec 2025 02:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IForFIDGNQ9njlDz41j98dh92a2O0U2qbhfYixKg3bKX3y+MnR1F9NI8gPqNhBANugj/T2Qbg==
X-Received: by 2002:a05:622a:24f:b0:4f1:ddda:9a26 with SMTP id d75a77b69052e-4f4abd122a3mr198668581cf.35.1766484318613;
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:49 +0100
Subject: [PATCH 11/12] i2c: nomadik: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kz3aoETjpXt/sy8S8XSk2Nfc0c3D2LQVFEQrK7qt+cA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEH8yQsYMAv6ooCMosuFd7IzlZjLcxciyOf
 UQM5iCbkxyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 wwKlD/9mCvI2m04rBS/yTO76hF7LJmURZqComcwLRaJTxRw5Kj2GccDWLLba9W/EeWkgaY878dh
 mlgpACmVVjIj/prfsLX7VwnEpPwe4rki5hI3MGdAWPuOBB38zZjTUzpYhocg1jLTgeQGLQxmD2q
 CV4Uj9tLsSN03FmctRiu++tKRNFBOXMsa9K2Z3RAKe13mQwAxnJ5+8Z8HSgmA/JwZZqx1jRM8Qn
 bkWBgiK3t8ow0wq/mNyfLGgDNJc62hmdViGPZLJu412tx2uphiRhRTDobCLSQ9SZcJl5pGKTGYQ
 mHi80IJwOzRfDVKh+DstwfULzzMx4mgWRYr2BY+ktS3eabzeXRUE9aOQTJXFHqfqWILuhuWh/Tk
 PKLcv6/sCH659tOUBfTrwdR85pZbH1LWlXu6e0T7R3wv0TShScYr0aKotIF1j566ak4aqWasiT+
 sC4scVMWKAN4xMEFEaCIRB8Evbqcmd828SbMITuSWbD36vA727i1aE0Oy3V+4yX2Pe3jshJeQEe
 seOtLCdT9PrqO+tbQNx7JsOdrkZk54nPY6VxGMS+AUwQVbaFwbQR/kFLjgPXNFXdtEF0gTLW+fq
 0IaCwqUzHvnG6VJ1Gjbu8FYvHGsSYI0nbDwBTZkeLnbv6lKgiBUMxVS7r3oojb1ZN3OvLhNfYZs
 l4zyIT96c4hbKgA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fl3UdHg47iXPHGXvGoelcLVLSTh6DfQT
X-Proofpoint-ORIG-GUID: fl3UdHg47iXPHGXvGoelcLVLSTh6DfQT
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a695f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIHrhau139UvCPJ7cvIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/WL+2H1h8nQe
 /4wH7Kw4idfYSjfeUunO5dl0LRjq2xi3UXQvnTM2V2aSrhII/MyHM4HyCf1lglnieD7jI9tWHvO
 YeUqm+Qpvhc/jjBGEmnQOrncM70V6MbIqRMXumf5sgaFn3F+SixidOmIhgLv1S2WDjYAKI+qino
 cJ3h0EYaAJJBgo0dxCGULmxgR3JvalzXmY9nrjAz//WFEgSKewzsvh5K7r81N97xogZQHt/R4LB
 mbJ2ZYsPCY7+LVTlOXfw6TPs1drq+TmxjAMNgZrfKZtsQTBiaAl/YtEF+TxqrSRQPeqLcMvoeAk
 En2DFIJVUnu+M1Bhn9JXqpsh2iLWDpUutIeeedEXka2KxNf7Ua7lq8tc/6yHHMtDJsQ4+97Ywx+
 DXUkCt07UISYp33ZDlG2uru4h0Fg4HJS6VwCdLP0uPd72SsxFL3ZXkfzvhCugcPh4DaAeg9Jw7F
 XcecXMg0kx62n7SUzJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 19b648fc094d9748a0cce4e35f350da35ee25505..133ce90941ed596ba2e6dc2d9b368cebe7ace3a3 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1147,8 +1147,8 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	init_hw(priv);
 
 	adap = &priv->adap;
-	adap->dev.of_node = np;
-	adap->dev.parent = dev;
+	adap->of_node = np;
+	adap->parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;

-- 
2.47.3


