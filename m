Return-Path: <linux-i2c+bounces-13914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B88EC22F60
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 03:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B22DC4E66D3
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Oct 2025 02:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C860827281D;
	Fri, 31 Oct 2025 02:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABZHWdIM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dV9xKuNo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA881E991B
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 02:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761877051; cv=none; b=ssT/zbwPDrhEiv9DVNCc4OjIC7o07vsF5CJIcXEr2YRuJMXckpFAc3gCOVC2NF9RRenFtyecRO+UsoyCIBTIftadnz+Wq3AaXXnek61Sxa5LEuVNHes3lvAW3vy0+0Yw8vw39fcsIhggWDbsDPxEI/rYLgbhycos8H4ZRG9QMXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761877051; c=relaxed/simple;
	bh=X6s8f9B2KM9vd9HXPjufd+VkW8o9mM1aybCul0Q86rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=naV9W9O8ppRTGLV4FI8yr2PgiJMd7WF+5s51PZbi8153xY3AMQ+RjqYv6MSQyPeBJ0IRUQTyxlzNYPI1stjK9l+5wZrLscmQWF2X65sWDd0WwSrC5ZDH5rANh8g+0OX1WI20Rj69CPFfxZfk6OD//zJVAfyJfnP0DGDkm/inr/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABZHWdIM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dV9xKuNo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V1mlDC1571629
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 02:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RBCLi4ChvVVrxy0q6O9ni8V6jsx7gpnSYJCNKWxoIg=; b=ABZHWdIMwEH9WCTv
	zlg10GfseJClW4FG+RyWFd3BAG6pw+HZPNHegk5iAlf6xD+UHkz5Y1o19Dg2ZelG
	4e6Wa5XHoq64GSl9B4TE16tmMDDpocO0IpGm/ZwqUwoGB1wbpaOD6RK3JjEnjx5W
	NaBw7eBNy+WSCdU+DhBY8PwRJD5a8p0nmcAJdM+f2DBYV4yzhlvoPmT+DoGUO6LD
	KLzohufpdNNbMy1rHO9ih2hTgzJy31HPuF1h3mLchsSrYoZS5iJ7/Q5v5igaysD6
	qxf7XsxwDkeIBzayybEnLJiTTaAMXVtLKpPJTFAXzcpaZNNbB+ZBk3m3GnyXSuGD
	xzuq9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc023g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 31 Oct 2025 02:17:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3406aa44a1dso2117264a91.2
        for <linux-i2c@vger.kernel.org>; Thu, 30 Oct 2025 19:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761877048; x=1762481848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0RBCLi4ChvVVrxy0q6O9ni8V6jsx7gpnSYJCNKWxoIg=;
        b=dV9xKuNo1iU/1OU0irlZYnvhSvWCFUiXwF2zZRRT6mhTdb0c0LM38IVErE6+qagQsf
         1BfEPJgJfx8NlWroeBSpvDGgWh6mImUMtNsjHdAex3ciUPJeDig8B/V4AmjmDU9oJfe6
         o4+TNRcRo3aMk54hHat5QR2gOZx2MHwuKJhT644VkEnCJTbr6/r83tp5XUppdUZU8Zeo
         gG5z3DWSDA5Jh3CGJXZ//nS2db+IWbMQV6I3GBcamvEaiTInL5/VivTceTnigH0qUYio
         Lw//uVH4io9YZ9xOvA6M8tBuJ+0chFG3zYxTOJwxUSB1/ZGOzjHONlgKLy5y1E9vqR2c
         MRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761877048; x=1762481848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RBCLi4ChvVVrxy0q6O9ni8V6jsx7gpnSYJCNKWxoIg=;
        b=mhKPnN6LMpvgxBp298Kb207c9uG0Hvh57+fVY5yG+3zykxS4xYu2Jo2Kue99sceEum
         pzrYF4yhx0nuaZRjmOtSD6ydGtbi9jXrUTVTLEzosWSboDxzVlkLln+cl2t9gbYBwf4l
         L9ZDY0tnsao7nvbt+X5XMBcUm7YQKHldwJHj0uZX17weHsL/czCYm2cSvflp5eXIlc+0
         g1VvO5DkWD9zW2WZSK4fSY7pXUay6U1iIoBph3ppng5jOb6QIFH57HK77edE7QxWBXox
         MUzoNQwZP5TX6IhJObg332Fg7UFclDXJIzYjIKBKS6SoSkA2nhWzxNqzz918vGK4foN+
         hW/A==
X-Forwarded-Encrypted: i=1; AJvYcCWbz2UsH4VNF0lRXnWbrIai4SAIpntCYJtGcyi9qZFJfNoCmZE4xgc1YDxMstkmsgU6cQXpupEV6DU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUs7RMEJKlVANOtog6+FzMfbKvtECTEjZoIg7A5A4v2NN2d6o+
	pMWDiHW+rWFLNVCFoq0H1SfE6++62P919h5JRifNyVMO4pxaVR6tWXUjS3Tw/rUB27dFvAcHXnN
	XR9/aNS9Kyp9enP9HXQWf6Z9MPCFXS2en7s9dkuKetKWTT9saFizsd+wwjWOWATs=
