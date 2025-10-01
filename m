Return-Path: <linux-i2c+bounces-13284-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06953BAFE09
	for <lists+linux-i2c@lfdr.de>; Wed, 01 Oct 2025 11:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 319A83B3BAB
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 09:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F8D2D97A9;
	Wed,  1 Oct 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1IDEJh4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD322D9EDF
	for <linux-i2c@vger.kernel.org>; Wed,  1 Oct 2025 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759311320; cv=none; b=EXjwJFOf1BssciI4cOAL3XznWiMZGCd+zk3pxRJ4grsg+6JCLG9FKH3pOADyKiOPC6/FI0Bo/ouIoEl9fMoZEjr+TUnjw9G5/vCnf/feIXigO14HH9vzTMSr59wGy1Pdeg0K6NVSGmgwjJN2mxGkJt8OkrHuH/W1O7NsvO0YVRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759311320; c=relaxed/simple;
	bh=clodCt2KFV7idC6nf+b0UvwIapnLPbxEnItnIWj7QEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXfeqhkB91qxX/rRKExEt+bUmKkGoeQT0H/sO84o+lQj83REVLuPbFYqYNe1sV7eyAREW67uGpG8SRlnv+97qJoNnaUM+YJhN3ioPkzP7jmyd4jC68Aa5zv0FXHNXFStnzcBQtB9tTZCvzfqroOVVF4AUsoxdPrv5yRwX5IICyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1IDEJh4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919MBMu027376
	for <linux-i2c@vger.kernel.org>; Wed, 1 Oct 2025 09:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DDF9dailVTb9C+8g1Gxz0cI5TBD6wn76XGlSDfVLb5s=; b=R1IDEJh4EBryW4Sb
	vT9pxjcQ6folIvZgqA+UqusGWBLRXww5TIVxaPn7sLYRgwjLmUkrq8+zsvRI6zKA
	15jaPB+YRd2wsCuJwJs1UNNYjyctsUFM60nIxHtQ1uYrOeboFRQwO7cTqcslIDv0
	AYFqiFUJijfnhIwtIR1Gf0FdEjp6qg1EO/5BWc4F4EN5+Y6VkJnD/PbO6zBp/c8B
	0vi26cHbZqTwqJYj1R8XJ3cPWpShfJa/P+nK1zMHHmpFP+yrxcNooVzKaImHHSlf
	EL2RC3URhNiDYTX4OgtZuc80r2Vvm//aIcBbUXQPRXcBURxGietSfJUTLM+d1B2c
	SbYJvQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851m15w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 01 Oct 2025 09:35:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27eeb9730d9so58720755ad.0
        for <linux-i2c@vger.kernel.org>; Wed, 01 Oct 2025 02:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759311316; x=1759916116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDF9dailVTb9C+8g1Gxz0cI5TBD6wn76XGlSDfVLb5s=;
        b=gYhFCzgEZ0nJeguFo6lkppUsbdbDiXb2a2dNfHmGVpjxzIHuUazzCqzZb1OlsIqYjn
         kAdTdXo4L4aFegN5arZly5iRgCq7KFHhISnbQQFHPllAXhKizOQ0kiT5o3weNKuFOpLi
         +yJjJcW13CZgsRtxpvn6vIAaOs+Kr6lyuo/2fOLwde9NVB+isZtPewkCLqfK0bmXeBnN
         1J3fLAcEqUAo5qTxK2tqaG8QHlLnn7sPHxJ/HEVStHfJwPg/abQLkk+0UhW61RdHK7TJ
         n8tPFuo93wFJuWWmdy6DI8SdlInruMkILfc5q+eu9muBskh8kXqdQlp+osQddZUwlFNb
         vaoA==
X-Forwarded-Encrypted: i=1; AJvYcCX2roonD8t/TjObbbh43+GWf3ESp2wiQNXhdOrO/wehJ6J6IkQicD6xMXEuEm1bnnSm90r898Qi2uc=@vger.kernel.org
X-Gm-Message-State: AOJu0YycJY6JUbhcBjUboB7sQ+zIEqUra2+JRKWGLnFPzS1e8uIzdWVZ
	/1CbvN7koP36ht+G9LJP4XRcsejzYlbR9GCaGNtb+ArtYWtJzK+qX3pvUDIiCIc0/5UnTQzaaYR
	IKnEz2AgoW1gX8s/354O2rJkYZyMuk1zqnXKoBXU3y9Ycc3hd8lj78ZKBwWSFZjc=
