Return-Path: <linux-i2c+bounces-14513-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF736CB7C7A
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 04:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E8C03004408
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Dec 2025 03:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5852F3C3D;
	Fri, 12 Dec 2025 03:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODQGYmd3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i91hOi0H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AE52D9ECF
	for <linux-i2c@vger.kernel.org>; Fri, 12 Dec 2025 03:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765510036; cv=none; b=Nh1Jc4CwMeUE/W6AxRSSXFzT9CYXT1VAZ/y64UhIN+mlHtqiM3lv3I6wcaJxu8PHOZ0Wq2EZf4WME5PM+9Xdvz/bhibL8VibNTgymdffQKwbJQ+SsJqVlFL0Xw0AMnyTlM4kpvdFLzP7lLQ7kHqWlw1QhkhAUcy3fwsZfHebI1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765510036; c=relaxed/simple;
	bh=vzplLiySwXqToPIZp7dgIiGEvLdy3UQNWntDgq+R38M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U6PTIAvcY8cDO8JEjxK/5g5ICVkZcB6YasBpNYKqx3UDOtfn1gJOZF7p6fCoWgrfP1Lst81Q7Ra6TGZsV2IzczHf7JgZHWyTixh+rHqzWV69HVwgeACnfbLYiHzchtiPOuJy6ji+4pK6OHZ1nIYnCmMx6NjhmtuX0VWMSy69g9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODQGYmd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i91hOi0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBJgcmP1652560
	for <linux-i2c@vger.kernel.org>; Fri, 12 Dec 2025 03:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+jNsDy2q710P3fBK1IktYIT/VJazGzVybt6
	zeKfg1Sc=; b=ODQGYmd3uLd3a+GK5FI3cMkP/Y0LmQPBnpCwdUGpzdeNRthX5Tc
	V1SiLH/yMNE6qK8ovI08i655UOmmCAZNuqeoLF1HnnRkf5B6WH5zTgmrnK0iwdBW
	N6jBvPUbm3x4l2yOOvG8/ggM6E0WYun3+n5gI/55UZvgOzVL+bu8PX347itke/W1
	IW4uW1tOBK3im/GMeF3cfMMkzZeSMnNrP3YtWGVp5khny/3B+rOiWr+umzPprCGN
	LU5lF6DvUf0F5LHlJ+Gsude12sHhgEr+oV7Z9g+z0XZ9jeqPo0c1EEfwYlCwl0H8
	eL29cU9FFFPiglsHi0b3kYKC9CkP8BiPadQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b04bsrye6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 12 Dec 2025 03:27:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34ab8693a2cso1195588a91.0
        for <linux-i2c@vger.kernel.org>; Thu, 11 Dec 2025 19:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765510023; x=1766114823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+jNsDy2q710P3fBK1IktYIT/VJazGzVybt6zeKfg1Sc=;
        b=i91hOi0H/+w5DKsZcT8la80Kx62e0cQ0zgegsXmtoQz54Mv+O+J0ylDfNtu3olR8++
         EYGswQ5Vtb2RtPMEvi5sVKdXS/ucPlLRR/nF6/Jbl+1Cds5KXzkIOfIcr46opL1v8SQ9
         9ykIXeYiTwOt4MzsN1w4GT72BVa8w8ght7NEW/NqPNoEGy+u0iZGULxM7SC6aL0JT7vq
         BCf5hyM0FwNdMa9v/MoBJUFowqNHgyGk/XPf1JKKPb42IhflIEDQeh72dYJrSWny7kYV
         bEnlEe2SOpX1NT9JWN+ExZCCsVfJY8Xj8z/GAVwxpCvCsOZ1Dec2RSNBgz7HJFcsaPq4
         /U/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765510023; x=1766114823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jNsDy2q710P3fBK1IktYIT/VJazGzVybt6zeKfg1Sc=;
        b=OeP/EzPNE4RAZS709i+ZBjepcJOXUOYB7VNHrMffuae/f5Y1b/R7R2gnS+IBAkiKyM
         QKFRrRk6vcmYVUW4SlUgSO/a/Td3MkB7XREW4UPBs42G2DbHBz6iOVFI61achjRY2Dkl
         i5Rx4gYvaDg9XFiMoyoCRpse3X1ZgVf7sXT27cvSabJtPmGdAS5Cpc4uAjHobyMsE3Nx
         hkE1Y0LZt16J32A6zDQcYk6vALidhlXXJBjBicTlnT78bNeXxeztM7IjfE+5EbpjAVX2
         xvDNnDJtRGwn/dNbtRg3ljC3Nct58uPrLzXLGFvF/T4FAPlVpE9+kXqVYdSJo2s+M4/Z
         WsVw==
X-Gm-Message-State: AOJu0Yw/3pKqCW6aoHQH99w7xBXiqqvdlGJZdH5siZD3nLoF+OQL66aw
	mjNQs33wFkZidGswrWZQNVdbtKWod/9NTEdJIsiVijm6NMwzOhxR2OMdqX8vamFLa4lCgV8duLd
	gzdv3v6WtnaeyfjOdUyxXoWcPi348n1dhpNs1G0Y8hw4zPI6o3iClL5iHBKKShdg=
