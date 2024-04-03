Return-Path: <linux-i2c+bounces-2740-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 713C28964C7
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 08:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CC62283EB1
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 06:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB1844C76;
	Wed,  3 Apr 2024 06:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FOz+Xrox"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99071757A;
	Wed,  3 Apr 2024 06:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712126774; cv=none; b=ZsIQ4tzvRDJJ2fFbUTyTQdVuY/g79wafi1ApZcakBmHPyh48nWT+FqZVhKNFyFlOvl+jeYQUvxlSvyzkRi1uc8nYQJEZZyza0yLhmMWC8xTV/ixIemvus0Hf2Un2oUBJRQaR+SV3ITA0MkFMaw2D+BEgBx1zl3msHewtW5nITZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712126774; c=relaxed/simple;
	bh=u71B/NuESvaUS9XPFvxOLkWOdGSwgWiD4+t5FnBk41w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YY0nbrwKdQRPMni+ZFFs/wLMgSLKdzm3QqluRi0nep1tQ7LrVBIcPsu7XePugMJy50Uj8QCxRpJaKdnxv8uImKG2DTlCVmj4wOkG5M1BZQ091Bo1X2nOLGPPnUrJjmBiqyczvDS9cpWka5EEJTE3CAAwqkVpf9H8/QLe/Z/2QBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FOz+Xrox; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4335uRiF022989;
	Wed, 3 Apr 2024 06:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=V4gKdPA3bLrR7ftfrmRs9B6lyil3hKJom2PQtBnnE+o=; b=FO
	z+XroxXp/2KRcM6Hhmjl6KATa8Eicj3/E7j0sOdJdPGWnj1b7WtVLxrT4lHwE5MY
	koujeEowisqb6UtTDXcJ1mOOzBqFNXeGgjoBMOAMZL9bbSVDG9KcLJODdZAo6vy9
	zmnsoNO3RqeXdueNB6oW1+FXt4Divgl7N0/QNxRqQzvaVa/t9ZXeu+H/ywIqXCQk
	D0idlqDgIOH60ET5kt7o84QeGVPo0N1tCYxDWqCL8EhhEx3/A3jLNXYroQv9vYk0
	aXl97nUzevToegQ8/VhcbIllv6y55E7VituseIazzPXicp/cTktThoYC3dy0iysX
	Rz5sOe7RL6Q5NoUrufkw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ny5hda8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 06:46:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4336k7qk009642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 06:46:07 GMT
Received: from [10.218.22.190] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 23:46:03 -0700
Message-ID: <c805ff2a-8056-49a8-90b7-814c7a973d72@quicinc.com>
Date: Wed, 3 Apr 2024 12:16:00 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>, <wsa@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <quic_vdadhani@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
 <ZgbwJAb7Ffktf554@matsya>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <ZgbwJAb7Ffktf554@matsya>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rHJgA76S2Y7MaYlhvr_VQ2Tob5M477HB
X-Proofpoint-ORIG-GUID: rHJgA76S2Y7MaYlhvr_VQ2Tob5M477HB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_05,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=962 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404030043

Hi Vinod,

On 3/29/2024 10:15 PM, Vinod Koul wrote:
> On 28-03-24, 08:36, Andi Shyti wrote:
>> Hi
>>
>> On Wed, 13 Mar 2024 10:56:39 +0530, Mukesh Kumar Savaliya wrote:
>>> I2C driver currently reports "DMA txn failed" error even though it's
>>> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
>>> on the bus instead of generic transfer failure which doesn't give any
>>> specific clue.
>>>
>>> Make Changes inside i2c driver callback handler function
>>> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
>>> stores the error status during error interrupt.
>>>
>>> [...]
>>
>> Applied to i2c/i2c-host-next on
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/local tree
> 
> You applied changes to dmaengine driver without my ack! I dont agree to
> the approach here, we could do better
> 
Could you please suggest changes OR approach related comments ? So i can 
make a new change which can clean the merged code ?  Hope that can 
address the concerns.

