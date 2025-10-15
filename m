Return-Path: <linux-i2c+bounces-13490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 052FABDC2F7
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 04:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C6C8346009
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 02:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8B530C62B;
	Wed, 15 Oct 2025 02:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rqpar8CB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EDE30C36F
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760496207; cv=none; b=JP0LXkzIt3U0xe/WB3sBZTRjDqLH50BegxP9hGyoH5J1bBrBUSHYEFzizFeeu5431MUtZf4Lc3u9Htn+8UpNzTJ8uO8TG1Zh1b2Ws+glhRL1K7EGbJkurElbmfe9AHr/ZS/DV6KheZWYtly11VlGJ64m4jAWiWnqjlwJZch9jqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760496207; c=relaxed/simple;
	bh=0rVwPwb2voVzOHTKavO0nQGcp9y2IoeMgD6s71JHxRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QVZO5aPhrWPnNefQIM8Jc+weRPIGDCpeRDE9IRJdbSFPweDMazqLTxOCDDUHyjftcM8Ti28otDN3O3rTfQZaC3icacUdKBuiHVsPFky7tVKpFRQurGWPZ8VTc+x8BE7DSIZfiUaLyhXgTOQhiNNnONev2k5XW3yeNj9l9bvA7RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rqpar8CB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2dNOC007150
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a8Qod7OOqEkFq+EpdIzWVZ
	NCKD/5SirXFq15HIYfIa0=; b=Rqpar8CBotbS2mYoRyKRjxjSXXOw69dFCHbDYK
	1Ag6n+cdgcKt1M4cX9Qq9yOnqfbUPeZ68WbA0CYxk35Pscz4yO1oIBTr5KEnAJ0R
	h1TR7kXPs7gUvCqs797FUfzhVVO58f2CHZ7MOSbtOM0cqPOgNFdzpTmXY6XXPMlL
	Cxou2uR3zUiLDRRJtgBrL8et5zA6Gmz2IJeuAZozxvE/Q1AX8sgURcmQcfVqPEjp
	ZDKxFk4JeMSKUzhit7yywQuEJCIHpFdgodoNbwtSng+AvnAmh4KRKSbddNfiKfOv
	gOjpJoRQmCJOfj6bxJ2pUWS1p1AXrlYLIO8Tfvwmbv228y6Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd92upx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 02:43:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27ee41e062cso138218105ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 19:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760496204; x=1761101004;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Qod7OOqEkFq+EpdIzWVZNCKD/5SirXFq15HIYfIa0=;
        b=Z7OySFduVHh/87vNJJup3u1+HYeC1P7zoX1fr3Br+iVWYXOnpVYq01QgnXg+5j/nlQ
         MaTusTfxMNal0/0Asc1PQhsSC9D9B5Z/RVnWAVNZQOzf8IjzMyreeZJ/PYmMDQKBhQbo
         0TXcngwx25H5G0gL/40JdN0KylmwAoGBRbnwQ9vO1+iqEihrPutDf0NOuRpCNuACFh4B
         og+UvKAxUtiA3g+PcRRD74TbJSdcPHQjRyYP9ngEPC9yOxUBpxY/Q9HIKFY+j9/EbEJt
         TIMo/NPvKXxSb9vgQalBq4ORj9SN3n5obxyLupSSaq6yn8vasWU/g/Cm7ALExydLWtqj
         P/tQ==
X-Gm-Message-State: AOJu0Yz91Eo6NZusRXs2+cDzdtLKdJrjsluw3ZSZd4kIys2lcK/NQ721
	W/CnFl6WAGg9T6hL0GBDl6ULkHhpc3BcYr14AyLV4PL7D8uw8Iv5v5LwkyUzWjJldrC0QXA0Aab
	Mk4uX3uFOs/P5kSfwahU2zQrxBHBmcKJd9QO4n1Q0NK7Xcu3/QONYLDkgaAtG1H0tMJ+sgzzavg
	==
