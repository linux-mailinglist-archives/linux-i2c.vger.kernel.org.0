Return-Path: <linux-i2c+bounces-14694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D0BCD8BA6
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0496A308D39D
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5898632D44F;
	Tue, 23 Dec 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bIBBN9gE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AGQWjBkW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2025633066C
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484183; cv=none; b=W6mBziY/aoXZXq+TpI5Cz59Cm+SMpBIvPsitGA+GMXtgxhSWGPvmNcsSjjfxRLssaMUzcJwGmWNQksRNYWTOn5Y02q2VvdtQ9x8vtoSVJBAk/UxdY8/8HT3DfD16ryrJLa6x1uzATKfdncEHtItkvQRr3PeEP3Opl5Q2puZVwbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484183; c=relaxed/simple;
	bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBjGvKUzIQ4rGNhZrwuoCWgbhO6EDkvOezUslC7MrZ9eZK9hdl6miCX2ih5I2Slssvwemgl1G20STC8TST72/rs9FZPz+frQ9u4PBYbVIKutyT7XUWUKypq7TT3sOXVnJptGbyia2tiEZShux7ExqcFMmtzvgTuyejIGmK+Gefc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bIBBN9gE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AGQWjBkW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN32C5i1894831
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=; b=bIBBN9gEj819WWSx
	ukr6MOHNbMcO371J8nAzeNYa6kAXDXdyE4Dg/KOTsXaUTl9qKkZkGyRLFsanbFM7
	ulRV11/8RRD9xGHJkL5via2oxM8bV6+tDFtIDXmq/u97zF8aI5SlLyMu89neCMDG
	4+G1BfRsARTSwS//CvhRqWHZi/lbX18qELxu7Gulg/+9G/jTQHbcFHvI3sSUJbpu
	F/geqQDiMKZYCvIorg0sAQNQOseeeCIphl8Yf9Ax6I4JQuaCniTsMznNJN5oeS26
	NkGkG3bWxTuZe2B7WVeVjmr83pKepmi4QZzpriJF/ENOpl53lgZMfiuxGK9Xhcqy
	0qriWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74takeje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0193a239so50428281cf.0
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484176; x=1767088976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=AGQWjBkW1y0C9KL2lqbRr0dac6HNhPOlgr72WbnYc0iHvfeeqBUPoeaYoryiEGu7OA
         bKOv0bBEtw+zJtSYbxIsSAZvZ5/fU4Z49JWxRnNRB3d+TyYK3cvzFEeVMc10zdY1Sf0S
         Sa2j+gePKOAsV+RwYseWKMTPl85CeTrF03pp7ndsAn45WiKGWyy5zXXSL/zptYYlzS9O
         N+5mLZGY/t+BnH4b2yaozTqIZaVXgZMV+NdIjyDGzTK0xJ/Tb2vhIMbJKGOKYC6bRLnd
         CSTbnTILovRli4titqqfeICLFR2EETV2lPcdkyRtFvrW2qdovMqp2pGbxTn6XrARVJIN
         psSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484176; x=1767088976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VJPGTun9iAEUTgsAs5oldXV0hm6NbS8Rh/bgRh+cvE=;
        b=ruAK/J0XRCQmVPITbCeOQ+GtxM+qo8GD3WLkIrIav+Z8jRmtvn8W0dCgHzVhK4XhGh
         +4Bs3IAv3TLL5ee2XN0p5btMh18zXfGRL4lspMTKSu7XjdlszVoQN7hEOTyAwJ/pYuv4
         eDpB8QNb+Z9E6g2ZxhSmShzcmcECwdFSK+56NvSL2d8sADXUgu7T7GVADxWQCTNHIGmu
         tTF5+Vg6wuatmmfb5wLNPGHEpsAzWttcGbDWHUAmtrEhAaORF7iQUPCj7/AaZQWqwDXa
         0nv2Sr+xeA0bakYeAH91z3LzVXxgoooDpHcnM3VJy12W4oF+m4HcgSze+RXQczCP1mou
         +8wA==
