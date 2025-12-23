Return-Path: <linux-i2c+bounces-14698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88496CD8B6A
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0FFA301CE45
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA6033E37D;
	Tue, 23 Dec 2025 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2GLm8R2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOkhn6OW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963B133B6D2
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484188; cv=none; b=srQGD9GFhMc3UpcyWj7M3FDSYg8n0wxaurGjmwA9qfyV6dLqVCUirG5nPsKpqIhPxEsmM3C/jxf7nE7viHwdjomq2Gnk+3dIoNPWzgDZHk7Cn4PsgJxC6YKpcAtFUqjf/EStE8lQIh7d+C2Hb5Jw7taPc+MUPmEuPApIgDlD3HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484188; c=relaxed/simple;
	bh=dI851BmOduiioly8u4iYfe+Rr//GzNIkYCteXmln3Ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cuNm7tb5K6thhtUlKXMPBCUPof2GZHKPqAjv998q8SaOHnrWLDjtI+W1FHZmH6ZR077QyAJuncTQ3IKDlaDVII0BkI+KlxXhHHesoqLljAPGQ+1BMe9rkByHoaxrfFaD7QcH5EmA1lB6lzrxpQCJpDHyXP80MMKJIn+uC6VlgkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2GLm8R2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOkhn6OW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN345NX1891267
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=; b=F2GLm8R2dREg5sck
	zgwCv6IffFw5EQxdkz6nZX9+TnNyy8LZcekauJxst7CNm8WdkKpH/ZVHkj+qS/px
	GDbP6yrTQNayaiBAkb/FwCXjoYPP4IeJ8jjaPBc2jMUIXkL/lj7vMWlD/Axn4D0l
	rCjL/MvYhL3NNd9iF8EdRvRVZwxSfaUUqhuOFLiDDWRKnPWgf2q9DzEnYJJmF03b
	zH9+8N8WFL6TFMqn7tqwZIo/0lxAR0ZA8mh77yxxGs1g2ItJ1k99KAFxIAjftPcN
	XKqKe/l9ArxoAmdi6nrgzWDkW/iV6O7Gldkg6pYtMi4shkzKgT5f0vUZaj8iT+bE
	ZOwRmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak4uk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:03:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb0ae16a63so538071785a.3
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484182; x=1767088982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=QOkhn6OWZEiTQUFW5JzSgiQ3KnXGVTms6m/dVvIfHQqqudmCVV1MT04ZToFStZwOpL
         jZbDdZXepAPFEdKo//CAw9CQRDy3KGwXfQLJ6K3Yod+NgPtud26as6IexTPZrQsFiOW1
         chYl/64zYoPAMzPmywR1DWUqTRUVhHsDdyTj7ULnZZjTqEjEzf/mLr9drbCqElMtS+Hp
         37u0rx3rDclbBjwMJ038Hyf4TPE12BvHGj04Nq4pQ+LexncQhObQMJiT6PSs/mFspDRv
         7G26wyRUj3Xyqm4MhgwDzuXDSkHcyw4wW8ptPiK60XnQRrQh2CGcq+9YHLPdiIdrBfq8
         qV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484182; x=1767088982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=or9DvhQwaxtsrAqBQKF2R4HMkZA0UWyOfpa2BBt7/z4=;
        b=Nn6K7y2ckZNIE/xnVcrDfc0q2a1W30EGJgMwofVRDD+qofO2WfF6v7bgiwOjhXaLs5
         JspTZLfpy5djrF6/jRp39cBOQ6NfeFjG0lKzyWsuYeFjMRVvm4veEneoMLClFjH9EUpg
         nrog9H7PdTGNwZpHNMGq6Yr5m+HVb0jwmAf+mDcv/fqZYXnfd4nrJD0h+NxlmlzJ1VjE
         Djg5ADU2qVfWhX3C+Qn2QKg6E4e+1wzy6FRz1MQC+yzkOuNiSIT4LAqkehD0wVYY6Xiy
         Hm3neyLP5M2qSVHOyPp5jBKceosotT6ZOibpbg5kmp8GS+FHCHUxLO/gsdf2/59rpxf4
         9Spw==
X-Gm-Message-State: AOJu0YyrcjtPmMv2KDy5WGmhMEhf1Y6gqaqxU5jf10qnJqUxITZidDBM
	l1RSlD3u3LU4lQVP550NEdeIZnPquraWNZ2nR+EQTdOywf8uaYkc8HozU9c5UOgew/UNQa3Rek+
	mAEkFtAg0Ut8Ke6XSNaxYmLN6K3Zg4BngeL+Ij6Zkg/aaXLsRDzVnPiHMC0+yjr8=
