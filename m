Return-Path: <linux-i2c+bounces-14705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEB3CD8C43
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77A3D3074D18
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C336534E750;
	Tue, 23 Dec 2025 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYPsozok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+fJnt4v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3492934DB48
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484310; cv=none; b=uaYREOSsbidQnbJnytlAyRIGqZmFNR921w/UfT7YPuULM3BJ/x8kD53/hLbymEDcoSAn2unZU8x4DxU+TljGLx/RG16XtLJ6YfkhYi8D+g9Eot+iDV0DxsllVkZG+NNdE5LGNR8ipq7T7KffLMeDwqIvAWbpm39ohGWsWerb7GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484310; c=relaxed/simple;
	bh=nf5oJf3O9aPMhO8Ad3i1lt+LuRiSuT6c7NtPghEnn7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXbn2XHvsEUhFLUXSjadIpIKr/yw91v2b5/5u42p4JPHAtVtF0ByfeBdvHWcLB/AUvAivTKUdSwO9o8azV+wyDZ67WkAKRz7o0s84qsgEAzo4qqHTcwJ7fh+FEiUOPOP/vh3CuaH+JGoTGFD4cMPG99ShVc8G2bsOpxQkqqaXcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CYPsozok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+fJnt4v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3kECr1356368
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=; b=CYPsozokpGPmQJ0L
	/aQS9fjYK9EIHelqTgwlX1va4a/az7er30jowGpk0BLmKujXEtSSbLR3+GLrEosy
	Qc/fk6IXN0QOBy53r8b1OPbFTglsHmdDIvcxWY/n921QHZ3vx7U838WTM1JyyRGe
	aBiJiAIJ4VGb2m1OKdkAeOl3gd54owOqb0I0e1zImVxaC4zirfW3+XEBASirQ36Q
	/v6SNJYGpMUjDa3vtsaXn9lOGz0/T6q5hHspXJdtq0HgKLf/cjSPtxJHufQr+iID
	kMC7/N+ZbedAAVw+pPATFVmif9RLDLV6HQs69kvd/nlhd4AQPqtE0L01CXF5AvQP
	JAvUQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc2stw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ff3de05so137024211cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484306; x=1767089106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=;
        b=h+fJnt4vYfJOOS1Yt0gYz7e6U4cWyW/yBOp//4bZdrlpLhZv/0mjbRYZKhNJZlC6qO
         lWMUNQyvXvsGpKMEUCZ2kf5owWgnqFYSXB75+mHSDY/aTq3iXtMEDnEqUJI85W1aBftP
         WXssgc4Up+1zUD0QZOU+dyUOwvuvlcRJ5nRPqvDVUSDxO/sek4faDKYfy3lt0xyuABod
         ePX4yUgVpbjC8hzkCd9X6qHQ+RdDC8MyDPGXqjf3gkiT/5yOoa+FqKe3Z71sm+ocJAOO
         aY7UE8qmJB+QbSsSsginh2DFqzuewcOuoZ6hZ6zt3Do9dik3vcC3zTtpVChR6PrkU/PU
         GTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484306; x=1767089106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zoQy+fdvtf/HqhhS47O1zByPYj8iqB0bW0jZ0bVe61k=;
        b=DhJWDPdXdrLJPKns3xfHYHF7N8fxm9iLONgfNL08WO7oGfL3WRawpX1S8m+cfB5hdq
         +irf0dL4fiOlRvovCXZsFKuCNBZV5NjMwjmtINlNfGWczWBJahuMdJ5LjafLl7XNfYJ/
         xohQ23GTUXGdY7umPOd9GqQjbqb9G6su3z4LTKkduJhqPhDX8W4M32BGUNtKAgA/DveN
         HVJNXkvmxWcXL83oxupOF1N6PxB4cqeaQjp6xCWeVvBT6LruX0Wu1pPrqpI6gW445T8M
         s4tt56FXtR9AdwluOkEsXRqOAXP2qZbXOF9fzMpGgYLN+1fFQdwZV2B5zwLfFUH2R0T9
         qAPg==
X-Forwarded-Encrypted: i=1; AJvYcCVHSxmbXzrRaA1xG0RUsNF4/ANabJ82ThDo/2JVU2RFkpCH0o/27NP+DO8NUIWFi8TvGqCYPv6MsKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEME4gtv4hP1tccUwKO3T7hsr1I77dgm2NVHpLZfGrUPoNgalt
	Woe+NIIMvLxplLKNG6rjdypKJEPGSs6A1tVAOTVUC7U4WPIn/Verjc06FJUqfm1xOTyQV1Kwh3q
	S1sVg7uimODDkZ1j+hx0OtSqeiKY5Dv9XWPY7mx7ytltjkWMO8TqtUQqs7U6gkz4=
