Return-Path: <linux-i2c+bounces-12978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49566B5961A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 14:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9685A323234
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 12:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FCD30DD36;
	Tue, 16 Sep 2025 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTr63tg6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B514BFA2
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025515; cv=none; b=WhSqPRySxe9oaYHbfyeBfIMoiezJ24n2f/a/w6H2ixg9Gu3MGvh0huopGX+3z/wkti6oa5Metg78mDFvBdOm4111ldOVnXxDewEtc8GSBu/XOq9A59/OjVeWOaZJtme2s0w0mAK7AaXJfsy1NIleSgwEJFxDF0yHgqmw27qS4YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025515; c=relaxed/simple;
	bh=pYVRyG3Ofnpb0L1Y2+cXoG7kxZMxzvU+i1cFXSKD3ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttTiEYJYItUjYWfYcioAnpdulzJZV6NdpV+jh5Vtqrom3kxgFUSjyz3ZvoEI5X/VuxttFy5f9WLK18AnJ7BwNfY3F5lLQ1IErKw6PqEmmgsV9lg1kwgGnLonlpNssBhq+1ayPLj2GLVoYGrXLrvfw+0l0fdYQepm/AnPp18n/Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTr63tg6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA47JP012308
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 12:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rUHJ99Nhm6wc+crxDOeKRLBG
	ZdaCl2Lm6idkXPgbi40=; b=iTr63tg6bMh/8ofkmItHfBDoTgbgkxSsxeqAobW8
	RqPWU8Y+xuPemF9vlVaLLIJ480fs1yz1skKfhGckN0oN2LwYZXNizIaGotZJeLXM
	GV6E/+zuLBGKqjalpqqNanWrZDMWqz6pcjwzQVZpCIyvPyTWree1pcH8gPVrnbTL
	zspHCchPYTwaX/N/8OC9gfZGJXbhELE8htESKG1DEDJBWYNEyxcp+WgEirNU8N71
	ogIHxk9eHPC4QwDPhslpzqhBY914vcrJYiCuLjlLn83DnZsArXtkpS5D6nwZ0E4I
	whX++uOYCNM0LpldlBfCXLHAWrJXwzjuhT2tCt4tc4y0cw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12mfkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 12:25:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2641084fb5aso27175665ad.0
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 05:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758025512; x=1758630312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUHJ99Nhm6wc+crxDOeKRLBGZdaCl2Lm6idkXPgbi40=;
        b=QutUFXaMg9mY+9SJxbaT5l+E5MM+Ncswhxx/U9w0teP9Ne0VeSiYp0VJrTckLUFFVZ
         bkGPCP49LC6TmcoNHPEvI55hfQQN72fBhB8KNN0tNsvMfqRLFa6VyBVCSpmMMO8ws/bM
         vrPwufC9QqZOxuXpTGN3+Wgsfb6/ufqrhzRpwuw6nms/4x5LExir9J/B7tgA7QhC1dzg
         Vh+XZhJsC59o2UTQOyhKxNifV/B6lKvhuUWHi73Bm9GH5ht4u9durVp79ZieQR1ki7x0
         4qWbzzK4rFJ6EhUUvQdYgCy6mESRfARqMAIvQgJHvwWpohE/2MKSFvwidE+h/RnG2MhQ
         uCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRMUgxh/YRx5q66W57QwXP4IPlOrklJxpH/RPgP/jOvJtqBRwJfizwfCgbALeGiVaVdb7wlkL8e2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlG8E7DyQdBt2Cv247ixzBXAlzBEbsqWBGKRdDxYiEUUkQd1I5
	EjT6BmZeySu4Ro1CoN0lJS5SG73FBikyRPlKjnvlJ1OScK0klOPelcxqXF6hH73aza7+2/3Qtyn
	8BumrHPG/r6Vws+pOhtU/zgXsH5NhrnZnfqoK9HKmOB5HuJlPBXqyECW2qbICnP8=
