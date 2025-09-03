Return-Path: <linux-i2c+bounces-12587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6498DB4262C
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 18:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4A97C1230
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 16:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3592E2BE64F;
	Wed,  3 Sep 2025 16:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paMOUG4f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707AB2BD587
	for <linux-i2c@vger.kernel.org>; Wed,  3 Sep 2025 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756915329; cv=none; b=KjH3cskbFiMRsYVxSoshs2/IfaCEElO30KdlfYQdXPv5xS8bZLbbQsZ9m+814toQiUBn9PznXsCsapDipkyMiBTmdLt1kR6R6l/ECCMGQMZzDk2f1g+dV4dKQS2cQAuRQNraACBz8UoanPlmnUPEjTyaNgbEXEYBBxYX7ThhgD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756915329; c=relaxed/simple;
	bh=duCAr7CO/N1Ze4ijxMI+nhb3sedWh7XRQtNULBNw7Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+EHAwok0Tq8fuFNWZAIgx5WBpRydPDlRjEQGmky344QYVkHh3vt6FJ7k/VMaahfFXp5DVDelvJQZbZZkD2OEyU33NjHkAj8EuvwdnglqxBYbh19CVoWOhpZFZXYI5rtjgmj6GMZApf6bJNFUvFGGWtxiHr9X40xUSheif4O0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paMOUG4f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DxKOf029641
	for <linux-i2c@vger.kernel.org>; Wed, 3 Sep 2025 16:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ufkKfMtF2sFaOT1A75ow461HdClQcHWGVHzSfn9/S2w=; b=paMOUG4f4olZvDlC
	gma5g/I5WSNuYq6qS1l+Xt6+llYCURDMNeeKgTlridcomHF2zBXLevGozYUQ6HdP
	8Zyl2KaS1A2nShuiQGZcOjMzi3Y7JEU3y3yjqAvl8vMvAxLxVU25QWGajl2viDag
	nUh+NH31cs1QvoiV0hQAo2DMIp5LcEtZ9OqCSzpLk6kYCfrSd8T5yrPD8oAaMroa
	uf5OTH2qi8QLRjthJJPE7W/XASU8xBxDzAqzWNoo2r5jPxzs0JD+1VNt1tzJJhi2
	VshNLVDDR3CD3+AaHAX96YNNYnpYh2SFdiEyKokd4j2HVom68+vlgNj9L1nYqdrT
	o3cf6A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw04bp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 03 Sep 2025 16:02:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-52b7541b2d3so8367137.0
        for <linux-i2c@vger.kernel.org>; Wed, 03 Sep 2025 09:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915325; x=1757520125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ufkKfMtF2sFaOT1A75ow461HdClQcHWGVHzSfn9/S2w=;
        b=lYCZ/+BE4Bz5XjXO+Gz3RU4aFUuHuTRw3k5gXMC4mnY3LtH6uw6wXWPKzYKdd9KOIs
         HTOxvFrm9DcOSI53bNE/O/jhkhv6+m2hC9SxYtKLwjcPKt8tqxR98ZDUUPmeO1tWk+ro
         s+4gPpjpFB9MQgv3gY5Kxq5LzffL1doUzyxMYPdJCbfzwwl4f8kE7V+UN5k2CX3RnzZE
         QfpvRIdY02cafg7wJ3vkPMUI1tA9rVtH/LlFQkExmM/NO0I3WMXUwCICcVlTjn7l4CeW
         KPjNrNtePFAppfbU+dSfY+NS4RVp3a5UPVg34ErmCN6kDYpLtxc+ZCuSiydC4BYYqT8f
         RMtw==
X-Forwarded-Encrypted: i=1; AJvYcCUnIVF+dx8FkrvgD0ZSDPOFmC9P8mQSQFTaqgkMVci9qDcLiLlMmgUV9jTjg7DJhvBHtWSr6EZWPng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYFskZfZ8m4r1ogjV/rJ6W9ntOiRPixyqLMnocXxi7yJ8ewC8l
	z3xDcpGNLlZUOsjcZxGSHOT14xcr267JBvREriQbMJvNoG8ojn7Z93fI7kL5Pl4u90tNvF8I3Fw
	nssOKjf1tRw0UtPjJDgmlUeD1umxhPLozaqU50o8uyFg8MpaGGY1324Qr0r/ShpE=
