Return-Path: <linux-i2c+bounces-12434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4179B372B8
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 20:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CEDD1BA0254
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Aug 2025 18:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BCFC371E88;
	Tue, 26 Aug 2025 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oVUJ2hCu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DE723BF96;
	Tue, 26 Aug 2025 18:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756234658; cv=none; b=VW+ZWTv2gGgnQ4RLMEHd6veCUuwiEoG+79DwAcszqq2GHF9yH3xUgLY3pytEzrc5LdAJGM7DKUd3HjJaY0wonqudabypCcMyw/NTkb6LNGnoPEJZHGVA8awpk5LwdjgtPj4XONjrA7L6qFzFpEcdTVHc9NCcMu8VdiJyILXeQwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756234658; c=relaxed/simple;
	bh=lN7Svp23WxXjpNEd84aTWJWKmt2lAtB6NiKqX8EzItQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mk5fXMK20QSyM3m+YKTVDiits7nErWXK7tv+gJW7L0FNvTBg2RhGMy5KiSdbi++Oo1Y1FKIVHNOiCrqvqNNqniiKXyj+SKSRnK/Ccn+yhH9U5Aye//hj2KlGZekTLW9cLH0q8Biktr0liEf2OSHIaV7j8dUQ/eDh0KhFiS0lhj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oVUJ2hCu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QFcE9w000535;
	Tue, 26 Aug 2025 18:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v+T8q1W6eZw3pI8dVhJfZiZIyh0d6oP9Trr
	aMi7wJYA=; b=oVUJ2hCuNB7GpCjXWxI2ZhXc6GxdOrL+GBJLMwNA9wQFJFnNiMB
	LMArg0dUKg0e3PUJOzfvkbzCeFN1WJmtefu+DYJeMsMWJDkgbSTidrv11pJsNfXW
	+Kd9chhVwGCK7fjquOz5cjzPe90Gr1UoNkWkwEsZMzA5iMtSf4kEkxxr+hMbQyCX
	jhYEMgpLlQK8Rp/3XJcAkn8PTa1WwsH4I+BIpiT/hjKOprKqVfpYlDTgNScGDKhf
	Lz41dnxTtjK8t3EFZADWZaFr6000EnFw9i3v1FYi2x86RP4xCDIvmC08zqqHE7M0
	xyzH8uewOg1XrW2pw3sip++zdGkljauZIyQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfj254-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 18:57:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57QIvWkT015113;
	Tue, 26 Aug 2025 18:57:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48q6qngy0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 18:57:32 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57QIvVpR015105;
	Tue, 26 Aug 2025 18:57:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 57QIvVSa015097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Aug 2025 18:57:31 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id B1FC123431; Wed, 27 Aug 2025 00:27:30 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: viken.dadhaniya@oss.qualcomm.com,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: Update email address for Qualcomm's I2C GENI maintainers
Date: Wed, 27 Aug 2025 00:27:18 +0530
Message-Id: <20250826185718.467474-1-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1X3AEayjQO2/
 MNXbG5jPFcX0YERozMJL4UhjH6M31h1TQhTznpqaglab6E1hflIq8cMznwhhvYYs5ENCjUcJjZu
 +di/PJ6j6tMHhcOn4iWjooY5wJD9wXQZLGn5/7QWN7G1osvSyKQiJCA+4TVFpm/x1aikjoSEeX6
 RZQCTtVpi6SW7hRHrTzdLvv4dyQJ9jVAon4DBOPXhVP0/rvhHVeNrk1mqxXZX77cwlh7jJ9PScz
 qc3PwmoPw4rbQ6yaxRyvefU6lk38oabkDqdzXY+Yu7BtmsKN0J8vg0GhTl8S9rhIZmwv86sul4T
 HIe1KBUxoUOgh/kNYGWZl+f7s4SIrc2nTYGTfOC/pIqQdlBGfKTYej8ZBxwizImy/9+52g0paxX
 RoiOStsQ
X-Proofpoint-GUID: DERzTSS-HfpVM2YfTH0WdAsbc1e2h32-
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ae039f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=4VVcHpUFlTeZ-k0x__MA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DERzTSS-HfpVM2YfTH0WdAsbc1e2h32-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Update email address to @oss.qualcomm.com for both the maintainers
from qualcomm, Viken dadhani and Mukesh Kumar Savaliya.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9106a1351d22..ec86e31e5fb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20851,8 +20851,8 @@ S:	Supported
 F:	drivers/dma/qcom/hidma*
 
 QUALCOMM I2C QCOM GENI DRIVER
-M:	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
-M:	Viken Dadhaniya <quic_vdadhani@quicinc.com>
+M:	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+M:	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
 L:	linux-i2c@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.25.1


