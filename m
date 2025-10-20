Return-Path: <linux-i2c+bounces-13663-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAB7BEFD8C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 10:13:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B7144EDE02
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 08:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240FF2E9ED7;
	Mon, 20 Oct 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dk8h1DEA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F334F2DECD3
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948009; cv=none; b=m1dzBQT6xE940MWwOPh5FGaRLPK1JvRJNmRuY3rBRnem1yfBwJr6U31JoDuINpgbeIMxt6KQbbopM9z5ZTqd3GwdTcXP0yTzVYqNGHLDFLz26lTsRGzCIr50VXDOGlbMce834eITwzcDZIZuYWfVskW5M0XKWDl+/vAbovL7tgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948009; c=relaxed/simple;
	bh=eWUdVUQn4e5pJS+pC4d8RvrZAEG0k5mgZUxDdEUFFTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKo2tCbxoAbnLAM+L6Gw7+R+XyArWRoZKD/noZmrADSdYceZQTRkKruqJOZvpw1moxPUMIJLDaRFV9cnui1pV1KvOiepl9PE07zUZah3VAQmxKK42jq/H9i381arENoGU7zBoEL7mzVJBGJg99OM9nHrU5PvXIVuE9aN2d2eNoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dk8h1DEA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JNisru014776
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 08:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWUdVUQn4e5pJS+pC4d8RvrZAEG0k5mgZUxDdEUFFTE=; b=Dk8h1DEAHhqV3f9c
	U2MZ4yA4xxBTsMT9lNsIYVR8z+z4Xtzs+3yWAUzzvvgcbE2PunRNa+jDx0l+EbkA
	gGPC3SJska3WSGb2rorWJYPxpeU0ZV3aeE+E+etGX9Ru0V4PkpDSaHYREbYFwfLa
	2IL9RZ/YwQsvZnpehN/IjrkVxxepJQdS2AeiCRCILlq65UK5QzIaa6TPy5uTeQ7Q
	E7a2GHpy3Xy57I9OT2Wb8LffcZMgvbktwo11SvUERh6H/xhT146Ew6o5CfVYg9VG
	Q6whiaQp8cx+1oZh2CI6y2KGqbYGwzpLQ3ntXKt1b7Tw1kaQ6FhJvueT+TUz16JW
	HT6LHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pcb0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 08:13:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-88f1dad9992so232076085a.1
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 01:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948006; x=1761552806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWUdVUQn4e5pJS+pC4d8RvrZAEG0k5mgZUxDdEUFFTE=;
        b=xD+M20lwQeHeUKUDrvRbPlpG0RL84Qr2joRE+si4KTdn3V/WB+qfRLUz4nDtwzDLNi
         5g6dwX2oK29jvLSt+dnfl/5W83ejVrJVhdesLjhN4wWsTz1b7JgvAIEmbO/SJNSd9Tki
         WWOiCn6mdFfDLSIAVlQXyZnK34+bQHoVhMk/PK5FmkR3SueSkp6Y5MfBQ2SQarzCULro
         uTpvrzcfe2wJ3iWl2Vahgw4Kp1YvKSeRCyH9iAuQSBCac0jboxvqGHDgOarmGi6Wg/uF
         o+6LzucW/4n+MmxBE+95LWGg+LqgG4i1VtoF6DqzCVijBnr7J91EXq6tGtBSrlnZRjR8
         DWQg==
X-Forwarded-Encrypted: i=1; AJvYcCVVb+yy5aft+lO2iIw5MrMa5W23OBHxnZ21/heC4p0EQ/AE7fJgNPFVq8GFW4EucPa/Bw3nFAdNQ58=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtzRFx40Ye14GINf9qwjMiw3TBkYfX94vr340v6gyEPkKgu6Q5
	h3A9rMDxuSmsmX5j7rU7Pq5TmSWDz/eNT37G23Kx/GQTiux4GY3sxHubyaC0BHR8/z0MQMuBjOI
	sUQyY6Zvd1MuP9ThauRzbiKoQSqQmjsnZHGzP0iEIBlchqR+2UvzP5ajd1zMMfk+/iCa3HyMzff
	sTtGl0U0NyD2rKadjpMkPv4bUTTB1fkcug4aiqDw==
