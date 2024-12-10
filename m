Return-Path: <linux-i2c+bounces-8430-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C739EB8B4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 18:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C904A1888DC5
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 17:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71CD20469A;
	Tue, 10 Dec 2024 17:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="juteAGYA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC42F204694
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 17:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733853135; cv=none; b=PLTTczw95isM7qYIm6AU+hdxLwRJEl34ACp4ejXcKVUaDX4avC1S/H9tEYAqcqOMB0D+ehmNMJm5bMeollX+H9vwxWB30LzdBSucXUwwoB60ldoLkY6MEq0t1BWbrs+BKsElp2lPpqVV9ak4MjlCBWk2NCX8bMhrVE5MGhnP7ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733853135; c=relaxed/simple;
	bh=lLbLE1tKKDfeDdO+nD84XWjzeIie3h7aVvVDlDRciV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sj6clUeL/KYXAf2qGudkKmCAl7mLhbyhtjC9g/h7Il4l910uphpGjcChHRRdMQWExhXYKf5SwXRPJapGKE8dz+C4XY+cAWPXQbRq2S+89bnG65KDNTWgIcDllrQqYNpJFCvTBUcM35owWFr3uUNCSh1sjDlDDD/1mMAUq7oabvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=juteAGYA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAEmlQH029611
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 17:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ege3SlIBABNYQBfJL/StIBqQ
	Q+7IZD3RScF6Axrafug=; b=juteAGYAt8FC8DoBSBGM2MPvg6n2crWeIjqMgMyJ
	Vynt9dOSCdk149k6U/9E9j+4RfSx/VlOQciRABFgG9rbZpM5bRPwM0OnHaTTWMa+
	HhTaSFp5Ik62QLaLN5rzmW5CZAyjkTCkSNN7qmxdlRzhWdb0+efzFgtOKX+hxWuj
	zTr4wjIKYXBsOwrfPtYVKA0JWabm9FRJN6RVCDFDixYk6HLUsBwhPFq8lPMy5FuV
	H3bdrH1uWsXpi+WQx6xtNdkr2D8Ore1CQNNELAtZlZm14BQ9GUICkaf8ni69jLoN
	PYq3mmSbFC1quAFbkbZbjGEG5DlX85B7F982LXIFUHqxxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eqr30j04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 17:52:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163dc0f689so42719635ad.1
        for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 09:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733853131; x=1734457931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ege3SlIBABNYQBfJL/StIBqQQ+7IZD3RScF6Axrafug=;
        b=peI21z0L1ui57BAt16pDoIMMXoID8YkWOEkSB45M1TjGOCbAVeFwzbA3MQe3XjQ7wb
         WnfZqzVsduX67W0hA9NC5xnZMUjM92pYCFZ/n8DfqX1NDrvj1bnevQ6aCZTkAJLCVJ18
         nZyiVmq+Y/VCTMzAaJzYqZFmxa/jZ6emH9G0UqYnHf2sGTXJq22amIrwSO2mGz6d95N/
         0Kz+UfBrTMe2Cvt1hpbVCkh2CgekGpS32Uf69non6HzVQiZ5oH9hBJGfjvHTUBitX9YX
         CSK7hCLG7fcJJo+SfO5TPlgLPAzfIhPM5j6irJSMfbrgqKb5jG8dSDXgH8zWXpIMORzg
         mkDA==
X-Forwarded-Encrypted: i=1; AJvYcCVo3dVqIRKBpb18oNjQtG7E0cEPManJtlonSML8AMJK7NRoql2DHxGrCLwLyovQ+qy0Iy5e8andUsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YytaPK9yOserlHBLTliTUQLkMXo62fM84w/c+npGFaUyxU6nEH6
	YzqrnTTNopTnLKcBKz+qwiZJWYXzMaBWqCLRxvNbLspwlE48AC8hmFawN1o5WdbBexCLE1Wi1CQ
	ABRz98cW+zifawtPmiRSyy7avC3669bFCJ1Ii6sH4lAjjIHjw8p11VJU3K4g=
