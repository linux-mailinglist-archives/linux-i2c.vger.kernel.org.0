Return-Path: <linux-i2c+bounces-13172-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF36BA133A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 21:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 663D83AC0C5
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 19:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ECDE31D384;
	Thu, 25 Sep 2025 19:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6pMUdgg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE5631BCB4
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 19:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758828786; cv=none; b=louguRWJ9TVLZlmlExGbIzB+7uGS+vYwZEjMMoZX06+jfm5ykPbS3a2L5zLgYkD3uImEUTBUwk7GVWqMJnyQjMpOeWcE1S5/X/4oEdqM9d4gzxIW4v4rD8WHxuJ8JKfPMTRhrynVfUrsRDFzIkioVLfcTmgm8zuy0tNsZTHWmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758828786; c=relaxed/simple;
	bh=TnBEnMqj9PcBFYUsBVb09AJzYDc97RSDWF7EDvNsZr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ou4QN1D/niLt/ydS0aYpiynQ5Yb84F4JLV6mpUOZh146Bp1bP0g4F+rTeKIbyqQkGJOqo+Kr22hWW8CpGo4aZ8PVljCs35YSarY18LTQGRJef915o5mYZUyF30Dpt+5zxH+6NZkr67ZJKOWn2TF3IauIQHPqIWESHflFxxu3mVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6pMUdgg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPqLE024171
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 19:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnBEnMqj9PcBFYUsBVb09AJzYDc97RSDWF7EDvNsZr4=; b=n6pMUdgg7o1HOrgY
	EhGqoBKaP6P2x8Bf+fJ0BEpsE9y7I9q+ZUsYD9Upeuz+1qp3rab4zpH6l0DAbCoH
	pGmpyB/yuXh5Jd47KllaZk53mhlUdOuw4ydqth+gkoXHHIgTQdrDzi47c8soowfa
	etPQT3hvO3eavu8XhEpS77QWY3YVZlzSSvKI5qX3j+4mO+/NU+gMsgj6Y1XEXw4U
	WhDf1QgSRAOXGbm3uHmYMh9PSrAWdsA0Uhd4Y8u0pC/419B4xZOj0S2e7LND0PPA
	QK9hgYURCbFTagVrzz0yEQN4QwrN+JkNtFJaoRotH10ta5A2cVZdvP8VY2o0fkb7
	T7EO9Q==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qr54m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 19:33:04 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-42594e15f1bso20371625ab.0
        for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 12:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758828783; x=1759433583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnBEnMqj9PcBFYUsBVb09AJzYDc97RSDWF7EDvNsZr4=;
        b=IQ7yt4F4XNxsql6wOvMB2hi/WJql5T4S6FXdP0cug3PfheszVl42xO9fy1ljQaO21Q
         i700Po33sL5AfOCCgJlAr3VIrfcr0Ah7BxESWxC+mRWT/E/0lyVlNunEZ2xyfLCMKDkv
         NK0H8TUhCxWaQ8tssrD8wNbSzpMcMP1mHmXX2CWEhCrk0ljXdFURaN3ki6J9Kpnw+EPf
         fHDm+2MbeIYmH3bCKvE12BQzEAptnjH+iUwwTVR+vgzFpTUU4DyQ+loYRSsXWj1REen2
         H+NWq2oW+Zu77l7LGIZLJwXRF78bhpYdH5/edOybZJWuF9Gm0qZuqdKl/l8S/ECZOwuf
         rDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5kL5GgSoyKC8HvEIbz/z3ExB+U3KWSqVG4dGAhJFgaowwZ8BjLjLaR6u5nRKUCMtK15aiBjyoV10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCgQnqn1bYlx6rqugzoFlZ0AwmDKLNTh3pTNeT+wxGFVEhdFF
	tf2SpjvQ6TJ5OoGFN6OEEdH0vQfLIet6KwEuvVsIQHUUEspNL3Hjland9t5dTvoPCqMgqYqeUkG
	SRrSgOL8lq8B6+HGcnokIo3KN+iD54WlI82lbuUWPgT2Gou9V5nNfAZGZaL81MutGrM2wuJvCKt
	DDtySq1J6cuVGB8gQjXMl9cVF3Pi1pr5ZFrzTGfQ==
