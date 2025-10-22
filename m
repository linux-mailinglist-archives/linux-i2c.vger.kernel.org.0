Return-Path: <linux-i2c+bounces-13728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B53DBFDA25
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 19:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 230291A0805E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 17:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5102D8372;
	Wed, 22 Oct 2025 17:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovU/kvt+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01262D47E1
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 17:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154776; cv=none; b=awCeDIIOtubIaLDz5D8y5ucsyl1ldtYZXW0fOzeqdI0rW4pzgSGkwog+7r7YgND6FCORl4tXyISRO4bniG3XtUHDHmGDpiKQrqRV4rC6ddK1aca1n70je6Et/eppvEm6Kxu1oHnoMevNrEThHOk6YucHGSvFKGQhEkPAc27qGjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154776; c=relaxed/simple;
	bh=fLelTF8/0IqQy3P2oy26e3VdYKHcJQv0D7rNT0G0sf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQauIF/yWbMmnecD5yB8Rk/lMKjKY+seuoozzpTcmVp7UF4x12hVg+FxAgukD/ky5WYI0Bo7iaAG4pO0Np+HSHMIBk9FhQn+7nDDVwkhryXSzE6ofxtcm/L9eHzxhRdGCZMsZJdeDFYex4lYN3MDuEBFzGQWnMwk9uXaSDrg+KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovU/kvt+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MEdnYq012568
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 17:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLelTF8/0IqQy3P2oy26e3VdYKHcJQv0D7rNT0G0sf8=; b=ovU/kvt+Fe8mZ9v8
	wxfn21NP7PS5PYIcvFEMP6qaEOzjvhnt2Ub7h1coPJ2U8o2htWenlKudNmzQPscC
	PDisyCc0KYada3aJxGQQCtzmVUoUnz6rGFLRM8zcrGUGLUITkIuzfnBmDBg8Qttk
	LiP6F+LpEy1YSJurL01oM7T9u72wAX19C7EueYvIwNvxCKIp9Lcyc86f6d6tPEay
	AI9wn+78QRP6LNjkjuYY0vlKC46mPH3LVLh4erZdVtKuKH5Kt+gXUFYM7QfNZqEM
	pW9PEP1h3savFphn6QPBNiMW9qKXP1DPqcffITKspcicy3CHa/2w7Y2wfyIIQGd+
	pJBbMA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0ke2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 17:39:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befc08so3921891a91.2
        for <linux-i2c@vger.kernel.org>; Wed, 22 Oct 2025 10:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154771; x=1761759571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fLelTF8/0IqQy3P2oy26e3VdYKHcJQv0D7rNT0G0sf8=;
        b=VZGQWsxIwh9B46FcxJAMKHxb0hOg3mDOVxe8+p3YBQm8j7qXpxYt5csTcI9up0+UsE
         QmHUVxLi7CXEn03KdWvWpgk/yGZHbewXJB8+VlFHvbUL8spRSs3IXp4TTmHhSxZzQbL4
         1iilUGXlYSZbWfZjOFqsiW2by4qGwWRvIFU/rKqG9PGg5HG626WK1qaj1OAaWSiX1dtF
         wDvdikPpedFrKP9cSxD/f4x26VwUY+AUlmGx6yXm4d4H/IFMDVsJOKXXfPMEde22pvPv
         Yphx8qgHxeG0+3+UoQMERGCwiAWVxgmrh2ErMwazmOB8mGNVP1GeqTAIPOZflUwRoEKH
         U5sw==
X-Forwarded-Encrypted: i=1; AJvYcCXwq0ugbsbCYwz2Xjz2frIw6i1HdtMgcXhn7WsIw0kkcZOkZaDl2utBFKtdg2H1ddIc60uom2e1Qqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytYYcJaWelBEle8xTQFC1S8RHf0PmyCkwQuxIFDgNn1rXTkSIM
	EFU7TQzu1ajEvjpSCgNEpMt3Z0jYZhvzicU+60vjIQ/+mFlRVk9TTcHdG8h7fZrD61JPX/KpFqI
	NlKHq6N8tahZ/8EDNxFR0DurGq8N9S1gCVtkf0+ZhEGxtI+jNhmSuF3ebSOV8chGboJBHH9Y=
