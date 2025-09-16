Return-Path: <linux-i2c+bounces-12958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 832C3B58EB9
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 08:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF1C01BC2D2A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 06:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABFA2E0927;
	Tue, 16 Sep 2025 06:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVa8Sre4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3375B2DE704
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758005847; cv=none; b=ShL1Uul8g+DWSmcPHYH6o42jZ1GrsAqWFQ/yTVDmZ58Dneio5SgRCiF82+lygpusUjuiuSsZHlxDo0y0YUXJo7fXQBtT6cHvTB23m41/Z9YC4I/oByYlznGZcCB11+4qwsmkp2akbk4OT37GK1TSB4DbHGiAjcPLzWPH1k4wPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758005847; c=relaxed/simple;
	bh=VJqgGR+I8yQ3u1riqJusgJNxUJc7JbGh1X7CuNzrMz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUVQ/VDV+BqurBOIXG9+XOF8CAKOubshPE3RO9axAvt1fM5oKnoUqzntgdVnLHyTZZZkjFNt7rR+QXbHicRJG+CTlrdOVUQa8L2uNKo7cpooQ/MQrFAKR7xCJiyYboHgnuWLDnrCSzBzHF+m0sP69m6+P29iSYDwsp/el0rcIH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jVa8Sre4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3psZ4018472
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 06:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yDOD6naCP+XeV3EVxxXgXxWe
	VWa+eq7jpdDsyJP98B4=; b=jVa8Sre4w3lXoBUivmQ6mnN9e46kDSeXxdGBWGa0
	JfG4j+WY/GXv2C/PmWlnx7kJUtfjgSAmr3xOC5jGtMqBSGYhr5RLiXTGyCIxzDb7
	LUpVq94FDMjHLam05wUVqrOmzP5HnM0LSXpA2SEZ/2kLa6RGKB19hMYmSkeNXLIL
	4cPdD/NXIW0k/1p+317qN9PYGdEPSComfwjX9ZQQBDT4dAG3J7iIjEDMNGBt9EVz
	EpSbUNbamEjdNLpGFh/PTZ3Z3fpPWUBpszoFgyCiBkZSPk2uQAdw1d+hhZiKWSO6
	Q5UU2mFtt211TfDLK9C06ESo90+NzfgZ898aWF0K+fbqAQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9c46h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 06:57:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so4776143b3a.3
        for <linux-i2c@vger.kernel.org>; Mon, 15 Sep 2025 23:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758005843; x=1758610643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDOD6naCP+XeV3EVxxXgXxWeVWa+eq7jpdDsyJP98B4=;
        b=aAZFYB7vhbpvF/Qns8GgdOElaz9mrxpfXg6XJ26kQvjT5q999meZZYEDNZfekOuoq/
         C+4bXkJX7YKsr2cEEPKka6luH38Ov/1cddoZRYL2zrJqr6i7Oi/fNA+FHLX1CTVSbySn
         PnVZOz8DSA5qO5uFWqoleZpL2SrlAXY45TaqAjI/wgaXILALQ6g+1PIWKtZ537xK5WCW
         eO4VtOBEXTNON53PVF57X+oCfhk/Q2t4b85E0eNANB7nVCexEJN+d0NSbk49hU/9yuFe
         0eioATX3b7ilFekukl+h7mSs8RRdhbgG2aA3qxNM1S2F6DdVwOn0e+DmMfZMf3l+q/db
         nxJw==
X-Forwarded-Encrypted: i=1; AJvYcCWbQnEm7HpSMHpgDpg2aVE4YQWKSv8DFYXZQ0+TDvTJMxn0pdKRXF5VanmDg5S1pFs94B+wgEWmpoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI8/uk8+NUVCOeJUdhHsMivtfntv6sOJc19vvgozja6dkepQ51
	pjfhNQwRDCFMvZ8rXoLQt/QyiMbFdMEXxpT+IyLthw/tMbRbC/rLE+eudXbSN05hTkkXxFeBimz
	7V0fKInje8yTZj89ywsV2+Uup5ZoF9pIlrc8WiqIiL9zrmZrCjfR3tDN3wjdG5AU=
