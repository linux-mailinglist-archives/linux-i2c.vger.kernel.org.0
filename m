Return-Path: <linux-i2c+bounces-13589-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A54BE355F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 14:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46736188914A
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Oct 2025 12:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B937632C31E;
	Thu, 16 Oct 2025 12:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqSGRYDU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F1030EF72
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760617365; cv=none; b=IXmxsS1KAbXumgqUjx6cePy4q11jLKwEoZNrecf31Y7slHFzlwC393ADgu08OKFe8Y/jNjyTZnjv8ByN35PlLROuJeB5n3mEyRyP/2MDXELq16nVCQVUGmv6bSCErIGh++wCqRxzX43a6bWuDeGBbTstnPJKHGW0rI2NTQavFfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760617365; c=relaxed/simple;
	bh=mL3AkCdFjfUQDFlySMvWUslbbK6AefBEqeQD4tfNbNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTRVV+wdxkBDM7r0l/ktcXxOpDo7S0lfu97DlgdesXPI+7JRnEGtw1MZXvhsV6hpVukVkQFe4AbH3oN1xjauSWzoKR9L5y9K2lfsKJCt0EdsdFmSEI0gU5S/zA8IHYWtlZuQVV+lvkbxWdmNUY7PqKGAgYjE+kD1P/fJAjxd/ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqSGRYDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G7JbxX004267
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 12:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9yQUnMu2HxE11HdeoAr8BU2ZwERrUip4hDHAbjMAn4=; b=pqSGRYDURFh5ETLu
	QxCj9Wj4Oj78wq12XoZq1sFMnC+NS0OROrZjGVGckFJd3k/60Zpi950reha6JZOd
	qWBYVZoD1lWOjW5GDkfCKi0P3Jk1GvNhWqk0mmH5XyjRwClsT3sF/OrzWn0GK4xv
	GUN6vmTBiLZ+qyCiUnhc4v6JLS9l+Uk1LIQI/T3NIK5F0XEwoXkh31GAyMeLsVG2
	jmPb5MduYt5pqujQzb7k83aoEgK0W2BcFX5ZI5j1wIinyBN7imPjw4SLKSNlopc+
	mwD/QMLg2W+Ip86t9vYkX7J5mWUrTZ7h/jKQvWGdo2HC/T0rYd6CufsEkiJSIpkM
	9hprBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1amfy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 12:22:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8645d39787bso244017885a.2
        for <linux-i2c@vger.kernel.org>; Thu, 16 Oct 2025 05:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760617362; x=1761222162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9yQUnMu2HxE11HdeoAr8BU2ZwERrUip4hDHAbjMAn4=;
        b=pU9PG+Xx63BBCEmrjEFZaDn8u1lQMQAMnGU6EVlce3jjF+gm/OblwdZ30j6ZLU+1yB
         SSYCKWoxwOysFrpFDd5FvilDWA902A8ztJOMXSdfKL+6VJrHJpUkcOUcfMLKSp6zjKUs
         KTjQHTpIbTK5DLF8X+fBkXxD4IFfVVqIUEcy4lNY40ekfaN1UeN1WPDUZ+FKBAZOZq0M
         GwuTDBrUQRUcpSLeIsXUq/px9B/Nt/8CayFRsDGyOqWbZ2F7WWaLD6sDUMuULDbmYxmQ
         PHs7vQ7xP75DeklKQJDliGbcIO0RZYpcw5UDUwiIvOMHRveqvxgc29+W/SmDNVyV98SJ
         LNZA==
X-Forwarded-Encrypted: i=1; AJvYcCXA8roCYJxK8Tr48YbZfQMgdJtnjytid6dtqrFRwBpksu1Lx/GhVG5mcNfRhp2wIAkkHd/rauandkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSDUfF0Kp4palyM324IrgHHOfGEMjOwsQ3XI1c9iF/7Y2rc9aR
	l+n7zW0S9UK99NQPhcCcVRaNX4zpV/lTNAr8fJf51AxhOYiceT68fIiT6LsbTaGCXRWJEkDl9SK
	S/HlGukCX5a8JsA66Gx7DAkl/utcqrfAkVA4z22qqP1MKg6MCCqcIexViVj3dnX3ZjynRMt3sbp
	9euktNkOK6DTzhfACZ4rgc1iw7gSTAfNsvA2AvNw==
