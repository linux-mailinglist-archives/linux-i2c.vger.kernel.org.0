Return-Path: <linux-i2c+bounces-14693-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A6DCD8BA0
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 11:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C45B0301FF4B
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Dec 2025 10:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD08633711E;
	Tue, 23 Dec 2025 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGtJqv01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJXaXVC1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C224E332EAE
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484179; cv=none; b=Lh++Bz0pEi82OKzt7v1HH/SpNinjlKRFiQWc1gspJDIyXI46fkADUp6EZaTShxIduP4PKEY8o6fV1XHjtLUVSeXeyO1+agKHF5ceJEZCkRlFobIR9XffwDRKBbTBUQ7dTaKP/X8nZvE8jzHH9N+UNym3m6Er9m3rkjAh/doHc4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484179; c=relaxed/simple;
	bh=RIl62iCgn+geu7s6HZTdTxIYUTQdth8ibomSIberRJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FzCqCk67p3FPSlVJQftyLA9bwjjxl0JbMpohBk4ApTpWT1KsE+vmRZveCLThLV/s5rFTDVLhUwhbKR1/hmCJs29Wz+cqLKbAqDRTHY+5axiiAMu+aq+wnAFxtwWNBTnKdI53QzIrElC4dRPI41eX7q7BMoA7CB81lu+HaRiJ3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGtJqv01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJXaXVC1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN935AV2747194
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=; b=PGtJqv01xFkPDLF0
	9sSCKg1EzX/dfThiML4tQYD6RxzIc2D0GQHgc9E5woU7+Qa4ZD5BmxFTfDwom/Zp
	/dTHffSso6IFUu/pp+5jvKu7njf7FTstNTuN10HjgRc35k1yoFcgALIkB/1I8QMC
	QZCbZDN/YTk06R+RYffs75NYZgj+u5kftGGI3BgyL8qQ+MYuvyX71b+IxVB0u3IW
	CwtPIanv2tzUPcpsOm8L7bW29WfX/DVqFrGHi9cT4ZWsPFpXoQjXlkOONgsyHBol
	OisiQG69PHI+hDVSzmfJCWIjsuRO6dStKYjFiplI/ML283x011S2Tu2nlBLS7Ev+
	f8qGUQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5csn70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 10:02:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d7ac8339so158407551cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 23 Dec 2025 02:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484175; x=1767088975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=;
        b=dJXaXVC1SGFJuztoKOexhdfzNqGR5nwuys+fZg+Sqq2jdiGA4swKgFHG/1UykH5n9A
         6gS5+N5JXJbODi/VbXblA9XZnGSqlHTSYkYRNFgntT9bcrWupxGohdNFyKth7UdthOtB
         4beEv6tHNtjAzmRknIXu/78RWfpWt6vYUKT4LQaUMPIiKeLONHDHrYFUr8134xGvCd6F
         mXE5HqSxtib8lexABvU6uS7imxuWrGPSN3SdyPN9hCxoMt3M56omV53CaxwTA+PXBIQC
         pKUZUgkMA8lav2fKfb65QwcBhr5M5ctfMSgMNM00roeKrEBgFi80V+u9YwW+Uy+qEygN
         vKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484175; x=1767088975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x9w1CN691OQTmP7uC2eAhibBXaSrfMYpwQfqEaEU3mA=;
        b=Q+TuOtSCPnN918Xsougzokc3r02P1r9uCGfwaA/pbwxeZa0CCwtOBS+MYxG6Dps/GG
         BNo5BiS24zHrV5AddEsNKzMpoDZHhDaQYtDSgoe/tTDyDr3e5fzIowbO4jZqBnj+JJW1
         yjDekLg7Qc9pO9UPAdw580sHS1gnEUaQkan4zIIDCR0BSySVX12aW6tmntJerfaw8ivs
         5UVwvpikIi/pUEa9IlsDDx0rN/hGSeEF30vVN3C4kEyLH/O/TEDS1QTbk+GDvJaTX/vH
         intwlMzj8lMEhztJ7a0/6hbGNTAbm2EbwtYKXgUG1gSo8bXKRZf3woQpAbMG6Q2JCr67
         nLZw==
X-Gm-Message-State: AOJu0Yz+MIOmn1wU+kp+kJe4pfJqQHzAc2MjytLDgmvXQksjhTSSrrzp
	pxqRWbFWQN4IdgcQ+5KTiETbmMYBP+JWZkEN6xN5CwwpBB5iYOBCVJVortLxY1fVOGRlvo5Byis
	fdywNlm1xoyiOm/pQCViC2M+63ms7NhgoCqUY36x1f5xtIoLFe8UTaowncLnnEVA=
X-Gm-Gg: AY/fxX7Gh0uEjo1cUj4chdijAiUVfppitIjfKzhf3cQoLJY0CvQiQ1l1wTFLIKWLyNf
	QmKS1Y7Uia3qr7oLyKlK8ts4lZc1Mls5tFuraDNiraevMQ12qzO1Zjb5zd51R32Ej2qk+xwOwiE
	VL02Lu0DHm5nhwv+u1MSN545t6Cei/m0/bOG+bwhsu9d41HYn2CnOr6JQpdvAuezhqprrxzXoF3
	ucaeHGCrNac+jnRny6+FFCmj9VhDmcksZNwludhzXkBXpkk8eVYEMBLqDw4b+29WG+P6dsOedS+
	+HHGzJaHJhWXa1mfhPyuMxLEMnAkGZ13FaQSQ3h/y/spqD9GZfBEEOAKDPwZznYSB61n+Zwas9F
	6Xzk1gb5yU0olK7L8H1BG7v94h2UIE8+BDPivuw==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr216717951cf.48.1766484174524;
        Tue, 23 Dec 2025 02:02:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPzfEhfDLCN2KQRG3eXv3603/QIFTCQ3fgqRQI0wW6fh6MkpQmoObyB8JOHuhsUVXPreOj+A==
