Return-Path: <linux-i2c+bounces-14266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D64C89001
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 10:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 72E2335294C
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 09:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4923090D9;
	Wed, 26 Nov 2025 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ajk8ZMj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwLg+x0l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974322E0934
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150009; cv=none; b=UitlD4W6p2TLcPZh799sn/7TABT5oC6tmr5bjNN7UYqK8nmJJ51smypN6TD/T+4kCf7bIL9EUE4zZt+JLq2iPCQKRj7M2VXzdvKQyetDVpyGMAilOIXE5t4GPQlEZqWXOaWQ6dX30kdLtTRhY6rOAPFoJXr1ZSBSb3szi2nZRQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150009; c=relaxed/simple;
	bh=ZI+70tmjzoI7wmLgTedB91cfS9K5LpTxwWfVizhjf8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xb+O6V1FEdZZiuQ5Izobedo/Cci5KtIAhEdLXs5/yX35aB7aukJ2WrsBuME9sV4821cyGlv2PqeES+pttnWIp4vNdmV6DwrUYcJ6ui5BLn90yO4BAUpOwvkkQUlNk+DKqzCV6CsDmjvjo4qrkq1SBiAWDc9rtK/XgWstNh4W5BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ajk8ZMj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwLg+x0l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8pre63666525
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykS43o/yABQo0bHJe1uANTAp3KJUCM6NxQEV+xrtv7M=; b=Ajk8ZMj0lGw93AHc
	1PTVnwUmb3JnGacHX2jx67FMn0CN23w4CvvXE3Eo5z1LSWWEfNCaclDjLJRL5acX
	D8mr2wbkoHbuHA0ji7co4v9sSbGhQROp8p+3k9xOqwAVd8MeKqJgxyxkot5sfIg/
	GB5f2T1b/0y5tcTvP6wLWQExoj8Iweq5T3MAWOuNllw2qj3Uaox72lQs9/UysavF
	0W0IgCCA9COfozY+utPydTS0yNAQULexvD8IIgdZQW8ytdrK/AR6IfddnHznTM9C
	35Iz8/v65RkXgxrelmHKrSQ+8zVhu3U3kpA5S8+6GWD5bwOaMXbFfWRkaT86+Iu7
	hCm30Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemsn4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 09:40:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f587dc2eso148927265ad.2
        for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150006; x=1764754806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykS43o/yABQo0bHJe1uANTAp3KJUCM6NxQEV+xrtv7M=;
        b=iwLg+x0lbYWZPMCAyHv2iNkRvRzSBHPZUFZIUJKGnXSjEY9/wXhTVrwnW3W+Fvvyxv
         tEpImtZuKiMsWssl9qXIcialjrb7K2QzIMGSZOH2vnmPARzSFpBeYznr+T7k9JokyMwv
         wNtX0NloEH/XicbiZyEsHykA4cjtdORjazlpzL2C79MM8ovzc9m5IrT3azrvSpqbdxrH
         mG2d6gH4YrvjSFb4Wj36qsJbgMm4RyMK284KtcUNFbUNnMyj5LBZVbtP2C9ngILDCXx0
         kyqKZ5sB6t6JfJeIAdaf//33w7Sfop4rEdynWCXi9IR25y6YpK/gnWU6Jdg5fkh17l4G
         TH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150006; x=1764754806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ykS43o/yABQo0bHJe1uANTAp3KJUCM6NxQEV+xrtv7M=;
        b=H2QIufIHGK8s+sm9H/uy18H6XRxFhDZ/BF2U+c4SFSG1qQaiNfQS5DVcUDm/e3xI+S
         RPPEPYMlqhKcTrnHMSWgkgaf3M6gDB9KVYrhnShzvytMbhqNiRlCrei7/HfTuMJqQnIH
         iSwUsXeU+skkpqa2rU74FJhfn2/BDKLUmcSo3BOaApnOQw88/I1ptjBAv2eifb0jrHQl
         mWee9mYpogatJ9ihDkcyvb7vREC9oUzeP3z4sXUGt/zmy0NXjMwaJ4LgM+xsHtZUQWwh
         802kB3Nov3dD4CwVkNEEGXe/j0W70nCk8xS1yWB1eVzzx1sOOjYajC0Mzkg1J5nxsBcY
         iz1A==