X-Gm-Gg: ASbGncsEU1o3rkBUfv5ePtxqg/x+JD2clOxzumbknVN0EftoWpxE1LLJTIT86HJ9hQl
	KmhLSOlcXbKUGXQXuZGwYV4RNvwKKS40wlFXGzX1FSRTdMfqs2+IyJWMuVSd18dPzbqTBEVvDdh
	B1pDHFJMbyqiSicTK/Dca7mA5K31j8IJwDn8dAHb3BSdbEYwHx/ifg4J5q0/i1HkQkNBmWxCJko
	4AZIyG2
X-Received: by 2002:a05:6e02:471c:b0:425:70b9:243c with SMTP id e9e14a558f8ab-425955e5344mr62881325ab.14.1758828783020;
        Thu, 25 Sep 2025 12:33:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM8FpReApr0CA3Q3i/iHZMzcvXpITYuK0dqKpybMbm53VSYRwCkGk4q3clx06ZAwPs9BfYLZtd0oAmaJMnlD0=
X-Received: by 2002:a05:6e02:471c:b0:425:70b9:243c with SMTP id
 e9e14a558f8ab-425955e5344mr62880955ab.14.1758828782638; Thu, 25 Sep 2025
 12:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com> <20250924-knp-cam-v1-1-b72d6deea054@oss.qualcomm.com>
In-Reply-To: <20250924-knp-cam-v1-1-b72d6deea054@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 21:32:51 +0200
X-Gm-Features: AS18NWBmOViIv5jdU4dSvUosy08SUKDUBUh2nCRDhTzk4mlZzt1vwqBX05hLiQM
Message-ID: <CAFEp6-38buo3WafiiXUEUs8n-=SKgacMD44gGAd1pnEDAsizCQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: A7h0e8vZe2uENjak7NHosex73W9vstGb
X-Authority-Analysis: v=2.4 cv=bJ0b4f+Z c=1 sm=1 tr=0 ts=68d598f0 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=i1QE4n8HBj4RHUU_w4AA:9 a=QEXdDO2ut3YA:10
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7p2db9nw+gc/
 G/q3xtieWFn9bM6Uu5tl5QWCwwquES4mknoKYtaNLbXQOU9lcdevqv5GMIq3hfVbVnJOuA2itRS
 BQWgXf1FxmzedklNK1pgOOC0bSoXm8EjA3ghPfHQoAJ1aAmLFRfDBENkZ6BEH3CbpfEr3pgXaBZ
 wVD1oDbg5O8APR3zp5uitg06lPBs7jCOyDUddTfyLjH4HFLU8wRoTDM5KFwcFCp71/UTv6y5qh6
 dNskzgfaeKTdmqky584IfFFJ1ixVttN5CDG8G14S9rIUr5Qs/KxOzAd9DTEL9cvAfo3Vydmp95m
 nT86U61pjoB7wDXy5w1xVDa7Mr/av/zsaT3z5dO0OYus3uDVHF4LU/cjJToQqV4FG7w+S2f7qfL
 834W6gqM3/5CjM0cV+UYH4cut3CMWQ==
X-Proofpoint-GUID: A7h0e8vZe2uENjak7NHosex73W9vstGb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 2:02=E2=80=AFAM Jingyi Wang
<jingyi.wang@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Add Kaanapali compatible consistent with CAMSS CCI interfaces. The list
> of clocks for Kaanapali requires its own compat string and definition.
> This changes the minimum number of `clocks` and `clock-names`.
>
> - const: cam_top_ahb
> - const: cci

The recently introduced qcom,qcm2290-cci has the same definition with
two clocks, ahb, and cci.

