Return-Path: <linux-i2c+bounces-12309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE16B27F1E
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 13:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34C1EB6689C
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Aug 2025 11:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219A3286881;
	Fri, 15 Aug 2025 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wf7M3Oz0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829D21422B
	for <linux-i2c@vger.kernel.org>; Fri, 15 Aug 2025 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755256992; cv=none; b=bGjIX1GUiwHVR6VTUHv1Xf2Wg0t7mnDygT4CBWUcjVxE3JCarK9acatA0GSr4L/f9L4B0AWsFaYPDIKtTjK9UpTZuUQA8UVPr34Vn9nj0RrKE+0pG7ASJMjIMG+Y7cbdCrlwc8Ts1juNC+c2k2vM/pFM7u7603KadtPgxTIgTHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755256992; c=relaxed/simple;
	bh=Y4b9RHGk5FuTwKgZo6QSS7Z99ahbeLWA4mpKEy8knmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sumZqqEbGbucmelrkW7KnsOK0FAzzvXk3RGmE0tp7JRxhfgc+jkr4WXbdlBADAPcEmnaKfzyQVdA7bjHIxXt1THd0HthjJo6HqvdY0OFx80CC7FpmHDXRGEy28TeiJDSUvFPdt+oifweqFKg7e/54IkAVD+bUH7fipgfoEK+JpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wf7M3Oz0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57F9ln8O027122
	for <linux-i2c@vger.kernel.org>; Fri, 15 Aug 2025 11:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4b9RHGk5FuTwKgZo6QSS7Z99ahbeLWA4mpKEy8knmU=; b=Wf7M3Oz01B4Q6QOQ
	zFZCh+sT2n9qM1t8rRLAybgFUzqaNVCrnOkoCoSoHXCUADUPZrhxHjkfioLJgPEB
	sWfWLjoYAuaqsOJCS6ClZ/iP0Y5yiRPlFmlzR/Fwla5D2xBSli3ENXZtsO8ryu07
	Z075qCeXgr0owQiEMdjIT4wI/HAl1VCpfJ0KxxEnYHMXDiycf9QkrRyWxsqRllTc
	5cFpg1C2JOz3myYcxeuHSosBcAh4NGiKJw7NDRemdFvPb0NXv2pb96eWwOj5dY5M
	uvFrOR6Z7UQ/v9CIzkcB8AdWD9krK2H1m3IFcLZGbJ0acDeAoWSKpitnAhxmiZ6e
	MW0vwA==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9ryjt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 15 Aug 2025 11:23:10 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-88432e62d01so242541839f.3
        for <linux-i2c@vger.kernel.org>; Fri, 15 Aug 2025 04:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755256990; x=1755861790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4b9RHGk5FuTwKgZo6QSS7Z99ahbeLWA4mpKEy8knmU=;
        b=PH4J15wQYGF3bygEI4rQccYIOJX2+yjsgR7mTYJn7+DhnnetGuWSsm8UOZHgdv/Owz
         JByidkmMgFEO/X6B60TzOAUW+S8gd7IwL4165ADRoUxL49eBVXjIzKTB5+8sosXnxVRV
         FPcF78U5W+FOlqYHBFFfSj1UCrFASby3GDvtf3eEAqE0sBriMI3mCIVmZG+BbO4tjcFh
         /iGgSY+dLp1E+J0vOsmQsCjbTCUwE5Eb3lP5jEAJdScSEg34/WEMeqrW1HLUx8jDIADb
         ACBBKS620rk9X/7LtvPamK56kTclkyfo6obU5ybqeu92fpo/LpJ4BRqaGKvooOHNnplH
         NW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBNZPxBxv7W3b5I7TihWolGKWdE8QB+a/vGCZvZAS8c2VkPlc4vjtTJaDREQDlj/W8/mXyZbjWrI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZcaZA5QdqyDOMRCo5jlzXid8kTUjSPTkMl3NddzifqZ40pu3F
	VYh9q3zsYjzYW13FxqdataZxXp/SDH7yDz2Nc05jcSvdQI4nyOc7N6O25cBkYbWSiYC/hKwX9y3
	ekWwYuRjQc/i5Hff0sdXcuLVbNKJBwnaRDJ2uA/6ITdbKQwuIOojo+RbWiKjSFTPwmmEX/VXCy8
	ezU8y5gfDEVCn/r7HpJxGQUGUbx8mLjiSBDBHOsg==