X-Gm-Message-State: AOJu0YwB7MoSNIXlmijXjdkq78rfjAjev1DSTdsqY/ikCni9w2rBTgjw
	YA9e1f0Ov8zVtlEu9BWasCBtkp2eNmK1+b6zF4UxI7cMvuQYrnOhsXu4Wm7tGodbKrrc7mvs1kR
	iKTW90d085WRXMu+L/ppkNqVdSLGvCiArUTuXYOoOM+JeR9BOq8XTA0cQq4Asz+U=
X-Gm-Gg: ASbGncsSul1AG+uztEinMnJyNQ3NYpwsXFPLS8TQF7FdFiJL30bX5+7MeSMAvL+cc+S
	pukbPpV6dGKsu++qghq0XzZIHM352FFTprVRXRQXY6QZp7ZMGUWkWKkuMuRLvfgP0bbsh+RstMc
	aJSe9xbj4cGxM6UJQgh3ilqso2NG8RSyfBTkDTp/TqBHxqzuaGx4KncGRWmdL1y6FYzBxpeSaw2
	+u3DVRFJzVZsGN57csCGKi7ewijjvGbrBCq5mGZYN39RXdPMlvprma0m6ElI8dUSHjb5ri2Ui0b
	PPvjeafChK+meVG08rFcdp6mKTPODl9f8R3VdHXb/3yQRyfSiz/fxvN7+9Df3xS1iMaLJSBD0OH
	S0HsE1Kpck10/+7KwyAKfHQD7mK376wOGljQ7cg9Am7+M1Kq/oihZv51xeZLdkgka
X-Received: by 2002:a05:7022:1708:b0:11a:335d:80d3 with SMTP id a92af1059eb24-11c9d8504d3mr7701679c88.22.1764150005775;
        Wed, 26 Nov 2025 01:40:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsb2pHetCDV4cPwnq1rnH0CoXCmIvAGKHQAIXavQF/tKhITkfZp0ODnWeOFXFyCZDRVImedQ==
X-Received: by 2002:a05:7022:1708:b0:11a:335d:80d3 with SMTP id a92af1059eb24-11c9d8504d3mr7701663c88.22.1764150005195;
        Wed, 26 Nov 2025 01:40:05 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e3e784sm69150307c88.5.2025.11.26.01.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:40:04 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 01:38:34 -0800
Subject: [PATCH 1/7] dt-bindings: i2c: qcom-cci: Document SM8750 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-add-support-for-camss-on-sm8750-v1-1-646fee2eb720@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
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
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: TxMcFFd7XV15qt27ZqVtUjqrbvbiQxPE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OCBTYWx0ZWRfX/TREWnZ2SMZx
 UQv62Sy5IPrJ0EIUYdyahxvMvIxu1TpCWx1DrdUqCOrTJfMLKxnV/7uG8gf9Q57SwXCvJYEqX+d
 E42W+/Krwk4hGG03GfadJffzVOLzPxzbePgxsklYkLYmjuEuiv3m/h6o8RuQbwWEGC23iQL/lMY
 9l1fgQSwqYvNkzMA1su15gYDXwHIkXCVlxMOYGt/xiDsH3iuwHHvNeJcFiLoJmkF5d91er+t/Oo
 rRqEmGGNUkjZcGkHOuNI7dgOQXBqhNQ6GK98YtoV3cZX+noiRystbtGT6wKgxqaLSjpk0i95hHh
 I+6I7hU6fwUf5TowkKt1tmv9OVWH7UP85NVaonf2TzXErybAhSEJ6pltRhC74nvpiPPRBTPJq1t
 KKWBJ8LLel+w40Hgsm8A6xMro3fRQg==
X-Proofpoint-GUID: TxMcFFd7XV15qt27ZqVtUjqrbvbiQxPE
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=6926caf6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=j9zjN4cs5acD8dv8RPMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260078

Add SM8750 compatible consistent with CAMSS CCI interfaces.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 33852a5ffca8..a3fe1eea6aec 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,sm8450-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
+              - qcom,sm8750-cci
               - qcom,x1e80100-cci
           - const: qcom,msm8996-cci # CCI v2
 
@@ -132,6 +133,7 @@ allOf:
             enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,sm8750-cci
     then:
       properties:
         clocks:

-- 
2.34.1


