Return-Path: <linux-i2c+bounces-14699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9B1CD8BBB
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D517230AA9AC
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CDF1C5F1B;
	Tue, 23 Dec 2025 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TH82n2RE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZ/QbAb1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496A933BBD5
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484189; cv=none; b=bFmmUZc3YsB27Al3tPNadGDFI8zCRxd4xMX+gm0UOCNTH/H1wiKv82sWdykQ8FNkBf3n5JixpDBc0g3NXvaQ19kkkKiI4lGn5MSI0XS3YHHxJF7edUBWV4r18tF2CwsgI3f2S2XQ4xaazWrapoe0NKG6A2FQnkRFMjSbKZzOkeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484189; c=relaxed/simple;
	bh=4FwHimgg29jlntM6pAuTRFRVSUKHlsg/WMwTYloxTIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=av5bpOTu1PRqFBCfzOy6+khBB8ZStQ4YP23fr5XWKWs2SKxR9okXJPOOg057IzkC+58kJx8FipmmbL8wg+m5wYvc5RXBDRH/7B3GzB71HpSQrciF93vKAnclG1BXStL8SCPN/XMECGmgPD9vI85+2dckWqKWW+/UYCRPE7nW1TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TH82n2RE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZ/QbAb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2rRDl1568861
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=; b=TH82n2REmZ2IrdP6
	aoMlqIC7IqTaux2aOxGZa/nehnemTyKBWoO/gusPvJ2i7kBV+sZ7BpNP52dT/BiT
	bV7249MTKpyxGvm4/W8xBHEIIcmu/cm1zPVrYCbIRLjMFDVzJcZfb651hTpYwTgA
	Dm+gPtTlM199hlN6zaqzsyLoc14I6hrs6QVqT4Ntb6CJ5Ww/S6VyuDy5cXqDf110
	Me9+p2Uz/ZYGIWv0ydKHbCOAHOWS3+k3+V78hz26BO1gAJ9Mirzxc9qQhZ1aKthb
	DWjgCiddrmF5NmVOpqsRTeBGjlkKSk1rBa/Bl4BDWHcBLjyuX5b4yGMvGcifXkpr
	Dcwyhg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy377a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1b39d7ed2so106911921cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484184; x=1767088984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=;
        b=WZ/QbAb1QgwSlhAYfQ+sJ+98hMpBV9rkWNv7sXBZh782M/pv6F4T5537wNvZQ5N45e
         IC1AJTBxj6jgACLqvwvqn8Et8CXP2b/czfB+4Ys23rVTtXK0wPn09S077t9Tbftcy3SJ
         e2pdXtGRPI4HNbgqKNfmlCFkHTlrUOFrgF6LHMA6dWBBSRMbCCq0msXkgCtUV7f4WyC9
         QIZHYJ/Yhh1VJAdWIcyeMkd9Rb5SxmbkKlfZwMAPu3kkL5EGXIxzgBWMEIr89ujeMWHy
         CID3ZmpL0SUbiq0PZ3T7YK7yXc2tXIZRCEuR6YqcO5CLaZ/KBeNbvtth9f6Zn0AwsJE0
         BMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484184; x=1767088984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s3KzOvEJ3mLY2VN7JHFOBtmtRk05pXH+bmSQ3cYbJUU=;
        b=Z3sjyrwB1uQcuBPWP1QF/1QUrfV/bpQoDr5PnF0PgbpaPH0r2J/UycdhUlNdQpiGeh
         JO4smdNEX9fau6Ux/xGR3aXERJDELkWkn7/YfbPCwJnX8Xr7PPnPoQLrwLj6iIA6Zs5V
         mWMAAMoOiRb+NJw/jTvlsV4kZkswIzslAjbMWzWB3VDX/+hIbh9AgKnvPdInyXmxrUB8
         rUUhAcf1KNVS33HIViXw5eUlyv4VNAHsbzeF7RteTReaod9wj7RK4CqDwWJZwxJj8cBb
         Cfd/O71Lii1ATv/hMwl6HoeviCGfMx69e7DIvuSFaWWMktm0SGjkmZSabXaU6kK5IFX2
         R3vg==
X-Gm-Message-State: AOJu0Yzud39ImxBhxA/Pw+4+iWQ9Q0MpjHw3yg3Z+NFRvkd7ARL0fS8k
	Mxj/gUokGvHBth0e9EhavVmZ2Jf5i+bALOyZehA4YzFanXOulmlYWCJ77jO/Z2TFiVfVSNDO0rv
	cN/g2Nem0A6+5554pJBSPLdyLh/okY9MzWFO+NMgLlkICa36No9AxBgfhSpoGRno=
X-Gm-Gg: AY/fxX4wTb3U+Bh2dROBx13NpW04rtpVDFqqCAbtysu6Wsi14486xp4cihMD2JvFA+0
	lgybgZn0734YWO6MTZrmJ/w+jPmZhYh19H5GwHd34HO81HmpdHenq04dpDhQrBfHdvpB/GAKq2r
	/bFZFmVZ7dqp6vJC6dpMeHe0ZvyYYihhTUseCuRNW6t0qYc0Z6gCiiv76to3LGf+XnrrYd4spY+
	lgncrgiIEgl4+SFKIScvFIur1HOxYmgY1Jt7WtZnF1B2vNxP8h/uhfX25wmBAJvAP/H/+JYXVlZ
	oAMSj1gG7NWM3fvRcWt3LYiJlSpVQKzIkPD/wUPc7pPQB1XO9cnTENBQb9xEAPnVBWYRLa0QkJu
	bZT/r8OP9OpCUtebBxrOyTzX8ozop6jYfjkRg7w==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216034211cf.27.1766484183602;
        Tue, 23 Dec 2025 02:03:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAMTJ8pU1YC3SohbnEGLHAGZHc0AA80x7fYb578qtWe2mL3hTCo/7Z/yMtAiRHdU8xQS7aHQ==
