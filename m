Return-Path: <linux-i2c+bounces-13603-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091EABE5CB5
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Oct 2025 01:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B843719A7C8C
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 23:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6FA2E7165;
	Thu, 16 Oct 2025 23:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn0ylk4L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198662E62B4
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 23:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760657331; cv=none; b=cZTGltK8YEjWHAeCWtqW/8oqIq1z2B5/n5bFjauTysTnEp8W/JdZXUVZNKjxxVrVQqgrveijDLGAAEo8Vw/OGDFH1oaWOg2wCXKbT91+xFEUMA9K068ODDvrDdmlpmDI6V884qeNNgvO2kH4s62zlFV8oRzWd9T+XowM3XJEyu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760657331; c=relaxed/simple;
	bh=rlxaqT8IZi7KLirboMOLoCUue9uOBkoS1ATRvMw3124=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8PAjNoHkNNYTvS6G8t+8DKIXMWfhw6Mcb4f9Dr48ghOQSYrQNPTyrepNNptU+HPn2rTVairvsRnRjnnl+N3PQjQS0temNLZYPB00Go2OdKZ41yWB5cCTi3A4lh0j2r/JG8GDgJ8zpwcIeFLjO+nM0y0K8YMf576nN9ChwQZbzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wn0ylk4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLddK009737
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 23:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RX63coALBF5N8Qboq9T43pP2xBguL49cxoQ5B66uUGw=; b=Wn0ylk4L0yHcTEw3
	hSsSZgRBCk7b0eVs7kla4J1QEZxdQzZCVyRbchPhwLMPfuo/XgKno9QUm80REGMG
	tXbOVy4R2/AKIiUvm/vgxVF7hNy2EVmkSsOE63jcRpchmzE3rMTIFImS7KVq7DIq
	kmfZjALBfHIYuYZYVzLVT2jifl4okqHm/tl4ydFN/ntqPRP/fcXsH7oYPNs7JAkz
	0lF7oAGu3fQDcgD0EeT3UdRh3Dx1OfD9tehiLYShpfK5Y+22OESV4rCz4SniI/al
	fDhJFfoflNwNglaa5JTImU4P4f/nFEmoMIioGzGJOKlJ+AH4pho2bf/4OzzT8Yd0
	bkKivA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1apdht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 23:28:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befd39so3187266a91.0
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 16:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760657328; x=1761262128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RX63coALBF5N8Qboq9T43pP2xBguL49cxoQ5B66uUGw=;
        b=u0X5TAfDm9J4CCOaNX5qgPfIppxd41QRC1jwpdxa8gmdIk5il1QBGzs86beIv3wVEq
         RTa4pFoSa771JDTNaSSS5mYZIstl0SOJXDY/nTr+LnnFFsuFiH8mCmMXyBNFKRvISVIJ
         Vdp/zR3GxIgemBhR4yisbxBJaeZ+1hEW01eSaWtvJA7FCDLvw3o/U1bAr8CBx0YJVShR
         5q1N/Ts57vZUD1C9HfbwEaIHkDPXunXmX58++ancH18tNo+/Og+lznsgxxyCLkEl2+Ff
         fbtTg70y+8j4NknaKeBx1VS+tgAM0C6aK0EdujudmDvNPrSf8+LOFQKHL9N/sP8rAE0K
         Ommw==
X-Gm-Message-State: AOJu0Yx66ymhviKgOrYVPoe9Rmx5f7OiJOJLYwv6DGG2NxbGlFXvWApT
	3kjKDl+XZx5iYiwMzxj2c4woxPySLKMoAR97CxP6WSkpKtBKQb70lLpMtH/ad49hdqI0vONTxzB
	OknGEnzooEIxxAsJYXMc58CsO3P9IzriL+g27FrrFMpeUtEEwtFXMQGTx6xLxE0s=
X-Gm-Gg: ASbGnctji+bIxLd6mPx9B/R7h27XGC54xi2YpNZL7wObsAm4lv6rltsHbtNHx8hd+hf
	Tg17VGslUAgtz+T7s+5D/YPNgrllsSCWyxOgSI0Eo0q3kniOtC0RMp/KHYJiMd36TEZ4pgCwgGx
	etM8lGgxq7OBbdPnKlHRQdXkbSS+D8eHD59NLWj49kq4BbXPADBpVgJhjKk+vtAkhwzDiIMv2Km
	JNq171bE67Pfpbhg303lvDtwkPJfS3Lj1lDmlL+az36DRWOludYO73daa6nFjDDGzSZEZWVM2iv
	GX8hmBa+onYMPlpRdgQIB+Ybb4n7EdmtIsQBh/wQmJnPRult6CzMM14nMvYPMzKSIWCwA20qCyK
	iLoskVCUqqf7GisUIdf0qw1hlhu2pQLUlaLW6hA590LyMZ46GmWyxpw==
