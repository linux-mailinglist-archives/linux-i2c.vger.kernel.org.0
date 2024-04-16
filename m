Return-Path: <linux-i2c+bounces-2961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 579DF8A68D2
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 12:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 879A51C21031
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 10:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A37128373;
	Tue, 16 Apr 2024 10:42:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D94127E32;
	Tue, 16 Apr 2024 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713264126; cv=none; b=eWwmMfSM8c1L+W0X4q1TMXCDoT3k1u70MPR3Pl7X9dDHzDps1Ww36VJxSVa2nN1+wj7qOq/uKyfxqv1oMVSgwGhjbGBRhKLovTGjHV5R79il0D2FUKdKOwMCajBswXqdsOHy0lhhVotZIlElCan37ekwss/FUDEGYAeaGWE66d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713264126; c=relaxed/simple;
	bh=TwIS/5qzT8RE4E2MZ5uzzz88SHtKz+6BRPI2AbQnAYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gNEe/bhCh3HT7HQbxDE5z4O/mKzo8nwgfS1mCFBIMmZdKX0ThJR0aQTfLkP7vmhbQ5OEiERa0wwVd31yodYOWnucdgLRrKYaju0Jlyc4BkpjeNcztdgHKozrGEllTs0Kf4fy+Koj/UJ5SWnVsi0L5AbE1IC+L/uFxqWkqIobg5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB24D2F;
	Tue, 16 Apr 2024 03:42:31 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 316C43F64C;
	Tue, 16 Apr 2024 03:41:58 -0700 (PDT)
Message-ID: <8a8a8e8b-8256-4d33-a39b-9e3cbc4ccff2@arm.com>
Date: Tue, 16 Apr 2024 11:41:54 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] amba: store owner from modules with
 amba_driver_register()
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
 Alex Williamson <alex.williamson@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-i2c@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-input@vger.kernel.org, kvm@vger.kernel.org
References: <20240326-module-owner-amba-v1-0-4517b091385b@linaro.org>
 <171182151736.34189.6433134738765363803.b4-ty@linaro.org>
 <cfa5aa01-44ef-4eb1-9ca6-541ed5908db4@linaro.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <cfa5aa01-44ef-4eb1-9ca6-541ed5908db4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

+ Greg


Hi Krzysztof,

On 30/03/2024 18:00, Krzysztof Kozlowski wrote:
> On 30/03/2024 18:58, Krzysztof Kozlowski wrote:
>>
>> On Tue, 26 Mar 2024 21:23:30 +0100, Krzysztof Kozlowski wrote:
>>> Merging
>>> =======
>>> All further patches depend on the first amba patch, therefore please ack
>>> and this should go via one tree.
>>>
>>> Description
>>> ===========
>>> Modules registering driver with amba_driver_register() often forget to
>>> set .owner field.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [01/19] amba: store owner from modules with amba_driver_register()
>>          (no commit info)
> 
> Patchset applied here:
> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git/log/?h=for-v6.10/module-owner-amba

How do you plan to push this ? Given this affects most of the drivers/, 
do you plan to send this to Greg ? We have changes in the coresight
tree that would conflict with this "tag" ( I haven't merged them yet, 
but is in my local queue). I want to make sure we can avoid the
conflicts. I am happy to merge this to my local tree and base the
changes on this, if this is going in for v6.10 and all are in agreement.

Kind regards
Suzuki




> 
> Best regards,
> Krzysztof
> 


