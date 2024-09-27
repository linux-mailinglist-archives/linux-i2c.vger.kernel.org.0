Return-Path: <linux-i2c+bounces-7044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C717987E69
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 08:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13AB0283C74
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 06:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC89817A92E;
	Fri, 27 Sep 2024 06:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dACh1fMy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A8AF9E4;
	Fri, 27 Sep 2024 06:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727418698; cv=none; b=nuhFG/VrnYH01WYgqS1bpmATBEgR9xmcBbmlcHp9Dvh/7uQ/Vk0h9w7E2FnpqwzVMHuOuurmn5RyiwHwqzFNyIE0b4LLYv8l6gsaZ1yqJecnSGm343bUAlWH0CIyz6Z5cHxxCYjyCHL/VNo0WGI9qxwtowq+3Nrb9uJx6tNTD1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727418698; c=relaxed/simple;
	bh=E5l+KF3z9LuX0cSWiFxdVNZgCJHKrA4+XBIkYIUc6a4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uU6GUXNevxgUyIc/DsQE5Q+T5ayLqEC2AfGft558h38uRf2Ec+3GJbvlcGaCYVNiocn7ti78sIN6yPW0cqu6kQsDsnVp1go34fA7t+KZKVVvFCO2MHUWcDIJYlg1dhnY8UDMim0FNHemvhtqkM5lPomfLBsOEWxaCpDSjpbmhP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dACh1fMy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48QG9eei001881;
	Fri, 27 Sep 2024 06:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v8jhLGIcyIuoj1CO2ilW6C
	o4k21cGdVKm0hOEnMA9oU=; b=dACh1fMywTAcN5ht4AD2tBf2S8ObqtvlKUb4gV
	XhiPIT3F3QkXKjFlyxHtqe1rsdzSt7zThYYHT6TobjLV6mtxt1elLq2G/GeI60EE
	RSqvxAXXvoHLnTSjbxrmpVjj1iaOKvtUJwc2bv8Jn0Z4dDn0bQkRu8iCoGcyheNC
	SkpkF5PGvU8qm7eKZrsKGoWWUwsclNgjauqPrvK9iPzZcW6lkjyGu42L4H4xufju
	UXte64gHPVlWDzB0SW5IDzO/eB7zvLM2SDA6JXserq0MloA+HXcZpz7xgsK/SEEP
	r4+kzyIE8KvTIjXfTyw2Y1wf9hobwCb6W0yz1idnyRLZDNlw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnjf6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48R6VG3U001808;
	Fri, 27 Sep 2024 06:31:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41sq7mnbms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48R6VFI3001801;
	Fri, 27 Sep 2024 06:31:15 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48R6VFDP001799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Sep 2024 06:31:15 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 9D1532408B; Fri, 27 Sep 2024 12:01:14 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v3 0/4] Enable shared SE support over I2C
Date: Fri, 27 Sep 2024 12:01:04 +0530
Message-Id: <20240927063108.2773304-1-quic_msavaliy@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 5K6K7_MrA_cXfg1bPr5Jw7p9XTeAbp0i
X-Proofpoint-GUID: 5K6K7_MrA_cXfg1bPr5Jw7p9XTeAbp0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409270043

This Series adds support to share QUP (Qualcomm Unified peripheral)
based I2C SE (Serial Engine) controller between two subsystems
(Apps/ADSP/TZ etc). Each SS having it's own dedicated GPII(General
Purpose Interface Instance) acting as pipe between SE and GSI(Generic SW-
Interface) DMA HW engine. Hence the sharing of SE is possible only with
I2C SE in GSI mode, not with FIFO/CPU DMA mode.

Subsystem must acquire Lock over the SE so that it gets uninterrupted
control till it unlocks the SE. It also makes sure the commonly shared
TLMM GPIOs are not touched which can impact other subsystem or cause
any interruption. Generally, GPIOs are being unconfigured during
suspend time.

GSI DMA engine is capable to perform requested transfer operations
from any of the I2C client in a seamless way and its transparent to
the subsystems. Make sure to enable “qcom,shared-se” flag only while
enabling this feature. I2C client should add in its respective parent
node. 

Example : 
Two clients from different SS can share an I2C SE for same slave device
OR their owned slave devices.
Assume I2C Slave EEPROM device connected with I2C controller.
Each client from ADSP SS and APPS Linux SS can perform i2c transactions.
This gets serialized by lock TRE + Transfers + Unlock TRE at HW level.


Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---

Link to V2: https://lore.kernel.org/lkml/a88a16ff-3537-4396-b2ea-4ba02b4850e9@quicinc.com/T/

Changes in V3:
 - Added missing maintainers which i forgot to add.
 - Add cover letter with description of SS and EE for dt-bindings patch.
 - Added acronyms expansion to commit log.
 - [PATCH v2 3/4] : Removed exported symbol geni_se_clks_off(). 
   Instead added changes to bypass pinctrl sleep configuration from
   geni_se_resources_off() function.
 - Changed title name of [PATCH v2 3/4] to reflect the suggested changes.
 - [PATCH v2 4/4] kept geni_i2c_runtime_suspend() as is and removed 
   explicit call to geni_se_clks_off().
 - Removed is_shared variable from i2c driver and instead used common 
   shared_geni_se variable from qcom-geni-se.h so that other protocols
   can also extend for similar feature.
 - I2C driver log changed from dev_err() to dev_dbg() for timeout.
 - set gpi_mode = true if shared_geni_se is set for this usecase. Enhanced
   comments around code and commit log.
---

Link to V1: https://lore.kernel.org/lkml/cb7613d0-586e-4089-a1b6-2405f4dc4883@quicinc.com/T/

Changes in V2:
 - Enhanced commit log grammatically for PATCH v1 3/4 as suggested by Bryan.
 - Updated Cover letter along with acronyms expansion.
 - Added maintainers list from other subsystems for review, which was missing.
   Thanks to Krzysztof for pointing out.
 - Added cover letter with an example of Serial Engine sharing.
 - Addressed review comments for all the patches.

---

Mukesh Kumar Savaliya (4):
  dt-bindindgs: i2c: qcom,i2c-geni: Document shared flag
  dma: gpi: Add Lock and Unlock TRE support to access SE exclusively
  soc: qcom: geni-se: Do not keep GPIOs to sleep state for shared SE
    usecase
  i2c: i2c-qcom-geni: Enable i2c controller sharing between two
    subsystems

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  4 ++
 drivers/dma/qcom/gpi.c                        | 37 ++++++++++++++++++-
 drivers/i2c/busses/i2c-qcom-geni.c            | 24 ++++++++++--
 drivers/soc/qcom/qcom-geni-se.c               | 14 +++++--
 include/linux/dma/qcom-gpi-dma.h              |  6 +++
 include/linux/soc/qcom/geni-se.h              |  3 ++
 6 files changed, 79 insertions(+), 9 deletions(-)

-- 
2.25.1


