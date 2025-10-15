Return-Path: <linux-i2c+bounces-13499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE18BDC4DB
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 05:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AEB140314D
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Oct 2025 03:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505272773D8;
	Wed, 15 Oct 2025 03:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xlf2kAIC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A490F1C5486
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 03:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760498245; cv=none; b=RV0/O5xdi7jUEXNttnI98ScIEB3IJfgk9ZHnCF7hy53f6sj8aoj6Fdd1NBiALFNEJNwj+rJVeYs0tsHal4TTcUFJCvMa8cDyjAMQlli71pB2fiyQY5XUd72NhDQhKQcJbe8McdTGDdb8qv9+T49DTQ+GZ7SstPN6CzC+PGUJfqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760498245; c=relaxed/simple;
	bh=L8eRhqEBY6VPKEe+NuDuAvsDC5E/DLGuikVuC496Dlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+njU0SM1UmhWIlkG9DkRHjh1wor4d4zhtoMknRp14jvY6hbca2KIwQhL5HbJYAJL32rKyRhL3O4UhA06JS7OnzMGM+dK5CpEsdENYtG/Q0+bk6sypp8zIV9wznGqW3zg22RPPdjAiAahJIkDzvAUGfj0voQrWb+4C2Xx5VNQ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xlf2kAIC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s68E002496
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 03:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UAYC8XZOapAdIGslkNfv0MnBEhGl58g6zptcvxFMsY=; b=Xlf2kAICwu1xDiM/
	mdhGqKZpxbowqFBG5SOuYG4quvVBRV1zWjPIhcmIPDxcgTpfhtKzdDETHleBWYp/
	g8BxLHz2klBzp14CkQ7C/wVTc10gMCBwcdJgLl08SmZ9N+nZPXdNGFdpyrbpKlqt
	1PrG616v9EXQeM/73X0hQgJgYuuGkLnzO3Y+Usyo8CVSufTHUFItsQwSCDTPlLuf
	MtkCrocT1DmPLcRuBHgOARP6ak3AUMeb1800PKE5aadme2UtC1CedD522kEKoJEM
	Dgk0k4ZMQrQAsn6PX/bT+laBYRORFgLt6F5DuLX6gFuZ7m54+VOEWMkuqQ3oRC5G
	VuVaFQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8awkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 15 Oct 2025 03:17:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29076e11974so18214495ad.3
        for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 20:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760498241; x=1761103041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UAYC8XZOapAdIGslkNfv0MnBEhGl58g6zptcvxFMsY=;
        b=TuCeH7eMiGJ28B08xzG05U4DFoKZXIHzpWZpv9QLWK49RH4lRtjM/flFnZ6d28M66L
         G2pyiyF9oBwovqS6WOnhcQEDPm80CuX8/Bimw+EBkEiWgat3BtEfAky+bCNK2tUz8hPY
         0rv51B11pQy4vqC/HIElVjJDiYeIWJO2kAQGd8C1xKV9IoVHXBLqJ2STDRSKX4bNBmFu
         8PEuyMPXepMXBFErNC6D4YVsRGT0idjdm0YQhJebZ3kxJfWgxx7mu9hhuKM5m+pBLCyf
         3jtq26ZE6GNkKwKoyaLTX7qbd/0a5ntBYC1zZBkZyMuCzL+awhIL7H3BaMy7LL6LrOO8
         EC9w==
X-Gm-Message-State: AOJu0YzOkrdUkGc1IRJK0PTP2lwRh7YWDqAq2bhiWQPeWvIdKBDiq1nY
	bKOLTF46Ehzv75gnPdRzvJdUDxRq8+x29eZlcRPWGCKn54HK1MyTcVLvRkf+Vvq5YWQRM8/cHkT
	StySjcJboCc4xeWUu537qAMPoiCzqExvBfmtB4HgfBCFccfg51mIjz6PuQ4Tqx7U=
