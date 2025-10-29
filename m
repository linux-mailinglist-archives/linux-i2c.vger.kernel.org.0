Return-Path: <linux-i2c+bounces-13892-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1FCC1D40E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 21:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C8518874EE
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 20:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F12E35A120;
	Wed, 29 Oct 2025 20:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="wvdDg+mn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE79C233722;
	Wed, 29 Oct 2025 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761770531; cv=none; b=BhPjmMdDDwi8ta1e2gTKgtFzYdJmpZ46sVN2L6T4a/wrtlM9aGimsc32B+ZEPrfuZLrNPLX2UVPJZGjZtGpzZj6iv/UpQbv2soNmCCSiWb+ljpOC3gUCXe08LSVO4goQ+3skmfmlxqWMo8Oeo2j0I1bL4k6bWVNcyLFri/Un/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761770531; c=relaxed/simple;
	bh=dd4SM7BwxuoKzk9cX2Jzy3ZaJaOvLZ8a2URgk9Z7MeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dpoI8KMPRsaEDPXGS/OO/6EZrb0dQqJt3794YNGJfjPykCnJXLCbGk5i8Y4sdJsWVMu9lQ5lqFKL+GCbwAZ+rJv1AzJZE5yO57uRd6DY3RtXSrnG7ha4W88z0ZBqXJtFnKbt4BQzMt/6CGSLKWyCKW7k7zjVi/v3MF1UFKxII4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=wvdDg+mn; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1761770520; bh=dd4SM7BwxuoKzk9cX2Jzy3ZaJaOvLZ8a2URgk9Z7MeE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=wvdDg+mnSGQ6ENctiqZyFYxGJ6tJ3NyEYbLn/HIAvFk92SjWjeT3DrcSkgunLtZB4
	 jBh4iFiVbVsAW2ooFqd1FIoAIb86tpXSOaJBjMTY1yDacj80mSb/zk+/KKlJ8OaXMO
	 Fzq6HhJhxugYCVo5OsUX0vvJJH4b4DKbOnnBpnH0=
Message-ID: <76f108e7-2ec6-4edd-8640-a82fc99f7dbc@lucaweiss.eu>
Date: Wed, 29 Oct 2025 21:41:57 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/7] dt-bindings: i2c: qcom-cci: Document msm8953
 compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
 <20251028-msm8953-cci-v2-1-b5f9f7135326@lucaweiss.eu>
 <48a217db-b85a-411c-81f2-3106b60da86f@oss.qualcomm.com>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <48a217db-b85a-411c-81f2-3106b60da86f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad,

On 29-10-2025 10:36, Konrad Dybcio wrote:
> On 10/28/25 5:40 PM, Luca Weiss wrote:
>> Add the msm8953 CCI device string compatible.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index 9bc99d736343..ef8f5fe3a8e1 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -15,6 +15,7 @@ properties:
>>       oneOf:
>>         - enum:
>>             - qcom,msm8226-cci
>> +          - qcom,msm8953-cci
>>             - qcom,msm8974-cci
>>             - qcom,msm8996-cci
>>   
>> @@ -146,6 +147,7 @@ allOf:
>>               - contains:
>>                   enum:
>>                     - qcom,msm8916-cci
>> +                  - qcom,msm8953-cci
>>   
>>               - const: qcom,msm8996-cci
> 
> Sorry for only bringing it up now - could you check whether
> all the clocks that you defined are actually necessary?
> 
> It may be that you can do without CAMSS_AHB_CLK and/or
> TOP_AHB_CLK

Removing either GCC_CAMSS_AHB_CLK or GCC_CAMSS_TOP_AHB_CLK from dts 
leads to an instant reboot during bootup - presumably during cci (or 
eeprom) probe.

Regards
Luca

> 
> Konrad


