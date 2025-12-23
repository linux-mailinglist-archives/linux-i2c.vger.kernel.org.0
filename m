Return-Path: <linux-i2c+bounces-14690-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D6CD8ECA
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1A83302B10E
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2392B3328F0;
	Tue, 23 Dec 2025 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqYaiNl8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpK+U7nb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EA1330D54
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484175; cv=none; b=FHfBhB29Zu1bZ94Y9EcW2DDg/CqYkNqc7giGn2v4bDRGG+6E27GVSZRlZ7sP7QeoJjK6dXuJ6I4HZoKrsUp8KlrQFqi/vULTUw43O9zaOmWeX9MlEss0JKHlD6LZElZKmQBCHsf2mhJiiC+yUDDzGrJNOHttc/J0wlPXatcpOuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484175; c=relaxed/simple;
	bh=FvmaFvmAIEhNHrLA6X7BowuLevjvRkQc3nvh8L7n9Pc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJS8L5ypCN9Dt9+y/EFzc8ojifYo+RWhWTxDZyHNADIW+EsuyFQXbY4ZvfrHj4OJPi2rkeKcKJebo6ivRYIpyUWGf93zOpDVcLcWP3VyBCFjmweIljBD5n8EY39MTL88yB2G7nTsZPS/VoBtKvX/PyXpuzX3Earv1naXLqjPs0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqYaiNl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpK+U7nb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2XtxV1528928
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ohMcQFhPQSoPD7Mh2X+mD1q/35kyWum4P4ToTefAoo=; b=hqYaiNl8YwobIyKg
	hxOkqvBAN3TxCSgKl9KJ8EULV4Sc4AkPYgpd0xL5bQRBiJf5L2ghq+DNA3JOFEZQ
	BkoD0TtYoTTfWbaXcOU/uvdbDX0ctBwJQjoZEFQG2t7eBztRdYc15wFdjc2lIj/a
	oYtf5orfZo6Keb0uC2E0vWSdrNCFXNZ/UKqWHqtMkSXc3bQXw24a+WvRhF1A3Fzn
	iwadGz/FS5TBIDEECrKIR1yYTjVw76Q0af4h+j+OcaencKYY8mlNaRDJW8llY8FV
	m0J9gq0Ibz8/fBHd/MUbc1i0nBlDnZJLoUA0gSY0FEvdEEzXqvv7i9xLE+VntaBm
	eQCkRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3g6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso45697421cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484170; x=1767088970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ohMcQFhPQSoPD7Mh2X+mD1q/35kyWum4P4ToTefAoo=;
        b=HpK+U7nb/bunZN+l4mXIWdn0/SB+AEW9eMc4gGCCo4p7Y8VxFMeYhu0Y0u1/nApLWO
         KKBsUvEYwjGih6fM31klThdXQVeUMoQoVHjyptgGC3Bl3JtwLJx2LDkstYZaFfnkHkPD
         ZQWTNd0/fC+rcW1OH+PbSwQulXBpaeNjg2wnuFTj83LCR/JHvL6w3vJwm/lWm4p135j7
         5+WQVqYrBsxNCJKU+Bo9dLJH4gkdDmJlxNTk+FwFrhbpv8imOjf6R5Y4Y+8KlfDZ3LbV
         7bHgLrN7tQmMSyTrabufPc3QG+AMLBILDknKaJoBhc57x8qv8nRU+qr+ZA+UPR8teYE4
         ibAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484170; x=1767088970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5ohMcQFhPQSoPD7Mh2X+mD1q/35kyWum4P4ToTefAoo=;
        b=sTCMWlFTFwYg/iTkEAzRLxN7ouNK+/GNXDOph6W3XXRhQuE7d5GUMOOBWWCXD0/nFj
         7BVidDJybycDbAyNUiuLGO56jrxAV/lphL2z6p/5NQJkg9/OhHGKcTVAMuvgySkY1flm
         X5/cbzCQ444nt2fB8olJsQmUVlBXQCPZiOH6yyU9C7AYq6lUojAshXzcf2udQTH64kfT
         LvMKdhxHlucEet5dQobFS8/qYbFnZ//FALeSFMlMFjgjtS2OrazL1HfRxdW/OY9d01OP
         iCwKNUEMVbiL9qXvtW8fOx2XEhXFjrIgfmMlyWaAgklEXQ+L+Ql2avQN/A9lINrSemuS
         YdiQ==
