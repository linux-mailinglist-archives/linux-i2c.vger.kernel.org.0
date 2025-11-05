Return-Path: <linux-i2c+bounces-13961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D795C3518A
	for <lists+linux-i2c@lfdr.de>; Wed, 05 Nov 2025 11:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A56701899D72
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Nov 2025 10:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE279302CC1;
	Wed,  5 Nov 2025 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prQuvqIY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PT38v7l6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192FB3019C1
	for <linux-i2c@vger.kernel.org>; Wed,  5 Nov 2025 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762338519; cv=none; b=pi2Ycb9GUKupAIg2Dick9RTAb2dNZLkoY2CYhIa4UrB6fkmdCZ/oT/LKUg4IIsuwb08PNiks4CAXl7nBGKVjpyv3tvALONUihkdtdmNUn8dCQ1uaVU/6vXEGiMaC+fi7NyU7Lg9zY4F8AW0rkRgDKlXJ4mJHpWjz/cAhf0PcL9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762338519; c=relaxed/simple;
	bh=bHWQGXUwyp0HSxQyUXCn4pC6y2/RjEnuZm/vTzwzUis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8QHh9lflriwW5WktIVYx2gro7ywK1u1cSrJxTCZ4aNjnTri/5FKioFIl5SbdgEJbT9gWpxHTQgxypgclDNCxVhIgf4UzjADpx0eJpivy6+gr+TcsqAV7butHxKQqM+0kG+lc+xFAS1uAK3fqkpFw61RWGDOXw+mt/twHVGF3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prQuvqIY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PT38v7l6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A58F4Hk3091509
	for <linux-i2c@vger.kernel.org>; Wed, 5 Nov 2025 10:28:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JF+KpggyAZ/ITnvctK4l8SdHIQOwsXYkgFSK64qTgoI=; b=prQuvqIY2Amv7BYe
	cVEn7aZ5txx5vMjo3H/OZ/QYLOQJ2/BvymOuzcAhAesQg0BHcCGsi+dwuKsaQEoQ
	Cw2/QjIyobAfPE1576rdNBI3vH80JpvwLnh/MbqSFlNezHVsM49NhGfxqY0ILA0R
	vq/lGyY5bKiJAhO7d7ZhcXzuePYzfFN6ItFouYOAWskDar0pK7WMSu5CUUrfYTXx
	ouZfweq0n+i0bBRooAwE6KKrakOgnJmryOeMjZhVRLi/d9b3N+ivB72jD3BK3Tjk
	1up7kXC4a9WZK4t10QVgChHcl7jXXLSItX7jY8tgN4ZyVMGKVngGOMrodpi72iNl
	kFK+1w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5ea0x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 05 Nov 2025 10:28:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-336b646768eso7459296a91.1
        for <linux-i2c@vger.kernel.org>; Wed, 05 Nov 2025 02:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762338515; x=1762943315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF+KpggyAZ/ITnvctK4l8SdHIQOwsXYkgFSK64qTgoI=;
        b=PT38v7l6KPQDnln6ycL+gvRzsKo5gtbr2ymcN68mFCDKFeHS9Ti21ted3wu1KXYraR
         M9I8eq6vTt5/WiDXmJVYX+WRQcwJT29aQE5XtFBuZMRcjNLJWqUTro/9XykhJH/uiS63
         hbXOT8Zl3ie8Ycin8Hps1vGQ/U80Q6Qt+kfJu4QmFZQHJNFFS+RPxEvLVSLynh9lXnhq
         /BZfXUqjzejT03HRpidi0By7lRxnqGXMQnd0qUKZjEMyakUGcdRq1+u4eGo3Qf/UmXi4
         lP5CKQgFEBjZEIjcF7HuqD8PKn2JB/sXWZ0PJLGKYy8n1xiv+gJfuChjKt0PdLk2gDGu
         0hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762338515; x=1762943315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF+KpggyAZ/ITnvctK4l8SdHIQOwsXYkgFSK64qTgoI=;
        b=CV1Z4fRUi9NjlYj3D97T7iBh8opQngqcOnPmSRhqW1S83TPEMI7glHPKQ+3a9Nb3+6
         FXBsEdsKWaltSzGXx9NWa3F+/1Cwe0P5ntShMWPNmR8i7/UIJAamG3FwWU0A9eW+KNJD
         8YzkiPDV5j1G5ljLt9xAcsvToWRM/ovhD4ZbGzSWV+MiEBxQEW7DZbFn3t1rY8lCHbMK
         891qGb4QGr6ZQCHIIFSdbpwVcWUYrHBNypJtfhnfO4VAviCBVxg1KkPtvq1kNpoAhvmg
         FVtFg/4RZas6VAIO62/Umkomdfn+2LHGVBQ743BkNMMUgl0QpjkdjZKrEQrSk/EHH7JP
         UfMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe6ExVOavp1DaTpveDHkPHTPS5tPruC96WEYgfZBDnUNjaVXlYTyeqWjdAcUbo+DSpOWdNFhYIAS8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fn2E3goQKrqLrjMqVPZF0nUcaXGyHvcl9VHHP6ygvme1f9oC
	7iZhk9S45sZQdprhxcgtGTlprIQYL0iCttUmljZ02kRZAuH6PyJ6AlKTNNyzOAw7zTQejoEEnyM
	wCbKyyM6THYDMwUtMXQzb4YnZw4PFsKqMEcOd3jMhcPH+IUvxMfP/cXFOOORtVts=