X-Gm-Gg: AY/fxX5EPXK7ozrkuQ5iSpuJVByo8PwwLojmmsyWqbL3QPKpiCSoRD0O+Beh4mcdDWK
	KjaGJAiI4vpuefbOdMJQTC2vEBL2VmtEVjq/vcw2LjFzyzN65TUBw4zZ+4Nm0uglqacEDFCdA0E
	+SBGUMWIpkyK8hOY/PEOQhlDpW8tUxPIrmGU/SShRan8SCsvet3P3+WzRzzfl7jXxzUzHlJBFNE
	mZROR4Zf1NcXLRI/g7r+PmhcQS3yrqYRcdqb+LwlQ8HFh3Vb2S7nAIAJ91Kjrlh5yKtgEm+oys/
	xhaQF4hKlSwxQbQhvExzY83jyVec49Uwx4iqA0AKCxO5WUmNhHBMU1JEXO/64PHVOGd4OBbt3jU
	IKQpsQlg9Ya0bAvau+G97YQdOAHV/Q6aSKnrYiw==
X-Received: by 2002:a05:622a:2609:b0:4f1:e46b:9dcf with SMTP id d75a77b69052e-4f4abcdf56emr174602011cf.26.1766484182022;
        Tue, 23 Dec 2025 02:03:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYmKh9q3TVpBvPGG04xNQnPAJXRKn+MV5cm9azWZmmq9WoPxX1CHwGyf0VG3WWqkcEF5gNgg==
X-Received: by 2002:a05:622a:2609:b0:4f1:e46b:9dcf with SMTP id d75a77b69052e-4f4abcdf56emr174601651cf.26.1766484181594;
        Tue, 23 Dec 2025 02:03:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:03:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:33 +0100
Subject: [PATCH 11/12] i2c: amd756: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-11-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dI851BmOduiioly8u4iYfe+Rr//GzNIkYCteXmln3Ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmjB5UVNcmc611VKtySZweLgh03lH4CqLyep8
 HN5EDTCCTaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpowQAKCRAFnS7L/zaE
 w7K7D/4+c+Fz0nx+enSy+0T4yYkJZdn0nkZfXEFvgWl9SaytNp+VrFeIZFFCXXMRHJLHzQ9F6yE
 6grb+AXEzou95fx6/DnPZnO4gmcgKK1vIR5ea8WocpwnbE0BV8n5SCeDwJtTMqb/i7ESl/L6Uw9
 7YdYJWNS2IXMX7FN7fE/Nc+ibmyHtIv5QHZQbD4L4NEDUBDXt3L/u1EKGsqMyUp5C/3qAtSkXH1
 ix1sU8F1hiF4ppon9nlTAxe6MOmla3QRgWCA0i6WoPuIYU+LtfFBSz9PlLMFSQi3/Tb9pTJojmv
 sZyt0uBuvEPgfDyh9D4q5y8scZeFgW6/roKmrAmktmOPfu69d600IhvNzHX1/53yk2+ruS4HAWe
 jr2xoMOReoaIb6zkzEE0K90I4fJNM8eFCx08mnXqg1typ4jMHuTRK26+T2kLlreUWiNAHYXbg8W
 NintnTN9h/k5RLXA8M0Imm1bBI1yXyxIp7EejP6p+7y4WMjVDx+KmJsnYtWI5qwSIgG0EGvrG8n
 HzEAMhq4EHGZ21GoCeWNKI0uXpcwJSls/9lQfmgT29CNmnigZgBM8/PW8iEsLmgHAFwlt1BpTZn
 VIO7KE9o3UipYVObALa592Fk9Ye+4KVwPvy4fepnLyrsTInjb15j8hoaKeYzfo7Zei9+IYYPHAR
 cv/14KJKs7ruXCA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX9ZgrEgxg8e5G
 KTEwuICeplfVo+BBGGLkV2HTp2XubLZ36Hshiq10ssnPum5zKlzMSkEZ4mts8UQuQKlScf3VdPK
 bDIvvjZ2hyVL71mTWbU3Ong5zvgTDsbemupGs3f0NCHl8qG+ZMw1VjwSJu5V5gqc1/VsRU9MFVE
 tx9AZENqyvfdkQPwBMFQp1h3/Mj7vQP6PWnIjVoSTa/Nk8AwrL4oU4TFArWCmgWH4Qxsv7UtZu0
 jZsOMFNJPc1zFkajPdsdDj1MF+R9IVxJgroWveIHzn9+bopIfFEZ5x90B6WjqqP93Y8+fuXj7/8
 PA5RMoHk7op3+CczPXLCu3HTQZ6IfME/ay3IDIoHSljsdlh84qDid04YCQs0Obt2y/hsiwI6d7x
 ErmWkQHiNUPpgzBm/4i2+0WrEX28OnIcjtC/DA8ZftSkgu2mMGL2iy5rBeUjRMWaTR0H+/OmpNy
 MDiHhnsgT/yeG8sU2Rw==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a68d6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IUzV_G_aAFXi5cZUTYgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: H4VlY8CAKq7jsDMiIEQHeL6kQLbr8rzf
