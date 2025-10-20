Return-Path: <linux-i2c+bounces-13680-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E602CBF1922
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 15:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9C2D1893BB7
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 13:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9975131B82F;
	Mon, 20 Oct 2025 13:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRK+lxCE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A374A31AF16
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967542; cv=none; b=dNiQZKVThtmJWWr4m0MJwioIOvPg8aeT7nkE9kuydfWWgj9TpaJm22uOvyGWY0xG9jNlt2oFPQLi6npHc/F912v26e9K8sbU3MPhjN/Ph4IvU0DUtkqYRBjS9QTN4wv6pSEMHqpI8FFVKKJA7YJxE4wD/zU1QnM6odW9O7CNjio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967542; c=relaxed/simple;
	bh=hwv1YfCnFLJpiuuZikVWZGq9I06wdk0G95/RZY/REng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sk2yWPuJmaZaMJcIsmTCKCsUr4sXWlNEn3pwhvz5Z+W11JIKA30eduOppCK0ZrRlmADEXgySgBI6eJmClbKTQyaztDROIL3Bwgs9dPeWWwsbC+CMr9+qSutpquEzJ/ap/0dMeGlJT0G33foARWu9WgRxIm5pw9/2/nmximzLoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRK+lxCE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBwjNS009308
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 13:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rw+jplN5LBufA5sJ53Ja3QfxZgNTjgPwrhBg8ayk9cc=; b=NRK+lxCEXOnGVjaR
	Bdkq+7+VYBbQ6v5mKKjTffuGlZJlV+EwDIo21orJK9DVLqaG7SXZY1fb4mGvsKkE
	eoLJVxTH2tNdox2QLsPaKlEu5kdcJbpwWv3KK9LxAJdknjDZ8P2SSo6fGE4NXRzO
	ZZQ9RzJ+V2pz6AXzFgHuQXMWBp/8YerJVUGgb6soOtNT1Zfp9Vwnab7mTHguNESt
	8vLgNJrEDENfZPDaWVPQr9+E6xr5nzhhdPoH5qNIa937ikVD2eqfXruEpIRV4jy8
	KPpaXU7J6NRz2JHX0aMfGYlTZpcoLISQfH53sHmZoVfqoz0Pqb8I533BCoqJ6nVT
	zhFzEA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pd48g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 13:38:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27eca7298d9so106599765ad.0
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 06:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760967538; x=1761572338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rw+jplN5LBufA5sJ53Ja3QfxZgNTjgPwrhBg8ayk9cc=;
        b=OLO46jOezwVk6GxbMtQNzC00LUOc6lno/1wqAMmvBGy8QSyamslEAk9R4Ev3MSoOf6
         zNDLN10AXS9q8RDdUnbg6IYvhSaedfxuRX4eXPTI75uK2jpwLvDvjkHbod1vuQc88IAJ
         4p8SJM7p+hYmbEW+pwjSx3lF6mjcByzMWzfOFYtw5pNYU2yMoRJ4SMHiPBVQ7zkvlyaL
         DpFCOAUDk0jC1BESFaEJSwXlPxzcU//Cbq0kIHfvyx4VTWXREl9xl2cIWqvTEtyIck6T
         PmQdFtFJ452Abr/i8+6lj42PmKh8SBPvx7+HlF6JHT74UQQZj76rhalPfRhcYW8WY1oe
         d41w==
X-Gm-Message-State: AOJu0Yzy0b83SJMzC9mHi2QTKmVOZoYqsCWjnlKmIQJOr2o4JYG1qf1V
	WChpFRzHQlpG2wfgCyUP+hoVMMcYsUub2uVdxRE0Q6IuMbeg+P0ZcIszaBZtf7rfNoFl4yASbiX
	m6YVImM4lfvtwQ86jqUm3UEdUIuWgPCccVTztiPQgAjsaZAH/bN3q2h7f+5J7IAI=
