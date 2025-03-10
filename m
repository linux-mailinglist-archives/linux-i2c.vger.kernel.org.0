Return-Path: <linux-i2c+bounces-9769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F5A5A5EE
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 22:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A8733AF0BD
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Mar 2025 21:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1201E1A33;
	Mon, 10 Mar 2025 21:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrZGVyhx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734A1E1A2D
	for <linux-i2c@vger.kernel.org>; Mon, 10 Mar 2025 21:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641349; cv=none; b=TzXKx7t7t1YsLkLPm0xWtgd7FTTslCqf4x/6MW9gdH51zH8BZgXFJ5T30qqdRtFlu2Uf5Abjj8mAVxrxYD0APKGMpqGikIJcQUI7a3jCZdrD0GpVEE0zcjmlS9hhtuPk0TFJJQQdlvY41ESVNtLDUKrYc8hqWPeCwx3Tb9Tz+NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641349; c=relaxed/simple;
	bh=PqOVgE0V/OfFJoLKbJdR0nv4yrcRKzUDgpjl/uoMMsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmDRtgtIPk2RFY36z/nsDsp0Du0psyoYVSbqzVkosIlk6lcTmasfQNmdscXMjgCfU3KgKSA3dj5saSzEQr8IC81hg49YZO/kNJbg71o1N5mj9vNQQcpEeypwqQ4sOj828TuJF7EYUp/UbbOr6VyUJsaChEHKd6CXozxOAIWoRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZrZGVyhx; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf4be81e3so2512171fa.2
        for <linux-i2c@vger.kernel.org>; Mon, 10 Mar 2025 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741641345; x=1742246145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MvLqGAPwBaueNzkaD4MfMCpUMY9L6AflqhOMx8Pn7s=;
        b=ZrZGVyhx3dJ7bjqju+OYejv/2I3EARS6JPlSyYfdZ6gOHlZIS7ImZCDRKz8vxd5tgI
         PK/BO/LwmbomvviJSN2wNOoN1cGAWzsVYN4D6QRFgrvf0hproZPVpPEtvSaD4F7Tcr+0
         l8JRe7fsdOxYlJV/0vbsJ3SUBODMtAI4NcVa5QRFVW6VoaDGsMWqeGu6nfbrdFGkdM//
         hQG9bRboklAekkN3LLCrYumETxNZwyhSlb8nCuhKasZOsxM2x40HD4BiYh0+OP9HV+JW
         J9hOmX9JWUroKAoaCpPOw4sAFGosdBvReRVhRPSrEpaGRHQNLOz6XWM4OL/07mj49TaU
         dW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741641345; x=1742246145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MvLqGAPwBaueNzkaD4MfMCpUMY9L6AflqhOMx8Pn7s=;
        b=YSspWT9+ha0rkDCbPIZOes4rnw0prHBSxEWPSKZ17EcEa2VbzC4NGhiMqT6Iz6glzW
         IKaFFuru7/OZA8uh1DiBI4vF6BT89ALZEQsSAE91gI30coX3DZjU6dqv5MX/PgbK0H3K
         yUJLbf1alc8NuM2TNdyzZV35uW3ycAxzCNxRks0uGZKlrxPmrYmnDq7gPPVIQBIU2pIn
         dGy0p58NM6dVf+0Yf9mXFEVeLSWRAPhIXU9qNHs2VjXr9JL7nivmCHclcTezXVCipKpX
         0NbFvaTwQ9vQF82/3e8azi5aLsMrzikhXhWfBBm16+y4+E1eLdHYc6Vm5GUJFxW/n0gf
         QWOQ==
X-Gm-Message-State: AOJu0YxlhcJpE/Yb8j/qTgIU6EJ3oHQHk0t68ceZi34bS8gpLZwQPhd7
	9xlyhvkH2bvMwxAHiT6tNtNwcxpzgWMnUgYNbbPRTHWQ4xqIHorcmHKUKaIYOuk=
X-Gm-Gg: ASbGncs61cH/UNT5WPndSsvE1thFemzKMUp0CESm4vQzBNvriJIBgQzDKMncy2C+Xux
	k2KrG+hx2ihhYZBcEO3o57s+eYVxytKWaWH2h6f42B9wLeQgt5UA4GtMkDGGcQWZQwrNQY1q5v6
	2evZnPQu40HI1iWi/j3AQw7hqVvRY8+MpFptumIs6BHObB90CwUpMOe5lonMmfGy4tIv+FZfk5W
	QeVEWkkO6tKs4xb4JXoN3feLfBTmqKgWf0dQqiOrL4Jk90PoItuScTODDh3gBYlIbfKuPveoGO9
	AehzRWFkxbYxNtRHO7ph7kpXwIfCyoa7oaHXiu9KMoHrjKKuCrYjqdgJ6CqsmtaYjsk3QyD8x3t
	/+o+m8QUU4vo7apjd1KiHJFs=
X-Google-Smtp-Source: AGHT+IFEEGvRAmlkS7mP1u8TkcikCwjIGUcDohSXkLJe9GTEibzUbHy7zmjsIRAA7zWVdtf6JcAsyw==
X-Received: by 2002:a05:651c:2220:b0:30b:f23e:77f1 with SMTP id 38308e7fff4ca-30c2076a4f3mr1672051fa.11.1741641345081;
        Mon, 10 Mar 2025 14:15:45 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bf4c9c71bsm15116051fa.37.2025.03.10.14.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 14:15:43 -0700 (PDT)
Message-ID: <0a52b265-57ad-426a-b4ff-8a6bb5845636@linaro.org>
Date: Mon, 10 Mar 2025 23:15:37 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: x1e80100: Add CCI definitions
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-0-c2964504131c@linaro.org>
 <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-3-c2964504131c@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v4-3-c2964504131c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 1/19/25 02:54, Bryan O'Donoghue wrote:
> Add in two CCI busses.
> 
> One bus has two CCI bus master pinouts:
> cci_i2c_scl0 = gpio102
> cci_i2c_sda0 = gpio101
> cci_i2c_scl1 = gpio104
> cci_i2c_sda1 = gpio103
> 
> The second bus has two CCI bus master pinouts:
> cci_i2c_scl2 = gpio106
> cci_i2c_sda2 = gpio105
> aon_cci_i2c_scl3 = gpio236
> aon_cci_i2c_sda3 = gpio235

Nitpick, please consider to swap SDA/SCL everywhere above, this will convert
the list of GPIO pads into a neat alphanumerically sorted list.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

