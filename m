Return-Path: <linux-i2c+bounces-14697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1801CCD8BB5
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1603230A0D4A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B26533D4FF;
	Tue, 23 Dec 2025 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgtVVrCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hP+uNyHe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6669F33A6F7
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484186; cv=none; b=PE5N3hfhd6ZN/P0cJAsGJQISX8HQOkLKYpbmE1o/sRoKcyBYnhfMR1EWreSsUqEw0sTHaOqofb1kaLyjqK4/Tf3NK1qEF2V2vnLVveHACFjvUpC3BhO8NrTNe0aC9BFa1bA1FHrIEW0utapodMub23+g14nOvN0As5zBvH7mRco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484186; c=relaxed/simple;
	bh=1RcMgKhoVIDH/uvlkjR4k8BRDeSqy3Z1wqmJ/Zg7uPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbeYzLeouXKphwdhdP7y/QxgGr+xc3Vt2bkctNjep//vVbbEQJcclGi2fSZ5h8dUdDboOmfA5i86ZiMo16Jd6C6lEinBGIzpYlSMl+UAOJkHVVjJOsKN7tyeSa/RlqgKoxoduT+7l8N8BoslgpqVsgsMxDS2aQZC+0owdo+RLv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgtVVrCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hP+uNyHe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2dMev2199053
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=; b=lgtVVrCRDEEhbVLA
	bu1fxLTBApMnXU4Io5Rs7UxlEpP4lv20AZm80EjrI6PAMZvpCBjCN/RrpU2aydOL
	g0vyT5gMOrqNJiYyX+5UjqmHbGn8dMJbc8BplkwFup1dzZnaRiKrxV9wmSjanO+5
	DAV8tqUDtGipXSWN/91KJm2nSQtUFCtkt+YZ4M8XDjdSA/Nrb8pwgRj3S1RPeblX
	O2ENydHSe6u8kcw6kNgqkiKc9x8rPElPzUPsxhK41Q0bMN0QMNciQW9HOdMdDHzq
	QZlmEU8TXuKRxRf76vttD6biAOOikTeEIAE5DoAFlKqjR/y8mG+ajwHT1pavw7Zi
	aYLMgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwurg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed79dd4a47so103664021cf.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484180; x=1767088980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=;
        b=hP+uNyHexRsCiEeXpWGXdj7qf2yRXX/btA1el4xtBFjPXmDFsLt0tAoi3pac4dIj2u
         iB5D/adtVE6PqZEHea3X4+mt0S4sBX7PmIH8iFfR7I6JyGnNcprhp2jAVuXrHLMthCKs
         lRNlpRDuUG6Rp5RWg8iSvdfHKKLk8vFkov5s4W8Mxp363LwxZFzUuMtNHf7VD64r5jrY
         LYK6/+ygGn7BqhyyKtJM0UIcJiCb6wuCMPhufRddR5BqtnJWjHEJ67iG7X3ZbDsYNGuD
         2H891tqy3Ib0Hqdx1roTrw5+xx8M/g7O360VgDzlPWKMpa782tCxxUl9K7fSrdOkLDXA
         SKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484180; x=1767088980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kn07S0VFJ00r1Opp95FLhCfso4raJ3godCnzzNkTUdQ=;
        b=SjXa/oZ1DcaeLs3PKYhJd4h86itD7zpsbvTqBxR46lYiUMquPVUCO9gfDlC+Wqt6Bq
         /6H0saLNEbyCiGY2rf41NAWbk5C/XA6rI+uepJB9Zpj1V6ah5zC/iKM+YcZcqNyKxCPz
         bLjdLVV7E1tI6d3BxGbRciXRbG0zR/FiawFyd+0ciK6gkv+l4bPHOgCvudFNiXjlc2kC
         00IpFgmBqvswcdYFlCMOYKW2mMGyK+nyryuA+B5vmdV1KGdEcjUlS1/cIrcsYHB35Ndl
         o1vI+I1HJwN223YtxHrlEh+NnDG6n58KWro8xDoMfMBYq52pyCjSdOlt+GDleUFKXjw5
         +6YQ==
