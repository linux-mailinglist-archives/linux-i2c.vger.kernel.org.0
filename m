Return-Path: <linux-i2c+bounces-11993-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F043B0DA07
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 14:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4F4D1899699
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Jul 2025 12:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51B92E8E16;
	Tue, 22 Jul 2025 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbaINSye"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A710288528
	for <linux-i2c@vger.kernel.org>; Tue, 22 Jul 2025 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753188380; cv=none; b=GuXlDHScLAyMBbRCNxx4UhUjekUTg+fvwEMe93PAb48o6mObAxfwmx9a3zv5Xez0wzOH54iEpVUX95+/CpB1g5HShN2D6lCrU7lTjVZADj+74OBW9OtODzZVXWtGeCWZ9RmD4/KYuXPJCIWHt/Lrls0yxOGb8tlzTdrgxFs+ZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753188380; c=relaxed/simple;
	bh=2gUG+xhyqTU+lqMubMHdTmb0h2IDqPtCWz+ZvKrzqZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aM+V+6nV1uiFVOU0Q7ch3FseYNa+5pwBBzhPDWVYPfAeoSwSA5WiPFm0lq8gU6j8FCjGw6TtM+1ACnaK+4xU4Ge0YBXl9hc/oClgoqEQmaYBoAt57H8wkqjTaBwSkz4aM/apAXZLFl8IlS12Vc+TQ/4MwQexebwnanoXUWFvMlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbaINSye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MAFVn4016268
	for <linux-i2c@vger.kernel.org>; Tue, 22 Jul 2025 12:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hgKl7nn7uy61avxAGFM6ja37VG9rXI//YEqKVu1JD34=; b=kbaINSyehzLw5pKc
	XDly7/w9hFHZsCQVKQMI85zrK6QmfvMs/8CcjFwCxaC7VyZK205Ah3aJ39CDON4/
	Cn+zA6tPmCzzY6IoFhIBYTJGPrTKiB8ypCEZHm4GFZa+9c8i5BQjCSQ8G4hezXfh
	cYLxUZGMBtYCS8czW9YY3ksKdXVH/rsxzFqqmWOou279n7NaE0lBCCj07Il7FeBX
	jqGRQdpIsDBB133PmTnxZ8Acp3wb82Xp7m9z7vrr62JQanDW3U429e9peDpqaSsa
	EoBmgSP5jRItRMcPCeWM6rU7/+SXI1TxV+snaWzbCkDnjQ6XrE62x3E1vwcTE8MQ
	j2IhPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s1grb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 22 Jul 2025 12:46:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e1fb57a7adso487923785a.2
        for <linux-i2c@vger.kernel.org>; Tue, 22 Jul 2025 05:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753188376; x=1753793176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgKl7nn7uy61avxAGFM6ja37VG9rXI//YEqKVu1JD34=;
        b=ELQElit6yFuCblT/v/aC2QD64li2FToFSTwGyr2ykepHHYxsmunogbWH9phc5xpQLU
         U//Sir+ULVKX2hEjDHPuWpr4e7+avjbs4awRVC/HJBQRT0fjZAagqTXPNEvTi2AZ+mbV
         mN6Tq9KfeG9XExybyUIUO9ChQBC7RtSThffrRoDCwurPLyMTJsMiXgtKMU41+RmoodSP
         UCzaso5m+Vcl3HFaLXY5DBYlE2aDwe1cGODGC99dcV7kxpMmaCHnecgYHdmjJgdMAQAS
         XSuUmzK/cBimQEUlrKwgXIp2cV9K+/ijdbWjrEi7PXq/uXSBoIbml98HEfHfQPwgYMg9
         cBOA==
X-Forwarded-Encrypted: i=1; AJvYcCVNsQa7UNJGKHic0EI7a/fr3iU/SNQPDDJxTfVTiV20f9Ja0ypY7bf25Mzht2NJqi+XDhKby93DAWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvKTjQ6zMr7FiQYmrQc8bMJt92T/aMwMKQ8cqcc3YDns/j6jCm
	lUnUnJKUyjViqQmJJBBVAwzBLWcF4eHFvMqp477KIyv8+/60RjEugYtXTqUE0ddDjzfGCB2YhgK
	sY7KnhKwiYrVozsPt3O9nFbETpQJ236ja7HKVOBZ8noFzqdFUkqVhyY63Uqhibkk=