X-Gm-Message-State: AOJu0YwiyXz5MLkZX+Q5dVSJlqndCV+NO/XmWLfpLNwCnWiBwCvCpXDK
	V3ZErSQWSvI1G2bug52Hyzl0JKUiXBZTcldtJQwRJ2WSUiF7ndvZNeE+041P6SpDJqaaEaxmsdv
	13PXUoizgMtA2b/E6edU1DRG/up2vEqlLsvyvmvikuHZuwmez85igxAjc32Q2Fe8=
X-Gm-Gg: AY/fxX5fHcrHzMOJ7KYA0+FUq77GCXYAPKSAmChJZC2DXrfnjlKX+x79IMbTVkRE1CP
	XMSKdt5Pgdz+WSM0Vxa/o2NhVLnyTIznMKow/AFC+oPeo/usNmushL2eMsyn15ebQqpE4Rn9hL6
	Z6VviVZIKIqbK/G+yttrNIIS9kZvhLyGzRoxL4ngV6mm8LyrB3tI/TUufNL87ypKQmprxYohEhz
	KnbCiVSDk2edk51QLJILMSoAz0YwWmG6EWOkXqciAq+6Ep+oBkafUzJS8KjmMh7YTpKd6xDtQi7
	C1+k5z/xfGlv1Vk55UpU5PwTCFNKj3t0aLI6+WxDzaR/oqXfB0MS89ELE4BYc3q2o+OsgKKIDLN
	hC1RY5ONbE7UlA1tZhMfj1KYfd9c2wjQotf3ozg==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr207317971cf.0.1766484176216;
        Tue, 23 Dec 2025 02:02:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvZUZ2J6IwscWcY7RC74ES7QnMTV7pkYZ1I5E0GX9LHN3najl8MNqhxo5VDEyhUmehwO5Tzg==
X-Received: by 2002:a05:622a:1927:b0:4e8:9920:be58 with SMTP id d75a77b69052e-4f4abbae21fmr207317561cf.0.1766484175625;
        Tue, 23 Dec 2025 02:02:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:29 +0100
Subject: [PATCH 07/12] i2c: ali15x3: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-7-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z5y+uDYDLt8QrBK74QcxPQFJYMWolbieGXxGJWOf/Z0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi+az3h2mjkdy8JfZt/+vwI7gUUYCdcxe1ji
 Aldb5AAaUyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovgAKCRAFnS7L/zaE
 wwg1D/9/TgJ7+cyyriM7piIyunaQDjTvaDw+EBEL51hFHlX+lO4/jVLy2woMDI6R4fIvrXdW6ub
 Jpy8I2sZt3jMNDjOwoehDFb99d7nU9UhuOIfHRCrblhzfjt5iX1W+Qaf1pwx0BawuEPynomq6YV
 8YXynU/1S/jKFPWKtSwMhvDyUfo2IiEuj3+gmgLsn7gW5CUydnE1u2dyvJPDUz90YLOHV7/RQBg
 fDif1lvU3gfyFc+J2P/yOhXn8Kr9DkrvqIQyYJdfbes6fDpGhgG9OAIUUHhhKpTjuit3E9F9wMd
 FtxMUW3JOIdOouc90ODz/CCxB/bn3qYR+bY2vynlawaZQAFsb+nE33QJshh8AMF9esfFhUjNqQ9
 mebGDH5BMjgjuPJCLwlPneIN+MXg4aJlY2gZySYW2vtrMOreqUVOWaNaK/tECpvg7zY+wu/FNJn
 OtTNA7guV0cmbQHlOXLdjzKbklatBSK3hvb+0TUjfcli/xb2Wbpkvz1qhX4UorxXc7aW67O+Nh/
 K7+rXBRV+/VbEI22DeQ7FRSUA0shc+W1WZKDV/M7RO//k8q8g63p69ixoRUXzIqiiDjsm8oPizV
 thrGUnbGDKbK6jTyCj+ShJmpLpL9LIJ5RPRtEbMachuYbTpfqO0d0QWI58cXjGgllDLPJhR4Oxr
 OY84XabOoDPMwvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=694a68d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FH57a1SQlJoUzRel804A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: -aY0sdWg4YL98YjhpUGqMNiilU6O3meG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX3x2cK4tXN3r5
 FyXriWu0lHL4KK9DnvEqERwulX6cYX0Cx37uVvIGuXtJko5ywRvpX/nWisly9tq3MGuJqM7gQph
 8Hz0nhjIfxSS2CXLfJcnisb0QAMJ1KQt7EiYYkaos6uegAUujXeg60Qxfr8xJXUMunpG9Q5K3Sr
 7wSwK0Q5V8FZkXzWeNF+1sYQK/sfM7Jqdj6TFyxLKkvCrwkaq5tJP7GHz99qy/VoiSuYgwH9o8W
 MpYYJ7EPrFqb4RJix1ObnOYKhEEwo0ZwwvqAQSYURc/fdDcFi87iT0WrafElIHnAIPMF0nBAtGT
 jqVa56w5V9ghGvVwmKBKX3/QhEZfpSSxSLWe3b00solEh5CBSk8mPv2MfdGf4iOnHUHY8E3EjQm
 IsA0vEuTakqiCzE5T7pfnjontAzecxnkF0W6etB+W5nEHjTb5updWA79VZR0ZznYRpjawIpCclc
 IA95isRYW2ugRpQzbHQ==