X-Gm-Gg: ASbGncvh4k0FXEWj81Sp0GAzrzWNQsmOrH16pal+6o6R3aBW5MP82VcQnGJ1BUFF3Dx
	+xaYPp2zRp53AMykTIwJTPwTci9H4+hMxJCdUdXCVUDqE+UV3KIWLk+ZyjVMCCI8QbrUj3cTmCU
	dLnw9sOXUj71NFlQTrbBZGoa0mqkKYMPmM0npKLeJu/L3HD+UpcOnNq3zWH9zjQ2sCW1eyBvPGJ
	yxCbar0P6mL5NzHAqnafyxt+dS5dFyM3DYhiMR5L3CItnT8W5gm7tc/UXkm80mesLgGsBNYQ0/u
	zrk5V6OnlJVHGtO55yOTIQnvcNVePdpwXVIr0PpBCyHUWFwoHyRR31lBwEkzM9V9FFrv
X-Received: by 2002:a17:903:b0b:b0:249:1156:31f3 with SMTP id d9443c01a7336-25d243e7fd8mr146599135ad.8.1758025512285;
        Tue, 16 Sep 2025 05:25:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfC+HYU/Gm0Yu1cZZREqssXTo+RveyP0dKwPWuRl4HJg2G55Yk2LtJ6nUVxaGFtw1OspyhKw==
X-Received: by 2002:a17:903:b0b:b0:249:1156:31f3 with SMTP id d9443c01a7336-25d243e7fd8mr146598795ad.8.1758025511851;
        Tue, 16 Sep 2025 05:25:11 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2676a14c514sm51154825ad.103.2025.09.16.05.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 05:25:11 -0700 (PDT)
Date: Tue, 16 Sep 2025 17:55:05 +0530
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: Re: [PATCH v5 02/10] arm64: dts: qcom: lemans-evk: Enable GPI DMA
 and QUPv3 controllers
Message-ID: <aMlXIdgavXT6Ndt9@hu-wasimn-hyd.qualcomm.com>
References: <20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com>
 <20250916-lemans-evk-bu-v5-2-53d7d206669d@oss.qualcomm.com>
 <n4p4www37qz4hw75l6z2opeqks4g3u26brceyxi6golam7f5aw@raandspcihi6>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n4p4www37qz4hw75l6z2opeqks4g3u26brceyxi6golam7f5aw@raandspcihi6>
X-Proofpoint-ORIG-GUID: FLqQQwUM_qFIF3GW5w62T3P9wH_zqvCx
X-Proofpoint-GUID: FLqQQwUM_qFIF3GW5w62T3P9wH_zqvCx
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c95729 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jsWzJFLPBp6GKZhRWDUA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfXzjCCm49LYD/W
 GnFpXU3CUQh7d5lhzRb3YGiJfLKV/YDS+8cpD4exZCL5vXFqUSasJtGhPHzcAhI5RIykzCdyPLF
 roG77Z+EGxv+p2pRCGlBqim+T8ZhVSC9RCSytUMNRzsDgBPy5IAW29KzwYc67uT1mg78wcbec09
 lldxAC0vJO8L60/b+oUNsaVFwRg2aBOjJGXNdrNjpjCcXFEQGHgABO9UsrZ+FWsRHhf9c1Gdv0B
 I8PWjpfgNsyaGausbCgkWCaOyqWw8DCLg6cUPQVjGeuqq/E92ONew0BUffOvkE6hLGYd9fKspod
 BtVQ+B+lRNMBmux/hzTN0Y1CqERefmDuGbeM4bYP/H3nVY04vrOSHXfJ+jZHCBsq0YaZ19UD7//
 uOMoleQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086

On Tue, Sep 16, 2025 at 01:59:20PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 04:16:50PM +0530, Wasim Nazir wrote:
> > From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> > 
> > Enable GPI DMA controllers (gpi_dma0, gpi_dma1, gpi_dma2) and QUPv3
> > interfaces (qupv3_id_0, qupv3_id_2) in the device tree to support
> > DMA and peripheral communication on the Lemans EVK platform.
> > 
> > qupv3_id_0 provides access to I2C/SPI/UART instances 0-5.
> 
> Nit: used for foo, bar, baz and slot ZYX.

Ack.

I will change it to:

qupv3_id_0 is used for I2C, SPI, UART, and slots 0 to 5.

> 
> > qupv3_id_2 provides access to I2C/SPI/UART instances 14-20.
> 
> Ditto

qupv3_id_2 is used for I2C, SPI, UART, and slots 14 to 20.


-- 
Regards,
Wasim

