Return-Path: <linux-i2c+bounces-12689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C230BB4586E
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 15:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 625501C8563B
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Sep 2025 13:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6B718DB01;
	Fri,  5 Sep 2025 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KGfTKInG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E441C701F
	for <linux-i2c@vger.kernel.org>; Fri,  5 Sep 2025 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757077640; cv=none; b=FP1isSyjLqbCvEekvo3Hhn+LeusqgchJYLdmthRo+dEWdABeEJ5xsIeAysW9K64SOvnRzlpcQs+sOmiKovB1VlepNdrU/Ip5d76F4ACRS9f0th5I3QiwzwcJPxRvpyUQDDcM0883HbeZGdnWWJO+vi56CqGBfGjk1GQT9rW4qxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757077640; c=relaxed/simple;
	bh=JsdLLPrUmGM8Tgv1FnyKp6BjjHIfVQSZbw506i21JtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKMcBi5QhQLnSWKhqiVhvmY1d1PmSsHCusLvihvOIUX9iUX4sNVNBG7WUc6eLOJgxG3J7q3G1qbWhVClDUeK5ZfnFYjrc5eR/kSDyaVDg2/pAubooBoCdAmOPOhD5JQGC5bpYQJL7mA4HZwtJws3YF5sm7/y6Uh3fWnijBP5X6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KGfTKInG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856uIe6013626
	for <linux-i2c@vger.kernel.org>; Fri, 5 Sep 2025 13:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KrQKZP3w0ewlZNuZWmqjmyoq
	dp+JRPUq5JvWfsJm8Eg=; b=KGfTKInGLH016v/bWWLBLY4d0AWU5cpjdf1TzVMT
	LlSQIhkrXp03YU/0z+2IQ+1BmyRxGELsUmBwhj9nwXtkIKjmGxJc7CWgFsDdusgx
	JX3DvgR/W0KhH9iwOqQLJ3UxkwEdMj1Tz6MBKVDTTBB1iTAQ97stY5Y/szaA8zI5
	kiaTdt5l9ITkt1eF5gTuiWSqEv2TOC3twYKNBQt2WJMqJZovXcXBKw++nNqA6qBS
	56AHOEsNm/PaEbjHIGMUCLaFovQJLwABBEmwpkIVMAi2Ba8E4uh7mQHVJBIpmQ01
	6KdhKYZUmoV1C90nxvpKB8BnjPxmYv5gpFq4YFdqS7SJkg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyf535-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 13:07:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329dbf4476cso1812272a91.1
        for <linux-i2c@vger.kernel.org>; Fri, 05 Sep 2025 06:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757077636; x=1757682436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrQKZP3w0ewlZNuZWmqjmyoqdp+JRPUq5JvWfsJm8Eg=;
        b=MDY0VjCPEXPqqOPILK87fsaY16qtM2PF841XvxXl6jebUF+VJ93BrHP4gBGRam2uSg
         aBEcCEeK9W55fk1i214jYMjW4weQOEyFvT6qWWN2V9YRFOOiq8OaLjQ2yisz/3lULhJt
         Qf6nKJCmXi4k9bWWbP2HdyIoviKbVeIUisq4wl4i5QE1KNssB8K4KRnGQ5qGhsEnXreF
         AViT1SAjZm28Ijb1SJEEWxYoMklUKlxcWWlsM1Cjx44ZZ751Y3ABS1SFv8eSIog4VWjP
         Xt/YOjvUj42IRn7UkxfStTXEGsQEQsUm2S4KSP9tlM30v/lp0FRxw+zucLv/oWg0Swma
         Qe5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWV8NYWYV9zJSqlQ9Nwfu9GDrVCFUMIVe9Bb/wn4V2/H7fEls8LPxkoYb1sNALKzpLEOYH0MEeAae4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV98X++3SIn2VsewHG+CJ/KPp2q2+8rL7TQkiniTRzeFeMRgi/
	qHSrE7CKP/Tr8EwHXUc6fz2MaYlQoeMwo9nu/HQD2bBtzZj5Hs1ZiiqO4Vpp2hXDALO/ISBlFbV
	zvTaZVVXu8g5ZP5/flpb9UtkfJJ+1y8DfZr43burNeCS/9KXdDpQSXKC5z7l5l/c=
