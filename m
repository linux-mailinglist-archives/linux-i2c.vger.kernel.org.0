Return-Path: <linux-i2c+bounces-14701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FDCD8DE7
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EAD53088DCF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0383234C820;
	Tue, 23 Dec 2025 10:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDBc7Xm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJzQizCm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C5134AB09
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484302; cv=none; b=d/VDMGAfRJKm6RPHyTzKNhXngNwKfu/haC6q8JSOiabZk9Wb2Bhu9lx1oqmcxD8zx11kRSMYJONyuteBaHhwyMazFzpp37g3Sv7E1gvCBCn0WqySerZOoH9VOWFFXdmTTIT1y7nZx1YAacWS7mKwbVTkyPzhmLF3k+LlGbZP3p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484302; c=relaxed/simple;
	bh=9DuIEZPwzTeoXCwAXaQfazb/wfAxmGqBk6OslVsEIUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEsQ7O9rtaNhqJAws0l3VjwUFEcZKIS0781Ecaoi50NMM/jQ1eztVUBqw+rAcxRZKy0lOvSoFtXUzyxi9nHl6VTTeUXdbANbAettSMfUFDoHL2QIUX6kkF5GeL+hbQV48FjU3YmGORLI3jTJZwZr01sIRJQiEB6/womQ/Td/hfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDBc7Xm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HJzQizCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8VE733062290
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1rCvMDpU1D1vLVr0ykDBOBuZXm8pHvfoFh0GPY6oas=; b=hDBc7Xm14WCUwBdX
	ydAdsZff03TWHngyey1Pu+2X9w8lpJQ8WXoXxsLDV/sWx/rCKolMlsPCE748pewD
	GkzPErUiE0tmavxvBgqF7VPF2/LxP76Me6aKTsKS7NQPWHCWhORnU+JRy7Z16cKO
	w4+gMmT/wURxKg4vtfIikrathOtNxtC0yX5z/Evrpl/1YUkPsB5+Ry16O1Cmde42
	xc9vzUQH045i377SX8iMrlQsnEtPCjTLqw8v1g6spo85v45kYIrFpnXTnCV5E+qr
	NqJRSRBtmLN/+FUQvQ8ixLHJpjzJg2TJ4ak2lHGUrdTNzRLZ689J5lMTcjh2vyjg
	0QxVDA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkb5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:04:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f183e4cc7bso87594401cf.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484298; x=1767089098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1rCvMDpU1D1vLVr0ykDBOBuZXm8pHvfoFh0GPY6oas=;
        b=HJzQizCmyiPRwi0ANjEOuiuOGPRDyo2d2/ztZhn6Lzi2vysOwB32N9o67AaORbZm0L
         RqlqIaPNlcorxbzVOiZGGySqaUoUu+kC6vffbJ7AbZG0NRsOY2mD+bloXmiv5QGytzmT
         d3aIwUuGMdEtvwO0PaCHMcxC58nH91S/BlEGwV1J/HfAjvkWb1OK8MWx0BXK2SIWCDzC
         /P40zu7LySueqTjUKi37ppjRU5d/YX3c3EbG1sq7vM+fv7zaFoxGrpZECaO5i050dv5Q
         NMbFxnfhwwHeY6qRQ1dWJaxk1Cj2jgpPDJHs4dkAR7WlrIf2FLtAHO15bLItPOwkbC2d
         Z62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484298; x=1767089098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1rCvMDpU1D1vLVr0ykDBOBuZXm8pHvfoFh0GPY6oas=;
        b=mX09hrJLZSP608iMe+uSGm0BeFNUcTeFKIJCXaoAmEW2IUCQ+CbDYCitla2dzIpZO7
         If9q9ozx0fBRLxhk3y5Ct6UQOq9qVHtjysMybK9zdDlxtbOwvUNxHCIqVzj3fuOd8Dht
         mbZAsjW+0aGHNBH2YQqyH1SImSqjKDm8lqua9WfDZtZPsY0xM66lvVRwWuvFXd+IYNYq
         RSB7y+ptHfsPllnmEyTYkFgLoYlubRym6DpSspYOcMTBfDvPHlQkq5+HT8CKA6I9VAxA
         TkEdKOdnHnhJ4Dp0Ei56D2lGL/JDuvIkiQkAAZO8raAiH3Bcg0YFOdjucIyDzRzE8Z2k
         1asg==
X-Forwarded-Encrypted: i=1; AJvYcCUTuXC2e3S2Xx8EjUiO2fvjbV9ONzJ9D5L8l/xKdl1YXQO/fh9wRCv5HdzUMcFmXcnmdH91IP2tYxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUrFe0Sl7UiUwZPK3SA7dkwv2+vJuwMyWPIsY/gEwZGxEG8fI4
	lQz3GeKOHCKaoee+ROjEZ+h92oy4Qx6f2+9VpSv+J84fJgAufsXF1jy1mncrK5/+5VIg/iSnDcS
	FVKvADy2T98UiMn3h4YHI9zMgx1qTK9IstXP8U9Y1/0hb39z0Xt6PkzLy8l+NzpI=
X-Gm-Gg: AY/fxX43NxkXTiVBdhg7r9Gc8PUn8q7Egl4a0sjUqS9MuP1kaf0jz6IU8SkeHVRM9vG
	IRzIYhFmxS9EbltgDfc2MJlG+8/Jd3YEMyQgcIPloXQXIyZAqgUALaaTia0HLEduSD3D0LpG5Er
	AM80ylBGuG8twor3dfZfH8FUsvpqionn7Xnuf6bd+xCXrtFkXUK3tojkb6yc3j32hnPSUZWhUUp
	AstNwzo/r+261XHnS6KdEp+HbZ0+B+ZnG1uSW/QaJ2JycGDiSFjDGdz1BU8+tDALqIZj1Jr80X6
	WdJb13z5NG1YAiq+XLzgY+bBcl4cdgnrb6KgY7rOCgdUVZH87OVlne0A+OuQQbc/ouzoCJTiXAj
	7cNoI6P51/tvwKd0mUmQYHRn5OMul9Hzb8yr+WRI=