X-Gm-Gg: ASbGnctFSw7SAvQMvbgXq5V3vM3lzEzJLq466pLEP0AwPCvm0/avkcPnhJBKn/HvLzA
	aZj9G/9dBjR31Xi7YIxO0cQ49ew7BniW6pu5ku0PkpXWQH6ny5eXCCLpoYglfxqEyjoRtgfJaoH
	5YVsi0Wf/U9Czga0SvnTdGG49J1W6dXiezz58BSGFKnd2+54u3Ls9mzRcRqT3xjxIAo47/ZrSci
	AjuSvZpXs6bfa8QkHLO7SB9P+czF5LOnVAiZZWTLT2Ys7yLX2bYYP2t3mf7Fz+eFTIUsbOmE9Kk
	zknJ8bC+sZXNNbO/ArE3CJk4jaMfACVMaSbyO7JO6vNWIPmr14U9koSZiP9f56sBJkITga2ji0u
	0du/b4W/exFElB1Is8Lw=
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr317468505ad.44.1760496204324;
        Tue, 14 Oct 2025 19:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE42hE6or4x2HxX7l7lKxe4Bot0TYcL2n/exI1bwf9/Tnqk7dDhc/fzZnCyrUZVLqkIz2RJDQ==
X-Received: by 2002:a17:903:244c:b0:27e:dc53:d222 with SMTP id d9443c01a7336-290273713c8mr317468295ad.44.1760496203842;
        Tue, 14 Oct 2025 19:43:23 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f366c0sm179219505ad.94.2025.10.14.19.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 19:43:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:43:15 -0700
Subject: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEIK72gC/x3Nyw6CMBBG4Vchs/ZPaJV4eRXDok6nMBEH0xI0I
 by7jctvc85GRbJKoVuzUZZVi85W4Q4N8RhsEGisJt/6zrXOI8QIkw94mvkJNaxJ8AoLj2oDJi0
 LfJceTo7nC5+uVEPvLEm//8m93/cflrJxg3QAAAA=
X-Change-ID: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 5s4d7xT7f5AFr3hK_aaDZQ_HITq5J4ov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX/mU2amwlayA/
 VMFngqrTRvYhL8Jrd+NcuaaVNn0kOu48yD8J9J65vCSTcl1AxHLd+hi1HWxys6gJOAfzDPJL+4w
 2oqNpXJD52YWV5wJcsX0xhyxAF9aX8rAJ8HUjba1DxpiCUqCfXmxKq5v3Lfg2WhF7PL1N6Iep8p
 bRwiaYSCIn4dehNIBOa6nCDng6O9tyxkNLEs/nVjnelN3UzlWZiAwNwlEWkRgUcrKxXoSsJZ3wq
 z2Zmr11doqiAU/+H2jbAjnDnlq4JbI+Ek5e1k9QE1UcV+M1uplKsDiU3j6iRIOSS3qg8a2MASey
 zeAHQusIhqMI1H5H0pLTSeSJ1zz2IBfeF8ikUHrLSTgYi6khW46tuA86LHpNXFp0STDey3PcBYh
 64JwbEvj4YEz3C9fweOMnm5fr2QS9w==
X-Proofpoint-GUID: 5s4d7xT7f5AFr3hK_aaDZQ_HITq5J4ov
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef0a4d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F0hiWKNqIihWguCrtJ8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On hardware architectures where a single CAMNOC module is split into
two, one for each of the real time (RT) and non real time (NRT) modules
within camera sub system, processing VFE output over the AXI bus
requires enabling and setting the appropriate clock rate for the RT
CAMNOC. This change lays the groundwork for supporting such
configurations.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
This change lays the groundwork for supporting configurations for
hardware architectures that split a single CAMNOC module into real time
(RT) and non real time (NRT).
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ee08dbbddf88..09b29ba383f1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 	return (!strcmp(clock->name, vfe_name) ||
 		!strcmp(clock->name, vfe_lite_name) ||
 		!strcmp(clock->name, "vfe_lite") ||
-		!strcmp(clock->name, "camnoc_axi"));
+		!strcmp(clock->name, "camnoc_axi") ||
+		!strcmp(clock->name, "camnoc_rt_axi"));
 }
 
 /*

---
base-commit: 69a67cb382f428c6dd8ba63e44cd2c59cb84f736
change-id: 20251012-add-new-clock-in-vfe-matching-list-25fb1e378c49

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


