Return-Path: <linux-i2c+bounces-13447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7876BCE6D1
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 21:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D6423B052D
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Oct 2025 19:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807E6301461;
	Fri, 10 Oct 2025 19:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bzgod6AR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF09207A20
	for <linux-i2c@vger.kernel.org>; Fri, 10 Oct 2025 19:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760125841; cv=none; b=LvU6hUtzX1tCCBiQHsWwgPqjRa/+y4FL1TusI9SQQ9kR5Vwg7tgu5nLTvjtjVBI8KlfNPWgpzu+1oI9P7npGhpDbgn+xg4mc9OO4wEx0EkBaKVO6tF6gh9LEusO3OCKjTiMkIM7Ez9vIscB6++FdvXuKLuAg6DCpQMH4BVbBdjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760125841; c=relaxed/simple;
	bh=sZavcX7kBLt8oeduhQ2bgNxm7Z4DXMA1Hszm3y3UiPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqfP+zrX83RggcyP9q6saeublfVGgRTuh4Lipm5vgxJdL1lM9cd2ahudDu1YsON4dFtp/Dh9CHem0O/xgoaYB7mkJuTmvGczbCixL9CK7dKQj1sJVE3A7KWHieZOiwnkKnEeZpom8njWf7GequEq3a5xY48RT3IT9u+iu70o/vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bzgod6AR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFEJD5001334
	for <linux-i2c@vger.kernel.org>; Fri, 10 Oct 2025 19:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MPyybomxgu4JiJKi3mIjCQ2O6c1a/UTqsQAAvieK8w=; b=Bzgod6AR/YHO0LhP
	VZfBAIInvJ46D4x5BNVlscPwq3gB31xhR+a4pezcrh/GToYoTBfEq6+os1/kh/cp
	EyyZow5wbKZdV2nyKKUTuY9bSrMUcPZxbqEoGicA1hcWNBRc++VtAQoXoAJMkgLD
	H+TjOzxyQKLYElYnb3y7B+IpsqBgFUxM0GHGFye+Ls3R7MYnHbbgR414Y1nYCLGe
	42OOuV1H0B1Cnl1E8ZfDdvTaSEaUtVDGTr2EFWy4uL3GpgggPtWgFRW8QE5km/TH
	kW8pKaKtU5KGFJqEU/iq8zjp/gxtBdgJGKKCmp0zB2Z4PZthFS1nOzkNQKctcgOV
	bEpm3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u7j42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 10 Oct 2025 19:50:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-865c7dee192so84823785a.2
        for <linux-i2c@vger.kernel.org>; Fri, 10 Oct 2025 12:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760125837; x=1760730637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MPyybomxgu4JiJKi3mIjCQ2O6c1a/UTqsQAAvieK8w=;
        b=Vb+o5+WESdF/XKHXeLic2TNxWfUrmp0CQJG4sQ7ifY095Yog4lRsr7UC5khJhCOrc2
         nmueZDbSCeld1Md26NKD8iesngtAhtGYyOADHMBB/zpb7SajV+aJGvWuiy8ud6be4EfI
         t6cG2coqUb6XuRIpmgVvk/Ez4i3iA8qCgkuCAKQSsEeP6Pm2bDl/LcEZhBq+WCYQMv2K
         VyRxTKbOW8gMQZ6BCibawQDm14tYpSN63yT3F6eP2B6ua6+FQ2bRgBzUFKMBWHyWPZDy
         mVKy+nMPKGiwp81NNqbbzN7mLQrH+VzTrlMWfhTYgk8TDVQ0tKZ8SGId2UrXtioYB7kY
         4arw==
X-Gm-Message-State: AOJu0YwhBMP5SILzTwgQsRFsga4QRmzLDm043vjjBlHcfrEMrtLwzd1P
	wfKc14zaRYz2TMWNR4HG3FyZeBsJZwTx1xRF79PrqzS0jNYtG1sfaucHPKkX5RvL7EPOvEzV32n
	aLoIDU7Q74HSI0Ws23un4T1SFe+fd4UgYU58aagXKmEUG/zSRviSkZ8EusdWXkZo=