X-Gm-Gg: ASbGnctwOStRF+XzYsNdXfrBUcLhATuYsFcLkTmkbd3tS6w2jwsofF6ojCo9VvcH+gT
	2+NHBhaCyEHb7T1YceRt6Li/7BPuKG38gmno7t6j4VOjhNJu3Lqc+GRYwWxW6qzQyLq17eHGL6v
	mfYjH6qouZSso5zTMTHh1JgQ==
X-Received: by 2002:a05:6602:4f86:b0:86c:f3aa:8199 with SMTP id ca18e2360f4ac-8843e495e01mr325662739f.11.1755256989744;
        Fri, 15 Aug 2025 04:23:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ+ruMJ4du6+6g0nP8YZAkSswv8epp8ueh0uj+5gCKOxs0IVlgGmW3dr6Fkri8yCflGk2TEH9pfq2BhwVZoJI=
X-Received: by 2002:a05:6602:4f86:b0:86c:f3aa:8199 with SMTP id
 ca18e2360f4ac-8843e495e01mr325659939f.11.1755256989397; Fri, 15 Aug 2025
 04:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-2-e83f104cabfc@lucaweiss.eu> <aJnefpETGJm_cuRY@shikoro>
 <f956eccec6b8ae2737b1e758b8357051@lucaweiss.eu> <aJ7wWDejA0KDarIE@shikoro>
In-Reply-To: <aJ7wWDejA0KDarIE@shikoro>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 13:22:57 +0200
X-Gm-Features: Ac12FXyHLyjoE0VR2tgvZT9ZWKQ9V1qYGFU3UagVhwtyFYiZHmsAWnzbmBeXE0Q
Message-ID: <CAFEp6-3pZAt9557us4ihM3-ifrUVkYx+LneuORVafYQGeVyiVA@mail.gmail.com>
Subject: Re: [PATCH 2/7] i2c: qcom-cci: Add msm8953 compatible
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX/kwHwfkBrwp/
 dykjEjO8ojoYFM5nbrpUozGU1Ph0igqfBUyRnLkTwxYnFKnNh8bd2ycBhahaDR//QzBXM3eBSzb
 eTxWD/7u07GIa21ipntDNuhQwbcCYqoGjnMx7U/fpEVvLdJkh/9F9iluWTayLKwLrZLW2WF9c41
 EEItwLU8TKXBxiOxNnyJRDRYFl3UGCeI/MWTr4uaxXS1kn8QzO2+vO5b8MgVPbF9ynN7t5ueHGg
 x/lr7Z/C6GLgwE6SPFT/D23RxDVjzMKFy6tbioHQnZ/ysPdUdqqzwdNMETTOrxewP8eqVqPp0kZ
 Vt8V3cshqrxzx3XVQn/Evu1F0fRFMX/rkBQ42LdMvNLMkelMNa5pT3sul5lrv2u012U3YYhiGJS
 teMvRCki
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689f189e cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=LDBv8-xUAAAA:8 a=EUspDBNiAAAA:8 a=y0T5QYlTslmZlUxBBQIA:9 a=QEXdDO2ut3YA:10
 a=LKR0efx6xuerLj5D82wC:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-ORIG-GUID: 3FfaOpAwwaYx5NGKeL17h5BQmC-SNo0s
X-Proofpoint-GUID: 3FfaOpAwwaYx5NGKeL17h5BQmC-SNo0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On Fri, Aug 15, 2025 at 10:31=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Luca,
>
> > I'm also not sure what these parameters depend on, if it's CCI HW versi=
on,
> > or
> > something else. So naming it after the SoC should be a safer bet. Also =
the
> > msm8974-cci was only named 'v1.5' because it's an inbetween mix of the =
v1
> > and
> > v2 that were already upstream so arguably that one shouldn't have been
> > called
> > v1.5 in the first place either.

That's correct, this is a local version, not matching HW IP version.
The config depends both on the HW version and the CCI core clock.
As our timings are statically configured we should also ensure that
the CCI clock is correct...

> >
> > Let me know what you think. Maybe also someone from Qualcomm/Linaro can=
 jump
> > in and share their thoughts, if someone knows more what these params de=
pend
> > on.

That's fair enough.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

