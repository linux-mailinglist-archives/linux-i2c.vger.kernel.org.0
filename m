Return-Path: <linux-i2c+bounces-473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 374527F9D29
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 11:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 944F8281375
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 10:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636F31805D;
	Mon, 27 Nov 2023 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=feathertop.org header.i=@feathertop.org header.b="i+tMYLJC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B2b6Bm1R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E955910A;
	Mon, 27 Nov 2023 02:12:04 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 629E15C00AF;
	Mon, 27 Nov 2023 05:12:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 27 Nov 2023 05:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=feathertop.org;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1701079924; x=1701166324; bh=28QuhMK9GVHX2Z+NvBneJtnv1
	aX+4y54lRy7QfGLO9c=; b=i+tMYLJCsz1fCVNiTjbB8G+sFnfmkdlL7A/tSOg8M
	klmEiIJbH4Dyf2V1/Qsn0FV7jxS0Jw6QqsckaeBBpbxoHS1UhWJb709X/v1uNpmq
	V0nuG668VjbE0xoiscZn9UomWEfoz3R58yQ9oIftT2ki9xsomooDoFlsoyzBkyJ+
	Cvn+ENZAqLVRzqUF299QZ/PbtTOC7QNDGKhqywLNF6SzhPKH1hyldH5BrtEUmdUs
	hS49iqLS7EaUOQseWrkgJTI+0chdYmtfU/9TcwNGCzfuMYeIJqoL/Pz3QkxKB1e0
	8DJdvPK/RVwBn6KdBXxe77c5Rx5B9rEkTcxo+7CtO8nQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1701079924; x=1701166324; bh=28QuhMK9GVHX2Z+NvBneJtnv1aX+4y54lRy
	7QfGLO9c=; b=B2b6Bm1RDl3w/VSr2E/9+ZeA1NrYiUOwbI4sVCFcqWIdYvunCQo
	HARPrAl7NeOBq9CAgo4z02U7lm98YCm75N8BwSC7sFWCE0/btv1e/n3x3zqh0/9l
	Uzf4vQjeCY+/aNPEjyWlNrxbN9SMpR9hf0pUy26cF5J1immTl03KSvvIe6deufp7
	3DOsxb96z+2PjYcNJvjbQfmORvx9FgcuSbpVcR4AcrdJQvDzlqJzZCU3zo9InEmZ
	V6uROjtWaE8z1yFSJGXaEL0k8nUz1ya3xUfkZ+6xEneLUmfQjd45oyYLEjz/UUoX
	mdMgdQdB9NhKFR0xiRDcPnGSId0ZYo+MX/A==
X-ME-Sender: <xms:dGtkZXvt_lu42vwK-DdQzrMNhNE019tHig2q_EumY-dSwvMwDb6P2Q>
    <xme:dGtkZYe7QRT5qxGs0Z8HqAtuKRsFmr5Bkx-ICAlZ0JoExOpIbrMF9rWjHJKiW5Drx
    Q9LKeD6pg>
X-ME-Received: <xmr:dGtkZax6TJgsAco6gcq6HuBrlkqIe81HilaR-zVwtrIssIvD7Pc6VVP3xEy9VRMGcgFdhr73TL0G4ldcCQx4F7yuRxYKZVogXvwMQw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiuddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefvihhm
    ucfnuhhnnhcuoehtihhmsehfvggrthhhvghrthhophdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueegfefgveeuiedtheffgfefveejkeetiefhhfdvjeevlefhueekudeuleeghfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthhimh
    esfhgvrghthhgvrhhtohhprdhorhhg
X-ME-Proxy: <xmx:dGtkZWMvOhI3yos1B1UGvIaKM4E5b5d1e5A2wj1iQnWKdrrroWi0iw>
    <xmx:dGtkZX_j4M5pkrqNtXGiubRVZ5z2FnYzOV98CcVS__-KwInlQxoLUw>
    <xmx:dGtkZWWTH3788f3CJe3a_P3z25wNYmp0KwaaROAhFJ6BtF4GcBEjag>
    <xmx:dGtkZTRm_5FvNfh2phWy9lxNym8j1deMwtLwloT6YWUYgdDbAH1z1g>
Feedback-ID: i1f8241ce:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Nov 2023 05:11:59 -0500 (EST)
Message-ID: <69e4609d-689d-4f03-b5f7-d3563ace185b@feathertop.org>
Date: Mon, 27 Nov 2023 21:11:57 +1100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] i2c: rk3x: Adjust offset for i2c2 on rv1126
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org
References: <20231122122232.952696-1-tim@feathertop.org>
 <20231122122232.952696-4-tim@feathertop.org>
 <20231126194311.jxkvz3kqgsbzfgek@zenone.zhora.eu> <4717511.tIAgqjz4sF@diego>
From: Tim Lunn <tim@feathertop.org>
In-Reply-To: <4717511.tIAgqjz4sF@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/27/23 11:26, Heiko Stübner wrote:
> Hi Andi,
>
> Am Sonntag, 26. November 2023, 20:43:11 CET schrieb Andi Shyti:
>> Hi Tim,
>>
>> On Wed, Nov 22, 2023 at 11:22:26PM +1100, Tim Lunn wrote:
>>> Rockchip RV1126 has special case mask bits for i2c2.
>>>
>>> i2c2 wasnt previously enabled in rv1126.dtsi, adding DT node alone
>>> is not sufficient to enable i2c2. This patch fixes the i2c2 bus.
>> If I don't have sufficient information about the hardware this
>> description is completely meaningless to me.
>>
>>> Signed-off-by: Tim Lunn <tim@feathertop.org>
>>> ---
>>>
>>> Changes in v2:
>>> - i2c: clarify commit message
>>>
>>>   drivers/i2c/busses/i2c-rk3x.c | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
>>> index a044ca0c35a1..151927466d1d 100644
>>> --- a/drivers/i2c/busses/i2c-rk3x.c
>>> +++ b/drivers/i2c/busses/i2c-rk3x.c
>>> @@ -1288,8 +1288,11 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>>>   			return -EINVAL;
>>>   		}
>>>   
>>> -		/* 27+i: write mask, 11+i: value */
>>> -		value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
>>> +		if (i2c->soc_data == &rv1126_soc_data && bus_nr == 2)
>>> +			value = BIT(20) | BIT(4);
>> Any chance to put a comment here as it is in the other
>> assignment?
>>
>> Are the two assignment mutually exclusive?
Yes they are mutually exclusive, and its only i2c2 that is 
non-sequential (as per Heikos description below).
>>
>> Heiko, any chance to take a look here?
> So the background is, that on some SoCs Rockchip implemented to
> different variants for the i2c controller. One new-style controller
> that they started using in rk3066 and are using even today.
>
> For these old socs they kept the "old" controller block as a sort
> of fallback if the new thing didn't work out, and the bit above is
> switching between the
>
> Hence that is limited to rk3066, rk3188 and seemingly the rv1126.
> And while the bits controlling the i2c controllers on the original socs
> are order sequentially in the grf register, the rv1126 seems to have
> those bits in non-consequtive places.
>
>
> So TL;DR the change itself is likely good, and hopefully there won't
> be any more of those, as all the new socs don't need this anymore.
rv1108 is also similar but different bits again (only going off the BSP 
sources).
I dont have hardware or the TRM to validate this on rv1108.
>
> I do agree with the request for a comment describing the issue
> in the code, but otherwise

I will fix this.

> Acked-by: Heiko Stuebner <heiko@sntech.de>
>
>

