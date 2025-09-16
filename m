Return-Path: <linux-i2c+bounces-12976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6D4B594B4
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 13:03:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D18D51BC79E0
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 11:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74482C235A;
	Tue, 16 Sep 2025 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CpKidFal"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF062C031B
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020587; cv=none; b=uj8r14we9yZ01wZl+qEVM5QW3yf4LBeI4XbwBuHpFBko91JMkAlYoqhpSk7lF6S194jfv0s37P0BpdkP1PUg+OVnFa602aHVm++ZMcbIaALVqp/B0X3juAcqhGq1Nn0S0Ij0lQ/Lsu3y/vsX8+Ynnh6mzgY1TZeIWpy8ujcocB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020587; c=relaxed/simple;
	bh=jCWoiLmYKgtosl3zfnsSg6IJaEKb9HxfTKRf3FW2tfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM6iyZNiS+LceYsHnTduzWBz0/2uZO0tNkk4IZV86GGgcfesRxvyY9PmCJcT9xe15wWRUR5YvSLxoVxJ943z66nKbn/pjJdEpHZXMFwjFlVrIfCk3Djsp72wjHeQlBs6PKiqQe7nlkaqsImg6KLpfZVr3gs0WYSTBXGsAs1zkgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CpKidFal; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAKluH020394
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aGWDhUBbPiv5SXm2JrRwK9rd
	9d5oa/pXGFvpbeXT4NQ=; b=CpKidFal8r8YMEiczKohQ78k+JXRhS+yUuEIbXS1
	g6MGu9diITl0kVe1nGEnCZSzRwAuokwfR5z4b0zj31Q0ofgXf948B4wKaX9ai/FX
	pkK8DL1A0hCfXSdRGahYBnsgBAF09ooRnAYUuV6ewg6imY9qn2aIVtn05jeanzMi
	wRJ8zmGPXMbJ9CdK4hr76v0Mo4Zxx1j2TSsZmL+MIFPI0wL/btDt0lGGIl0rlVf3
	khiY+vyNb9Pd4VLsqUBherw2zb9usklcJYxRONlTBs7zSROcQ2CI6EO4J03+fq28
	L39NP8ukiqo1PCmCImYkLxj0Ii6ZlfjixaZt7+lJRlBa+A==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chghvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 11:03:04 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-54a2beaa1cdso2960549e0c.3
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 04:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020583; x=1758625383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGWDhUBbPiv5SXm2JrRwK9rd9d5oa/pXGFvpbeXT4NQ=;
        b=sjyRVsTp6YWUU5z85WQDOaczzRQlw5poJJ7lRMQqt91rtUhCUQEmVpJk9CalB7Vr0v
         Z8Vo2S7iy+DADlSTZLB2LmVFsN2Uu+juW+QxqM9nHrS41xMSfMAMpC6pLQFTui/2Dxky
         iZoUKmRm9YJWkNse+b3Q3P1LQTRgzMaPesHDYNs2pcpx8DIp8yD5h3SdUWFzcA2Gqqgv
         TdKEPFIotHnU1cVAlO6PPxH+HrvJjZEYnrbBG5vXJqstS9cDM4fqV7ilTzR6iQi9ix3X
         jHRDagD2GTrqjQ4Cp1q9cr1k9rJ7GB0rUxzVgsp6PTe0qLxrJwrGL2EN4NqPi61QaHi4
         BIfg==
X-Forwarded-Encrypted: i=1; AJvYcCX8uLjiDvDyPF93csWGHepxKjf45wBjBYNrb3IEBWrJDtJeV68KJ2kpJBLlVKEG2WeLAmBg17kDbic=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGUByzePi9MvN1CkuR5NV2TZ3h6sak5AOtToE6PG+VQJefxDz9
	TV1ChQJg2OUPWMqDVheXlk3GvcWnh3RAMwLCNE4gNUEKdI359QHrnnF2tk7Zjn6WW5dsMt4a26g
	tVfgVHrjV03XFh0KUakpEHV1rUnm8hI7tG8h37X+5Ooll3sn2o0EzYTFU1IH/SS0=
