Return-Path: <linux-i2c+bounces-13778-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CC2C05469
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 11:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A9A03BDAC3
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Oct 2025 09:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E7C308F23;
	Fri, 24 Oct 2025 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIPDBXJu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F61308F19
	for <linux-i2c@vger.kernel.org>; Fri, 24 Oct 2025 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761296658; cv=none; b=imqb9H4yHUfrnB4TTrYHadjvhg/Tui+RJ22U4raw4MXNQlIPMDHyt2FNZ/mjmcwEBQNZm/cFEoDq2aoSfqkA/twKcoNoJqZQ2AdniP/UoOyH1Yew+rEAXPzr8jE003edO2x6lgTLTYhVDjY4owgiObyMHYiqngYKUEQUfHurj0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761296658; c=relaxed/simple;
	bh=g0gHpOAw3zIMj/1wPF3opcMcNJQ2q+c7c2Rj1F54Z2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p0nmaquQSi2pPvmFrqnPkqKOX6mlMp/iBPwOX5FbtAZDn55L3tu53rTpRTC6x1dyod7HQIpwp1XXIzq9+AeMYFiZny9qVwjE1IIW97jWyss2xm5lTHKRKhUJFwrY/nyUWYI/4MUB2WistB/JkqSoEZP1jsJPxZ9SSppVEpZNpWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIPDBXJu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FLOg014876
	for <linux-i2c@vger.kernel.org>; Fri, 24 Oct 2025 09:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0gHpOAw3zIMj/1wPF3opcMcNJQ2q+c7c2Rj1F54Z2o=; b=IIPDBXJuu4Wv4fTO
	BP0/CSW3yBaanAXa1ednNtDx193YunyIBOTP20xwJDrvYpfEVnRs8KRkyOsddfS6
	iPjv5ZgBFQKhxDAYe/knDFL4S2vx5eMxfpU3lLYEolUl9WIjTvgcey4iBHYz6Cqr
	PL6NXQdHKX9Tpcy4thmetomie/ra7ok2ckj9hS4g6stKsLilRJ8Unzpeoj7B9K1c
	V9YNoeNvO65iEcsRnZTq90Jas7nIZBHA+AyhJ5r+1ruDywoCvvmTfJhJBnsTcxIt
	yICX+/CC6H5gjaLlsI1zBVlmH//qMi73kUmhQNxDg3CVwR284C4ps9GJ6bd455s7
	+WOH1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pupes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 24 Oct 2025 09:04:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-891504015e5so515950085a.3
        for <linux-i2c@vger.kernel.org>; Fri, 24 Oct 2025 02:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761296654; x=1761901454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0gHpOAw3zIMj/1wPF3opcMcNJQ2q+c7c2Rj1F54Z2o=;
        b=n+tRCdyGagDZAcG0UAYJcVWAbI3YnFdQhYG6hlGQSeMI1m2kP2md/Sfz2xPyEmFlDL
         A7r8WRxUVehgZW7KbPDPeqaYixUqevLAytTnPg9r0nqlJJACCUK7lFZlywx0KdzGxNbC
         mJh+ZVZrQOxC+vu311l5Pvnz7kblsoGce7IKGcTYafMdtWnbR4AxIb7pL5tEy2ON/qdt
         UfsDGZaEv1NBsPcgH4VAryVz17POZqyoWj+pwQxCdfqCEbBhmEC+Z3zZG1be8Sp+rMQf
         n1MHOYHp2/4MMAzR+f6PpoXmhtzGMf0DRuzrzchy6+NVzgmeFzSckF5neazDR3CJHA09
         RgVA==