X-Gm-Message-State: AOJu0YzNf5ffdlS2OxKIMr8/9QrQDTbVk/80cRboSP9zOl/sPj21LFb3
	TfGzQ2+Y3469bOSVeTe4MxIK4RwkRywiVJPu9R5a0KZBpTzQtIIRBBIHZzdz9FwrC14Ab3Bq19P
	wFHnqtj/PffA5Qk4DaqGhdZmXpncvWYm54fgtKtmw1Qt/99VZSR8+7hUzL3qPXBg=
X-Gm-Gg: AY/fxX7cbLuznNRevvh8gcbiZxV3XjmNPyT11xmvhLTmmFLZ6Th1LJC3s6nioT8VnhA
	iqLjh1xIKRU2hA2UuL6s0m08OjHSU2Ldc4vfb8Ov0L4lWi8ov26lvCVaMvNYAutva9o9hgwLrXx
	4I/fUxK6Xvc8EacR2vHFh+X4w5RpXo5kHq2rpwsPIhpznFCOCjvc7ZLpYZdt6dMoCISPCEpbb1u
	Utg6yHq5xryJChaH5HLLieTDbmBJ7+9ZzIeV1uKdqF85h19vCdCYjnV4Qt32tO5o6+6yX8cZvuM
	dkItram3h2z0w5mHRwOiHeriMco/MKmqbVvoYcBEn1otbYszi5+9txhY77yxpaCBjMx6VZnIBVj
	p3h2o7aafEdleNAWTYMnwsL8nK4912urS11wEWw==
X-Received: by 2002:a05:622a:59c5:b0:4ed:b25e:a721 with SMTP id d75a77b69052e-4f4abdc97efmr207150891cf.78.1766484169723;
        Tue, 23 Dec 2025 02:02:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGNQnUH8+q4d1X2aUWQFd69HHIxqQqX9kHW3GtQxbPYR1v8Q/zvrh4kSh1BGSGr6Az9NhDDA==
X-Received: by 2002:a05:622a:59c5:b0:4ed:b25e:a721 with SMTP id d75a77b69052e-4f4abdc97efmr207150471cf.78.1766484169331;
        Tue, 23 Dec 2025 02:02:49 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:25 +0100
Subject: [PATCH 03/12] i2c: mlxbf: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-3-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3690;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FvmaFvmAIEhNHrLA6X7BowuLevjvRkQc3nvh8L7n9Pc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi5f2wnYAXfAuk0aHyw3LAU5NsFlEXThEG/C
 atkhJYHv/eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpouQAKCRAFnS7L/zaE
 wz94EACjJeVfRaVFSv1LgK0Lt6YodrriTrFRafP5jzPZ/SrKUxVMFOXhyVi2Qhg+3HnmUD/kfuK
 ca3QEJEKmm/MGJ8Z8kRF3ufvaLgbdcqVRQ2AA5ZBFisy9LiSvXpzc+eHRD1Cn4GpGoeqQZaZu7S
 uDearY1gWQ5M2fsQUb97Dkt++cogEtT9knhMt11iZFvvOIxGVmIQ92ntyA0n1nfIj9YjE6uL3GY
 GwnEbtTR2Sllx12Dc3z88/Tp1X36aEGndFhaEQOODNUYDo4Wuc/4N9AYKrJyw57Yz1aiGutrdJj
 /uS5mGo83GFnJTaHQBUNsdwfYSpIJUxanoW+BhH1uzTGoq4x3MJ9UBHS18HVPjDP3lloYPuZiwQ
 jXmynyUGKuQHaI05bO92NHUHSYRSFTdcXPcXnKbYu0geYPyVI52wWI9NeqOFWPEuaTK6UUEp+7g
 DP9Q0DxbVOLk5nBCWNQf6KTeWI3EanYSc9IMvbop2eSkNomC0piet9Yv4QkDVRrV6y73bDLzG3o
 rbguXoVy78noW6FG/N342Zdm+Kyp1DIfokMSmD/UlBPHzt67crGWQCGChAD6TKPshl5jRtAAjK7
 28/TD2Rv3M/CBXLPhcd2WTS+KAhPxA9rAj2d2GkR9+Z7pwu/cecDb7u+cGjWTj9LXiLYPqnraRG
 Sn5dm4jMAVF5crg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a68ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KSXH8CamUCXRpb75a7MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: x3rpFt-uN7cNLMyJ9NtJ298Y4WgtzBhq
