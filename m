Return-Path: <linux-i2c+bounces-11563-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E929AE6163
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 11:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D923AF9F4
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 09:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEB0284685;
	Tue, 24 Jun 2025 09:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yy9xyTlz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59FC27C17E;
	Tue, 24 Jun 2025 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758680; cv=none; b=rIN3Zw3G+tXq4/sbvO8vwnmsV1Zm48Hgf+pzF3f8AavUoRvpjc+fc+zdWs0GmYNDyJHpJfJYvuLxuNmqB9e4cQ9OEWkHxWYCV/uFXdxcGHq5EFTWbSIQJ0SXf799wu6kYDEXpPKjWB9iRmLg4pTLPwgMBYL/wFFlTacu071PJRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758680; c=relaxed/simple;
	bh=6XS6URW+fNXg4r827A5tTBn0EwBvhnPHXyF2jX2+V+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gcmcHHwxYYLlHVW0Hu+uYqkuLHRy2edYT3VtHMq0fB7r32i1S5wCcIOb+Yk/ffq3m59TmjeyM92JSGDmCBKSxoiRYsLy3+YX9h//fCq8q2Ddkaz9cGEtBxSL57evVIlpN/L6mKvg0ySQrcKDi3X4BWAvyp7/EM213Vekd/d+RHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yy9xyTlz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O6Xdxj021624;
	Tue, 24 Jun 2025 09:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ssZsxr7pETK
	QAorRIyL3jTyGuLH7UDtlIvyC+WmXQUs=; b=Yy9xyTlzdyE5S7ooFkNaf94BVMD
	mgFqhaPrC9eeQKhQtuof6N7I2Tu37V6v2oZyNSFcgPEOKo+K5Ic75OncOSRjsntq
	L4XFuqNEBJ+MaR6y8KHf3ggSMyXLbaAJl9e5RclLw7xCX/EHBiRB0FK+kgju7Y+c
	/FewPX6m2TX0Id+TjYvqC3aU3KXTApkNfqi+e/sXPflX6Q3HDPrwUqDPE/SERJGg
	UN63Jie4D7HV1FzEUBZu6XTTv/YivYAkuT+fbhCa6/OSaFaJ/AdqyDjplTvMotaw
	WZS1+c4BPAO4T+sFJkPcOCeTXhYyKfPvZ96T7iyob+yuVbUAy8Gl/eLqEbg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rputgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55O9p8qO024192;
	Tue, 24 Jun 2025 09:51:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntktdt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:11 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55O9pBvu024231;
	Tue, 24 Jun 2025 09:51:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55O9pBLb024229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:11 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id C35DA56E; Tue, 24 Jun 2025 15:21:10 +0530 (+0530)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v5 5/5] serial: qcom-geni: Load UART qup Firmware from linux side
Date: Tue, 24 Jun 2025 15:21:02 +0530
Message-Id: <20250624095102.1587580-6-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a7512 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zIdmu9zckVospZd7ahEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4MyBTYWx0ZWRfXyc5gJb9J79B3
 F8N9WEFaDJ5WzRyFz3/2ZjAUz9F7ixEGvpf6CyLESPjMJf2Jt6jr9uMFpy+90CrlIMSUi6OthzY
 2YYs9oWnTaArQAIBOuJqq7bpCJH1L+30foz1bnxVIjBSV3iUAo4WVGTFFBXm3faFundJFAzDGDt
 QnJH4aKCtOhrYzhp4FjxICRjFIK9hY5sEUSD1R1YbnO68hH23qXr6Dbb4S9ZvXQvitljnh37w0c
 Cst/UnUt6UIyBxni2BwYPdyuDMi9WaEQFL02ZSkxmW1mJCfcSGTHqVoxNFL1IDRL4ud+4dWD1Ks
 +NeVrw3bho2ZaW271pgaws57or2m7UB9tAXOBZwJTwaV377cnVlNNA9UqjX++RrSCt/fzkBZNBX
 wn9/aZNdG8aiHnQ6zmXweq5u8j1cqfOtDP/sDvNTbZqKwtMogUNq1/82mZas22UI9BcnQPwC
X-Proofpoint-ORIG-GUID: vnsnWfI0FvXeJOFG6F8bOgAI_jXDJs2a
X-Proofpoint-GUID: vnsnWfI0FvXeJOFG6F8bOgAI_jXDJs2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240083

Add provision to load firmware of Serial engine for UART protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Dependencies:

This patch depends on patch 2 of this series.

v4 -> v5:

- Updated the email domain from 'quic' to 'oss'.

v4 Link: https://lore.kernel.org/all/20250503111029.3583807-6-quic_vdadhani@quicinc.com/

v3 -> v4:

- Add a patch dependency note.

v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-10-quic_vdadhani@quicinc.com/

v2 -> v3:

- Load firmware only if the protocol is invalid.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-9-quic_vdadhani@quicinc.com/

v1 -> v2:

- No change.

v1 Link: https://lore.kernel.org/linux-arm-msm/20241204150326.1470749-8-quic_vdadhani@quicinc.com/
---
---
 drivers/tty/serial/qcom_geni_serial.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0293b6210aa6..9f905ae3c127 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1161,7 +1161,13 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	int ret;
 
 	proto = geni_se_read_proto(&port->se);
-	if (proto != GENI_SE_UART) {
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&port->se, GENI_SE_UART);
+		if (ret) {
+			dev_err(uport->dev, "UART firmware load failed ret: %d\n", ret);
+			return ret;
+		}
+	} else if (proto != GENI_SE_UART) {
 		dev_err(uport->dev, "Invalid FW loaded, proto: %d\n", proto);
 		return -ENXIO;
 	}
-- 
2.34.1


