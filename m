Return-Path: <linux-i2c+bounces-11509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49318ADDC65
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 21:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B5A2169D65
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 19:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D262EAB68;
	Tue, 17 Jun 2025 19:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c05slx93"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2716628D8C4
	for <linux-i2c@vger.kernel.org>; Tue, 17 Jun 2025 19:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188782; cv=none; b=ji+3KvNyiAmGCevEUOnK8j1j6bn6BauOzj2+F8mp9hnjOnhGX9djuvkSJb/pB51+d9K5JFlECywg/JvXxzOf3KaTdedeLxrLif9jhHF1lKfXhSxsClLVOszBJE6BQ8iYxtdLGRc+4xWrhsklN+HVgsFG1iGZgsI1ed4uAZxH2fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188782; c=relaxed/simple;
	bh=X4NLa07H+3DJm8UbqEV7pKTcSVUxge5nhfwlnwokHc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbvQMxWgXk4Osu7+kRJwVDPSl2GdNRktGP5QuT5wvPmMzL+nJAzT/oBIMbN4VtaY8f1mHcZicMb5bUhHU+uQ3PSa6ZOo/ZPmJm+Tc7T1R5Z+f6++wOzFPMBxtXJEtoabUTCRo8GcNIlb5BEzU36mVHwT3Er4h18yy4MujcwX6bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c05slx93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEVpgQ021521
	for <linux-i2c@vger.kernel.org>; Tue, 17 Jun 2025 19:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIbCnnZJnE1dRqopiLjdq4hCJ+ntywslQjBWNG2QRjo=; b=c05slx93dM0Vzsnt
	z45mupAadCboQwAcDouwa3O+fvJXGQf/4L7VcJcQWXFbp/BbnsevKCY1Jo/Zem+s
	6AONkF4GFON1rFtHqQPxN/08bNe+ud98YvqMDYCbvUR7vfcUBk183BvjUnaahyLd
	c1A5Pz+j5DKovkKdVBZW1N8Yo4TO673yS32rjQCUknNH4YJTlpEI3eqOtxLSF+oJ
	HskxX0DQvc4DEQglVRTFMMHr+/D/vaaIE3plrSh+wDgsNnFOCLL12GYHb1m44hjO
	El++9sCJAih3MgmLo6XAUWJWQKnWfKQuo/KkMsqIs498PQc4m/1aQ172MVpd/L/v
	TEke7w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f79grm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 17 Jun 2025 19:32:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso5286362a91.1
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jun 2025 12:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188777; x=1750793577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIbCnnZJnE1dRqopiLjdq4hCJ+ntywslQjBWNG2QRjo=;
        b=R95UA8kRIgtgLHAaloX08D3qSaLeVCb4H4LXh/9GAqHpuh5vavnfmcADjw5IuoysgD
         vPh7gO4YsGmKfOpdPyc+wygGCwuC3UckqE40MCeCvesy4waZH5jJLuuKhWEMkGV73eF3
         bHFJ1/cdF0VexN8NkRT/XTT7ZqPuC+wJtIROS4+oKPqsqvaEv+LlUyzphkpRXkkL1tO4
         PkKaWfPBQEc9sCftcepVnbRWOZAnU3WdJN7DrH54tTSBpXmg39hnj0YjeT8W5T4/O1WZ
         MXcHRciizhz7sJ/HxTFmn5MhdrdhxE/KzA41RrczDqg4rq2Yw1bTsr4Qihj0a5s7tdvI
         BFxg==
X-Forwarded-Encrypted: i=1; AJvYcCW9uMOAjiB9aeqTkshVgACHi6mO4funHMui55lh8ZVgENpZXDhspMDYkv0YYktx3DQU45ptAhjL1yI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9d3oHRyXrf6xTsQPsNU9sbkrZjX808WCB6jdrkOq8WS1EEgei
	LxDSLmKa0RMOdkdjNrDT2dHx7JGNz6dtdkCWEM89TwILctm/4C7y4h8h+jWsAOi3hquCJdj84hM
	U5ZaJhWZo/tXM8yZZQG9lRHC5eNL9DarkGToCAWf9MwDhe65gDWkwu4d7hVH8CVgweOKj5XN99S
	wRnmyD9OwFxHFxO5PRPzy0H7fhb/kfe4bAx9ANYw==
