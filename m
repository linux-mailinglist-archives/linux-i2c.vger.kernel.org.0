Return-Path: <linux-i2c+bounces-11092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D785FABF49B
	for <lists+linux-i2c@lfdr.de>; Wed, 21 May 2025 14:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01B841BA5CE5
	for <lists+linux-i2c@lfdr.de>; Wed, 21 May 2025 12:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC9026773C;
	Wed, 21 May 2025 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdLtfyzm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A2262FE6
	for <linux-i2c@vger.kernel.org>; Wed, 21 May 2025 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831512; cv=none; b=GdEXnhOOJqTo97RnzxpymY5hF0sZptSa5DIEfQLbipuEuximPjm85bNIZx2Vayukw2T/94w2Oh8HhoRUi8eGGhJ78WmWEfxboWXxPs4g9qV3jweNjnXchdiS58+BsZlKfIb+oAA4eUQGaSdHmQCMd3lrAvO8o3Z55Fxe/v9DwOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831512; c=relaxed/simple;
	bh=zkGUkrSlpCDvrhHcI1g4oFe3ljg20Lkj9XiFeqwuju4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9JinmUKtouaUYRPBoE2o7HA9OnUlpKL5VGnELtAaE9dDB5NHy0+BeM4/DNiXvN9CHgxHo25GnTA4bUTqyPTt4ZzLvuD38imIxGj+mVTckyPszBCQbd4N64nwgYEmobB/5XIHwWqHkv6p0O8Jw25/Oo9FIdpbyde6/E+mNMxrAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdLtfyzm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XQ01031754
	for <linux-i2c@vger.kernel.org>; Wed, 21 May 2025 12:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ks52ly5XzSYN1dVT8m4NLznvkKylPvB/qklENFGmQ+s=; b=IdLtfyzmj4AkBBcd
	pOsyTHt2WNba+cTJwRZHEVuXYR+0O+I1Sr5W/TCKfs9o6qFw2fvhKbTBZXvKtDag
	/hNxDYBjGD2CPh4/KDEBmc0nbU4jf/su49/+iaSwa2VOO1BeyxQOQkwpPTKE1AN5
	9JHzIPEd3XuQAzdZtvXAU7bXtHtamGCvjkmVr3jeI80PWOKSqX7lTFR0VyYLhL/c
	NLMSoz7DNf7BCtISBaoJqunJ1pAVv3nz52kDXW0bP+GmbeWesLNRJ/MfLkNgdsyc
	jsNK3TJ/J7oCI7uHeuz8aa2DWbNVeIaB2DM+vc8APWxbuWx9it9S+LXWyzgP0zTl
	06WXEw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c21f9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Wed, 21 May 2025 12:45:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c6ce05e0so64771996d6.3
        for <linux-i2c@vger.kernel.org>; Wed, 21 May 2025 05:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831508; x=1748436308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ks52ly5XzSYN1dVT8m4NLznvkKylPvB/qklENFGmQ+s=;
        b=Mvo0c781csr9aCvZUdJP+EIVLYIcSB8zrRboT9yweU9N1AVwUQz4i18FWZAnHoC/rs
         UsD072NH7GVblVbtkPYJHK/0CiegEzl3z7rNUenKnE+ylcX2Syf4XARi4dZrA236cTZT
         SWOyEFMsOIMdEozu0Ih5aVueYgOWqEkn+HFVwbdyw8B24wBIGIPggWOa7RusJhbtNAXy
         iQrB9k0gfV7foYb2mqNPrqSCK8VOuyf7YpWY3PV0x8WiAKaRbE++BFoFUTZ+fRnokAS5
         gqsO0+g0+zUlIUXT+DxGJYCuFuj2iPaFPhMfV21kCRehB4E/r4SykvPVqUL6zp3amOQG
         a7uA==
