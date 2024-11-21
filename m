Return-Path: <linux-i2c+bounces-8099-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FDF9D44F2
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 01:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D00B22798
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 00:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6BBBA45;
	Thu, 21 Nov 2024 00:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sy/kmpcT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C7B4C66
	for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2024 00:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732149446; cv=none; b=dLFzL2+Q4zeiR/ljFmGrI69/XaeYePlpTNAxVkewjRsiqJ0zqcTgjLZ9kiQIf28lN3AmXTANtPjEEbHQf25ibH3HPqCaHrLUWGlsuamHaGpbDQ196b3Gc613SZ3BPVMtwP8XJLrUWRtUKKbS95dnzYEKXM14qQVVk9Ccm9JmdpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732149446; c=relaxed/simple;
	bh=U1S0roCBZy6Yr/IN5az14AchlrK43tHpIByXaXPoH0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXBKcmH1ie0jFL8ql+MfnEj+qFE9vdEB8/vM36UI6acAq1DXPCyy6cd19saD7P3gpyKKFsUpEAoJWYqdyfgz+O5qZffM0WLBZ6q8N2RDSrCe6jXvKeBXX7IGyUhUtqg8NB1R1f3Nc+1jd636jqB7ZlZ7pm0AI8GMtD+4BLeHTso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sy/kmpcT; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb5fa910cdso453911fa.3
        for <linux-i2c@vger.kernel.org>; Wed, 20 Nov 2024 16:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732149443; x=1732754243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YAuXluMpfSh0qDO+UckfWrXerNoxRK+af2VJkTt6Y4g=;
        b=Sy/kmpcTwZM+69COId67IPOCa4YugyAXsuSPVcoY9yHEwBVGZ6IVnT1BQIVMfZdkc6
         gFITm+wtk22RirvoctJ3TXWj4sa9gChSlZrVcPlXzjUJp1ef4QcN29+NRrWuxZ5j2gKY
         Yl6tCVCqZQyPEs5iF7JqW8wckob9ds/wN96GCcaUvvErJmj7jxULtP09JQ0tfdYU/fDl
         hVXHFgmv4vDulJ5Lq7GDHaoeJC86/hZgIIPBPgFWZ+USVm7gTsHzYOnMlBvGq6cX50Nj
         trEncmtv9rArPj584tvykHjp4KGJkqtFzssMhcHcezm5ssjjpDkSZbUhE+qiIJtvdkuu
         DzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732149443; x=1732754243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAuXluMpfSh0qDO+UckfWrXerNoxRK+af2VJkTt6Y4g=;
        b=EWph42QKJRXxDk/bQ/pR5CjLN1xVYnx2AhRmHyhKbDkCIDL25LIMhEUqDRCiKdElkU
         KtqwK/6SzzRKwDtbpb/9Vd20TORSKsQhj/kBHEGPO/l3tDpM65N0kosJMf8cIDIVcUwN
         w3kHF9vMNC0DFPBqIH7k9ar6wH9mJzQ1nVdXkpwMPh5GgKJRXdt6nZ2rRmQjiv3qAeqO
         30wBnniZhpOedicYVicTjvMMBOG2lN/y5QkYqsXEospjKazoPXLnJo8Glf2cep3Z6S8a
         7cwCc4ixyp1Ic5nWpyPfSb5bAyHVmm88or9iT7xjL7dy+RtDaXZXDWmWsBbuFpBLqCn7
         Cjew==
X-Gm-Message-State: AOJu0YzOnKB401FZoIkTWFmwfwjEIOK90uzl+tptAYySqnFPeICPPW+F
	OutI6wBV3xmHHbgYYekpWZWKg7vBIMQC3COCCxfSAw8EgKAxwBAtUnauUqjKAKY=
X-Gm-Gg: ASbGnct4v2iUND1aFqGu5044zygV6110WLYxS1ClO6ccZ61BMOU83SDXiaBhrzdC9IY
	ONfPguCHC27RhW3lFj38xu3JBqUK+HuzNPrN5eDIKUqWS9FY+E88Ja3OXXV4sIGAU1AdjPCQAkJ
	aTC89gTz5XmP8IsKXb2+YlFP0er1e7cG5pZR10OiyicP0cMl0yRXc5Z08+ezgHU8zGOGjQGO3B8
	ixbhb8K+7KqZA4yYmUqPOoFZgNxQL+DlYVlwUNk0+naSFyjUtW7kqegtbjRSCrQWqwGL6A/W+Hc
	iyju43omkfeUWejenemTdMhfU8fF
X-Google-Smtp-Source: AGHT+IFN9O08F0W2wl6yka9ElBfiou3gnBgywoKZF/lU+i/vNAQy12evwkDojEAvUqtsv0eO+fwRIA==
X-Received: by 2002:a05:6512:3d12:b0:53d:a8a5:82d2 with SMTP id 2adb3069b0e04-53dc13281a8mr604562e87.3.1732149442659;
        Wed, 20 Nov 2024 16:37:22 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd472766sm773787e87.204.2024.11.20.16.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 16:37:21 -0800 (PST)
Message-ID: <f903025b-08ff-422c-a93e-fad911a7ee43@linaro.org>
Date: Thu, 21 Nov 2024 02:37:19 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: Add qcom,x1e80100-camss binding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-2-54075d75f654@linaro.org>
 <92f3f608-1ca6-4c41-9406-28c7ad589872@linaro.org>
 <66d1c50f-ebfc-41c7-95a4-5d555b336da4@linaro.org>
 <bb58d02f-9ed6-476f-8bc6-ad56cb35e37f@linaro.org>
 <91afb347-e8ee-4a97-bd8b-9a1413051cb9@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <91afb347-e8ee-4a97-bd8b-9a1413051cb9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/24 01:27, Bryan O'Donoghue wrote:
> On 20/11/2024 23:02, Vladimir Zapolskiy wrote:
>> like "vdd-csiphy-0p9-supply" and "vdd-csiphy-1p2-supply"?
> 
> In theory, however I'd like to avoid adding endless strings of new names
> into the driver code for each different power input.

I don't understand this argument, it's the same degree of endlessness as
the endlessness of new designed SoCs. Should it be stopped now or what's
the point here?

My argument is to represent the actual hardware instead of copying errors.

> We can add this additional string name though in the interim between now
> and refactor for the PHY API.

I don't see it as a good reason to copy an easy to correct mistake.

>> Also you put a description like "supply to PHY refclk pll block", but if I
>> remember correctly once you've said that the datasheet (of another SoC)
>> does not give any clues about the usage of the supply, thus it invalidates
>> the given description.
> 
> I'm surmising by extrapolation - that's "probably" what those are just
> at different voltage levels based on previous iterations of this PHY.

But this is proven to be wrong, let me kindly ask you to align with the SoC
documentation here.

> I'm just as happy not to describe this or to describe it as no mor that
> the 1.2v supply etc.
> 

Thank you for understanding.

--
Best wishes,
Vladimir

