Return-Path: <linux-i2c+bounces-14331-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630EC90EF3
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 07:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBC803A956F
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Nov 2025 06:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F6A2C3278;
	Fri, 28 Nov 2025 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nHYe7ClA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fW2kBW8G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F3E2C0286
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764310937; cv=none; b=CpztZ2X4pTt8iOoa5Gqb+lf9PrGP7wKVgbT0YjgQ5QgbNVzF/AAOPM7CFRliDmKsw44+Uj/A3gw6V6bsqUiKDGZySr5hLckLUVTMT4nZmr9Tw23aljJE49VHYmWaR098WGXM4Ll4blJPHDOKOk8qb05vKNnK2bkBjKtuHEnJdoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764310937; c=relaxed/simple;
	bh=BracIS+Xd6atAPw30XiCJB91DEGb12idVZhaKsfMj1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErIUzgHCX/Eyh69DZ/K2DTA6q/+DeszNTsQPwhSshXCvwgW7e/5PRPYBXKVFuP02ETTN89OWnVXNxGdm6aeRsNKG33VSwq9jH2JshANQ/f0plHcPZARk9KjbsrkFB92g5Bjt8mgY2Raoif7M1D4MM/680xHpDnvnaIF5OHh1GN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nHYe7ClA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fW2kBW8G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS2KOLD288811
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 06:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yXfC5bxB35EN6mnVCYtR6QZAZwZl0nfuVLSX/8xWrJo=; b=nHYe7ClAbOdDllCt
	2JxLWZ5iCUn9cVccaWSnkNQtIPX1BFfQL18cheIfcMjWtAe9sdOyMv4/WVIS21d5
	mdEDlxEzsXOs2EPyFDZGDe6jxlLTzsGcDMU8R2gd15zh9s9Z9un554Jxg9XxQyEa
	DlroxMEJy60PUxApPElErE9koZeOpTUpd8HWnPgwG6/KpBd+cx+2fhAwN40nziQG
	IAvNr2XkvaArYZvCv7dL6B9PH6kUkmS9Zm+Hej0BNik2chCZMto5Mc1BCxpXaarz
	/Y/lUu3rwvi8NIRg8ntksf+TJkPZWRdyAnWKh8+XKIbepekjcuh4hiFkw+PcXwDU
	7TOrpA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmvxj9ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 28 Nov 2025 06:22:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b895b520a2so1433653b3a.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 22:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764310933; x=1764915733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yXfC5bxB35EN6mnVCYtR6QZAZwZl0nfuVLSX/8xWrJo=;
        b=fW2kBW8GFQyk3YiKPSNp5Vav18VgYh5Xqxx3I6QHAeaC4M9g/uCOxCikUNALWYcv9u
         IjBkaT48y6DUcHL8SKuor4G+LfkR3/Nxllt/yZp8kla98hPLiNrB8gHP62cnHJ3G8NSJ
         qWQyI7Xwhf9VZXIBTJC8eYdiWplkBN6hV1l/ftrAZQLRhvUnI3WWC39tqI5GPI8i0hyn
         03eVPxpB84gYVaII0zuFahUU+W1qAb+rrBjz/m+L2ucBYMdw/XsekM4QJsDL6x37Fdzh
         oCX7xIbR8vj0ViA4RyBcX8W2srmliaddVhFUsncGJ+5mjDDcPDimYpIdveUVftn5hdPq
         CuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310933; x=1764915733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXfC5bxB35EN6mnVCYtR6QZAZwZl0nfuVLSX/8xWrJo=;
        b=FlFYj8x1JAruec6vMGJhKx3Jt38z/2tnEYZ7qME3VQ8K5pD6qvlzJvfFJI3JSDqJFh
         1yDPCGgotHoJg2xMYY2bujPJCJRW+mUTY4SnzMMy8WKqR4JPvnUeyTyjVwbTkPQE9uBW
         N7uOWz1c5IXGtRBdARlUFfKl3WlaosUyKGYpkmv1eF0gtAr98K8EuS9zItNCPpwP9L0D
         UtaoE28B18QwUDpq+g2zQr9sGUhOUIOvAAbnqGgvox9EXqC2uWYT3wzTRjt4Usb2FXDx
         sViTQPEvQP31BP1JrtIq/gD10RJlHBdRtyXUZPynoTF/t/NfeweCYwHyOQRRY4Q0u4Co
         KAMg==
