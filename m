Return-Path: <linux-i2c+bounces-2262-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6D8758EC
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 21:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF7C11C22E42
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 20:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0E3213A25F;
	Thu,  7 Mar 2024 20:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NXVnCLDk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE39F51C45;
	Thu,  7 Mar 2024 20:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709845086; cv=none; b=jj1i+8u/766mfRK4VhoGTR1zD3QKvDgfr6EjnyvazljRTigEkT44RbyJrgpUAHrhZrZ+UGMgLqQqli7u902wWCwoAay6jfV0rrqYNNKrs++aQ7d0MdEA8sejWwYfiWc9d04LzH9PGeExRX1EahELeF0t93YSQ8OyFE0pSpS3ODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709845086; c=relaxed/simple;
	bh=PkpjRf2wsq+rFdjoQ7qm+enWmO9Ga+n1S0TzKJ/xvsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E8SY3hTKUvSJbvqmwi5n6iLAd2B9vnw268L8OT42Hx+DFZ7kuo2BAj0+kgT+kIn2oMT2LDHQH7uoE7qLVar+sd73tI8iPuonW7iu4J6n/cKCqU1xKQOmtiBH1E4tFlRpy0oSub99/sktRVZYHNpVaj7v21oyhNDZh1/QGHR0Zdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NXVnCLDk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 427JwJB9009783;
	Thu, 7 Mar 2024 20:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NVa6LfHIGjlf0zVRyk2PfIrla3w6MGkm/MOArZIJq8g=; b=NX
	VnCLDkB02p+W/AD+B0TZDm2GxO1+d/6GbCJH11VvjOVFlyAULRDvYCNy9lwjIcYp
	Pl5O4YqVd7hzSMD9l4vXVokGkw5FxrsPaIbVjVOpeCQbFlSabAUFNNBHZefz/zQi
	MJtocDAWToYNp2svgKzAV4fQdFGbmvLaIGBytgqY8TAssSzcf2fI0pu1btJlmx7Y
	hh9PT7f/gbsD2LEXfmLeJtPJ3i0s43Yu85ZN5mpW8oHAjrE/lE09PfxPNu8YZlJR
	ClCnFj0mm2Oz/1PieNWXmuXbLmtjn7yWuqRqJGiDJk+didzFWzwz8qX01N92QJ88
	xmxgUd9GisofiKovCOLQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wqf4r19w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 20:57:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 427KvuTI029597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Mar 2024 20:57:56 GMT
Received: from [10.216.46.193] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Mar
 2024 12:57:53 -0800
Message-ID: <eeefab74-1303-470f-bd3c-618d9522d24b@quicinc.com>
Date: Fri, 8 Mar 2024 02:27:49 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <konrad.dybcio@linaro.org>, <vkoul@kernel.org>, <andi.shyti@kernel.org>,
        <wsa@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <quic_vdadhani@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>
References: <20240307093605.4142639-1-quic_msavaliy@quicinc.com>
 <CAA8EJprndszVSjAVs_UzAjhb+x1B1Of4JCkygZ=8kgzuY2RwCQ@mail.gmail.com>
 <25ec87af-c911-46b7-87c9-b21065d70f9f@quicinc.com>
 <CAA8EJprky=tFjJbGTBL7+9E=kqxQKjxB_RcmzHUt31GqUVfNmQ@mail.gmail.com>
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <CAA8EJprky=tFjJbGTBL7+9E=kqxQKjxB_RcmzHUt31GqUVfNmQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3SlBHDU4EwFq4A1RsevlvKk932IVklC8
X-Proofpoint-ORIG-GUID: 3SlBHDU4EwFq4A1RsevlvKk932IVklC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-07_15,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403070148