X-Gm-Gg: ASbGncszxx75Cl04rbRgakJEF1wmfUyUWu/NiBMZUB3BHt7yi2qLGlXSV+Ky/7IcYCQ
	dxQNHoqBvqpBCHBRO7NLXOamyV+mXEdsmhTcFY8CAJcOW9Xa2kDF5IXC9jIEvdscshuz/KbAA6o
	Vcr0qZLk3gh4UXsA5fmFfBU1RAaCvTOO74NNA=
X-Received: by 2002:a17:90b:5243:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-313f1be19b6mr20149221a91.5.1750188777147;
        Tue, 17 Jun 2025 12:32:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Yj0B1WZz9zMPvRUBKOUkD/Z/zgMQLyHBfPoxGaC4Q3KxKeeJnyth9d8kLdV++WhAy43gMACh36zTUKBlgK8=
X-Received: by 2002:a17:90b:5243:b0:2fa:157e:c790 with SMTP id
 98e67ed59e1d1-313f1be19b6mr20149188a91.5.1750188776627; Tue, 17 Jun 2025
 12:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com> <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
 <3aa92123-e43e-4bf5-917a-2db6f1516671@quicinc.com> <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
 <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com> <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
 <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com> <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
 <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
In-Reply-To: <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 22:32:44 +0300
X-Gm-Features: Ac12FXxRqBKGZmiJYew2CCdZO7lAYLKEDGrgNFKyh4gLgwOg3EcxtK0hH17GdXA
Message-ID: <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt support
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE1NyBTYWx0ZWRfXw1uHOMc4PbBA
 X3DC5XlKTrQbkA/ajW6nwGgz/yL7OqEWO/0CI9vRT3KVZ6polt+qx7My+/lppy9bTxzwH+4HJB6
 5TMelxvgc9gs2GRXx7E+chkugaXEwQV555iSWlhHY4ppShVbiu+rNNFyt0m9Xu7LXCdOxc6cVt9
 9wwA/df4bVcigyW93PzJIiPs7AWW3n0Vbo9WqZxo0trP1z5c/l3T5vEikOSAh2Qnbb4kjnumD0b
 BPUqVliBfOnZ+weildB6nhL0M0JWA7KgmtY2Z7cIRsuSfr8Ge4EwgDL18NSl0JMX2Ng0+0ENE47
 qgCkaS9V9Hk5VtDUCRlYkUaLrgZHOLPR7EyRJoJqsQ8A9eQYXfHd/V5GSFg4Fd8nwGQn7ODm27O
 5h6oeutfqDJ/KySUJjhqk+YHQHYQKYg16K/IJye9vlMsJ8uu+HMtYN+nsg2reNm1bvPEA1wh
X-Proofpoint-GUID: s6a3ufUYR_k-3MF1EaH6SQlwHyrfxHq1
X-Proofpoint-ORIG-GUID: s6a3ufUYR_k-3MF1EaH6SQlwHyrfxHq1
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6851c2ea cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=COk6AnOGAAAA:8 a=60oDIgegJV5b1wVmNvgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170157

On Tue, 17 Jun 2025 at 17:11, Jyothi Kumar Seerapu
<quic_jseerapu@quicinc.com> wrote:
>
>
>
> On 5/30/2025 10:12 PM, Dmitry Baryshkov wrote:
> > On Fri, May 30, 2025 at 07:36:05PM +0530, Jyothi Kumar Seerapu wrote:
> >>
> >>
> >> On 5/21/2025 6:15 PM, Dmitry Baryshkov wrote:
> >>> On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
> >>>>
> >>>>
> >>>> On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
> >>>>> On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
> >>>>>> Hi Dimitry, Thanks for providing the review comments.
> >>>>>>
> >>>>>> On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wr=
ote:
> >>>>>>>> The I2C driver gets an interrupt upon transfer completion.
> >>>>>>>> When handling multiple messages in a single transfer, this
> >>>>>>>> results in N interrupts for N messages, leading to significant
> >>>>>>>> software interrupt latency.
> >>>>>>>>
> >>>>>>>> To mitigate this latency, utilize Block Event Interrupt (BEI)
> >>>>>>>> mechanism. Enabling BEI instructs the hardware to prevent interr=
upt
> >>>>>>>> generation and BEI is disabled when an interrupt is necessary.
> >>>>>>>>
> >>>>>>>> Large I2C transfer can be divided into chunks of 8 messages inte=
rnally.
> >>>>>>>> Interrupts are not expected for the first 7 message completions,=
 only