X-Gm-Gg: ASbGncuUWl6Fb3tFIPiD+DCA0N0bzQxs6Jxmqoc3SU7dnSpG8VTgLJB934zu4aexKmE
	SaoANklSMiicRMkdzdQ993EeNBAFpfW5gT+GPUIiCMYMI9QThALdZuL0DucQLAwrprN2PDvjo4w
	XCCorbPe6qS2YWRBCd73V1qBwtA8euQhSpLHQ5LmpeqXVhNSWb0dRwyXQCaoW7bmISl2rQFI4Zt
	4suBrGHPGlRCrESwA+I7ouJoDmQT14WwMOi7Meoir/zUTXT4yybD5SuTXTbJWJ8k9CTddxy7BQh
	ybdpru1UebzedZDJbaSceY73YmVVbB0BEAExYeQ0EwWe6UK1GLJjCnceWzyUO42ngNfY
X-Received: by 2002:a17:902:d589:b0:24b:270e:56c5 with SMTP id d9443c01a7336-25d24ca88aemr166330715ad.15.1758005842687;
        Mon, 15 Sep 2025 23:57:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4HAqsYboh1u5zQJIXFoukFFzA+7Y7eq8ylmhIrbJbC2vY6iiQjqmYMwdKUwYE0LFccwGbPA==
X-Received: by 2002:a17:902:d589:b0:24b:270e:56c5 with SMTP id d9443c01a7336-25d24ca88aemr166330495ad.15.1758005842191;
        Mon, 15 Sep 2025 23:57:22 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-260cf673181sm92629055ad.99.2025.09.15.23.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 23:57:21 -0700 (PDT)
Date: Tue, 16 Sep 2025 12:27:15 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 07/14] arm64: dts: qcom: lemans-evk: Enable PCIe
 support
Message-ID: <aMkKS6m0QEOWz7md@hu-wasimn-hyd.qualcomm.com>
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com>
 <20250908-lemans-evk-bu-v4-7-5c319c696a7d@oss.qualcomm.com>
 <cb2a5c93-0643-4c6b-a97f-b947c9aad32c@oss.qualcomm.com>
 <8f8df889-3f88-4b9b-a238-16044796d897@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f8df889-3f88-4b9b-a238-16044796d897@quicinc.com>
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c90a54 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=aPFnfdsyqS22SUcEH6cA:9 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2qLsT9f7dDMzhakoGF1x2h8ytyCHrt6Z
X-Proofpoint-ORIG-GUID: 2qLsT9f7dDMzhakoGF1x2h8ytyCHrt6Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX32Kb3mV0eNr+
 BUEX5fyaiSGY6ajAazTfMbl7WZY715S6bL+xED8ZEu0JDLskwr0vNJPpWAOUIhXETrW7J99qXjK
 GWw7etMItPWYTMT3G3KMB6tTygMfCElLSiUeTMogrUXpwzcSbkyrjG05PxkLPs/2a3pKK279v1G
 2Z7DRyTSHYaLOZlM1zz4/4QJL1CiRvCx4zU3y8vxsq2aeGVwJucvni19NIQ1/nggy4WJ6v+BS6G
 6WNpMNGYrW8IekzYcplTkKwNFyPNEhOVRKh8+TL7OfmPEM3g+bwYfuLLxrArroyDi78mrzVP0tq
 Ul3WbzYOsW/FRElLMrp8YRhL+f5q/czHmT1FV4Yx5gqunAYQqKmd4MN6UtJg+Ng8GspitYgTgl+
 wr6L487P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056

On Mon, Sep 15, 2025 at 04:03:14PM +0530, Sushrut Shree Trivedi wrote:
> 
> On 9/12/2025 5:57 PM, Konrad Dybcio wrote:
> > On 9/8/25 10:19 AM, Wasim Nazir wrote:
> > > From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > 
> > > Enable PCIe0 and PCIe1 along with the respective phy-nodes.
> > > 
> > > PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
> > > attaches while PCIe1 routes to a standard PCIe x4 expansion slot.
> > > 
> > > Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
> > > Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> > > ---
> > [...]
> > 
> > > +		perst-pins {
> > > +			pins = "gpio2";
> > > +			function = "gpio";
> > > +			drive-strength = <2>;
> > > +			bias-pull-down;
> > > +		};
> > Pulling down an active-low pin is a bad idea
> 
> Ack, we should do pull up.
> we took reference from the previous targets which seems to be wrong.
> we will make it pull up.
> 
> Bjorn,
> can you make this change while applying or shall we send new series.
> 

Let me send another series with this change, rebasing on top of audio
change that is part of next.

-- 
Regards,
Wasim

