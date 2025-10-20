Return-Path: <linux-i2c+bounces-13670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6B5BF0B00
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 12:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81EC23AA10C
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 10:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF73258EE0;
	Mon, 20 Oct 2025 10:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBhbmlaS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10549255222
	for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 10:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760957771; cv=none; b=KY3gMaOz6KT3NvoANKI3PotcXVpQOrrS/CnpzbwPIEvs/A07TLSrq97188KS2ODpmcHN7U8OagpFUREfJV3Tar/sG2ZXEypfmda3eVeu6IUA/K22Upz2gzhGnsBoaFTkIeDxuUKlNk4bb9yIjktTjqqfLVCNNINKHu3u9lTBD14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760957771; c=relaxed/simple;
	bh=IydQHlopurRsMIlFXXQnBsVqX59j3tYYZ9wp3B4KoGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qYEeDxUC9CdoJD5OU2eQkAFJ3JoUA47EDVEYEPE8wZLibwGts0fEhC641c3Y2k7nujiK3E9n7CkpTOOLTjNBU33tRBfr4nC9QUyB+2S+F98HRg8D83VM8pM5Vl6DHU2F9ureZR240TGNDm4Wek5aoJY4tb9550vnfQSAfxc8btM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBhbmlaS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-426ed6f4db5so2783712f8f.0
        for <linux-i2c@vger.kernel.org>; Mon, 20 Oct 2025 03:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760957767; x=1761562567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O50PUVrDxE9ib0IbMfL05smlWaDICzzt8kT2K5/ErZQ=;
        b=uBhbmlaSfddAoMrlIpZt99EKU4O+QzROEHKWlEWVOhpxCcHpRkv8nGt+Y5c6WPzV4O
         Ol1gyPNixSQGIIbgldDyhQcmbCTP1shIv9qiScdknkmRQ217UZGu6jTtMJoORQ0XKzoD
         T+5xbOh8wSiGQutwtzoEABqZYK8C2/MbM57QU7+lmbf7sHUAR6Mw6SEWV7dE78JpYlsq
         8XQqm+3k2JV6XqGP9uS8wmlKDgBAIApSOziEQ8np6CfKWrIBJ1L94zj+gddnFf2WxKim
         qT5konw3qIMntlha4nYJMt1ei7UWkhFmRhJf7RnKwAR8lcQT3OPy4O1Qml8FtGi4FFme
         Pa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760957767; x=1761562567;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O50PUVrDxE9ib0IbMfL05smlWaDICzzt8kT2K5/ErZQ=;
        b=Z+bScB62TbuptFYeQkO6r0U9b7I1kR71jdAodIdnwi8amd8MP8sSVFWTfwwK7hwLru
         vU96hkxw/OWfaI37tH7a0Pbw7FJoSV/JIKBX923232eYZW/IudVl5MBi8DwEJFUF1Uj4
         Luox52gdT/cTIOqDfxHyari4inJzXoDY++pjm2emirlffQbNKFCcIBvOZy7j2ADIvPHs
         VzVh4yhVPN/07x5DuCrVwGskZEJV3OEJvx5JcMFsxWpQoFXu4Wm11Sdw7L/QfRFzrfLj
         dSZFECVNYVfSFmu0LzlSk/rfYLtstaLJqOu4tYiTEb6BAqedvzJlB5Fb5+zahCNCQbWz
         eGnw==
X-Forwarded-Encrypted: i=1; AJvYcCXa6UsE/vWQt8s2IBt2WBdenkHuZWrbRydeEGuO7bwczZHlxzV4UrrC3PGK+nIzhycCMI//0yFDioQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysnCtSYhtOiNiS1fE6Fg0e6y8OJfBKPHLjsr7n5sYDfPn0wp/g
	2852g2qtL/ZDnZceQ5SgD+mbbrOreYIwfEwlv9SgzsqQBkC7FOM5Jbhdrez86KgQ0prHb8xAedh
	q0JMD
X-Gm-Gg: ASbGncsF1NqejabQTSoY/4x8/G/SnN/myI7VXg4h6nucY8EVu8AFlgn4i7wMg4ORbEM
	zf/RbgD5OTjL/WWhytzZkFzB4leWqMZ4U4x5YlNhAKOvput3VMIaL+JIugYB8iHjO79HaRKVfOv
	uvFDqNUXvxCrzjckZ6XcorguFbvg1uwvs6lzDBrBXz6TXZZ2or/n79Kl9vW4VWEF8pH5TZMRYCh
	QgI581warWrUExmdsCLH/pEaGZq7jklNKIgfNXFRvbjj37/x7oKvmW9lGpXBCb4osdnEgnGHbKs
	wBeqUKen5jQbbD3tiZU9dYtZWuRFBzZGX9eh1fTJXy0ZgfCRj9mAvdgSZAizbQuTbGaVZQ+4Aq7
	s5fuibF/rxz5hlTjNE90IEh4ecSbSec9RL58f53V1HsmYzbLCanCPndl7p/I9S2gMPfakDQxytS
	dU1kYusG/pAsGzPkXdm1IIN9QjbbrfFZnC+UZ/4UNe0N0=