X-Gm-Gg: ASbGncupujfwi6FLeIcfu+qHYIjgRKAcyH+/ctGBsB3tAyOzd3kUWnEUYxnTAuuaED4
	N1f8Y/Kph5eVctMtC5xgLLnIGAQOoigUk2eF6mv2NhcVT+6xKqWTS9P9kYmaqp20c/IAUh33Fy+
	LwFTnMa0HJ/yppHbMqhDtUBnnP5aPaUKyfpzy3xQXpDbMfREZ/GL9/9leksgJMlGQjTYAiPeLbP
	CEsoqJ1buY/wrccyBb4encqOdfeopPyOE/tpThHQizqtoGqlpru2h6BzRn7EuwVw7o802p1mbdL
	GarxyoHTb3ASM/FPXcWoHQJ9B7WRL0z0sRlZTq8PFDM0xWdOVjFlb3UL/Bp8Ctsp37SeYQXIWly
	WnzcYJlcc5LkvhLoaMxp/i04SKXeJfGTL9jXv8ivXjZdiAqIrYZsSMw==
X-Received: by 2002:a17:90a:e70d:b0:32b:6eed:d203 with SMTP id 98e67ed59e1d1-33bcf8f14demr27496762a91.24.1761154771538;
        Wed, 22 Oct 2025 10:39:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzmMG9fdaAA2inrKULTHZS4DJ1sZoPnRULNrfeFDnHK+yfYZ15yMpfN1cpGbPHSU0rFRLuNQ==
X-Received: by 2002:a17:90a:e70d:b0:32b:6eed:d203 with SMTP id 98e67ed59e1d1-33bcf8f14demr27496726a91.24.1761154771059;
        Wed, 22 Oct 2025 10:39:31 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dfb7f8310sm2728378a91.5.2025.10.22.10.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 10:39:30 -0700 (PDT)
Message-ID: <95538ded-d2d3-44bb-8aba-cc55ab0d4ea1@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:39:29 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org>
 <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
 <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
 <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org>
 <WnfCknsSyJK68PQZkE2q7COZHRpsLOFlr3dcbwiVR6SBWtF9iRQ4MGzp_9q31O0kyhZwoncQWfHjJQvpz7nyfw==@protonmail.internalid>
 <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com>
 <0e6e1b8a-d9ae-42d1-b1ad-4314e0d76ab7@kernel.org>
 <2c0011d3-a692-457c-9ac0-a445fc82df37@oss.qualcomm.com>
 <48bede40-584a-409a-9bca-7ae3cc420667@linaro.org>
 <124be1cd-1cc8-4c04-8aca-eede808e736c@oss.qualcomm.com>
 <wQXRQmbUmfMvej8K6_8vXS41CKntPY998YjO9D3oixzxaMuV4isW-ebPocmhNjppbBpEvXx1524Q-BT-UHfh7Q==@protonmail.internalid>
 <6efe686a-fdd5-4f17-a0dd-d44a16a67a36@oss.qualcomm.com>
 <3d2b0de7-4c39-42d3-a6fd-d41386559e1a@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <3d2b0de7-4c39-42d3-a6fd-d41386559e1a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX7YGJ0ud69cR+
 hOtzjXZQpsLleDra5TMtLvB6QnxgDhldaerwSlXgjWh0Y4ZQUMYnQAKyb2Qdo1seyRJJt1dsEM0
 NctD/82wI5o5UodEnWL+j6y5fmFucnx+Vdh7s5XgKIXaZtpavFqlxj3sKBOpiUewcAgBT+tf9Pq
 oAlNQ/qbJAX44pXqgyGXK7kGtwO/Qx9WAfa15u6M4g0BcA0cKplEpCVBRCOaWVcclq2JoYxnpNn
 4B3HxbnmEIloUZhQDSKjb6iFhMWr0YZUhb52Ks2p1BkEc4VF+1jt0ANqI1kZv1VfAGMWrmgsmlG
 aojJw08XFAYw98F0HFbqg1GtofTy0UrekhWpiMVaFXnJH+fWWqwRO7N9ry2r/Zvt8rncQ1zEoRQ
 fHU4wjDH+7PKeEj58d8arb4p/LYAPA==
X-Proofpoint-ORIG-GUID: jybE2LbPJuF_mCvV_7Vdb55LXtIbN2TI
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f916d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=apREhrRnQ4vd8KJXgwIA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: jybE2LbPJuF_mCvV_7Vdb55LXtIbN2TI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167


On 10/22/2025 9:00 AM, Bryan O'Donoghue wrote:
> On 21/10/2025 20:19, Vijay Kumar Tumati wrote:
>> Hope this clarifies. Please let us know if you have any further
>> questions. Thank you very much.
>
> Eh.
>
> So can I take this statement as Review-by: from you ?
>
> That's basically all I really need here, RB or NAK.
>
> ---
> bod
Sorry, yes.
Reviewed-by: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>

