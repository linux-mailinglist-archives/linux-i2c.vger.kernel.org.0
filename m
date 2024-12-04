Return-Path: <linux-i2c+bounces-8326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C47449E3DA8
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 16:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8495B280D74
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Dec 2024 15:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28EE20CCFC;
	Wed,  4 Dec 2024 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IOkEu/NV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2120C461;
	Wed,  4 Dec 2024 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733324624; cv=none; b=ggyHx58Ia4U/slEsnToinCj7lBOF2YlhBysZ8QQEtfnrT9FuTv3f+ZdRBz9UygVW8kaSvuuR4hiXwEtBRRMx+Xxqi0m0iynyvjG76/Ymvdv+l+s7SKkpbjknrWWuUP6pZBiaTex784vmPbxebej9FU7AT9KVWWHyAs5myiXLv/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733324624; c=relaxed/simple;
	bh=Y7FucONKiPz1qmmLTKvznPQ/455OqbhB1yHc4rwLpN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O+TBfMjjFcLeikUoMDpO5KINIVUapo1CZpG/ROO5cHn4KFgCGPoY8aFMxkNlnMtyC8qzFhdVX0pmBFQpxJyD+R8SGyKV1Z+x731lgtRmuYTZ7Ene0ykn7No6YR8RC7IwIPuPlqoGws/Pb1D+3+b638Gbv+WfMjF9RQgUiROc6BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IOkEu/NV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B46VU1r027853;
	Wed, 4 Dec 2024 15:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=txFYIp4/q0z
	VEIvPK6RxdTIa8Ns51fTEevXo+PWIebE=; b=IOkEu/NV+VML2ywW0xqKsDKbWiE
	VJlspeDtYq7q4LPmME3bq3s+s+0ZqCf5QqM60r5bwMBj3C/tFX+0jpeSu+IscPEc
	RlN7HPtBuLrxrKrceUZU+HrguHfvDVxT6gpgDzxUvR5puhgz1DcCksXzuc08jD1l
	NlHwQSktHmkuq0m1+qehH1FYTyN0GR0dfyaOpC2E55R6C8r3IVUu1ENlixEd+POL
	PusFisT2jPXYSm1PeM97qQ/i6fDbEEX2JlsRug8C+7E55b4gV6XxuKziseCY0PNB
	jzuJkhHNRpacpJEPH1dsowG4g7D35MOaRxHgFjf2SPP1dFEV5IMxiLUQwQg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vcemqph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4F3VMH025767;
	Wed, 4 Dec 2024 15:03:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 437uskx4ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:35 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B4F3XHL025802;
	Wed, 4 Dec 2024 15:03:35 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4B4F3YHs025837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 15:03:35 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 38BE7503; Wed,  4 Dec 2024 20:33:34 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: =quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 7/7] serial: qcom-geni: Load UART qup Firmware from linux side
Date: Wed,  4 Dec 2024 20:33:26 +0530
Message-Id: <20241204150326.1470749-8-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
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
X-Proofpoint-GUID: wh6wqi6INLQl8i0K6R2oAtobp6rlQmzi
X-Proofpoint-ORIG-GUID: wh6wqi6INLQl8i0K6R2oAtobp6rlQmzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040115

Add provision to load firmware of Serial engine for UART protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index a80ce7aaf309..e3b0fc65f3bb 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1146,8 +1146,11 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 
 	proto = geni_se_read_proto(&port->se);
 	if (proto != GENI_SE_UART) {
-		dev_err(uport->dev, "Invalid FW loaded, proto: %d\n", proto);
-		return -ENXIO;
+		ret = geni_load_se_firmware(&port->se, GENI_SE_UART);
+		if (ret) {
+			dev_err(uport->dev, "UART firmware load failed ret: %d\n", ret);
+			return ret;
+		}
 	}
 
 	qcom_geni_serial_stop_rx(uport);
-- 
2.34.1