X-Google-Smtp-Source: AGHT+IEnxRa9WBYZ/xihOvJBRUTwTryLwgmhlm6XUxYYKxvIXYWvfiDdFtfoAj1aZpKnj7X7vI055g==
X-Received: by 2002:a5d:588b:0:b0:427:1ae:abc7 with SMTP id ffacd0b85a97d-42701aeaffemr10842435f8f.2.1760957767322;
        Mon, 20 Oct 2025 03:56:07 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce06bsm14495252f8f.45.2025.10.20.03.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:56:06 -0700 (PDT)
Message-ID: <f5a1076f-f06c-404d-88d4-fef4f7694c82@linaro.org>
Date: Mon, 20 Oct 2025 11:56:05 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: camss: Add qcom,kaanapali-camss
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
References: <20250924-knp-cam-v1-0-b72d6deea054@oss.qualcomm.com>
 <20250924-knp-cam-v1-2-b72d6deea054@oss.qualcomm.com>
 <CAFEp6-1o11B9o3HjdJY-xQhDXquOTknXo0JeW=HfpTxXcEaK3g@mail.gmail.com>
 <a7be3a42-bd4f-46dc-b6de-2b0c0320cb0d@oss.qualcomm.com>
 <d8dfe11f-c55a-4eb2-930a-bfa31670bef0@kernel.org>
 <CAFEp6-1zpobZNLHt1192Ahtn2O7bV+As0P1YvVHrkRsORyH_Aw@mail.gmail.com>
 <ac96922e-d2a3-4a99-8f34-a822c3dd2d02@kernel.org>
 <7140b8a8-1380-4859-84a3-681b3f1ce505@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <7140b8a8-1380-4859-84a3-681b3f1ce505@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/2025 11:16, Krzysztof Kozlowski wrote:
> On 16/10/2025 12:43, Krzysztof Kozlowski wrote:
>> On 16/10/2025 10:47, Loic Poulain wrote:
>>> On Thu, Oct 16, 2025 at 7:52 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 15/10/2025 05:21, Hangxiang Ma wrote:
>>>>>>> +      - const: csiphy4
>>>>>>> +      - const: csiphy5
>>>>>>> +      - const: vfe0
>>>>>>> +      - const: vfe1
>>>>>>> +      - const: vfe2
>>>>>>> +      - const: vfe_lite0
>>>>>>> +      - const: vfe_lite1
>>>>>> Wouldn't it make sense to simplify this and have different camss nodes
>>>>>> for the 'main' and 'lite' paths?
>>>>>>
>>>>>> [...]
>>>>> No such plan till now. Other series may take this into consideration.
>>>>
>>>> We don't care much about your plan. You are expected to send correct
>>>> hardware description.
>>>
>>> To be fair, other platforms like sc8280xp-camss already have the
>>> all-in big camss node.
>>> Point is that if Lite and Main blocks are distinct enough we could
>>> have two simpler nodes.
>>> Would it make things any better from a dts and camss perspective?
>>>
>>>   camss: isp@9253000 {
>>>      compatible = "qcom,kaanapali-camss";
>>>      [...]
>>> }
>>>
>>> camss-lite:ips@9273000 {
>>>     compatible = "qcom,kaanapali-lite-camss";
>>>      [...]
>>> }
>>>
>>> That approach would create two distinct CAMSS instances and separate
>>> media pipelines.
>>> However, it may not work with the current implementation, as the CSI
>>> PHYs would need to be shared between them.
>>>
>>> I guess this should be part of the broader discussion around
>>> splitting/busifying CAMSS.
>>
>> And this discussion CAN happen now, stopping this camss and any future
>> camss till we conclude the discussion. Whatever internal plans of that
>> teams are, rejecting technical discussion based on "no plans for that"
>> is a really bad argument, only stalling this patchset and raising eyebrows.
> 
> 
> To be clear, I expect Loic's comment to be fully and technically
> addressed, not with "no plan for that".
> 
> This blocks this patchset and any new versions.
> 
> Best regards,
> Krzysztof

I think we should stick with the existing bindings.

There is no "lite" ISP there are so-called lite blocks within the CAMSS 
block.

It makes sense to split out the PHYs from this block as they have their 
own power-rails but, if you look at the block diagrams for this IP there 
is no specific ISP lite, there are merely blocks within the camera 
called lite.

It might be nice to structure things like this 
arch/arm64/boot/dts/rockchip/rk356x-base.dtsi with each component 
separated out into its own node with its own compat string but, I'd have 
a hard time justifying changing up the bindings we already have for that 
reason - aside from anything else - all of those components in CAMSS 
live inside of the TITAN_TOP_GDSC which is the power-domain for the 
whole camera system.

So not meaning to answer for Hangxiang but, I think the compelling logic 
here is to stick to and extend the existing bindings.

So in fact I have no problem with the bindings as submitted - not 
including the regular fixups these types of submissions entail.

---
bod



