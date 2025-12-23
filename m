Return-Path: <linux-i2c+bounces-14724-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E12BFCD8C03
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A39103016935
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBE235E547;
	Tue, 23 Dec 2025 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chXowG1h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JknRBcHP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1590B35CBD7
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484515; cv=none; b=ruIwou6bEfvLJ/RvTV3FAfOMvOe/qFIOEVK0hZbob1dxuHkzY2oiyM1Ht+7vMIxv0vXx7k1pPMZ/Etskofmz4B6nSGcuau6DXTRrExP/Q9cO5lvG2L7b/OS2g8KY0Wc8uw4p+P87eVK7iXYlUh/zV+wcImO4r0jBLjeSE5jO2qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484515; c=relaxed/simple;
	bh=Z5KPbdqn4uvha6zcS+WkZwXeZKX+eIPKsPepdBryHfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Za29Wj1QR4VhNETSnQ7lHKt7XKUhCemFxE4uYuvuJYCc73KJ13kXuAgaQRpqQVY09oRfuUNZkTR8PRS5+mkm0WWC9Wimffzngjplcm/jNek/JDwKwnesc1KznSj4NxwUeXFPF1MbcLO81YDEQGFOEDRF9tB38Q8M/2McFxOdZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chXowG1h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JknRBcHP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7xqN4024545
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lN3W6xWp9B+lh+0kpr0mDEhONt7uEugYpB6jzZrLJo=; b=chXowG1hKVQd3Dbb
	xXSytVMARIgj9l3y/Q6cskdFSGZX/et2uSYWmZSh9u7GzwbI8GViEksR/0xelsGw
	Xs62Fb6lcKzQU1wwAXDfMisNToc1SUHL3f3RAtt1rpCTjVl9NdLOItAFe01mCs0L
	bCUYjPXZf4HxkX+llIsGgMUNjzf2J4TUMAZPs1lYH2KqQMcQGI4cVPxXexe46z8A
	cq7Tk9H5SLQoZvBflQGDF3Lr5hkh/dWayIL+8uIj9hZUp4CzMQqJBJLszH5o0jhC
	EQfzTbg+CI5fbfF3ZZJwYo4L9VgrsfkbVEd1cJNA/w+aX22+KaoAks2LmAY/UVLV
	2gyZRw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha774-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:08:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0995fa85so136803321cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484512; x=1767089312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lN3W6xWp9B+lh+0kpr0mDEhONt7uEugYpB6jzZrLJo=;
        b=JknRBcHP1MMcNuvIhJOZx5mAZhshyAZKohlKhPZ7B6mF54gsh4u7M6KI4yIDrmGBvM
         CJmTJup5VZioKAisfwyChmUkH2dtX2cBK4bWgm7nM9CtFetLEyW0cI1TvkGYAdkBeprP
         p+pIpTz+q+JLLMTkccBYYUVFQNVnygTBztfDOs7Tx0Qa0ru9YlUApjzgojeH2v53Hf7C
         82YqGloOyyh+ftKjmVW0KAVszkxVymKTz8kJWCd4BCriakxAWVdmY3TrkZG//u4c184v
         sS/MHTfMRaGkZs/GMhOhvYillXFTyR60W10qrEbG3HScTXjbqfThY2g4+kR67rPAe1UK
         mbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484512; x=1767089312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9lN3W6xWp9B+lh+0kpr0mDEhONt7uEugYpB6jzZrLJo=;
        b=oBxdXUsR3ADYaGAxf7vJ7XO+pGXRFgqd4oDGJtAG1pPoFWldpTj0KbAFapZurdHpzK
         lKoD5G+Tbp5FPLWQYD1ROdYBG2E9KYLAn/52nEBrmuAtXVC+QI/Bf2u+Q2xV3EmGYBzR
         BcZKM9xTuXTiwIzMFHG+BzRjG5qZX1LCBqAO1uMPgcaU7yoWjDYXPlhCQmI4X9VLj2FV
         mLnvDR2cDH62nyCH7JuCX+UqgU+jrtEB1jD+LlpBrfeffo80fdKOzLWhUgUtMkmQZS/B
         Jff5vJlnsXHJ7zl+OA46W/hPcsj9/nw9pIP6Qdn8jj/pQ0xfCCGS6rlaRis89wyfnhfi
         MVLA==