X-Proofpoint-GUID: x3rpFt-uN7cNLMyJ9NtJ298Y4WgtzBhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX3knelQx2ZqgS
 csA6kstkrK3Dxmx27DbiUPdVVfibcGKMFVAv4Mj7+zHKukJdzLgLKlfx+hIzcbjrl+aY2LD9rE3
 AwKzLet5CVUVgXOpL/sWmFgag3IfLdC65YCrGhTea9bw9N/C5/UcIbd4uSUOta64XRqMhl+3b1K
 D8gPJKWYMopRzAwwGSye67eHG9kRCu1CYMEqtxTry4ahFAsHgfnfjsPFrBUpx1PqeTo9Q7oZIQP
 UgOxRbYaNSOheHaDJAEtsb+uRhurOhSaB55SVG0VlCFN6T86Do6MPsjhNTX1B4oWYptI1WXVR6v
 1JJOzfxyVAVIlKm0gzfuN8Azqr0zHRf/eWS8kwVDOESQqJ8jwAjTIuWC6uC0LDuWA3tUy1VwwVL
 0OVp6bn/GrIfl8XP4ukGxeC0YUAK2GclKStldKKhK86ZWXNOMyWocskFdlj+jMAjtnqNlCY6vxl
 mfSFOH4NfX2X3YtBPOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 8345f7e6385df64bcd3a82021df3f1e04524c6c5..78a7e893b572a682133b3cea200f571f1977ca1e 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -2045,28 +2045,28 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	switch (size) {
 	case I2C_SMBUS_QUICK:
 		mlxbf_i2c_smbus_quick_command(&request, read);
-		dev_dbg(&adap->dev, "smbus quick, slave 0x%02x\n", addr);
+		i2c_dbg(adap, "smbus quick, slave 0x%02x\n", addr);
 		break;
 
 	case I2C_SMBUS_BYTE:
 		mlxbf_i2c_smbus_byte_func(&request,
 					  read ? &data->byte : &command, read,
 					  pec);
-		dev_dbg(&adap->dev, "smbus %s byte, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte, slave 0x%02x.\n",
 			str_read_write(read), addr);
 		break;
 
 	case I2C_SMBUS_BYTE_DATA:
 		mlxbf_i2c_smbus_data_byte_func(&request, &command, &data->byte,
 					       read, pec);
-		dev_dbg(&adap->dev, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s byte data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
 	case I2C_SMBUS_WORD_DATA:
 		mlxbf_i2c_smbus_data_word_func(&request, &command,
 					       (u8 *)&data->word, read, pec);
-		dev_dbg(&adap->dev, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s word data at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), command, addr);
 		break;
 
@@ -2074,7 +2074,7 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = data->block[0];
 		mlxbf_i2c_smbus_i2c_block_func(&request, &command, data->block,
 					       &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "i2c %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
@@ -2082,14 +2082,14 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		byte_cnt = read ? I2C_SMBUS_BLOCK_MAX : data->block[0];
 		mlxbf_i2c_smbus_block_func(&request, &command, data->block,
 					   &byte_cnt, read, pec);
-		dev_dbg(&adap->dev, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "smbus %s block data, %d bytes at 0x%02x, slave 0x%02x.\n",
 			str_read_write(read), byte_cnt, command, addr);
 		break;
 
 	case I2C_FUNC_SMBUS_PROC_CALL:
 		mlxbf_i2c_smbus_process_call_func(&request, &command,
 						  (u8 *)&data->word, pec);
-		dev_dbg(&adap->dev, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
+		i2c_dbg(adap, "process call, wr/rd at 0x%02x, slave 0x%02x.\n",
 			command, addr);
 		break;
 
@@ -2098,13 +2098,12 @@ static s32 mlxbf_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 		mlxbf_i2c_smbus_blk_process_call_func(&request, &command,
 						      data->block, &byte_cnt,
 						      pec);
-		dev_dbg(&adap->dev, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
+		i2c_dbg(adap, "block process call, wr/rd %d bytes, slave 0x%02x.\n",
 			byte_cnt, addr);
 		break;
 
 	default:
-		dev_dbg(&adap->dev, "Unsupported I2C/SMBus command %d\n",
-			size);
+		i2c_dbg(adap, "Unsupported I2C/SMBus command %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


