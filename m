Return-Path: <linux-i2c+bounces-14712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB5CD8DC6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B37DF306F166
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89993563DA;
	Tue, 23 Dec 2025 10:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNYomGU9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O03v8+4+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B26352934
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484327; cv=none; b=gux+YO7w/D7HSTWL8wYH9D/CqlTcleFWhQ58FyYzqXKEAV88lT6NeMbg+jbS7dBiX9YVCwKFsV5XzrfqW5JEB86XypmbyZB6AO2p87p6gk1Y8yK8TBHOnsJIMLUh4qhN0mTmj2knKdxkJPoMkf2yAhVQ2nThqDmx8PNzfAPiBLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484327; c=relaxed/simple;
	bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r8TFsfv6jqM3mkwVltY++QjkdUkOrQBEwxni6SONexAfSqlElgAx9DKpuZeiZLLlcjdC4pHdboBaa4N7yIM3acfEW6lmmSbepSm9kkIdOhWqsfPH0PonwC1bveqLTQIsnpszIE7zqRWeB7kQYRmXetiwzRdBt8QMnkUMoUS3bPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNYomGU9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O03v8+4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9kDKM1889180
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=; b=pNYomGU9cmrs6cHg
	fm8oG9wabrJHG8o4uIhaWjepW3V1TVEebjIg7mp08EZYtn8SdNW6Uuf89wW0V/Wh
	9icN39epcyoeCiVslOAfuMGs68qB+KRESNcQvYviRtYxqnDTEd5Uao5EIYf/P5RU
	5ebvZcYuUuUlmaT96ibknCqGpJjviSjDF0ebQADOjJYDQkTaugHW6n/DHHEcsHt+
	xM9lFsXVWB2uDMLupEFXKs1NTQqbMLM2WhSvY6WZ9IJ5lKw8C288uiEsWmtLoKMH
	cxBOvUJaOtutjOeDogB5wzkGeUlV6mYLdVIzFSEXIuyLaxU6vkQcAaB36TPnyuFH
	p7e49Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak54j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed782d4c7dso85046361cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484322; x=1767089122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=O03v8+4+RnQdSn8TXJImb9pz1tHIF5mrlzPThqZc2DI5g9SRU9EDLB7mJRIdWuEJD7
         ePPk4QutFms4qwYxf5BhFG/QQGfrIp2LoP1PAJg+sqWwaJOiLp//u4hAhVWvxUYjpdad
         TLZReZyYhpphUyuuklFZps01M1HBl7l0Y1tarG4j8rOem77ATznXrWTmcks4gVkay6wW
         ZAPbsBwBLaHqMij5WuYo714hJg77LOx71mmAeSNmodgS+Ec9wbUOmzWJDAYgifTqaWXD
         0aKx0moiU1NgySvaRVgGJBQ8sh3cHYqqgad1c+A9/nem7r4WJ4slGIZ1zPw8N3IGf6s9
         7P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484322; x=1767089122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=XasR6vT8wUzmrBj5EDEDnvSl2ugxULN6cIWKrgVERAiUF6QYqTybpJdAeh7BTGsNaS
         kepRbQLO6OBessogaD2EGJDgkmC8CIu72h+R1YW91yjtSPvp/Zzo/VJbhrWZnhSrhBXb
         8TKJvG+2+nGpqnJmqMRBongz1G25uFe2uoT7vifA6G9m3G7UOTd8oYe9cxkB/yGlStTf
         Iyemd53orsAMxE2xvpdfYLxXuvPUSmioJkUXC2fQBA2Uj5wq9huYPMzAkZcwSUYH64GP
         1SK4GHpKbwCMXiyyQ4w94SjkUD3xd1aeUJE0Y2slZAyTSi0usRoss3jDrIj9zcIwL57p
         32MA==
X-Forwarded-Encrypted: i=1; AJvYcCWHVMXny2PG9/pQlPkHrRFQ2senKlqQJxwH8QhA98eiOeAQztpGfEPT307nroc7Q0mg2+NQ3N6LU3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4QXXT2hC/pM9juaJirK4a2k2XThN5QcZ1eMzGouBxm7oZCTlH
	fWh8Etmb9uMdx2aSq18aS0oBwgwL0oT0tnEv63R2I5QDtw6rUCT3Wsfq8hWE+b8kwyghMfrEhCi
	BGGn4U6Q6QCthiXVWzodLDaQtLVPXYdjedSJAN2bZLdxW0rI/SqeKG6jQ6VqjuaE=