X-Forwarded-Encrypted: i=1; AJvYcCUOQekI26mqD15pR3ROYYtQ0++nwMulMOTOu/eVpn+xarspCVR5JhppVCgLOVMoxZDmm6oN8JHoQXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqhZCazPY2Zn0l4yC4gH4hxyq6H6cVvnB2JU8y6AHjzUHlUpgx
	nU036QWrK7cBDh/bvEDq/6dclictzI/xF5dBI0OGE0eDVyIKFrdDp5tvAolkEiHx6wVBtQJ7Rbm
	qyAHCez42FhblTIep92NaS7JGTcN1AUljH9tU75dqlJTMWntQffMO1aQWfmGM8KY9VP44qjQ=
X-Gm-Gg: AY/fxX41CkErOQkQE4FehHF0UT6fseipmI8ZmLtMEv5yVeaTNvTzh6fLtM3gvrO6Sdi
	WWR/Wwz98PV0ufxOqybhcfrqJ3zDP2/HMjKMmDey83UeDQvvNyCivMyw+d9T2yx/oZOlpPneeTH
	M3kqFmEvDZR5s5wrhvbjEcl0Sqy2Ici+4yJKBuRpSlqTJ4LSOhrHXljxIlF0zLqsI1hS2dAODJz
	KHxDeL8SJrOSz1HQcUr13UoErZdzt/Bce60+WWWvYnqGZURrR3h2jfUmm7nE9n9T3rPgxj0xea4
	iVB2cu5xX7TLkkw3syXwfBa/KrusU62RGPaAId4QAPf9ddMmUXCMLtOaOBsOhGCYNWyC9HSFLew
	zL2Ft96xyGuQu+2Rmzla8keeTwqSqeUYgVjyXkw==
X-Received: by 2002:ac8:5812:0:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f4abcb5a4dmr210169391cf.4.1766484512455;
        Tue, 23 Dec 2025 02:08:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGLpgT/UpYcH7RiF5FBCppKPFcA7k8ExHsMtJEu66BgbX+yZCwG3cXchFekriQTCNF1lEpAg==
X-Received: by 2002:ac8:5812:0:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f4abcb5a4dmr210169051cf.4.1766484511958;
        Tue, 23 Dec 2025 02:08:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm249823015e9.8.2025.12.23.02.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:08:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:08:20 +0100
