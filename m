Return-Path: <linux-i2c+bounces-8842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D39FEB6F
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 23:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A62EE3A19B6
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 22:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A1019D092;
	Mon, 30 Dec 2024 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQ6my9fM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD93041C6A
	for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 22:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735598078; cv=none; b=M/ZfLocWO3a+mI1RGU5hc0ZWaGRGlvO/zVnyzSGIcjfsk+rMajjFKGXoBwdW7DWgSPzNJ3OUKR9QB0lM2LOhTKYEeXTv/kYSCua8IZPL8HP6tSvmj4dsHhGO/VD3HNMlBLg06fEVHVjHYZjFGCvIO+5S0tQiMgHmZ1R1jnfQAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735598078; c=relaxed/simple;
	bh=LOO1Rh2481JcNYNndqVuMRmZHFmkQrOk9y9yQ01ttTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kpRHRvb07Uf7cr/iVqIvmMUAqb8lC+KTArFPMGEzbJ/UPvsoCE8WeB6MDrwXxRtsCb/RGjS9CMqad8C3o0GzfpNN6mYIKfZoLhyHB85vuwG0P5aVPVzOucSbb8y3fZKNHxdD2WqeqTS++QG7Ar9DuxRtdzgKbd3uM/mfvibQXmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQ6my9fM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so101438505e9.3
        for <linux-i2c@vger.kernel.org>; Mon, 30 Dec 2024 14:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735598075; x=1736202875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qf+6YUKEAK6RmW0Zawgag6y0Zk8iAO/X5OAFkTK3r3s=;
        b=JQ6my9fMV6X2iAKiGGq1e9qXhQMIRbn11BzoUst1O7bkFQvjYJbMjtGCtCFCVnFwCT
         l/m8PyjDh50YbMickMpckrFpWf97vnZ8gPwzOPp0mT8mD/Dq0T6O4c7apfVqv7L2qyaz
         bXmhWTXLwfnTDz8Prvo+ykF6yFbly3hW+zVROtgiBoUMjIFTlh1Bi7bJBluqcig8Vpio
         9zOksAh01c2OGD0VAtP3mjnmA3Q9Q6Vn/VK8KUUvctsbTF2HpKdUKyBAFdiiAFDxOoEC
         aLnQZHA9GhXvLr+y2p3y8aMSL/uU/X5nzLCLWwK1WcKNSi+swPEY87p9OTfpGOvKJ8pb
         Axwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735598075; x=1736202875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qf+6YUKEAK6RmW0Zawgag6y0Zk8iAO/X5OAFkTK3r3s=;
        b=qy7ZL/H+e7D5KU9TOG6bwcOo+e85q23PigRZ+NQVvkIYnC/58rSNPSjOzNtZGdON5k
         mQqrVrzaZci0rJ4V9HHNFFa1qP1re1lJQuPAUy2ySvSnQCe2hEP+7hlrvn0T7rgfa8jf
         41O5dmsiofHZ2ngn/D2XRhibkHdwK66Npk/XmDpVMt8ho9619GyWazRi8gZSp52VGuBr
         CH/InNWrxFi4qip+rLtMMJek7rTKwHARedOht5316rWuKeaOdGhwBUgd1OoCg4tJ3TGX
         20atlLlUc6j+7zLvN2r+WUN+87crZsQTIVk/krcNpL6XgZr9oTn92VPJK4BzW8XPgwEs
         EFiA==
X-Gm-Message-State: AOJu0Yw7K1s8xH7xenl/h7dZQkQcezyPePeI88zhXZI0wLTn/3EDvEV4
	3wrzykto6qJ+ruGJK+8pieY0HbRANUz5su+iTV7fMuQnEie9f8jAtoORbLIZQAc=
X-Gm-Gg: ASbGncvIXWHwtpABUioKOGCLoLgE+Zh5uIx2q+49TIjRtOtPAimTeEfy7o0wdJliuvv
	1trApV9jbtAAD5jZuWZhNfnXHLEaazvfvHCO6/ydWIalHt/xZhuHBDh+UQbupnas0BZ5CvGfGIs
	N3gvQ9d7X/+N/ct0npSYslKWchMj72BDp5g5mol6Cwvs6IKAXoGzrSzcYuRgVVgfnG82j/DkEmk
	DsUQHp+MmiSVL5OZmeY+26qsdHmQyXneHF5b3MUafVz8BZgktUOH20vydPW4Evjjt5Huw==
X-Google-Smtp-Source: AGHT+IEkGNe23vunsFVznIzhni6Rd6kVfbzGRe+omgR6DEZtQKbekPwmqGHbmW4xitobE7MNowwCkQ==
X-Received: by 2002:a05:600c:3b23:b0:436:4708:9fb6 with SMTP id 5b1f17b1804b1-43668b5e02dmr275300155e9.20.1735598075131;
        Mon, 30 Dec 2024 14:34:35 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43665cd9c29sm349733625e9.14.2024.12.30.14.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 14:34:34 -0800 (PST)
Message-ID: <c9d97c40-d3bf-486f-b348-91ffedeece5a@linaro.org>
Date: Mon, 30 Dec 2024 22:34:33 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aaead9e5-a978-4b3b-8635-bd8be647ae35@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/12/2024 19:45, Vladimir Zapolskiy wrote:
>> +            status = "disabled";
> 
> Please do not disable the clock controller, it was discussed in the 
> past, that
> all clock controllers should be enabled by default.

Looks true but, news to me.

Do you have a link to the discussion?

---
bod

