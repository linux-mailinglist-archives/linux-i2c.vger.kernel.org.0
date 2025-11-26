Return-Path: <linux-i2c+bounces-14290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C4CC8B6C6
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 19:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 17AFD35895D
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2C7312829;
	Wed, 26 Nov 2025 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3gC4FKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pc7GGetG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16273126B1
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181388; cv=none; b=QKAYM4jyS/Dbkk00C0Q88+EBevgA+wzmQjtSnoEoVvKYHwdSZeDlCYWt9rG63LuNC/fE7GpHbjhFgpb+EpKNWOD/7z4AvWJ+sFFKyhFP/Z2F1WMTSq0hD6zsSalXXrAKUaEqdkIBWcRyrALrJIvDegEOty+cb0B2DVQLvtJvgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181388; c=relaxed/simple;
	bh=vwfiZ4bLwtpw5TOi9+RULxI2UWcZPIUJbyUFhsCi78M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aja8rxC9QVRN4ThDP6WdstPMsvJH6u0Maa8xq6OLEPAQnV+waOCYiLh8lasqffvzdiYg/eFN0daQruAicqvzJZUic9kWN8oDZvcR2zwjYE68zq31OP6yPygcRtJpjUY++++9jjjL/XRwYA8SjN1itIm1wgi2hS0j/lIndAZgm2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3gC4FKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pc7GGetG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQGCxpr2855082
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 18:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8
	036RW3n8=; b=O3gC4FKT/6ghTBqt89NGwUogfyeq72C795ge7u7OIMuKySooCwo
	IvDc+FUzhEHHRO7I41JHttbHTHQ0u4git87zBc2sShc1O+WhSyo062JM6/PUvO4G
	Itdh+GgvMfbfNq5zl6iHeAFJB/KjCHHKE9svvzs/q5tNRlMNGhZE1IrHT7tz21Sg
	LnRekNma5Z4Uqtn7OUGIWQKVPlEAjN9oSWH34XvK+rsBUhAO+EZdhqvEyUJSP/lV
	qEWV1fNO63n3c+rpVAZLl8seXY3NRV6bhn5ZrvHFdUhKmAdVPt/oDMPZf8sY9L0w
	I0phSscHwpG74j7Kfj0h70WcZloYOu3UxBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vh8byf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 18:23:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b286006ffaso3480985a.2
        for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 10:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181384; x=1764786184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8036RW3n8=;
        b=Pc7GGetGGRKEQVaBBdSevguoSaX+LQAZD2Kwq5nJOOichXmt6dQ2qTC49FJfh0TC0u
         xWOCcSIcEpafoxePDDcsq9aAZsZoxR8edKsL4scNJOHWFm6CVZLtB/2XyWFyaZBLfvxk
         yPv6B++wWCWxjUBr8DP+dS7XnLrLux09zorN/eV3U5aHYaHaT+G/GEYrvVAeBGPtNiWi
         K2a9HAatF1niCeufE/mlH1gQxlMrSm8Mn4K91uxub0tzZIe91XiYDW7NGv3nlvMFq4mQ
         8HBwPIf4p+lqJKn/tuLXVx4AjrdLq8MWMWU8gn7poHIeD9c3IzOsA9Vv6GCeu2G66BGr
         bO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181384; x=1764786184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8036RW3n8=;
        b=uDGsRbQJMPyrPPdnPIEIbrNbMbeDi/AJoI72GjRQPMYZDFffKaX2ZZyoCHfDzl6EkL
         sXGD9sPKgaQtPh6GpQP4htrbDowDc1gc1rYFda+KeLLheYmOHi/9CqK4DQUOduP6gp9e
         0PsaRz1BU25NO9dC6FLpGIEm1DyA+vbBSc78S9NLQOmrJ3W5NASPS8fWcO1am4fYTty+
         HqmOfU8iI5HtvQxoe98zZpwXZyMMVypuQ0HUZCzlCaFcgcgZp/cSYtolLPzKu4qD9zGa
         Pp8ydd2SVjZidev+FZt0rJGr1ocgcwqF4crCyhO1QLdrcXyWzhhE9HjnquFFFO3a5On5
         BfcA==
