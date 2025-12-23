Return-Path: <linux-i2c+bounces-14702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DFCD8C70
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76B633077610
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC2834CFBB;
	Tue, 23 Dec 2025 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pajerv1l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DWFYLRS0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EBF34C124
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484303; cv=none; b=m44t9Hgjq163gbNzpWOPjf95N8sUAL2qeYHvRTCaSUynjh8ZBGK+HzyzmCXVjuAt7cMF8byrtiP4PYdmHR6hGVKeFLRRqF7TnNmPr/cDifX58KaDLuVFDJZWwq9vB76Fw0eV3ZfBBNkUFVdyDaoTuNlg4W9mj1IUMfFyjanrbRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484303; c=relaxed/simple;
	bh=hf4+ULdK6Tdx70XShge2syYlIjQYGUsU9b67SniGPyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GiKilNy8qJgdk60mikEXEV5weVzoAyx+dSKJb7HIXIMoYKjdLJZTgL6do7AIwl1iAK6PxogvcRxbbBhogQjZzvP1Jwvi+40Z9lqAGT8iXIvdg/j+kZIa5hMfZnmWD3CWzXwfm3pvKg6agAEGe6HDA5JsFqIM0BUzhCVBYSk18e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pajerv1l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DWFYLRS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9prj81889146
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=; b=pajerv1lDNcrq7oF
	mQmcbA7QamlpI260lXdeMqWb5HuiGh8vx2uVdNJXoeJPkXbo/80d4tNJxKyqiGE+
	G8zAnP+XVLv+veOTawhxAaR/oat8TAB41Xd6WtOxJJifr/PVcCocFulHrAcoCFsr
	AQd3SVwAhK4FRc7quYsHVRgdxtfJrZuMc1SmBUsXBV59XehNxvWPgKkHhzP5MrCo
	6piL9Dfm3vOgSin59nFrOR5NwVn28Lustl+9xFSDanXLDZ/rzZDsW2qFLjRxgFn8
	dr+uwvgTiF5wlSvk/3O2qy1OoVE+R47c5OQ9vb0qoNTpS65ZXGBcO9sGIMSbtazj
	iIvkzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak51d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4ab58098eso105479741cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484300; x=1767089100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=;
        b=DWFYLRS0DiwIc5o0oHGcz++7IcQtCPdE5H8qnf/3RQX3kF51iuzpEr8oBnIQ31UZkF
         czfMMl7mRTZDa2MI9yuzk3j+phZfHt4z7QIZzDb9Vol2TS9eBd94rouXxuSf4rayxTJ4
         +ENA5VQ9aYs27xmNRuU9xwm/cO/YqKK2YDvRXNilwOMg7gG6soUJoT+JkXT2y1Lv0y/h
         NwPDbrlagy/doMDTvRYVxjYjKjhfy6e46dLMBpBQe6I8Sfmi1ilyiWP/CrMC79SQDRfG
         2qhGlXU9V/uMvzsMukjappnEfnq5yr5HjNHIXSN5yMxN1kLepgqtAK4PU3cwELCrR9Yc
         /fDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484300; x=1767089100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V05C6SXh9ijrxUyLg6sePAdo+myi6IwcToMWFCJUdZQ=;
        b=IBnzRPFxMGgdl2b6PhkrTZ76MDajjZTDK8cvooKpLV7zqVbU+h4yFoapoZu7wKscx2
         yeE8G5VHa2iXhsiLKlCjyUZP1MyJtXrLz0JwzZ5jzRLs9Po8JJqoWQfIqIqzOFvnyS/F
         XsMGeY7iCghpebERzSng4ByAJG877C7HG8ItS3G5vlT70+O8fzfIq2AED5I/otI2U27D
         Hv7BB6ezcB96FS5xR1y9sFkFeBpFhiEzwia+7zbjskWeXkPPX6RQbAucZyAlGa5xfZFG
         o1uBfHILLEKrnrQ0KgsrzC+YFeT8WdWoVmSNIDMOqEn+pxk00XQ5lHwLoYA84xCMbh7E
         hXoQ==
X-Forwarded-Encrypted: i=1; AJvYcCURGTii/BPPB8W6CwXIdE9K0Qtr7c2o5FJYxJIu7Ucd2R2oVkIPoLtQRjwxj6kri8NXlAsbfBzcowo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY3mG4/QqIZkRnDXJIJU6xmCSzDc20xdC0SnELXFW71EwRoe0A
	EJvwZnVZccN5lQRmjeeP+9SZzv8Tvtdl9kGJSwtgxZn1wqPo/BN3HtOJyUm9LmPUE0jO1St/5Kk
	ToKUbbqJap05U+v0SB0EKcZeaCacogwOgUzCGFE89pDKM4YS+LksB6A0UgcY5s88=
