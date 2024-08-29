Return-Path: <linux-i2c+bounces-5904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058B2963FE2
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69815B252F5
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A6718CC14;
	Thu, 29 Aug 2024 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DNptZBb4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF402B9CD;
	Thu, 29 Aug 2024 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923494; cv=none; b=q5bjiYD9H9g34y7GT/ZkvpiBQ0wECORn01RrCDcZyvbguDLvjppvaz13e3ZTDl6itKCNZ2vg2Fo9IGbL2jdJLxIWs6ESP9i+jSAi0KjmWf3euJdrGZrXEi50CrThFBB60Ua8QJyNrkgHWoX4y3w56Us10tb7hyVCSALnfaobnfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923494; c=relaxed/simple;
	bh=BmUCgCURse82obfDJX2bdOHz4XrifLvgbgNu683Cygk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=h/fTrMPXiIn+XNx0V00ub/OsUQNOafrh1Jq6eb3/DHpDB6k+2s7a2v8JEA8EPp6gquACKBpAXCIls35Nz8mis4KD0r254A0OgG9h7ztzlr0ZZfs0vbJVldyqo8M7gJWSEZmoHbaIvWA7os2T+q+MZezAn/dYzJrJ3/A3kzGVbKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DNptZBb4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8l4Be010874;
	Thu, 29 Aug 2024 09:24:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N4+3oYm3niOTMe23PBZmWX
	kcp58aoGRPFpqbS642dQA=; b=DNptZBb4ACbzXYLi4DCsebMxb5C5VFHm5S1IPy
	fSCF35bnnVozyPLDnN4SYoaA7be20ilzVebQKdindV8vVvBpJdpF5zK9z0tVmQAN
	Yn/VAgfrIlRq6mkmlxIn23t30k2C7QuE2yi88dMtohNc0QY0PAcnSu4SCpP63qUL
	zxrjZHRdo9ZDZrbp3/pN7gB8vRGDk6cdyC24L8uKdU1lgSW0V8DnjhP/Bf/pGADU
	Ob3aD54d2CvVX/fwxSbBfyRpx0/MURMgbmAMjZdE4ktn3znDEe9c/95W+3Xd8CXk
	m51EfIjwstXbECPskrfQnR1g57XSqGM6cG6HqZjxviEUOQYw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0mqbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:24:48 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 47T9OjMX017800;
	Thu, 29 Aug 2024 09:24:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4178kmcgb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:24:45 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47T9Oios017508;
	Thu, 29 Aug 2024 09:24:45 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47T9OikD017246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 09:24:44 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id A5FC5240D0; Thu, 29 Aug 2024 14:54:43 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 0/4] Enable shared SE support over I2C
Date: Thu, 29 Aug 2024 14:54:14 +0530
Message-Id: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SN0ZsRaGfyXrJKAyerQpF4wqhoLMHHGA
X-Proofpoint-ORIG-GUID: SN0ZsRaGfyXrJKAyerQpF4wqhoLMHHGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=537 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1011
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290069

This Series adds support to share QUP based I2C SE between subsystems.
Each subsystem should have its own GPII which interacts between SE and
GSI DMA HW engine.

Subsystem must acquire Lock over the SE on GPII channel so that it
gets uninterrupted control till it unlocks the SE. It also makes sure
the commonly shared TLMM GPIOs are not touched which can impact other
subsystem or cause any interruption. Generally, GPIOs are being
unconfigured during suspend time. 

GSI DMA engine is capable to perform requested transfer operations
from any of the SE in a seamless way and its transparent to the
subsystems. Make sure to enable “qcom,shared-se” flag only while
enabling this feature. I2C client should add in its respective parent
node.

---
Mukesh Kumar Savaliya (4):
  dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
  dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
  soc: qcom: geni-se: Export function geni_se_clks_off()
  i2c: i2c-qcom-geni: Enable i2c controller sharing between two
    subsystems

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
 drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
 drivers/i2c/busses/i2c-qcom-geni.c            | 29 +++++++++++----
 drivers/soc/qcom/qcom-geni-se.c               |  4 +-
 include/linux/dma/qcom-gpi-dma.h              |  6 +++
 include/linux/soc/qcom/geni-se.h              |  3 ++
 6 files changed, 74 insertions(+), 9 deletions(-)

-- 
2.25.1


