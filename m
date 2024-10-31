Return-Path: <linux-i2c+bounces-7688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6A89B82CE
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 19:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FC6D1F22B76
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 18:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192B014264A;
	Thu, 31 Oct 2024 18:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fDGQLDhr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB98146580;
	Thu, 31 Oct 2024 18:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730400375; cv=none; b=OO058kzkbZ55S7vCBWni2P6pQc0KT+Jbcc1MPnDVxc1TXO2CwA7Cz2tSAFmpK425JfonYgjXjYtNS7Maxo8IM1f1MHaiQn9FD/s5zYGz9OD94icqoksvGSRb9UUYLNWxbJlVGn8fQNljCVFMe5f9afUxTYci46uupWwNryZbSPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730400375; c=relaxed/simple;
	bh=HpCgPvyq3D1zQCsDBCFTe5UMcNjGH31+kISIMtSvCRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qId4gKvtCwU0cOm+nU5Mz55XW7aocGtIWcwPZzoYe958W+37FcZCicrEXIKOswBeZuBjlgAOt3PLk+m6HqMzTE0VIABHcaBGStH/XS/si9Us3nCWMbHVSzpmAqtItDQHV2mua7z9oRuUry2VV1O+zftCWyWgIBuV88YOY75mMtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fDGQLDhr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VAj1pM013825;
	Thu, 31 Oct 2024 18:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mm/Oe0pdbfm+c0D+7q07xGwwgCfSZzA7iOSzYxAoNaE=; b=fDGQLDhrX6C3dkyF
	nBjtJjPm8zRih7MUjJb2ddJEqLfDuEDgJfItimvuclErgqPcC5fg9i1ofrvJk4MG
	ohTIFC6rt7vzE3KlLSqxCjzgC/GVuaUybGUhlsksPwq4H53pAq3354rkt3Tsjgr8
	hhQy6jSkESWp2KxdWpr0gC1Oet7juPDvkfFVtmhg7cisxbmqV4dKzkMNvKuz3UFP
	J0kSEh+vicYJJOKmM/D1ZBZ4DJdGzvYzSzjLPBjjcIyfX2lUXA5PNIqvPT5xePx6
	i/XJVlmV6841mh3S1BZPkgy6zRiXyqRy1BfmyvSmhNjCnfWTADTe8yjb4o80B2DT
	m5ijnQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ky6raus2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 18:45:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VIjukp030495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 18:45:56 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 11:45:55 -0700
Message-ID: <92217ec6-c21c-462a-a934-9e93183c1230@quicinc.com>
Date: Thu, 31 Oct 2024 11:45:53 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] i2c: skip of_i2c_register_device() for invalid child
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <swboyd@chromium.org>, <airlied@gmail.com>,
        <quic_jesszhan@quicinc.com>, <lyude@redhat.com>, <simona@ffwll.ch>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241030010723.3520941-1-quic_abhinavk@quicinc.com>
 <CAA8EJppKou84MZm0JS_4bPveMO2UxpMs5ejCoL7OMWd-umtDmQ@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppKou84MZm0JS_4bPveMO2UxpMs5ejCoL7OMWd-umtDmQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oo3HTONEWP1LQges7eK9XE9x0b5G-9GR
X-Proofpoint-ORIG-GUID: oo3HTONEWP1LQges7eK9XE9x0b5G-9GR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310142



On 10/31/2024 11:23 AM, Dmitry Baryshkov wrote:
> On Wed, 30 Oct 2024 at 03:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> of_i2c_register_devices() adds all child nodes of a given i2c bus
>> however in certain device trees of_alias_from_compatible() and
>> of_property_read_u32() can fail as the child nodes of the device
>> might not be valid i2c client devices. One such example is the
>> i2c aux device for the DRM MST toplogy manager which uses the
>> display controller device node to add the i2c adaptor [1] leading
>> to an error spam like below
>>
>> i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
>> i2c i2c-20: of_i2c: modalias failure on /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
>> i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/ports
>> i2c i2c-20: of_i2c: register /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
>> i2c i2c-20: of_i2c: invalid reg on /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
>> i2c i2c-20: Failed to create I2C device for /soc@0/display-subsystem@ae00000/display-controller@ae01000/opp-table
>>
>> Add protection against invalid child nodes before trying to register
>> i2c devices for all child nodes.
>>
>> [1] : https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/display/drm_dp_mst_topology.c#L5985
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> ---
>>   drivers/i2c/i2c-core-of.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/i2c/i2c-core-of.c b/drivers/i2c/i2c-core-of.c
>> index a6c407d36800..62a2603c3092 100644
>> --- a/drivers/i2c/i2c-core-of.c
>> +++ b/drivers/i2c/i2c-core-of.c
>> @@ -86,6 +86,8 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>>   {
>>          struct device_node *bus, *node;
>>          struct i2c_client *client;
>> +       u32 addr;
>> +       char temp[16];
>>
>>          /* Only register child devices if the adapter has a node pointer set */
>>          if (!adap->dev.of_node)
>> @@ -101,6 +103,10 @@ void of_i2c_register_devices(struct i2c_adapter *adap)
>>                  if (of_node_test_and_set_flag(node, OF_POPULATED))
>>                          continue;
>>
>> +               if (of_property_read_u32(node, "reg", &addr) ||
>> +                   of_alias_from_compatible(node, temp, sizeof(temp)))
>> +                       continue;
> 
> I think just of_property_read_u32() should be enough to skip
> non-I2C-device children. If of_alias_from_compatible() fails, it is a
> legit error.
> 

Thanks for the review.

of_alias_from_compatible() looks for a compatible string but all child 
nodes such as ports will not have the compatible. Hence below error will 
still be seen:

i2c i2c-20: of_i2c: modalias failure on 
/soc@0/display-subsystem@ae00000/display-controller@ae01000/ports

>> +
>>                  client = of_i2c_register_device(adap, node);
>>                  if (IS_ERR(client)) {
>>                          dev_err(&adap->dev,
>> --
>> 2.34.1
>>
> 
> 

