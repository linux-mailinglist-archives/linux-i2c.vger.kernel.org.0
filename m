Return-Path: <linux-i2c+bounces-893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F318193BB
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 23:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C101F23EC2
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 22:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6BC37D22;
	Tue, 19 Dec 2023 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=feathertop.org header.i=@feathertop.org header.b="vy3y9PEs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AIMVJEIs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1373D0A4;
	Tue, 19 Dec 2023 22:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=feathertop.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=feathertop.org
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id D2FDE5C029D;
	Tue, 19 Dec 2023 17:40:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 19 Dec 2023 17:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=feathertop.org;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1703025622;
	 x=1703112022; bh=YulO5bOrmCH4IJdwHLfOgvroUB/OPEd9Q4e+YqkL5Us=; b=
	vy3y9PEs0kBQD31hSS+KzbURs8AxneaB0oGAvNRx7Vo9ddCbaKXrdCEwm+p6OLZh
	ZVqouOKc1Lnd0w/Gzg5sy2OR0EXtpLxSrkPrgfC3vDFkdTXZdNx+wtiYHob6cDSi
	YrsMgxY4ZvtqjZSVYiRMeNsF+5dwp55Pm0JIaodsXGYcBxzJipi5Nxc+rZGaBNGr
	FbOlyb+ZJheDlgwM22V+FUmB8LXiX2pu7UriACNR5cxPIgdiy1oFlPS1sD5bgqta
	wj0DkF/aScjAhiGLwvaWE2lHO7gqXvVOlb2vOuqgD2PY7aZyyXBGmLnYglB4U/MN
	rt/xLZWnvTEHPlWfyb87QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1703025622; x=
	1703112022; bh=YulO5bOrmCH4IJdwHLfOgvroUB/OPEd9Q4e+YqkL5Us=; b=A
	IMVJEIs1FuoLzlyj61ubmMBD1mJtsyey5hOtgbC8pRFdM1AiHzKKplkG1rm1QdoR
	O8D3Z7A2oybnhj72vcvgHHRg1/sfrvwOuXPpa1io+v6lyo3uvLmnzmH4LcXZfj/R
	hhzg+rdh4hiPkrkj0MTkd7yJDkT3hiUjA0x4PWtoWzq6Lijh6trc7W9RLGHMcHPN
	L3zPIiLWAiDKuzDsCED8CLS5yZuvIblqBmNoDx+AUmf79WiDqFpGr4VT7bIlsr0O
	ivdbdF1qLr46vy1TkLKjD4+Hk8KP7RgdD/Bz53eA3Txy/VabNwLJEB9lTe7GLs0r
	e3KiMErX0G9ELUp5gx4GA==
X-ME-Sender: <xms:1RuCZYvfKb-38z53jaX3JhBVzfVs1j32TY80JiMmvXBoQ0eWeeRbFQ>
    <xme:1RuCZVcsxeniFyg10jwNEgzbLwzfPvn5X3RW5PfUKTEkmefj43wGQ7SW1JrbBozCz
    06_-EnP8A>
X-ME-Received: <xmr:1RuCZTxjXvgfGcnvgto3G9hTlavWaY9L_OqaXpBFsNKcAHxO5XrRVhbgBZZm0CRSgyGkVVDNIYbia4PYpxvGXsn5PqZ2UZrBVSdpNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduuddgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvfhfhjggtgfesthekredttddvjeenucfhrhhomhepvfhimhcu
    nfhunhhnuceothhimhesfhgvrghthhgvrhhtohhprdhorhhgqeenucggtffrrghtthgvrh
    hnpeeijedvveelkedtueejgefgvdelgfdulefgieehvedtjeeludekvdelffdvveehheen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtihhmse
    hfvggrthhhvghrthhophdrohhrgh
X-ME-Proxy: <xmx:1huCZbOUi1W5VLKsoIBxX-8wa4pV2rKcKi0DEkSxc5kV_5fgM7z_Cg>
    <xmx:1huCZY_mTl9100YR21LX5doHPq225g3g1F4dEaO7eZP2jc2Su-wLlQ>
    <xmx:1huCZTVBd4bCL1fg5cWuv3HbT8A5F3CxR8YrIiGWb3w61GozT82M-w>
    <xmx:1huCZTZIy21bcwi46s4BqPh0zbggvZSibjP6OjX2nAco_ii_sYwSkg>
Feedback-ID: i1f8241ce:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Dec 2023 17:40:17 -0500 (EST)
Message-ID: <14d972ed-87b3-4bad-a2f9-717f3d19d4a9@feathertop.org>
Date: Wed, 20 Dec 2023 09:40:12 +1100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] i2c: rk3x: Adjust mask/value offset for i2c2 on
 rv1126
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20231203124004.2676174-1-tim@feathertop.org>
 <20231203124004.2676174-4-tim@feathertop.org> <ZYHNkgxAauYp6ivX@shikoro>
From: Tim Lunn <tim@feathertop.org>
In-Reply-To: <ZYHNkgxAauYp6ivX@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wolfram,

On 12/20/23 04:06, Wolfram Sang wrote:
> On Sun, Dec 03, 2023 at 11:39:59PM +1100, Tim Lunn wrote:
>> Rockchip RV1126 is using old style i2c controller, the i2c2
>> bus uses a non-sequential offset in the grf register for the
>> mask/value bits for this bus.
>>
>> This patch fixes i2c2 bus on rv1126 SoCs.
>>
>> Signed-off-by: Tim Lunn <tim@feathertop.org>
>> Acked-by: Heiko Stuebner <heiko@sntech.de>
>>
> Applied to for-next, thanks!
Thanks.
> But, phew, the fact that this driver _needs_ i2c-aliases in DT should be
> fixed somewhen. I totally overlooked this so far :/
>
Not sure what you mean here? I did add an alias for i2c2 in the DT in 
another patch.

Regards
    Tim

>

