Return-Path: <linux-i2c+bounces-14710-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B058CD8DB7
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9B65B3011347
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7136B35292A;
	Tue, 23 Dec 2025 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8SyapOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyvQZPJ3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D234EEF3
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484323; cv=none; b=G2u7/UmBG3KJHQlKhptSO1BS/TzfGkCiVWK9ebkHZAQFy808RzNA8q84iGxYCil+OKo9nzd1wKm2rSXy+ydSpCfx7lWYgKRtWlSfyRkRFCMiC4THed64z5sH5rRr0TyxExGg61bnvSS2c7ZmcEifDHUxVP25fux+aHxCyuRaug0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484323; c=relaxed/simple;
	bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uS5joqZyNfeMXvtmFwa+fv/pVX5nOC4lXGQxOEPDTOa9wQCYoBR58KFQFOrGTne+pisy1Yqb23HHlEAO2ZoG8CDtg8ztRm02XfZDeeS99MgbLRHxTbi9VmWtE+o2PBlbCp3CAqGjtHuK13zPgKbeet1H1TT5Z5q6y2ezudK17Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8SyapOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyvQZPJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN36Fk92199471
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=M8SyapOHuaKCmK6g
	DClYf9gv36ai/lBT6210yhTCG69DPzfV4PSPqoPtoAaH98/gPeppl/Els9g0sHu4
	dH3FiE7x3fAWRInzkFlJBSV461c2/rxqCsGSU329wslt4kBl970M/v5mPRadGxAw
	ZK5sWyqlaE8HNx9yFQKpQs+XAftrIBkQTy/sfm3jkwMePKoooxVtkMLdpw/wDB3j
	Tx/wKhUja8eC5Bb6/z/egevEOpgzblyWPRAcH1PVM2v/SlLeVRefgmPEwf1ifi62
	C+6no1YsDgwrvdY9aaF7Vt7ALSZFwNffg88Czh5lCnlgCqz40Nm/8svU8ItoGh2Z
	W1cJAw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwurs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a360b8086so113408926d6.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484318; x=1767089118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=VyvQZPJ3EMDFyBFtziiLlFD10GgfW0BXJEfAtQSH6S3XUsW7L32jMKIoEu+/fayIQc
         U2cs8D2by7IqJwTZHQ3aYGU0Q4aCiK2t9KgnP1lw6JITELgiF2F2fVA5szGZ/QJcNGN/
         NJZTB0oSywzLI7q2eKvm8gswfcE38Qrgn9u3wlKxjDZsvVNG/F1zoj1sivjYthFyIT4+
         UBsrEi8fJGwXi4yHgm5ABNe+yx+q42PyDbhqxQkcLxHlY4BQSfDZW71mzyBfN5TxLl1U
         KxTEouFLM9UMLIxmHA7VPfCR/Zvj0/+2RSgTUa7D34gJYaBOQTEmBVOPPCk5TC9PsZ3u
         nG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484318; x=1767089118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=TTWZ+jLLmQAm3sInSke4qUzw6Q7Eh0ibdKFD0ptvCbqGzOWCIjwqJBwgie6QVeqyU1
         +WISKJ3RZj0SvCekwOnda2N2sIWYzPNtrhpVs4ci4zkWnDLaMj7NQbWQ+TPhAW105DS0
         MA4kJV7HQxXmiVT6KPzybgAXLQB4H4tSX7lZ0Na4RhAsIDrTxjHnpp8uvyTXIPPeBsjH
         Z4wbr4S1RjZZOLOqq76ah8ppGVBluCQLpd1zFcHAzGQDLMuPY9wBRr/AHF4Cd4fG8kui
         pa0YOcqUBwA8LAR29/XMHGBXX3gBLF22wk+GLd22GooXSK43DtnBZD1b4tQPVnGNA4Df
         YFbg==
X-Forwarded-Encrypted: i=1; AJvYcCUvTCf8jTSRx8U7pnSLoJrDmwXw2UJSyIFn+SdA6Lr8NcBGgSqUJ9PE9fq988MMTJNTci922p0WDgM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv2gvsWvzWYhMRX351KpgVaJJmzc2pan0L/098rqbRS630KAqK
	vfBp6iqrmnbCkj0u99dLQ7BOtaKQa5OHRE+ArUean5Q2v2gMJGe0Aq6tVHYLHZ8PsEPwv8uZkr0
	naUBVaP3zUQUQbVqEQbFFitsV7DBDSQ5A3VQW8zIQ5VXyZ4a9r+S3aNKajot/jCo=
