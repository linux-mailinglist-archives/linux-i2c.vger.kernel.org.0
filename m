Return-Path: <linux-i2c+bounces-14216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E5DC7C723
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 06:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACCF23A7586
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Nov 2025 05:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B7A1C3C11;
	Sat, 22 Nov 2025 05:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAv1AnzL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8s0dcFI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E03C2580CF
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763787638; cv=none; b=DykBV9iE6ul/kUvFuPgbsoyoM57zjIcRPOFpW42iT9bQIOG2tWljfrQOHoI1MLHEs95aZk5dR5GnMv3ww8WsnOwbsBDW7BNQVHL3xDbkZlE4EVk81j/7tq+8118E892fRnjnqtSRJ6nH06tbTKGWdkj8XEQxMNuDtbqXvBvNKf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763787638; c=relaxed/simple;
	bh=NGyGdpzeHbDT5s8GtObErQ/1Hw4nUTMFgum22HkJPAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y+2sRfolqlJNegLFDx1p4T1ojSLa1bWosfT78DqZCpFPRsyjHHPspw3livQ122BJ1JTDHHTbyOqkk/pk0PrSq1/+koNAT4u6HqiJNpmIb2q4BkMJ5WHODbKN+hkrjf/vv1KS+dyDa03eDF7PjCkymbCtCJet1MznYI6GgoeSehk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAv1AnzL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8s0dcFI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AM4XKcY1510175
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CPeVE8lnnyZm9D6CLF+G2qREqfO8+bp/ub6
	rM0Fd8Tk=; b=gAv1AnzLPfhTM+Q8hMfUxxU5X2GTjQz108wnoOoJ9MgPr8eLqBv
	A0E4/Rue6hz5x9Fzwsy47OW9Mc11A6W1FJYr1j94nLRyEMZAWI8Vn9ALpGmGZ9aP
	f1/57mcIDSzhStNv96+FTBXmnvc+OWe0kJmNPEApHnkOgrGUakbR9NN2tsAVb/Eo
	OmWNwoOdVZwmx3t6E9rze64EW7ZCdSNgrfWt5zRvbkedZ09H0BMjDgxF9IBeTZEN
	rVY/McU2sPWU+BDGqZwg1t+9VuSB62GxI4prwSDO7osVqYlUlG5dxUcMBlqNd6IR
	GObA/6Tx+ONe52BwBq7WqP9k9AvNmKPHhEw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak68dr18u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 22 Nov 2025 05:00:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2955555f73dso43491195ad.0
        for <linux-i2c@vger.kernel.org>; Fri, 21 Nov 2025 21:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763787634; x=1764392434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CPeVE8lnnyZm9D6CLF+G2qREqfO8+bp/ub6rM0Fd8Tk=;
        b=D8s0dcFI3Qy/+SgkQH4aHNJUU9tSRawmoaKurWkL+NnuR/FN+0tVJKSok8xloQh4uk
         j+uGqYzKR1wWdyTbHfXO8jtOxIRbsw7rUWOFycinP1fWJPw18Rlk7/+nfdzOp2JcY4q3
         4f/kOY0e17Uk+A8DSvSKEU9SB20W7FQyEIsx99DSnR95eNm+Fc1pLB39ywa1uJMKepR/
         WS9e0fBascR7cPAJ9PYRtlrM9kPPzTX+jWaetO13kJxUz6Xw1IqjNFsDwlL9vE3KpQWI
         8gzvZrBITXBrv3z2GbEBOZU9kyL23fRykQrqdeMzhRZqrUl1XQhEaGCHOSBacQLoeKDK
         1G7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763787634; x=1764392434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPeVE8lnnyZm9D6CLF+G2qREqfO8+bp/ub6rM0Fd8Tk=;
        b=N3hMIlroiBhkvYDqxkMGZPT3l6jz9f++fBP88QB6GbShDXz6RivrkRFCUcKT8rbZAy
         SbdGnIt0RD9EMh0u4p3iGaS0muKfWAAZjJfE7QOMBplVrbdio+Qz12BI7v9LD+mEPa1h
         O1xh6Whe+PBUNntjr+tymlA+4L8sWvkbDWI/hvuKdXEu8EsiypcsyumA7dfy7O1AIbLl
         n2tSqQcY1d93XIwAFFgp3JXaftd8Id/kSMibEIQNZVR190Bo490P+nCEvgGAa/WfAqwx
         +ZwPf1AlHoV8qbuQivQY/KZi6Ehbg/ubegS4qMgDO+r4ryj7FmmKC9qnieT+qz/BNfSE
         gYBg==