X-Gm-Gg: ASbGncu72abUFPz/xlfR3pWwu5u3x79iJGZnWEmXG27YLbKIutRyca+BAnEArb0Mhuc
	tE1eTFJIE65vvWd20/0F/udqbuu/ygpTjoeInuB8iWIV8CVSpCYebJ7U95etl9uuKN4BZ46rtb9
	+xuQRvLY35XpbQRIJ4pwVXdPy32XrOy147NwI7lyUCGcj44XRdJoK6WFka8l0odcDsWr+jCoDcy
	8gy5uotp1fNXpxo8spclE6Gdw9HW9nmdyOHy+19XuBT0q+TAn3wSBi833nxapqEoWtJYOxb2qsU
	r7XPexKSUYHfOeTNIwuPERW/Si8NoN+s9CtDLxT9cB8zRXE3cu6P5L1xrsU1neHEsoJO00OtorO
	IFWfZ/uS1kVW3np0iVG5OLmC8ARHPjKNJ20amhlGqgEhY+hRcXBpK
X-Received: by 2002:a05:620a:450c:b0:7e3:2b48:7a8e with SMTP id af79cd13be357-7e343351714mr3579709385a.10.1753188375844;
        Tue, 22 Jul 2025 05:46:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+BYyx/UNM41regL+7hN6QclK58fj1xdT7v4bNKQjK4xldqPXWPK44yx6cBALL8CEo9qzGSQ==
X-Received: by 2002:a05:620a:450c:b0:7e3:2b48:7a8e with SMTP id af79cd13be357-7e343351714mr3579703485a.10.1753188375204;
        Tue, 22 Jul 2025 05:46:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1f1dsm17384691fa.51.2025.07.22.05.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:46:14 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:46:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <iang2jpe4s6wmbypmtq5uswcm6n6xntqdulyhekcz5k6zxddu3@re3rrr4dso5p>
References: <5ed77f6d-14d7-4b62-9505-ab988fa43bf2@quicinc.com>
 <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
 <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
 <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
 <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com>
 <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
 <CAO9ioeXBwFYL8q7x7_fHvx5YO+qyAXk4wpnfPrku4iY9yBsk0Q@mail.gmail.com>
 <cac5e84b-fbdb-47a9-860d-16a7fa4dc773@quicinc.com>
 <4q3vlydi5xgltd3pcez54alxgrehhfn4pppg47ngwp6y5k7n33@d4d4htntj64k>
 <53dd18ec-9a65-4bf7-8490-ca3eb56ce2a5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53dd18ec-9a65-4bf7-8490-ca3eb56ce2a5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEwNSBTYWx0ZWRfX80nsBhYjY1rO
 wBC0pIhbBnuNAWPJO6F+lmmgPuz9Qy0mZKULdJg7s1PN0T5EtdoX2VVMjaIDrZnblWALgVkpftK
 uOdKNPKt1RVPGjUCtl2QdnVAtwVfokkdY8C3RGTKouJ45h8PF+uNFYSuPmAn5AMHEtAanIR0kt/
 SVnaO78t+RymFd5DmKzaAcsiTtQAJ+zeA+LzscdMVRm6qS8Mm93eBuPusjo9tDyCKkJ8aWO3I+5
 9TnBkjEtjrKI1WNWWws6alWhwFckTzDYnOhsxGM/tRSTjqF37O+Sj1GY2xuxcTvLXvepTLqz3xJ
 h7qRTjEXhhjo7AE9kHgjtlIWhTS+NGuhLZ7cXFnEjDgzH+ZlIjhMu8E00CPOUN2AZNF/MzTNiQP
 xo5VCo/QnW7lyS4tmEMIZ/TN6lxMNkNHLZKBGhLAGK/x+w/zCh3Ul9UBnG4jCxDksWAM3Bfx
X-Proofpoint-ORIG-GUID: aTaRlz8v08fP43HTup6q_-jsBmMlUjWY
X-Proofpoint-GUID: aTaRlz8v08fP43HTup6q_-jsBmMlUjWY
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=687f8819 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Y3I3_p0U7YG0OqqoKFAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220105

