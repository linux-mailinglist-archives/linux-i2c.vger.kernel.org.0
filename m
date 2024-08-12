Return-Path: <linux-i2c+bounces-5305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B794EDC9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 15:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99E071F2105A
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 13:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0814417BB2E;
	Mon, 12 Aug 2024 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQRlUWwh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA465170828;
	Mon, 12 Aug 2024 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723468260; cv=none; b=YxQljfGERxMwn1lJy2YN24xZm6MahGFYtQD73Wpn4vk6D2CSa5SG/xRf2Sr9/cFw9pL9OWt9sGD78XSsh3G5uWglwILuzgimFrErbfa89FumKBFa8S5PGgXFHgSoKS5yCJSCR4NO8w2ppFJ8l6Atz17HhIuy8es5oDTnh4ZcHBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723468260; c=relaxed/simple;
	bh=9pceFmA6z72sxXOnjaTJNtiGDc0SYLeSFqZUE6qpFJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eh/6Gcstznk49L6LvPapPAFMDoJs3WFjwMDNXTyxG4+3K9f74Ifjv9zuatzbQ06RRVdOihJ6GAmgxLch0srQ2raIigTp4TnuE+lPUVLLD4G0cbPKDatyoJtVc6VwPhLSIDYi5T7MHTgHDdkVd2nc8zSrCh4MAMnigGVKLoye5es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQRlUWwh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0DBC32782;
	Mon, 12 Aug 2024 13:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723468260;
	bh=9pceFmA6z72sxXOnjaTJNtiGDc0SYLeSFqZUE6qpFJ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nQRlUWwh5V08H11ZQcdD8ZiQk+rCMZMm7Fn1PkF6FaTY8q5k5DtgYuTz7IoTxLYF/
	 PdOZRQTsCs9CbWtjp2InABfukKIA/x6cyArzEXeu1DW/4VCHoZ6PUGX7oNJiflh0Yv
	 cHofsaiv6CQfJmeWhw9kMISyKLGSnGaXw8Bxhqw/4QXx6vjYCHT7J884YbxEKr975B
	 0gUpp/uSuJffqI/sCV5KfkQ8jZdRHATGQv75Hxi1wAuGAzDKPIyk1ymlDfKSvtwEUV
	 ErOstJZr6Y0rRWfCMti2qti7r071pcL+gBuVJqfBqVVRCEO0TVKlYGJAS8f3+nbH+w
	 rw6IGcHWfeH1A==
Message-ID: <fa54c691-467f-4b9e-b483-023dfeb8d32b@kernel.org>
Date: Mon, 12 Aug 2024 15:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] hwmon: (amc6821) add support for tsd,mule
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Guenter Roeck <linux@roeck-us.net>, Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Jean Delvare <jdelvare@suse.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-4-f9f6d7b60fb2@cherry.de>
 <5d5c44cd-6320-4fcd-9409-f3fc97bc5389@roeck-us.net>
 <40ff0c23-f037-454c-9d79-05dd72655052@kernel.org>
 <bd70a54a-ea41-44cc-a971-e9a764a4212c@cherry.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <bd70a54a-ea41-44cc-a971-e9a764a4212c@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2024 13:58, Quentin Schulz wrote:
> Hi Krzysztof,
> 
> On 8/12/24 1:38 PM, Krzysztof Kozlowski wrote:
>> [Some people who received this message don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 31/07/2024 17:12, Guenter Roeck wrote:
>>> On Thu, Jul 25, 2024 at 03:27:50PM +0200, Farouk Bouabid wrote:
>>>> Theobroma Systems Mule is an MCU that emulates a set of I2C devices,
>>>> among which is an amc6821 and other devices that are reachable through
>>>> an I2C-mux.
>>>>
>>>> The devices on the mux can be selected by writing the appropriate device
>>>> number to an I2C config register (amc6821: reg 0xff)
>>>>
>>>> Implement "tsd,mule" compatible to instantiate the I2C-mux platform device
>>>> when probing the amc6821.
>>>>
>>>> Signed-off-by: Farouk Bouabid <farouk.bouabid@cherry.de>
>>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Applied.
>>
>> Eh, there is undocumented dependency on I2C here. Next has warning
>> because of this.
>>
> 
> I think you meant to comment this on 
> https://lore.kernel.org/linux-i2c/20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de/T/#mdb7976f1dc16fce0b7db9abee6fd0b1fd0a2e2ba 
> (patch 3 and not 4 of the series). This patch (4) is fine on its own I 
> believe, no dependency on anything else. (well, except if we expect 
> bindings to be absolutely merged before the drivers? I think what 
> matters is the Device Tree changes making use of the new binding be 
> merged after dt-binding changes?).

Yeah, this was about DT binding.

> 
> I agree that there's a somewhat non-obvious dependency between patch 1 
> and 3 (the dt-bindings) and 5-8 with everything before, we could have 
> made this more explicit.
> 
>> Farouk, please *always mention* the dependencies between patches.
>>
> 
> I wasn't aware of that rule, my apologies for not catching this before 
> upstream submission.
> 
> For anyone wondering the rule is made explicit here:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#separate-your-changes
> 
> "If one patch depends on another patch in order for a change to be 
> complete, that is OK. Simply note “this patch depends on patch X” in 
> your patch description."
> 
> Question about b4 workflow though. I encourage using b4 to avoid as many 
> mistakes as possible and make the workflow as painless as possible. I 
> believe b4 doesn't allow you to have per-patch notes, only in the 
> cover-letter.

"Patch description" or "per patch notes" is whatever you write in
changelog, so under ---.


> a) is this dependency list in cover-letter acceptable, or
> b) need to add it to the patch note (below the ---), or

One of above should be enough, both are more welcomed because many
maintainers ignore completely cover letters.

> c) can add it to the patch commit log

No, if patches go through separate trees then it would be just confusing
and not helping at all.

Best regards,
Krzysztof


