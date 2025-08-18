Return-Path: <linux-i2c+bounces-12333-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C803B2AFBD
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 19:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F63018A71BA
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 17:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74FD2D248F;
	Mon, 18 Aug 2025 17:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="IO2bRX6G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565D2D2480;
	Mon, 18 Aug 2025 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755539174; cv=none; b=BwbqwJ/EleyXxfrpsAndWbIEn+gUJT9oZZpNIJBCrVbAzU2kf8veSpnheYfejfkp7HM+b4Ie41g7lyzoDrv0LoeKuSoiUTT40RCAYj9FGn0HRwHHpwKbikRnTaSFvMpRWkt4k5kuUpxq2ljf7q7gvU2WM4BBbbw+O1BmmMxa4aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755539174; c=relaxed/simple;
	bh=4bxZ4Jl7O78W+0PJuWP4ajd/ns+O0vBjcv/bjjJOu3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyZ3Wlx/TMAOdcegmH8TJFd29xKhz3pexmRds6pxDGlm2dTpmM4sbW4RY9knvzb5oLa4b2sKZtADMkLcAbScpbBc/Q9pJVVpxEEtRH4NRxWx/Ha8Ou/4t9tRTFji6I+CqkSs94g+6Y3RwWH96il/evkOI8SSs1U/ehiPF3xmMz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=IO2bRX6G; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1755539171; bh=4bxZ4Jl7O78W+0PJuWP4ajd/ns+O0vBjcv/bjjJOu3U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IO2bRX6GTcrwhB+mdKIXRgVhyXyTy8DKgU6nVBLHfELF/5n4pd5VUiyAoAbNn84+w
	 4bULf2V7VrpIZR6IIf/zxCTxquTWaStLyMchYz4uTWD2F7ngoJ7Md4J9TbacZHO4VT
	 bBKDdO5w+hd76if1xBK6Ps/nIVeMCJmOWPSJvaCM=
Message-ID: <84a48cf1-2220-4b04-91c1-5b3a556f4a1c@lucaweiss.eu>
Date: Mon, 18 Aug 2025 19:46:11 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: i2c: qcom-cci: Document msm8953
 compatible
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
 <20250810-msm8953-cci-v1-1-e83f104cabfc@lucaweiss.eu>
 <20250818153706.GA1238481-robh@kernel.org>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250818153706.GA1238481-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-08-2025 5:37 p.m., Rob Herring wrote:
> On Sun, Aug 10, 2025 at 05:37:52PM +0200, Luca Weiss wrote:
>> Add the msm8953 CCI device string compatible.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index 73144473b9b24e574bfc6bd7d8908f2f3895e087..be6cebc4ee054d3100e5c4c676f1a0c4fd8d2e1e 100644
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
>> @@ -128,6 +129,7 @@ allOf:
>>                   enum:
>>                     - qcom,msm8916-cci
>>   
>> +            - const: qcom,msm8953-cci
> 
> This should be added to the enum above.

Thanks, will update in v2.

Regards
Luca

> 
>>               - const: qcom,msm8996-cci
>>       then:
>>         properties:
>>
>> -- 
>> 2.50.1
>>