X-Received: by 2002:a17:90b:2b4b:b0:335:28ee:eebe with SMTP id 98e67ed59e1d1-33bcf908bc8mr1568431a91.30.1760657328255;
        Thu, 16 Oct 2025 16:28:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdlkJr++vWqphZc58l1HehQD9BXRaRbHvW5CoQYUc4yrWbI39Sys1IV5VOEPFpE87k3sOOng==
X-Received: by 2002:a17:90b:2b4b:b0:335:28ee:eebe with SMTP id 98e67ed59e1d1-33bcf908bc8mr1568392a91.30.1760657327731;
        Thu, 16 Oct 2025 16:28:47 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bcfc12fa0sm359020a91.13.2025.10.16.16.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 16:28:47 -0700 (PDT)
Message-ID: <662a21a3-de8b-406f-a15d-b8a572aa79ab@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 16:28:45 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] media: qcom: camss: vfe: Add support for VFE 1080
To: Bryan O'Donoghue <bod@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
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
 <20251014-add-support-for-camss-on-kaanapali-v2-6-f5745ba2dff9@oss.qualcomm.com>
 <8d61f29b-ba02-4757-b8cd-5fb51b998acb@kernel.org>
 <FA4lDfkvC1Bdn7xJsoLXyWUEackUIfrSW4vn_6Q5YA5pDcNJ0QZ8EeU0CuEqKQuzdnYLC-AIvy9RhoY2ba5sbQ==@protonmail.internalid>
 <1aa133b9-2a99-47cb-8309-7e49b5dc4f85@oss.qualcomm.com>
 <f5df1c29-a1cd-4cc7-8ac4-b4aefc4225b0@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <f5df1c29-a1cd-4cc7-8ac4-b4aefc4225b0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f17fb1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=blchzdlE1R3GHN3_IVwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: rQ-tlRR7FzGSZSIcvDA_HUbf6AajfNUF
X-Proofpoint-ORIG-GUID: rQ-tlRR7FzGSZSIcvDA_HUbf6AajfNUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXwfHFMxvLUALy
 ukXoTqz/tywyn80HocyDbbsrmlDKrMdNxTE7g+OVcdnr3D5gT4segZ7WggrTfzYf7VxV1TfTSrC
 k8JR3B2sE8saYYxzL8JEKTNX2Jgnvbx7WLkoj7vAmOhsfqrBZJ5qPP56JSjV5C6g14sQO25U6ZK
 JuSf7u2YrYY7EQmwae0ctXhKF7VQoWltS222dilexr/xUpL/vQPh0oaiekD5+eIiRYJGQKZ+U16
 FuLJDsa6PYg0RDgTwcynadC5Mfj6sH1bsarxH+wU3Kx9+LP+a2dAx4mZrycd9w7nTSngEL1n/or
 aC8yZ0OzzirAKKCiUpXGxGj1VcpjuPYrNJLvfTmBuw5RVpQS0DrzAWyJadKg/u5BPbL/uD2EvJc
 Ar6Npc3T9rVBkyzXK93urC5wxgZ8ng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035


On 10/16/2025 3:54 AM, Bryan O'Donoghue wrote:
> On 16/10/2025 11:33, Hangxiang Ma wrote:
>>> But why ?
>>>
>>> ---
>>> bod
>> That a story. When testing the RDI path on Kaanapali, we found one image
>> buffer starved at 19/20 stage. We want to capture 20 images but only 19
>> received.
>>
>> On Kaanapali, the AUP and RUP are split into two separate registers not
>> a single one. Maybe this hardware change impacts something. Calling
>> ops->reg_update() in vfe_enable_output_v2 function only applies one
>> buffer address. The downstream code defers AUP and RUP to CSID
>> configuration stage. We mimic that and find it can solve this issue.
>>
>> ---
>> Hangxiang
>
> So this is the type of interesting detail that I'd go looking for in a 
> commit log, a comment in the code or a footnote in the cover letter.
>
> One or two sentences in the commit log will do.
>
> ---
> bod
>
@Bryan, let me throw a bit more light here. I don't think the 19/20 
buffers issue or the AUP-RUP register separation has anything to do 
about this (at least not the first for sure). Fundamentally, on 
Kaanapali architecture (or any architecture for that matter), the HW 
guidance is to issue the reg_update (corresponding register write) after 
all of the CSID configuration registers are written. It had always been 
working for other chip sets to write to this register first and then 
write the CSID registers but Kaanapali seems to have very strict 
dependency in the hardware about this sequence and with the original 
sequence, no RUP DONE or BUF DONE events are received at all. Hence the 
need for this change. The 19/20 buffer issue that Hangxiang mentioned 
about is a follow up of this where we enqueue two buffers to the RDI 
write master from 'vfe_enable_output_v2()' but issue only one AUP update 
after the CSID config. That was when we needed to add 
'CAMSS_INIT_BUF_COUNT' and use consistently at both places. Hope this 
makes sense now. Please let us know if you have any questions still. 
Thank you.