X-Gm-Gg: AY/fxX6a8pgWLS2we9IBHwTkG3ehyGEgnzDnDWIUxBtSNTc7daCdVxxVKDHBioUvxol
	EsAgExRLv/XS/AHz/j/MiK9Ln31GW7jUlSyQdznKSaZp9Mx4m/tDEtkCC2RiFOg1k+fYgiXFxw1
	tlA3u6DyHPEktJMtuZwEq//1ZQDNSzlMnN/1uW+6HqZvYJWb6h5mQm5TDo6p8MJW4pXybQXEQ1F
	nVTXwDujWBnETEvkahfK2UR9f2uxxx4I7256ZkRaBhaQExANc9K+0KKYA3AUOxeyUnT9sdc4e8y
	Lq/dpRZgwym+fDPDgXym2PYogkj9dvl4nVGhsAXU0Pct1Y9hPPgOCGDHPaNcQhhYf+qije3BtkC
	UhrXFvx5AEBQbqKrNRGi/Dwe0y0/AMe1WkdeZZRA=
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216109691cf.27.1766484306196;
        Tue, 23 Dec 2025 02:05:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYSreD7Y+9GMIiyDmnU8M0Z0VrGwNbAb3A+4vjzlYqPF8ialPbc18WsA6KQA14vybQlLSi5Q==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216109221cf.27.1766484305734;
        Tue, 23 Dec 2025 02:05:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:43 +0100
Subject: [PATCH 05/12] i2c: omap: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-5-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=nf5oJf3O9aPMhO8Ad3i1lt+LuRiSuT6c7NtPghEnn7A=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlA7HFYEcqnhzElUdoOdZ+7alBl6UxXjVygN
 v/t/qSpYA6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQAAKCRAFnS7L/zaE
 wwf2EACFpsKQZzzmiZCLCkquEwqerhjh8hoJkP7q1sDxU70FDXE79o8YJoJ2soAlRU0+A81A3mQ
 hkMJEk8DbkFqKASaw5jf415hONmKR9bkn6sQIDcxVzVjeFuGrzbvKpm5t7tWQps8aS8yoinb3b1
 hm7g83C6NHjTOILFdzPzTtobZv+yzAeYgccd8PObZ5CiUBWM6XcSwJTDr4mTD9pFzXGfXBaFB8Y
 ZSb1vxzVPWLjVlX/EtyRKpughnvLg7NaMu6fkfYLHLPh5oJ+egpBlwFgJ4+GnbQK8wWevc/lA1/
 TrjkzqroV6IQAcgqg712YiLNOYUlZzj6c4J8uYyFkYpxbZ7S8nEb+34+gfKNYdzckwC1tsSgxMb
 gCEGesh8sRcoOg4XpUNn9dYDcW/NxbjB2G/0bb+zgzMjUj1w6CB1qtFPsybwK944L7HU6Bs6Iuk
 YtrfJb3eo+mhFeJzjZjiDOFj1R/3MSIfYXzSt7Y5XoeOrRwEdMu+rBIFj++KEWFyR+gHqVTdTvV
 qYy2SXXtmlHyuZC7qv2jxaMV7mcKNZqEhyQHozb0midmk4BlPCfUoYNi9sqHk7hnUZyuNhVDDt3
 kXwkFF5NCQN7UlW72CgJsVRsCjl/RytsZJLrVA/Ek4JAWgFLKV7PcHZ8sEYs8ORp0r6K+ml+CJe
 zQiWdDnKBY0L08g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 2SrYfNCbSOw-8DyRL8UaU81vjeDL3spq
X-Proofpoint-ORIG-GUID: 2SrYfNCbSOw-8DyRL8UaU81vjeDL3spq
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694a6952 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=H-w5s1-Ky7DYDkcl1QcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX79k9KAgxxW+1
 BmreZyLnT9CC5OXEB2Gqz6s1NraIJiZih6b/OnVEU3s7UIDyU/Gzznsp5RS+PSOoJb5tI7ixrYi
 9SBCUwXNsagTEpsDPztvRj+LSaLGVa43ewIBegjddpgIC/URe0ICaRb8r1i5++hTiAIvrwY5Kaz
 tB3MejWyaEPjoTllPpvStJ4Eou16ARbwNpGdkPiNucn1oeY4NTb5kKeMzWVaaVbJ5QHYyahzbr0
 5V4dsDJs/xApiIh1iIEybollyWNsybHjenRopuZoc/zePRjRWFRzhv+Xs/qBDyRqUGOEyXaP2K+
 aP2qFbN9iTJh122bz4FgvCUeAGzkUinkQEO9BHkMzfpSPrkFVJhU6B87G7XzVQCL77Pdrr4gDyN
 110DIlWtAIo+k+pR5htZT+s7brMMGB5KD6yaaBb8f9YPrP4Blhn4KaCAgRi3wvtU2cVPb2Dbgcs
 WxsTr2MHmp7bpPTUAsw==
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
 drivers/i2c/busses/i2c-omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384340dd31308bdf9ed0cb1a1a2ba8b..f95f31c521314e1d67f3d5b34bb44fcef557624f 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1496,8 +1496,8 @@ omap_i2c_probe(struct platform_device *pdev)
 	strscpy(adap->name, "OMAP I2C adapter", sizeof(adap->name));
 	adap->algo = &omap_i2c_algo;
 	adap->quirks = &omap_i2c_quirks;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->bus_recovery_info = &omap_i2c_bus_recovery_info;
 
 	/* i2c device drivers may be active on return from add_adapter() */

-- 
2.47.3


