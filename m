Return-Path: <linux-i2c+bounces-14704-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE14CD8D93
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BEC6D3009F11
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A76834D4EA;
	Tue, 23 Dec 2025 10:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW8AkFYE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZMhZpnd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321B734D916
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484309; cv=none; b=nfWLS5ItfVUBDtfuBjW1iNxt8qKqFgDztfqUuo+aUPxl7r9ccvnN8tvQVzLuzWAZhbBuIYqRrq1JWXKlqAwe4MTtX1m4yH82ZQRcO0J9Wwtz3GXwv+8AvCUn/NccMdbrGqaiOveDB3JhX5LDwfH94s5IskC57V7n7oPNPyOlyNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484309; c=relaxed/simple;
	bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IfB+n5ZuABDCUqHsJwJOVDQiiiETADL0M7SaFc2xNU7JWVDGZKBud6vuVnIECFD2fwCjRj3eYzyz0zpZN3Syt9qLdM+D/hEQVamQnMyqENGoiW039AKvI7QPsrJ4J8XfAtAWUfbSS55A5fjsRZDTgbH6ogzS6P1DkIsBwNeTH0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RW8AkFYE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZMhZpnd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9wLTr2040956
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=; b=RW8AkFYEduRKBW/W
	O/rrnXcsPJG48/Yk9RsQyHLAQsSQUJg4rMSIiR9BHf9N5/CvrbDheomOJXd7jp68
	9gc54c2UfYVouzEgysCs6fWpAN1rsjbVapbx3qF0FXHJlZFN+hfvwz+rbLh+/r/y
	FBtrBAw8V8DM9V92jjsj/P/BIi9tCB8/Yh5qR8wI7X6KJumhfsnNntU4TVyik0dN
	spzrEZemSU4Bs+CWduXtmTrPoR2f9fGJfCk4D7oa69yfjP9aUhNp8jHMjdqSJnp+
	/Q5oGDp2EEf3amNcU/MxI8kdNrVEmgPoYlRXLt49krvetD2mHlU0jUB+To7IgRsQ
	Towseg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkb64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:05:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6ff3de05so137023631cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484305; x=1767089105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=KZMhZpnduHBozLjVztIftdpQQRv9sHmR+BRjCscRACgJEjAg+LMQn3gvyzKeFerrBN
         HLXy7IWY5vJvOZ6da1K5DeXwhkYI65yXywXaOj9QR4AKtcVHos6gRZnHbKSyWSuu5sES
         8zn8buVs/fQzTAQZCjjHSPvsdPAJaAFGzKz4DGkudZF1WM4VnZqL6wuEr2djYoeBbzDg
         o/D0DW1dxWi187ct1j3aNXsCVLFwx97r7Av3jA4mcPCRpyOzM5cGcoSppCoF62Giw03X
         4slqO1L6JtEQCTJQmwIZU4/iUNNtA5tVBe+JnZYx74X59oL1m57FWNFkTuzZk0kMb8Dr
         nL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484305; x=1767089105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=DgPM4enNixjJPeZ8refBEE6xdf+QMkgKgS2FsY+fNnCsCnHAHf0nacJbdYkBIODlT9
         hulCwwbfhipxr8CvHU+J3VL6KUIvl+QvWheUCBNeKjsXSQFCKXmcnuyr9lCni+OydxKc
         oWYus5ewLRVwxEBEwvjN5wUfgS7Oz0uz3Tr9gF4eepgp1dVomL3xSl6AAXbqH172uyG1
         HyaMj30P3isT2mjoWS61NjJAVpLIS8skzLv+2dclcsv2fcBZ0DtlT6c4J+EReq6Xqxyt
         8gdp5koC91rqeFSbkHDrCt+88T3VPLNKx1AGu9qxTDNYiV4ESbct2+YZL8fkTDrHxI71
         8ChQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXe74Qmgn1qmpq6CjHnoUjYlShnZy7b4TGb2lWstpA3swPcAWurZrFG7KsB3kBa2PJrqpXtcJr2us=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq2odtOTooum+xS/9EEhKzDtszKI2i2LSHADs19v6Nxe0c03qX
	wVWA04erKQpRDwC63w4Or5N4zAuJhSsPV7JdZp3tw1rvzl7A25wGSGyQ+K1P07/JVW3aOZQaaW8
	gDXgjYgM79LpniOMENx0vY0oYK3TTgOjVgiaB+pFAxm8KqEgOgK8za88kZfir6WQ=
