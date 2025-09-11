Return-Path: <linux-i2c+bounces-12864-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0091B531D8
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 14:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09E5F1C8625B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 12:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22C0320A2E;
	Thu, 11 Sep 2025 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ys/xrdkX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA54B320A1B
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757592920; cv=none; b=TmTyl9yIMKKucwlLWZohMVlxM2PKNb5XsQlI/YsXvumaQPtRc52ZLHd3gBoZxsBeQDqccVRv1NOnHj7jPnreZQEIF5TA8Cw+/mxWrjbxeylT0ze82Nar0RQRF8V+CXoyvbVljvNMx7i4YwCci0UoYIUg6b53qs3AO+sB6CEGECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757592920; c=relaxed/simple;
	bh=KbY+GfGU8eYAzle6VU7JlfVLLGsvLi8waFEDCQACGmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1iVjwXSTlLA4+s1aBcIbkTJ5dMJ/VauGbo7MoXaoOd+5Vk9b1I0SMVdDTAYX1Marp45ulxnFsN4CZZySN7AwRx2zX8F97ZbbmVbg7qgJsMKqDSjcdKO+UX+XelV94mu14pYgO5z3xq91x3i2hdtt/BQw7j/0HPyahK6NZqPDks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ys/xrdkX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBdn0A016208
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 12:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GObnP9Nzl1ngqqfb5uQqTa0c
	8SykTYTzmwIuZSpc42E=; b=Ys/xrdkXQnosg3YlpDRWCeLeLg8FbSXtg8MsXSpw
	AN/92kmr8tSxNnuQDnjH90RM2cM45oDGUsM1XtOMJJ4QyxoSh+OX5LEaPclOInpy
	7cUtWy70FAMS+Kpw50FxUHBSOIYjgzYpjAkXoY3Sw5Tp8uzqwIA/DnbzsIfc+Pl4
	qdHmZA7TY50BaEvmDngVQNVmk2W85sovX7rsd+k9Ubab6cOghGrzgPMxl4NlhZ/u
	OybwRPheFSvquObjVpGuPY1n1e+1aAe/Smi86+jgQ6HD0k3pPUjGlZnrirbN7rna
	eLYBA5mkqen6XKa36xi1PSiJcTZb4t76PvIKuyodrh3pNw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t3840qq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 12:15:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70edbfb260fso11965876d6.1
        for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 05:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757592916; x=1758197716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GObnP9Nzl1ngqqfb5uQqTa0c8SykTYTzmwIuZSpc42E=;
        b=T6YwpgWVJ0qeYMmVvNIAMHWCa+L72Vm7BBqN4S0RvghQ9Gp3/0aFq3vsWJmvVj2g6V
         W3p3dANnS++JsboZadxn80OyfE24Lo1d/TmHodoj4Ml5wt7p0B/YV0iD54txtlZ53JtU
         G7OxD8llW4EkGoPVzA1a/Zsj49VPw9wxibpCvN8Z3GAgcuYI/iHjnmuUKP4Q1Owsh7fY
         Gv8lvw4JuhfkZKi0qwN1abeIk6/mpfyAbRka6Vo1bLaQifJrGzDmY1DwFIUvTndy1ul2
         zOUKcINGRmu0ngjYB8cKi56CyLg1j+OZv35EONdYZr6P1TKHhPY9I4eAK5Wv7gDFn06M
         bOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6hC30n1vry8Br5BP76RLxjDgnTYK+rjAVp8oVCv+nEaVBFng8vVAAaQOyXs6AFBVNIPDlWzvekls=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUAv95EjuCeWj1csKOmuBCzLyRl6tbvFUXMKzHivnDKUgQQvgo
	dtRlyWMoeAU2ly/LoT9kR+zRUH533lD3U/Dv/67/Tf/vhPNRW0h5nopgWzs8QH4E2JU31FVFzyo
	y2qSkSc5V/ROfvV5jdqa1ARNjR5sX6GEBdXT/EVW3Cy534O1oB1ZIyBzKYMUgXbE=