On 3/7/2024 8:15 PM, Dmitry Baryshkov wrote:
> On Thu, 7 Mar 2024 at 15:46, Mukesh Kumar Savaliya
> <quic_msavaliy@quicinc.com> wrote:
>>
>>
>>
>>
>> On 3/7/2024 3:23 PM, Dmitry Baryshkov wrote:
>>> On Thu, 7 Mar 2024 at 11:36, Mukesh Kumar Savaliya
>>> <quic_msavaliy@quicinc.com> wrote:
>>>>
>>>> We are seeing transfer failure instead of NACK error for simple
>>>> device scan test.Ideally it should report exact error like NACK
>>>> if device is not present.
>>>>
>>>> We may also expect errors like BUS_PROTO or ARB_LOST, hence we are
>>>> adding such error support in GSI mode and reporting it accordingly
>>>> by adding respective error logs.
>>>
>>> Please take a look at the
>>> Documentation/process/submitting-patches.rst. This is not the expected
>>> style of commit messages.
>>>
>>
>> Thanks Dmitry ! Gone through the link and tried to align to the
>> guidance. I will be adding into the actual upload in V3.
> 
> Let me quote the relevant part for you:
> 
> Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
> instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
> to do frotz", as if you are giving orders to the codebase to change
> its behaviour.
> 
Ahh, i got it. Thanks ! I hope i could write in an expected imperative 
mood. Uploaded V3 with the enhanced commit log.
>>
>> When we run scan test for i2c devices, we see transfer failures instead
>> of NACK. This is wrong because there is no data transfer failure but
>> it's a slave response to the i2c master controller.
>>
>> This change correctly identifies NACK error. Also adds support for other
>> protocol errors like BUS_PROTO and ARB_LOST. This helps to exactly know
>> the response on the bus.
>>
>> Function geni_i2c_gpi_xfer() gets called for any i2c GSI mode transfer
>> and waits for the response as success OR failure. If slave is not
>> present OR NACKing, GSI generates an error interrupt which calls ISR and
>> it further calls gpi_process_xfer_compl_event(). Now
>> dmaengine_desc_callback_invoke() will call i2c_gpi_cb_result() where we
>> have added parsing status parameters to identify respective errors.
>>
>>>>
>>>> During geni_i2c_gpi_xfer(), we should expect callback param as a
>>>> transfer result. For that we have added a new structure named
>>>> gpi_i2c_result, which will store xfer result.
>>>>
>>>> Upon receiving an interrupt, gpi_process_xfer_compl_event() will
>>>> store transfer result into status variable and then call the
>>>> dmaengine_desc_callback_invoke(). Hence i2c_gpi_cb_result() can
>>>> parse the respective errors.
>>>>
>>>> while parsing error from the status param, use FIELD_GET with the
>>>
>>> Sentences start with the uppercase letter.
>>
>> Sure, will do while/While change. Will take care in next patch.
>>
>>>
>>>> mask instead of multiple shifting operations for each error.
>>>
>>>
>>>>
>>>> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
>>>> Co-developed-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>>> ---
>>>> ---
>> Sorry, i Missed to add V1 -> V2 : will add into next patch upload.
>>>> - Commit log changed we->We.
>>>> - Explained the problem that we are not detecing NACK error.
>>>> - Removed Heap based memory allocation and hence memory leakage issue.
>>>> - Used FIELD_GET and removed shiting and masking every time as suggested by Bjorn.
>>>> - Changed commit log to reflect the code changes done.
>>>> - Removed adding anything into struct gpi_i2c_config and created new structure
>>>>     for error status as suggested by Bjorn.
>>>> ---
>>>>    drivers/dma/qcom/gpi.c             | 12 +++++++++++-
>>>>    drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++++++++----
>>>>    include/linux/dma/qcom-gpi-dma.h   | 10 ++++++++++
>>>>    3 files changed, 36 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
>>>> index 1c93864e0e4d..e3508d51fdc9 100644
>>>> --- a/drivers/dma/qcom/gpi.c
>>>> +++ b/drivers/dma/qcom/gpi.c
>>>> @@ -1076,7 +1076,17 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
>>>>           dev_dbg(gpii->gpi_dev->dev, "Residue %d\n", result.residue);
>>>>
>>>>           dma_cookie_complete(&vd->tx);
>>>> -       dmaengine_desc_get_callback_invoke(&vd->tx, &result);
>>>> +       if (gchan->protocol == QCOM_GPI_I2C) {
>>>> +               struct dmaengine_desc_callback cb;
>>>> +               struct gpi_i2c_result *i2c;
>>>> +
>>>> +               dmaengine_desc_get_callback(&vd->tx, &cb);
>>>> +               i2c = cb.callback_param;
>>>> +               i2c->status = compl_event->status;
>>>> +               dmaengine_desc_callback_invoke(&cb, &result);
>>>> +       } else {
>>>> +               dmaengine_desc_get_callback_invoke(&vd->tx, &result);
>>>
>>> Is there such error reporting for SPI or UART protocols?
>>>
>>
>> Such errors are not there for SPI or UART because
>> NACK/BUS_PROTO/ARB_LOST errors are protocol specific errors. These error
>> comes in
>> middle of the transfers. As these are like expected protocol errors
>> depending on the slave device/s response.
> 
> Yes, these particular errors are I2C specific. My question was more
> generic: do we have any similar errors for SPI or UART GENI protocols
> that we should report from GPI to the corresponding driver?
> 

Got it. Reviewed and confirming that UART and SPI GENI drivers doesn't 
have such error bits unlike I2C, it simply reports transfer fail OR
success.

>>
>>>> +       }
>>>>
>>>>    gpi_free_desc:
>>>>           spin_lock_irqsave(&gchan->vc.lock, flags);
>>>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> index da94df466e83..36a7c0c0ff54 100644
>>>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>>>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>>>> @@ -66,6 +66,7 @@ enum geni_i2c_err_code {
>>>>           GENI_TIMEOUT,
>>>>    };
>>>>
>>>> +#define I2C_DMA_TX_IRQ_MASK    GENMASK(12, 5)
>>>>    #define DM_I2C_CB_ERR          ((BIT(NACK) | BIT(BUS_PROTO) | BIT(ARB_LOST)) \
>>>>                                                                           << 5)
>>>>
>>>> @@ -99,6 +100,7 @@ struct geni_i2c_dev {
>>>>           struct dma_chan *rx_c;
>>>>           bool gpi_mode;
>>>>           bool abort_done;
>>>> +       struct gpi_i2c_result i2c_result;
>>>>    };
>>>>
>>>>    struct geni_i2c_desc {
>>>> @@ -484,9 +486,18 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>>>
>>>>    static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
>>>>    {
>>>> -       struct geni_i2c_dev *gi2c = cb;
>>>> -
>>>> -       if (result->result != DMA_TRANS_NOERROR) {
>>>> +       struct gpi_i2c_result *i2c_res = cb;
>>>> +       struct geni_i2c_dev *gi2c = container_of(i2c_res, struct geni_i2c_dev, i2c_result);
>>>> +       u32 status;
>>>> +
>>>> +       status = FIELD_GET(I2C_DMA_TX_IRQ_MASK, i2c_res->status);
>>>> +       if (status == BIT(NACK)) {
>>>> +               geni_i2c_err(gi2c, NACK);
>>>> +       } else if (status == BIT(BUS_PROTO)) {
>>>> +               geni_i2c_err(gi2c, BUS_PROTO);
>>>> +       } else if (status == BIT(ARB_LOST)) {
>>>> +               geni_i2c_err(gi2c, ARB_LOST);
>>>> +       } else if (result->result != DMA_TRANS_NOERROR) {
>>>>                   dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
>>>>                   gi2c->err = -EIO;
>>>>           } else if (result->residue) {
>>>> @@ -568,7 +579,7 @@ static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>>>>           }
>>>>
>>>>           desc->callback_result = i2c_gpi_cb_result;
>>>> -       desc->callback_param = gi2c;
>>>> +       desc->callback_param = &gi2c->i2c_result;
>>>>
>>>>           dmaengine_submit(desc);
>>>>           *buf = dma_buf;
>>>> diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
>>>> index 6680dd1a43c6..f585c6a35e51 100644
>>>> --- a/include/linux/dma/qcom-gpi-dma.h
>>>> +++ b/include/linux/dma/qcom-gpi-dma.h
>>>> @@ -80,4 +80,14 @@ struct gpi_i2c_config {
>>>>           bool multi_msg;
>>>>    };
>>>>
>>>> +/**
>>>> + * struct gpi_i2c_result - i2c transfer status result in GSI mode
>>>> + *
>>>> + * @status: store txfer status value as part of callback
>>>> + *
>>>> + */
>>>> +struct gpi_i2c_result {
>>>> +       u32 status;
>>>> +};
>>>> +
>>>>    #endif /* QCOM_GPI_DMA_H */
>>>> --
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>>>> a Linux Foundation Collaborative Project
>>>>
>>>>
>>>
>>>
> 
> 
> 