X-Gm-Gg: AY/fxX6mxFCxDfnPcF93U3yGtppmwGMub10+7peXVZ/ifXglhrOgKSU9LYTtTLXfUE6
	WVBLs02qtAWvHv5atiJpbfhZCNvd2MF3r9QVRdgev2hhmIfKZ9fLM2egm4xfhRzuWjsrXX3QLbq
	2VNre8DrR19L13qgMiLmb+YatTFCf+QXjqgcCroWds5SqvWKEGPy0VK+fxCzwe/DIOJlN+S0Kg2
	Mn7ECEz8WaNFoLoG1aTfNZKYfX8IKmMSqRgfmM9c54TtO1S5ifEp1EMzKh0oKh/AnsW0+N+zq5o
	CCPGZuB8RMZBJcvdAeGQSCyLtYp51UF8Vsv0RXEfcJ8UKEuMYn9eELzZ99PlDwalc8mMPvYXQLC
	NfxStoZGb2n0XuCzSMjkckrPQSJfIHcSgWrWRdYMeTbVbQmVSB862cFIkeDibB98=
X-Received: by 2002:a05:6a20:6a0d:b0:366:2341:4980 with SMTP id adf61e73a8af0-369ad9d3463mr723840637.11.1765510022564;
        Thu, 11 Dec 2025 19:27:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrkOHMeP63nKgD5aeWawmvmQw1jorX3iqI4MMXcNtI/7N6miObTs/RFSNZ+drQF18tS+ZBXw==
X-Received: by 2002:a05:6a20:6a0d:b0:366:2341:4980 with SMTP id adf61e73a8af0-369ad9d3463mr723817637.11.1765510022076;
        Thu, 11 Dec 2025 19:27:02 -0800 (PST)
Received: from brgl-uxlite (fs96f9c361.tkyc007.ap.nuro.jp. [150.249.195.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm3535538a12.11.2025.12.11.19.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 19:27:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] eeprom: at24: use dev_err_probe() consistently
Date: Fri, 12 Dec 2025 04:26:46 +0100
Message-ID: <20251212032646.49336-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LZ0xKzfi c=1 sm=1 tr=0 ts=693b8b87 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=kS9sT8ua8GhuIhCqqd6Lkg==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=76UdmbcYvL-UdFPH1r8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ew1Fg7z3ELADHzA8YdU98IRTff61ONbr
X-Proofpoint-ORIG-GUID: ew1Fg7z3ELADHzA8YdU98IRTff61ONbr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDAyNiBTYWx0ZWRfX4goei62JFAPS
 M+rlkkU8Zx/yJFfEVob69FMATJz3Oqw5nKbeGYRTBxZYvpnSqVAT4Nt+tL7HIEHmhFfi0Q1oy7E
 nlPvuOv5GgxyjrqBn94ihFV2Jg495XNG5taGjfsgSZYPlNpLmVvJAVSePzcNFZ7kO+dZJA6xC0A
 u2aowywAkvvZ9WUujNnDBYuL3jhXpe3k0IZWbZ/KwFfvK9aX6FYy7YNEBOJNhlTb89ximywsCN4
 +9Dp2qmiQcxm/NQ6qnrHm3IilG3wExfJbjBmXRyeF04EXdlwxBudDmWqk4xWIvT+1yAyqw4Nqmu
 f98+tj5xu/KYorYhZxy+/TOcOW6HBtRfjlrQph2sKR0Uyns0kvxzdrumzSfrZPtxsiS3Vb5X7Ks
 ybJYKcV/hMW7aYGPPm2RpBL4nS6o/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1011
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512120026

Save some lines by consistently using dev_err_probe() when bailing out
with an error message.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/misc/eeprom/at24.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index f721825199ce..0200288d3a7a 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -657,10 +657,8 @@ static int at24_probe(struct i2c_client *client)
 	if (!i2c_fn_i2c && !i2c_fn_block)
 		page_size = 1;
 
-	if (!page_size) {
-		dev_err(dev, "page_size must not be 0!\n");
-		return -EINVAL;
-	}
+	if (!page_size)
+		return dev_err_probe(dev, -EINVAL, "page_size must not be 0!\n");
 
 	if (!is_power_of_2(page_size))
 		dev_warn(dev, "page_size looks suspicious (no power of 2)!\n");
@@ -674,11 +672,9 @@ static int at24_probe(struct i2c_client *client)
 				(flags & AT24_FLAG_ADDR16) ? 65536 : 256);
 	}
 
-	if ((flags & AT24_FLAG_SERIAL) && (flags & AT24_FLAG_MAC)) {
-		dev_err(dev,
-			"invalid device data - cannot have both AT24_FLAG_SERIAL & AT24_FLAG_MAC.");
-		return -EINVAL;
-	}
+	if ((flags & AT24_FLAG_SERIAL) && (flags & AT24_FLAG_MAC))
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid device data - cannot have both AT24_FLAG_SERIAL & AT24_FLAG_MAC.");
 
 	regmap_config.val_bits = 8;
 	regmap_config.reg_bits = (flags & AT24_FLAG_ADDR16) ? 16 : 8;
@@ -759,10 +755,8 @@ static int at24_probe(struct i2c_client *client)
 	full_power = acpi_dev_state_d0(&client->dev);
 	if (full_power) {
 		err = regulator_enable(at24->vcc_reg);
-		if (err) {
-			dev_err(dev, "Failed to enable vcc regulator\n");
-			return err;
-		}
+		if (err)
+			return dev_err_probe(dev, err, "Failed to enable vcc regulator\n");
 
 		pm_runtime_set_active(dev);
 	}
-- 
2.51.0