X-Gm-Gg: ASbGncv4l8RyUHnTXvoLeuMTjKdRunzHVPgcQv856P7i1dL/ym631UrcjFFLCuTrgWp
	o114W4XlMEr+od8FBtgyJfQI9KFvIIBwlvPis8M+S7wzAm+gSAYfwfSAc7eo01q6VVF6QY57DWt
	oqfNooFuOt+gGKY0TjX/dI0bqInULRvfUyOMD6SNloohET/RZox+zT/KSPJZ0rwOzdteIRQcxlD
	rJjsRwJsR05PHLD4+5vAZjC0pbyc72W3S6SQ2Ye1y9OZeOd3HW7RMNGms76paqKfGhi+TL+ihL/
	EbgW9W2o0pOKwwXJtjWYWEBRy/dM8e+UkeoDTSXyA3z50lIbl4W8NAL6uSw35es4I+2e/Jztyoe
	p2E2eV28IYO4gXVr4zZJAVe/vPfCNY3FKAQ==
X-Received: by 2002:a17:90b:2e04:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-341a6bfbc5cmr2752089a91.3.1762338515048;
        Wed, 05 Nov 2025 02:28:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0nab8d2/HqREAsJ22farB7T8O/NtwdkVq1ttqTloYL9Mn4A21uAb5ZKhKlMroMgSfVGcy9g==
X-Received: by 2002:a17:90b:2e04:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-341a6bfbc5cmr2752065a91.3.1762338514552;
        Wed, 05 Nov 2025 02:28:34 -0800 (PST)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd324680asm5909209b3a.1.2025.11.05.02.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 02:28:34 -0800 (PST)
Message-ID: <77031db5-a94e-49c3-b48f-5f7a5569d1a2@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 15:58:28 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: make sure I2C hub controllers can't use
 SE DMA
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Wolfram Sang <wsa@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251029-topic-sm8x50-geni-i2c-hub-no-dma-v1-1-5e264258a5bd@linaro.org>
 <49f067c0-20d3-4039-95e6-fc19ce48881d@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <49f067c0-20d3-4039-95e6-fc19ce48881d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X_Ccm9-YCT1iOBH2b9lHf3SUFIiawxbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3NyBTYWx0ZWRfX9viVYdI953It
 5KCOLBILIlzAL0nlTofl4rLGhU4ZAHcDqRCGdLkFMwTQXUSFQIGs7nSTezwiIwaruxWtZc2zk/C
 4fmkKMDS5Uhhaxnd/oozbb8gMeb+F0iWXqLhsx5P8i9x1c1NNTxW4biSLpAwsR3Mdh6lI3ih6Ck
 9NVhBqU5KnC9avaeaqI96TMD6u9UXuNvf25Oe+NdaKxe+/F9CJinYTLJA3YnpmJFTwYkz0jtmGV
 dSfI0VcWwwXtXkY1vQ00W3soPDbYTsgmvPbPrzCoLYNq5u4KjZYoI0qoCX1GiTD5RJYX4T9y6VK
 92dyitL2fJIw92QtcSMVrwGfJkBTWCcfLjWUALcQfAozqdNYfCDLn2ENwfJJoL9oPhprFzbKvXa
 U/KYDpMB9c7zMF4ZzFiHvgEiTKZfww==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690b26d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wCNI2q6YBtXYwDTL9A4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: X_Ccm9-YCT1iOBH2b9lHf3SUFIiawxbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050077



On 10/30/2025 2:56 PM, Konrad Dybcio wrote:
> On 10/29/25 7:07 PM, Neil Armstrong wrote:
>> The I2C Hub controller is a simpler GENI I2C variant that doesn't
>> support DMA at all, add a no_dma flag to make sure it nevers selects
>> the SE DMA mode with mappable 32bytes long transfers.
>>
>> Fixes: cacd9643eca7 ("i2c: qcom-geni: add support for I2C Master Hub variant")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 43fdd89b8beb..bfb352b04902 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -97,6 +97,7 @@ struct geni_i2c_dev {
>>   	dma_addr_t dma_addr;
>>   	struct dma_chan *tx_c;
>>   	struct dma_chan *rx_c;
>> +	bool no_dma;
>>   	bool gpi_mode;
>>   	bool abort_done;
>>   };
>> @@ -425,7 +426,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>   	size_t len = msg->len;
>>   	struct i2c_msg *cur;
>>   
>> -	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
>> +	dma_buf = gi2c->no_dma ? NULL : i2c_get_dma_safe_msg_buf(msg, 32);
> 
> Not a huge fan of putting the ternary operator here, but I don't
> mind that much either
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>>
> Konrad


