Return-Path: <linux-i2c+bounces-12665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEFB4437E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6299E18869B4
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A4730DEC9;
	Thu,  4 Sep 2025 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OodcnVPr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43B309DC5
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004213; cv=none; b=fpG9C3+TvV5o+SYskDZIMuxTtZPlIG3+BBIwfaQ6pCV/xh0fWPqhPJE7fh0xyffK8ZiWabzCFO2uxoPud5c1B90tbYU5l6Cg1uvHZuJ65DZp5cCVolO/0Y/+DDrL2dwCjaErCfa0yD2M9QVISYRfLAYogYsexYOCppXemEbNSzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004213; c=relaxed/simple;
	bh=w2dejdkgkOfnR6ZZTToOeg39YeTLEfhrSvr2kuE6Luk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QB581j0hdNCuMZqFfpiLlmdJN8bfPJL+jlNLnYGuUv3Q7h4xQh+E/RCyjB+73FyN5xndd7siocMoSzaXJ8fkxIv3dpQMmJQVJ/VHBu61tnCLfMQQz+nIMLi/e5lcmkRTINd7QhCRmp3sRoifskPdT1tDu/X63+XTPTOVQ2Hj6nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OodcnVPr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X8Yw022166
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=194cO1GmvVxOIcn8RfAnyM1k
	UF1gEHExRQSWfZpXVr8=; b=OodcnVPrmCsLxy2Ifo65URS3b/n7rJGtjCtQrPr5
	W0/TwIJsPKYuipsemCHLWxwqDYvck4Q65+3QQ3Nu59kBnc+YuocNLB7DqX54Z7k7
	5PPbczjGmEifemYZq/NRv2bV7ySZG/bNC79Ftn13pmGDQCzolsfjT9CFjFFnmMqe
	b6Va5R3e1WqqbePZYivyGv728YorPdGIWJQOxfuTezpM0gO6ZWtdUJL6eTL527T0
	A8wC9B6xhzsxwnJDnb4cuVC+b7FeKUyz8LuKD3LK1vXkcka4grf9Mae0Doo+UtmK
	4z1dnxQfgzGfHWIBRhWArTqtx1X1rnQoEedB1BbWcpHk6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk981vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:43:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b30d6ed3a4so25105201cf.3
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:43:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757004210; x=1757609010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=194cO1GmvVxOIcn8RfAnyM1kUF1gEHExRQSWfZpXVr8=;
        b=YCfYtvK4FEbd0r8yRQXR0XYmO1nAaoVcuqHMKRGyRu6JZJInwkqe8r7xM86MgUmBzz
         +gyqy62Oh6KsdpzcFWSHxvtCYRnFPBRqjYpWEAK2AqBFt0Otz+xnTW1Av6SOWmTnzXhj
         r7JfalTnld2HA06IdvgVbYGXI8YoDTcYnJmKN+FimTxX3eNzRDIZPg4CFMjcWjmLSFxw
         gAfpVxqewt1qvysL3ELvdbbu+DBUZxWQIuysH9U/kJNd1vQ2it4byqHRdvKy6u0KoPs2
         hrMwLsLRSZowumRMltqQJ6Lh1YKIHsveW1z8gnJi2Tyx9keYbMnCaOPoJa2gYZ3cszDU
         Rmww==
X-Forwarded-Encrypted: i=1; AJvYcCXfIq8oHQDzcUeGHqx5snQosKPxbvApJbhLlw8fF8P73Gqn1oQvSNeUvJPAqwGeh6NNFgAU83wMmrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPe/q2jXUkOLseJBCSvWjo88+tt5XD98zBC094GNO4Qy+qQrPO
	5LKCOLEoTUeWntnWndKVunufXA9kmYlLplz3W7cWsyoWt0D8kDYD0FyR/z0MZCYm5Ttq58x8kDI
	Fbcm9MQtkRT2cCWeamztQ4BDt8SXhjfJWqh9hSywCGSxjmDlnksrvdU/pu5qBTPo=
