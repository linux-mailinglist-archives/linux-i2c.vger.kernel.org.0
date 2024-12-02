Return-Path: <linux-i2c+bounces-8290-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8A09DFF34
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 11:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751B0280FD5
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 10:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F2F1FCCE4;
	Mon,  2 Dec 2024 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AON0inJV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8BC156C40;
	Mon,  2 Dec 2024 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733136259; cv=none; b=LBRxwWXafkiJ5SB3l9qJQupf9M9Q65rfjecRwEngaseNaid+84PNDm/RPDMCkhRvnGiOK4ujqSR8TB2BIKCanNTm4K2PZzdrmTdZzufLcm1SPlKij+/+EbVLnkc+H5cUAvQETFeK39CNX7Ysz5C/HytEl9M9y8Tus2mfs35ZJj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733136259; c=relaxed/simple;
	bh=4sKLhRnj/x4uCu5ixovaErdTt5e8IYVY2IDX1QxJYno=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UWIC8LmFDMBELYcE5DwNR4GL/+12FnLiIqb/IFCJy8XslD7huUBpgMDdGT5JnbSvGeRJotaO2d3aXcejIk1JiLOV6PIR+Xd0KTdO3HStdwcQfekjhK5CqFWziCVJ21YpKe54DdSeExz6nJGH8HTDO049Rs9eNV+gnjcoq5AgHr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AON0inJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B29J3M4008791;
	Mon, 2 Dec 2024 10:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIbZQqiUOZa7NHCTcnjS7+zXYV4ycmI9J9tUWIBbXIU=; b=AON0inJV67hC1Ysi
	ixGeDsa5ca3rSZbYcpe8ZXOLAm/SG4OPcTYfvz+ufoGdUHvsh6AgO3dQHSV6+Yr4
	YQq8KCwKjyP1m9SqiNkLv+vxaxGKNObfKwBqhG+8OshCTu4oZxaClrp8exi+1V3s
	EQV2/tVX/m9TUN8MXJtsOKE74xs4Smw+ULGf1hSc6QMaSg64xUUSFCbh4HfQ6bu7
	dviPI1McbTieb4rGx/SLwjLMy2sJSu4u6VT70CVo/JjQBN6oNk485XbvPxlXH9gf
	Zt75JpfVrm4rNA5gLvyTaVFIt3sx9hJV6LqRD3RLU+Nkrm1wSm9jQbABsNhwwG2S
	GjWG7g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437snqvjtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 10:44:08 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2Ai7i9002724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 10:44:07 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 02:44:02 -0800
Message-ID: <d49b16b2-95e5-42b4-9bc1-40cb0bfa15b1@quicinc.com>
Date: Mon, 2 Dec 2024 16:13:59 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] dmaengine: gpi: Add Lock and Unlock TRE support to
 access I2C exclusively
To: Vinod Koul <vkoul@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <quic_vdadhani@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-3-quic_msavaliy@quicinc.com> <Z01YBLcxDXI2UwXR@vaman>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z01YBLcxDXI2UwXR@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hzEH8zAEJZMpnmkmAE55X43yklyT2SVy
X-Proofpoint-GUID: hzEH8zAEJZMpnmkmAE55X43yklyT2SVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412020095

Thanks for the review comments Vinod !

On 12/2/2024 12:17 PM, Vinod Koul wrote:
> On 29-11-24, 20:13, Mukesh Kumar Savaliya wrote:
>> GSI DMA provides specific TREs(Transfer ring element) namely Lock and
>> Unlock TRE. It provides mutually exclusive access to I2C controller from
>> any of the processor(Apps,ADSP). Lock prevents other subsystems from
>> concurrently performing DMA transfers and avoids disturbance to data path.
>> Basically for shared I2C usecase, lock the SE(Serial Engine) for one of
>> the processor, complete the transfer, unlock the SE.
>>
>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>> TRE for the last transfer.
>>
>> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
>>
> 
> ...
> 
>> @@ -65,6 +65,9 @@ enum i2c_op {
>>    * @rx_len: receive length for buffer
>>    * @op: i2c cmd
>>    * @muli-msg: is part of multi i2c r-w msgs
>> + * @shared_se: bus is shared between subsystems
>> + * @bool first_msg: use it for tracking multimessage xfer
>> + * @bool last_msg: use it for tracking multimessage xfer
>>    */
>>   struct gpi_i2c_config {
>>   	u8 set_config;
>> @@ -78,6 +81,9 @@ struct gpi_i2c_config {
>>   	u32 rx_len;
>>   	enum i2c_op op;
>>   	bool multi_msg;
>> +	bool shared_se;
> 
> Looking at this why do you need this field? It can be internal to your
> i2c driver... Why not just set an enum for lock and use the values as
> lock/unlock/dont care and make the interface simpler. I see no reason to
> use three variables to communicate the info which can be handled in
> simpler way..?
> 
Below was earlier reply to [PATCH V3, 2/4], please let me know if you 
have any additional comment and need further clarifications.
--
 > Looking at the usage in following patches, why cant this be handled
 > internally as part of prep call?
 >
As per design, i2c driver iterates over each message and submits to GPI 
where it creates TRE. Since it's per transfer, we need to create Lock 
and Unlock TRE based on first or last message.
--
>> +	bool first_msg;
>> +	bool last_msg;
> 