X-Gm-Gg: ASbGncu2oQXra+yjMp6d1CC4zaqm1gF81bUKy7H2nf5V1qsxTsD0ZL/FZOmQTV3NAnV
	NBDLFu+gvQDxPyd2//pVoDZgQGYgZTXNIAQlGuLSRd0s39Tz7/GmHfMkHs8AS828oetw3dOiW9x
	HFaLtBmEcekiZHNfdWdd/SgbyLDrT3tCN/wEbt7fd5ZjE6L2ltqy7HSf8i7Ehb8igutruzCcYI+
	0pIhyPYEcD71oT69cl0crDvRghR6sqxg9uljsHwwxs3thSEmt0GJJcz16uta2mAVjgiKwR2B8Fe
	QXJXGWoZwin5ooJZHW0jqko59cVwEM0jLRVOgrNlsFutyEElsoFjlWxgOEj/hiSKgHAcO7VMkxr
	KVP5/je4EuGtwoEzojn4gk6GR+LGh3hkqsdWaKVx/++VKJmVs1aK1
X-Received: by 2002:ad4:5ca1:0:b0:766:be67:3e63 with SMTP id 6a1803df08f44-766be673f37mr367636d6.18.1757592916301;
        Thu, 11 Sep 2025 05:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaS5hb658YOvULqbl+MwDx8ZfHggQ7H5w2l6Z+qTVeR5//f0vC8RYh8k3Hi2nLpn+vGPE7Qw==
X-Received: by 2002:ad4:5ca1:0:b0:766:be67:3e63 with SMTP id 6a1803df08f44-766be673f37mr366986d6.18.1757592915639;
        Thu, 11 Sep 2025 05:15:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1c6ca914sm2605981fa.67.2025.09.11.05.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:15:13 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:15:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, vladimir.zapolskiy@linaro.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: lemans-evk-camera: Add DT
 overlay
Message-ID: <ex5oojf6lqti45joyjxpyi2ev4mjcitw4lz6cszu6lustrby4j@zzigwnu4pbxo>
References: <20250911-camss_rb8-v5-0-c078e4e22d91@oss.qualcomm.com>
 <20250911-camss_rb8-v5-3-c078e4e22d91@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-camss_rb8-v5-3-c078e4e22d91@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sYpkdNFafkRhtzHOWjab5GR-B_jTK4tV
X-Proofpoint-GUID: sYpkdNFafkRhtzHOWjab5GR-B_jTK4tV
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c2bd55 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=D9gf5YVWuHi62kVfqNsA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX6pJmm1Fc3D1J
 +QbYQstCk7/jDbMQyU9Axg00A5YKDObJcWjPSw08T5ZcS8m9cC/SyQMZdlXKlF0m0CH9f4cWMKd
 K8MrOAWD9kUfVB/W/wk9clXo14W5KPEOMobWDQf79W9o9axB+13Q4aw93hTjOvI2u0fWSs1iJt6
 H9QC5CZJ0CQtpqijyDB0GqZPPNt7LVhEvEYIcxT+uYhB8F3xIMMhO7n+9tPo9OgF2hT/ujh51eH
 x59riUQSOzuF0ECqoYdSOsN+R/x9/zZwq7bjdY0nKYv4ZJpwumF3obUZWnYzvxeFDAUfTqdFyRX
 V6nGLQETJPU2ey+7WupSgWLLqzSovPzlUv+E7GWPe1kHfxj1vBhy3FdI+LJS4fPIss+3xltftBs
 fEhUGgLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On Thu, Sep 11, 2025 at 07:55:16PM +0800, Wenmeng Liu wrote:
> Enable IMX577 via CCI1 on LeMans EVK Core Kit.
> 
> The LeMans EVK board does not include a camera sensor
> by default, this overlay reflects the possibility of
> attaching an optional camera sensor.
> For this reason, the camera sensor configuration is
> placed in lemans-evk-camera.dtso, rather than
> modifying the base lemans-evk.dts.

So, is it the only camera configuration that we are going to support?
If not, what happens when we get the second sensor or second set of
sensors to support?

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile               |  4 +
>  arch/arm64/boot/dts/qcom/lemans-evk-camera.dtso | 97 +++++++++++++++++++++++++

At least the filename should mention that this is imx577.

>  2 files changed, 101 insertions(+)

-- 
With best wishes
Dmitry