X-Gm-Gg: ASbGnct7PkmRxnhTIdu0GQBMuxs+eZrt3oVjUzY/m1b4y4yyTLdo6h3xPO0uvBwTTIw
	VdIg0iGRIH7p2Dtu4f7mxA0w37V4GPhaTZ+HMFbU9U7LnkoDfWPUZFabBZVpJlLmpcQJsEI+BQP
	MTn8e4xkUCxQq/JNwnDfEB060nXVWMW5Fd+WzqiAi0huoOUqFA5wp6BFIRMWY3uuMxL4wcS4nJE
	VcWV+LPJj6D6VzFOn4FhaTMGPKCPfuI/dM1bsS2dzHP6Iw5GR+pguyezPe50y7xIpmE3/9LtWm1
	TEQ1xnnoc9JAr4vtwwW5RODHz9w35YeAd+t46h+Um9OSfFBL21zJDOa1K4TOrEBdE85OMR6aifS
	/5cciH0VnU3FRVT3eS4uxEQ==
X-Received: by 2002:a05:6122:2015:b0:544:91a8:a8c9 with SMTP id 71dfb90a1353d-5449592885fmr2297753e0c.3.1756915323594;
        Wed, 03 Sep 2025 09:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNOwCrprQOUcxuZaV/B20qgOB8K6FfIsDK3UCpWlIJhUbywwkcF3iym3uiTsjk25+FxGpDqA==
X-Received: by 2002:a05:6122:2015:b0:544:91a8:a8c9 with SMTP id 71dfb90a1353d-5449592885fmr2297638e0c.3.1756915322699;
        Wed, 03 Sep 2025 09:02:02 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7dfesm12285170a12.7.2025.09.03.09.02.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 09:02:01 -0700 (PDT)
Message-ID: <ca2b6089-54f8-459e-8cc0-accf802026e2@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 18:01:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq5424: add i2c nodes
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_msavaliy@quicinc.com,
        quic_vdadhani@quicinc.com, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        kathiravan.thirumoorthy@oss.qualcomm.com
References: <20250903080948.3898671-1-quic_mmanikan@quicinc.com>
 <20250903080948.3898671-3-quic_mmanikan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903080948.3898671-3-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R3U5pvT_bmCBKCyaby8jQs8wMhmu0DxG
X-Proofpoint-ORIG-GUID: R3U5pvT_bmCBKCyaby8jQs8wMhmu0DxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX+IwxqLEj9yy6
 6ZQGX4DgEYzjuaXDGDIrTr2xpiSsXoBCMZ+CKLCmuIt7WQmgyEkWda5hA3rDVOzPNBYY2CcyYII
 +1miDTxLZ2rNb9e6ZQVcjnSviEoVrEcAwkpqIiyYku4QxTXeQx/Yn7GYOf9NkjFfATTn7QDG41I
 B8Z3a14os5zlhgomQEubGiVup3grBJdFaGo6vhy9FhaSRLkpWW+rM36jg+WdC0dqTb7A1Z0BDKB
 1l8cPddP0y5zfk0n2s5HQJysnTmmEvmTYfLmhk/gaiCcb/aFLypyRWAdI1MJ+585Axq7TR+z22d
 KmH/22l7yjj6O1a4ql35zo72CFgVdb+3KhSrnuzpzgBJVOL1xIM+sILyuXf66KsN6hzl/rqHa/r
 LPTP8Dgz
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b8667e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=v5yAd65IgAm86a0TdQQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

On 9/3/25 10:09 AM, Manikanta Mylavarapu wrote:
> Serial engines 2 and 3 on the IPQ5424 support I2C. The I2C instance
> operates on serial engine 2, designated as i2c0, and on serial engine 3,
> designated as i2c1. Add both the i2c0 and i2c1 nodes.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

