Return-Path: <linux-i2c+bounces-13655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AEABEF823
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 08:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40EB34ECE1E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 06:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E582D8DCA;
	Mon, 20 Oct 2025 06:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWI7b02W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A0D246BB8
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760942716; cv=none; b=ZdtQrsXHopE3JSHQoacj+xxaH46dUyMDAg+ABmOiD+k/VVL41/23nb9hX6vlyV1pCvmwb58JquGIinkVOX4wstR+y0fFxag4yqpyFC5jI9lC4OgVEV5wbiKMxujuSBQQbpKw/YDa9x9brLL0yJ5jBOGiBW2jQ1Fw7PBXdJ4+FNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760942716; c=relaxed/simple;
	bh=rtC3C9uGt4UHU2rn8ibGjqy0rKI3FHFok7NncAPdX+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g27QTSu/T1rUKChW5KZn4lIx7OMgQh+im4vCNkP8w/jlT8cFZNBMdwHxIJwHvbu6cdro1A7NE4qDcZJT4zUeWgROcD+6npd7XTynJnnEIJLfpik0fVYcde3jD8W9rxYTtJysdDmHawn1BPGYU5MypD8+LmMUUXqUYcyvuirx7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWI7b02W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMUROj006065
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 06:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qj1hX2tzkLQMkkvq7DvgBbML5xuWRY1vxvwpXBVNfo=; b=DWI7b02Wt6xk/JR0
	JiZBjmIgHysOpmUo0s5EwtmCpscN2yWiLBDfqf+N/vQoo2HpsnpLxwVq0DF/mXy7
	SRDa4UhCdqUWSRZcVkFqtQloG9NwldcNbclPT8XqnHkOdkM92b4wSh5Jkk7z5J+x
	VVNkRcHtFVA2qr83Wou6OC3a4ZeyxlsF1MNP77jA0tWH3nnjZKnOcFWOxcAFHCrl
	ca5By6oyUEm3tQDlZ1vwkPfc04cR10AotH3GU42M0fff5sIBLzZRkFib0MBfLSJj
	Ph3MGFiDxpc/Nv4yuU5APrZ3raxKjL8V/LJmWDTHBPl3ehqfcXLVlWK94fpsW+Yq
	OsBfmg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343uu28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 06:45:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b557abaad02so6905779a12.3
        for <linux-i2c@vger.kernel.org>; Sun, 19 Oct 2025 23:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760942714; x=1761547514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qj1hX2tzkLQMkkvq7DvgBbML5xuWRY1vxvwpXBVNfo=;
        b=fNxRCfb84OjpehQE4ZssiPiP3kaU5HZ2Y261UGwpeNdIUCd9ddwkpk7V4hkJT6rR+W
         co98qhZLgnQUpVoZIKksbG9cYNaK6IJO4666kXqBktDK9TLyGH1qCnE3RRrxZZuGMRse
         jwQyGc3kjmFdA/LDh3uNWYthwImIHROtTLcfUI6Buzfnuj7nU3eqANtGR+ImiF0z0vj/
         950HM70Ut+1eDLRlKAl1SPfgs1yqQXACpbA6+1JSUIB29wuVGi2cNriFMdUlv9Qi604C
         h9msNUouJPhk/+KiBvPBAVcsF2mMOok4pAftwDict+MMymSvCj1BxHXFwI87qJxEeAvr
         7P2A==
X-Gm-Message-State: AOJu0Yz9zpkFjfISSSlvJ03wWG6dhVJIjl0tpMoM3CKrr7K0PDnyr+iX
	xTAhlqMymK7SJ2gUXLH5AWwppi5zbiDaY7hbpeV2on76I2zuClUN1PMWPcqMWdLk/CeT6U8OE8q
	kKiikp0DqNM24Zp7Ypu/somNESsnKlXucAy+qnQKJCDW5WPC0WQ782Cf8IFJxRBM=