X-Gm-Gg: ASbGnctMRcEFSc3AbOlSUUlmYBpLNZabmdOlDt8Gk9QeO2llns2FJxxx6c1bTd71a8d
	F0LggptzmAkNr1ST4b2WfOuLLCkz3OwmCaE1xhkszrsO2d1nwFJkVdlpvdOPORj6sRUcN7x0KUD
	/eN7iYl4Zu+JIv6WCZ9ucYlHN+8UMy2scj9Xg1A6WbKYANRRctvy7obM8D71fclqj9raUmld6Vg
	1pWn7RF0hzv0Z+4Bd2Br3UEQiDp9qLgwcWqJfx91D8TeVM34BAd48IH5BPcyQDRm7HWMcCdk0J/
	0pGZuiCq9o36vFWAJPkzM+/xTQW6uP6OzGyV8E5FRgkQqLamU8TvYv+4uFesCz2iPJ+7LyUhYL2
	KcJGId+OQ/2RqF+lG07uEhiQiSpI50KcufHc=
X-Received: by 2002:a17:902:f64d:b0:27d:6777:2833 with SMTP id d9443c01a7336-290272e1cb3mr334523735ad.47.1760498241026;
        Tue, 14 Oct 2025 20:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxCCtupf0AwQhQZ0njtfPCJ2MZQQSKAfVp9ujpBXzGdvRclHdjEwejxG1jW4b94TQOYMHR3Q==
X-Received: by 2002:a17:902:f64d:b0:27d:6777:2833 with SMTP id d9443c01a7336-290272e1cb3mr334523375ad.47.1760498240576;
        Tue, 14 Oct 2025 20:17:20 -0700 (PDT)
Received: from [10.133.33.56] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6de2sm180043285ad.18.2025.10.14.20.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 20:17:20 -0700 (PDT)
Message-ID: <ba63c3e9-df0c-4309-9de0-253a41569925@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 11:17:14 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: qcom: camss: Add Kaanapali support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <30f9292e-e6d3-4fd0-8d1c-f10317ca7751@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <30f9292e-e6d3-4fd0-8d1c-f10317ca7751@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lhyq5eVHurw4enfUsEbIcfWuGCzMlF2-
X-Proofpoint-ORIG-GUID: Lhyq5eVHurw4enfUsEbIcfWuGCzMlF2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX8bal5kmeB2vv
 ctRzHuu5VdYS3vqdw3OT915u9Bvc8c4sg+XvK1FJSNTYqYMWzBRc5KBBCrhpZX1S8rYKcYq8zjD
 luPMewW+KQicIgDobV6evNKs5Ch0ZIbW8wKJoq+lyX7US+vPB3ftvyvy9YGbZ+xvNiPKXEm6vNa
 T16B8GLID6rfKnbzKPnI7ZbgMid2oJ5+IySDNXWyr7boxCWIkvlgSKBfL9j7nYoJ7KFkbZRJGQN
 hh3qlmOBz4Sv2dBfiVnkXFaRL8CCT0Z9+WvlPEgN3WaoXhnKtj1sG+8dCWOWJngT3RePx+PIxBH
 opDE42X9w8DJlGu8R1E4hEp74WsbPJE1l+1s1oeD24unnacfiMK2jjCBEerbtMWOqHVDmW5oC+o
 vLXghqzHCfMhvzdKi17IxGw7C6kr6g==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ef1242 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=v1UKZosia19T5iwvbEQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017

On 9/26/2025 6:48 AM, Bryan O'Donoghue wrote:

> On 25/09/2025 01:02, Jingyi Wang wrote:
>> Add support for the RDI only CAMSS camera driver on Kaanapali. Enabling
>> RDI path involves adding the support for a set of CSIPHY, CSID and TFE
>> modules, with each TFE having multiple RDI ports.
>>
>> Kaanapali camera sub system provides
>>
>> - 3 x VFE, 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID
>> - 2 x CSID Lite
>> - 6 x CSI PHY
>>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> How has this series been tested ?
>
> ---
> bod 
Will update in next revision

