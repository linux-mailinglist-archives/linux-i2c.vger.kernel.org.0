Return-Path: <linux-i2c+bounces-6267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE4D96E0AC
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 19:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFEDB28992B
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 17:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8DB1A2572;
	Thu,  5 Sep 2024 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2ERLA1M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF8D152166;
	Thu,  5 Sep 2024 17:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725555633; cv=none; b=c66yxU20ULN942S87VBLzkUwFrVW05jdSqMB2Ziag7QeOrMOgbt+KSVTloxUkOzvfMOwY1BnRhwHaTh2bKyoNlghD9K2MHWfrXo90dUGOz/2LsElPHrgWYtgfn4GHW4uqSKEDxE6rQbsEEeMj6YxNgoDgZGx2FYkgw4LLFi8ah8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725555633; c=relaxed/simple;
	bh=/vubQF0Ug67aNHJMpNq07RHqPnrfb0UDXIiDsimGUhk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pGTfWemsw45ywQXHCz0wLRVYkW3dUATtCJ/STgOa5RRqZQcamFiGhMK3wpdIlzfkNnbv4iECzzAxQJHNmQE3tDyKrJOaGed/rNTDk1+bnzZOjQjAx6uju7ud6twZBAP1/gfrt5T6LQLynI2yhpFhCA8YnDYL9sPX5+gbb9G4nG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2ERLA1M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5BBC4CEC3;
	Thu,  5 Sep 2024 17:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725555633;
	bh=/vubQF0Ug67aNHJMpNq07RHqPnrfb0UDXIiDsimGUhk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=l2ERLA1MlGAAqieYGfgLgy2w5ppbiEBqMzF2KezkfT6cgpbAiZm7meuhcFBMRRT07
	 H0XP6sdsiORxGJ12xT2VEx4J0FTn3tP+XmlPaJ84ZHSh8h3Cjs2Czb4kbxlNvwcRJL
	 fVqVeu7uMB0sLOq/cfzk8a8EFdgrPapiUcQHYMuSYBoNmFhklhaFmyJ5k/nnVE0XUE
	 pUa/qcy85UiZgvo/TRwjuFVQTQY0ss9FFUAG0xgZQZHxg9DuwOTUVv8AMCNYhNUzbR
	 EeY2xQxxf9ToilY7h6VRKg2zfY3TTDGTTm/AkOrL20UuqsvgjsToNx8g/VfU63Y5hZ
	 Lngx4WL2NXviQ==
Message-ID: <644f0bfd-bd96-4dca-9bf9-203d423cfe01@kernel.org>
Date: Thu, 5 Sep 2024 19:00:15 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>, Andrew Lunn <andrew@lunn.ch>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 viresh.kumar@linaro.org, herbert@gondor.apana.org.au, davem@davemloft.net,
 sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
 will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
 cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
 wim@linux-watchdog.org, linux@roeck-us.net, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel@quicinc.com, quic_psodagud@quicinc.com,
 Praveen Talari <quic_ptalari@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
 <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
 <b369bd73-ce2f-4373-8172-82c0cca53793@quicinc.com>
 <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
 <516f17e6-b4b4-4f88-a39f-cc47a507716a@quicinc.com>
 <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
 <204f5cfe-d1ed-40dc-9175-d45f72395361@quicinc.com>
 <70c75241-b6f1-4e61-8451-26839ec71317@kernel.org>
 <75768451-4c85-41fa-82b0-8847a118ea0a@quicinc.com>
 <ce4d6ea9-0ba7-4587-b4a7-3dcb2d6bb1a6@kernel.org>
 <4896510e-6e97-44e0-b3d7-7a7230f935ec@quicinc.com>
 <b1ad1c7a-0995-48e0-8ebc-46a39a5ef4b3@kernel.org>
 <515a2837-69c3-47b2-978b-68ad3f6ad0fc@quicinc.com>
 <f0cd5f5c-270f-4d9b-8169-be6180fc9925@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <f0cd5f5c-270f-4d9b-8169-be6180fc9925@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2024 18:56, Krzysztof Kozlowski wrote:
> On 05/09/2024 18:08, Nikunj Kela wrote:
>>
>> On 9/5/2024 7:39 AM, Krzysztof Kozlowski wrote:
>>> On 05/09/2024 16:15, Nikunj Kela wrote:
>>>> On 9/5/2024 7:09 AM, Krzysztof Kozlowski wrote:
>>>>> On 05/09/2024 16:03, Nikunj Kela wrote:
>>>>>> On 9/5/2024 1:04 AM, Krzysztof Kozlowski wrote:
>>>>>>> On 04/09/2024 23:06, Nikunj Kela wrote:
>>>>>>>> On 9/4/2024 9:58 AM, Andrew Lunn wrote:
>>>>>>>>>> Sorry, didn't realize SPI uses different subject format than other
>>>>>>>>>> subsystems. Will fix in v3. Thanks
>>>>>>>>> Each subsystem is free to use its own form. e.g for netdev you will
>>>>>>>>> want the prefix [PATCH net-next v42] net: stmmac: dwmac-qcom-ethqos:
>>>>>>>> of course they are! No one is disputing that.
>>>>>>>>> This is another reason why you should be splitting these patches per
>>>>>>>>> subsystem, and submitting both the DT bindings and the code changes as
>>>>>>>>> a two patch patchset. You can then learn how each subsystem names its
>>>>>>>>> patches.
>>>>>>>> Qualcomm QUPs chips have serial engines that can be configured as
>>>>>>>> UART/I2C/SPI so QUPs changes require to be pushed in one series for all
>>>>>>>> 3 subsystems as they all are dependent.
>>>>>>> No, they are not dependent. They have never been. Look how all other
>>>>>>> upstreaming process worked in the past.
>>>>>> Top level QUP node(patch#18) includes i2c,spi,uart nodes.
>>>>>> soc/qcom/qcom,geni-se.yaml validate those subnodes against respective
>>>>>> yaml. The example that is added in YAML file for QUP node will not find
>>>>>> sa8255p compatibles if all 4 yaml(qup, i2c, spi, serial nodes) are not
>>>>>> included in the same series.
>>>>>>
>>>>> So where is the dependency? I don't see it. 
>>>> Ok, what is your suggestion on dt-schema check failure in that case as I
>>>> mentioned above? Shall we remove examples from yaml that we added?
>>> I don't understand what sort of failure you want to fix and why examples
>>> have any problem here. 
>>
>> If the QUPs yaml changes are not included in the same series with
> 
> They cannot be included in the same series. You just think that
> including here solves the problem so go ahead, simulate the merging:
> 1. Bjorn applies soc/qcom/qcom,geni-se.yaml patch and tests. His tree
> MUST build, so it also must pass dt_binding_check.
> Does it pass? No.
> 
> 2. SPI maintainer... ah, no point even going there.
> 
>> i2c,serial yaml changes, you see these errors:
>>
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: serial@990000:compatible:0: 'qcom,sa8255p-geni-uart' is not one of ['qcom,geni-uart', 'qcom,geni-debug-uart']
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.example.dtb: geniqup@9c0000: i2c@984000:compatible:0: 'qcom,sa8255p-geni-i2c' is not one of ['qcom,geni-i2c', 'qcom,geni-i2c-master-hub']
> 
> Don't grow examples if not needed. Or create dependencies and ask
> maintainers to cross-merge.

Or soc/geni-se binding could be also converted to just list compatibles
instead of referencing other schema, just like MDSS.

Best regards,
Krzysztof


