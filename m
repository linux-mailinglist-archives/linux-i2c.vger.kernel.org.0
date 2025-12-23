Return-Path: <linux-i2c+bounces-14692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A0FCD8E23
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D23C303359D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FE73358B5;
	Tue, 23 Dec 2025 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOWraz2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3RVqCZb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592E83314BC
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484179; cv=none; b=SkRkKcKG8uN+85rRpEVluuNOGL5A8+G8vtM8YABJLxUW6d3bUn+e71PWXSoQBJGNG340gvkbJvqXPCcm1fj9CEF1ShlnyP6k72ksEMggwLZstT5ycjxy+ZOYpIRSYpffQ35rV9h7rrJUmAR5viOFvCEtxfldrk5uNCylDfB8aj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484179; c=relaxed/simple;
	bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fx+XxeVZh1EGTlUHBWnuSCUwb19zueuOyeudswfH2W1Oa9zb7e0gdAwF3Y2kWWPC7z3MkYodOt1AL37+7POGCFp8+9LWIj4pbpj0CU3Yg+gZe7+8x358X7sR8CvhEPIXuckgIRpdOJODUCP5kVs52aAKLQxcT18PXGFFCRTxtqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOWraz2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3RVqCZb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9uLEa1530063
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=; b=kOWraz2TOCazDGf/
	xFaXszmIsPaHsVx1Y+SMk56kvHxWl6Qswq2UjwUwluKU3ZkPCG62E9lpmTNLi3La
	zkIIRrtamDCJyo3PsxPo8BKCV1Sjsw349P64AqU6rxeKvYsP7w3fT11QqEqVxg3r
	xYjd0kq77VhUBsTiiBT5D1KCkQvRQAg92A+Qcl5Xd/O0eFo4yRZyivy6QJqVeyiM
	jPwpntIMRWc26KtwrHcIVgwSdXpEZP9w1XV38ycO0t7cWYZ3nqgnJ7ynd0Z8Fi+8
	bgj4FxrIz26xWlDvCI8QlRK7Lm7lYQBjXANqdf9J70E/UUe3jArLPMO/kdnpOIbk
	J3ygjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3g74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09211413so121300531cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484173; x=1767088973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=U3RVqCZb8iPy6bwW2+59qQTq1puK+iQuzDEsgr7D/eg40Rp4sYQ9ggim0uzShPW6ES
         nmESOeo5p+k++64nm11HDDM4EpAl99rHH4wD9mIOhp0DAZeTfmgyByAUL07BcyU+ASM5
         5PIQ2HV+iipTgiOGDCTfN12RdcW+Tb+95nbH/7oPS+sW70od/th+Ri3D0Vew2Ox2DOwE
         60hvtCQzWCvUOUhs89fYq+flm3O0KGErEi0Sg7EndfTFQ+zYXoudSNUCr/41FmpcUpKM
         K6Az37aNh0L+rGEUbfuGLampAzd9CtPccPFJnazcBGgzQuPU2K/W6ZN6qRyrgqreKfPE
         3MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484173; x=1767088973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P5sVG0mcxnvXNxJS76KUg1OHt3/W4mYp9VRxOR5aqLA=;
        b=TwtAzL63AHMotN4EdH586RoZzaF4+Qjp+DNCcYr8ZqVapSGrv9coqfif2L6/Nkhtn3
         msB1QZt0gEyX761C9tbFrJvds+WYmJ5oE471Z0ckb3APX6pNQNsL4UE4gVeDPWZHfGkC
         bV7OSfwtFW1ffrTH9vkmkmF5cUAR0H4rSW8+Dpm7JzW+0MxPO2cWhyudXtgcrjBMzwqO
         8b8qz/p9lyPQ9QXjJKyraL6bU15BZ3WvsBNnL8oMPI73QZtkV+Og9pA/bcSsda7Ch+0Y
         5MhQivJiSKb7XPDe7a5bAdmSDYLB6QOCOqvWiTdGxFUzlexmKc73xB6Zq7fJuHZNOWd3
         8aPA==
X-Gm-Message-State: AOJu0Ywexl54OkkwpptL7FV/1Y6Mw0QdKmqsytKTE64A/pvMplQcGAKZ
	nhVPC7mruDXgn2ZCRptZFBSa8F9H18Kp0lQ7/mQKwjp/EJbwa3+LTwgmdcAExjzEMIN/T7Haxda
	TZc8VG2L00l5o8TXsTCnOxkVbK1vBuWWq6i/shu9RP6xQj8j9S/ZaA8JJSNib33I=
X-Gm-Gg: AY/fxX46bQ8TAjU5S3G87pVW7iO1PzoY2xhamSLivTpbSf/Xp8qL+o8GePI5X17XAVO
	2MwFVr2+eLo4gTgz0QWB3E9X0Mea2b8jx3d5T4b51nCWsnaIqGcBZnJZcRDE2EZhRqb3kLKlnto
	SdleJIyHqq+3H/C8PwT0HrP5128NJRc1A/1sGNL35xNEckL5H8BT5GGI3fETkxslhtneWzZpskz
	m+zC9/PqZQhX82h7XXq2+2pFmrsbAuRTk5SuL56sfPb6CndImZca3RVdkyEbmuIb9NjmBgbzfBN
	IuwbxTx9jFioq3Nxab5PXwOnfFGQr3nq/j1hKmpXxA515Ox8TSLu/0luLrQxHsQM6BprQ0XV6LD
	GIlVzUBfqC3xe/AsZ/7nGsB/Hy92LwmDvAkYgLA==
