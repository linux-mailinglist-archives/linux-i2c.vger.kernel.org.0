Return-Path: <linux-i2c+bounces-13916-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 074BBC23175
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 04:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DA7894EC0FA
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 03:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27E12F0C6C;
	Fri, 31 Oct 2025 03:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q6b2y4Pw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVy/qw79"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC1B433A6
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 03:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761879614; cv=none; b=I1/q/Xh1Q0vEwzpIoPGjIjr/LmvseV27Cpv26TeaF9LKBVWPMWN+O3S94JHYtBu2WIbONaEgFdKzGDWTjqkFE8jugIbCD6Tly3lykaDNvvENVoo27HNZ/UENIpsbYVe5iSkheMBDpAsIEdKScB0COAsj/zlGBlTkQYUalP8JnaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761879614; c=relaxed/simple;
	bh=12ifn/h0FdAmM0zlYgL6vpYfcGA0ATj8ireBxFP4Hvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NERGKA16B/V1SUqUDMp4pa+YAFrNto/3SL0x/luz7C6+gPU/bKkRWkyp4s0D5Gss8DuM4YjLeUQiENne9EYY7BjY58jNtYh+T8xgwfuBZd4pILGVAXbdqBVrpT8a7lFxn/2rIj2oGchx5G388TAHvyfCJ4Gi/jYK0/FOmR5Z5pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q6b2y4Pw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVy/qw79; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UJkmhZ3281473
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 03:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aIoImiVEY38ckPGZxJxA/BLNldACaExF3yFcJOYBzxs=; b=Q6b2y4PwSFVGJKLl
	SCWuprWTiDpOO/a69RcuQYLWpknL2G4BMrG22b4uhbpZ36J9YgXhFCJneWD9EreN
	7dW+hfadDfpPqda7XaRMSTrc6sAEc5O8k3eybENwgGqvCOj/XGQop694/ajhlXM9
	yxiN5TaDleOhi47OHO62tJ5hKzBSx8N2CLe9TTW3JNhCllCEdxsJHb5BMqDIdt+L
	z7IZGtg3qImdCTu8DU3UyGL3YyhZ3XBsYFEw2ccRm1ktwZEky+k6AUQLdg5wmNne
	lQAa9ZP5d7r5yeW0LqAz9hM4SIV4HC5qA+HryifpF5NmkKZJqlq53nxwZ6UIsMQv
	d7IfZg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a468kjfpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 03:00:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6d53016548so3463201a12.3
        for <linux-i2c@vger.kernel.org>; Thu, 30 Oct 2025 20:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761879610; x=1762484410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIoImiVEY38ckPGZxJxA/BLNldACaExF3yFcJOYBzxs=;
        b=TVy/qw79ZE6Encu1hdYqO50QGDM91xW49cKHOceYMbawUB8Jmn9HOAeCUCR8GzTw+n
         vvSDkr9NisvJRVGvp7JDiE3+VYoDr55ilu0DTZpc6BS1IKlKbFPSOCiAVisaHZhPZdyZ
         iXwWWxrS3OPXSoxPaeGNM+TDZaFAiW0vba1JDpOhAHJXQ6ik1iQU2tfnEMqeFybCRQit
         BxNqToNZuX6o68Un1qQDgtWGNKhhLGMzjENWSPm66YSMheBGkwv1bzPs+EF+M1HKBUKL
         uesCCiu8yu8YQ0VO6lWvJ2GatbHPgcXzM3GfSkE6xUTJt5NSASjG8biXzTyHSWojvuqF
         y2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761879610; x=1762484410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIoImiVEY38ckPGZxJxA/BLNldACaExF3yFcJOYBzxs=;
        b=nkHlR66yBvxKIbdDQXNrorM1jlL7/FDRlKjKya8IQZl6ZHwwbuqehyLJmN4lEstVfR
         C1T7oIlFwwsHHsnwp7V8HZsjP7aa9JavZmUOkUfHIZE7DnAne7JLrFE5bqRfpuyLPjEO
         DoZirpyiphyWKPLjwpd4feT3eujJmd1UagCCoeQL9h6zRXwpP8jP0DWUTcG5pLGIBgsd
         Dydy1LsJVAiwgeEI089wUt2CFk6fk2kFkLLtMovSc5j6JuwA9N4qAj8jwiBB5ABWfAoo
         nKskgUexYwKtXbIxZNTZ6KBAstlz6IL43debJ5Fx5DI+0vxAC5rmR8h+iPvmDR0+2eZT
         ihtg==