On Tue, Jul 22, 2025 at 05:50:08PM +0530, Jyothi Kumar Seerapu wrote:
> 
> 
> On 7/19/2025 3:27 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 07, 2025 at 09:58:30PM +0530, Jyothi Kumar Seerapu wrote:
> > > 
> > > 
> > > On 7/4/2025 1:11 AM, Dmitry Baryshkov wrote:
> > > > On Thu, 3 Jul 2025 at 15:51, Jyothi Kumar Seerapu
> > > > <quic_jseerapu@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 6/19/2025 9:46 PM, Jyothi Kumar Seerapu wrote:
> > > > > > 
> > > > > > 
> > > > > > On 6/18/2025 1:02 AM, Dmitry Baryshkov wrote:
> > > > > > > On Tue, 17 Jun 2025 at 17:11, Jyothi Kumar Seerapu
> > > > > > > <quic_jseerapu@quicinc.com> wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 5/30/2025 10:12 PM, Dmitry Baryshkov wrote:
> > > > > > > > > On Fri, May 30, 2025 at 07:36:05PM +0530, Jyothi Kumar Seerapu wrote:
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > On 5/21/2025 6:15 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > > On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
> > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
> > > > > > > > > > > > > > Hi Dimitry, Thanks for providing the review comments.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > > > On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu
> > > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > The I2C driver gets an interrupt upon transfer completion.
> > > > > > > > > > > > > > > > When handling multiple messages in a single transfer, this
> > > > > > > > > > > > > > > > results in N interrupts for N messages, leading to significant
> > > > > > > > > > > > > > > > software interrupt latency.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > To mitigate this latency, utilize Block Event Interrupt (BEI)
> > > > > > > > > > > > > > > > mechanism. Enabling BEI instructs the hardware to prevent
> > > > > > > > > > > > > > > > interrupt
> > > > > > > > > > > > > > > > generation and BEI is disabled when an interrupt is necessary.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > Large I2C transfer can be divided into chunks of 8 messages
> > > > > > > > > > > > > > > > internally.
> > > > > > > > > > > > > > > > Interrupts are not expected for the first 7 message
> > > > > > > > > > > > > > > > completions, only
> > > > > > > > > > > > > > > > the last message triggers an interrupt, indicating the
> > > > > > > > > > > > > > > > completion of
> > > > > > > > > > > > > > > > 8 messages. This BEI mechanism enhances overall transfer
> > > > > > > > > > > > > > > > efficiency.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Why do you need this complexity? Is it possible to set the
> > > > > > > > > > > > > > > DMA_PREP_INTERRUPT flag on the last message in the transfer?
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > If i undertsand correctly, the suggestion is to get the single
> > > > > > > > > > > > > > intetrrupt for last i2c message only.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > But With this approach, we can't handle large number of i2c
> > > > > > > > > > > > > > messages
> > > > > > > > > > > > > > in the transfer.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > In GPI driver, number of max TREs support is harcoded to 64
> > > > > > > > > > > > > > (#define
> > > > > > > > > > > > > > CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE
> > > > > > > > > > > > > > and
> > > > > > > > > > > > > > DMA TREs. So, the avilable TREs are not sufficient to handle
> > > > > > > > > > > > > > all the
> > > > > > > > > > > > > > N messages.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > It sounds like a DMA driver issue. In other words, the DMA
> > > > > > > > > > > > > driver can
> > > > > > > > > > > > > know that it must issue an interrupt before exausting 64 TREs in
> > > > > > > > > > > > > order
> > > > > > > > > > > > > to
> > > > > > > > > > > > > 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
> > > > > > > > > > > > > > or 'num' incase for less messsages), process and unmap/free
> > > > > > > > > > > > > > upon the
> > > > > > > > > > > > > > interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Why? This is some random value which has no connection with
> > > > > > > > > > > > > CHAN_TREs.
> > > > > > > > > > > > > Also, what if one of the platforms get a 'liter' GPI which
> > > > > > > > > > > > > supports less
> > > > > > > > > > > > > TREs in a single run? Or a super-premium platform which can use 256
> > > > > > > > > > > > > TREs? Please don't workaround issues from one driver in another
> > > > > > > > > > > > > one.
> > > > > > > > > > > > 
> > > > > > > > > > > > We are trying to utilize the existing CHAN_TRES mentioned in the
> > > > > > > > > > > > GPI driver.
> > > > > > > > > > > > With the following approach, the GPI hardware can process N
> > > > > > > > > > > > number of I2C
> > > > > > > > > > > > messages, thereby improving throughput and transfer efficiency.
> > > > > > > > > > > > 
> > > > > > > > > > > > The main design consideration for using the block event interrupt
> > > > > > > > > > > > is as
> > > > > > > > > > > > follows:
> > > > > > > > > > > > 
> > > > > > > > > > > > Allow the hardware to process the TREs (I2C messages), while the
> > > > > > > > > > > > software
> > > > > > > > > > > > concurrently prepares the next set of TREs to be submitted to the
> > > > > > > > > > > > hardware.
> > > > > > > > > > > > Once the TREs are processed, they can be freed, enabling the
> > > > > > > > > > > > software to
> > > > > > > > > > > > queue new TREs. This approach enhances overall optimization.
> > > > > > > > > > > > 
> > > > > > > > > > > > Please let me know if you have any questions, concerns, or
> > > > > > > > > > > > suggestions.
> > > > > > > > > > > 
> > > > > > > > > > > The question was why do you limit that to
> > > > > > > > > > > QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> > > > > > > > > > > What is the reason for that limit, etc. If you think about it, The
> > > > > > > > > > > GENI
> > > > > > > > > > > / I2C doesn't impose any limit on the number of messages processed in
> > > > > > > > > > > one go (if I understand it correctly). Instead the limit comes
> > > > > > > > > > > from the
> > > > > > > > > > > GPI DMA driver. As such, please don't add extra 'handling' to the I2C
> > > > > > > > > > > driver. Make GPI DMA driver responsible for saying 'no more for now',
> > > > > > > > > > > then I2C driver can setup add an interrupt flag and proceed with
> > > > > > > > > > > submitting next messages, etc.
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > For I2C messages, we need to prepare TREs for Config, Go and DMAs.
> > > > > > > > > > However,
> > > > > > > > > > if a large number of I2C messages are submitted then may may run
> > > > > > > > > > out of
> > > > > > > > > > memory for serving the TREs. The GPI channel supports a maximum of
> > > > > > > > > > 64 TREs,
> > > > > > > > > > which is insufficient to serve 32 or even 16 I2C messages
> > > > > > > > > > concurrently,
> > > > > > > > > > given the multiple TREs required per message.
> > > > > > > > > > 
> > > > > > > > > > To address this limitation, a strategy has been implemented to
> > > > > > > > > > manage how
> > > > > > > > > > many messages can be queued and how memory is recycled. The constant
> > > > > > > > > > QCOM_I2C_GPI_MAX_NUM_MSGS is set to 16, defining the upper limit of
> > > > > > > > > > messages that can be queued at once. Additionally,
> > > > > > > > > > QCOM_I2C_GPI_NUM_MSGS_PER_IRQ is set to 8, meaning that
> > > > > > > > > > half of the queued messages are expected to be freed or deallocated
> > > > > > > > > > per
> > > > > > > > > > interrupt.
> > > > > > > > > > This approach ensures that the driver can efficiently manage TRE
> > > > > > > > > > resources
> > > > > > > > > > and continue queuing new I2C messages without exhausting memory.
> > > > > > > > > > > I really don't see a reason for additional complicated handling in
> > > > > > > > > > > the
> > > > > > > > > > > geni driver that you've implemented. Maybe I misunderstand
> > > > > > > > > > > something. In
> > > > > > > > > > > such a case it usually means that you have to explain the design
> > > > > > > > > > > in the
> > > > > > > > > > > commit message / in-code comments.
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > The I2C Geni driver is designed to prepare and submit descriptors
> > > > > > > > > > to the GPI
> > > > > > > > > > driver one message at a time.
> > > > > > > > > > As a result, the GPI driver does not have visibility into the current
> > > > > > > > > > message index or the total number of I2C messages in a transfer.
> > > > > > > > > > This lack
> > > > > > > > > > of context makes it challenging to determine when to set the block
> > > > > > > > > > event
> > > > > > > > > > interrupt, which is typically used to signal the completion of a
> > > > > > > > > > batch of
> > > > > > > > > > messages.
> > > > > > > > > > 
> > > > > > > > > > So, the responsibility for deciding when to set the BEI should lie
> > > > > > > > > > with the
> > > > > > > > > > I2C driver.
> > > > > > > > > > 
> > > > > > > > > > If this approach is acceptable, I will proceed with updating the
> > > > > > > > > > relevant
> > > > > > > > > > details in the commit message.
> > > > > > > > > > 
> > > > > > > > > > Please let me know if you have any concerns or suggestions.
> > > > > > > > > 
> > > > > > > > Hi Dmitry, Sorry for the delayed response, and thank you for the
> > > > > > > > suggestions.
> > > > > > > > 
> > > > > > > > > - Make gpi_prep_slave_sg() return NULL if flags don't have
> > > > > > > > >       DMA_PREP_INTERRUPT flag and there are no 3 empty TREs for the
> > > > > > > > >       interrupt-enabled transfer.
> > > > > > > > "there are no 3 empty TREs for the interrupt-enabled transfer."
> > > > > > > > Could you please help me understand this a bit better?
> > > > > > > 
> > > > > > > In the GPI driver you know how many TREs are available. In
> > > > > > > gpi_prep_slave_sg() you can check that and return an error if there
> > > > > > > are not enough TREs available.
> > > > > > > 
> > > > > > > > > 
> > > > > > > > > - If I2C driver gets NULL from dmaengine_prep_slave_single(), retry
> > > > > > > > >       again, adding DMA_PREP_INTERRUPT. Make sure that the last one
> > > > > > > > > always
> > > > > > > > >       gets DMA_PREP_INTERRUPT.
> > > > > > > > Does this mean we need to proceed to the next I2C message and ensure
> > > > > > > > that the DMA_PREP_INTERRUPT flag is set for the last I2C message in each
> > > > > > > > chunk? And then, should we submit the chunk of messages to the GSI
> > > > > > > > hardware for processing?
> > > > > > > 
> > > > > > > No. You don't have to peek at the next I2C message. This all concerns
> > > > > > > the current I2C message. The only point where you have to worry is to
> > > > > > > explicitly set the flag for the last message.
> > > > > > > 
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > - In geni_i2c_gpi_xfer() split the loop to submit messages until you
> > > > > > > > >       can, then call wait_for_completion_timeout() and then
> > > > > > > > >       geni_i2c_gpi_unmap() for submitted messages, then continue with
> > > > > > > > > a new
> > > > > > > > >       portion of messages.
> > > > > > > > Since the GPI channel supports a maximum of 64 TREs, should we consider
> > > > > > > > submitting a smaller number of predefined messages — perhaps fewer than
> > > > > > > > 32, such as 16?
> > > > > > > 
> > > > > > > Why? Just submit messages until they fit, then flush the DMA async
> > > > > > > channel.
> > > > > > > 
> > > > > > > > This is because handling 32 messages would require one TRE for config
> > > > > > > > and 64 TREs for the Go and DMA preparation steps, which exceeds the
> > > > > > > > channel's TRE capacity of 64.
> > > > > > > > 
> > > > > > > > We designed the approach to submit a portion of the messages — for
> > > > > > > > example, 16 at a time. Once 8 messages are processed and freed, the
> > > > > > > > hardware can continue processing the TREs, while the software
> > > > > > > > simultaneously prepares the next set of TREs. This parallelism helps in
> > > > > > > > efficiently utilizing the hardware and enhances overall system
> > > > > > > > optimization.
> > > > > > > 
> > > > > > > 
> > > > > > > And this overcomplicates the driver and introduces artificial
> > > > > > > limitations which need explanation. Please fix it in a simple way
> > > > > > > first. Then you can e.g. implement the watermark at the half of the
> > > > > > > GPI channel depth and request DMA_PREP_INTERRUPT to be set in the
> > > > > > > middle of the full sequence, allowing it to be used asynchronously in
> > > > > > > the background.
> > > > > > > 
> > > > > > 
> > > > > > Okay, will review it. Thanks.
> > > > > > 
> > > > > > 
> > > > > 
> > > > > Hi Dmitry,
> > > > > 
> > > > > Can you please check and confirm the approach to follow is something
> > > > > like the pseudo code mentioned below:
> > > > 
> > > > Yes, this is what I've had in mind.
> > > 
> > > So, Apart from the changes related to "submitting I2C messages until they
> > > fit" and "unmapping all processed I2C messages together", the rest of the
> > > code looks remains the same as in the v6 patch ?
> > > Also, in the GPI driver, we need to add logic to retrieve the number of
> > > available TREs.
> > > 
> > > I have a concern regarding throughput and achieving parallelism between
> > > software and hardware processing with this new approach. Since we need to
> > > unmap all processed messages together, the software cannot queue the next
> > > set of TREs while the hardware is still processing the current ones.
> > 
> > Does that warrant the over-complexity of the driver or close-coupling of
> > I2C and GPE drivers?
> > 
> > The I2C is a slow bus and it is not expected to be used for
> > high-throughput data.
> > 
> The block event interrupt and multi-descriptor handling are primarily added
> to support a camera use case, where multiple registers are need to be
> configured in a single I2C transfer with 200 or more i2c messages. This
> enhancement is expected to improve throughput and meet performance KPIs.
> 
> > > 
> > > As I mentioned earlier, the previous approach allowed partial unmapping
> > > where half of the messages processed by the hardware could be
> > > freed/unmapped. This enabled the hardware to continue processing the
> > > remaining TREs while the software simultaneously prepared the next batch.
> > > This parallelism helped in better hardware utilization and improved overall
> > > system performance.
> > 
> > Measurements / values / impact?
> > 
> > > 
> > > Could you please confirm if can go with the similar approach of unmap the
> > > processed TREs based on a fixed threshold or constant value, instead of
> > > unmapping them all at once?
> > 
> > I'd still say, that's a bad idea. Please stay within the boundaries of
> > the DMA API.
> >
> I agree with the approach you suggested—it's the GPI's responsibility to
> manage the available TREs.
> 
> However, I'm curious whether can we set a dynamic watermark value perhaps
> half the available TREs) to trigger unmapping of processed TREs ? This would
> allow the software to prepare the next set of TREs while the hardware
> continues processing the remaining ones, enabling better parallelism and
> throughput.

