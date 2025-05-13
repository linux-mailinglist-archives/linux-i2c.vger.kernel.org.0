Return-Path: <linux-i2c+bounces-10954-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F82BAB5378
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 13:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38C187A7DE1
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 11:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2A628C876;
	Tue, 13 May 2025 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ll0RsFi3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2CF28C863
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 11:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134531; cv=none; b=I22mxp9CrkOnOgG7wn3SuhtC1cXKgM1nEHaJgZHDmUT8mLfu4zgo3foxWnAS7J+2v14A6oafYbglYSuNMx4aD/6Fi9xwSNFNqXAj8LJOBmg97+z5BMEVf/9pYrVZtpY8xkBCQey20pghYAAv5yn22ekKPTZhtl+fdkcamxXK4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134531; c=relaxed/simple;
	bh=rdpI6SyCzEcz0rHhDFC3KBNtrPw+BnurZ+tDNY7GaGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n9P+rOBVF7vGKWxui9ZK2fR3R6lz9dFz8gsS5BGu5gXQpKO+IFAppfizTsIqvL3Fbzs5Yx/fZ/6KK8iwNOMxbGAp9/ePu3Ib8HEesMWCB1mr6AJYAYRZXNFdC3s9brCcq9PLm6RabH9car0YitOBMullFtx38ETW8Wu4EGHrPl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ll0RsFi3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D6bgJo022687
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 11:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TdcskCO2K/Wyi90DbkJBCc
	6FCyelyPLh1fYHTqrysmg=; b=Ll0RsFi3Z1nYvX2B6WtHFLRhJFf/frMjBJf0QM
	egtXLOPCcB/nrv0CEZF3N91IiA/pdiY8hHv52Up+7Kepqa66gBBBOthKH0YMN+zy
	y0lEJSi2tvX6XvzrKrsUJwzQVHyUgax+Rew4qreFo/aSoLNt2aEvGd6CTo1HADQA
	Dquth35rwQxKa4+boK/7vOpCaSnNqJWXc1qD3rfcR5c12mhExYTOr7aGu+I71Cqz
	NrSQGEQzkjlxYLmzjnlZd1H80Y3mfzSYhjx+LMBQRyAoBgUyuaYf8cg3Dygh3V5J
	6aOoBIBzXZT6uRIZwGzBfsaF4kmSZdklZT/EnZv+uf762LKg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp3pqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 11:08:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b20027d9ac0so3130988a12.1
        for <linux-i2c@vger.kernel.org>; Tue, 13 May 2025 04:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134526; x=1747739326;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdcskCO2K/Wyi90DbkJBCc6FCyelyPLh1fYHTqrysmg=;
        b=fp/5DtlBGyt+k81ZRUXNAOG7NEDNAzTGDUu7+4pOnxbQ92fKTporU7TwJEakiHSjj1
         EbdOREcEnZSSCm7AKbZ3PEm4ZrdSewM5KVPZqK1v/z7eOenBuaM3aL3y2Qr/OXfTZZua
         BGfAI9QP9GuKpcum9frE2KQoh0CDoGfwJ2YkAGmIVArnXTCAnXIVWorEVrUQvnV3aTZp
         iX5MQtHPJe7o5WWxF4yJuZEhn2rUzVHrK8fo9A2m7V2dZSVZ9X0ufOklTF5fRmLi/1VF
         fT7gSdWch1r9eXidCeme3pv5h2kHByYXcvjnM1gmo0c1BswXfFUGM/cJsQSk5d3/sCCe
         cehA==
X-Gm-Message-State: AOJu0Yz9e4t5HCrgjBzglJ5fyh3BYNGQEUfU1GPi0b/ciGmvFwiGVlOQ
	voBApucNFUzI0mQGrWPgHdEXxufzqBFk1ZelBYoAtwZ4aLvDFZTOVO0tkvsVLm2yBItapWFV8ty
	QzZRfdRQ0a/PUOP4QMO6miwFL6UR90n73IV2HF1OK1F1so2QAWXpkdg6LW8s=
