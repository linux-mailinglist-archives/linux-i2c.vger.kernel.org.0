Return-Path: <linux-i2c+bounces-8297-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B227D9E06AC
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 16:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 973D6173BD3
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Dec 2024 15:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5BF204F8F;
	Mon,  2 Dec 2024 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBqXi62I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474AE1FCFE8
	for <linux-i2c@vger.kernel.org>; Mon,  2 Dec 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151751; cv=none; b=WhewiJmrWiDjycWJoYJp+oP2j1GicekhRTpkTX1CwkkkI1jWar+kd+FEHG3/Q1USATxggjT4HjLxkN5rTm00MWDlGLWWofv3xbcfmURYKzJA2xEkV0zyYPrTW1E4Zs/Rop6yTiDER+JxV9bPtU3HTbybyTTl5302HP75KOZp1xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151751; c=relaxed/simple;
	bh=Tss2wX7BVTMGLLgBPwI3Bxd0nhDmhT/WVBqiMlc+Up8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUmmGNEcvd70qVugxJkFk8KzXYuH7rvdAzh2H9nOi9/nkuKpIn7c6JSPkI9ky9uh/uv+oAGYqMEwgOu52gxMybiTfmzDyiOxBPLC/PdhX4kCuNH3lExa63/wIBq2KOO9QyCeuqIC53Pc0NtjTG19mpELzeQx+RIl7eIRGcMZRl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBqXi62I; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dd668c5easo4627009e87.1
        for <linux-i2c@vger.kernel.org>; Mon, 02 Dec 2024 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733151747; x=1733756547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YvM66VLjGaWFMoBlw0v965vjYa9KnUHS0gdOSnCBuU=;
        b=gBqXi62I/Aag3MjA+zhShuDWP3UFuchk2GVFlIRZKWrbvYGMzXko5zbPLI9gwRItP5
         6K0hMuwez0ls52h28yW731k1xIqGRkxipaqqwvvIiEp9Rac3YyrNDlHM6E+bCdkzyl5W
         0c720nvOv1XODUMKy/WTpvLq1WSCiZRm2wCUQt1Zplc5dHfT7NmCqrPG0KpGE56ECgb7
         Bq8CYdPP0MZ8FrzdYQqJ+ijpwjLJG8rqH1QfpRkhgbOgNQiYrEwHObrMeronAlVpeJ2T
         kWSZhat9PugcZz2PtwXJw7cDCN9uG0MKucA04EnsM5wWCpEtsHcz9W9bNO/squ+CjYFV
         Uapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151747; x=1733756547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YvM66VLjGaWFMoBlw0v965vjYa9KnUHS0gdOSnCBuU=;
        b=M7G/ILGVYpzJCpskQmTOcTzApkpAyHR4eCdzWmDnQm+nvUY9JfQUrZw+SucKEVBm9u
         z0T7FbzAbc9GY3P17c/NWaDELPZp7oj+akKRUIL0QdY5uv7j6+kgBLUodQ1khL38k7jk
         mirGO+NJ7iLQjsnUtd4B9AmB3t2K3f4XQPfqXSOBrSvKZXBsNNTtOR44ONAkIhTwLuF3
         rZH3avD/gRf/03iJV+u0+C5pU1QNqvRezHJhDlnOb8VnN4vK0wmTo4FEioeh8Glw+nZY
         SLanFgBfXoWsEwMsnjMwXM/Ctn02KPzgE9SiPNtZz7pBWAErAQrz04j+Yjyd8TjoV40N
         7K0w==
X-Forwarded-Encrypted: i=1; AJvYcCXBfjLYhGU11joe5AWXArvwCDdOgUeC0vpw4uuvTvuZUc0e+zJZUVLc57rV+Zt1pQb1vZfKWN/kxbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3N4iN3kic9J1Yd6xKxOjUCALl9hm/ADrscmryWtYOUDtFafb
	QkYF7t5ywDrZ76wK/tK5OdG4eYYqlAMD6PvNQaeRZ7nbaO5Hes+WjPAcnBh58jY=
X-Gm-Gg: ASbGnctxLF9g7mH5LqrxDqmKuRpV1V3T7dTjU3uH4ciw0wNyYbhMupbwcIyLoDYAmba
	qTqysCKA5KkKofOlUciyKUH/NhK2LCdDCsw82QlQj9VEWJIatSTxMekrQ5EOsGa6I7upqFhlmi9
	G82o8wgreVt0oTtRVWiF7Hq5cBlo9AHPpeY3nSKsrIIzoKn7clby6yz+hy2HEfcFCqbSETdzi58
	DkvOkSm7bIOHsM435sAgScx/C8d+TgCoRyiZ03w3kDrJ+BGU+lvztnGT+3mBapeyZGgEdRrhsgi
	wM/thGld4nEWjUlZxzDfzKSAiyvcbA==
X-Google-Smtp-Source: AGHT+IGpWLZTubAjL+EcRvPsaRs1q62SFavCte2XH3l1UUlQtQ0yI4iXJlCQ+K7wtS1kFUnHwKp47w==
X-Received: by 2002:a05:6512:3b0f:b0:53d:f786:c364 with SMTP id 2adb3069b0e04-53df786c447mr5437857e87.19.1733151744243;
        Mon, 02 Dec 2024 07:02:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6442e26sm1491277e87.67.2024.12.02.07.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:02:22 -0800 (PST)
Date: Mon, 2 Dec 2024 17:02:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Message-ID: <2chygbm3yjozhkhps64oae5gwirdk5b3orsybss7jgutu5g7ke@4jskpnermxfm>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
 <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>

On Mon, Dec 02, 2024 at 03:27:11PM +0100, Konrad Dybcio wrote:
> On 19.11.2024 2:10 PM, Bryan O'Donoghue wrote:
> > Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> > of previous CAMCC blocks with the exception of having two required
> > power-domains not just one.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5119cf64b461eb517e9306869ad0ec1b2cae629e 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3,6 +3,7 @@
> >   * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >   */
> >  
> > +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> >  #include <dt-bindings/clock/qcom,rpmh.h>
> >  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> >  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> > @@ -4647,6 +4648,22 @@ usb_1_ss1_dwc3_ss: endpoint {
> >  			};
> >  		};
> >  
> > +		camcc: clock-controller@ade0000 {
> > +			compatible = "qcom,x1e80100-camcc";
> > +			reg = <0 0x0ade0000 0 0x20000>;
> > +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> 
> This clock is not registered with the CCF

Isn't that be going to be handled by the CCF on its own (like orphans,
etc)?

-- 
With best wishes
Dmitry