X-Gm-Message-State: AOJu0Yy7KJKQ7+5V4xcM75q7PQZ5O+t9+CIOaS80w1qwVYsjKq29PcAy
	ooxUGfBe9bAIH345WxadA7t2Hr5jofDsbNoBYB10RbhfzXQ/eMKcgNqFualp0sKEOiIHRl6YQMP
	qrL4SedvSKUZ6qJDJwZh06BH3R91ZvfM10FMgfYMhR3Xd+S4g/vPfNvl1+r4c84P70uEduJ4uDc
	Va
X-Gm-Gg: ASbGnctMjucaFPIf2WEiyzsGOWp3bS1bwMgw/FwvQGbWG4sjfE8oMAf9sg/218wV4pD
	1Kb9sBKJ6I1mVolGOCXWj4fBWR57ikdw/N7ZVg/a6gxrj0gtPVpoEDEmPWxH6wzlPBE9HLMv6pF
	8/vWOMQKqQ/CVMFVrkhOeSu+rXFN/bbBGXF52zgNKGB3XWRSSR0DMYHgWRjFNfj7zI/+UEPJXVx
	FTkx7gybOAk+HHADvL6SS/Q1ubpdAlPJujAoVIZpYc+4hXHD5vYLHxdxC1AN/AV/pltaENC/zJ2
	jBG71fjdEHF/6wA3TunX/0pmtvdNtHazIeGLx95AHGlhtVeIWA8YD24HbwdGfcLUHWc3M/miD8l
	N2XjEmxp1d48H7CvSz4MEErlHkFyPWRnrYpFZWWKUnuoM/I5gw/mrOg==
X-Received: by 2002:a05:6a20:2449:b0:331:e662:c97e with SMTP id adf61e73a8af0-348cc8e5d4bmr2851774637.37.1761879610065;
        Thu, 30 Oct 2025 20:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKb2m9Wf2AZlvxL1iP5wTLbiSr7QNBNEp0qYaiCO8kZl4RTjx9EDnWQGDRlbTih2Bp2qox6A==
X-Received: by 2002:a05:6a20:2449:b0:331:e662:c97e with SMTP id adf61e73a8af0-348cc8e5d4bmr2851716637.37.1761879609421;
        Thu, 30 Oct 2025 20:00:09 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db67cbdfsm352570b3a.49.2025.10.30.20.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 20:00:09 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 19:59:48 -0700
Subject: [PATCH v5 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-add-support-for-camss-on-kaanapali-v5-1-f8e12bea3d02@oss.qualcomm.com>
References: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
In-Reply-To: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
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
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAyNSBTYWx0ZWRfX1UCG+LF6aymf
 6UU4q8pZ4OHTsyl4rSyxAtGlK8vnWBoRLuY1Bvf0EECd1vvYrw2Uwi/IgCr5xyR384rTDg952Vn
 D2gWqljMES3oI+uI2OhO9msP/57tKqgjkcZAdcshkPYTxyO2P8Hx3mv9Wu93TyWF+fxBwushS0x
 HICxaeUMxoUCOkEiFh3p2DBhJ+OIXHsmW4J10mdbthl3dnlOgpHsy9+KR/hlyUEzAtbHrk+hf9X
 8H3hJUW+p2/ZwKxF5fhG+ugLqVnKJ8xV3RWMbjsfoSVH1avObwLWjXNxrqk0DN5lWm/7Sp+hiY/
 VGGLScJvPhUEU6F9dmkuXkidveGu/ITDypDAYFDF7dRALR01pmJ5NFnvqhHQthAkcTvJ/OpfaX8
 6lTXyqGIKQ9K2j1V9rhvmkGwWz9Wcw==
X-Proofpoint-ORIG-GUID: tiLyOC6qwufie16KWffJAZK_sXId9hIg
X-Authority-Analysis: v=2.4 cv=LoWfC3dc c=1 sm=1 tr=0 ts=6904263b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tiLyOC6qwufie16KWffJAZK_sXId9hIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310025

Add Kaanapali compatible consistent with CAMSS CCI interfaces.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..9b83ec63e124 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
@@ -128,6 +129,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-cci
               - qcom,qcm2290-cci
     then:
       properties:

-- 
2.34.1


