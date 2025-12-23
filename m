Return-Path: <linux-i2c+bounces-14709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC434CD8DE1
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C18C307D418
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D29350D52;
	Tue, 23 Dec 2025 10:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGIB3qS7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TraxNKjt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457E534EF1E
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484320; cv=none; b=ePA/eWvYNWL16kIPlVgKoHWhbNkDrerxQnE5Lm3nveAKAJsh1AYIJjHUcnQvWj24XV3h6r+tyDMoWUNa1qD6Tf4s0b+n3F+kApu57atxKwoqAvsheU4k3uPkzxHSuon+A5DyOBRBRez/awFGrzWlLA8QAaK7n7pCwAmhYm5tsEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484320; c=relaxed/simple;
	bh=Hn56O8bTHxBZpZANJMtUhif0GfjpIzDlLGeElyxRGYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTjWm4E5+mS9TFOFNc7JlU4H6ERZIZ8aYzIuh9gtOJR0AEWftYJa159ECXyuWAVDNvGeLrtKvD2tVwSnDZ9q5keZGAtk7kfqTSW0RpfyGVPYOsaQ/Xg//89YOcJFqQ3x0MrXgZVMEM8kCbQ2/592VMKRgFGIqMLAE3/8g5iWQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGIB3qS7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TraxNKjt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN36mSK1889412
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=; b=iGIB3qS7dSECCUqt
	rRX1LfzE2d0la0bNk0rToXOs3e3Gv0qhPk29Rkc2QGMA6PAO6mWcVZhD8Bus6rSI
	PkPaqcHxi9jtgy30yPqRAq64jGIdcN2fYOQE1DAthEo06mB8tS2e9cdVZ96bhL54
	gRtViJeHKYVW7EWHwte9wwSf0MJQnl1ggBp22KA6FMNSi/I8NrFSURE5bkCmqs7J
	nFLKM3MGssGoxny7Bvh37xqc3XxXmxPvVhPlbbvbGc2bcLqTqWT5/f0ssQD0b+kd
	IwXk8iXSCm4zRCZKBvaeGBlq3RdvS4fQbJDa2p11rZZ8D+CsaYKP39CAQrGKWZRa
	jNso4A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak53h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0995fa85so136747581cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484315; x=1767089115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=;
        b=TraxNKjtFKDZmphF20afYP3IHSp52gvs+y0Xe0H6dM2SVxUg/XxZWsanqujrDxFswq
         gcfRefoBDgyAiZjdeOzL4WEIVuAFpqJ5gX1bcTOvxNrjFkTbO9WgOq0+NGQFiymtquAn
         +nbLSpvO8paZ41HejsEi+0uwU+ybOvwZUzqc3TD78/WRDa4pjzKwR6tq7wiLh1k29WGJ
         DxqhTF1Wxg3l/lR3oaO4qylJ9jdy8xS8q59aO1S3HcfrtKLQ6gwEapqEjr/hwm7xs3Wr
         S/8V4jzbNo582ut3GhN8GnAwZnXcxnkc43x8EjgXnWCQ914Qy9gdnaH1uqdxfvmmTzO+
         n6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484315; x=1767089115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1fxey1ooaRreFGPPHmgPQ8my1J77wljfZRigIZxPYAU=;
        b=grw2G/RY/rFj3g24L/Ib+LmkJhn2hZIru9JBRi627ChGXmEoqp4pMtXCVGy1D3ROHM
         yR8jGYZ/e22Yc+DBEGCtIYQfCxtItTO/s7ndn3Rv9bLLSAcU65QXLmPDS13EIneGRoIL
         YJ6uhQcavtRNQay/yDKNrb7Eg0yAHrz3Wh5TSbSVQIiLvBayNovexvB7Tuvxa/N7SuAl
         qaKVU5dTdlaDq1P3Bb2GZkR50ABMIRRjyOLT6F5XQ4VvFzVDnSUw3DLcLp5aSyjRRj3F
         ABDfUOl/GeWTbQ1ZLGZ6XhkPmjBSBfKb9Odgqnb4U7PhEgqKFzKmQ7vAnU81/cGzndA9
         CD8A==
X-Forwarded-Encrypted: i=1; AJvYcCUZSzh7YMxpfUhkxRtXGiBEMk9gFb6YMDX+QFpph6/BF05NLeTbAguWfy99SLnlf132I3Ej/2PvbwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcEXEaVM+9nsO7Yf87VKl3DcPqecA3z1LPPKNEe9ddGlkGrR4Y
	oktUYUCsWHY0zZ7shnLq2qULyRLa+kY2RJZgFZeI7vCx1JM0YgD1iXsb6Nn7BdvHzqKMJvnApyC
	4bKRNF6zqtOtpVxhy7QAXBTZiMFuTu2jqbj7oYjrDE//BYAlCADxTUh5JV+kNU5Y=
X-Gm-Gg: AY/fxX6fYUG8ZJ8k2VoiqAHo1Htp9FIEdk3afRlyfN0l61epCvWSPuTMANw4JGdufhK
	eewr+zFmbRgdEF5S9rx+H2tN02Cx9sijq4SgE5IVcH7azMz4WsJZuWlPtz+q8h/rfOLBrbBJObv
	Cz1tLawnR2rYWsN61rOo7eLc3D3Dr3+SGHT79Rpu/oGQHdo+lk9LGxMKDCqxnZHct8Ytb+Ju8lk
	vUKSZaOrhdFCCHOMFw/zPpQWsOC6XfgPNroUuxV7CyTHRKqwLuTsu/x0RutzXxclMVHqfN2eTCS
	et+kAUNZ0GtEXH5mgFNHhSXGkfFM14OEEB0KLPJ3p95brlU6+ZcrxOadoJ2H+Iu6rSwouN8bvLR
	idvSReOXiKCIqVwO6Aug34vlC9ubxdHA3IaPCu1w=