X-Gm-Gg: ASbGncuxt2iiIw6oXQedPOYy92PLF4efbeebmcDM9vGFGLeUyAdDoq69kDOSCL26j3Z
	wl3ji6myAHoii1Sb4siSeTPJK7+qjDw4KyZ7Ef4SwjsS/XL7Jfg2Z1RQaJwyk6DSIhwQnu7P1+i
	JArYanCnQO97LbmFe3ibHPWGo9xmd50s9w8Qi2jgWYjRoNNNMjPq1tEP1tXoqBEwfV2UI4TBDE5
	NmnudPjbM7pRNofqMXXAJxsdj9qUoOP4QsMLBQZe3xNfPtIx3hyErz/2xW802MWU66jHMcC/UFM
	QDuYh3qVRlv0UvCafB5H4z5WeGnB08fcsZ+7O7F5LGGgpulB80cxvs3zdmfO+yq0g5HsuwLo942
	uetrstmLrTPO6BPi7mKAw20v0eO8GSzWMHlou1Z6iS/wLROojYkxevyQvN8gGT/74O98=
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id d9443c01a7336-290c9cf8e7fmr165399205ad.12.1760967537857;
        Mon, 20 Oct 2025 06:38:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRNEXbflozLjWkDnbjGXkqNc04PBYLwxX4FkeZGUAQM1MSVdWu/MYBIBj3FuVvicz/eZI0Kg==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id d9443c01a7336-290c9cf8e7fmr165398655ad.12.1760967537285;
        Mon, 20 Oct 2025 06:38:57 -0700 (PDT)
Received: from ?IPV6:2603:8001:8403:ab62:4d1e:2cd3:d939:feed? ([2603:8001:8403:ab62:4d1e:2cd3:d939:feed])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df9351fsm8007642a91.16.2025.10.20.06.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:38:56 -0700 (PDT)
Message-ID: <e6830a20-7c58-4799-ab38-53c1276cccb4@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 06:38:50 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] media: qcom: camss: Add Kaanapali compatible camss
 driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <8ba56bfe-d0cc-4f9a-93c8-0c361d5c59c8@oss.qualcomm.com>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <8ba56bfe-d0cc-4f9a-93c8-0c361d5c59c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX8CgxhkuDyRFo
 4iwHIbE1sLE3gWYw9hcoLGpnwbwvRL61JmmbmxWpRqr14Oc1tGvfHJoXhYJWJHI2IR4vGJqeWQr
 3Q4B0YlNzvZQHcbHA4xa+oROx6/WkS+A2jJUYKKWxK9N4PRDl4pmwTpMZNifmXCiEKNvnURjUnr
 sFvkYgejLM+ESLxP/qaO02ekl3+hjETeVMB8uIWhRVFFhgOlEqzhq5oNmD+PD92pA4hkBEy6Arj
 nZz9hIJCeHyFxfoOSDqtKYzw3ZzVMRcOBGKqVDUtsDA2Rlr+6tRhPUEDMA7P9mlu9tiD+3g5/n2
 M1TtGpLdZA7Vfq7DVmkWevyTNWWcaJQjKj4YIkNzR6V6+1SWZRyqqNDNtvr81pozNU2Yajhhr5j
 J19VGXbLhJrQnQ4Txeo3dcF8mL6H9Q==
X-Proofpoint-GUID: WTiUo9rRvbD4kWxM1qZx22sA-Px2RMko
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f63b73 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=6xprqeDdnALSCdrIqMcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: WTiUo9rRvbD4kWxM1qZx22sA-Px2RMko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000


On 10/19/2025 11:45 PM, Hangxiang Ma wrote:
> On 10/16/2025 4:55 PM, Bryan O'Donoghue wrote:
>> On 15/10/2025 03:56, Hangxiang Ma wrote:
>>> +static const struct resources_icc icc_res_kaanapali[] = {
>>> +    /* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
>>> +    {
>>> +        .name = "ahb",
>>> +        .icc_bw_tbl.avg = 925857,
>>> +        .icc_bw_tbl.peak = 925857,
>>> +    },
>>
>> Looking at other implementations I realise we've been adding avg and 
>> peak without too much review however, wouldn't 925857 / 2 => 462928 
>> be a better value for the average ?
>>
>> ---
>> bod
>
> Ack. Thanks.
Just adding my thoughts on this, as you know the peak/avg bandwidth 
should primarily depends on the sensor data rate and additionally, the 
average BW vote should depend on the buffer sizes in the NIUs/NOCs and 
(although irrelevant here) whether it's an RT or NRT module (file system 
reads/writes from the NRT modules can be averaged and controlled 
better). Fundamentally, the votes from all modules go into the 
calculation of the DDR clock. The current driver does not take into 
account anything. So either way, it is not ideal I think. We can discuss 
and come up with a cleaner approach in a different patch series covering 
all chip sets. Thanks.
>
> ---
> Hangxiang
>