X-Gm-Gg: ASbGncu790hO1XWkEb/Ygziqja/LORUj87+gk+IuW4GvFFeJwcu+2qiUTn6Tr19Re4m
	E7Oh77kWVouMzPShjRLMHnaVRz64r/Gb+4QT5F0bvomyJcTRDj0HD6cM01GOdmpxXhWOxUZVV3O
	I0tU+ZVgsgQmQ28AZOUD37d79qoGG2oEDBYvPugviToFZVvDX5sAdIP9Ed3hVzl7I1O1y0Au2q3
	WzTsqgGQvM3iWdTVYYn1NfabXArhqMLCXM8+hJG8YrN
X-Received: by 2002:a05:620a:190e:b0:883:5640:b0da with SMTP id af79cd13be357-8906e2cf39dmr1436903585a.3.1760948005979;
        Mon, 20 Oct 2025 01:13:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb6zG3EmsKjpqb2r+Qft6H1geCepq6JDWxSiyy4RN7KSOTJqDZAnRX1cclURNEe+Zx+0M8EH233ksa03DnVzI=
X-Received: by 2002:a05:620a:190e:b0:883:5640:b0da with SMTP id
 af79cd13be357-8906e2cf39dmr1436901085a.3.1760948005468; Mon, 20 Oct 2025
 01:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org> <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org> <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
 <33513b43-f6d1-4c76-887b-39611a75e1f4@kernel.org> <WnfCknsSyJK68PQZkE2q7COZHRpsLOFlr3dcbwiVR6SBWtF9iRQ4MGzp_9q31O0kyhZwoncQWfHjJQvpz7nyfw==@protonmail.internalid>
 <ab43c5c9-edc5-459e-8ef7-2aa8bec559c0@oss.qualcomm.com> <0e6e1b8a-d9ae-42d1-b1ad-4314e0d76ab7@kernel.org>
 <2c0011d3-a692-457c-9ac0-a445fc82df37@oss.qualcomm.com>
In-Reply-To: <2c0011d3-a692-457c-9ac0-a445fc82df37@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 10:13:14 +0200
X-Gm-Features: AS18NWAwySZMB2zZMh-0PxLreQh1uFGY20Blv1uikWAJkb59A8nYis59v_-2Kqo
Message-ID: <CAFEp6-0c9C8N86HQh2Y1xfOEM5Lc8XV4BE3xX6WROF5F+_-Bvg@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX59+ir+dGdfXo
 xIVckkSdFE/rDCtOpOBg9AgPDJzSNkF+TFSAFEMW5IkfV7/Y5pLkY59HZ5jdkvbpwFJIUFiqxMA
 WL8hTM6dmRDyyUSuPK8jhZI1hZ5js7ONhvsSkHYNkIELUl6dFaaNrFB3Bd4fBQCiFAv0/tM8ZIv
 DHLtXA1irz3N/eQEXLeGdrg+ZNl95WCS6cwIKxTOzIDUvdtoj34eV8uFAcH08CzChPnMyxwmjsp
 TS1JBAbLj2GTjRtNG4rEzcYs3Fni/uPrnf/Pi9AF440KaicEAlPw49Y+q+kXMf60s1lQohsV/3p
 LsyHyuxwZaBfbSq6BEfOYvgEKIhVs3WwCvyC/LZ7aZaft0LS6BRp4AoEmFjx3r3n79CZip7Pqkf
 2H3sBgJGQZ6ZJmBrasFpCWvi3CdUDg==
