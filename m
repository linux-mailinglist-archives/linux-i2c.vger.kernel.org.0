Return-Path: <linux-i2c+bounces-10754-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E74AA81D0
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 19:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F4385A4D53
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 17:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7FC27B4E3;
	Sat,  3 May 2025 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2gKFMkr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B4827B4E4
	for <linux-i2c@vger.kernel.org>; Sat,  3 May 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746292904; cv=none; b=YBioxk9+YmfdtfaMVBHC27z620m6+Wre6x53TGWXcD0yYih32d2yqEnqGx39XTM0rpYMZTA5f2xZWDsWZOK7lSObVoRk4LKZJVmYiso1RcLV4BmaXmW6FYNC1olNLmmWVC4cr+bua7I2lw7MYnCdzmcbEw4HNvflyU68AxfHdkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746292904; c=relaxed/simple;
	bh=FkqPTKKa1BYfGmOPnQ1QkH3rInAfKUq2BRkp0CBjjRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQE4CY1istfItTDSKVxdmNnkGwFTt67+tJ10jsTMMPKTCLIgG54pRdI39AP93WSm9c+biHi+bQ0e4FxNz3kZdYTo/LOZ6sDn4wAGONKIKcTgcqwkVT94iRMcff1djCwnJvgEJ3+YNl1//Ot2YFrx8YWAA/uevmc6HZfbGgyLOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2gKFMkr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543FtD6P010686
	for <linux-i2c@vger.kernel.org>; Sat, 3 May 2025 17:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CUPi73K0M4K8c3dJhvQF7DaH
	PF0crJym+waMYMfinqQ=; b=R2gKFMkrIBVeDakGd1qOJMFM1lsPaCsuL1Ou/N7k
	51cL4eIgHohEQVKhFQ/5k6V7LxXGxChYmtnHfIYctDgt0tWTcXArYUH9RlPy1Uwo
	cFq1yr3ge9eHVBNkx+jDCWSnXMWKMygsyc39vVaLEtwcpK6fKiN74YbKkPLZ2PI2
	MNdvXiWIdIkAUU/JlSAICZoKdeRthpFkQ1N87LhHxURqHGww/6EtHslqsi4SMimD
	51Nlf4JveqRfxvTDfYT38w+qJPfhIYarKLqVIs+c0HqrwYFP30oTmx+sTqhdhfRn
	+g0ZuUf4U4rutQMYjTa+VGo28MQ/KvEQ3PL1ZVKleE6BUw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbh78va9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 03 May 2025 17:21:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4769a1db721so82272661cf.3
        for <linux-i2c@vger.kernel.org>; Sat, 03 May 2025 10:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746292900; x=1746897700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUPi73K0M4K8c3dJhvQF7DaHPF0crJym+waMYMfinqQ=;
        b=CEinGxuoRc+DB9GQ7XOooG4g1FD95ZyyHZxotnuSN7bllG65yqSICykGy6tEvYBqdM
         DUzrayzOwrrOxkTTeWoNOXV+M+c+DMX9XYmFLzC81gG/KLvdjTyqQatEJ6O9KSqCbaC6
         5kwdoaYX2Tz3XvR057fDmM4qbTrkP0xe6rsKyxvuIxvygbyxqDKU4YaBWLsYceCfLh1D
         cA3NpBEFrlhIcp4GZpZT6UY7d2dgHyPzvYt+tDaOZNj4IqDSkWuH4ztwpjkfabcRGzO5
         jCbxGgTC8qdwCoN7i7F8/ReJCCpJN8/uqQM3wdQqparkcKvzaaZ7CwGzl3033y8S3MVi
         fCiw==
X-Forwarded-Encrypted: i=1; AJvYcCW14Jhm8Aw8QFxzmkUiCdi7DOG6agkCKnyxM1fKnVK0XxZ04P+VLyI9022t1kTL/LGolowPrDS3R7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJmknMYxKpDnPMORE5CgnryI+GagqqMwo3/NTitm+Q+4RY8XE
	3TfVnlhmbFOOzLXS+n9TLyn5NdAQnLGvf3RXQMZVHj+4oxw/YgMpAeu3JANus/TdhLwTut5aNGq
	vBMSGU9xsq7m0KA2uR3gApiWyDmOyHZreJPmG5rur1DFEbdRBR+LW6nKzhmw=