X-Forwarded-Encrypted: i=1; AJvYcCXHpyPVF1quw4E7mPYqxKvAcS0+1v4rm5j/LigYModjrm1crPh/dIw9lHlCaonlBKpoPF2u4zyY37I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz14eH3OzYVoS0nh6uMpMni5ykFpFXvB4CD4e4L8rps3vJ3QUmp
	H7Ms6QHi0vnN+7bNnLL7HCCWvuCl9x24hE8EOxMvrnYnhz7up7/cDM66SmwDeWigYV4rTqQDbJF
	xQEGa9DwamYXgkfSMkNx/V8RZx59NMGu+HQKcLBQl6R/MCTEfstnrETLHrnISVN4=
X-Gm-Gg: ASbGncuqzFMRkEB0bPqh6FaqfuKP50Sk6hQjvrgxvI+mFl6JCbhO8qOcnIFvZrYIDz+
	2pbBrd5RaezvA5apKLxkjURWas/ti46BVw7lku6BRt6knJV9OusTsV4GFlQJ3r/MqqlxQ+ANT5/
	PugzUk82mbnqZ2uoIExhAnxT670s6/pSwPSe9Tu6w728ZyloiO6AzVCxaQ638tzvoEwkJC7aGGA
	sY1eMnDcPsj4W8wPHJaEV/aaa/Y31iLwjlOR1AETT2BRDM1AmqWst26jc1SeJzu0ly2NcHlLIgZ
	WtSILZtnzJ+WmN4xKzfIqyVVHjTXqX8BIvmoC0SpDnLh8uIhNiSOipJCPgGRSzGaLfxaQ9Gdi56
	tfb/9TlXdyJvAFhFSAmwyRPTqvOHsOOuw7d3qDuFmng==
X-Received: by 2002:a05:6a00:2407:b0:7bf:1a4b:1665 with SMTP id d2e1a72fcca58-7ca8926ec0amr14748319b3a.15.1764310933384;
        Thu, 27 Nov 2025 22:22:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGO1liUQm+jpYlRcSQC7wCYR26ocA5dXrSjhrHaQRqRf3O3NL4JXaBUvC6b2Piipwj9zZ5PNg==
X-Received: by 2002:a05:6a00:2407:b0:7bf:1a4b:1665 with SMTP id d2e1a72fcca58-7ca8926ec0amr14748272b3a.15.1764310932697;
        Thu, 27 Nov 2025 22:22:12 -0800 (PST)