> >>>>>>>> the last message triggers an interrupt, indicating the completio=
n of
> >>>>>>>> 8 messages. This BEI mechanism enhances overall transfer efficie=
ncy.
> >>>>>>>
> >>>>>>> Why do you need this complexity? Is it possible to set the
> >>>>>>> DMA_PREP_INTERRUPT flag on the last message in the transfer?
> >>>>>>
> >>>>>> If i undertsand correctly, the suggestion is to get the single
> >>>>>> intetrrupt for last i2c message only.
> >>>>>>
> >>>>>> But With this approach, we can't handle large number of i2c messag=
es
> >>>>>> in the transfer.
> >>>>>>
> >>>>>> In GPI driver, number of max TREs support is harcoded to 64 (#defi=
ne
> >>>>>> CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE an=
d
> >>>>>> DMA TREs. So, the avilable TREs are not sufficient to handle all t=
he
> >>>>>> N messages.
> >>>>>
> >>>>> It sounds like a DMA driver issue. In other words, the DMA driver c=
an
> >>>>> know that it must issue an interrupt before exausting 64 TREs in or=
der
> >>>>> to
> >>>>>
> >>>>>>
> >>>>>> Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
> >>>>>> or 'num' incase for less messsages), process and unmap/free upon t=
he
> >>>>>> interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> >>>>>
> >>>>> Why? This is some random value which has no connection with CHAN_TR=
Es.
> >>>>> Also, what if one of the platforms get a 'liter' GPI which supports=
 less
> >>>>> TREs in a single run? Or a super-premium platform which can use 256
> >>>>> TREs? Please don't workaround issues from one driver in another one=
.
> >>>>
> >>>> We are trying to utilize the existing CHAN_TRES mentioned in the GPI=
 driver.
> >>>> With the following approach, the GPI hardware can process N number o=
f I2C
> >>>> messages, thereby improving throughput and transfer efficiency.
> >>>>
> >>>> The main design consideration for using the block event interrupt is=
 as
> >>>> follows:
> >>>>
> >>>> Allow the hardware to process the TREs (I2C messages), while the sof=
tware
> >>>> concurrently prepares the next set of TREs to be submitted to the ha=
rdware.
> >>>> Once the TREs are processed, they can be freed, enabling the softwar=
e to
> >>>> queue new TREs. This approach enhances overall optimization.
> >>>>
> >>>> Please let me know if you have any questions, concerns, or suggestio=
ns.
> >>>
> >>> The question was why do you limit that to QCOM_I2C_GPI_NUM_MSGS_PER_I=
RQ.
> >>> What is the reason for that limit, etc. If you think about it, The GE=
NI
> >>> / I2C doesn't impose any limit on the number of messages processed in
> >>> one go (if I understand it correctly). Instead the limit comes from t=
he
> >>> GPI DMA driver. As such, please don't add extra 'handling' to the I2C
> >>> driver. Make GPI DMA driver responsible for saying 'no more for now',
> >>> then I2C driver can setup add an interrupt flag and proceed with
> >>> submitting next messages, etc.
> >>>
> >>
> >> For I2C messages, we need to prepare TREs for Config, Go and DMAs. How=
ever,
> >> if a large number of I2C messages are submitted then may may run out o=
f
> >> memory for serving the TREs. The GPI channel supports a maximum of 64 =
TREs,
> >> which is insufficient to serve 32 or even 16 I2C messages concurrently=
,
> >> given the multiple TREs required per message.
> >>
> >> To address this limitation, a strategy has been implemented to manage =
how
> >> many messages can be queued and how memory is recycled. The constant
> >> QCOM_I2C_GPI_MAX_NUM_MSGS is set to 16, defining the upper limit of
> >> messages that can be queued at once. Additionally,
> >> QCOM_I2C_GPI_NUM_MSGS_PER_IRQ is set to 8, meaning that
> >> half of the queued messages are expected to be freed or deallocated pe=
r
> >> interrupt.
> >> This approach ensures that the driver can efficiently manage TRE resou=
rces
> >> and continue queuing new I2C messages without exhausting memory.
> >>> I really don't see a reason for additional complicated handling in th=
e
> >>> geni driver that you've implemented. Maybe I misunderstand something.=
 In
