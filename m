Return-Path: <linux-i2c+bounces-13654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF03BEF618
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 07:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75BF63E0632
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 05:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BF12D063D;
	Mon, 20 Oct 2025 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwvQAiHN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C362D0629
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 05:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760939968; cv=none; b=NxO6ccnr2OtwDJJYm7vLR0P9O049DyZN+4piKS+WX287/WELfBmh4S+mCZx0xYj4n9UYByrwjEmhch55TkWxFOpYDjjbCZpwY0/ieVwuiakdwyc8B+xLhw7vtsdHnk7ikvTqN17U5p48tGKD9I8d+UT+yLJHVpBAikwSpg5MnDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760939968; c=relaxed/simple;
	bh=DfgQhDV2FB+r3jXdeQjlELojhkZCzkVAxCp7ukCYBp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ae7xSSpgbWnzWT7fv8HQpJ+qoTd9p1mDFUCvEPYfDD/DGWBCIhlVrkxKgFcKJ/ExTvV0d3GJHf5MSZc/faISD+KbnLZUikE/Oy/+SVRdVMgJtHqrhzmQdpKnGp8Zyyk1VJJG998cCv50COHAtcka9Z0bUXzTtuDAlyj2k4fCnjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AwvQAiHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J8hGtD004476
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 05:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nM+18YfZG3eJcSFCMfzYrqy29nlqANkrqIV1DISydfs=; b=AwvQAiHNZfptJ/sS
	i5WDMuP2gRVCoBZ68zEz05L2Ju3az2ItKHRmAT6DUhiNLKy8s8ozHmuBu8Kz9ULM
	eWNZgonQhV+lfmHKBPfDj5xeYC+GMPa0DpRsnba3F3U2YJQS2J6HRTvOb237+m72
	xQNCGieEZs+l5Bx58+CB37AkYupNbQLU0pB1yJ0kF9GTWwWs6QFjNEIdk8fxxG8s
	PSeBCIDMqhmWo8KbJx7ayULn/eurVcduffgVD5Rz/MeseGjoQT+7BCLsBtGMefND
	M7EPR0uxZd/Lh94X7BLvG8Sgw205tdyhip21CZYDrW9OrIItFDnAod1MQ5q6UpYJ
	8NvWHA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469bnjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 05:59:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a153ba0009so7416101b3a.1
        for <linux-i2c@vger.kernel.org>; Sun, 19 Oct 2025 22:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760939965; x=1761544765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nM+18YfZG3eJcSFCMfzYrqy29nlqANkrqIV1DISydfs=;
        b=UppLn/ZOlJwLv8owmbcuqQH/Ec2bTv3yXWVTEmC2eqq0pTSMb62TN2Bo8/GqRweGYJ
         nxKYE1qIwESwOOMCSLGr4NBmXGjTgU4y/NqEayGDXsKFWtwed05CI0Nx+qQph9ZR9a7b
         XzUj7N9pE7PUZ0M6Xk3fGfeU/8/8U4ACbt+wvzsAYhmHBmDVnJ/JB4RRg5sOmjFY31ne
         45vpwjB9TicQqLDHzHHZ0ZKoPxC8wAfsW4TOeuUmLd/RuR88pxus7EB+NU2FJzFdGi0Y
         j39LomjbwKce141BVU6OcaQnJQDKmusFGtmh7l7+2tdxUTp5wizYCKtrqu0ZY7Vn/89c
         B+Hg==
X-Gm-Message-State: AOJu0YzbudsxJWJc4Y2CGGtJKMm8sD6PbYlrI2JxKphhzlOgoBcOLvAN
	FJAPxZv6q/P0TPNytZz1obWXKkkgcuCYPzAbElNrYoTiuAN1tK4Lvb0Hrp8PjqyXou667avYj3W
	F0weDQL70jNOrlz3WTP+hAov9OPSq+kT2/QKNi0kBtihH8062McC+WTLT5ZWPtuA=
