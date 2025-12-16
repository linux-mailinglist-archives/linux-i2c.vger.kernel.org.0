Return-Path: <linux-i2c+bounces-14569-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD2CC28C1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F70C3023D77
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 12:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831993659EF;
	Tue, 16 Dec 2025 12:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="doFcqeEf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q3BE4x9H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014013659EC
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765887008; cv=none; b=YoJcwckDrPLyeP61bEXtq4J0G6Ck2Jlo+7Dgoz2Fsut81uRFXr4yIy3qMPbwQywtu7CNHf7kmltNEEpKvQKPVBeVTizKeafqcp8ugSJ9lyO066A6xafWNVwPEd0fAF0RrXnx3KRo5Xg6UHk9r1m3SbGpAPJyoFy42JmBm1IXufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765887008; c=relaxed/simple;
	bh=2Ng8otDPDABpJwJ9f2yBpnv+lm9Xsl5zOl56SaOeJZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BeYFez/TpqMhBa9ReQpKQHURiJmVl75nbuAujThAQAA12x6jx6BMDugIWj1PjVcEUCplKgzVfW82aiKlwBScj9hbvCUkTXN0QxbWfWxPSWuky5OTCte02VKk44ozw/fZcS14CKjT4b2ov5wFAe+NfXuiVDYpbKpr7eGMK0r6oV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=doFcqeEf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q3BE4x9H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGC7CP53708473
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 12:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ya/r8Ga9fgqMh4F3HKAbEmR3SCxnariYvDHAqOIGXyA=; b=doFcqeEf+MNONnhP
	MR9kNQgOwMo2baAkxyeXNu91flf0RAbd8tENzt2Shmd3PVndwwlfykA0cdGh3o9y
	VurZA4Ym9JZsP8f7z1ecYBNDZ6550A9ff0LNZUjwfjyWGcroQf2dJ7VByzifBdiL
	UH4Uky22Q4UwZUkejP4tmnKvPcNJlxpj9hA6dWuO6/FgdIodHVrTF+GCrMFyI2cQ
	zqnAQeW/QSB4Ljbns8mJgh2c6TZ0Y7OBKqX/WZbFMXuhuUjOAX+/R8ItgJ37hK2T
	Cr6k4zY/kB3qYavGvxqg4WsVdcdsyCW5eVfLP/QWWp/SIgGfoppfg1R3my8bITxg
	xBmLGQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b375b00pu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 12:10:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed83a05863so14380961cf.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 Dec 2025 04:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765887005; x=1766491805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ya/r8Ga9fgqMh4F3HKAbEmR3SCxnariYvDHAqOIGXyA=;
        b=Q3BE4x9HecAd/ynYMZuagvma1fKLIrebHr7kKyBpYYNkdugnG0iD5F9IMod0AGJvGB
         yFL+tmWMQvfcvuyQUHgs66+u2fwrsP22B3uNOMIzM8xphuhwp9jw4ooOxXVzimNygaDr
         1pex0MK26EMHotULmmqnp5RwIw6f3Nk/qIinC6AGewivEaCx59HsiPZJ8a9FQblr5+uT
         70txL4qRQW72sNVZMJ43T7nb7/+K61RGCZSKuICwaCoR9xrdlacLhGs72SvqOzq2/BQJ
         LpmFoXpBkP1RxvfepEknVdfoZjCn6LpfvpCAhPwKTjnzI6DUzfUB/KKob4geaJci8LXP
         huAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765887005; x=1766491805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ya/r8Ga9fgqMh4F3HKAbEmR3SCxnariYvDHAqOIGXyA=;
        b=nVmnkXmDqHSEMqnaZ7CA9iumBwvBgmtr6xyciZhI2FikZxkwxsHdxOgSgca9X/u3z3
         QSGFIV9KP0m1S6DdemFfXo8Q+CIA1Wg8GJDrirkM5omJSy7EX4EiP80jI85h3xQx/Oh8
         gJYhUcTREIbtG7g5t0QHbxe91EwqRRLWkxXzNGux9+VJ4NsnV7xSHUs7xw/a2sX17Ma5
         wHMVboCFWhMCBle8ZRvWyoESkc5JBvq+bN53+c1Y5gksTPiJTsAqsule9wo/DoWcvT4S
         Os9O8VKTpsbrtRRNb4QZcCWeBvR4VeGNxxxteD8ukvcffcycukiMHRi73amS4TJx71oP
         DCyw==
