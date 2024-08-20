Return-Path: <linux-i2c+bounces-5581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E36958228
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 11:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4F41F24699
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 09:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E61218C007;
	Tue, 20 Aug 2024 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nudKvcqn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B5418A6C6;
	Tue, 20 Aug 2024 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724146019; cv=none; b=Lx86GYzNGcmY8NyrMl/uU70Z+xze6iz4/sd1935HZbLqr8JNREFvkoZQEnQjysIx+pyWTpwjATZ4S6dUtuFaJh4CzNIVA/Mj0e23MPGk4VZmJIooelrlnE1pbjpzzVg0MCzVyx3Rx9iQwfZbcQh3CeFQrJlxuK36v586UR/Na8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724146019; c=relaxed/simple;
	bh=kop63EL7ROeC8ZjTSa24ig982G1wGzEfLfTlKCt7Yi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n5xCQUBZfBw0JBZu3pUzi4HMmR8JPD82UWh5KUUuVtX8c+dxNz0te1htOz+mxDjTkEqr0j8jQvWCy/Ao7U7KvKNdBrVYgVCtatd17oJIyfXrGOEERfiUrYfX6uPOP9oM6bfZIgncO7Dkkonb0GFyh+Z6oudoObY7MMNBmKpOVWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nudKvcqn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB9EC4AF09;
	Tue, 20 Aug 2024 09:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724146019;
	bh=kop63EL7ROeC8ZjTSa24ig982G1wGzEfLfTlKCt7Yi4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=nudKvcqne9ZjBJo4UMhBnSm609IPW3AJvJbqzsheWiBYJgWyLB4HxpsiYJ7PYFwBt
	 7qd7ENiCdoE15TqP10U3wXrG0qsTzJZKPK1npVHVXjmoQiLm5OpFB8+hbrL1Z+Schk
	 5E0pUVnuEkZjHwqQ1UuwWD2NSaDJpp4Gd3Kn0LP1AQXvoSxsXm1eivAE2CP1bK1I0G
	 9IYVG/XnRCMZzfLkovP1aqf8r3th+rUePiaRY4AOaI6mmEkkvAZ1MthIuPqhd1q5zB
	 LWotEWjJtQW5yLYrMSVu8uXhz7Af5rnUKcckqPY0+o7zk4Fu+8gzGhXYdDCWVxEOi3
	 qbj5NlXWwQV8w==
Message-ID: <aeab1421-6171-40ec-8133-51734da6640e@kernel.org>
Date: Tue, 20 Aug 2024 11:26:51 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sdm670: add camcc
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240819221051.31489-7-mailingradian@gmail.com>
 <20240819221051.31489-11-mailingradian@gmail.com>
 <7d26a62b-b898-4737-bd53-f49821e3b471@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <7d26a62b-b898-4737-bd53-f49821e3b471@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2024 11:23 AM, Vladimir Zapolskiy wrote:
> On 8/20/24 01:10, Richard Acayan wrote:
>> The camera clock controller on SDM670 controls the clocks that drive the
>> camera subsystem. The clocks are the same as on SDM845. Add the camera
>> clock controller for SDM670.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>> index 187c6698835d..ba93cef33dbb 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>> @@ -1400,6 +1400,16 @@ spmi_bus: spmi@c440000 {
>>               #interrupt-cells = <4>;
>>           };
>>   +        camcc: clock-controller@ad00000 {
>> +            compatible = "qcom,sdm845-camcc";
> 
> Here it's wrong, and the compatible property value shall contain
> "qcom,sdm670-camcc", probably it could contain both values though.
> 
> It may require to add a new compatible to dt documentation and,
> if needed, to the corresponding clock driver.

+1, even if the blocks are physically the same, please add a SoC-specific
compatible (with a fallback to 845 if that's the case) just in case there
are some implementation problems only concerning this instance

Konrad