Let's land the simple implementation first, which can then be improved.
However I don't see any way to return 'above the watermark' from the DMA
controller. You might need to enhance the API.

> 
> > > > 
> > > > > 
> > > > > GPI driver:
> > > > > In gpi_prep_slave_sg() function,
> > > > > 
> > > > > if (!(flags & DMA_PREP_INTERRUPT) && !gpi_available_tres(chan))
> > > > >           return NULL;
> > > > > 
> > > > > 
> > > > > I2C GENI driver:
> > > > > 
> > > > > for (i = 0; i < num; i++)
> > > > > {
> > > > >       /* Always set interrupt for the last message */
> > > > >       if (i == num_msgs - 1)
> > > > >           flags |= DMA_PREP_INTERRUPT;
> > > > > 
> > > > > 
> > > > >       desc = dmaengine_prep_slave_single(chan, dma_addr, len, dir, flags);
> > > > >       if (!desc && !(flags & DMA_PREP_INTERRUPT)) {
> > > > >             /* Retry with interrupt if not enough TREs */
> > > > >             flags |= DMA_PREP_INTERRUPT;
> > > > >             desc = dmaengine_prep_slave_single(chan, dma_addr, len, dir,   flags);
> > > > >       }
> > > > > 
> > > > > 
> > > > >       if (!desc)
> > > > >           break;
> > > > > 
> > > > > 
> > > > >        dmaengine_submit(desc);
> > > > >        msg_idx++;
> > > > > }
> > > > > 
> > > > > dma_async_issue_pending(chan));
> > > > > 
> > > > > time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> > > > > if (!time_left)
> > > > >           return -ETIMEDOUT;
> > > > > 
> > > > > Now Invoke "geni_i2c_gpi_unmap" for unmapping all submitted I2C messages.
> > > > > 
> > > > > 
> > > > > Thanks,
> > > > > JyothiKumar
> > > > > 
> > > > > 
> > > > > 
> > > > 
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