X-Received: by 2002:a05:622a:189f:b0:4ee:1727:10bb with SMTP id d75a77b69052e-4f4abdabfecmr190558181cf.73.1766484315365;
        Tue, 23 Dec 2025 02:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8GFjIDyZbV8dD+DOpfR7IwmmqBYzqzpg5/tGrJ+xeBvGOlCT2lgXxHluQ0kpESiPf9OHVqg==
X-Received: by 2002:a05:622a:189f:b0:4ee:1727:10bb with SMTP id d75a77b69052e-4f4abdabfecmr190557921cf.73.1766484314941;
        Tue, 23 Dec 2025 02:05:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:47 +0100
Subject: [PATCH 09/12] i2c: highlander: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-9-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hn56O8bTHxBZpZANJMtUhif0GfjpIzDlLGeElyxRGYo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlDcbNHO2WZVBDO1Am5CGHZOGZZ04kK7h44x
 fnmwHjn4CWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQwAKCRAFnS7L/zaE
 w3QlEACj1xDOHhY3eNrCu3TniQ9GS0TsDrnZfFcJrr8u4bxRJpu6VcxD08eM8OBO4Ug+7i84qo9
 BvDqKBjwKXpBj8blAuHGXRmXAcqzmrCNxg/ii/1HIyigtO9N1Y7fM1Ou3a8zbT8tfsQcCsV6pnm
 JtUCun3fF95ul0gI4i2EJrtTaqLxB4sAuTuXwlPciqZlXGIRQiWLv8WY4HKYt/AUAFzEY56AAue
 wP8U8FRRWmOBuNvTcO/mSq20JuN5gHsti3JIEoLyu/Uo7Nk/wohdiFz38jjG0dyNUu7ifh2Cnch
 wajM2vL90AgjmkCV5fHff0FNWP3hoe2SjF4ut5hu1viWIuM5eJsfVKvMTawVWr+CCOTw7O3s03k
 Zp4YFrGo3Dp3jrRV3Yf0zKnaFZhvl39mLC+mCrfwL6rL8//wGxdaIphusT5BxLi4pNlYZ8/R0+1
 WDqd5qLanx6mnRfWY2jI5/uGYt9exaTUuHVB7HeQwy6180t2p5CRx4bcQ8vpHBfLB4YAMMpBMYI
 xR+ljQvylhCu+jITmxdWdtK7nsV1gEGJeVqqv7lqky7RKeH0e5fl5De6j41DpKxWybAsZhVhvz6
 y//a2jtc+o0fFk6CRWgPL5sDKYlu6kfSzozfHjLcnqPYuAlLeaI9MqAuKKd9wfwfL1fI1ZWrwme
 djbFc6cRrEAvhIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXwMt/eNrE0brt
 jy9ZCK47eQKMXFdlxJ+azufxRxi4aaiiIDb8sA8AAS2duithYUXjoLk0QA5jFLuCa/DWxznma40
 i1UeRRDUQlhRJeljo/OhqyJa5BYOfAZPujPHJVTrr+Rf/XY91Us2v5eAzhulgf/TRdkuYsS0ZZq
 ZnixjPqqh9+YfwrXpTtGSbHHOToQwmH2V9feaYh1UVku97pTRTLQ4+uBm2cXRvzelNmYlQGduvt
 02HsDMi7Cb+cH7VVWyIGwCMuP9z37q08QXHDMoj/jzqoGj1zugbPltK71SV6FwDQqWj4Rz57BOi
 VUvLwtH7sfZWvTnKUEZ8fhneXTAdLEUt1iXdNxGtrjBA7u1eLdwOtKIZpxnKgcY4RvRt+rnPF7v
 G7wj88rBVypd3t9ZBSP1Rm3NPizNASk0T56X42N4GfHJEc0VGbAMgvV+TCJRCeA6HHUgxQ1N9Kf
 50z9eHtXHs8yJ7Fl60Q==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a695b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: p_rrV185huZAevYGLBKPw7xc6oSSMdUU
X-Proofpoint-ORIG-GUID: p_rrV185huZAevYGLBKPw7xc6oSSMdUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-highlander.c b/drivers/i2c/busses/i2c-highlander.c
index 78c5845e0877ae3e2ad1dcef052cdef021372e12..8aa2baf96c266edeb67d1da123e314e57831e0f8 100644
--- a/drivers/i2c/busses/i2c-highlander.c
+++ b/drivers/i2c/busses/i2c-highlander.c
@@ -404,7 +404,7 @@ static int highlander_i2c_probe(struct platform_device *pdev)
 	adap->class = I2C_CLASS_HWMON;
 	strscpy(adap->name, "HL FPGA I2C adapter", sizeof(adap->name));
 	adap->algo = &highlander_i2c_algo;
-	adap->dev.parent = &pdev->dev;
+	adap->parent = &pdev->dev;
 	adap->nr = pdev->id;
 
 	/*

-- 
2.47.3


