Return-Path: <linux-i2c+bounces-12374-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF4B3106A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 09:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58A803AED11
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Aug 2025 07:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E0A2EB5CC;
	Fri, 22 Aug 2025 07:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXeN0NDY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0B92EACEE
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847649; cv=none; b=TlUFNQMVAD9KIKxVBnB2QS5qJ4acikaNzbtYl3hNVMfNXdU1zVvaYHZOgBq6ml9PyvmANEOGtSzdCkl85fqkG8BgwcIOG8/Ya/TZskf6lr87BMJhdQEpwziewllvvbBLH5tLhzmwqYBcGMaqOiSa40SFb8GF+DWwaeKhnJmSK2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847649; c=relaxed/simple;
	bh=2PNVuXq+ZYwaLuZ7rUo4rH3IJfNSTpQ7FJZqxFzNtv0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YQkW0sFVTqkNQ67XExRdJW7bj01HW7XmBzWKTWiNKYccIXAWL4V0T/L9xUdMTKPulPUCK15+MyAgafd3iu6clLhFpHiHyk0j0uDnwCJVOgXrrorUBVx+5sODlDXWuQ2k06XrJ/QCzu/4ygtZIvz9C6AC9mWE6yEggSUaXsq8wfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXeN0NDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uRYG011425
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BrYCSYr4l+R
	GAx5Rr4vA8mbuZgqIc3xnPF8sQ/ZYbOc=; b=YXeN0NDY23TjYc6Osb4Xc1Snjgy
	cWTy4GYkEnPkHjchJKge2Sz0jG7nTeCOy70pMQrr9Xp5ngFMyoTOKKEqpNFMLrWU
	+Hh7gzzMZ1JJxEgsxzwyARvkSxpcb7Equ5PZUGYGhFJigEh9BKK+JNdbhG8GIFWd
	2LySOA+KYlrqq1aO3SUb+I3Nu8FsuB1BKSAi5+ZW+w1Y9G6Xcuu8kM+uFkbX0lQJ
	cqPRABd+ES97dCcMVTESy3/V5JtLtXUPI01lwRclIX/pxN2Ooe+SeryRSO+sVYI4
	oZg40WJ87TbQNk12k/FDljGYu1Kbx6b6dfXpmhsaULWMzyJS+K3AquXllGQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8e1t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 07:27:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e8cc27f5fso1754381b3a.2
        for <linux-i2c@vger.kernel.org>; Fri, 22 Aug 2025 00:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847645; x=1756452445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrYCSYr4l+RGAx5Rr4vA8mbuZgqIc3xnPF8sQ/ZYbOc=;
        b=m4BwLZaebXzQnTIJ1Aq6y0nZ/GEF6+h79GWI4paWsMLSLDOSiggWfRlOlMIa3MQEPe
         v5kSGD/jyR37aUPpz1FXxlxhpFDOEP/VmG7bSGDBtAitoAEkbSr5NBS6QozXik3rXWva
         uvjmyS46za8a7nqc1cY7BdFG0W/gjx0qRg233Sf+q3XcJfAOCMKmlvrAqTadO1SmJbkX
         lSq7EKkdomR16a2+vDv5RI+3C7ge9mE7VmafSRLCAtD52Gx8Tc/NrVD2ZluEabEAeDMf
         WP38wGmhpz0KPdLgpwmLFZnzfyHX0HST89nlOuYqiCVpOE6+MPFGXgm+l53akTJH5gRf
         rDvA==
X-Forwarded-Encrypted: i=1; AJvYcCWFfPR22YyzG1KgBEZ4ZmEqj7SVztUHvVGmBD8WY1IqFcYTBjs944DmlJFMVNdZUBwPiAZjBOHzJGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuu+2nnCA6YAasvMS00NYwj6pBhBBRBF3SqG+eyRcJlGOMTrSe
	oirJR5M1UKyqsG7Jz58hpoIqUA9wqFyr2mlGGS1WAvjbLpQdMH1Zly9ib5pmH/SztXedRlOzMd9
	jF6aKlTI6bPoxbs6u+lapACodT6JyO1lquJhlBuMdNQXVbdOv7JxHzyM1QqYNyZ0=