X-Gm-Gg: ASbGnct2UdqOteQbQxSz/L/puSImQu4/0teCMmcuUY+3rEiXSI/P68NoKPEKVvIc9bz
	WB5KQib3jVITLVkF3iWrJyrXNXtzyJ2dSo3DqzvhZEVUf9VHjPt8EDirRO4NssQPw6FMIXhGlsm
	JR7pZ3ipftY3REXgpNFTrW/sW5pJ6KLpWW8mAwpjb34IhKF4/Sejro4z5vOh4SjPKcal7TyhvIg
	Ro/wGI+gKqmzzLFt4F6drlkq+b6N0Hb5+eEqW8clhmw/b9tkdgtxDS7LcutCmPZq+Rxf6SL11se
	GhSNQOvEpdBvK4wD00MSDkJTOFAk+3U6tqL+O7a8zswrrvJWTE/13yaIaz9oRmMfS9vMQcY6zxs
	PMC0nn7FLFSrM7AYKKcORbLaGNkdCTOyWmZ5X/nsKmnFfzzYdNl0/AmUpEPPMSKvRDs364A==
X-Received: by 2002:a05:6a20:7489:b0:32b:810c:2ba5 with SMTP id adf61e73a8af0-334a8652285mr16399829637.59.1760942713714;
        Sun, 19 Oct 2025 23:45:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHad5TbzH1sKjCzYpmQGbmCOR4jWr/A8NyZHnhGcDceZbOeyhSYzqUYFrWu/OhNtgqfN1z6lA==
X-Received: by 2002:a05:6a20:7489:b0:32b:810c:2ba5 with SMTP id adf61e73a8af0-334a8652285mr16399786637.59.1760942713297;
        Sun, 19 Oct 2025 23:45:13 -0700 (PDT)
Received: from [10.133.33.90] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76676a2esm6818005a12.15.2025.10.19.23.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 23:45:12 -0700 (PDT)
Message-ID: <8ba56bfe-d0cc-4f9a-93c8-0c361d5c59c8@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:45:06 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-3-f5745ba2dff9@oss.qualcomm.com>
 <0fe25ca8-8dd4-42c7-a818-a803a256f42f@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <0fe25ca8-8dd4-42c7-a818-a803a256f42f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Cvr-j9_3KoBxNR8aP7UxJnZL6ndMW16I
X-Proofpoint-ORIG-GUID: Cvr-j9_3KoBxNR8aP7UxJnZL6ndMW16I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX+9aOp6Y/xn72
 Qx94c5qF7tbw2Gkzd60mex1aiuQxCw1nPuYjw1RlBSYkwXXg//eaEfzWRF+ylnoMfDZXkfgOHN7
 zVLcP2sOJ7njQ/Alh6BNk+H2HOZFEhY+noOcUga1n5JJSrTW8GIwvUxNhTJjM80L8yt9EaUnDTm
 CpEczUozX88pFW172cV1k1dQCErzD+hiY8YsFXsLjb/Jz+fkY8tsSVrGBtmDN3UJN6Hr37pWTZ4
 6iKI2z5+8noVQnkeXe/KqESjInC6vMuDtAcWCJli8fEBs11R20kYmksgzTmUVFnHYt6ub9AdF6T
 z4UWAdW+U8hAYDoicO6wOmeS7HJdx3elu8AQMwnHutBTbQX5vpjlPCf6NY4ieN2OEomk66zBJbC
 kkMGHPuxmr+lnOVs3hm8JttqoXPpfQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f5da7a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zPKo-_adG0ZnOV3uB6kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On 10/16/2025 4:55 PM, Bryan O'Donoghue wrote:
> On 15/10/2025 03:56, Hangxiang Ma wrote:
>> +static const struct resources_icc icc_res_kaanapali[] = {
>> +    /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
>> +    {
>> +        .name = "ahb",
>> +        .icc_bw_tbl.avg = 925857,
>> +        .icc_bw_tbl.peak = 925857,
>> +    },
> 
> Looking at other implementations I realise we've been adding avg and 
> peak without too much review however, wouldn't 925857 / 2 => 462928 be a 
> better value for the average ?
> 
> ---
> bod

Ack. Thanks.

---
Hangxiang