X-Forwarded-Encrypted: i=1; AJvYcCXkuytNQ9E8a6Y7K+IlneapyQ1nZgnCx3X80KogR4o6Yxmons/QgpnxqwpI5siSR5aEXfP9Lndq2L0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZyMEi8Gov8aLlsXcTB7gxKe6cG5BBv8V95y4ug9UHk/Ss+hfq
	elvmmlgabdln6+UTruxA8GWCf3eQf/Gh/X9AATVpTLm9fEUhzvHfYxKMssLzkuPzMusxlNOKikY
	BtjzOc/+lSt7UoSthTkkb+nhi0Z9H0JUmMza094S8RQZiyZ18JosAmpKsC9KSPgKJB2CMk7s=
X-Gm-Gg: AY/fxX6Ni7ibgIclMxXBhOzAf7g6MnDzZh/vxIcWzOM50p5mIQ/+WHMOyM5aJfJWkzh
	XtxBX2EhvPmOC6uW4rxMqJz74LO2tXdhxgtVY5mksNKZn1J+7DJ4bI0wLcFs6zj+5if/d/GRmkT
	Dn88shZWeSyT45i6f/86QL2ryz6Ezvwuu42C9QUSnAyq7WIgI8O2rk3fNyEUY0hsy8XKt+Mpcq3
	JQEt5EzBtMSo9+7dOg+cpZfEK3di+8nmMDtxzsYDtJ8dirI25rF7jmuM8x78bfCd773ctAoytfE
	9KaSElhRBcwwlAEuWKpOuXwow1F6wBFCAwg40Mg/zOiZr/br+qtV/LukzcNxoPBFHknhLbH0orZ
	EwX0RFbj8t2TogIId9GNVp3SoaHzb6xoljvmhae6POQ7iBFe5MVLJRiqEtra+hcV3kA==
X-Received: by 2002:a05:622a:5cf:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f1d0520a7amr168791841cf.5.1765887004953;
        Tue, 16 Dec 2025 04:10:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI49moqnLw/Xuz0GAX9vTq1WwwC3hKc0bhx0+EqN56QKBJaEA+WgN++Iui7m2A10BQEI5kFQ==
X-Received: by 2002:a05:622a:5cf:b0:4ee:1e33:bc45 with SMTP id d75a77b69052e-4f1d0520a7amr168791541cf.5.1765887004566;
        Tue, 16 Dec 2025 04:10:04 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa3456casm1637491466b.30.2025.12.16.04.10.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 04:10:04 -0800 (PST)
Message-ID: <5cb03638-1db8-4681-9504-80654f32cd83@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 13:10:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add camera
 EEPROMs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251210-fp4-cam-prep-v1-0-0eacbff271ec@fairphone.com>
 <20251210-fp4-cam-prep-v1-2-0eacbff271ec@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251210-fp4-cam-prep-v1-2-0eacbff271ec@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEwMyBTYWx0ZWRfX1xDRy5woPJyC
 0Pqj/M/64K52kddcOUcsK/DgTR2LtpCdI4W39GNj2Yuim//uNqofQstI3KCwTck+ECVuo1q4OgK
 A/uYdvFPYIZS8vED2Fba3kjQ74uQROutp0f1SHERI3iLE82s7zn2Zq93iMOdARqAIHI2uauuVK4
 KElf3H88uMazdWW8J40y4Nefv8vlktB125842sfTeLfV7gtDwuQHfbjvdfnjD/cXF7Vzt9nULQz
 zW7+39/7i0D8KQjy1lE5eWW7jOVNarj6ptEcwfEwcPY1v5H34gpdWgUwEzBJtAN9YHgc2rOBu2h
 9u3aI9+Mko/DkaoYrI+alBtS7nldMcnoAUQ/zGEuFr9/A+WrnBkFDTazNAQFAPgKS3JkdpVhmgU
 J3nnjnNg1u2cdxGRJ3ATWGuwme7hSQ==
X-Proofpoint-GUID: z5jxe33uArMz_jBdFV2dfzemwjDAQlWz
X-Proofpoint-ORIG-GUID: z5jxe33uArMz_jBdFV2dfzemwjDAQlWz
X-Authority-Analysis: v=2.4 cv=T9qBjvKQ c=1 sm=1 tr=0 ts=69414c1e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=gec2KKgFD0QOCAiZvjgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160103

On 12/10/25 2:05 AM, Luca Weiss wrote:
> Add notes for the EEPROMs found on the main rear camera, ultra-wide rear
> camera and front camera. Also add some comments that act as placeholders
> for other nodes that will be added in the future, for the camera sensors
> and some VCM drivers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