X-Gm-Gg: ASbGncteXLty5CZOJDKxwKbgx5NfNsh5RYbE77lV1SFZVHVzNwoE+b0wBEhbBnP9249
	ngfATF/U9PFdJn177nx6sk1WtyhVGUpXr89IhCIciiHewb0/9Fgy3AuWih2580QRhZGCvxAva/Y
	P6ZHT0aYtoEUCf9QyEjJf5TUVWHxmg4LQcdGh76R7tAm31THTX/FH9s7khtzeutxphapC+s8e0h
	aZMfo1bxuFcSlzPEo1DAUiDMOihb/wKZONTh8pvypJukmHycBQJq/sXDoC8JXAChnA7mkX58cwM
	4SXfpo+isaF7S/V/wzpjOuSroIC+v2NDKyLwdT29IK42FtlVI14wNxi4CiO+51WJKVUQXHZqNw1
	c
X-Received: by 2002:a05:6a20:6a06:b0:23d:7b87:2c88 with SMTP id adf61e73a8af0-24340b7c7dbmr2399217637.9.1755847644791;
        Fri, 22 Aug 2025 00:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGueuQAtbJyunfN/7SGGX9fsHuG9nFd0VIDf06IMkL0qz8ftPZLBXEwTTKRWnxH8rIeBR3Ihw==
X-Received: by 2002:a05:6a20:6a06:b0:23d:7b87:2c88 with SMTP id adf61e73a8af0-24340b7c7dbmr2399187637.9.1755847644346;
        Fri, 22 Aug 2025 00:27:24 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fe3047sm6416367a12.17.2025.08.22.00.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 00:27:24 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, broonie@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v6 4/6] i2c: qcom-geni: Load i2c qup Firmware from linux side
Date: Fri, 22 Aug 2025 12:56:49 +0530
Message-Id: <20250822072651.510027-5-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
References: <20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX+9dZg/Rv55LD
 V4TejU8/1D3gwFYLq5eFls00DyD3+qeyz64qkc4m/3F11Vo52tuajdLquCVxHdCa8ljp1CUrY6E
 goXi61ZhmrVgnbBDL+Ioc4K9iFrxozszgx3z+dZudWyuk0dLQ0hvxIug+rTc5u52J6a+gm+/JgG
 TdiWjTSg3CuEBB9HQt35BDvAO6SeES2at1Ux4fNWvrksWoGv8Vo67GyaJxC3iD+4VWuCgaKPw4u
 tRFgpE0+qRKrmCcPegV8ytbTF7N69RfeKS8iyaK9j/snd9/KLxZ3Hq8qqfmensbI9r36QsdVe2L
 ttPUcN3uP2I/NUIl/Q4Rdbaj4HONHUV9JmW38dFj7w18NjiM0JTRAL9CmdYqNzQUvxQVwf2E7A7
 y9t48h98VwhAI7WJqxZInQYu2FM35A==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a81bde cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=9JGZuxy38fRfBSF6gCkA:9 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -OKBLvm5NfkGDRJaUnh6SR1HYm67Hn4J
X-Proofpoint-ORIG-GUID: -OKBLvm5NfkGDRJaUnh6SR1HYm67Hn4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134

Add provision to load firmware of Serial engine for I2C protocol from
Linux Execution Environment on running on APPS processor.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Co-developed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Dependencies:

This patch depends on patch 3 of this series.

v5 -> v6:

- Added Acked-by tag.

v5 Link: https://lore.kernel.org/linux-i2c/20250624095102.1587580-4-viken.dadhaniya@oss.qualcomm.com/

v4 -> v5:

- Updated the email domain from 'quic' to 'oss'.

v4 Link: https://lore.kernel.org/all/20250503111029.3583807-4-quic_vdadhani@quicinc.com/

v3 - >v4:

- Add a patch dependency note.

v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-8-quic_vdadhani@quicinc.com/

v2 -> v3:

- Load firmware only if the protocol is invalid.

v2 Link: https://lore.kernel.org/linux-arm-msm/20250124105309.295769-7-quic_vdadhani@quicinc.com/

v1 -> v2:

- No change.

v1 Link: https://lore.kernel.org/linux-arm-msm/20241204150326.1470749-6-quic_vdadhani@quicinc.com/
---
---
 drivers/i2c/busses/i2c-qcom-geni.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ff2289b52c84..95a577764d5c 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -870,7 +870,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
-	if (proto != GENI_SE_I2C) {
+	if (proto == GENI_SE_INVALID_PROTO) {
+		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
+		if (ret) {
+			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
+			goto err_resources;
+		}
+	} else if (proto != GENI_SE_I2C) {
 		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
 		goto err_resources;
 	}
-- 
2.34.1