X-Received: by 2002:a05:622a:258f:b0:4ed:8103:8c46 with SMTP id d75a77b69052e-4f4abd6e488mr216717531cf.48.1766484174005;
        Tue, 23 Dec 2025 02:02:54 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:28 +0100
Subject: [PATCH 06/12] i2c: scmi: use i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-6-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RIl62iCgn+geu7s6HZTdTxIYUTQdth8ibomSIberRJc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi9QpltbyrI7odMVS6fBVkmr9NkXuk8yrkL3
 XkWgXt4udWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovQAKCRAFnS7L/zaE
 w2S/EACN3KysLT+Ab5yj5K35LkC7LOd9tZrE/a0sLOrsKkOjkbjUa099UfaIId1GKtt1/aaAzQn
 bZtc/GClmaiNzCfR4bdnbVCOVXcvIMikDvr42Wf9iQqqnRCpoo8mUXDx+bNQlo7MjKwKVs0vSZC
 GKF+3X565kuPX31mKr96XKGHfsHSCWADBDiSR4kBX3h5vgQeN0zgFPq9S9MBTBDEMmSfHtiS2Eg
 R/O5ZJc+6Xa2eElqXm4De1R+zF85mV/Qu3xkpuSFXEWWFZhrCd/Ei64B1WJpo5pA0cc4Y+Lo8ey
 gIdKhh6SkCedu9ZLoJy+3fkDCRrmC+vvtlu/nb3ML0x8cJEfNehgmqTRuNBTuAujBvJ+PTc24V8
 PGfeAsHnI7pMMHFbjZXKht9/nQ/5DDPtWRMc3xAXdTmNetVRcZqeaplnBfr06ZJtCg/I36MZcUE
 QOyAsPM1E91bToi8GsL5jQlpfOusxgAozXWvj7l5DE7mo1AEXBsGthuECijJh44aKfymlGGRvK8
 z3cOUlq8lItD9ixk98dVGmGPYFvkhxl1WPKBNhZ7+wdB9GFywUHMR1SKCe18iO1LhrvpgzgYOSR
 4wdpgP+2B/dPen0U0hk+ZaNGKeQ9soQCtUpUwkr9ASGtDIF3vmVtCxkzoCIM2wyEnK8iAuQGW9M
 FJMCJ+lgq98p1vg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXzBVdmP2+jnFC
 nFcoPYxiK8L6kKJrzC51ZU0pLy6IpH8/cX5cQIhg+EYfHZxkzUUJXqJfL5KChgjUg8VSNdtvkZP
 GJR9I9Ty1CIQb4LQmmsrVt8VA80lD5tNTGrO8NlEUFIIEDmaxhm2iwuhZ+gBOaeqDP+V9YReNE3
 q4+EeFSRuXYxjShlE86SibeNmJRb5URcOdux5Cu1sTTDnquQ8+zSPh1t7XPTMmdNYtcwrhS9GE3
 pN7NTBKnIYTmkOXZpmSoN6bGtLqItXhkTbZRoiy7NTiEpgPytzrdGHkI87LTpEfzk1uJKle7JsZ
 q/gSg6noHkT6emaJfqGsAOJkHc+guF1TAvbjrjlPBVLR9OerVp9Bq32wJCip6UxZt437NndaAqA
 mRAlt2JoGVorFbzH64fPI/JxPWtJ+J7uUetG0Ypgpt3ZmNnAhrocZPNIjEf5EZD1sB01sJ5C9SO
 zlT1XNFjsKsVSKD7zDw==
X-Proofpoint-ORIG-GUID: eouDWZaWIxo3u5haUEIB-EsJ_fZFOn-9
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a68cf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dY4OjmsCUpDc7DjzIskA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: eouDWZaWIxo3u5haUEIB-EsJ_fZFOn-9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 10a5146b3aa5fc6edb4c2f3e1cc57750041b7087..96a2cd70d367f485d5f230be4eaf124398b0f239 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -87,7 +87,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 	char *method;
 	int len = 0;
 
-	dev_dbg(&adap->dev, "access size: %d %s\n", size,
+	i2c_dbg(adap, "access size: %d %s\n", size,
 		(read_write) ? "READ" : "WRITE");
 	switch (size) {
 	case I2C_SMBUS_QUICK:
@@ -148,7 +148,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 		break;
 
 	default:
-		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		i2c_warn(adap, "Unsupported transaction %d\n", size);
 		return -EOPNOTSUPP;
 	}
 
@@ -257,7 +257,7 @@ acpi_smbus_cmi_access(struct i2c_adapter *adap, u16 addr, unsigned short flags,
 
 out:
 	kfree(buffer.pointer);
-	dev_dbg(&adap->dev, "Transaction status: %i\n", result);
+	i2c_dbg(adap, "Transaction status: %i\n", result);
 	return result;
 }
 

-- 
2.47.3


