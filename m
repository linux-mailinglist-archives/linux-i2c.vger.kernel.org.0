Return-Path: <linux-i2c+bounces-14291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C2C8B6CC
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 19:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F40D3AF8F7
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 18:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBC03126D0;
	Wed, 26 Nov 2025 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK1YVoN3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEjk2lV5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FA930ACF0
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181389; cv=none; b=aeqVA7nCY93evhL43pt4QF8ttXbon1vcQfmwvc1ASSDvZq1lXeKQWSGb4ma4VpJnvZbilctEdL4TApZz0st8DxgbgQ0/wkT2iIBIDuU/m5J9eq/jFIEIJdxKGqicRUNE0V3uBPhjEvSzCxWRXuNgVZZDPpohDyi8B910RGtRohI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181389; c=relaxed/simple;
	bh=NFFsdkSV+yVrTmxojDPz5w6sZ+BskvrlquvOCjQNWZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROuuQFH1lXLfVmsMWbIY+XPV1s036MvCJl8O1ILHgNe1YDaqyMaMldzygAEZDmHiurWYqJeAOkI2tQE8+/D93NpR5EqlNU2kS1urmqdINRHjXq0X/FfHY3BIRtsTUa015DzOlSDtE5ojPrkMQLgB9F1PA92r9LUWOLp0DDWTE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK1YVoN3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEjk2lV5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFWd6E1458391
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 18:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+9vRJxvQ1t
	q3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=; b=eK1YVoN37dVGXypQuoUFAnIJ8cn
	4ZN8jLi86Uf2O0eUEf64Ov0M+R78DEMFeVId2uhvSgKeBNZiE8LsVWuXVJIlX2+K
	d2a83n2oH19tsctUUwlWiV06dR/9Gp/oSMrYdpECEmRL0xQ2oDnIBvr82he8WfZO
	8Moo1U2fa/ANk0aQGZ6olHmgAsAnUafGRCQ/ViqiF/NOY1ZHIXcF2tlWFhFNiqeN
	Jq7R7xKmLVibbOkKwuUhSA4D8ogt7Egx6dn6290knSdOlPHWbExZ7Tu0orajxDSo
	NttKaNkSjKX5duXTplKyOCJ9jZ9XLHuZMxSGvi+avbs8YMfWQM8Iyba7pEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvhxk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 18:23:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2217a9c60so4391885a.3
        for <linux-i2c@vger.kernel.org>; Wed, 26 Nov 2025 10:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181386; x=1764786186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+9vRJxvQ1tq3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=;
        b=BEjk2lV5P+iREPE4PnWhHosl1vaIub3/9LJp7O0UOO8cdGZK0pv/qM9lmhiqsyauoa
         VS6orsxvnJqLm37oCLcHboT07i6zcgkSZip0i57ZxL09n2JZFjEOK8I4OA8YnsTPCm42
         SWH+4dSzAx6+X2txurP2JFeVJal8suEGSVX/FYkin9xP8xENv/hVA5liOJ/dEisM9jK3
         Nz3rw5fPWbt77AV/15F2g+zBVPX9J2BlhgQQcImgzXGcchylcVsjFkB/xa4HxETfjMdQ
         XWlWbQI7hAOUcHzOEQm19IhCEk3JKiijsPauY8CWNMntuMVqasRj1dNjTY6QshqEn9QZ
         HE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181386; x=1764786186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+9vRJxvQ1tq3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=;
        b=di2b7oO+nOHrmKlfoh6pXTrajzJKguRlM+B2suSHIIJ5w4GaUilJzl0pXsYQpo/eXI
         rvFLxZMfamZVueFoTMkuimjz+RvGzzB8cluOeteL4pB+Isgc3E+aB63Ah9youYDQFBW3
         3z2lhA33XtlhyCRVDIDyyE3W7DQgcMsGDtLfD5sCTQzp4LDpDZluJ0fH/4LyUjxaU8bR
         Oc1blZ4ysrV5ClN8HKum7htKpBQcGw9n5j7ATtbZb/mTKaU/AAIH4aKFSRYP3AtX7nkh
         4c2GQr7NAD2a6xpCz4HxvCHlaBVDuNALfStD6S/n1UNwT7a20tSgS0txAErrwl/+LvxB
         rYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCURsUDVqBur5SCkmnWMAXkQ9vfW8qncOTMFJFhQ6yVuRG9Yt3/isxT4GJgm0V5lmEAYF9WvDkdzoXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR/VCf0dfZh//O+ZJscE1vRFvu855HDEu6VGmoJCLbxBuDAZYG
	af5C1HQgfUdksLlZJJYSMOGs9S19pjPk0W8Ea3BiQC0psPI4/j9ihHY7Uyke6I/BrbTBNMn4aFU
	9jwJJR5Ii2HnQIBalbtSxGqulm4ZocKylzoepDlXg/KlSfFIcdTE23dZtIIIsfYGECNYMxqM=
