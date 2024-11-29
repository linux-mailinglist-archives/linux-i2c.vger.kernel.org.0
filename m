Return-Path: <linux-i2c+bounces-8257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 117E19DC19B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 10:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63186B2299B
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 09:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E5117A90F;
	Fri, 29 Nov 2024 09:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bsSSD7Ri"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27E165EED;
	Fri, 29 Nov 2024 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873441; cv=none; b=fxGrix/O4ZLun4W1IbqBCnopK75mYDenn/N8h2OXaUalToNZZ7NoNkYDZk7miqEq9ncLXEriPXBOPj5rmg9RfOrlET/MV8gbETTmsp0LQEnz0CsvIEiKfDs7yPMX4sfJhgwpoDjPbrk3s7lLdorBLPtsS+65QgDOBqvsMtd84Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873441; c=relaxed/simple;
	bh=icqs1w9LL7qajOL+gpc61iCL/Gz9usCSC33by1uMk7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RUHKRKfLQ+VRPzmPrMMUB/dkbrzQyN8lzOSUzbksAdG6YC2F4PeBlLRmJ6HaDpJIQR3kcLsVXo8J0lEv/SJ7/B6+GU+jMYbvYFbJLTeSpyS1Lm8D76pRpfvW+hq9YmNN5PhEofw/6u3GI0+6N1d/6VRife/4jlRSkgMaKBpO/zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bsSSD7Ri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT83vaN004494;
	Fri, 29 Nov 2024 09:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtdtYxt7yTx0KLUyvnV//EGcEUs43332Pgjx121kuL0=; b=bsSSD7Ri3plJQvi8
	zPj4mIWtdu97ZjIE7lhs7J86zAit3tcHWzAD7bb8TSWxWyR3QxfdyXXiK4+tpl/f
	JS8STX0l4sqKTN6ujsc5mHJ4vFFdr6HFPDlXu+3Yo9qknR2Z5vPHm5J5YWtigDXx
	FEP4z4slksOb/pzMTWk1emwokXSs8bw5AuX03l04qUzySIc+C0CKXBKYdzX/jMAL
	NNAmp1CnVi60wRVItvNUg8C09mQo2F9Ararp/FrrpF+APVRrwn3ukYJoEUGGalAC
	/4Wg9dBkMsYfmRrF78IYAQK+XmwCniUg5dCX5vniYzWulC3wT7epXzgAAW0uwgoE
	YFS+LQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4379s6r8fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 09:43:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT9hoKR025335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 09:43:50 GMT
Received: from [10.216.24.185] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 01:43:46 -0800
Message-ID: <a52483fb-d8ea-4dfd-9d29-5270376de1d9@quicinc.com>
Date: Fri, 29 Nov 2024 15:13:43 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] i2c: i2c-qcom-geni: Update compile dependenices
 for I2C GENI driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Sumit
 Semwal" <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
References: <20241121130134.29408-1-quic_jseerapu@quicinc.com>
 <20241121130134.29408-4-quic_jseerapu@quicinc.com>
 <zfkhbjm6wrmcocqcvluov3nbrpb2ozbo52c6nlwxro44gublcw@5645ksz4cfm2>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <zfkhbjm6wrmcocqcvluov3nbrpb2ozbo52c6nlwxro44gublcw@5645ksz4cfm2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 42OQXquwmQrh0AN9gU47rFgN46NHDaud
X-Proofpoint-GUID: 42OQXquwmQrh0AN9gU47rFgN46NHDaud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290079



On 11/22/2024 3:40 AM, Dmitry Baryshkov wrote:
> On Thu, Nov 21, 2024 at 06:31:34PM +0530, Jyothi Kumar Seerapu wrote:
>> I2C functionality has dependencies on the GPI driver.
>> Ensure that the GPI driver is enabled when using the I2C
>> driver functionality.
>> Therefore, update the I2C GENI driver to depend on the GPI driver.
>>
>> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
>> ---
>> v2 -> v3:
>>     - Moved this change to patch3.
>>     - Updated commit description.
>>
>> v1 -> v2:
>>     -  This patch is added in v2 to address the kernel test robot
>>        reported compilation error.
>>        ERROR: modpost: "gpi_multi_desc_process" [drivers/i2c/busses/i2c-qcom-geni.ko] undefined!
>>
>>   drivers/i2c/busses/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index 0aa948014008..87634a682855 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -1049,6 +1049,7 @@ config I2C_QCOM_GENI
>>   	tristate "Qualcomm Technologies Inc.'s GENI based I2C controller"
>>   	depends on ARCH_QCOM || COMPILE_TEST
>>   	depends on QCOM_GENI_SE
>> +	depends on QCOM_GPI_DMA
> 
> So... without this change the previous patch is broken, which is a
> no-go. And anyway, adding dependency onto a particular DMA driver is a
> bad idea. Please make use of the DMA API instead.

Sure, thanks for the details. In V4, will withdraw these changes.
> 
>>   	help
>>   	  This driver supports GENI serial engine based I2C controller in
>>   	  master mode on the Qualcomm Technologies Inc.'s SoCs. If you say
>> -- 
>> 2.17.1
>>
> 