X-Gm-Gg: ASbGncu6YXy4SheYmxWZPMSKK/vWonvt1gRWgdkQXDzo+tlaPFHjLdnO672UtbkGzVm
	rZQH9kYASNdyKAD4b4ttkJLLwwaZzgfvYOYiuamwcnygAcU5cxE+6MLT0xCNBWksTVxdlDHdr4b
	3p7gp9MMvTzauigDn1WtP3NofcrLEiyH5GC8l4KZW8w/F6CNmI4Ztjz4TMZHVc7WzVN8evBL4tZ
	JvSje10o6WnmDrRFKHmaylU7cFufsgcxSa00c4HQMkK+bM+6Ib8BvpJNsvqzYuVPlV8UGkzsCIn
	GCdYfF2eF4d0KPnJtpyXtyZ5GgjKyMoJr8g2nw==
X-Received: by 2002:a17:902:d54a:b0:216:45b9:43ad with SMTP id d9443c01a7336-2177854b79dmr294735ad.34.1733853131325;
        Tue, 10 Dec 2024 09:52:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxQAT1KyS2RYreNEX6eE08vhGpymLqRJuMeKy20p+JsymYi0fZ8cLbEJRWiRwWdl0yi3dYjw==
X-Received: by 2002:a17:902:d54a:b0:216:45b9:43ad with SMTP id d9443c01a7336-2177854b79dmr294315ad.34.1733853130888;
        Tue, 10 Dec 2024 09:52:10 -0800 (PST)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21680814d6bsm5989185ad.157.2024.12.10.09.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:52:10 -0800 (PST)
Date: Tue, 10 Dec 2024 09:52:07 -0800
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v5 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
Message-ID: <Z1h/x+QJD5Uob8GZ@hu-bjorande-lv.qualcomm.com>
References: <fc33c4ed-32e5-46cc-87d6-921f2e58b4ff@kernel.org>
 <75f2cc08-e3ab-41fb-aa94-22963c4ffd82@quicinc.com>
 <904ae8ea-d970-4b4b-a30a-cd1b65296a9b@kernel.org>
 <da2ba3df-eb47-4b55-a0c9-e038a3b9da30@quicinc.com>
 <a7186553-d8f6-46d4-88da-d042a4a340e2@oss.qualcomm.com>
 <e9fb294b-b6b8-4034-84c9-a25b83321399@kernel.org>
 <835ac8c6-3fbb-4a0d-aa07-716d1c8aad7c@gmail.com>
 <f1fa2bde-95ce-45e9-ad2d-f1d82ec6303c@kernel.org>
 <8b33f935-04a9-48df-8ea1-f6b98efecb9d@kernel.org>
 <422e6a1e-e76a-4ebc-a0a5-64c47ea57823@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <422e6a1e-e76a-4ebc-a0a5-64c47ea57823@gmail.com>
X-Proofpoint-ORIG-GUID: DoVtGLyuugrZkmG9jfoMvTVlR6xcn3p3
X-Proofpoint-GUID: DoVtGLyuugrZkmG9jfoMvTVlR6xcn3p3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100132