X-Gm-Gg: AY/fxX4K6kjCpEEqNgsoLL1ntKT3C11ojBaqc8Wuv6LmkhEGJKcV3mTFNHrGXvcPf5s
	AJPB0dkILsFm9b4kORKD88Ykbmo8TduzXJEhh2gonqN1uFteNNIxLn8yQgDUd+sXzkeco18ZtDN
	xQu1ipk1rsMGmpvRtS2SAhtjlIb2wR41Wp0cTncRC9340s+vYX2xsCre7hu6roXTPcz2/8SoAmo
	adLuJP0ERYVZHuIKxVpQEWux2xrvRSFqyjO1DOyp587yGHJFHT9gc/ZAtReE8UvBzEr5QD7FeSj
	IfT0vbbMQgAkGPxILzqsWKKL+8Nb2LzCxEFjJzpWQuzy3o+MZAD/nt2PgTthJeq/HJnF3dOVkA9
	ZclpxYGEh96m5Lcu2SpSj6odtF/oiR72WOgT/bMM=
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179521cf.0.1766484317234;
        Tue, 23 Dec 2025 02:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyr+cM52EnsiY9X9JwqntnVrF5BgN6w1ESxc7f6rP9YwP41RmdhZKCpIzJx2dLAd8JqdWN6w==
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179071cf.0.1766484316736;
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:48 +0100
Subject: [PATCH 10/12] i2c: gpio: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-10-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEeUL/Q15FR1biYp9tcKOXI8bceDaDmm4nY
 pSDfzSVR1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 w5H7D/9X5cvGLgf2JsLNSOAwLw9m6VU91GHNuXNctR1mCyxTnB1fkm7XnMj0pPmDNHVPUKlxZXy
 +y2zTwPZV/WGJitWyRS/ppkDKVJhOAhqmd8/266hcra08tpgC6E9U7V7nKET2Q2g7b8ZoLc8CpZ
 mPy0wVx57FkzZe1y5sVSfkGVMFxQ3wnALDH1JkHHgzAwfLt6HArLLSL8O5d0qbxXdAR1+JT57Eg
 Sn0RwrdFX39zMO6h4kCG0SoDeH1nXAOQ6TzzcUxvq6kk8ySWqHCnoFfdr4A6o9+ELVCAGDD7zb5
 DWkHQum7SRuPbiOQvEvp/cs4ym+eCOB9MhsWnJbvImHjaxR3v2eXwEVwpwTV8M3GxkP6tooqRT8
 7iEeJaAoY1NzmtTdGoaX+6w12Fs11xnwTsO078o2mL0o78A1kcmhZWJKO3O3zpZTfpHpfERG2Yq
 brr0oyrgv+7HmaEwzDYh1lOW1+6gPN2nubx3213yEXiDOwMLHFY9ESAUJLLBy5iBWfbgrmwiGLd
 aLiaZXAzAtbFj5x4jJ7I0/SewRlt9itvnAlHyKMFVw+IsofVej07D4ZVwAP3AZDuf7+DOL6Dbtm
 Dp6s2jvv0ty9RTnVGoeSbXXoT/L+yuOuoJmSs6lsjxNpSCOTHtP81AacY0NC59lU5KiRClUdsra
 i6GRY6JVgaFIeXQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a695e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX+eBoRo/k/jhp
 sdjpQq1/4q1Lhms/yMCmeFi4AfYZEqwVKO21rnPJ9qLT+K0kIpVDQDAJA1lcdrOwNSuQxOtRb6l
 s5NxjccgG0MolrZZZ/wnZSM5WzQTh52qfzicpSr7FA0JqESHgAncVx4mneh1NyLxVKTRLWzys7O
 Cjxt8PKYp8dgMPyKKPl/to2LN3GdhdrWMWAYZL3k18Nby+hTSHBibbMhRnf0YotmZ6HqDvR9afg
 XHyE08FTiB0TKAHDjMtOAxMAlR94WFwciVjXo4Fhoo8JG+Dp3eyl+uLwji9mtzTxZlFcda1863o
 030b7EWjpaVYiv0L+oro5y0vmMwncRtQlG95wI14UxnlEK71uZJRKKk6YpoP7blNZhoW0Szb4fg
 jLwtFRs0DWCiA6e37oxEI29EYFb91LSquSUVQvyu7lg0lctqdDKcdsdIqqow7t2BoLrJPf4u6jT
 QxTMMQO2n1wUQYlTJ3Q==
X-Proofpoint-GUID: ighWLUzC16gEWtfLcbFX3Dj8I4mI6Ehb
X-Proofpoint-ORIG-GUID: ighWLUzC16gEWtfLcbFX3Dj8I4mI6Ehb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..78f8bc2525be6d1fd9a7907df4c253f33bbec9f0 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -425,7 +425,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	device_set_node(&adap->dev, fwnode);
 
 	adap->nr = pdev->id;

-- 
2.47.3