X-Gm-Gg: AY/fxX53PvFxt31ri7bJwLhUEbqxbFOu4rSo7zFlOFdaajEPYl/5tvR329uQZGf6IEi
	HPCI8HGENKA2G+vkLQIqLC/Cz+aM09uoxiXYVALye6YleN/ujGh/A4UZQwOoGxOib0oRcFmm8ZU
	XNSVUgwcw1FP16ASotc8fiLnlnLCduKtKwwf6wWHLXH/8EE3FwHVl05tC8EV/5k26w5telirD7r
	GxIEc0nL+QOPlSN3iOzE+S+4hUP9DleBZnLkRxwrJZk8Eh/JoUPE74hY3CviihdlLWcbK52GESC
	PzHrjGi9sZVTD5KxHW2l76no2TeEkmn8/DED/LfZCIF1jZYwgrwbIpdwWplgeKFGbZ63R4hqfC7
	Ajio/570ajBj6IIULySNwn/f5AsfA6mopn8vwpbM=
X-Received: by 2002:ac8:5d10:0:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4f4abcf6addmr217340521cf.6.1766484321928;
        Tue, 23 Dec 2025 02:05:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAPQdXabO5HBaTiT6yIeqTveZgwhLdZJOCpfRWZHMPFDQdqtbIjCybotRp8NqedBYlY0yHYg==
X-Received: by 2002:ac8:5d10:0:b0:4ed:5f45:448a with SMTP id d75a77b69052e-4f4abcf6addmr217339861cf.6.1766484321342;
        Tue, 23 Dec 2025 02:05:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:20 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:50 +0100
Subject: [PATCH 12/12] i2c: bcm2835: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-12-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlFig4OCqbxOtJvNGtfIbNE5836C9HJloutE
 T8pj9i2Pw+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRQAKCRAFnS7L/zaE
 w4IpD/4iRVCZ94Vo8mTST6iSvQjGBf2bMAdM2sdO8w4o9GMwNc2H/1vL+dj/sJmGFW3ePed0xiu
 OfQ8nOIpF7LKB1HNC6A2p1obt3zpQkIBePM2r725XHENMEfMGe4KI4hTHD2qQaeYaCNiNi7x4d+
 Ssw+DtyKoTz0V0ATqp2TYb+xhLCALnkXb2kbZCKri/E/wDTrVSkJ7iwnVd0I/hH64yhhp/bMQdf
 tyR8jgJ8IQSpOspV8wI/4LN5ZHqgJoFPQmSeYARCkVCgmV4Jjiu9aVSmx2Tf9JBhzh9HAEgs0iE
 vPUc55CRahywqI3FYD9ar9avHxuIXWTla+1k9pf9oWPPKJqkB1J5Py0js95A/YnDt14rWHqL3U3
 iQUNnnVgLUePs01mhCJzrlDLzsvp8vi8iJtLSFnbhn14cIRKCydCtuyM48EHFXuykcgBuaAp/5R
 7Ryrsdqbn7Rm1QlW1KkJG6yBUvzwvQpALIULi7KogZWXNUO7vwt3/vlD+gu6InnaPix0uk5YE5n
 5nPhxNVwesXk7baloi+fiEKV1fMwNAKpinZ8Hsp2YSkiFNtu43iqbM+QssSjicD4V/PqAsRwlUO
 WmaWgErClY91YRNy4LEpJl/v0sdVOlBDfHWqqM40YZpouviRqrDs7+RjycNbZYbLKgIS7iRw1zY
 WaaluLh5VAM/Hqw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX4iuHMGVbVqN/
 VHUWPvM5hVxlXxMWHKT+NnSVhz3Mob3wcUi+GQrR1jKviHcuSpB9tGYNdJ4HeQBfCaSZE3e4xiy
 nVumQWISHAGvPCy59pwjfzrXqnhIf5Y8pPD5zH3HTpg7jwK+2jlxXNZ2uQ0yw9fGv1fCGnQqkxe
 OnNtllEFNU+gwm5LaleSac8fBi9UmeOcTwzwP1KBRPqFu81jRTyaa2+3mT12oUZm8lApqYQy9UM
 ZS+yN8+4ltSuZJ65CR5UWEJtE3S8pLnJg4yDaYFy2QJpX1INJQbsNJw7wRqIW7YeDtGT3QKh8Dz
 mDiTPpzYAKLvSnx8sV1yL6z+IxSikuwJUIh5K/O6jJ57kdkwibABjraDA7TjgWgSfYTt/ZI0cJ2
 uUiIoiix2N8pRW+p1vobhVfRDHK1HJtRAKUuQ93xY8yD6LqiKh3migH1NPIR1YHdEyJS1d+7vSF
 5pG44YI3ACQiFIE1mZg==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a6962 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w6fcmXAubz_WdynIYoEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: dA-8wjl3nUVTneh6RhbytxHCJpYMxfDK
X-Proofpoint-ORIG-GUID: dA-8wjl3nUVTneh6RhbytxHCJpYMxfDK
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
 drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
 		 of_node_full_name(pdev->dev.of_node));
 	adap->algo = &bcm2835_i2c_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->quirks = of_device_get_match_data(&pdev->dev);
 
 	/*

-- 
2.47.3