X-Proofpoint-ORIG-GUID: -aY0sdWg4YL98YjhpUGqMNiilU6O3meG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ali15x3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 418d11266671e314aa2fb882ece025dc0ae998da..bd62aa8d645004bef121fa46efc1d7afc473332a 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -223,7 +223,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (pre): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -255,7 +255,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	   then the BUSY bit may come back on when you try and use the chip again.
 	   If that's the case you are stuck.
 	*/
-		dev_info(&adap->dev, "Resetting entire SMB Bus to "
+		i2c_info(adap, "Resetting entire SMB Bus to "
 			"clear busy condition (%02x)\n", temp);
 		outb_p(ALI15X3_T_OUT, SMBHSTCNT);
 		temp = inb_p(SMBHSTSTS);
@@ -270,7 +270,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 			/* this is probably going to be correctable only by a power reset
 			   as one of the bits now appears to be stuck */
 			/* This may be a bus or device with electrical problems. */
-			dev_err(&adap->dev, "SMBus reset failed! (0x%02x) - "
+			i2c_err(adap, "SMBus reset failed! (0x%02x) - "
 				"controller or device on bus is probably hung\n",
 				temp);
 			return -EBUSY;
@@ -299,7 +299,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 
 	if (temp & ALI15X3_STS_TERM) {
 		result = -EIO;
-		dev_dbg(&adap->dev, "Error: Failed bus transaction\n");
+		i2c_dbg(adap, "Error: Failed bus transaction\n");
 	}
 
 	/*
@@ -310,7 +310,7 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	*/
 	if (temp & ALI15X3_STS_COLL) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Error: no response or bus collision ADD=%02x\n",
 			inb_p(SMBHSTADD));
 	}
@@ -318,9 +318,9 @@ static int ali15x3_transaction(struct i2c_adapter *adap)
 	/* haven't ever seen this */
 	if (temp & ALI15X3_STS_DEV) {
 		result = -EIO;
-		dev_err(&adap->dev, "Error: device error\n");
+		i2c_err(adap, "Error: device error\n");
 	}
-	dev_dbg(&adap->dev, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
+	i2c_dbg(adap, "Transaction (post): STS=%02x, CNT=%02x, CMD=%02x, "
 		"ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTSTS),
 		inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
 		inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));
@@ -347,7 +347,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		temp = inb_p(SMBHSTSTS);
 	}
 	if (timeout >= MAX_TIMEOUT) {
-		dev_err(&adap->dev, "Idle wait Timeout! STS=0x%02x\n", temp);
+		i2c_err(adap, "Idle wait Timeout! STS=0x%02x\n", temp);
 	}
 
 	switch (size) {
@@ -404,7 +404,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		size = ALI15X3_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -437,7 +437,7 @@ static s32 ali15x3_access(struct i2c_adapter * adap, u16 addr,
 		outb_p(inb_p(SMBHSTCNT) | ALI15X3_BLOCK_CLR, SMBHSTCNT);
 		for (i = 1; i <= data->block[0]; i++) {
 			data->block[i] = inb_p(SMBBLKDAT);
-			dev_dbg(&adap->dev, "Blk: len=%d, i=%d, data=%02x\n",
+			i2c_dbg(adap, "Blk: len=%d, i=%d, data=%02x\n",
 				len, i, data->block[i]);
 		}
 		break;

-- 
2.47.3