X-Forwarded-Encrypted: i=1; AJvYcCVQLpInvEe6K5yzqTHCG9MuxmaNFM8xB9aj6BLlNdU3HEdS98JGSkrbdunGek0k7owV/T28D+dJKZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFKxY0vX7+W92n0GPBbIcup85gZTP48BrfxKXkiOLUg8au4Vhg
	Nfm4aZNo0c9gO5tWNIiqsZ6ukSI7mG/Gj6+4Jv2Y1uv8sc/LOaTpFebZ4qzBL92H+Q2fM0zutKS
	3VpkQZmDxd5HlXLMhmGdoauHyV540VKwxQ2bRYgPHBH3C926ZUizl78Os2V4PXlg=
X-Gm-Gg: ASbGncsNH+CU1zEh7BJfJQ+JjEykGNn7eX7o6wIw0P+xuckhAImCgIu12uEGmwVH2aL
	S7z0+l7YHvyHJemkEGk9tZSUtnUHh5LRLjh2vHyPeqxaXtt9fUclNYhmTinNtaWNYuyzuYexT+2
	qGB4E/dUBh7CSKNu7WiRuu29y3OkvzX6L91w9lpLIQp8ZAKq/c8a/SZ7d72zCjrRicnE3KpqUF1
	SRLI7XMEjP5+Asei5f423EONU9BwVPbojW0AeBGxIF8DPKImUufViyQNxZKwENelHt+6fE8YiwE
	a2A98hGw5WaNYsenAvfbL6ZWK0U5CD+Yzs+rKeqcWhSpjpKPVRXJaDr/+DbilknMdwObHbujhy0
	=
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id 6a1803df08f44-6f8c23c82b2mr198868556d6.11.1747831507823;
        Wed, 21 May 2025 05:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEShz+g9YiDU5OL+/RiZ6SU1Z6wT5YO4aHSX5TPMnkQqGJbcSQrWsL19HoCgqDtp3hVG17QAA==
X-Received: by 2002:a05:6214:14ec:b0:6f8:c23c:5257 with SMTP id 6a1803df08f44-6f8c23c82b2mr198868336d6.11.1747831507432;
        Wed, 21 May 2025 05:45:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e6esm2826955e87.136.2025.05.21.05.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:45:06 -0700 (PDT)
Date: Wed, 21 May 2025 15:45:04 +0300
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
Message-ID: <w6epbao7dwwx65crst6md4uxi3iivkcj55mhr2ko3z5olezhdl@ffam3xif6tmh>
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
 <qizkfszruwcny7f3g3i7cjst342s6ma62k5sgc6pg6yfoti7b3@fo2ssj7jvff2>
 <3aa92123-e43e-4bf5-917a-2db6f1516671@quicinc.com>
 <a98f0f1a-d814-4c6a-9235-918091399e4b@oss.qualcomm.com>
 <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba7559c8-36b6-4628-8fc4-26121f00abd5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyMyBTYWx0ZWRfX7xnRliA4dat1
 k9jdm1hO2MhMPJZMI/dHBXDbG6mFSuKrcbz71Trnb/TziskQKgBXb88SRlqxymnLRJGwcZXTmrW
 hwlpd7W2zhLrZs2+2xlFXieKQN+3zgi/XnatAf2puEkPVtefQ+/Jr6MCCZMWrTKkrS8/PKcD3rE
 E+ykSgwwAaUI4wt5Qp6TR2Pb+9Hx9OLmsqNjLuENjmXccvXwmNMuQYMNGpTLG/rWWMcIBcphBi1
 YCXmQ0loezdvtsVN7GcPcJ/sk53Wcxf3Z8LG7cT3HV8sSuWXx2G42oM+B7oDjDtAXMmVMgK5e97
 VUC2VidcFQArgw/TobCjsU9yi8uEfanpE9kMlQFTs8Eim94v99I9P6CjATCUa27+XlU2wsnk7ag
 IGSxAQbd6jF9+KATbqFIECQMuYS0rgMGTWEL9CIHdcQRHHyuT1ox5mrME5uo46TLV8GEpQwa
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682dcad5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=dt9VzEwgFbYA:10 a=O67JBuyAYGrhvE3k4OkA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 8pNYBS7fPxBZZDPnUtlqrbTDxWnBB-ia
X-Proofpoint-GUID: 8pNYBS7fPxBZZDPnUtlqrbTDxWnBB-ia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210123