X-Forwarded-Encrypted: i=1; AJvYcCUqdOJ+nNGPc1tuCy65fbFSCvhIelgK9aONqSVeBEK/fGZhDxXkbGcveAnd5t4ELGe68W+eix5VFHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9skEwXtBLF1Mcz5goM4Zj75o8l2xGskoFFIcEoWZWxKxe/nDB
	SVO7kZgMycW3hEGUyy7QV6lM6xxZ40oaznK7BevhqsR3gnUolRbXwk96zRrf7NK4q8jEwBrf4F9
	yhj+lMZomuifR3FCjWl9xChw+GQuOxQTq4j3uc7ZFNlqxyEb8hfBIS/UYp0KH8Gk=
X-Gm-Gg: ASbGncu2AQ7iPhgycRGe0NkW7yAy3QINe8HftEqMg2zzjhNXkFKB4+5bDaju7JwzgSa
	1wlXjac+c49mdrswxUOWZxQzA+oD+JdRrg9Cy+GnnsoLRUO7m9pYbnNBOKjmPlrXxEFlDEywZeg
	k8WV739ym8ZtMuTHpO6+rQsdb+Neg62AKCygplHoJXbxpjnBy6WvT/qBTiqFtRhxeQWcN1zUd8W
	pWvXx7e86iU6PE7gRL9jUavWgWWA7yo3zZ4EFTYaUmoTx0DHTC5fNL2Kei9VAziKIC0wplp3Opl
	PYMk0jhGQHFKgqIG2xar3sb+WCQ8yyEesfBBOFEM0EwNeMWMJ3KZbF0gieCqI1whfUoTaFOmDAK
	nvg969QmoPoj2pAa8XLBCwMmzTenrMNZdy2fdJLu1bwA=
X-Received: by 2002:a17:903:1b45:b0:297:ebb2:f4a1 with SMTP id d9443c01a7336-29b6bf3be03mr51850705ad.38.1763787634453;
        Fri, 21 Nov 2025 21:00:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErGn6a+rZ7niUqJOnsHXL1BP002PdSJQ83OT095SG307ONeuKuxhmN6KASHG3xjid0KHlyeg==
X-Received: by 2002:a17:903:1b45:b0:297:ebb2:f4a1 with SMTP id d9443c01a7336-29b6bf3be03mr51850075ad.38.1763787633778;
        Fri, 21 Nov 2025 21:00:33 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b138c08sm70688725ad.25.2025.11.21.21.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 21:00:33 -0800 (PST)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com
Subject: [PATCH v1 00/12] Enable I2C on SA8255p Qualcomm platforms
Date: Sat, 22 Nov 2025 10:30:06 +0530
Message-Id: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAzNyBTYWx0ZWRfX/y8j/nwZoEBk
 h786JBDW4r2B1YlJeri6FX3z9e7lF37u9jREOKv1HgKUPTquZW2mCXuUqj+XfwQkI3jiUVdSqYx
 aMc8v5ZsIkHLUpyQYTJlw2Q9R7p9+Cu+9o15N4NL8ErmGZVM6wp8S+uenL/L1yPyrqgCwcmFd/w
 ESgbciYmU1UtNMlBY3PgppecMtfQ/klLv9eLHjaZAOT2FrAJuAqcm+YU80R6c0G6lxqYgmMDkye
 vi79FKczdQG6QYcCyw4oiRVlNesc/rPslt/7JxDUpU0n7AUXLIWUXaBa201yVhMEvSVjL3N3ZoX
 OeCyIoOcPGnTYlX2s/mXUAoP0uaBobSpYJVtKIysXgPzjaC51fZjwVaQBqjmTHs5rPLFa3Lx2OO
 F7tlTdM5b0atrvVkDcct8UPy9OPgeQ==
X-Proofpoint-GUID: mWNy7aEVntCTfoJu1QO1PgxKdC5daKGZ
X-Proofpoint-ORIG-GUID: mWNy7aEVntCTfoJu1QO1PgxKdC5daKGZ
X-Authority-Analysis: v=2.4 cv=UsBu9uwB c=1 sm=1 tr=0 ts=69214373 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ifZ5Yg0d2t39b6RQntQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_01,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220037

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
  soc: qcom: geni-se: Add geni_se_resource_state() helper
  soc: qcom: geni-se: Introduce helper API for attaching power domains
  soc: qcom: geni-se: Introduce helper APIs for performance control
  dt-bindings: i2c: Describe SA8255p
  i2c: qcom-geni: Isolate serial engine setup
  i2c: qcom-geni: Move resource initialization to separate function
  i2c: qcom-geni: Use geni_se_resources_state() API in runtime PM
    functions
  i2c: qcom-geni: Store of_device_id data in driver private struct
  i2c: qcom-geni: Enable I2C on SA8255p Qualcomm platforms

 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   |  61 ++++
 drivers/i2c/busses/i2c-qcom-geni.c            | 287 +++++++++---------
 drivers/soc/qcom/qcom-geni-se.c               | 245 +++++++++++++--
 include/linux/soc/qcom/geni-se.h              |  17 ++
 4 files changed, 447 insertions(+), 163 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml


base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
-- 
2.34.1