X-Received: by 2002:a05:622a:1494:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f4abcd08e2mr168062911cf.17.1766484172923;
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxU8ImwOEdXoIYf1MsM9TeSN65+Y/YYSiNRkoIkd0saptyh7UpmC8vEXV7Zyr4GO6jy06A4A==
X-Received: by 2002:a05:622a:1494:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f4abcd08e2mr168062531cf.17.1766484172477;
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:27 +0100
Subject: [PATCH 05/12] i2c: ali1535: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-5-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zLVSyj45uG3n1RodmZmb6MT/QpzgzyTcNCdqjEgFCZk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi8rAtrAU9cEajonJovu2JYczyiZGMkrWxDS
 Y5Jzyib7tSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovAAKCRAFnS7L/zaE
 wy17D/972dKE+ZfFzABiKYPVHpMHlDBeQ56KuVbzVhhUQvh0TJ2053lqVMHamKoPDvLT0rdTX4A
 99HxmF7uBeJtK+kbQ01Bdhmq9xHApLT+E29E37/AD2kEmDiqgh2pTnK/6jzrt33YZCho8x2JdmP
 FOTUzTACynBfyD/meIOwFNVUlG4WKdCV5XZDwe/EafvWX4xsEE1/NnLEWfwTVWIH0t7neEk1i7h
 zs7wBNgyOwLuRvCFDyHbW8Eq9uo32AHlKqIsh+FuKGKIhA4zqXstnLmuLRentmZEf/EiuAGr9Af
 ps9zEjpcLXnUWlm6GfINfIZvZBDiIMnd8wl1uhXmlEgM4t3FUJ7fwY7nQaskSu9FlHvdC8KMWBR
 ogcRWdUUbIXrCWw55dPDVkZoV1xrZIrrTHq/HzN1/8GZBOZ58mEZsDyGAM++a0RPSToPBNNfZQh
 Ols9ASW/RvRWlQMGgD0AI2ZrcFIgp2di6iLIqqxyhoHMo/1/ZdutGyPOVAjBXsU1qF3WEWcBSy6
 0NQm5+X2Dw/RlYAbc5CP+CuusHtIuMcUfaAIN9rNbvvB0FoFqg+0++Dh7dKod4k441yvjxX8+aN
 iNjR0KQX6Z7yQJY0evDEofPKrBoN3VRupLBzlwys3dtpohLH1tkLvUxD4YuV7pXe2m9kX4AIPof
 LVWSd4OC++9HVcA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a68ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qeKQattCTu4iihMYEEIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: nxxLqdPPkVhCdxpzF44fcs8QVXhLjQqE
X-Proofpoint-GUID: nxxLqdPPkVhCdxpzF44fcs8QVXhLjQqE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/zs2Wql4qoJv
 t22hHJSDCRptDn9qM+lYsbXw5inydKVBkHcnQLsCGpz44ggVmbD8z/dQS60bHGpV3r96O8iaSd+
 XVG6qsKrhzmrfB54xQbHE83Yf54QNZh+1D7ylqfmJN+atlJjyO5smLrmMuvW5GZ0h2MkHfyek3v
 tfrdNx0OSTlebRxdc/XcGxGU3NjMsNc10zVVubxvcuR0HD0m7IrLa2RLvIV/RuMiFyAIMYXEYz1
 nJoqmQAKbyh8TP7ztw0REvKQIeLVkZwP4HxfrW5BJCrHibmfV2ysL1S9vPaH2EARVY7SKmnpSDS
 oJK1hLXrpF3D2uNh/fNrFURAVzVBfQ46cmJzChJy3s+HlI6sVwbTtUcS71+id7XgyHHNAO/IAn0
 4BJzX+M7K0DLaxINfPQlevx1G1XawaXwJYBi7zwuRTXceDC9AWseeU/k61z1wu0QIHIYZNavfUO
 CiM/F9aRBnmQpGBrkgg==
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
 drivers/i2c/busses/i2c-ali1535.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index 1eac358380405838d15551e353605cab0a7e5e65..bf0f36450c5930f86b122618d17eecf1782dd776 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -215,7 +215,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -245,7 +245,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 		 * BUSY bit may come back on when you try and use the chip
 		 * again.  If that's the case you are stuck.
 		 */
-		dev_info(&adap->dev,
+		i2c_info(adap,
 			"Resetting entire SMB Bus to clear busy condition (%02x)\n",
 			temp);
 		outb_p(ALI1535_T_OUT, SMBHSTTYP);
@@ -262,7 +262,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 			 * power reset as one of the bits now appears to be
 			 * stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"SMBus reset failed! (0x%02x) - controller or "
 				"device on bus is probably hung\n", temp);
 			return -EBUSY;
@@ -290,7 +290,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI1535_STS_FAIL) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/* Unfortunately the ALI SMB controller maps "no response" and "bus
@@ -299,7 +299,7 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	 */
 	if (temp & ALI1535_STS_BUSERR) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -307,14 +307,14 @@ static int ali1535_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI1535_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
 
 	/* check to see if the "command complete" indication is set */
 	if (!(temp & ALI1535_STS_DONE))
 		result = -ETIMEDOUT;
 
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, TYP=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, TYP=%02x, "
 		"CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
 		inb_p(SMBHSTSTS), inb_p(SMBHSTTYP), inb_p(SMBHSTCMD),
 		inb_p(SMBHSTADD), inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -352,7 +352,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT)
-		dev_warn(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_warn(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 
 	/* clear status register (clear-on-write) */
 	outb_p(0xFF, SMBHSTSTS);
@@ -416,7 +416,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		}
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		result = -EOPNOTSUPP;
 		goto EXIT;
 	}
@@ -449,7 +449,7 @@ static s32 ali1535_access(struct i2c_adapter *adap, u16 addr,
 		outb_p(inb_p(SMBHSTTYP) | ALI1535_BLOCK_CLR, SMBHSTTYP);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