X-Gm-Gg: ASbGncthW0tNfDlh8FZFnBrB4eQkMI8bEC47hritgsQyDNzQw38s5AnIHlz/oSVvU+C
	zm6ywYlHg1jeJ07Z5qXjh7LstYSpkESuRVn0lEjU36BIWGdXuWDjsF6phrW7ZsSiRBdfAtz+H5Q
	r8dgwHZezuAJHtWc2FLc04gw6C3k5O71JayUCXgUrKMraKbFb08Y7drKB5Mgzktqv9MBnqELFFv
	OOh1j4HsJoIIZbcCtAeoMuJsbuAAW+sLk0CsXXyVCkBGNLqmL0/Ey4arKl3kR+JtQPy857DEP6m
	5OIHDe3S/XdoEMhYyS643nmknECL27kxbsb6aiU0UMbRJj61n+Z2SkfaobXqxaqtVxuZfz+JCy2
	aA4E6IgIz0KmkRaC2/zI2d2eH6jQ7gB5BjkJB9kCIFxthxG4=
X-Received: by 2002:a05:6a21:9982:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-215abc613a1mr29416448637.35.1747134526220;
        Tue, 13 May 2025 04:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwN2TRFlFW2UrWDD2VPfw/5b4OcIVv3/BEHBl6G3cH26syPZhvz9HpnkVuSopGz++v8+1RpQ==
X-Received: by 2002:a05:6a21:9982:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-215abc613a1mr29416412637.35.1747134525847;
        Tue, 13 May 2025 04:08:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b251957fef4sm6051656a12.75.2025.05.13.04.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:08:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 13 May 2025 16:38:33 +0530
Subject: [PATCH] i2c: qcom-geni: fix I2C frequency table to achieve
 accurate bus rates
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADAoI2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Nj3UyjZN2k0mLdtKLUQt3EZBMzYxNjCzPLRBMloJaCotS0zAqwcdG
 xtbUATUlz714AAAA=
X-Change-ID: 20250513-i2c-bus-freq-ac46343869a4
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747134522; l=1564;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=rdpI6SyCzEcz0rHhDFC3KBNtrPw+BnurZ+tDNY7GaGg=;
 b=LCHz9YCCEIlr+bjBQdea52XKoMJwQDH+j2d3dmop+sliEw7Fqh/3EA9PeKXG5vTE6dxR5fRNo
 jw2wBTtLHrBChGI68l+LbQvNJi5gGwM3e1IJJpS8ktEabI6RyF7Srtq
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: csigSs2dfCDAIorcuY_GgC6ENvHpgMdc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEwNiBTYWx0ZWRfX0KSlVWN7jx7S
 nMWmFdXqxhBRD0e3m8IffYqC/EJ/K4vtC3ksLCz7fVEdjJA9jIpJNjqoYm8UveatcW4kMhiQTQ0
 M7udKOnkszbGXe7eL7b5BgIRMF/wU0FscE2EJTf4AmxpvNDnH/xYhTLQVcMNWaJ369KLGvsln89
 tgbY39Pc2ORxmaUiS1yek4BpC8BdfAC9BRhHIcG2V0dZ2RTu/S/2ZfRCtLr9F71NDwW8syL4U5k
 UKtJw8nCMrd5COyMVDyIzbSwqwjZ7lZ1XrYt3RxX2Xf1X8unBbd6KzhBwFaMuhBb96EB2kTZt3s
 nELQFflaTABdr4O+2XRSZz5qbwFN+uR4TZKfj07liWxfxOQaSIppEWmIdT6UWMmz4cpIKxiXQ7U
 5SAO0DetF3lr48JfcEWasMXfhuevmbMudCHx7p719NmgsRKTZSHDgogdIQbFaFg7lRh7I8PE
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=68232840 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=c3nHYIS01CY_1xjDKk0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: csigSs2dfCDAIorcuY_GgC6ENvHpgMdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 spamscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130106

Update the I2C frequency table to match the recommended values
specified in the I2C hardware programming guide. In the current IPQ5424
configuration where 32MHz is the source clock, the I2C bus frequencies do
not meet expectations—for instance, 363KHz is achieved instead of the
expected 400KHz.

Cc: stable@kernel.org
Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ccea575fb7838db864ca4a2b21ebb3835b2567b2..2fec7b44bfc1baec68e321a9f57de4156120919b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -155,9 +155,9 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
-	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
-	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
-	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
+	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
+	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
 	{}
 };
 

---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-i2c-bus-freq-ac46343869a4

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


