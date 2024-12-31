Return-Path: <linux-i2c+bounces-8843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F08649FEF20
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2024 12:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B068D3A2EE2
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Dec 2024 11:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5986619C546;
	Tue, 31 Dec 2024 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n5dNKcqj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B4195962
	for <linux-i2c@vger.kernel.org>; Tue, 31 Dec 2024 11:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735645714; cv=none; b=S3A2dRm/F7jR4SjRbJMn91R9+bcNj7M3eTkCUFW2AibgPcBjSMqetBJ/JveNViXqOFmkcLdEK9kcpDYzoJEch58aE5U92Ss0Wb4gqFz2HRf0GdkdfxbwYydVf4xc550yn6scqbpwHOVq7htZqOYCYEsha5VXTmf93Gjkf32EdSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735645714; c=relaxed/simple;
	bh=UfGb538qS6fTheMXDVXwLaYxOh/Fu2Le7j4lot7dN8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AN4F99FyEDqiHdpxOequPsumDP8ecC11V+YfgrCcqfhm+HpOAh0gcQ4sJI2bHohGM92GKDc8gxjnh3F573yFDpnSoCYzLjis1SQhWid1to2Ffj9qK3eSh9Fcj5t5sFg49x6KazyrDXCKlYZe242rg0820uJYfQ8J+t2DUSnNZ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n5dNKcqj; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e384d00f4so1705198e87.1
        for <linux-i2c@vger.kernel.org>; Tue, 31 Dec 2024 03:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735645710; x=1736250510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPcpvSMA+nWrZjqrSVYEniXrHyrlHzlkdD9s2BkwZx0=;
        b=n5dNKcqjq/W1+4mOIsfXadO8n6DVG4L/lPbrbp89BBsFgq5bg8QraiVjlWiu5T9Zhi
         3/nL3O/HLAkmQnBitY+s8H1hk+04iaZKNubizhmKGj3d2PKvVSdNaRs4NWiW4l8omAmm
         kexY5kmifmg6Jhhkl2buX//3ZaZObiiIfoAkzsXgv96+nei9kflhJ44+7N5qhWyRWDvw
         8esDLntCgdoz1kdRHV8KR1/XbZhcY4T3oT2xuZv6ARUd9gFgNw10+V1fBZLVkM115Jhb
         Me6IKSVNlP/8RgdFdE1E65Gc8OGh9Ac5rDjaYbZn+IaB/N31WAO1HzrR9dMwF3mdihAO
         intw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735645710; x=1736250510;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPcpvSMA+nWrZjqrSVYEniXrHyrlHzlkdD9s2BkwZx0=;
        b=TKuVRawY2byyJIgxd15jU6zvIBs4FRBTPQCakXzmQmcgR5s2wLropJhtvzGPNgrfuL
         GQlPBTXFXdCw4tJez7yAetXo3CtzT8cCNnrENjJSLWVftVz7YgVkQgsEuwt6H56ulOIX
         PeQvvDokS2xvXvZU8VvU9DV7wy1cQxvwV7msZ1ZkkScacFcY0ZwzHU/vFnO/l8LlbPSL
         ds+fl3x1qjL1C8myknnztWczBJC3kpExzd06sGs18G5eKUUtuoHE3zEeZY/4lwpehS8v
         wYPodbKMVfINR5vjinrX6ByUpz3D3McHGeG6/kJr3kO+Lb76HvRlthjtbj4HMFEiXgEw
         1S8g==
X-Gm-Message-State: AOJu0YzFa8TU43mIhdlIHpgCaeV9VLVSbcQ7uUCICXULQrmrszO1/Nu6
	nON3ghkqpbBcyxPcaSFeXY9Lfk6pYRHI/6nGnRom02eFOC9llqUe42y8xWojAoA=
X-Gm-Gg: ASbGncvc3x9vHRuXUlWG9lWFZeo6l4YzsBf72sQ5G35oDUoDndYfB1OaxCSwiF36Fsl
	Swrs9NEPCb0fdgVHuB3eFtCovr7C5Rlt0lq/z6bg4XLEWMeZ4g7g/pcZRhtY+twoXucqqJw3Pk7
	EJOV2oC5BcncoZ4k8TQwdayhcyNR8n96nkJfK0RuYWw2xiO3LS5akQh8nFNupItNGWUytDszx5n
	a+CtDvX/tvx+X+8UO6Q2sSIa3i6FTmxY+OA3ncJw+nUpko9MFo/o6kc6ICwbqY61QvRSpCdC4vF
	DK8C6EYUO1FCev8EHh9ybkxD6gTJB7rRTYk=
X-Google-Smtp-Source: AGHT+IGw+IBxZDLIPKW1ctolrza83QDB3dHGcJZYelTmKDc4ccY0ytsjd0iQG/jRP+F7A5JDhTDPWA==
X-Received: by 2002:a05:6512:3a8f:b0:53e:3756:80b4 with SMTP id 2adb3069b0e04-5422956b95emr3552488e87.12.1735645710298;
        Tue, 31 Dec 2024 03:48:30 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f61c2sm3323915e87.32.2024.12.31.03.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Dec 2024 03:48:28 -0800 (PST)
Message-ID: <244c58dd-b36a-49a3-901f-8a60dc936726@linaro.org>
Date: Tue, 31 Dec 2024 13:48:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
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
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
 <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-4-06fdd5a7d5bb@linaro.org>
 <aaead9e5-a978-4b3b-8635-bd8be647ae35@linaro.org>
 <c9d97c40-d3bf-486f-b348-91ffedeece5a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c9d97c40-d3bf-486f-b348-91ffedeece5a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/31/24 00:34, Bryan O'Donoghue wrote:
> On 30/12/2024 19:45, Vladimir Zapolskiy wrote:
>>> +            status = "disabled";
>>
>> Please do not disable the clock controller, it was discussed in the
>> past, that
>> all clock controllers should be enabled by default.
> 
> Looks true but, news to me.
> 
> Do you have a link to the discussion?
> 

Please take a look at this discussion:

https://lore.kernel.org/all/c240075d-55d1-28f6-18ad-3897e55f8e59@somainline.org/

--
Best wishes,
Vladimir