Subject: [PATCH 3/6] i2c: amd-asf-plat: use i2c_adapter_dev()
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adapter-dev-wrapper-v1-3-bcf960a48fa9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z5KPbdqn4uvha6zcS+WkZwXeZKX+eIPKsPepdBryHfY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmoWVd/MSwSJ1kK/5lklgBCiDhztXFUDRbwD4
 ZgPcA1dnHmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpqFgAKCRAFnS7L/zaE
 w1NxD/9Il0RhCvsK0eXFNNj9QKvlHQMKzLa6A4rz7cjxAQyHlwax7yufqmN6ifzwumX+SYDgpps
 fwGzhg75Ui+emkB9oyUrDrFC/bKbLSUqW2xG8FXFyVzne5vHzxPYy2zeUkP4cvJkmKT+xLgbMQV
 plPv3wUVTGYFvJ4YygN7kbAeXfojGJTXhYe30HZrh5c11Y2q6XUj89UFtO7BIznYPysrORS0nn6
 YBv1cifXv2WTbxDGf9qRp9qjkaySntnCJi6jXKdWecA/XuzmSNu4l49qm9H/ej9vn/zjlAPeP6x
 HvBh1LDm/iWNwWEnolkFJu9rrgGVQeRgRJ6EbN14Es0ExTbuh4Zaw6XVQwD3YZwOJeGlYuKJUgq
 V9ldyOr6cSw98OHfm2qaqNOdzFqk4Lo2MX+l+NvXTrnMpd8xNpcKb0lxrwuitX15Erm9Q3Jdiic
 o0N1R+Orm10+KRF5iQMp8Z1ZI8StBZpm2k9ec6sfX/u19Syeww8+m0zvnRgACNsdUBgoP6VJlAO
 CDGillwryqwP7wQYyTTeGMfnWdLJASrahfD6LbVmiEW/Y1vKkmAgkRobGgxeLeDW7mSpbet2K5u
 UAkR/R4LabsZdCvHAvFDGTU3Bkzfo+Fqd1COgewfbKdD/BBY2fi6oREyBLgMp0vWSwtHPMYN1Pv
 GqXXFpxwDUm5Usw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: IEBnsIwpXmgKMmc4Vcow_1zfK1O0yZAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX0cnzT/05jZkG
 PbeKMfSJ1ggJnrQXA9u8xWpUMBW6Ekq2jJGfwwVFhvlkdbzTk3RQG3mDtVSpsz/6DS/p0V4gJiq
 hoxabHq6aHz71C93/nVWgYcyLxEh6EiyxjefYRQ9LxQZzj3wEVjXK9FVHivj3gvAbKhagqAXHle
 y+btoJpvsJpBmkzYzPiEuyQ/peMNhR2EcBQSLZbl8tLcSSp/qHDJxW3Ie8UldEM0QSg2BaN/ggq
 YYIbFDb1eggLCGRtDvYFx1+HRt9ukw8K9zN+iF619OgVPda9VT1BLVa3ty0tR37ikEw+Zc2sZTt
 zJ4uVM1n87tVKJJprkqFDTpTHEOLfQ1ZgcKSh+bk3h8chE8axlGzaXK0iqdutZSdYmECjqZG5ik
 vShD/lqiyuR4SkSEKYiRzm6yjI84AJNAqBGgZvSKcfhnoegYwU9IklRqDl8YQVQ+YmDHiNNDTTK
 6XOESdCK3ylu/JkgVyA==
X-Proofpoint-GUID: IEBnsIwpXmgKMmc4Vcow_1zfK1O0yZAk
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a6a21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qEvBVMLt1E1eEMTY2asA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use i2c_adapter_dev() where applicable in order to avoid direct
dereferencing of struct device embedded within struct i2c_adapter.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-amd-asf-plat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-asf-plat.c b/drivers/i2c/busses/i2c-amd-asf-plat.c
index ca45f0f233210a3b03a16c4a240012bd524fefb0..271b1b24417d06cc87733268c3191aea16fa1d83 100644
--- a/drivers/i2c/busses/i2c-amd-asf-plat.c
+++ b/drivers/i2c/busses/i2c-amd-asf-plat.c
@@ -209,7 +209,7 @@ static int amd_asf_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	asf_data[0] = dev_msgs->len;
 	memcpy(asf_data + 1, dev_msgs[0].buf, dev_msgs->len);
 
-	ret = piix4_sb800_region_request(&adap->dev, &dev->mmio_cfg);
+	ret = piix4_sb800_region_request(i2c_adapter_dev(adap), &dev->mmio_cfg);
 	if (ret)
 		return ret;
 
@@ -224,7 +224,7 @@ static int amd_asf_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	ret = amd_asf_access(adap, msgs->addr, msgs[0].buf[0], asf_data);
 	piix4_sb800_port_sel(prev_port, &dev->mmio_cfg);
 	amd_asf_setup_target(dev);
-	piix4_sb800_region_release(&adap->dev, &dev->mmio_cfg);
+	piix4_sb800_region_release(i2c_adapter_dev(adap), &dev->mmio_cfg);
 	return ret;
 }
 

-- 
2.47.3


