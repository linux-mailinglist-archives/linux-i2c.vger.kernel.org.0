Return-Path: <linux-i2c+bounces-10745-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D4AA803F
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 13:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 479AA46553A
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 11:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3277F1EF388;
	Sat,  3 May 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K8x2jvbY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD91E2606;
	Sat,  3 May 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746270649; cv=none; b=p3aYJHQyNej/AYdXeGQojVFDKNc82MD8ibDQIQ3YM3eOORLbkTtcF5oawWnuQvXDvEJhNEyvUYfqJv0+T/ILoAaUqwfpaGavpnQP1kBnP29M+1PvCGq/xtqhMiUPV7JrmCNm1DBZHCc+O0WN5dTjXginU6puHynqS4V2vRIcRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746270649; c=relaxed/simple;
	bh=yWRiReD8dMwPea3GpBpDA9L+OkrMi2NqY9dZLMtIOjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SZwd/0XEulIc7zripyzEtAIwx6vpZqqJm3AY6rvSM0juST46R+ss5F7zQ6YdxtbhqoTtJcWKJs7cLTgLvoE/GvuDjoXqOP46E70YpayEKJx8r+rumyP+BzLuvCJWingNgpX8KPhXftIUscEgmJOt33VhQnxhz6+K7o1wb3RsfGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K8x2jvbY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433tokD002033;
	Sat, 3 May 2025 11:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h+hWKgtr/cO
	cEskc2JbFrF9bFW3+7+qMUQGqBl9od/g=; b=K8x2jvbY79Yqyc09IxVKxZHjBjo
	+fSkph1xNX2Cj9h0dsuPu6PKW7GoNR3xE8ff5wDuXH/sq30me8AGB5meVsrJ3Oeg
	MgnWrSxtk/MqI3lTfshU/BOzPmHyJ0SnBuiHyJkGTQOC3vTLPC7zV3F1ffCaX3SX
	AZwS03D2d2kQbDTX3/cfqaNSuwUJD7ybmGNNZ87UWyIb71HNSUfkI843RCfeK9pq
	S/nPFhFx/v0e+AFKoNoYwJTwv06KAEyTQO0e8q5EdQA0XWuyPZv2cmqhoztOmHTD
	1HHqp0FO+V/z+ZatK5R+A7GihyVpEaEOOB7RKpA2nKRqfxIw12Rl41OseXA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh78fxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:10:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543BAWRm023579;
	Sat, 3 May 2025 11:10:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7kjmsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:10:34 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543BAYgB023624;
	Sat, 3 May 2025 11:10:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 543BAXib023618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:10:34 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 5D24D578; Sat,  3 May 2025 16:40:33 +0530 (+0530)
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
Subject: [PATCH v4 4/5] spi: geni-qcom: Load spi qup Firmware from linux side
Date: Sat,  3 May 2025 16:40:28 +0530
Message-Id: <20250503111029.3583807-5-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
References: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=6815f9ae cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=zIdmu9zckVospZd7ahEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IGZz2FN9vplv_c52ClYQljeNKfmFSa9X
X-Proofpoint-ORIG-GUID: IGZz2FN9vplv_c52ClYQljeNKfmFSa9X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA5OSBTYWx0ZWRfX6a8dAzUCAefG
 Wk/oYi/elg4DJYsuOSs+aUhGRnpLETE8y51BDWt6QFgkF/+qXnma09F9UIfqbGegcickioSMbzu
 TMTdG2ZO9AobHBE4ucN1diEOqBl97Pn9xhCev1tRvm/lOOhd/UDOb1ASnTLsFSuL5ziG7zb8VKS
 HufthgBMADw8B5nYYHolQ5LmHPAZVvFwcqNv2NlT1sjS7Hh6lDImplxW8fDELBQUnByzOPjf726
 GvqwSM9lf3tF8pq9y9LG/siDU2Cx304VshRMlQOELnGX5LjqKbDoAlKIXyrkoqq8HwJyRva+HS/
 7DvM0aMNiP51hFUXtdHrIY1SLIeY7//s2rANM++p9NPVDCAZigOP0g1NcvbUN3SEPTJ/luPjGJV
 XiDdyaLXLm4T3MJcanwsXDVXeFmIme+dxDiabOrdK1AtFuLLGa50SdhEvokzpPkSgVs3vUF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030099

Add provision to load firmware of Serial engine for SPI protocol from
Linux Execution Environment on running on APPS processor.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
Dependencies:

This patch depends on patch 2 of this series.

v3 -> v4:

- Add a patch dependency note.

v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-9-quic_vdadhani@quicinc.com/

v2 -> v3:

- Load firmware only if the protocol is invalid.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-8-quic_vdadhani@quicinc.com/

v1 -> v2:

- No change.

v1 Link: https://lore.kernel.org/linux-arm-msm/20241204150326.1470749-7-quic_vdadhani@quicinc.com/
---
---
 drivers/spi/spi-geni-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 768d7482102a..a0d8d3425c6c 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -671,6 +671,12 @@ static int spi_geni_init(struct spi_geni_master *mas)
 			goto out_pm;
 		}
 		spi_slv_setup(mas);
+	} else if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(se, GENI_SE_SPI);
+		if (ret) {
+			dev_err(mas->dev, "spi master firmware load failed ret: %d\n", ret);
+			goto out_pm;
+		}
 	} else if (proto != GENI_SE_SPI) {
 		dev_err(mas->dev, "Invalid proto %d\n", proto);
 		goto out_pm;
-- 
2.34.1


