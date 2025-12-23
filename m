Return-Path: <linux-i2c+bounces-14725-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CF8CD8D5A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BE38302424E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0855735F8A5;
	Tue, 23 Dec 2025 10:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFB5db1x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sob6hlwB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8E835E53A
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484516; cv=none; b=pJhgU912tf5v9mCnJW0AX7ZrwsLM1oR2YImlynaCmbOws5ydwjquqx/Rl3F934IVwEwCvmQiNSA0TOweJ9y3wYzH4/ZFPjFUld2VZpsp6GWTkfU3rI4u3CUwMh9XNCD3b8R+X0VLIZlGwGYDVfOl5WpERfrVE+rtQm7QB/8CEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484516; c=relaxed/simple;
	bh=jFY2omOpfMAaJIgl+Gb+/qo5FachDk5TZbli4RoFq2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+27vYw1zBhmZ7pD2mQqzWLC3HO2CBmS9iyO9Zy/2qTgJK9J5KxK6YjH/odaPQM88cOt7CoQmCn2WWylGnyMsf4j6fU+oFPXIYD7oKcYJEciqkoQhhMxvANnI+FQ0km66VdCRDp4XwPQGY8JY/rSVoFZsU1m9+fwv1Yl7ODmVsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bFB5db1x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sob6hlwB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7KgKY2116415
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2Q5krBXZXd5ZqPoxoidMqeNX6BL7YTmQ+v50oJBYCk=; b=bFB5db1xATDliXKq
	nZUHSx9lahTIiGJFSGNtt3spVt5QjuBOsVD5/7KSYn1ykNafeg9c6q7cnu+y8xCH
	6WGzo/ruHBzAUtZ9ci+jOhbqzTXIsmLIfMC9ubmQ4RngaMm3nakY46Gm4tr5O13g
	2MHZ5mmWjHkG2dgI1gbGj53CcLVAV/+BQIN1q6zMsV2UuFHv7IBqZYRV/76ZFEPc
	MownhfGZf77jiWWP+8InExYEKmisLON1p27fOC4oSlXJcUoIzb7dq8i1ick9xh5M
	/JvAlAZOPNzkiXA+kb12g4tX1lvcLJ3bHy8kViMkyKO1tZ50KZOS5OpG44h2hmrn
	8hAHmw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudj8t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee16731ceaso95497431cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484514; x=1767089314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2Q5krBXZXd5ZqPoxoidMqeNX6BL7YTmQ+v50oJBYCk=;
        b=Sob6hlwBZ+kDFvy0tmV6kLnMXu2xT9tFpGruFotLiuShmGl/KxtUr0Y/vmj6BLmgsA
         cI9eTlMzudfarKUPo3X/uWvmmM8Cxle8OxBcDQJGzvoXbsonO3y+Yz7+3NZBrkAuc/Z3
         aRWdjBKGDsVDyhuKCt5kqptH7PHVcM6eVhFWdjFLsTGJYu/3newLT3Of4QJyoRUdEk6y
         vrDktfvQC+aVQi5AGCZGCJm3aegkf9BsxfHBDkgfP78gokVnZwIa95UtNRujseTmq6Qj
         mBTB4NG6BpZIlf00H1V6XVpdR5S8Cav8mAMfBez7yL5YZlQV8M/Of0BzRPtGz31uKbp7
         f8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484514; x=1767089314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2Q5krBXZXd5ZqPoxoidMqeNX6BL7YTmQ+v50oJBYCk=;
        b=OWCZoCwPGcumu6x7gCrDDy7uno0hietk1HVzVAHNlpD6jiqg+NhGA65xmfrDIMCCKJ
         4RPXhl1ZfqP8hNnup5rYh/gPqluVWCUZBQnmggN4H6PKuM2nJ/1T8cjylxudA8RV3smK
         XHhAkGVdF/tkXkj/n7fPF6Z2TCu+mfhpig5Zuzjz6nKh8rQhRmEA9WvxAXvhHiz18j2F
         YvCS7gP6BKV6EjNBn1w4Wq3c3+3bFthytG4sYafnkaHv9V2owlDOqCYvr0d/ecrCVv4h
         BEbXr4yFBfHhcmvQbln4+3HGpT1LBtUY7izrff1Z5UIWaDwzliJq37XPsK/wtbJ1wZrv
         0mYg==
X-Forwarded-Encrypted: i=1; AJvYcCWbHhBbTyQHTRAUlZBNoUnkzl0xZKoyFZ6Xa02FjV9OB9hmJD7B7wE/pD0aSigfIbXK6jceX30KSG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZd0mzt+4iRkhys6vwSNtVaHJGLPOn5zDPdK1se2T7fYuKYPIo
	NIGcsLVGI/Cg1W4rROy+rWxsljbpbj3awNZ29GaFSZNh1xqQ6fVa+JvZd3g34g5Iw3hledjxhOW
	0BW68rbDldtofbxkSAfvW9tJav5zrzfJHmGABKFPvAqyf9xIF+ct5X1wK8pO7TIs=
X-Gm-Gg: AY/fxX49VkYnoMyFMZ+Y+o3YlgZ7BpC5GMWv2DZ7meG4OaOdacr0PpOd3arJWtKIWpX
	v9wU6PF8baatayvETu72eJS/qIyUrSK1Om/P9guXJufAa+BnHM4FnxMe314NliEsl6iKL0AvnfH
	N1davgFoluTGuH93mHSA55G50iL9iCZZDihyfifq7mHAaw/upGyWFIUzeuODmwaWNSceUOmseP0
	xQ5w7kv9j8FbtKXXiKRNnWzx/XOaDPfmtQ4Qi8by4NaLU35SyWoX/o+/1eKtKN2PKUH0hpEFnYh
	pOx+NfWEnUFN0ghjxv6+jKizUMCxIibLz0TkwJ5/s63uswcoO0S8K0OB3Jx4ErVj0IX64WztoNb
	FWQ40J+A3AcqaUAUMcqEAGqxcuDWjzX3tnF3OmA==
