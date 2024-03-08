Return-Path: <linux-i2c+bounces-2272-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF0F875DCA
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 06:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5071AB20ECA
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 05:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DE932C9C;
	Fri,  8 Mar 2024 05:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XzVibmSv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C21B2564;
	Fri,  8 Mar 2024 05:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709876612; cv=none; b=gjceCudE0slbdtHp/G+hVzjrrEbJaNHy+xuNRht71sJBduZzNarjpF88ZiOPl/aaIpgFWJ/mijJVbKXw0Xl96hgE6Yt2cr/A0Jm2W6VKXtGqHs+NbmpqRm1cjrx+1Fyh2WFcFUkshF4wbZp157zcTzAfCS9AveotPGIHkgGbDFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709876612; c=relaxed/simple;
	bh=sZJ1rdk707vKoNzkaw+eRMJ9uw5RBuN0hPr+AtRP024=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d+tO/OMNhn+wA+RUkupAnbdoYnA5afhY5MLfaOo2exM3yBKWVS+IEQtvajMKB7+jtRNZc0TmsVREufEkumTdprYdorlB05FZZ6+eWfLAhr36X20sFW2HcgKRLzmzP+7A+sv3/UxaYEMezctu6wsvCVfozfuLPMRqFy9gIy1LxZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XzVibmSv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4280IhW5012661;
	Fri, 8 Mar 2024 05:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hBW0/JobW8mlK+ZTPhjJTLvOB59Mci3YgjCROfvXlCY=; b=Xz
	VibmSvRE0EscASljFDxui0sFpShczbW2yIlKCr1Ubn03FQ8V4ba1hsd5uF2Jfut1
	VCS6/XZCTxUhYIXoYiikFqm9fMn79ZnlrFWy+Vf27PQvhUxE/crAwpZiA1Of7tly
	sHUKItSJszldVI/vR2ClDrIpi86c2k+76Z3wEN4otPw5e+aVaSC2Uhnd3ASsKUy3
	VJVSOCg2nYNmAcSVNLhlDPdPq3gTIXT5xWENK/SHZdDymION7E8EyDpJ4JVovgJ0
	IvtJHPGDPHbyEU7+4WBxGuAMqRMBq3whmlyFiGd0GXCLVfxcSwYmWpGt7DCdjtpZ
	XNvM7eE3AS8oj+YiLNlw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wqn8n8v74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 05:43:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4285hP7h016540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Mar 2024 05:43:25 GMT
Received: from [10.216.43.112] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Mar
 2024 21:43:22 -0800
Message-ID: <9dbe987a-fdd1-4bec-b350-5936abf69b1b@quicinc.com>
Date: Fri, 8 Mar 2024 11:13:18 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>, <vkoul@kernel.org>,
        <wsa@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <quic_vdadhani@quicinc.com>
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
 <cmtru4nvoab6g5emp2yrxnvfpvtrcsuna6dqsyewpagg3qmkau@r2zoj6vgslet>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <cmtru4nvoab6g5emp2yrxnvfpvtrcsuna6dqsyewpagg3qmkau@r2zoj6vgslet>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QJZ4wP8DjNCk7R13WlBZ7D9Rm_1Ot2ni
X-Proofpoint-ORIG-GUID: QJZ4wP8DjNCk7R13WlBZ7D9Rm_1Ot2ni
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_04,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080044



On 3/8/2024 4:28 AM, Andi Shyti wrote:
> Hi Mukesh,
> 
> On Fri, Mar 08, 2024 at 02:25:39AM +0530, Mukesh Kumar Savaliya wrote:
>> I2C driver currently reports "DMA txn failed" error even though it's
>> NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
>> on the bus instead of generic transfer failure which doesn't give any
>> specific clue.
>>
>> Make Changes inside i2c driver callback handler function
>> i2c_gpi_cb_result() to parse these errors and make sure GSI driver
>> stores the error status during error interrupt.
> 
> funny note: this is half "imperative mood" :-)
> 
> A real imperative would be "Pares the error inside
> i2c_gpi_cb_result()... blah blah blah". No need to resend.
> 

  :-) Thanks !

>> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> 
> I still don't understand what's the fix here. You are making a
> generic DMA error to be more specific... where is the bug? What
> exactly is broken now?
> 
This is about being particular while reporting specific error.
Like i mentioned, instead of generic DMA transfer error, it should be 
particular error 1) NACK 2) BUT_PROTO 3)ARB_LOST.
Ofcourse when data transfer via DMA fails, it can be considered as
DMA Txfer fail.
In summary so far driver was considering all failure as txfer failure,
but i2c has errors which are kind of response/condition on the bus.

Sorry if it confusing still, but please let me know if anything required 
to be updated in  commit log which can bring clarity.

> Besides, keep in mind, that commits with fixes tags get
> backported to older kernels (this one dates back to 5.18) and you
> should also Cc the stable mailing list:
> 
> Cc: <stable@vger.kernel.org> # v5.18+

Sure, will add into CC. was waiting for reviewed-by tag.

> 
> Thanks,
> Andi