X-Gm-Gg: ASbGnct6eg3nTLXd+IHshK1scfo6e17IooxmxYNf8Gs5gr5cK88vSm1GO7OD0u8mVzH
	4jZAW8pUQQ4GS3ayQUJqIsRFYWt+4XPDGa8X1P4CLHz1lSUd8itESJ9VmEGBr3OGYBZiJfyMSpd
	5gn8fPJBXTNQPFi/TIJTu8IFguVZrD3JmZaCLHdnPPs9I3BTx2yUt6/2nImKMeRuhNpiF3NbrdD
	xJH/2zCF+Tio3T/tQQjpq7vamg6ZZB5HN91ckdWdT27d3n/nkH03HDanA5Pwn65D+zLOupJAD+Q
	+32ADI2UBhUgxKyIUyYuBY1Nv+qHkdhaVNHssFbRmVQvu0krsoMkL47+kJHJsnNReL6whsPKkri
	fa3cWbaAOqHTI32JfEvzMNqEv3goZBUtzOJX/k4Dauo+9jDdw+TEQ7ijkRjIBw1hYJJyaQQ==
X-Received: by 2002:a17:90b:2584:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34083055439mr2409431a91.20.1761877047817;
        Thu, 30 Oct 2025 19:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9falBZKVcylZWCH4G/onhKqQ9MxiOjfP8YU20DqJtlRyYGNpFe3ZpstGwO4uUqN++QHWxbQ==
X-Received: by 2002:a17:90b:2584:b0:330:6d5e:f174 with SMTP id 98e67ed59e1d1-34083055439mr2409392a91.20.1761877047286;
        Thu, 30 Oct 2025 19:17:27 -0700 (PDT)
Received: from [10.133.33.25] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3409288c8f6sm369375a91.7.2025.10.30.19.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 19:17:26 -0700 (PDT)
Message-ID: <79dd446c-0c78-4dd0-b1cf-431d3995d94f@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 10:17:21 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251028-add-support-for-camss-on-kaanapali-v4-0-7eb484c89585@oss.qualcomm.com>
 <20251028-add-support-for-camss-on-kaanapali-v4-1-7eb484c89585@oss.qualcomm.com>
 <20251030-masterful-daring-lorikeet-ae45b0@kuoka>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20251030-masterful-daring-lorikeet-ae45b0@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAxNyBTYWx0ZWRfXwBIvQYNV6Gb2
 A/A6X8ezz6K7UFdmMiE6hbGsDKRJSgC4rOZnP0jTnk1ipESH0GcK1NnBCEAdJZgINiXM+2FyehP
 aojtEWXc1xTzN29/ws5IfbuqZDZSqyycgl5tYN4UiP4Chv3GglrxoaOypMfeCrDQaPicubvF/v2
 d8GOyixda1hSLkVdrQT1HsUHHVTUZDNsfpkOUuTKWtUHHSm1HgQ6NiFARMmwIoBzpRYZzhPx1YA
 jX1JMn1/aNJ5jZc2jJE3eZTNucVQ46ca33XKOmoZmpLe4czZ591Yw1nP1hdJ1mF1mMmiBZQdZ6t
 DoXiNnp2AzbcGxduMsxbJhWKbWjeeGCxea1FHykmUHh55w6rEsZteW8Gc5SbW+HKWam9tmVFeY1
 pcB+qarLeqHc0bquCaSsCLIOUkU/+g==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=69041c38 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=D9yHQimw3Z_xc7UoUzwA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: k5g9DSoCoXDuxpUAahvsmTes6-1qGSBJ
X-Proofpoint-GUID: k5g9DSoCoXDuxpUAahvsmTes6-1qGSBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310017

On 10/30/2025 3:12 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 28, 2025 at 10:44:10PM -0700, Hangxiang Ma wrote:
>> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
>>
> 
> You are using b4 so I don't understand why you still ignore our review.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Best regards,
> Krzysztof
> 
On 10/30/2025 8:30 PM, Andi Shyti wrote:> Hi,
> 
> On Tue, Oct 28, 2025 at 10:44:10PM -0700, Hangxiang Ma wrote:
>> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> Patch 1/6 applied to i2c/i2c-host.
> 
> b4 added automatically Loic's and Krzysztof's r-b. Please, next
> time don't forget to add the reviews you got. It's also useful
> for the maintainer not to dig the mail history to figure out the
> tags you received.
> 
> Thanks,
> Andi

Thanks Krzysztof, Andi. Will add these tags by b4 tool in next revision.

---
Hangxiang