X-Gm-Gg: AY/fxX4klGniPXnMRaTnAV30tiLxYpoHJdAh6GYI99Qwg/6zm2rzjJ+AGyOmPHHnGZJ
	sr5cz/IEdu35+3tPn3M3ov4axe1tPSjsKJXXCVo3E+fY8y9oQu3YcfJiatIQ181bLoOxkqtOPb7
	/3ueqyxgRCuaRwIMtSIywJEG98nBu/V1NDFe4qIUZ7crKeT0pWFki2ZRXitJSJ+ZWs1299eY2O9
	IP41mCd0fgi9qzYKoLVmUdR477NucxdUxtyNfvkA+D2+M57+ApO7LDKRhpoETbFVWUKX2DlWnyf
	TIAyBHmGBCdl+oj00OFKn0jQA1CUqwE7RHpV+XH/M/ReNeMD/2bAQh3XY2nkBso3VE1HicGwwYN
	uTbe1cUhO8ZWBxESbdNJwBgFw2neareTvbooi7K4=
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr208230471cf.56.1766484304515;
        Tue, 23 Dec 2025 02:05:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIjj9e+R9isgdw4TyIq3Hu1LbklgM+U32cHNPR6qnouGXpVQcoFz0NR6/hmM+Q9uZlUedF3w==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr208230141cf.56.1766484304075;
        Tue, 23 Dec 2025 02:05:04 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:42 +0100
Subject: [PATCH 04/12] i2c: keba: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-4-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk+kwvyegNI/zPQvrSmXauolivDt5IGKfzgw
 GoGwiPiQAuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPgAKCRAFnS7L/zaE
 w7mcD/9bHC2rhBydNMtDo4LhxwjiUk1fcyXFZjeF/im9i5gyNKJ8bBrqQI2Kdt3dy0KPpziQOg0
 BSV0lAJO1bIqOsPwuc3KKYk3/hn0L+KYBp/b+lvF04I3enMZWRGN2S0/ffsbchxO1MeJ0V5b3cK
 hfZJu4EVftckpM0O9Yv8c60e5Nb2JR341WvhfCxS7D0AWLJQ7Rk7IPrwEI7YJEtHU2uOl+zA9Ld
 uPRMsZkDy+deZ7ByBQfd90O786cGcKAet5D0odFsO5H+ddDmmUTe3YAktpsbfuxMqXqhPoXaBEc
 i+Axp3by5tydT59O2lHrMDs/Kzwee5Ue1tcVNindG1cTlvgNekh52Q00KAe/rF6+70Vl73gf75/
 kBgWrGM7J5xycVb6ED7++BH7uqHlIFWJaWkWICSUKDy/Yfkg0hzCazcr7zLUZnu9CVkGX5dJcJM
 Qt4eQ6z6aMewRrdtwTarz/laWMPOVtvUcKNA7UIMw3BpzRzbDtPYmsXkQUfTjcVOCRrs0DD51JH
 M5IFzjAlpNlW+Ld5vdixHFgqRdl4rBK2wnGFXGfrzhXQnWlDLa1XbP5ZbHgyJ52ujLIX7IGrLRh
 45zcCCphst3DcutxyE6J+BLDoSOV/yQOlS/iZEGTJmOGPOYwogfJO+0o8ogUXhVpHOOjC76fo7z
 NMVpq68KkxBip5g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX111gzm5CGYPC
 0rC9S2XaN+L/Jn2AlyzNXLnkjnUXTuI1FJ4rcfAZyPi6pHcEKI3vnfJBsXsVNgJ++2+BBBhmb0G
 pyxhDBDC26YC0fL0NllGD+tjmribWYMk+VAGvvpQWDxY14uGKCB1HEuR+JM3GYGUXd6z+CCmGPF
 LD6biKmOmbPp8NSMoURomAPnsiPDWJdknytXvFtZes6GI6jPcaUmYPJyQ9YzkCcroJU4pTPo0Nw
 d4T4VXbvqx7NoLzQhiYdtc8psMzb0zvmRBd1CKblAZGN37rwcN3DdQPfrVm0YCXR28fNIllrys6
 +VTxhcqdFbvMpTpADUaiL88WHbAYAZJGxldPB35VEnatnOJsoNjYkC9t0OBWlPdm8N8k2Ck+4bp
 HT4Bds/NJIw0DKwGB7m1h03X+MMOLqKEmjd13z9j+EJ1p/oY54kvCKerAOC/S3KoFq3e3rz+hEN
 MCsoPbkpTdCEbHlT6TQ==
X-Proofpoint-ORIG-GUID: tV-dOmgZt7FFG1XsVPLBXXoY6SsSMnPd
X-Proofpoint-GUID: tV-dOmgZt7FFG1XsVPLBXXoY6SsSMnPd
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a6951 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=op3mqaDViYxnCTu1ZhYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-keba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
index 9420c8b342b573da435eeef5a05efde35d61434d..01aa5dd9638dac38dd92500cc8890feb8020754c 100644
--- a/drivers/i2c/busses/i2c-keba.c
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -532,7 +532,7 @@ static int ki2c_probe(struct auxiliary_device *auxdev,
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
 	adap->algo = &ki2c_algo;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 
 	i2c_set_adapdata(adap, ki2c);
 

-- 
2.47.3