X-Gm-Gg: ASbGncvKtUWI+L79zBlxuvbkexudxVLZSJ0wc0w3PxkPuW1uAQjOSpcWjauDYIKcMBQ
	M7pgeVnub/xobURIZVz8IojZ7gwE+aaRaaOEailiXEjvYhihs9dhIDMwk3kWyTt1KS7QqbaqHu0
	rWSU+i1f7KudHfYRo+08UINUpCQqw6Y/jaWVxBq9OZm9uoGkdlxyPJu5wRJQnnNeVc2s0wzD+GZ
	TEWj4bdPox/qT4c9/58ScJ26i7F+APDB6mTqnq42nf2AqNNe7CFTvxlLQ751sHDyH2/oBH2gKhn
	4EIdqX3HLb4OagOhnF0C5RIm9rWXwbdu7eu/viJm2c7Z3cDm1mMNVVoGIjFrJmg90ZzokGhH71D
	l7a4WVCBfO1tItmA53jm1WZAjbPaC
X-Received: by 2002:a05:620a:4102:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8b33d1fd666mr2654387785a.29.1764181385921;
        Wed, 26 Nov 2025 10:23:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAA+ANOolUOJpeYZQNlTAvuu6BHx4jvUZDLcOS+/JSPaaolDrtSLNNu1EpO7HNNR3BrnQAOw==
X-Received: by 2002:a05:620a:4102:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8b33d1fd666mr2654384885a.29.1764181385500;
        Wed, 26 Nov 2025 10:23:05 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] i2c: pxa: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:22:59 +0100
Message-ID: <20251126182257.157439-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX2AlqGNdHLkOK
 3jdhrzZo85r82gBjRrEgt7bCavN0yXFksooHaYxqJY2U17SKX1zlHk0p3Us/AUkTz/rnlOJlucm
 uO4yLkPavMB1HMaESakZvPoxezJI44o90QnXqxziv+BoVPRIjqlOEotFcsTFkmF33w1a274D8xT
 uyRdQ7yzHFy5yBp9oCCPQUVOIOBf0s+PxgOvFeyVnlOm8OiKLJZb4jdVLXWzC9rIipJgEPbZcdW
 y+o6IfGnrNPsC2tMyGvP0gGdtiLd9DNbDbMIYLdK2Mb7/s1If+91XCEH60OI+Pkw1UEc6MLvw3P
 fSKlSSn8ZARe4V7U2tnBYo33W6zoBfEy5N2bMzBHUSwhenJhTwvA33RIiLwOyW/DBLpMXlH6s0/
 sPbYxMnAyhuB9P1RHVnYJ9YkpXc29w==
X-Proofpoint-GUID: WPWH2LaNp0RbQYnohIfwfnb0mI4Ukkrh
X-Proofpoint-ORIG-GUID: WPWH2LaNp0RbQYnohIfwfnb0mI4Ukkrh
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6927458a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260150

'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-pxa.c:1269:15: error: cast to smaller integer type 'enum pxa_i2c_types' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 968a8b8794da..09af3b3625f1 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1266,7 +1266,7 @@ static int i2c_pxa_probe_dt(struct platform_device *pdev, struct pxa_i2c *i2c,
 	i2c->use_pio = of_property_read_bool(np, "mrvl,i2c-polling");
 	i2c->fast_mode = of_property_read_bool(np, "mrvl,i2c-fast-mode");
 
-	*i2c_types = (enum pxa_i2c_types)device_get_match_data(&pdev->dev);
+	*i2c_types = (kernel_ulong_t)device_get_match_data(&pdev->dev);
 
 	return 0;
 }
-- 
2.48.1