X-Received: by 2002:a05:622a:50d:b0:4f0:2afc:3b80 with SMTP id d75a77b69052e-4f4abd92eaamr181413441cf.56.1766484298414;
        Tue, 23 Dec 2025 02:04:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPyPkCI7wpeIXAWX4oTjp2cS/hulQz/NmX993pTR1thwF0IRRxKOlYnoldEaGrhaMGAtYLKw==
X-Received: by 2002:a05:622a:50d:b0:4f0:2afc:3b80 with SMTP id d75a77b69052e-4f4abd92eaamr181413191cf.56.1766484297752;
        Tue, 23 Dec 2025 02:04:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:39 +0100
Subject: [PATCH 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-1-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9DuIEZPwzTeoXCwAXaQfazb/wfAxmGqBk6OslVsEIUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk7zl30HWFdf5toH7ZGKXOD8CIyBlVApBySN
 IwaXVxofDGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppOwAKCRAFnS7L/zaE
 w3jMEACQwb8ZgE58DE3uw37UiRZwU/zhEQr9IPt83tPHLkgZTeqGX94iF4zPORHT1Sr6NycarTH
 GVHxF1XDkA0X6UnMa7Irhh1xeo/qFeqPke157JJl41OxB42h6ZeHStCofCqEkj4AlKSM2kDl/bF
 G1HXjnJ4IXxgAP3b7RzEiGinSsyZVdyG0CNKHWCbe+hdducCLVXpRx6nBhO5RpZGmlyca/6iBQo
 0miDWx0P4uwD90IWT97/l8TGMYnY6DyXRO7v4fRCTDmxeY8+797P6blElSuKf1KXLPLUPmnNoZW
 GxO+tpHCeutabKOcxnj0pASJ4GKqEHZIl2zFYTglOjkbQe5JsfbZiyOwdMNbBCrDlPU8SgGm/5m
 jLA03yUabJxHbPOqP84PoAtk7C7aYBw65DpZlloaVlGfKM0B6Shr7Qyyb4TR+Nnmypt9BnTcbLq
 Yvgb/jJWplS241rXMWFGIEo1P8zeNJGZIXMDaeZTWuDcnFI1gsK9EsXgdrf5EUERg/RLqZwD4ci
 byAseHFEQwGNSmVOdmnctOJwQLnfwDat/vfonNlqFxcjrSEH0qRpXao6xHBUvveYqJNBTBf4Qvk
 KHrDjxJXW6mFnMyC9z0wifTeZDxecTGHG5sQHGHGDGzdMQtsrwWyWvftqfdXiwqu/VpMOVwbSLN
 b+27NTk2zhOsLnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX90cVXLtc2vx+
 Xp2TQxNOOFkZ4vLgeqrQ6e/zM5Yb2kH0E/VwjZZX4nlCmNz1GN+DxJsOMUZc1ZXs/LrEh6evhYz
 uv0x9Aj+Pvl7wu8+MkcswZoVXW9Y619YPZW/HB5Rbg0XHm1/jC5ndDp3tAu5ckSNDlcOyyNeM+7
 J7iU1NNsfhd0nP5fAO9UBbaoIJUdifYoo+sZIpfRO8HBR40R5BDmo1+2yvsBnba/6dWsxY7NZAS
 X9Rojo34ofvHDq9EsNMiCtGitsSfa0LuVtL7y7SQ3keFnznGkP8/f4yy2wVcABCvA9p+8dIQ3ZZ
 d2VM1oDtVdryA1oo21Oe9fgWWSjE13TciWkqNe+dWBfO2JivWqTRn44uK3Oxp+ebR+E+USVFOyA
 //sadsNeiiwO6wGqbzZHbdPkAB+Q5FtQpeOj8wekccr8lT+P/P56/RKnShfQ5BzLrsdz4lB1D0A
 obJGH0NSyK1zbkVno+A==
X-Proofpoint-ORIG-GUID: DORmcYFbubIBLzVPKPH9JY0kif7G6AN7
X-Proofpoint-GUID: DORmcYFbubIBLzVPKPH9JY0kif7G6AN7
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a694b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GqsknrqNkdw30Ab-NAsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

In order to stop i2c bus drivers from dereferencing the struct device
embedded in struct i2c_adapter, let's allow configuring the parent
device and OF-node of the adapter directly through dedicated fields.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/i2c-core-base.c | 5 +++++
 include/linux/i2c.h         | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae7e9c8b65a65c415f5a42f0eb0e7a4ff3e86dce..732828e63730bb773b77ab59362bad8697a1ebde 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1561,6 +1561,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	adap->dev.type = &i2c_adapter_type;
 	device_initialize(&adap->dev);
 
+	if (!adap->dev.parent)
+		adap->dev.parent = adap->parent;
+	if (!adap->dev.of_node)
+		adap->dev.of_node = adap->of_node;
+
 	/*
 	 * This adapter can be used as a parent immediately after device_add(),
 	 * setup runtime-pm (especially ignore-children) before hand.
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..72677f29aff161530bc3c497d1e07144a44eb9e4 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -761,6 +761,10 @@ struct i2c_adapter {
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
 
+	/* Device configuration. */
+	struct device *parent;
+	struct device_node *of_node;
+
 	struct dentry *debugfs;
 
 	/* 7bit address space */

-- 
2.47.3