X-Gm-Gg: ASbGncvl9DEnOYlN+j97CTQKcisNrDcCgRis1El3kx/hgRhn5jnn9sloPVwZUxPaLbJ
	ZPSigStN4kVJ9OoKAGf4lQwXWofhbJ+hGfm3SWF9d4v5q6pYNlqYIeAq+1Bmqx6PHOU9bsUInTA
	RwXxT0pzkjsb5yxzNkxykRx35zrZ6qj+6GFqDX8Hh3CCx1AEwxWUAKNSbkyMc4IKgBG7yWr6PPg
	PcsmCuXXKMhBZMy
X-Received: by 2002:a05:620a:4502:b0:890:28c7:f669 with SMTP id af79cd13be357-89028c80073mr58576285a.30.1760617361794;
        Thu, 16 Oct 2025 05:22:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnZMb/cYhHwHiWYZwoXQy2OINpsvIKqNRNCU3Ket2voCC7bfHOUUrKU4B139SqJ5kxiGE/2fuG+XnMoA4Crq4=
X-Received: by 2002:a05:620a:4502:b0:890:28c7:f669 with SMTP id
 af79cd13be357-89028c80073mr58573185a.30.1760617361345; Thu, 16 Oct 2025
 05:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014-add-new-clock-in-vfe-matching-list-v1-1-0d965ccc8a3a@oss.qualcomm.com>
 <9984bc23-05ef-4d46-aeb8-feb0a18e5762@kernel.org> <bc0caeb8-c99b-4bef-a69e-5ce433e6b890@oss.qualcomm.com>
 <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
In-Reply-To: <c4fd6bfc-cc9a-4f37-99b3-f36466691a1e@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Oct 2025 14:22:30 +0200
X-Gm-Features: AS18NWDp6vazgiHxY7kgFcW2LE3xKj8UU2r34EGJpIgpnAkFsDnwm-UZKPSoRe4
Message-ID: <CAFEp6-2=GJL-gc+PSyAL4=prp_sXdZJS=Ewg5nP2kcp_Gu85Fw@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Enable setting the rate to
 camnoc_rt_axi clock
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68f0e393 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=p_FccyrFFb65Td8MQdgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KjbFJURJRwrcLlztCG598SDpQXPL38TF
X-Proofpoint-ORIG-GUID: KjbFJURJRwrcLlztCG598SDpQXPL38TF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfX13/WTOPcWacU
 EcsFk/vCckueKqIgzi4ffj6JQY5gUnSMxYfZU+Krt1nyyK4Uce7u9lWk95R+oJ3CKXR45ob//OP
 TIGev6Kfstg6O+76Lew7VUvBSWF70zMZgmO067vWcWRRUymmsA+epQeCpDcFNFie98FVQ1bO12C
 WOBRmpEGhgMhFLplIXeCrGLkh8x5xUQG7ftgK8qXzQ3C+aI1Xbh8vDfEZxoHhaN+Lo+tsaCDYCx
 UgGQDAtOI7NWPOwRTqE53QXTI0+crC1VLLk5RzLqW+szazcGbUiDEzNYa92qDfYQRyRTGqDVUiR
 19Na/SmHmKotgyhLogQBcYV+5s0c6UBD1NmEFSnD6yFtyFM3LR0Y1jpI8eiS49VS7PIrpI3AhLB
 9URQuY4MjLC+BaLGXZEC5KxXgrWVbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On Thu, Oct 16, 2025 at 1:50=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> >>>
> >>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/=
media/platform/qcom/camss/camss-vfe.c
> >>> index ee08dbbddf88..09b29ba383f1 100644
> >>> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> >>> @@ -914,7 +914,8 @@ static int vfe_match_clock_names(struct vfe_devic=
e *vfe,
> >>>     return (!strcmp(clock->name, vfe_name) ||
> >>>             !strcmp(clock->name, vfe_lite_name) ||
> >>>             !strcmp(clock->name, "vfe_lite") ||
> >>> -           !strcmp(clock->name, "camnoc_axi"));
> >>> +           !strcmp(clock->name, "camnoc_axi") ||
> >>> +           !strcmp(clock->name, "camnoc_rt_axi"));
> >>
> >> Just use camnoc_axi for both. Look at your bindings - why do you keep
> >> different names for same signal?
> >
> > I think the correct question to ask is:
> >
> > Is camnoc_axi going to represent the other (NRT) clock in this
> > setting?
> >
> > Konrad
>
> I'm - perhaps naively - assuming this clock really is required ... and
> that both will be needed concurrently.

AFAIU, the NRT clock is not in use for the capture part, and only
required for the offline processing engine (IPE, OPE), which will
likely be described as a separated node.

Regards,
Loic