X-Received: by 2002:ac8:584c:0:b0:4f3:4379:1ba8 with SMTP id d75a77b69052e-4f4abcd08edmr176492641cf.10.1766484513816;
        Tue, 23 Dec 2025 02:08:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmcCi7TwcJlF8XBLYn3CR6Ke3oFw+Y5tzd333k/XR4JxScW71eEEiClZb58OOxzwchfBIFwg==
X-Received: by 2002:ac8:584c:0:b0:4f3:4379:1ba8 with SMTP id d75a77b69052e-4f4abcd08edmr176492461cf.10.1766484513296;
        Tue, 23 Dec 2025 02:08:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm249823015e9.8.2025.12.23.02.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:08:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:08:21 +0100
Subject: [PATCH 4/6] i2c: designware-amdisp: use i2c_adapter_dev()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adapter-dev-wrapper-v1-4-bcf960a48fa9@oss.qualcomm.com>
References: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adapter-dev-wrapper-v1-0-bcf960a48fa9@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jFY2omOpfMAaJIgl+Gb+/qo5FachDk5TZbli4RoFq2E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmoXVosAx6ol9l6uKw1+B6Il9FuDJK170LVKi
 FWfYjeAOQSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpqFwAKCRAFnS7L/zaE
 w54NEACWK7fZwgjXJiCGoV3F5nO6iluHSba6DxSimnc6cM9gVS6ErMafmfMGNMqR349WQcjOxih
 +hPcenMC2svxBXbCqJFuDLyg241e+9I9ia/cE1RRGtcDTupBaESqFlzhal1Nv5jn0FB+opWrAdg
 0mOIs501DSaXZArrvrBGwdhCLX1DqAadSe4njk4IKI5ogq4xaY5w4Qp2EnxnHiwHpI1VNKxMwC1
 SZIUFxBanx9lw8eTWdtr59wk8VBS9MhQuJ0h8xNZ1ocz5rMSWTfjShwoS3OWzr7HGwojmZ5wKP6
 qyCE2rsRHp4HWDY0A3+JCrli/YtUMXcXkspn8Z2Jq6L5WtD8MeOolOGXdjQC4B001yDHRJcfeVK
 GY6hDPuK14NxzrYZinzyXq/Qbd5NDYAPnrIxZWJELSwN8PGiX1fvmsNNJNoWhfQBfV1CxFU5CwM
 KWmwX10Npr5VfALt4s7GAN2Ee9WpSUB6XtHfKFTlep1WweAHAjGOz59AyQINVMbmq4fkJHcU4sU
 hZKmgOUGFAtzLeVBBAF24sEB4J9GBax4ahNURH+s2vwazjSh7cO2JRWF/A6InV/ID+qwFoSyjGS
 W9jraBFV/UOcqIQzRGHRmxsqR+1U2fa1RfoDYteqiqygOvOkr49UOb2qo+af0AX64Gukh2rLYGR
 lfTrAWcRorc3IgA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a6a22 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zdNWxmMMA23eHnuPwWEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9UtkCwD60_9d8f0NE6R5elwkve5yD03r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX3jb3IB/EXnXz
 YtDjccqh/OrPxqUPYzqHB3ZnBmL/wI5gXWgCSdWS5cl7SqQIMHw7uuZ2Lsp3QEqt+N4o61UnwpO
 lyl3PbecDcHE4AiDLHnu0hoQk/qbPQ3mJSmHuhYWEGwfqwSDyvESLIbcsWnGDbx+5QcDZTE9R7S
 B5aA0Wn7PwIBSNuoBi0AsEgMTiKwvNArSKgbTPf5nZNrRaay3UkxIi4wT3DFQLnpY8MBMLjVOMn
 lAdOS9FzkWhYry2oXWMHM+KQr8dB0nEc911+witGAzU1J9ftJqbjkgafo03xXDl3zkh6qPD1rJg
 VassM2O8m48twR9657FBJs3yCAlu+shaHmZHKFTUyi8zNUF/uFUxCVBpuXPa8eUoAUh+m8z6JhB
 S/qCeg+l718HXSylpoHz3zVHc14kOGydIg34SjLS9umTiR/2UwFzqjPp1S40Tbr8kkvmREfaucX
 AIYGYxsVSFazTwjdBcA==
X-Proofpoint-ORIG-GUID: 9UtkCwD60_9d8f0NE6R5elwkve5yD03r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use i2c_adapter_dev() where applicable in order to avoid direct
dereferencing of struct device embedded within struct i2c_adapter.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-designware-amdisp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
index 450793d5f83921ac9a8c6d00414890779da49c07..67772bccb71927e870c11fa88340caabcb07f264 100644
--- a/drivers/i2c/busses/i2c-designware-amdisp.c
+++ b/drivers/i2c/busses/i2c-designware-amdisp.c
@@ -64,7 +64,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
 	adap = &isp_i2c_dev->adapter;
 	adap->owner = THIS_MODULE;
 	scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	ACPI_COMPANION_SET(i2c_adapter_dev(adap), ACPI_COMPANION(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
 	/* use dynamically allocated adapter id */
 	adap->nr = -1;

-- 
2.47.3