X-Gm-Gg: ASbGnctqh4Kcu8lePSwWWHXY+xkhsGWpIe1Ji/I70lCl5sB5E/C9UgbWfuO1fMM0D+f
	FJE/k0ddICgtW0a++B8iiPt3LaURZTHHXeuqSwgRER8XbViFdM+RkRMQYmv8ry1YLDLji83smIr
	Qf1WvWzf52O4jtuEq6Yd7GuiHgQc17fCvU7rwUQKO+rYKdBAZ2HD0xy/oIsdEFzXeZMij3vgtPD
	2GkWXIDwxRHzaxBvj7h5C/iiu2gI2IEpVFrbMIqCO2ji1soBW1d7GZvVTSvv07X7i1oc/iZfCKs
	/TmiiBP0XEqChvAOhFUKisHYJBWC1wC1WWcyzKVVxFgIV5RKHKFYWsI12H8aGeYyW9EVNU6YwKA
	=
X-Received: by 2002:ac8:7dc2:0:b0:47a:eade:95eb with SMTP id d75a77b69052e-48e00f625abmr15879751cf.40.1746292900334;
        Sat, 03 May 2025 10:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmoBZgMqriscERLtLJYJxOOTXkywtkwOsXpQzulxWIgQLOXUAe46ItjymMZEGDMLwcrBNHcw==
X-Received: by 2002:ac8:7dc2:0:b0:47a:eade:95eb with SMTP id d75a77b69052e-48e00f625abmr15879411cf.40.1746292899907;
        Sat, 03 May 2025 10:21:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f22a8sm878183e87.176.2025.05.03.10.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 10:21:38 -0700 (PDT)
Date: Sat, 3 May 2025 20:21:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v3 6/9] soc: qcom: geni-se: Add support to load QUP SE
 Firmware via Linux subsystem
Message-ID: <vpm4ee4bjuqje7zrpay3pllvcghh547yce4nbqgbeujgdbu3lk@fahrgwfjbrzy>
References: <20250303124349.3474185-1-quic_vdadhani@quicinc.com>
 <20250303124349.3474185-7-quic_vdadhani@quicinc.com>
 <58f46660-a17a-4e20-981a-53cad7320e5a@oss.qualcomm.com>
 <9cc6bdf8-ba4c-4561-962a-74ceb09b72a8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cc6bdf8-ba4c-4561-962a-74ceb09b72a8@quicinc.com>
X-Authority-Analysis: v=2.4 cv=fMY53Yae c=1 sm=1 tr=0 ts=681650a5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=vrWCv2ldUtsF7w5ASE0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Wpfl6CBpCeVxff7LCT4ifTGqyOlg0t_e
X-Proofpoint-ORIG-GUID: Wpfl6CBpCeVxff7LCT4ifTGqyOlg0t_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE1OSBTYWx0ZWRfX/MDg8yZtkWjP
 qrFUmA5F+12JNBaNU6RS3RMAXrlaqDo8pSiTZ+xBW/oZ7Y0INf4EC81cHZJVkgGRc/0hn5NQe7V
 kTDHIjWUsPmfAbBT54EAdil45C8D+1GnG+/5+V7DSD6UOn7Gv4K0mQk0sTYBsOgRvzRllZlJ7Ty
 AqTbm04c8GJt7qqr+8qYkOac+EKyRpqcEZugeu40f3pLjqzn2LJFsiKikcd5Kz9GXQsjveBaVYe
 YB1K5dGcxQH+sncE21n/Sy7qNucoKql17lHrj33KiCqDLJYkCvseLW0fYaH2/y7p3ktO/YJg8ml
 wFlnlgpZ6BQacTuEjpenAg4eFu60y5kSty0v1i4nUKzhO7g+wOlBuKlaecPTt5/N6oH/R3FJ0qV
 uGRoli8jLYCkfVTVb/eK/TES2wk8SB+XUOJmnz4Dexzpr18HO7zPtp494EtFl0HMJI0x9LCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_07,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030159

On Sat, May 03, 2025 at 04:47:52PM +0530, Viken Dadhaniya wrote:
> 
> 
> On 3/8/2025 11:36 PM, Konrad Dybcio wrote:
> > On 3.03.2025 1:43 PM, Viken Dadhaniya wrote:
> > > Load the firmware to QUP SE based on the 'firmware-name' property specified
> > > in devicetree. Populate Serial engine and base address details in the probe
> > > function of the protocol driver and pass to firmware load routine.
> > > 
> > > Skip the firmware loading if the firmware is already loaded in Serial
> > > Engine's firmware memory area.
> > > 
> > > Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> > > Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> > > ---
> > 
> > [...]
> > 
> > > +		break;
> > > +
> > > +	default:
> > > +		dev_err(rsc->se->dev, "invalid se mode: %d\n", rsc->mode);
> > > +		return -EINVAL;
> > 
> > I wouldn't expect this to ever fail..
> 
> Yes, that's correct. But including a default case helps handle unexpected or
> invalid input gracefully.
> 
> Please let me know if you would like me to remove it.

If you are asking for additional comments, please refrain from sending
the next iteration until you actally resolve all the open questions.

-- 
With best wishes
Dmitry

