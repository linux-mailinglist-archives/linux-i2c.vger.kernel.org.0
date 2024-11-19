Return-Path: <linux-i2c+bounces-8051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8669D28BD
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 15:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CB9D281ED4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 14:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47271CF2A1;
	Tue, 19 Nov 2024 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fPIiEhpu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435C51CF289
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 14:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028354; cv=none; b=lcwP61ECfmnyB/vLOB5hWrTLe/CytqSbmDs00fyjXOQv6nAQ56byO+HzSt3iBS0rwMa/uvRii5bphydV6o7zdf5qDzwHKEk5dqY8PduJbJcddXtsE4ccdj+D1euMZ2LQuuklaF+rUXXOYtwdpIgwrMjhRrgiaMJugNXRTlUiJ+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028354; c=relaxed/simple;
	bh=izWRI5BvXmsLERdJXiJWNTDQNHXk33knlx0gffvwe9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXNB9AeuJEC954dnHN3McQlw1+yOAvXnsdvvAA2sWHKejJcweMor3W90huMAbQfyY947stymda0fcBmS48VKg8r/Txx0ap5ztVAoOzYkievRQ9RtSRughueSSvA8p4TnYY3mFKBZb1EOZAj7ddLV8yZAarY0T7/C/XrtGKQezXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fPIiEhpu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7hhhA029944
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 14:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izWRI5BvXmsLERdJXiJWNTDQNHXk33knlx0gffvwe9k=; b=fPIiEhpuEaYGaokV
	//kkkskJZ1Kt9l2rMz0rWeLkPr6XnaAb7v/ijw6TV2KXpKvBaMn4hnz8IYqiPkmS
	FVxjam5TgG8Q4oFJ8+GEJ52DQj6Nw69iuaBL66k7jv4Bi95+da2u9im2xSJPauJi
	yl3/l+28dvPIhL7Gt3hou8ZC20pw+tIeHWrUrU3B9h+3mWDOet7TiPX940TSSylq
	HGJtql+I6nVnzTp0nAe9K6xPE6H5SevsER/S4B1qvv+jkYZUFFZhumkq+7G2VE5l
	KgNAhuPwgO1KBvVRqRt03+fSQR2viNwM2rlKp++ssQZvxiPEjv1xMu6h44SOCUIz
	yvpXLg==
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6aunf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 14:59:12 +0000 (GMT)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e3826e5c0c0so1728148276.0
        for <linux-i2c@vger.kernel.org>; Tue, 19 Nov 2024 06:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732028351; x=1732633151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izWRI5BvXmsLERdJXiJWNTDQNHXk33knlx0gffvwe9k=;
        b=GsqP3OsaCXv0BPB8UXXO4JfP5O2AsnmC886T493MYNRAcTAsrLUfp5XKTyIDtTYLtd
         kShStvfpckMLSm/ry9E/a81KEuDLOeMpoXcCPAY7nDgF6MpUj42on7SSLpyXVxlsq5i5
         QIG/uPI/fr/GY5eApEkRaHqBy4rxzuw8btppPrw/VDek4Qfe0u4ID+dKlz9oeAJzEDyo
         lXZGxD0lWbSZb9wj1wrDYJGYFvL2HyRvLR/22ZA147B6U80Mj5euLNXUsROYMPITgPKP
         foFEitWczCo8HQawzREaiE2+LcWdtb+DfYzeu9QUedFzuZ5etxjKwVkxi5vFE2gpil/x
         28Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUutfGFQvDFZujnLRWJAm77wq6C7TZB2tk4yeSwESbLaejT49hzC0EajolIbH3abBfW9EXfZzmuGFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ9l2JmykAP9W9xQ5WM4Vn7NPu71CAGyjrydMBO2o607hZKCcv
	lFYHAuAl97ySBs1x3Fu4Q+WFn92RuDIDiyEEgf4uSZmMTYHzvmI+xCwO6K/eAg8RLkvd4KAIr4Z
	hQzq37J1m6ZpbANDV36SZfGdMIWx/8l0n2jk/UA5qBg75yJCZgeDlqdFNQK/MpBZ0l6DNOCz1vc
	AKkk9oOLaCXJzPy/l5figKtynL5myBAJFhAg==
X-Received: by 2002:a05:6902:328c:b0:e2b:dbe5:851d with SMTP id 3f1490d57ef6-e382615318fmr11063149276.28.1732028351203;
        Tue, 19 Nov 2024 06:59:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH58XN7+JYbU5CLFWXjdNBrV/khDacGcR+zr5IycnimYdqOmOKm7w6G6vmJdAAKTfY+OsxENzlv0Ckl+MwYsVs=
X-Received: by 2002:a05:6902:328c:b0:e2b:dbe5:851d with SMTP id
 3f1490d57ef6-e382615318fmr11063126276.28.1732028350875; Tue, 19 Nov 2024
 06:59:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011121757.2267336-1-quic_msavaliy@quicinc.com>
 <ZwlnWIWkS1pwQ/xK@hu-bjorande-lv.qualcomm.com> <3797c11f-b263-4f5d-9307-963fd6662b26@quicinc.com>
In-Reply-To: <3797c11f-b263-4f5d-9307-963fd6662b26@quicinc.com>
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 19 Nov 2024 08:59:00 -0600
Message-ID: <CADLxj5RD5syLXdVnfsMpEso9VOhWiwdP8_iV12R=mvhKwUY_bA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Serve transfer during early resume stage
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: andi.shyti@kernel.org, quic_bjorande@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
        quic_vdadhani@quicinc.com, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: TGAJWSJHdBhPy5K0FMtaTy9-XLrh893M
X-Proofpoint-GUID: TGAJWSJHdBhPy5K0FMtaTy9-XLrh893M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190110

On Tue, Nov 19, 2024 at 8:29=E2=80=AFAM Mukesh Kumar Savaliya
<quic_msavaliy@quicinc.com> wrote:
> On 10/11/2024 11:28 PM, Bjorn Andersson wrote:
> > On Fri, Oct 11, 2024 at 05:47:57PM +0530, Mukesh Kumar Savaliya wrote:
[..]
> >> pm_runtime_get_sync() function fails during PM early resume and return=
ing
> >> -EACCES because runtime PM for the device is disabled at the early sta=
ge
> >> causing i2c transfer to fail. Make changes to serve transfer with forc=
ed
> >> resume.
> >>
> >> Few i2c clients like PCI OR touch may request i2c transfers during ear=
ly
> >> resume stage. In order to serve transfer request do :
> >>
> >
> > This problem description is too generic. I am not aware of any use case
> > upstream where PCI or touch might need to perform i2c transfers during
> > early resume; your commit message should educate me.
> >
> yes, it's generic as of now since we have an internal usecase with PCI
> is yet to be enabled in upstream. Not tied up with any usecase in
> upstream, i just heard recently.
>
> Provided the scenario is generic and possible by any client, can this
> code change be reviewed or shall be kept on halt till PCI usecase gets
> enabled ?
>

If this is a valid scenario in the upstream kernel, yes. If it solves
a problem only manifesting itself based on a downstream design then
you need to exactly describe that scenario so that reviewers can
decide if this is a problem with the upstream kernel or your
downstream design.

Regards,
Bjonr