X-Gm-Message-State: AOJu0YxrTCGHOGa462do1d+1LVmN6ZauGK18H2NQucZxrRRnGVoVbqOK
	cX9I1gxb3ofv8WFKoKMshDBRoM2Dif87Z5P1c8xKeS2aDsrhclDr/g2EwvLk6+gDlMo7mjQX1qJ
	jDbw9S2+WYJV34XSlpTuTWvQjKgO4QLi0giORDFfuVdYhERFlTfaUA5azOwJ863g=
X-Gm-Gg: AY/fxX7+/669oyQkTJwB3CGmzxfDxdrbwlAJrP8KH56lKbVwG2ghlVEM2poGhW5BJ8l
	Tqkcdydj/gSjltb/XPE7sm/XAsYqMIR3I1Dnae7QhuaKsFhty30MkaDxq1MqLIHGP+dg28QmHk7
	bwz4kSE6BwzuE2kC7CZ8czHuWxgXcBuf3D1+k+d5wXxAxBW25+X+crW9QgQDfvYBVMFzYDGkv25
	hdnZdU4LP3GO9wQi83Ev3ZDIo2b6MsZnm3A8DkTTHZeenZYFmtHgZLO2QcM/liyrPmpA96TK0zr
	HpSzYV7Mz2L7ITCbKIhDx9AOL8rbZa1sX5tVhHngZ7C2jksLCz3LNY/98KYNlEPaL07MIiXRIxA
	JtUwMOvNbyE2pLDviWADeTdvfAIvX2WqB0uiT/w==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr199055501cf.50.1766484180392;
        Tue, 23 Dec 2025 02:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEb/XwjqmlNu6biskXJYdXx7yRjIVunYQjmGPYAWmA2yv1ld3r5jkFpRaOKuHbmJJD/SAxQsA==
X-Received: by 2002:a05:622a:250:b0:4f3:5346:5d54 with SMTP id d75a77b69052e-4f4abd78d8fmr199055071cf.50.1766484179952;
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:32 +0100
Subject: [PATCH 10/12] i2c: nforce2: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-10-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1RcMgKhoVIDH/uvlkjR4k8BRDeSqy3Z1wqmJ/Zg7uPQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjAWS6dV2oSrIJN/8EGc+7W8i9AyzXFZaPPi
 mcV5IzVlFiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowAAKCRAFnS7L/zaE
 wy0dEAClg4CncFPQN0S3c+U7UOudBSZbQgLmP6HOhyUtZ3U9OLbCsKadAQFgEhSwX1jECTm5dNF
 0RdoIoG+fF0GCw60nKZXgiUzxNUalzHyZjn3MgzLiNqR/BAr3Fe55XuV4sKpYT6yU1xAZ1D0AS0
 WB+Cuxnns2XBnbCeu8KX2+jXTE4EspmlwPkIwNTPlrAlof76u8Fyj815z/OQA/0uApNYkRudhth
 8X0O57dlCLpgrWcFelojmLpkvLBhwA3ug9kSOZS5GlNWt9tC7n8yEBuUGnu8+MG+yfjadZSdiGY
 FI/2l6PvAgagfWA6020GUjaUrTrdzHQr57t80WmhjeCdzxZht4XNHlQGykb1O4pHcC9FQoSsK1/
 Ua5Ilo556Drv7i1I7H8wPdl3MyXIb2mphWJCjOR3kD/v2xvLIqwnApfjb1z+6ag9RZHTuZBzsch
 h700sSioPBCeNDSEl8K/MX2Q6LnXgJHDfoXh0dQWUt0WV2kziDw7ZQCFJMAL8MU11fniAfWtnLu
 0zkk4hjESymk+Muoy340vMIrgjGBzwhm/KxR9h3yN2OPcYeZBQ6RTKGDc0TXwrufHCZ3m2YcYPU
 zB8cbguyyVBO5QUmGddwtTBc2xiWqtP6i75lMrsX7aWcquTAWMGnXWUt2zTV+fbXqmMuyOwazC6
 QswEw5+ooZn9yfA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a68d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ULAvDvZivfA9C-ZB8fsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX4747khrnw2Sf
 7gl2MqpYi13UvAu7TOKf1aW7DEkuDWml3C4M4p7G81R0naT2/QLijSiYSFsQvr+iOoj/5rIDoV3
 9hZSe3A5NEqG0rsxf4TfC5Nkznv+gbbmVZVfbz+h2/550iSn7aCVo5stHehFfZHDjK5AH7E31CD
 Y7oelqG+amU822pg+RpLstoCRC5nq0M7FMXFDzkSwhUflzH+VMc1nTDy+NfMxV2T51nhA4fW0XU
 w8ObxROTRG4FoTE7D9nO5uEt6kE8hchEZsASAT3bdjirGM2jZo6imrkhWFhKs44KgrDKBW9w4L3
 Au9aFixp/gPd9dbGUE9GVPoQB93g9Ib5VVTH0K/Yb4KXMtpzthFfRkWi1Ltt2IGTmq7+Cj+Bw+/
 ZON/OYhuvsMdpmr3/flNuoKea0gXnv5JB7A4V6BqTO7ngmahTiE4eo63mJ8WKcVYMJaNuiWWno4
 1940U20UoFxRkAECwEw==