X-Proofpoint-GUID: bX0iOs9xx-XHIkLpVY7mBm7QOlq4PZuc
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f5ef26 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Y5ZU1JmK0_tTG0nlGdEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bX0iOs9xx-XHIkLpVY7mBm7QOlq4PZuc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On Mon, Oct 20, 2025 at 5:23=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On 10/17/2025 7:41 PM, Bryan O'Donoghue wrote:
> > On 16/10/2025 21:53, Vijay Kumar Tumati wrote:
> >>
> >> On 10/16/2025 8:31 AM, Bryan O'Donoghue wrote:
> >>> On 16/10/2025 13:22, Loic Poulain wrote:
> >>>>> I'm - perhaps naively - assuming this clock really is required ... =
and
> >>>>> that both will be needed concurrently.
> >>>> AFAIU, the NRT clock is not in use for the capture part, and only
> >>>> required for the offline processing engine (IPE, OPE), which will
> >>>> likely be described as a separated node.
> >>>
> >>> Maybe yeah though we already have bindings.
> >>>
> >>> @Hangxiang I thought we had discussed this clock was required for you=
r
> >>> setup.
> >>>
> >>> Can you confirm with a test and then
> >>>
> >>> 1. Repost with my RB - I assume you included this on purpose
> >>> 2. Respond that you can live without it.
> >>>
> >>> ---
> >>> bod
> >>>
> >> @Bryan and others, sorry, I am just trying to understand the exact ask
> >> here. Just to add a bit more detail here, On certain architectures,
> >> there is one CAMNOC module that connects all of the camera modules (RT
> >> and NRT) to MMNOC. In these, there is one 'camnoc_axi' clock that need=
s
> >> to be enabled for it's operation. However, on the newer architectures,
> >> this single CAMNOC is split into two, one for RT modules (TFEs and IFE
> >> Lites) and the other for NRT (IPE and OFE). So, on a given architectur=
e,
> >> we either require 'camnoc_axi' or 'camnoc_rt_axi' for RT operation, no=
t
> >> both. And yes, one of them is a must. As you know, adding the support
> >> for the newer clock in "vfe_match_clock_names" will only enable the
> >> newer chip sets to define this in it's resource information and set th=
e
> >> rate to it based on the pixel clock. In kaanapali vfe resources, we do
> >> not give the 'camnoc_axi_clk'. Hopefully we are all on the same page
> >> now, is it the suggestion to use 'camnoc_axi_clk' name for
> >> CAM_CC_CAMNOC_RT_AXI_CLK ? We thought it would be clearer to use the
> >> name the matches the exact clock. Please advise and thank you.
> >
> > The ask is to make sure this clock is needed @ the same time as the
> > other camnoc clock.
> >
> > If so then update the commit log on v2 to address the concerns given
> > that it may not be necessary.
> >
> > If not then just pining back to this patch "we checked and its not
> > needed" will do.
> >
> > ---
> > bod
>
> @Bryan, I test two scenarios individually that also consider @Vladimir's
> concern. I confirm this clock rate setting is necessary.
> 1. Remove 'camnoc_rt_axi' from the vfe clock matching function.
> 2. Remove 'camnoc_nrt_axi' from the vfe clock resources in camss.c.
> Both of them block the image buffer write operation. More clearly, we
> will stuck at the stage when all buffers acquired but CAMSS takes no acti=
on.
>
> I agree with @Vijay to keep 'camnoc_rt_axi' to distinguish between the
> new one and 'camnoc_axi'. The disagreement concerns how to standardize
> the camnoc clock name or how to differentiate between RT and NRT clock
> names if a new RT clock name is introduced. Other chips like sm8550,
> sm8775p depend on 'camnoc_axi'. Meanwhile, 'camnoc_rt_axi' and
> 'camnoc_nrt_axi' are both necessary for QCM2290 and X1E80100. But chips
> like QCM2290 and X1E80100 may not need to set the clock rate but
> Kaanapali needs. @Vladimir

Actually NRT clock does not seem necessary for QCM2290 as capture only
involves RealTime elements.
I tried without that clock and the capture is working, so I think of
making it optional in the QCM2290 bindings.
Also, I thought these clocks could be indirectly scaled via their
respective interconnects?

Regards,
Loic

