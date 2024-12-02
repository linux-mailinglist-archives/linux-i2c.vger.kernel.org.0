Return-Path: <linux-i2c+bounces-8296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C19E04DF
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 15:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41958285630
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 14:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0347D204F7A;
	Mon,  2 Dec 2024 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myY+Y8Bf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3109C1FECB5
	for <linux-i2c@vger.kernel.org>; Mon,  2 Dec 2024 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733149637; cv=none; b=P/zJlS9/dtjlRosrM6Sivb2Ev782lHLiGA2H8poQtQEQ0e/af0OzhV2CsH4XlayQ4nmLSUK8ddgpgIm6+siFomvUsUxiaFF95x6xjT0UMukwnNcvwj14UdQe2IPsxL8FmgejtsvQULjQlSsVp0xs3taCSvzwSF/3jlDV9JBDlt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733149637; c=relaxed/simple;
	bh=+0lEVZpYuOv7o3FMPc0Pv3lmHWLz3wqPArGyGpNBM20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJRFkLDKPlMXRMtOIeJO9zW2Io3a1OQQWSxED60iRuOJ8H/r0Sw8KNIWKIFTeRCxUSJGAXvfL7DCWEmoAsKXiwav6MrhlCshfkUVBKsQgCCbv9qs79KvIyZONOCzQEdDiiO1+Ckn4IYS8M1cDVuppFcK/rJnFKVXwl+2zJHG3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myY+Y8Bf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28fpCl008710
	for <linux-i2c@vger.kernel.org>; Mon, 2 Dec 2024 14:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeWkuqOLf9DYYwHwIizxBSFI7lURFVcVl25PyvH6Ucs=; b=myY+Y8BfM83vi9/6
	KyvIhFydFf27ZZ0D8+FSH1xmDRyfOP5d2itdVgarA0LnYGow2Qa9vMVla2tyX3bk
	I6Npbco5QYdWo/rGV+EG39AjHz468w45/yvPx3fHa9k4vvEOZvAmbWRQyRCOwrk+
	28TZ4qKU8CDgeiOC4Pe8YP0UpDDxkCgSsLT2BSHIWbfyuLylBYPh2XoqPJPv9fKL
	OP7p9NA4MFBcgfIh4EljFLLJ/6NrjIjihjDhoUaZEjUOoYvbfav0FJ37p4RIBLP2
	iGWe5Id3ls7fPSeBGWCxyLJQJWKp0Y/Uru774w6y3wcSxUhhNosQlUxCDBB0AenQ
	M9YiXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tstd2qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 02 Dec 2024 14:27:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4668f2d0e50so6396351cf.0
        for <linux-i2c@vger.kernel.org>; Mon, 02 Dec 2024 06:27:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149634; x=1733754434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeWkuqOLf9DYYwHwIizxBSFI7lURFVcVl25PyvH6Ucs=;
        b=n+QCT5TSY3lQc6bkkxX/RO6aH0S+1tTonwyeLRGYtEJFJDo0fbo5BvATvl85v1J23X
         eKqUPhuTpr91ID8TfbAHS+dLRBG5D8wh77aUNODqKzRvjtOuNCl1Bd5MJAPcjDyS0VcA
         7tzJOa1mipVb7ZIEaEbKSkonTwaeb0Q3BCUBDSkH3VIBm0Hcezb3ymOSBrbU3ObH9Wep
         HSJttWTXi5YoxBvumoybkH12VyIgWXwUqYisUf381XYGd6YhbpRBNQmNLu3rC/BQ2axA
         r2zhVzP4sdR1hxhGY+lCYfiM0Fg2mhGc4JS1uq8poNpcdTeL9sQ42H6Ul5RGGzaO/SBp
         Y08A==
X-Gm-Message-State: AOJu0YyGqP/58uM50lQt7ijq3YIZbUsl8OYu0q0PqtdhgkwaJn3bMkU6
	Io2oH/7rIj1LMXBx3GGYKIdX/sEbh1KhbwJeVf+A3qFX15nBdbP2FRk8ctggJX7sOQwBtViTAz2
	bPZK/feSW1KxsicERR8471BDZ75OOX1AHc7HNN3L+P5n67m5mlNS088DEQHo=
X-Gm-Gg: ASbGncuPELxgaEUgkQRs/UTdZ0n96lTwd3t44D1Ls2AAfjP4EGbMQVVUCtPnvsaKxnV
	jsn4uFcbQgX2wf8/c6usk9yhmsg6jN91nJh2BvqqGtQXB10vZt+vcu9Xqdj2cEqjdIIGzxvuHQz
	8jdd5UBDrDYdJTft5ByCT3J/aBIBNdMXgO0BtATN7t8Ew1f1RGMYunGqEGU9WhHvU/xAsfKbcHB
	096ZPJyREmFM9AUKJK9AHG+x08vfFGzzrxZ6Y6ZxMAZ5OiQyYKQkc03n+s8AMBFusQoCgbfuBor
	UJUN1Reji3BJ1ChUtWMZgjy6tvIfUKI=
X-Received: by 2002:a05:622a:60e:b0:466:8c48:7232 with SMTP id d75a77b69052e-466b34b8be0mr143537331cf.1.1733149634226;
        Mon, 02 Dec 2024 06:27:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbCAAkr1jr6A8ylVsfj4i+aRWKGXXG6vAOJ8y8M6v6CeAJ/2w+sO2qpxpRsd+Y8DVmjmRKuw==
X-Received: by 2002:a05:622a:60e:b0:466:8c48:7232 with SMTP id d75a77b69052e-466b34b8be0mr143537111cf.1.1733149633883;
        Mon, 02 Dec 2024 06:27:13 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa599953c51sm512391466b.179.2024.12.02.06.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:27:13 -0800 (PST)
Message-ID: <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:27:11 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LSWAlkZj0GeNGgUDFm0pvvRfka3H-mgp
X-Proofpoint-GUID: LSWAlkZj0GeNGgUDFm0pvvRfka3H-mgp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020124

On 19.11.2024 2:10 PM, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5119cf64b461eb517e9306869ad0ec1b2cae629e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> @@ -4647,6 +4648,22 @@ usb_1_ss1_dwc3_ss: endpoint {
>  			};
>  		};
>  
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,x1e80100-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,

This clock is not registered with the CCF

Konrad

