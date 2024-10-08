Return-Path: <linux-i2c+bounces-7277-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 536769953FC
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 18:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17001283BF5
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 16:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B7D1D31A0;
	Tue,  8 Oct 2024 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BfKbZvJM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB9224F0;
	Tue,  8 Oct 2024 16:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728403424; cv=none; b=PQWi+ALYvnaD4NC6tOjnX5/0xbcelJJEXWNkGk8s4M5uKGfk6H3z3VyJJuggDdv88VlaNxunoMNVNwom5R7SqfSg8YvL4xh9bRhRU5itokyH7wi23m0blZT0gUyx4gTPFEuOmDx0zVwD1+IfDeQcinAOmyqveypSNd0vrQDYHjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728403424; c=relaxed/simple;
	bh=eHRLnuNFNnHx6cpCghjA5SPciicevOMZ7FhMNyIl5sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3I0nz3u5/t96ewnhjTgXuRb3LajkvSSK/9DsGRZ8ENHoDI1HboWSSB4loUl/aFb32nFyBEcQqBwhSYi2Y1qq8FE74D56d8ODYvsACLZ4KKjpBiI7awkdED1P2vjO5M//C5Q4lkqpbEIKxd9ul/Do3mI1WogBCizdk6MuRPDdr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BfKbZvJM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B907C4CEC7;
	Tue,  8 Oct 2024 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728403424;
	bh=eHRLnuNFNnHx6cpCghjA5SPciicevOMZ7FhMNyIl5sI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BfKbZvJMcOs5B5kSc8RKqyHkp0S1j46iq5NBNTC9Fg9mfS0B5QFJ9cql+NI/w9FFd
	 aABcV4NwA8wLKfnVwN4HUNII1k2mu249fJxJDGorzhGH2DwtQI0g8WbtXP3A0ikpwH
	 N+eLg5KEHoPZscD2S0v9qSnUvCygyxnSXgP8c/UourRLt3XEWZXZuR78lS+awDVPK2
	 kE2esUoq0xl/vF1pnLx6WvcQNzleHIn5e0+U63aZz2i0tPj6OqPdxH0U+ByhwParQK
	 GvSfU4MQWcp6skazfzHitEaNW9hMisJn5xP9zIaAHkKR1hfgdPE3+GIPKgV8mrgxpb
	 7kRWTeg8sV+AQ==
Message-ID: <fc17ef3d-7895-4ee8-bfa0-d31dd45f2f2c@kernel.org>
Date: Tue, 8 Oct 2024 18:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] i2c: nomadik: support Mobileye EyeQ6H I2C controller
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20241008-mbly-i2c-v1-0-a06c1317a2f7@bootlin.com>
 <20241008-mbly-i2c-v1-2-a06c1317a2f7@bootlin.com>
 <oxcxs6n7y4bw33yfgaacd2cayf7otfochvlaofva2kabzjim6h@d6pam3gciepl>
 <D4QI63B6YQU5.3UPKA7G75J445@bootlin.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <D4QI63B6YQU5.3UPKA7G75J445@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/10/2024 16:43, Théo Lebrun wrote:
> Hello Krzysztof,
> 
> On Tue Oct 8, 2024 at 3:39 PM CEST, Krzysztof Kozlowski wrote:
>> On Tue, Oct 08, 2024 at 12:29:41PM +0200, Théo Lebrun wrote:
>>> Add EyeQ6H support to the nmk-i2c AMBA driver. It shares the same quirk
>>> as EyeQ5: the memory bus only supports 32-bit accesses. Avoid writeb()
>>> and readb() by reusing the same `priv->has_32b_bus` flag.
>>>
>>> It does NOT need to write speed-mode specific value into a register;
>>> therefore it does not depend on the mobileye,olb DT property.
>>>
>>> Refactoring is done using is_eyeq5 and is_eyeq6h boolean local
>>> variables. Sort variables in reverse christmas tree to try and
>>> introduce some logic into the ordering.
>>>
>>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
>>> ---
>>>  drivers/i2c/busses/i2c-nomadik.c | 22 +++++++++++-----------
>>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
>>> index ad0f02acdb1215a1c04729f97bb14a4d93f88456..ea511d3a58073eaedb63850026e05b59427a69c6 100644
>>> --- a/drivers/i2c/busses/i2c-nomadik.c
>>> +++ b/drivers/i2c/busses/i2c-nomadik.c
>>> @@ -6,10 +6,10 @@
>>>   * I2C master mode controller driver, used in Nomadik 8815
>>>   * and Ux500 platforms.
>>>   *
>>> - * The Mobileye EyeQ5 platform is also supported; it uses
>>> + * The Mobileye EyeQ5 and EyeQ6H platforms are also supported; they use
>>>   * the same Ux500/DB8500 IP block with two quirks:
>>>   *  - The memory bus only supports 32-bit accesses.
>>> - *  - A register must be configured for the I2C speed mode;
>>> + *  - (only EyeQ5) A register must be configured for the I2C speed mode;
>>>   *    it is located in a shared register region called OLB.
>>>   *
>>>   * Author: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
>>> @@ -1046,8 +1046,6 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
>>>  	struct regmap *olb;
>>>  	unsigned int id;
>>>  
>>> -	priv->has_32b_bus = true;
>>> -
>>>  	olb = syscon_regmap_lookup_by_phandle_args(np, "mobileye,olb", 1, &id);
>>>  	if (IS_ERR(olb))
>>>  		return PTR_ERR(olb);
>>> @@ -1070,13 +1068,15 @@ static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
>>>  
>>>  static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
>>>  {
>>> -	int ret = 0;
>>> -	struct nmk_i2c_dev *priv;
>>> -	struct device_node *np = adev->dev.of_node;
>>> -	struct device *dev = &adev->dev;
>>> -	struct i2c_adapter *adap;
>>>  	struct i2c_vendor_data *vendor = id->data;
>>> +	struct device_node *np = adev->dev.of_node;
>>> +	bool is_eyeq6h = of_device_is_compatible(np, "mobileye,eyeq6h-i2c");
>>> +	bool is_eyeq5 = of_device_is_compatible(np, "mobileye,eyeq5-i2c");
>>
>> You should use match data, not add compatibles in the middle of code.
>> That's preferred, scallable pattern. What you added here last time does
>> not scale and above change is a proof for that.
> 
> I would have used match data if the driver struct had a .of_match_table
> field. `struct amba_driver` does not. Are you recommending the approach
> below?
> 
> I don't see how it brings much to the driver but I do get the scaling
> issue as the number of support compatibles increases. This is a fear
> based on what *could* happen in the future though.

You still have adev->dev.of_node, which you can use for matching in
probe. See for example of_match_device() (and add a note so people will
not convert it to device_get_match_data() blindly).

Best regards,
Krzysztof