X-Gm-Gg: ASbGncuCeySwhbzxk5m90OrqTMn4DkWbEgWl3dMwV3mizZstN+43IkxrT/23K4wQLkQ
	ujzq5xiUe8ST50NxrozAyfQkI2QmSpbso241rW8U58DDRhTlUfRVx7mE3Eb6mpwGIn4Xi6Yc8mX
	X9NlyJN9ffvE9/vjTQxiPYxj0iPfs3GmrqsLyM5iiB8c370j8+QT6mwqCPa2ZruMLFI4ckuyAiH
	qAX7bl12fN4rfokHf7fPAoDvJELaeyAs1oP0AXfBCWIrtl8jewTSix33AcxvbFo7ls8X9CaFuJW
	HlJrtUEnO9H8xXNJLcreqgLWbinFZHFR5hFhnVUzQB5P5+tjbr57o+vbG7JoDLDrcw==
X-Received: by 2002:a05:620a:4541:b0:7e8:584e:2de0 with SMTP id af79cd13be357-8835069b0a8mr1276200985a.4.1760125837564;
        Fri, 10 Oct 2025 12:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsEIpzwk9aNXeftPka4p5UZjxdoS48MGp75kzj0kB3Zd4ECSA5+ZSrda4I8ze7bAuoZpbvQQ==
X-Received: by 2002:a05:620a:4541:b0:7e8:584e:2de0 with SMTP id af79cd13be357-8835069b0a8mr1276198285a.4.1760125836951;
        Fri, 10 Oct 2025 12:50:36 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900e432sm291551066b.65.2025.10.10.12.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 12:50:36 -0700 (PDT)
Message-ID: <29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com>
Date: Fri, 10 Oct 2025 21:50:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-boardinfo: Annotate code used in init phase only
To: Heiner Kallweit <hkallweit1@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e9638e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pGLkceISAAAA:8 a=XDqENUOH4wWVrXOETPwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BpaLY-oZ2WMF00T8v2uUXvvb2tZDvnAT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX2FXnK6POL1Zj
 Hti/xHg8LA7DfRt5xXve78k9y/mJMNPjaIA3OeHC4B5hMuAWOJ7jDNxrYkoBj40+lwCLLjDa0pG
 p8Dtc38qfUhyxOyDhGMLlaDUCr0d2zkp2KThbuioTbopgvVb6WIxB6l1MWacgjk9rT5vPdFIuLp
 xgWIaMJxesI3tzh/N24+03iBqdg5hlyLUmAhO+D65wLYhCpf8S+ZGsKnD7MVOi7Tlq09BBGKDnI
 eFXHHp4mKyhzm8XqEyudTS22PLBP8a+97iiEbPO98V5Qa8oHq5zwD4qH/AQ5c8QDLQ7qwPFzbwl
 1xDF5L6ivTajlr+64aK05hTeOtt9Am3HzXVRlhSIE3Y89B9DiRb5yBU9lrR8jaCiYSGtHejjUPG
 n5ofp4rf0LwFF/DNbcZhSxmvtTcrFA==
X-Proofpoint-ORIG-GUID: BpaLY-oZ2WMF00T8v2uUXvvb2tZDvnAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 9/14/25 10:24 PM, Heiner Kallweit wrote:
> Annotate two places in boardinfo code:
> - __i2c_first_dynamic_bus_num is set in init phase. Annotate it as
>   __ro_after_init to prevent later changes.
> - i2c_register_board_info() is used in init phase only, so annotate it
>   as __init, allowing to free the memory after init phase.
>   This is safe, see comment: "done in board-specific init code near
>   arch_initcall() time"
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---

Hi, this seems to break booting on Qualcomm X1E80100 Surface Laptop 7
(arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi)

gcc-14.2 and clang-20.x

Funnily enough when I build this (albeit on another computer, but also
with clang-20.x) and boot another X1E80100-based device (x1-crd.dtsi
in the same DT dir), it boots up fine

Konrad