X-Gm-Gg: ASbGnctJwvLoimUmB8SY0EQbfF7xLqyAB2fuZnVM4lOkQAAGt9RiGfPBB94ZKHghKg/
	4/nVAlJZ+3AEhiNhEt91KKb2j0zO7FLWJQOkdW9wtEL7D52U3xpDkJGs1j+g8geffAEDXGPwBme
	7OLoe/O/M0luWmSZAiwgktbEIRHr2yi+XqJNqK716ui4CzTQbVyrOvsXl5QMkVgtUxv+VhrpQ5F
	9JOUuZAmJkzQVPYc1qPIt/N7w4g2rwwDGA6Dh+x3eKrlQ+lBUBy0cj8mqMLoabQwPhtDs3gN//f
	dOFGEdmuhMrmd93Vk80QTQ4BxQcDEDp+d0ydQtN7+Vaifss1D9+G1srQ83zMZWi2pwRY6mXTpam
	6bTCS/jd3mbt/9p+h1a42gAyU7GyjEQ+k0IuJ9IEp2QSVvX1gEuUz
X-Received: by 2002:a05:6122:896:b0:53c:6d68:1d31 with SMTP id 71dfb90a1353d-54a16d07e94mr6109258e0c.15.1758020583430;
        Tue, 16 Sep 2025 04:03:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8pmwdL5aKOwSmINEgbn2GiMkviQ7ZG666F4+/PsdQLZAgj5aiT/QrcYUMkStouRwCE6p+sQ==
X-Received: by 2002:a05:6122:896:b0:53c:6d68:1d31 with SMTP id 71dfb90a1353d-54a16d07e94mr6109209e0c.15.1758020582881;
        Tue, 16 Sep 2025 04:03:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b6167sm4429373e87.25.2025.09.16.04.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:03:01 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:03:00 +0300
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
        Monish Chunara <quic_mchunara@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/10] arm64: dts: qcom: lemans-evk: Enable SDHCI for
 SD Card
Message-ID: <zw3efwluvdru4dyf5ijwmsewemlth3dj5oo6gcpkve254myrpw@bfuziw3jfber>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-9-53d7d206669d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-lemans-evk-bu-v5-9-53d7d206669d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c943e8 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3hZAb_iNorm4NPqi49MA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=hhpmQAJR8DioWGSBphRh:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: J_P84L6YLNe1xyH46rL0UyYBochkbkw4
X-Proofpoint-GUID: J_P84L6YLNe1xyH46rL0UyYBochkbkw4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfXzA5EIHc0ZVMn
 g0HuKcIQ04rl6OUCOOFkqghQKpYGJw9PdZcipUW90DZDKm8g1GXiqA9zp4je+etCQ63zARws12J
 7Zz8mwufXOlimwCjOB41FWOxQt+TZ+WoV7Gqf8EQWEoEVqoAZsd6e7CTdADpHTkUXJR+CoIuvQP
 MeNfVG5cxypj0ap7MHZIBZhKEtWMiMe2vOc8lTUaHTzZOIbjXQ71BhOA4clFpVLG5mJcwQYjK2f
 z5mXhyMQOL+6tiXxdZQkcy5AVF+6Hqi22x59sh5H6MCeTmZk7eJ0lqijCtoimpKOG+9JP0BaZG0
 8xcQ+KFZ0qA+bmzoZ6LqfSf4sFGWMggpfzXlbCPuXENDarEMGneC3AFQhi8TfOjoA/l6H1DeRz7
 54QzuA+/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036

On Tue, Sep 16, 2025 at 04:16:57PM +0530, Wasim Nazir wrote:
> From: Monish Chunara <quic_mchunara@quicinc.com>
> 
> Enable the SD Host Controller Interface (SDHCI) on the lemans EVK board
> to support SD card for storage. Also add the corresponding regulators.
> 
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 45 +++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