> >>> such a case it usually means that you have to explain the design in t=
he
> >>> commit message / in-code comments.
> >>>
> >>
> >>
> >> The I2C Geni driver is designed to prepare and submit descriptors to t=
he GPI
> >> driver one message at a time.
> >> As a result, the GPI driver does not have visibility into the current
> >> message index or the total number of I2C messages in a transfer. This =
lack
> >> of context makes it challenging to determine when to set the block eve=
nt
> >> interrupt, which is typically used to signal the completion of a batch=
 of
> >> messages.
> >>
> >> So, the responsibility for deciding when to set the BEI should lie wit=
h the
> >> I2C driver.
> >>
> >> If this approach is acceptable, I will proceed with updating the relev=
ant
> >> details in the commit message.
> >>
> >> Please let me know if you have any concerns or suggestions.
> >
> Hi Dmitry, Sorry for the delayed response, and thank you for the
> suggestions.
>
> > - Make gpi_prep_slave_sg() return NULL if flags don't have
> >    DMA_PREP_INTERRUPT flag and there are no 3 empty TREs for the
> >    interrupt-enabled transfer.
> "there are no 3 empty TREs for the interrupt-enabled transfer."
> Could you please help me understand this a bit better?

In the GPI driver you know how many TREs are available. In
gpi_prep_slave_sg() you can check that and return an error if there
are not enough TREs available.

> >
> > - If I2C driver gets NULL from dmaengine_prep_slave_single(), retry
> >    again, adding DMA_PREP_INTERRUPT. Make sure that the last one always
> >    gets DMA_PREP_INTERRUPT.
> Does this mean we need to proceed to the next I2C message and ensure
> that the DMA_PREP_INTERRUPT flag is set for the last I2C message in each
> chunk? And then, should we submit the chunk of messages to the GSI
> hardware for processing?

No. You don't have to peek at the next I2C message. This all concerns
the current I2C message. The only point where you have to worry is to
explicitly set the flag for the last message.

>
> >
> > - In geni_i2c_gpi_xfer() split the loop to submit messages until you
> >    can, then call wait_for_completion_timeout() and then
> >    geni_i2c_gpi_unmap() for submitted messages, then continue with a ne=
w
> >    portion of messages.
> Since the GPI channel supports a maximum of 64 TREs, should we consider
> submitting a smaller number of predefined messages =E2=80=94 perhaps fewe=
r than
> 32, such as 16?

Why? Just submit messages until they fit, then flush the DMA async channel.

> This is because handling 32 messages would require one TRE for config
> and 64 TREs for the Go and DMA preparation steps, which exceeds the
> channel's TRE capacity of 64.
>
> We designed the approach to submit a portion of the messages =E2=80=94 fo=
r
> example, 16 at a time. Once 8 messages are processed and freed, the
> hardware can continue processing the TREs, while the software
> simultaneously prepares the next set of TREs. This parallelism helps in
> efficiently utilizing the hardware and enhances overall system
> optimization.


And this overcomplicates the driver and introduces artificial
limitations which need explanation. Please fix it in a simple way
first. Then you can e.g. implement the watermark at the half of the
GPI channel depth and request DMA_PREP_INTERRUPT to be set in the
middle of the full sequence, allowing it to be used asynchronously in
the background.

--=20
With best wishes
Dmitry