X-Gm-Gg: AY/fxX5jwJLRXcwCSXsfvJVq4BPTIUMeOSTPVrb0GlYdsVZXvw13MbLuVKtrISsMsqx
	Xy3CWmZV9vufFqf8Ap/szUKDbFuKMLSi5saP4Lnk/R/3enC2rHhVOfsFymcP38dSOsrlj8xZCSv
	7GBTJ1lqbiJ4U0TFXCSwSUfo+xAt8lc9xsaZmIO8QrABVERElfAmoTN+ABXKMaxk4UphPt0SFMt
	mkVOhWW+IFsikDxMyJxgLOp48YAIbpXQZbGYGxq1ifBe7uCRD3IaAmmUQR3r3ozS6b6X837illK
	8UESqfFALsHhb6qJLfkYvifrROG/crZZIHQ7EvJFVF+XC9g5bkDgLjo1cqsXyp1le3J9D2FUJJ4
	i2eXdmbCf6kbTWHtghDQsvGSa6gNmcpFxMO7J6A4=
X-Received: by 2002:a05:622a:1a9c:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f4abda6547mr210630321cf.66.1766484299965;
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqs8aoS5bfuwJD+WoHohzfrk6zAuOj6uBm6rrybCJgzMO87KV/ByX6nI9XDqN55s04/NcSkw==
X-Received: by 2002:a05:622a:1a9c:b0:4ee:208a:fbec with SMTP id d75a77b69052e-4f4abda6547mr210629761cf.66.1766484299529;
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:40 +0100
Subject: [PATCH 02/12] i2c: qcom-geni: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-2-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hf4+ULdK6Tdx70XShge2syYlIjQYGUsU9b67SniGPyE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk83XYxA2nG8trXqlh/POQctyaBd55aW/HEx
 yqR05jcKWWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPAAKCRAFnS7L/zaE
 w3K/D/9opRkZjX4lgmsOo1yyv8mXTtQbojGRw/+sWzvd3iklh7WtTGjjQw3irf5Q/NHiK0Ok7KC
 kTHtJHfu1jtbiCWCLHsJW2aprqmwxz0C3zjImvzFKUGd5EoTKhclKs6YpK6ejenbPt1crczvXsX
 DVbM0dp6qLrL83SuX7MnQ8ZWhYWn/pF233Q2eaDd/+QBVDVv3gck/FeJssLvB4N7h0CHawCHHEr
 GMGjxoeEVkiqR7aZITY5LorSFUmsIb3NTEUW3FVcWFpycxbRw3+p4wFQYDR1Ny7qGf2ILLmP/CJ
 U9LomEhmQZRkee/72jqKH8bo1FbfKP/P+VYyoUdTf4t9dOUL2U3LeMh485sQPqDTLq8Okh56v3s
 17XlETa8bmybd91T3pFrmxIV2mnuw7a1zsS5YVJwj6KqHK3T2ooXJwGCTBxcQCeWOdHttolsxuh
 puUqOv93aA/MSveDWf3ExFCRarP9b0NivMt85zgYH2M3WpsgSGYB/cAv2xSTgvWRw1FTwfaweW8
 ZacS/HhQPG3qxn2ZvGDzr/5ZHR65afrTsHquJQgEXAywgCExHGubbx+ijVtEDpPstDX36W2N6wm
 FRfjvhcCvUOisaTzzfyUkgcH50RcSIerJmDE+fwZ5XmXSwNOKtRL0ZivPRm8xYr+JtY7NIKtny4
 dfzPrDpz43UP7mw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX0aTFVcYNzvz+
 SeY20C9/P6SHkeZKa2Vvs1ex6ToR692ZO8OIeN1BXw6Y8hB1SSd5BfeuyOv4m0wGBorOBY/htcW
 CiXrBXM99FfIZAPg//+PAlWxJXTJC1ES1NpOPsee6nXPAdFI9ObUHU3sN5xND2kswIPYsogqt+S
 +Q/DkqgNd57jYIJfsSIc4oHMfpIf9bhDiHMS8223knKbatGcfydOFA2Qbmsd0/ZPTHvS/N84yhq
 eYTNjr1Iv+j0VUoPen2OXJ9FdUq9HSA2b+EeFtSDhUv4dQBIXtKIKdjN2AQrFPWItP7Wn+b6ig4
 e/G0IZWG0w5NKTjCVkNhojelSzs6l1xU23t/EHEN87emnNe5tLMttMkN2XVfWJyBWnmE5jt5Al8
 TtP36kUTUOi6y0oZXSBuF9PG1/xhdMubR36Ugt1OfjlcNptWarAakI4N2hJJz6lRG2tskQ/C2SN
 bwrGpV5QUOBFOXtn5ZA==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a694c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GyXxqrRC-9zytgsE6zAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5rNd69RGrEvyqv_tAQfxcYgsd0B3XHSm
X-Proofpoint-ORIG-GUID: 5rNd69RGrEvyqv_tAQfxcYgsd0B3XHSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 3a04016db2c3222cc6c91386f8904921014a3f90..389fa49f0ba7e657d97a94d9e27f5d916d1ffcf1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1038,8 +1038,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 				     "Request_irq failed: %d\n", gi2c->irq);
 
 	i2c_set_adapdata(&gi2c->adap, gi2c);
-	gi2c->adap.dev.parent = dev;
-	gi2c->adap.dev.of_node = dev->of_node;
+	gi2c->adap.parent = dev;
+	gi2c->adap.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");

-- 
2.47.3