X-Received: by 2002:a05:622a:180e:b0:4ee:268f:baa2 with SMTP id d75a77b69052e-4f4abd01701mr216033741cf.27.1766484183148;
        Tue, 23 Dec 2025 02:03:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:03:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:34 +0100
Subject: [PATCH 12/12] i2c: piix4: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-12-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4FwHimgg29jlntM6pAuTRFRVSUKHlsg/WMwTYloxTIE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGlKaMKjcyICb7c6UsCyrP1wlptqZ7FtRRqRMa9ynrsk3cOjk
 YkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpSmjCAAoJEAWdLsv/NoTDTa8P/1PJ
 3J38Rsk8OVuFFOLjY8ZAaeAQBKgVC7sJzw7nbu3V+LQJH8+ifuhdooUdi0IlsXt97oMXa66FcQ9
 0gw2YiyNXkmud6rB3GC/x3c4uNK0wKq5spQJcT9aOUa8u/gZ4PPK4MfVSiy/Fo4YqRJURYxQM6s
 dAPbGdd7LynK69IU2Nl311cKRmBNscXNzM0Z1b4jOl1es4R/vbZA4pfJxJFdRoO2H8q0VEFbN0v
 zD+s3ZeRxYP5m6qWxnaTwRBrfeTH+Oos2g2inIEjSt7l4Xy6HZS5nefyfe8OWMEAxUeXjHs+bSa
 r8XLlsgEc9MVKOe2en8wvIZJfF/QZ6jd4xYcO+RJeORm0HzHdF8TgdU6oOgV8Xamhe8KsWMTV2h
 sNWtMM670n/wlBYz+kEBJ6YcWwL2Ecxu2HxRjvfDvCDpgXzBYBoV7ZREMO/10Ougp8Eplr3+wDs
 TCuxhaS8c3fh3rrA2IdE+z9h/IRc/F6os0IkJ2nAopuP+KVCoVz0X/pTy1kn84ukScDHqwKxT1s
 fSFx7xuLjep1ExXaYPvblmMmZYe1+UOQIDYK3cIhvYNaOUlyWNIBUQ+3Orngcn0vX/yUxGPAsNK
 lcfS+4siyLmNRv2Xhqgdtj4r2czS4tH0B4gH++Tezd68ywjNiXorRG5zcbWFFU+/8GTpHdiK0+O
 8TiEy
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXxev5CELsfv8D
 aURQafLgvD/iBdGc4xFQl74cBSvLlAwrPtK6A9G5QysTJTftsvVphUdZtzDACt7cQ85tVplzItW
 oKK7izEj+fb8zISweOmeoissdzZbG1PFU4fe6T2D5fePITHZezOul6bDcbSRfBUWR8DHvuoYo+W
 t1A9e4x8fIRqUZq1Q+RbDkaDj3h9ypVYaxZYxaqB4/C205002poiTkjLn3opwyobTrw8tjIHZ7C
 TMVj12AvZsGJCffT9avPjxG5IO4g0Ktw03RH2RRd7CEZO0sIVtO1mTWRoGPGivUL4ErqwpBhUFm
 /KRxo6s8lJ/GeJqiLH3kUqi6rWL3/Idktf6+SmvzBMCzqFvxX5BVivSn6p/IXXOUedjlyIVH3Jv
 1KaUq8wUbZJM5v1CdbyGhfddQ27Fyh7GBwyb+YuizQRaxzxZcnyrdoMvcFqhs8q9iAQ5tPJDe86
 2UXovPybVxDrAGCPJzA==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a68d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZTA4KjZG30Bk9MnLWp4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 50dYQWQwm05SGaeDRnjC8fBd1in-7IHG
X-Proofpoint-GUID: 50dYQWQwm05SGaeDRnjC8fBd1in-7IHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index ac3bb550303fe5893822af50c385004c9292e695..bf6ce6b4bed3f4ae8aa392c68189a67636c01bf9 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -650,7 +650,7 @@ static s32 piix4_access(struct i2c_adapter * adap, u16 addr,
 		size = PIIX4_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -825,12 +825,12 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 		ret = piix4_imc_sleep();
 		switch (ret) {
 		case -EBUSY:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "IMC base address index region 0x%x already in use.\n",
 				 KERNCZ_IMC_IDX);
 			break;
 		case -ETIMEDOUT:
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Failed to communicate with the IMC.\n");
 			break;
 		default:
@@ -839,7 +839,7 @@ static s32 piix4_access_sb800(struct i2c_adapter *adap, u16 addr,
 
 		/* If IMC communication fails do not retry */
 		if (ret) {
-			dev_warn(&adap->dev,
+			i2c_warn(adap,
 				 "Continuing without IMC notification.\n");
 			adapdata->notify_imc = false;
 		}

-- 
2.47.3