X-Forwarded-Encrypted: i=1; AJvYcCW7hlIbtAdbZsZ0UW8xxs+4qk3SZPlgRQSZe/CkNlMTLhQ6rh46Gxpq/SbhA8pZHlGcgcPvbb9kB0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSjqk7+fNeKSe4mT/azveSl4o4UJvhYPNlJ4QzbKq3OSN/PF30
	LyMH+Krf5LIQITABPYSI9SokrCXkRwVsyTIy3Yv2A2thhRqMRmkQvwlSK5XzGNohLlz2tAVhjjA
	NQm6C36K0ve/w4NuNoNN5CJINf8U51HXVV2tFPJcYwRXpB89NqXxm5OafTibWh27lXVM7QOdltk
	YLk74l9C/wSbc7FfrC8Gjj6/vhquPhjgjXjZArOg==
X-Gm-Gg: ASbGnctzAoNuk6CwSpig42kYGQ1/42NIrcWpWthIrgq+E3t5w6yLVtENWiSKiuruoOq
	veEnieiGtjunrGHFioQ1VjZ3LLyqRy/Ew/jIn/NbnbMr9uc6VIbWsU1JHUNrq291Ed17QnZDMh4
	+zUDIQEb1uW45mGYG2jepZcDWbC2N7CIIP2qWcNaa8zVpa3lShk8E+p7YTrs4EqPrZNGUN5v55d
	AWRf08IS2Sl8h9qK3tJWmukQ9W/wxGyuH1/qLsjzl3mQg==
X-Received: by 2002:a05:620a:701b:b0:85d:3c32:c404 with SMTP id af79cd13be357-89070cd842cmr3029014685a.85.1761296653925;
        Fri, 24 Oct 2025 02:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcH7X9I3oq3A8xpwU4zFj0woURu/t1UEGWZ4WrgfA2Vy8Iz3Rekx75D5h0egBppJT6eu7llttNgC/cYYRxzYQ=
X-Received: by 2002:a05:620a:701b:b0:85d:3c32:c404 with SMTP id
 af79cd13be357-89070cd842cmr3029010485a.85.1761296653367; Fri, 24 Oct 2025
 02:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <20251023-add-support-for-camss-on-kaanapali-v3-1-02abc9a107bf@oss.qualcomm.com>
In-Reply-To: <20251023-add-support-for-camss-on-kaanapali-v3-1-02abc9a107bf@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 11:04:02 +0200
X-Gm-Features: AS18NWBkyZO4ADCwbuPSpZ8_0D23U3UYy4lbimK41M10tmzNwaNW7w3WqyAgoBI
Message-ID: <CAFEp6-06bubGxeNqf0rK7Oe3+YDS7f0_wHPCDTBnXmT7taw7Fw@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: i2c: qcom-cci: Document Kaanapali compatible
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX2R23Smh+t2yg
 LCOm9LrOe/3cWfyn+RMK1s4w50J5/lxsbyMa0mx7zqa82Us/DpvScYURXfQ+Ro8iD2eQ7wBe2FL
 FDIzdR1BRm3H8qWaX7hXV/srh5jOGuglXofd9dBFUYKWedfnj4GHLbMb52aQE3FUI6Qv9dk8ADk
 yiFmnhlvOPXyeeemXiZMPVPLprcO5WTxi5iQzjZgpgRlCvz1nUjCNj5MC5xYg8GR0lKMW8EXKmq
 V8lAGuFPjNBU0h6A40T4/UlM1KaAMhdG8L211m9xsiOqRJ5ASMSyyGdbWLeJ/2ur83ClgA3osd2
 Ohnbxu8hE2CJaGx1BHPpnEocabze/7+fr0RgkFgDkPO3TboA8xau4ymKn57hjlXd9kUvqecsfkN
 U0GKHPPrHn7YcxGAuAYAQJn33+Py9Q==
X-Proofpoint-GUID: buS4efabJ4n6L38QFTcmlEOVgYeTFRXd
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fb410e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XIB30I8Fq4NfyXnsoAUA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: buS4efabJ4n6L38QFTcmlEOVgYeTFRXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

On Thu, Oct 23, 2025 at 11:14=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Add Kaanapali compatible consistent with CAMSS CCI interfaces.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