On Wed, May 21, 2025 at 03:58:48PM +0530, Jyothi Kumar Seerapu wrote:
> 
> 
> On 5/9/2025 9:31 PM, Dmitry Baryshkov wrote:
> > On 09/05/2025 09:18, Jyothi Kumar Seerapu wrote:
> > > Hi Dimitry, Thanks for providing the review comments.
> > > 
> > > On 5/6/2025 5:16 PM, Dmitry Baryshkov wrote:
> > > > On Tue, May 06, 2025 at 04:48:44PM +0530, Jyothi Kumar Seerapu wrote:
> > > > > The I2C driver gets an interrupt upon transfer completion.
> > > > > When handling multiple messages in a single transfer, this
> > > > > results in N interrupts for N messages, leading to significant
> > > > > software interrupt latency.
> > > > > 
> > > > > To mitigate this latency, utilize Block Event Interrupt (BEI)
> > > > > mechanism. Enabling BEI instructs the hardware to prevent interrupt
> > > > > generation and BEI is disabled when an interrupt is necessary.
> > > > > 
> > > > > Large I2C transfer can be divided into chunks of 8 messages internally.
> > > > > Interrupts are not expected for the first 7 message completions, only
> > > > > the last message triggers an interrupt, indicating the completion of
> > > > > 8 messages. This BEI mechanism enhances overall transfer efficiency.
> > > > 
> > > > Why do you need this complexity? Is it possible to set the
> > > > DMA_PREP_INTERRUPT flag on the last message in the transfer?
> > > 
> > > If i undertsand correctly, the suggestion is to get the single
> > > intetrrupt for last i2c message only.
> > > 
> > > But With this approach, we can't handle large number of i2c messages
> > > in the transfer.
> > > 
> > > In GPI driver, number of max TREs support is harcoded to 64 (#define
> > > CHAN_TRES   64) and for I2C message, we need Config TRE, GO TRE and
> > > DMA TREs. So, the avilable TREs are not sufficient to handle all the
> > > N messages.
> > 
> > It sounds like a DMA driver issue. In other words, the DMA driver can
> > know that it must issue an interrupt before exausting 64 TREs in order
> > to
> > 
> > > 
> > > Here, the plan is to queue i2c messages (QCOM_I2C_GPI_MAX_NUM_MSGS
> > > or 'num' incase for less messsages), process and unmap/free upon the
> > > interrupt based on QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
> > 
> > Why? This is some random value which has no connection with CHAN_TREs.
> > Also, what if one of the platforms get a 'liter' GPI which supports less
> > TREs in a single run? Or a super-premium platform which can use 256
> > TREs? Please don't workaround issues from one driver in another one.
> 
> We are trying to utilize the existing CHAN_TRES mentioned in the GPI driver.
> With the following approach, the GPI hardware can process N number of I2C
> messages, thereby improving throughput and transfer efficiency.
> 
> The main design consideration for using the block event interrupt is as
> follows:
> 
> Allow the hardware to process the TREs (I2C messages), while the software
> concurrently prepares the next set of TREs to be submitted to the hardware.
> Once the TREs are processed, they can be freed, enabling the software to
> queue new TREs. This approach enhances overall optimization.
> 
> Please let me know if you have any questions, concerns, or suggestions.

The question was why do you limit that to QCOM_I2C_GPI_NUM_MSGS_PER_IRQ.
What is the reason for that limit, etc. If you think about it, The GENI
/ I2C doesn't impose any limit on the number of messages processed in
one go (if I understand it correctly). Instead the limit comes from the
GPI DMA driver. As such, please don't add extra 'handling' to the I2C
driver. Make GPI DMA driver responsible for saying 'no more for now',
then I2C driver can setup add an interrupt flag and proceed with
submitting next messages, etc.

I really don't see a reason for additional complicated handling in the
geni driver that you've implemented. Maybe I misunderstand something. In
such a case it usually means that you have to explain the design in the
commit message / in-code comments.

-- 
With best wishes
Dmitry