X-Gm-Gg: ASbGncs4BovxBF/zQtt9hwcg7hxmOS8SbUBmlbMwVntFBWY4pnYvDLa1OylejOlnwXy
	jJNFATj7P2cZ6u1Q1Z8YWQVqOz+OwxRtluvH3r7PobhGCZc0Jx88wzQvMIV1zDzlsSkHRdwRqvu
	sAT7uHp5FJOGOmI9xEsbm8ReuJoEwTpj9+WQXJGA7V/xuXZoBhH1GtN9RaJUul7JhXZxW1cMyzi
	Mlr0IY7nOpns48iS1xBYLc5j2fKVhd4X6E3fBHp7qUffEIHbh3Me+01WDX7MQiSGLWC2tswY3aB
	cMYj/Fo83cfqo6QDmDl+3BKkRt4UlzaC8ej11U6qWBrw56xYQUqUdNrxd/fECzddl0tSSoacskt
	aKxOSiIwRkc656GDCVGa12F2QqzwsW4mHIPWnzZacfAj0iGMu920sf+fTEcRYzF2EAAGODg==
X-Received: by 2002:a05:6a00:21c4:b0:772:45ee:9b9e with SMTP id d2e1a72fcca58-7a220aa8c36mr12648431b3a.9.1760939965329;
        Sun, 19 Oct 2025 22:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOnIQKmKM4/wBe+q3U4Vl91ebk6gizKnC7NhQP4NZOp+sNVTSvIrGb+vHkb3XE0F6V5ZNQSg==
X-Received: by 2002:a05:6a00:21c4:b0:772:45ee:9b9e with SMTP id d2e1a72fcca58-7a220aa8c36mr12648411b3a.9.1760939964922;
        Sun, 19 Oct 2025 22:59:24 -0700 (PDT)
Received: from [10.133.33.90] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34ba6sm7240595b3a.18.2025.10.19.22.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 22:59:24 -0700 (PDT)
Message-ID: <bc9f58db-c0b2-4c97-8ae6-ee01a5bf49e7@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 13:59:16 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: qcom: camss: csid: Add support for CSID
 1080
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
 <20251014-add-support-for-camss-on-kaanapali-v2-5-f5745ba2dff9@oss.qualcomm.com>
 <f64bc46b-9c21-49a8-b5d8-3e21614b6695@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <f64bc46b-9c21-49a8-b5d8-3e21614b6695@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZGiW4_i8ssocQbkPLIIDwrh9ZcvnEw3u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfXwRWulJLrJwD9
 KF4lmKrRgd1UuA99nW0bnDgmSBf5rvtURQMNNloHO6zOXlfgiqp7QgXSltmc4TZMEga8AHdm45V
 xkAwFm4OlEbQ4+jCivDpPyntHhKSoELKHOH9dfSs1D4BAayK69E3jWzLNBUqs+M2sHxSeYIsR+U
 Uif6wctd2cRb2xsUyRocRXYU9kMxQhxohUxUv9obNbEjtXrnMUl47z84uuVPmzwxdyZCfs9HeYt
 OaCRuoBizumZIaSZd7HvY9iRsE97lPrE1S7Z0dWIS2PdzohoJkAdhwm1MXwPn9OssuxY+w8FcmK
 /q9U0r8gIVg+M9YlFGOjeuyEKe8nkmISLXH4FzYfogvHpFO1iL1TAHA50F9B0rx/2ZDq7zBWVVn
 hNBHUDx96/gToi21dCTwmWZnUDc6/A==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f5cfbe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=AXp2hmqOj5kKvFkYXygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: ZGiW4_i8ssocQbkPLIIDwrh9ZcvnEw3u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On 10/16/2025 5:12 PM, Bryan O'Donoghue wrote:
> On 15/10/2025 03:56, Hangxiang Ma wrote:
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++)
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>> +            writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>> +
>> +            if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + 
>> i)) {
>> +                /*
>> +                 * buf done and RUP IRQ have been moved to CSID from 
>> VFE.
>> +                 * Once CSID received buf done, need notify VFE of this
>> +                 * event and trigger VFE to handle buf done process.
>> +                 */
>> +                camss_buf_done(csid->camss, csid->id, i);
>> +            }
>> +        }
>> +
> A multi-liner like this should be
> 
> for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>      /* etc */
> }
> 
> in fact csid_reset_1080() does the right thing, please replicate.
> 
Ack. Thanks.

---
Hangxiang

