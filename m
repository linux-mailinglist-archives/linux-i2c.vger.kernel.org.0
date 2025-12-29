Return-Path: <linux-i2c+bounces-14816-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF95BCE5EA0
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 05:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D19FA3006A7E
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Dec 2025 04:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5163122F74D;
	Mon, 29 Dec 2025 04:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGJEBnVi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbjV5vvc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF7421ADB7
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984101; cv=none; b=kK5slaSA2RPS4shMDSEnzirLF3PpFNbNo+UqAM20FZs9SHqWoqtygk2hBib8QNP98SF3DKGaTJiSxsIi8+tV1eIo/F7caB2gSivHtV1QsjKCGVHZ7/t5D6KZALVpliZLUrXFaF47Rw6DqqY5lf40cEMM6t2EEK60LGXAQKASMVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984101; c=relaxed/simple;
	bh=pXH9LKib4OUlP/+LyX+gKt/0FFTPMm6NcrZ3BWhD5Lk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FILX5iyEU1NJjk69A4Y5aprzcSKY3gv4Xe4kkaFeIKGqLdGF9E84Fd3CkR2oLx8jbD4cnqJRcxIuadGF4VhCqKV3jYIjC16GZauqjlzMDfgHrN54JE1Kt6IMJ4aT58bLUvbzlcwVdWM6ZPJMPDOE0KwCFihkA+DQJfYViiKQw2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGJEBnVi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TbjV5vvc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSLEYWk043783
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Pc3Xjb3HkY3tcpE0qNNLg2AEi35B1sLL7Vj
	Oo3j+PSM=; b=kGJEBnVi2v8+yYvsKF+inVIj54SegXvADWnjtn53PFunpSOhDYM
	ybEG4/HKSobY3a+SDZWwgrPHXnAmjHQkG57r5KladgmMIb5FjLA/ZErbQWYMvG0k
	5zCSC08AeBBAXigNNWS+sC/e+1j4bu4fwyZ5Slju0TwDx+fupSh+HIPultc4Jm8l
	ioJLLUorYd1d+wOU5vLqZwiE25WDOv1jLjDYT59oDz+4JWa+v2yfK6vS+GFVDojU
	staX2VQdTKShZmssQqJltRL6uS8W4YBd+FUGSLfpOsQpZS3Frcj2sI54d3d5NbUd
	CHJNLzOlOPQJwhW6CoPN77fUwZ7OESOv6Kw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v0mcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 04:54:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a99a5f77e0so14841656b3a.2
        for <linux-i2c@vger.kernel.org>; Sun, 28 Dec 2025 20:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984097; x=1767588897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc3Xjb3HkY3tcpE0qNNLg2AEi35B1sLL7VjOo3j+PSM=;
        b=TbjV5vvcmn18zR45VTt81BHLGTreURrsHWKBd88GmFBbldT2VrsRVWbPezpY4GRGUt
         92lru5ITzKJJrEQ+ZTqxwxYao9WyPHj04gMp1Uzngj/u0Ur8SY5f7KOMN0z5Im5zDXxN
         onRnUKR9mE902Ma6QzZNjU8kEApN/U3ADDPSojDDYD5Q5tMf9Orj6Mv6n7xgdTbNdu8d
         bKtEn899Ls2M/Gg61x4cW8iokbENLhiOKMLXVrduEfKW+KwVL+sC2/PW4173pbJfilrs
         UQvorM+WJkGFJEGwRu2HZ/25MW4LiEefPDvjjEsGCJNGrqzKzn8DlEwh65fMvqvvGXBy
         ynkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984097; x=1767588897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pc3Xjb3HkY3tcpE0qNNLg2AEi35B1sLL7VjOo3j+PSM=;
        b=C+b1aOX+KcYiZ076J6QHFX0GfDQYBi1ANsSoz68vt+zuLN8xp5yjZJk0u5EMK69atP
         cFrA/jVQPyyTgxL/zZxBs0pHmYms8vmNS/PHBbnSQ02soPJdHFr9TXWzPucbMo5BZr/Y
         NInrM9Gh8AJLEXQjzHiE35MWo6qaaYjdSNUSa1in1T2DfRedaqoJCEnDEF7xuWBHqiHK
         H4DnJGu5R8H15jJNY/oq/ncsvQOHFGBhBkW5Ugc522WR4qoFD1KIKIxHXw5IlBLTyePi
         VPhzVHt5tkOn2XJd2sviu4t0z8X1S0t+m6WfZ5ABalXPEXu7bN6XiOYy7vVGWWelI/PC
         ZIzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdgwCaZFoLhpL7bj8ImwZoyIPmtoZMrhrnbUYkeAlAItH/adutuu9wyIsKnsqtSRI1T4qtSteeF0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYpiQYJ1eRTXKqPImJOpoMMXs23CNdgi9UyDMaYamDRFkVC7t
	zQBm8wIVPGUpa2DKf7jQriAeKDU+09rvrJBqJKb9rJYDMSUXfs4SGo4eozjJIWlkJryfdIHh9pa
	yO3xu4zfMxfQgIqAR+R4PfdIcBZ02VUUbkpbrRQqc2pTMXoQcOJ+RDc/glydyPJA=