X-Gm-Gg: ASbGnctWizzjqwUcICMRpUQR87lT1vgO2fw4uLVY+MVNkfcG3Tpwy1wDxQOW+msWzTB
	tKd+30C7uw+pELcmf6AVsYkIdBdkQuCFqoCyVL9RUZFAJ97tPn5ZWl917AvfTZnnRiKkpHN3jMP
	9NlN711N3YrCwkeA0Nn5xaRqkMbK/xBLNjtSmZscjLQj7FO/o4jmnLWiG/5RaJLFsouNp6UeXse
	+iAzp4LrzHwk+cZRvWUC4yzvH2CX9q4oAfTYYf01aTDMJ1I1gdfWa95tJsMcsPqjZ4g7/idR7dg
	1cU4gOccIqnH3h/DccoaRBM09HV+79rmUYyxnW4NziLsX8ihkzm/ALrCs4Y0+bZpiV6hQPSkAcH
	ou0vI
X-Received: by 2002:a17:903:2384:b0:26c:3e5d:43b6 with SMTP id d9443c01a7336-28e7f2f4ef0mr36261305ad.32.1759311315784;
        Wed, 01 Oct 2025 02:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYUv/Dm0XesDSTyHwQm2dVe57hhTs7K33D3ebSSuW0U2zhQHMjz1FXWOI+Y+NBaNAKCKO4DQ==
X-Received: by 2002:a17:903:2384:b0:26c:3e5d:43b6 with SMTP id d9443c01a7336-28e7f2f4ef0mr36260875ad.32.1759311315356;
        Wed, 01 Oct 2025 02:35:15 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671d8c6sm181633145ad.56.2025.10.01.02.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 02:35:15 -0700 (PDT)
Message-ID: <32fd77a1-f352-4f82-be18-c978fabac280@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 15:05:09 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
 <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20250925120035.2844283-3-jyothi.seerapu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68dcf5d4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fvgdV2PV7z-sFcuOFeoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX0dyMcbLZDQrG
 pC6ihkY+nkNbijbT26/gwvFFEwA+79afC15CZSr6xxLEBrfkuuwvueRBLjBlrhW/8Uk7oriXqAh
 VknRTYqXe52VFeCMM/e+GzN2bzXxK8o3oe+SImNFtMNppi9eb0wvbyIZU+JApssBynQQqK206jL
 5XRKpIJvoV8PWaLADXfUpgOUvmZmMi4//UoBaLCD9kjI3owwyZYHsFMX2Mfl8l4iku+26IKPIfq
 8XaEkjdGf6MnnJeg2jfGTBn3yGmlExQSRg5Io5C88IEaMKF/7gHaF0AcTxaZrA3BGcjZJTaB9XR
 MudI5L9oxwCE1qwPtYf9DS4W5J+p1o8hLDh6MPCAsgDOUbKw4P/8gptfsOaxfnJIsgkXIwGLDAi
 8j7U3N/o+aqF2MfganCM9dd7RN1Mtw==
X-Proofpoint-ORIG-GUID: V4DWIH53UrSj1fm7yE9tSG2nfWPn-0XL
X-Proofpoint-GUID: V4DWIH53UrSj1fm7yE9tSG2nfWPn-0XL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032



On 9/25/2025 5:30 PM, Jyothi Kumar Seerapu wrote:
> From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> 
> The I2C driver gets an interrupt upon transfer completion.
> When handling multiple messages in a single transfer, this
> results in N interrupts for N messages, leading to significant
> software interrupt latency.
> 
> To mitigate this latency, utilize Block Event Interrupt (BEI)
> mechanism. Enabling BEI instructs the hardware to prevent interrupt
> generation and BEI is disabled when an interrupt is necessary.
> 
> Large I2C transfer can be divided into chunks of messages internally.
> Interrupts are not expected for the messages for which BEI bit set,
> only the last message triggers an interrupt, indicating the completion of
> N messages. This BEI mechanism enhances overall transfer efficiency.
> 
> BEI optimizations are currently implemented for I2C write transfers only,
> as there is no use case for multiple I2C read messages in a single transfer
> at this time.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>