X-Forwarded-Encrypted: i=1; AJvYcCWm3GOeJiM7+pMKJqWtp39Vwa7B0hTlSkNErBCE+lpiz6ZjiBTS782G28LnEuZiVwc0kM1rquWv+F0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo3c/NVC/C6bF7iNUx9Y6TgwqlawoenzmQjkFrzR1E5gFgttLN
	F5s2XDN9X+pit74N+e9NOqbOkcw6PySNy1A4VWzkGnQ7VDA4KK+KkZoCD+voctFvEXBBuO5apcm
	45dToWVem+fw93+XynIgxwtSllViMcyOM5Ck9fpu0JT7hVnBM9KxfIF0EwM8nbD8=
X-Gm-Gg: ASbGncswQalMsYnQANLdLoESF8twl9w2+wt2dQrIG7bx+CcTVPadWh7IPLD0mHCsrAu
	Z6Zd6Nn5/c8NiP3cwbYPTFMT1Oua+XvfplGXwqm/SxS7303TAC5xegyrVsfWwUhQdabFotPwgIT
	CVVP20HLYBYFV6Zovx0Je5g+3Yyz6yPMJFrQmN2Dv+3j/APYP5asYem+R8laQINfEjIqaZlQhwe
	PlW7lgTpIzzPvUTD371LgcNAgAFg/6WkGFKm9HSVXNnw0fnWOF9X0BCuIcYbVq/fL+fnvIJkZ+x
	XN6nzxTwfIH8TSkUFGQGpjDMhAyG2TzrZLyWUWD5KbHLV3wb4G3zVaQ3YcmMrKIozoPXlYUEhHF
	mbexGVImYG6+9ALFwW1XWQbyBAKoC
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr2555118285a.45.1764181384165;
        Wed, 26 Nov 2025 10:23:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDOHb+nGWB7edLXVL3nT2Zi3o2R10JG4cWMbkYw+mo3CYHYakTXwoxRZ4cxy/DzgqTRgGE5g==
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr2555114485a.45.1764181383764;
        Wed, 26 Nov 2025 10:23:03 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:22:58 +0100
Message-ID: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX5z95fqFtMvGX
 MYTPWrtn7ZNgza9smZ24Fp7tDVVmnBSRgDPp+B568iAYJllMukSpxoY1sBheuI+P9Q/t1byMA1C
 5w8D1WlXE1C5jCcpTIpYE66IpWyE6c+30rj8HsXLGQRg9Ga1ZlRzmpIYihuqDx5xt83Gu4n0qBp
 Ejt51qWGlBvf1cjCNq/RYAak+Pk28SBf132AD1kP6X5f6M9yIYY679ktpv9KmiAr/3oh2xmpJ8d
 zP5HOsmmG1BK14NdO359Guc8hIr3QRkRWgJ3DuqFVSSt16O75lAUVPkAcJgUKrv0J+LWuVIYMhD
 2ed8Juazl3Kw5Top70ljDXqO5TBythLLbbDfvDXpZ+90s/qrmPV/m2bCGZZV8wROrzoUC+Ks2+r
 65SEg9tdAVaPPO/IMKuZLwSntKvPpw==
X-Proofpoint-ORIG-GUID: -Bx0ECc0jz5QH8rhzMZU-u65phyO7RcC
X-Proofpoint-GUID: -Bx0ECc0jz5QH8rhzMZU-u65phyO7RcC
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69274588 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260150

'type' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-bcm-iproc.c:1102:3: error: cast to smaller integer type 'enum bcm_iproc_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

kernel_ulong_t is the preferred cast for such cases.
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index e418a4f23f15..b5629cffe99b 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1098,8 +1098,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iproc_i2c);
 	iproc_i2c->device = &pdev->dev;
-	iproc_i2c->type =
-		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
+	iproc_i2c->type = (kernel_ulong_t)of_device_get_match_data(&pdev->dev);
 	init_completion(&iproc_i2c->done);
 
 	iproc_i2c->base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.48.1