X-Gm-Gg: ASbGnculoG3J9hbKq5YxQApPPfQYw3vNiKY9cwj2M8AbNwstiyxPYkXYqr4Z/gjcnUE
	yWS7VKaaLYuW8GIWIDwetVDJUqDC5dlTo8YTyhbNy2cRbxZkKGtenVwQw+WY+lHo7Z+s3tP4R++
	ez3UuSfYOhW3TIwdCZjqMfNJoKU3FsLL+xZhEoFN2Y6vVJGNvcR2wzspckVkiJJvu9yuS0HigNh
	X/XYnlzaNlmqSP1SDWNDDMY1HNyfOkwjfnWU2c6XK4QrkHdiCVNbJ9yOMw9AUzdo8Q2CkBBx6cA
	WIBzlliCrtE31OBhXHdmCCKvcfE8iqtLGWD5+n2dtqi4dDhWXYIKfWG/t5XQYV7DBD4V
X-Received: by 2002:a17:90b:384c:b0:329:e708:c88e with SMTP id 98e67ed59e1d1-329e708c9fdmr18453336a91.20.1757077636173;
        Fri, 05 Sep 2025 06:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOWdaNrn1TEaOULcrKSkZdESm8pCYoEw9CzGYfoVI1gFXNQjbHfv1K5YlHjOSkq90MCHN1Fg==
X-Received: by 2002:a17:90b:384c:b0:329:e708:c88e with SMTP id 98e67ed59e1d1-329e708c9fdmr18453243a91.20.1757077635494;
        Fri, 05 Sep 2025 06:07:15 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32bab2022afsm3689920a91.2.2025.09.05.06.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:07:14 -0700 (PDT)
Date: Fri, 5 Sep 2025 18:37:07 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 08/14] arm64: dts: qcom: lemans-evk: Enable remoteproc
 subsystems
Message-ID: <aLrge0QLmApr881B@hu-wasimn-hyd.qualcomm.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-8-8bbaac1f25e8@oss.qualcomm.com>
 <055bb10a-21a6-4486-ab0f-07be25712aa5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <055bb10a-21a6-4486-ab0f-07be25712aa5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68bae085 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CfLhDO45pqEqRx8ihX8A:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: bn4P5dNJuUBxmT-d5BKfLV4PFkWFuIah
X-Proofpoint-ORIG-GUID: bn4P5dNJuUBxmT-d5BKfLV4PFkWFuIah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX4AUB+WEtt8cu
 5ZqvvFDLmBNAqxzG8Pvs/qcPtyTMg9o5qBD80IE9JAp837JLTrII3WIJTVbEEpPmkYF4qNZCrh1
 KL7ghoAf/Kq+49Ris650m7dn+T1zfI+08+CEzNURvloG+AVCHwh2ZnvsEjniUekeyJCoFbYNpq/
 C6hyVU3Lp0/9F5/47PwAx2XRMbkBourTXgZcjyfl7IWfKxX9SY2jU6lhaeEjYPLFZNK4gt09M08
 JaANNiNSEJBzvOTZNVt4fLxETJVqx+M+c2XoLGy8It6WTSGPr6MokTn9jxk57Khh2Ex92vqWvec
 DbUL1+6k1T7Cw+KSalRpDBBQizdEt331p1bHVgVr8voltSN0LNww1WOyBpu9smowxwKgTF+x00Y
 IH2hQmPS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Fri, Sep 05, 2025 at 02:46:46PM +0200, Konrad Dybcio wrote:
> On 9/4/25 6:39 PM, Wasim Nazir wrote:
> > Enable remoteproc subsystems for supported DSPs such as Audio DSP,
> > Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
> > firmware.
> > 
> > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/lemans-evk.dts | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > index 17ba3ee99494..1ae3a2a0f6d9 100644
> > --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> > @@ -425,6 +425,36 @@ &qupv3_id_2 {
> >  	status = "okay";
> >  };
> >  
> > +&remoteproc_adsp {
> > +	firmware-name = "qcom/sa8775p/adsp.mbn";
> 
> Are the firmwares compatible? The current upload seems to have
> been made with Ride boards in mind by +Dmitry
> 

Yes, these are compatible.

-- 
Regards,
Wasim