X-Gm-Gg: ASbGnctpoucEVS4NHcb/oFlvusQIa9kJNLL4Bcot/vh8UlJdUCW2gEDyftucfnGBS59
	yzeHKpJ+759qOjnDWh9kWn/XtHctQPwGTWMZp2cWLlcyYmBOg767eo6Qv7ci1Sa4lL39T+ijh/H
	kh9cNm0TYn+8+PYdocIyFZT2M9WCOQ3BuJOvGgaRIVDJJcQAQUeWRa7z5dke/sNKCLVmxhhzz7K
	xYx+myjckSpkNvE40I9Kz0MLmUSZtIEpAYde8ukJm59TMkc12SIpaCGsbK9+QAlh/297J7M73i7
	MZ4GoMz1mvCbAI5bQ/5W1MoA7Cv+TcJLic+I8ol3Po9C3czy8aomqNt32D2Ot0cI6TC+OHca7Kd
	NvXQNPFH8KoIix/jEcSbuEkPyg5l8iMJQQL/pAtvo6facZ+ufQpAu
X-Received: by 2002:a05:622a:1350:b0:4b5:8c8:11a3 with SMTP id d75a77b69052e-4b508c814f3mr64210851cf.50.1757004210476;
        Thu, 04 Sep 2025 09:43:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoXhcaDoqYlrzIzgBJXwbTTQZl4p3OH3mRMEaeJAudeMwawR3Sn0KzCcUZMEdXKJuLkxKt0g==
X-Received: by 2002:a05:622a:1350:b0:4b5:8c8:11a3 with SMTP id d75a77b69052e-4b508c814f3mr64210331cf.50.1757004209938;
        Thu, 04 Sep 2025 09:43:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5e28csm1307921e87.17.2025.09.04.09.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:43:29 -0700 (PDT)
Date: Thu, 4 Sep 2025 19:43:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, kernel@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 05/14] dt-bindings: eeprom: at24: Add compatible for
 Giantec GT24C256C
Message-ID: <qya226icirpzue4k2nh6rwcdoalipdtvrxw6esdz4wdyzwhcur@c2bmdwnekmlv>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-lemans-evk-bu-v3-5-8bbaac1f25e8@oss.qualcomm.com>
X-Proofpoint-GUID: v4O_nrac014x41r4JAGeYWBmoVqQh4sb
X-Proofpoint-ORIG-GUID: v4O_nrac014x41r4JAGeYWBmoVqQh4sb
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68b9c1b3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=E0jHSIb16-xZ11K09xUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfXwUsuf84ZPWuU
 xdrZQz1iAs3dvnVy7cUJo3N4NJNOGyAq3GXfMJ8JXW+lHWCN4TGNl8Pi8ew0vXYYQDRURRTZj/D
 SCcG1uxkBoH+x8Kv7n4XSAmG3oL1yQXJtyEsa5qn8Y0qwgRheZlaIjR6VykSYrhVm8KyT/70mxq
 pgTWUD0mL3+5Xdz7V5cx/g+XtAdPqLYQBvXn3YBx0Fx5JyngJQ54Z6nwqzf+1hp5Gkh/kGPBJKc
 gpoH8GTk5WmXMgSjVG1ca9uBex0z2bwiadatqx/z9WAAL3K4QxU6+8ranbEHW4+TgOK5tW3VgP0
 hYrLPj/l2OBcNOwhqlqWQw3zGFrRxAdouELHfYvm4wyIvUTJqGOv0MYM+p4lQIoLupauAA92dQ4
 U9t0hUnC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

On Thu, Sep 04, 2025 at 10:09:01PM +0530, Wasim Nazir wrote:
> Add the compatible for 256Kb EEPROM from Giantec.

Why? Don't describe the change, describe the reason for the change.

> 
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 0ac68646c077..50af7ccf6e21 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -143,6 +143,7 @@ properties:
>            - const: atmel,24c128
>        - items:
>            - enum:
> +              - giantec,gt24c256c
>                - puya,p24c256c
>            - const: atmel,24c256
>        - items:
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

