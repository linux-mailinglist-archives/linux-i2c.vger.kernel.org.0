Return-Path: <linux-i2c+bounces-9171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9631AA1B423
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 11:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F6203A7731
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jan 2025 10:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AB521D5BA;
	Fri, 24 Jan 2025 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hGiBwGZV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34E221A95D;
	Fri, 24 Jan 2025 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716017; cv=none; b=tO+CzNK7jppwEzKrXUVga3+u4EAtwIG5vRXEMI/cpKa8DR34bwaHvmROPgQ8X5Shc2o52DelDteWfX3rERym+8b73GdGJskK7bYWhqYYndIx6ROH96mJWDSbfe5nBTiPBOdT+rv3MvfvyOjjNS2s2tFWGIo38Gj9vO1wHTr6Hv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716017; c=relaxed/simple;
	bh=Y7FucONKiPz1qmmLTKvznPQ/455OqbhB1yHc4rwLpN8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qnm0vpXS6d/ujA7sIOJ+WbWZq2N+efeg730A+ThTXMNzqvZv+zGV6i31CRPLVmr40Pub4FK0Buz+ZbKQeC4SRnK8kgIL1F2cyQbz5PfDItuQnBDSkYv/XQKi21cFbA2gOfWdbPk/1SigPiLxBW78JEa3KwN+dvJ3O5iGZRlXbAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hGiBwGZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OA5WZ6010882;
	Fri, 24 Jan 2025 10:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=txFYIp4/q0z
	VEIvPK6RxdTIa8Ns51fTEevXo+PWIebE=; b=hGiBwGZV+Oy9wZxBMOacW/1bU2c
	lBp9uhC4ynVY7m8uG460qFnyOOa1rmKDugFbTAqFThc6418eQyTiTWen0H7dlnxm
	cfq7Lh9u0t2DO0/DHjJ94jvC79YNTaE5RtDqK56i/o8ZQL+aQgIJhO0gGYTpBwvO
	+otZdP9nFvQL4YgZc5y6MBj7/+rFXqpyD3wOyi5y0l1frP22zfy1wUzWTa9pY0zf
	v2pHv6OuQSzQ6exwITtKIBtBxms3rZj7iqd4umnA6WEdmr9VrrpBKEHQm9oKupxp
	m/dGS9kv5xbwB2s3sOc9AMSqa2bNDPAiwCyEVM3wDG+epyeisz8XS9I8Z7A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c8ta85px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:31 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50OArTJA016785;
	Fri, 24 Jan 2025 10:53:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4485cm9h1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50OArItN016260;
	Fri, 24 Jan 2025 10:53:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 50OArSuv016778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:53:28 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id BFFD5568; Fri, 24 Jan 2025 16:23:27 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v2 8/8] serial: qcom-geni: Load UART qup Firmware from linux side
Date: Fri, 24 Jan 2025 16:23:09 +0530
Message-Id: <20250124105309.295769-9-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
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
X-Proofpoint-GUID: IIe2RDqgfMkd5s_nqat_HXmDfsVsNacH
X-Proofpoint-ORIG-GUID: IIe2RDqgfMkd5s_nqat_HXmDfsVsNacH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240079

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