X-Proofpoint-ORIG-GUID: H4VlY8CAKq7jsDMiIEQHeL6kQLbr8rzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-amd756.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd756.c b/drivers/i2c/busses/i2c-amd756.c
index 3621c02f1cbabd8c5e9d8a4ae1494ada78726b15..629da0b8024b88cc4d51ea5e785147b462a1281c 100644
--- a/drivers/i2c/busses/i2c-amd756.c
+++ b/drivers/i2c/busses/i2c-amd756.c
@@ -99,14 +99,14 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	int result = 0;
 	int timeout = 0;
 
-	dev_dbg(&adap->dev, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
+	i2c_dbg(adap, "Transaction (pre): GS=%04x, GE=%04x, ADD=%04x, "
 		"DAT=%04x\n", inw_p(SMB_GLOBAL_STATUS),
 		inw_p(SMB_GLOBAL_ENABLE), inw_p(SMB_HOST_ADDRESS),
 		inb_p(SMB_HOST_DATA));
 
 	/* Make sure the SMBus host is ready to start transmitting */
 	if ((temp = inw_p(SMB_GLOBAL_STATUS)) & (GS_HST_STS | GS_SMB_STS)) {
-		dev_dbg(&adap->dev, "SMBus busy (%04x). Waiting...\n", temp);
+		i2c_dbg(adap, "SMBus busy (%04x). Waiting...\n", temp);
 		do {
 			msleep(1);
 			temp = inw_p(SMB_GLOBAL_STATUS);
@@ -114,7 +114,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 		         (timeout++ < MAX_TIMEOUT));
 		/* If the SMBus is still busy, we give up */
 		if (timeout > MAX_TIMEOUT) {
-			dev_dbg(&adap->dev, "Busy wait timeout (%04x)\n", temp);
+			i2c_dbg(adap, "Busy wait timeout (%04x)\n", temp);
 			goto abort;
 		}
 		timeout = 0;
@@ -131,38 +131,38 @@ static int amd756_transaction(struct i2c_adapter *adap)
 
 	/* If the SMBus is still busy, we give up */
 	if (timeout > MAX_TIMEOUT) {
-		dev_dbg(&adap->dev, "Completion timeout!\n");
+		i2c_dbg(adap, "Completion timeout!\n");
 		goto abort;
 	}
 
 	if (temp & GS_PRERR_STS) {
 		result = -ENXIO;
-		dev_dbg(&adap->dev, "SMBus Protocol error (no response)!\n");
+		i2c_dbg(adap, "SMBus Protocol error (no response)!\n");
 	}
 
 	if (temp & GS_COL_STS) {
 		result = -EIO;
-		dev_warn(&adap->dev, "SMBus collision!\n");
+		i2c_warn(adap, "SMBus collision!\n");
 	}
 
 	if (temp & GS_TO_STS) {
 		result = -ETIMEDOUT;
-		dev_dbg(&adap->dev, "SMBus protocol timeout!\n");
+		i2c_dbg(adap, "SMBus protocol timeout!\n");
 	}
 
 	if (temp & GS_HCYC_STS)
-		dev_dbg(&adap->dev, "SMBus protocol success!\n");
+		i2c_dbg(adap, "SMBus protocol success!\n");
 
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
 
 #ifdef DEBUG
 	if (((temp = inw_p(SMB_GLOBAL_STATUS)) & GS_CLEAR_STS) != 0x00) {
-		dev_dbg(&adap->dev,
+		i2c_dbg(adap,
 			"Failed reset at end of transaction (%04x)\n", temp);
 	}
 #endif
 
-	dev_dbg(&adap->dev,
+	i2c_dbg(adap,
 		"Transaction (post): GS=%04x, GE=%04x, ADD=%04x, DAT=%04x\n",
 		inw_p(SMB_GLOBAL_STATUS), inw_p(SMB_GLOBAL_ENABLE),
 		inw_p(SMB_HOST_ADDRESS), inb_p(SMB_HOST_DATA));
@@ -170,7 +170,7 @@ static int amd756_transaction(struct i2c_adapter *adap)
 	return result;
 
  abort:
-	dev_warn(&adap->dev, "Sending abort\n");
+	i2c_warn(adap, "Sending abort\n");
 	outw_p(inw(SMB_GLOBAL_ENABLE) | GE_ABORT, SMB_GLOBAL_ENABLE);
 	msleep(100);
 	outw_p(GS_CLEAR_STS, SMB_GLOBAL_STATUS);
@@ -233,7 +233,7 @@ static s32 amd756_access(struct i2c_adapter * adap, u16 addr,
 		size = AMD756_BLOCK_DATA;
 		break;
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 

-- 
2.47.3


