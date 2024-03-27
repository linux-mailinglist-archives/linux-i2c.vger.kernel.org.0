Return-Path: <linux-i2c+bounces-2628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A288DA2C
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 10:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B950D1F22549
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Mar 2024 09:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9021C3771C;
	Wed, 27 Mar 2024 09:22:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B667364AA;
	Wed, 27 Mar 2024 09:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711531367; cv=none; b=Hx71qb3vcwLrwrH0MGSsCKQ8dJx/fVSj8GuJsPu2gjT+nvYb08sdUTQ6r4NDhfHOXHG1H2nyEqfxPuoBIym1rmMXn8p7L+hIA3qPYXa1h+8NC8k6VxZ7HZV3I5nAwpGVjy10NbxxOMLglXYRewlm1iM95LkFqW6ZH068t6yto1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711531367; c=relaxed/simple;
	bh=ZWv952oYFxc39419lBwrbDg10Bj8qOEyHA+YfiwWqv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hF84bndqtOg51K99PF+k56GoKptqawZ9cuyp7UI3FLErWFw7hD/3KYDUuLb8PvAc4G0b3kwxuO0K4xLoiC/MPKGOvn1SVUiNL5aSUHzUbAFaKXYhSAa1jOMEuZRzbAwclnAlmDUv8QHcnPrukbN7XrlpH34ZlhMgegjoqny4z18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 243A52F4;
	Wed, 27 Mar 2024 02:23:13 -0700 (PDT)
Received: from [10.57.81.167] (unknown [10.57.81.167])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EF5C3F7C5;
	Wed, 27 Mar 2024 02:22:35 -0700 (PDT)
Message-ID: <d8fa8e1a-b2ce-4d91-9ab5-ad1b160111c6@arm.com>
Date: Wed, 27 Mar 2024 09:22:33 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-input@vger.kernel.org, kvm@vger.kernel.org
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <3f61d6d3-a0d6-4c49-b094-6ba62d09ab14@arm.com>
 <f23f2e60-e5c0-4c3c-9722-dba63a6e7ef6@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <f23f2e60-e5c0-4c3c-9722-dba63a6e7ef6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2024 05:57, Krzysztof Kozlowski wrote:
> On 27/03/2024 00:24, Suzuki K Poulose wrote:
>> Hi Krzysztof
>>
>> On 26/03/2024 20:23, Krzysztof Kozlowski wrote:
>>> Merging
>>> =======
>>> All further patches depend on the first amba patch, therefore please ack
>>> and this should go via one tree.
>>
>> Are you able to provide a stable branch with these patches once you pull
> 
> I doubt I will be merging this. I think amba code goes through Russell.
> 
>> them in to "one tree" here ? We have changes coming up in the coresight
>> tree, which would conflict with the changes here (horribly).
>>
> 
> You mean conflict with  coresight conversion to platform driver? Worst

Yes.

> case it is solveable: just drop .owner.

Or, we could merge the CoreSight changes (as they are really not
affected by the problem this series is trying to address) after the
base changes land in AMBA, via the CoreSight tree.


Suzuki

> 
> Best regards,
> Krzysztof
> 


