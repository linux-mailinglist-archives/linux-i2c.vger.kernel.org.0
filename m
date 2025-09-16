Return-Path: <linux-i2c+bounces-12974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DABDDB59497
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 13:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 094BF480AB6
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 11:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEC62C0F90;
	Tue, 16 Sep 2025 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWrnFyFJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA39C275878
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020482; cv=none; b=U1HmfZRrKw6nyPJBRf6vg20JIYD92HLV4b9tARs6ThuzkOewHMUDnrLwFza0kN+UwoSq8R1rN95aUqEs9peUaSvdEDZpMiZvmhoB8/xY4EWKEfnxg2EOew2Koje/vpkVjirItXXxpY6qkPZChO2TCZHnZMJoUhcrWY0BwrV9Th8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020482; c=relaxed/simple;
	bh=NCB9zn+1OoC3HfwDpn00j2J+X9Iiwehic5Jfs6gBc6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS/BpBADO92XNF5wvQVa7p5P0/AYQKGwiR4XaySN38y+iHijAkTXS8wxlrkkKbZnbTpje3Me8slTd91RffYHEYQ3OOBeGQtrsL47dThNzoQljJnHRQHITMf1i1WeFTwEHf7jBulFBVddhn8lrBifRmIsx6RPqCtrvCQ8cGgcGy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWrnFyFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAdiEd018564
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kVUremSztL9SXw9vrpclbs+f
	CQ2ClcMRdwOTbzI7vMQ=; b=hWrnFyFJvxm6g+Lift+rgcEvVLmDxPebCs81lC9V
	M1SQ2Du/4aHvWlV+iYY6FitiLKOefbQSXdy3nQ4KgUkZX1zgfKNn/5CymZVnHPQf
	/ZDFCruMcP1nakG0b3973jNJKnLj6vH0culupLgKoSXM37wK3mhSwRXU6tnzDrpe
	j08KJUyTXA0vp9yPWyA9+RSsuEWQAFIcdaAsJJCSWhdwUV9+5lSa8DWKelV4kcfU
	bymx4QqGW8+HCmDYZKDZx6nbM7GxcrX56+JMfUqSgjria5FX/lMhCo9b5rgAo/Cb
	Xz82PeTIxro8i9Ac+C90NeyZ26Ep+Fti4W4/GGeu/Dzz5g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9cyxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:01:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b78fb75a97so33400541cf.1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 04:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020478; x=1758625278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVUremSztL9SXw9vrpclbs+fCQ2ClcMRdwOTbzI7vMQ=;
        b=rfavn3dkCa/kROkLkm2wzrJPA1s4w/WjJLWDegRHo9NH3KCnUwGfF4l3/gi5OuTD5Z
         jAh7CW28UviOgidSuJBkJElmbU+fprw9Six6xRH5aC0HgHxAHWMjFD1lk1MXVTsQH1Th
         6cxzrlaAtmRP4eZQ1RU26D2LGPlcEoeueWLXGXhzNuowlX/WxRtSJ1PtE18EbpbU71WX
         LWhtvp8plkmzrTyj38J79bEvBakcVvE6RlNxbnQkHN6fsQ93j8C02x7bf52x0rgcDgaP
         KEncHPRe/IL5zj+A/cAZ5T+aXDRTdvnJb8tKBkYqqmX9srE9xqTkD6f76uN/7pxt5cyc
         cLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZQnhUPACswq9STTbp6ijC/AxR3C1k3vhSLcRuemA1ZowcqERjckaKmgOzUeOqkhytt3o+fir4loQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLxJ4VLvLXyOefY1oVgv+d2mK2fO4rqxCGr/CSsJYj8+kNmEfU
	F1sEZLPrH9KzpM4si+QVtR1HvZyi3KijaozO3Dl434FmgJqOG1vdpuvA6eAXV6J+D7ZeJO/gr8Q
	MBeOqRp4Kdj+Msyv3CswgP3v+Vp25FIlBZsN2jAful82jSDMrTRFJGyLI2hXMnqj5WZV7DRY=