X-Proofpoint-GUID: _ql84gtz4rZ8M_VG93XDr3Cl7kAVtBVJ
X-Proofpoint-ORIG-GUID: _ql84gtz4rZ8M_VG93XDr3Cl7kAVtBVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nforce2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index d58a308582e47650238312537d2d721261d3bca4..2fa6f1dbd27a92c2d67915775e588e4bab675d76 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -123,7 +123,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	int timeout = 0;
 	unsigned char temp;
 
-	dev_dbg(&adap->dev, "Aborting current transaction\n");
+	i2c_dbg(adap, "Aborting current transaction\n");
 
 	outb_p(NVIDIA_SMB_CTRL_ABORT, NVIDIA_SMB_CTRL);
 	do {
@@ -132,7 +132,7 @@ static void nforce2_abort(struct i2c_adapter *adap)
 	} while (!(temp & NVIDIA_SMB_STATUS_ABRT_STS) &&
 			(timeout++ < MAX_TIMEOUT));
 	if (!(temp & NVIDIA_SMB_STATUS_ABRT_STS))
-		dev_err(&adap->dev, "Can't reset the smbus\n");
+		i2c_err(adap, "Can't reset the smbus\n");
 	outb_p(NVIDIA_SMB_STATUS_ABRT_STS, NVIDIA_SMB_STATUS_ABRT);
 }
 
@@ -148,13 +148,13 @@ static int nforce2_check_status(struct i2c_adapter *adap)
 	} while ((!temp) && (timeout++ < MAX_TIMEOUT));
 
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "SMBus Timeout!\n");
+		i2c_dbg(adap, "SMBus Timeout!\n");
 		if (smbus->can_abort)
 			nforce2_abort(adap);
 		return -ETIMEDOUT;
 	}
 	if (!(temp & NVIDIA_SMB_STS_DONE) || (temp & NVIDIA_SMB_STS_STATUS)) {
-		dev_dbg(&adap->dev, "Transaction failed (0x%02x)!\n", temp);
+		i2c_dbg(adap, "Transaction failed (0x%02x)!\n", temp);
 		return -EIO;
 	}
 	return 0;
@@ -207,7 +207,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		if (read_write == I2C_SMBUS_WRITE) {
 			len = data->block[0];
 			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-				dev_err(&adap->dev,
+				i2c_err(adap,
 					"Transaction failed (requested block size: %d)\n",
 					len);
 				return -EINVAL;
@@ -221,7 +221,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 		break;
 
 	default:
-		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_err(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -249,7 +249,7 @@ static s32 nforce2_access(struct i2c_adapter *adap, u16 addr,
 	case I2C_SMBUS_BLOCK_DATA:
 		len = inb_p(NVIDIA_SMB_BCNT);
 		if ((len <= 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"Transaction failed (received block size: 0x%02x)\n",
 				len);
 			return -EPROTO;

-- 
2.47.3