Received: from [192.168.1.4] ([49.204.106.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e6e6df9sm3720818b3a.39.2025.11.27.22.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 22:22:12 -0800 (PST)
Message-ID: <15a28ddc-9883-42d5-a008-b2ea22d8becc@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 11:52:05 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/12] i2c: qcom-geni: Isolate serial engine setup
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
        quic_arandive@quicinc.com, quic_shazhuss@quicinc.com
References: <20251122050018.283669-1-praveen.talari@oss.qualcomm.com>
 <20251122050018.283669-9-praveen.talari@oss.qualcomm.com>
 <ar5t2wdmxzvog7smlwbg3skg6ga35au6uiahfe3rlnmumlmpyr@572sf6ru6424>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ar5t2wdmxzvog7smlwbg3skg6ga35au6uiahfe3rlnmumlmpyr@572sf6ru6424>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=69293f96 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=knFCEH6M0+SSkFC620ieTA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HUEr38yWfXq3XK2hY-kA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: nA7D9vv5LhQkialbykICpZMr0zzSKCtx
X-Proofpoint-ORIG-GUID: nA7D9vv5LhQkialbykICpZMr0zzSKCtx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA0NCBTYWx0ZWRfX/aI6wnLfCz9Z
 BB2XYFtW3jGV7H+2uayWSXoLXEM8mGxZ47Y8xOWUifmzGn71T5+pFi0rVXMIfTd0n+aydjjpH83
 1EMPBSwSKn77kLa/8XCxQ9VfmtuDfDq1QnnTaZclMd4ok9D4gvUhfEmCnwn379RFlJiatlIUb76
 n1ywW9lGLtoBaYe3/emmZZyMNTAwjooSZPEOnQf8Weblmq0PLoCKw861wG6FJkj3K72CnMeppxA
 YGMEPOnDpdHW/FJbn0G5algUiXNuYtQhl85tWDZHkS6ydPs2mV00CY0DXAVcloZS3/Umq7jmiDB
 jjKSyse062B4jUaPyx/pnpocRHNX3M7dP5e2Ya70DT+c+hZJkTY6TE13kzx8QmwRH0qa1ksTBDC
 zHndN1o5wUKfae9yREOVI6NTNRo3TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280044

Hi Bjorn,

Thank you for review.

On 11/26/2025 9:00 PM, Bjorn Andersson wrote:
> On Sat, Nov 22, 2025 at 10:30:14AM +0530, Praveen Talari wrote:
>> Move serial engine configuration from probe to geni_i2c_init().
>>
>> Relocating the serial engine setup to a dedicated initialization function
>> enhances code clarity and simplifies future modifications.
> 
> Please enhance commit message clarity. I don't think "code clarity" is
> your most significant reason for this change, and "simplifies future
> modification" is completely vague.
> 
> Be specific, the reader of this commit message hasn't implemented the
> next set of commits, so they don't understand why this helps.
> 
> If the reason is that this simplifies the error handling around the
> resource acquisition in the next patches, write that.
> 
> If my guess is wrong and the sole reason for you change is that you
> don't like 179 lines long functions, then just say that.
> 

Moving the serial engine setup to geni_i2c_init() API for a cleaner
probe function and utilizes the PM runtime API to control resources 
instead of direct clock-related APIs for better resource management.

Enables reusability of the serial engine initialization in future use 
cases like hibernation and deep sleep features where hardware context is 
lost.

I hope the commit text above should be appropriate.

Thanks,
Praveen

> Regards,
> Bjorn
> 
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 148 ++++++++++++++---------------
>>   1 file changed, 73 insertions(+), 75 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 3a04016db2c3..4111afe2713e 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -976,10 +976,75 @@ static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
>>   	return ret;
>>   }
>>   
>> +static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>> +{
>> +	const struct geni_i2c_desc *desc = NULL;
>> +	u32 proto, tx_depth;
>> +	bool fifo_disable;
>> +	int ret;
>> +
>> +	ret = pm_runtime_resume_and_get(gi2c->se.dev);
>> +	if (ret < 0) {
>> +		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	proto = geni_se_read_proto(&gi2c->se);
>> +	if (proto == GENI_SE_INVALID_PROTO) {
>> +		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
>> +		if (ret) {
>> +			dev_err_probe(gi2c->se.dev, ret, "i2c firmware load failed ret: %d\n", ret);
>> +			goto err;
>> +		}
>> +	} else if (proto != GENI_SE_I2C) {
>> +		ret = dev_err_probe(gi2c->se.dev, -ENXIO, "Invalid proto %d\n", proto);
>> +		goto err;
>> +	}
>> +
>> +	desc = device_get_match_data(gi2c->se.dev);
>> +	if (desc && desc->no_dma_support)
>> +		fifo_disable = false;
>> +	else
>> +		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>> +
>> +	if (fifo_disable) {
>> +		/* FIFO is disabled, so we can only use GPI DMA */
>> +		gi2c->gpi_mode = true;
>> +		ret = setup_gpi_dma(gi2c);
>> +		if (ret)
>> +			goto err;
>> +
>> +		dev_dbg(gi2c->se.dev, "Using GPI DMA mode for I2C\n");
>> +	} else {
>> +		gi2c->gpi_mode = false;
>> +		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>> +
>> +		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
>> +		if (!tx_depth && desc)
>> +			tx_depth = desc->tx_fifo_depth;
>> +
>> +		if (!tx_depth) {
>> +			ret = dev_err_probe(gi2c->se.dev, -EINVAL,
>> +					    "Invalid TX FIFO depth\n");
>> +			goto err;
>> +		}
>> +
>> +		gi2c->tx_wm = tx_depth - 1;
>> +		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
>> +		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
>> +				       PACKING_BYTES_PW, true, true, true);
>> +
>> +		dev_dbg(gi2c->se.dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>> +	}
>> +
>> +err:
>> +	pm_runtime_put(gi2c->se.dev);
>> +	return ret;
>> +}
>> +
>>   static int geni_i2c_probe(struct platform_device *pdev)
>>   {
>>   	struct geni_i2c_dev *gi2c;
>> -	u32 proto, tx_depth, fifo_disable;
>>   	int ret;
>>   	struct device *dev = &pdev->dev;
>>   	const struct geni_i2c_desc *desc = NULL;
>> @@ -1059,79 +1124,19 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = clk_prepare_enable(gi2c->core_clk);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = geni_se_resources_on(&gi2c->se);
>> -	if (ret) {
>> -		dev_err_probe(dev, ret, "Error turning on resources\n");
>> -		goto err_clk;
>> -	}
>> -	proto = geni_se_read_proto(&gi2c->se);
>> -	if (proto == GENI_SE_INVALID_PROTO) {
>> -		ret = geni_load_se_firmware(&gi2c->se, GENI_SE_I2C);
>> -		if (ret) {
>> -			dev_err_probe(dev, ret, "i2c firmware load failed ret: %d\n", ret);
>> -			goto err_resources;
>> -		}
>> -	} else if (proto != GENI_SE_I2C) {
>> -		ret = dev_err_probe(dev, -ENXIO, "Invalid proto %d\n", proto);
>> -		goto err_resources;
>> -	}
>> -
>> -	if (desc && desc->no_dma_support)
>> -		fifo_disable = false;
>> -	else
>> -		fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
>> -
>> -	if (fifo_disable) {
>> -		/* FIFO is disabled, so we can only use GPI DMA */
>> -		gi2c->gpi_mode = true;
>> -		ret = setup_gpi_dma(gi2c);
>> -		if (ret)
>> -			goto err_resources;
>> -
>> -		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
>> -	} else {
>> -		gi2c->gpi_mode = false;
>> -		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
>> -
>> -		/* I2C Master Hub Serial Elements doesn't have the HW_PARAM_0 register */
>> -		if (!tx_depth && desc)
>> -			tx_depth = desc->tx_fifo_depth;
>> -
>> -		if (!tx_depth) {
>> -			ret = dev_err_probe(dev, -EINVAL,
>> -					    "Invalid TX FIFO depth\n");
>> -			goto err_resources;
>> -		}
>> -
>> -		gi2c->tx_wm = tx_depth - 1;
>> -		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
>> -		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
>> -				       PACKING_BYTES_PW, true, true, true);
>> -
>> -		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
>> -	}
>> -
>> -	clk_disable_unprepare(gi2c->core_clk);
>> -	ret = geni_se_resources_off(&gi2c->se);
>> -	if (ret) {
>> -		dev_err_probe(dev, ret, "Error turning off resources\n");
>> -		goto err_dma;
>> -	}
>> -
>> -	ret = geni_icc_disable(&gi2c->se);
>> -	if (ret)
>> -		goto err_dma;
>> -
>>   	gi2c->suspended = 1;
>>   	pm_runtime_set_suspended(gi2c->se.dev);
>>   	pm_runtime_set_autosuspend_delay(gi2c->se.dev, I2C_AUTO_SUSPEND_DELAY);
>>   	pm_runtime_use_autosuspend(gi2c->se.dev);
>>   	pm_runtime_enable(gi2c->se.dev);
>>   
>> +	ret =  geni_i2c_init(gi2c);
>> +	if (ret < 0) {
>> +		dev_err(gi2c->se.dev, "I2C init failed :%d\n", ret);
>> +		pm_runtime_disable(gi2c->se.dev);
>> +		goto err_dma;
>> +	}
>> +
>>   	ret = i2c_add_adapter(&gi2c->adap);
>>   	if (ret) {
>>   		dev_err_probe(dev, ret, "Error adding i2c adapter\n");
>> @@ -1143,13 +1148,6 @@ static int geni_i2c_probe(struct platform_device *pdev)
>>   
>>   	return ret;
>>   
>> -err_resources:
>> -	geni_se_resources_off(&gi2c->se);
>> -err_clk:
>> -	clk_disable_unprepare(gi2c->core_clk);
>> -
>> -	return ret;
>> -
>>   err_dma:
>>   	release_gpi_dma(gi2c);
>>   
>> -- 
>> 2.34.1
>>