On Tue, Dec 10, 2024 at 01:38:28PM +0100, Konrad Dybcio wrote:
> 
> 
> On 12/10/24 13:05, Krzysztof Kozlowski wrote:
> > On 10/12/2024 12:53, Krzysztof Kozlowski wrote:
> > > > > > I'm not sure a single property name+description can fit all possible
> > > > > > cases here. The hardware being "shared" can mean a number of different
> > > > > 
> > > > > Existing property does not explain anything more, either. To recap -
> > > > > this block is SE and property is named "se-shared", so basically it is
> > > > > equal to just "shared". "shared" is indeed quite vague, so I was
> > > > > expecting some wider work here.
> > > > > 
> > > > > 
> > > > > > things, with some blocks having hardware provisions for that, while
> > > > > > others may have totally none and rely on external mechanisms (e.g.
> > > > > > a shared memory buffer) to indicate whether an external entity
> > > > > > manages power to them.
> > > > > 
> > > > > We have properties for that too. Qualcomm SoCs need once per year for
> > > > > such shared properties. BAM has two or three. IPA has two. There are
> > > > > probably even more blocks which I don't remember now.
> > > > 
> > > > So, the problem is "driver must not toggle GPIO states", because
> > > > "the bus controller must not be muxed away from the endpoint".
> > > > You can come up with a number of similar problems by swapping out
> > > > the quoted text.
> > > > 
> > > > We can either describe what the driver must do (A), or what the
> > > > reason for it is (B).
> > > > 
> > > > 
> > > > If we go with A, we could have a property like:
> > > > 
> > > > &i2c1 {
> > > > 	externally-handled-resources = <(EHR_PINCTRL_STATE | EHR_CLOCK_RATE)>
> > > > };
> > > > 
> > > > which would be a generic list of things that the OS would have to
> > > > tiptoe around, fitting Linux's framework split quite well
> > > > 
> > > > 
> > > > 
> > > > or if we go with B, we could add a property like:
> > > > 
> > > > &i2c1 {
> > > > 	qcom,shared-controller;
> > > > };
> > > > 
> > > > which would hide the implementation details into the driver
> > > > 
> > > > I could see both approaches having their place, but in this specific
> > > > instance I think A would be more fitting, as the problem is quite
> > > > simple.
> > > 
> > > 
> > > The second is fine with me, maybe missing information about "whom" do
> > > you share it with. Or maybe we get to the point that all this is
> > > specific to SoC, thus implied by compatible and we do not need
> > > downstream approach (another discussion in USB pushed by Qcom: I want
> > > one compatible and 1000 properties).
> > > 
> > > I really wished Qualcomm start reworking their bindings before they are
> > > being sent upstream to match standard DT guidelines, not downstream
> > > approach. Somehow these hundreds reviews we give could result in new
> > > patches doing things better, not just repeating the same issues.
> > 
> > This is BTW v5, with all the same concerns from v1 and still no answers
> > in commit msg about these concerns. Nothing explained in commit msg
> > which hardware needs it or why the same SoC have it once shared, once
> > not (exclusive). Basically there is nothing here corresponding to any
> > real product, so since five versions all this for me is just copy-paste
> > from downstream approach.
> 
> So since this is a software contract and not a hardware
> feature, this is not bound to any specific SoC or "firmware",
> but rather to what runs on other cores (e.g. DSPs, MCUs spread
> across the SoC or in a different software world, like TZ).
> 

I don't think this is a reasonable distinction, the DeviceTree must
describe the interfaces/environment that the OS is to operate in.
Claiming that certain properties of that world directly or indirectly
comes from (static) "software choices" would make the whole concept of
DeviceTree useless.

The fact that a serial engine is shared, or not, is a static property of
the firmware for a given board, no different from "i2c1 being accessible
by this OS or not" or the fact that i2c1 is actually implement I2C and
not SPI (i.e. should this node be enabled in the DeviceTree passed to
the OS or not).


That said, the commit message still doesn't clearly describe the system
design or when this property should be set or not, which is what
Krzysztof has been asking for multiple times.

Let's circle back and help Mukesh rewrite the commit message such that
it clearly documents the problem being solved.

> Specifying the specific intended use would be helpful though,
> indeed.
> 
> Let's see if we can somehow make this saner.
> 
> 
> Mukesh, do we have any spare registers that we could use to
> indicate that a given SE is shared? Preferably within the
> SE's register space itself. The bootloader or another entity
> (DSP or what have you) would then set that bit before Linux
> runs and we could skip the bindings story altogether.
> 
> It would need to be reserved on all SoCs though (future and
> past), to make sure the contract is always held up, but I
> think finding a persistent bit that has never been used
> shouldn't be impossible.
> 

Let's not invent a custom one-off "hardware description" passing
interface.

Regards,
Bjorn

> Konrad