X-Gm-Gg: AY/fxX5ceaULdIWvEpA9s4ivgLdIbwC8QY0HfXJRfj2M2n5+n7JoZ8bMRZZkuiSDEoR
	7kspt5SkqWWYSvQOUkOJTFnL1W4MY1gQXITHwNMJwjXZjHSItyZvo2Athew3epELMv3m38FC6uz
	vB4WRjDbkS7DU/kcfcqypjJ09qiyK1e8U0bflyOm3qC5Y5X/OiYjGiejC/bKSEGO98Kl8EcarLb
	SJw/9uZS58ndNgTGT7eHaYTdmBwqSqoaeNJSyqf75P0llbEHLuEl1ln8YO/pLr792FVtFO3BTNU
	Fdzlb4zHW9hVFWGgAh+kPp1oXA+erWWQsvsP7nO14wofFZGzt/DuUkq+lHNbQd9j62PZt8htIFC
	U6IjD2HZmpeDn+mKiLM32Ym3gqjhwPuqACsPs/PCc850=
X-Received: by 2002:a05:6a00:35cf:b0:7fd:f3e9:5a03 with SMTP id d2e1a72fcca58-7ff66f591a2mr25959115b3a.40.1766984097259;
        Sun, 28 Dec 2025 20:54:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbzpzgzvSWERRBPsopZ65GGKy0FWajZYkrMYqCcLMV5tZv0F9gFFNdAJGJeU8Dh+p7ZjdCPA==
X-Received: by 2002:a05:6a00:35cf:b0:7fd:f3e9:5a03 with SMTP id d2e1a72fcca58-7ff66f591a2mr25959094b3a.40.1766984096701;
        Sun, 28 Dec 2025 20:54:56 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:54:56 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v2 00/12] Enable I2C on SA8255p Qualcomm platforms
Date: Mon, 29 Dec 2025 10:24:34 +0530
Message-Id: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sGxyFf7YRNArbOIlE1R2HRw1Q-5EZISU
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=695209a2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8413JC8MLbS8ckBEwAwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfXzt/TzQ3ZM+0Y
 SVTuKeCQj/tIii7lfnFBbUk7xVVcYSmBqWyXOUoI8ycf3TQuozgmWzAWqjgODQL3FO+l+VRhvTo
 UlDHoE7uAVj/H0R0XGzSCbseDGZ1+7O2nSoX3oGE+Q+EcKVWPTBCiE5UwnwkvSwgoqUkmnvfjdf
 fnG2KOJzpoPBZ71bbqbTEbEvLKtWDRUfPy6pM1+C2Gv454q2DJi4h9xQ8qyCm13SnGv7dkkcs2/
 XtguFgn2JGa/lMC57loO2x/v2MMvFDPQGc+17wS5k4OxEARgWG93np1E3gCJTkJNCqjm7LhPB/P
 hltRnC3YBL7gD9DKNO9IzXiSrSX0i/7knVZzxnBnyZxcP4NFFV8gyO0Kj0wf+ZEkTHCBLefsQFg
 VnOBn0p4cwIUnx5Vk9ZS3uHoCYIbnHzCa28DzRdXEUsRusegiWPIppGvnP7rYrAE+T+ZfGRBBSe
 3jnzDM6n7E54wyKGQ9w==
X-Proofpoint-ORIG-GUID: sGxyFf7YRNArbOIlE1R2HRw1Q-5EZISU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages I2C frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate..

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Praveen Talari (12):
  soc: qcom: geni-se: Refactor geni_icc_get() and make qup-memory ICC
    path optional
  soc: qcom: geni-se: Add geni_icc_set_bw_ab() function
  soc: qcom: geni-se: Introduce helper API for resource initialization
  soc: qcom: geni-se: Add resources activation/deactivation helpers
  soc: qcom: geni-se: Introduce helper API for attaching power domains
  soc: qcom: geni-se: Introduce helper APIs for performance control
  dt-bindings: i2c: Describe SA8255p
  i2c: qcom-geni: Isolate serial engine setup
  i2c: qcom-geni: Move resource initialization to separate function
  i2c: qcom-geni: Use resources helper APIs in runtime PM functions
  i2c: qcom-geni: Store of_device_id data in driver private struct
  i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms

 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   |  64 ++++
 drivers/i2c/busses/i2c-qcom-geni.c            | 300 +++++++++---------
 drivers/soc/qcom/qcom-geni-se.c               | 261 ++++++++++++++-
 include/linux/soc/qcom/geni-se.h              |  19 ++
 4 files changed, 473 insertions(+), 171 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml


base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
-- 
2.34.1