X-Gm-Gg: ASbGnctvJ8SR+PkgVL4ic6XuFz5eP/Ipqcv1fa0H7H8xx7rCmQhr4+ksqxBfc+Cr6Yj
	7+C01K+Zox65+3KYKbXS74F2AB7mykS2xvaxyQ93qlVaWcye2TmFTQxLtP8n5RPktARIcpbj+MP
	vm2NuYy3hkwg5bNzQTeUkjJ5DNXn3JY5g52xDbpfW427O9uNbrzu2NoKxJa7PtbDmu7cBq4DHLt
	CDSBBuKZEA5c5yZRTVvHL74uOvJRCkWvs/Rk9KYfifRub3TzBTKV3bSKMz7g/WoK/JWkFJu2ofC
	er1/0tdBCvvG6XRpAZr0VBV440rLoNHtnT6/y5BggZnDlVKc+satVlqsDrgDXY+MbXBzlQzEK30
	aOm1r/SOptTA5CgOD+SQR8JVhXe4Y5lriAEYO8EaMGWjsUFW7uoFt
X-Received: by 2002:ac8:58d6:0:b0:4b7:9313:a35f with SMTP id d75a77b69052e-4b79313a964mr132544491cf.2.1758020478213;
        Tue, 16 Sep 2025 04:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLAF3UeE0KRBiIqMl1GqNbWZHZDnQRL51kIuIAuObbsA7nu8iKYJBvUfO43iyEhrcGCg745Q==
X-Received: by 2002:ac8:58d6:0:b0:4b7:9313:a35f with SMTP id d75a77b69052e-4b79313a964mr132543501cf.2.1758020477568;
        Tue, 16 Sep 2025 04:01:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63cc6sm4391757e87.66.2025.09.16.04.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:01:16 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:01:14 +0300
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
        netdev@vger.kernel.org, linux-i2c@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/10] arm64: dts: qcom: lemans-evk: Enable Iris video
 codec support
Message-ID: <uega7zdkprvk3ediiu4lykiukf7iz2wgk56c3pdloqrpzddt2c@yc37f6payhca>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-7-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v5-7-53d7d206669d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c9437f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yPPeNZB_paKBOZgJB6kA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 60iFrWV9B8lJx9YZwi_DRoiTIeU1teZ5
X-Proofpoint-ORIG-GUID: 60iFrWV9B8lJx9YZwi_DRoiTIeU1teZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfX4/fSONCHQRH7
 mM0JK5bW2HCr/egUaG9O/x3HGj9xN1nZwLQTtWHyEih6fO9VkZX3RLqQdS688aZs457vo66R/F2
 yHOqc/rBfDZjb7jGK0KOW75Xy2TTJeNpivOrilps0YSkw5x6Y4IRkF9qvYDWRNqfMwIpeIi4NdX
 lcma5xEhMx942oPnnA+zUdqEg3Iw17ZgjGLTM+MGodbnT277nIEJY8+Ue59nNRR4zMDM5HcjTvC
 E50vQkSt29zdNTy2xTFTiOQSeGQDl+DKQNzvCIiOyvORT7Y5XM/MbelQ4yO94IS+Yn+Z10/k7aJ
 6e5l8gv7Bi9GiyVIQWgN+XcQVUqK5kP2/+VNkkyaK1Di6QTvX2/2fhpXjLu9GfwEw8ZkVEBgCCW
 PHyYfYPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056

On Tue, Sep 16, 2025 at 04:16:55PM +0530, Wasim Nazir wrote:
> From: Vikash Garodia <quic_vgarodia@quicinc.com>
> 
> Enable the Iris video codec accelerator on the Lemans EVK board
> and reference the appropriate firmware required for its operation.
> This allows hardware-accelerated video encoding and decoding using
> the Iris codec engine.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

