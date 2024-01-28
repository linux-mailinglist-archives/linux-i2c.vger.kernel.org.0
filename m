Return-Path: <linux-i2c+bounces-1504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E283FAE6
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 00:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECDB61F224FF
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jan 2024 23:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47737446C5;
	Sun, 28 Jan 2024 23:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=feathertop.org header.i=@feathertop.org header.b="MTt7WYjl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HtZoouw2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846311E4A8;
	Sun, 28 Jan 2024 23:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706483987; cv=none; b=SJk29p/ywJDXoz6PpHFfdOpmRm2C8J0xm7mUSg+u1FtxNyDNFgILe1cvhxhYLXEr8hzQnJ1OsymExtB3EVDhB3p5oBdthc7TjJW1Fsnx8xRezy2nLEMa7dCOdOlVIyYCdpXttGokzTzGKBLDTXIm77yRkK/DCDyzeIFu9/eFxyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706483987; c=relaxed/simple;
	bh=QEUfb2sA8KJ3vwu3DjUFRPuqRsbyUiZ+F9amISTLbU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mx5v3LivOm8yIExudMHmgKbw8Mpt/OZ19/Ch0BiRY9KToLfPpVi6qvsH/b1PT892Uc/gLnFXdmfxojU9NFYbi9qxfkldBBwMmIle9ZpwoTtprjO4/wwGZ6iqdUf5Px/NsimFM0Vzl4cTAGe/3lRVg56BgXwib0zE5MQWWc33iKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=feathertop.org; spf=pass smtp.mailfrom=feathertop.org; dkim=pass (2048-bit key) header.d=feathertop.org header.i=@feathertop.org header.b=MTt7WYjl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HtZoouw2; arc=none smtp.client-ip=64.147.123.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=feathertop.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=feathertop.org
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailout.west.internal (Postfix) with ESMTP id C6D8F3200A7A;
	Sun, 28 Jan 2024 18:19:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Sun, 28 Jan 2024 18:19:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=feathertop.org;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1706483983; x=1706570383; bh=1fKfNWclQmzN7rLysWXCqLcTCDbjGptQ
	Vt1xQ/FClcA=; b=MTt7WYjl2HZPvvVjU3x1449zJ75O42f4XLIyEEXaZehlmBfv
	7b7Sf8dK1z2x5qip0c+5b9/1RhsR/5K46hSZ6KISGh8yB9pZT1rai1gewNj0aASB
	MMsOqixRmsCDX4qu1qwU+HVgAQuBUbq8+QoExkvTGFGVD1L0eC2OluF14umQ9hVa
	7DDXxzHLmdJP9oUeV9tOiXPiZRnK9AOAtMYqIzdSjl3oL7rmlYxxRivHyNfOKQZG
	H6Lf+xOYF6Eisb4nl3i5kIjq9fVYtz0qMqGMW8dG3C1XegO5mVvbIprtByuf3EcQ
	jR+l9mrtfU2eqZaHMAdZBwFxHuDbkuMk97XsoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1706483983; x=
	1706570383; bh=1fKfNWclQmzN7rLysWXCqLcTCDbjGptQVt1xQ/FClcA=; b=H
	tZoouw2KWp888ydU+aBBPKcYu3/9eLYWilcQVPQobJnsnjpo018BlGWkbW0sQUK/
	kwsvhZUyNMMOvvnOKi5EiIHBDcGUbQ9jXQm76TtgR3KDch+NLPUOIxa7fouiwlPF
	CydOXmzkC18BjLuUwbuUtJk5PSlsrJHOvKMGD2K2ewNe4lRdezOwBS2QuSPkI7QC
	rRpuilma1cEOx3h/ucmQ5mTlYMaSeSFnQ4/cw7QMOjDXKYwLQsAB+qpJRAelmwQJ
	B7Rvf4xVSPYH3F9sUEBXO9CdSllZ5SP+iODiUAb4+w3e/Ekdby83ESWBESjzJDo1
	DxSG4K7kOaSXMN8C0UEvQ==
X-ME-Sender: <xms:DuG2ZQXsxg30Bgpj0yLpIiO13CyGwVPLDSzI-FnjJaiO87ZqhpuNbg>
    <xme:DuG2ZUkYUcicLuK-olDOCl6KGQOm5xXbWKfLwZCcnG70IKtT0QmPC4hjkkXXJm5sc
    vJBInn9wg>
X-ME-Received: <xmr:DuG2ZUZFBc83PoUuvkUtd0I3PzySMUp5jywhDF_WDC9_zC1x89_GgRE7R7LDIV0oB9ERzfYafUO1sXU1sujAfQ-QtbHB8Zy1khTkmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedtfedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefvihhm
    ucfnuhhnnhcuoehtihhmsehfvggrthhhvghrthhophdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueegfefgveeuiedtheffgfefveejkeetiefhhfdvjeevlefhueekudeuleeghfek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthhimh
    esfhgvrghthhgvrhhtohhprdhorhhg
X-ME-Proxy: <xmx:DuG2ZfXO5rafG7DDuUnj8H8nidQvmanzsnFODoAkDDz7u6URHBVZfA>
    <xmx:DuG2ZakAVrrsPN5fxrPtXjx0SFRlKkRekDq9DT2hFDrskRC1hffkJg>
    <xmx:DuG2ZUe66EWt5D3omkzr7KK9QXlmsc-DVKAhbQ6CCG0E_pIpP5UCyg>
    <xmx:D-G2ZcVGRdLsXVztB9damzissF5osJhFZBQzxpqdd8BggjP5B3avSQ>
Feedback-ID: i1f8241ce:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Jan 2024 18:19:39 -0500 (EST)
Message-ID: <030766c0-a6b9-401d-9e9a-fe5d11c5d381@feathertop.org>
Date: Mon, 29 Jan 2024 10:19:35 +1100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.1 27/27] i2c: rk3x: Adjust mask/value offset for
 i2c2 on rv1126
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org
References: <20240128161424.203600-1-sashal@kernel.org>
 <20240128161424.203600-27-sashal@kernel.org>
From: Tim Lunn <tim@feathertop.org>
In-Reply-To: <20240128161424.203600-27-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sasha,

   Support for the rv1126 SoC was only added around linux 6.2 and 6.3, 
thus doesnt make sense to pick this patch up in 6.1

Regards
   Tim

On 1/29/24 03:14, Sasha Levin wrote:
> From: Tim Lunn <tim@feathertop.org>
>
> [ Upstream commit 92a85b7c6262f19c65a1c115cf15f411ba65a57c ]
>
> Rockchip RV1126 is using old style i2c controller, the i2c2
> bus uses a non-sequential offset in the grf register for the
> mask/value bits for this bus.
>
> This patch fixes i2c2 bus on rv1126 SoCs.
>
> Signed-off-by: Tim Lunn <tim@feathertop.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Wolfram Sang <wsa@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   drivers/i2c/busses/i2c-rk3x.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> index 6aa4f1f06240..c8cd5cadcf56 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1295,8 +1295,12 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
>   			return -EINVAL;
>   		}
>   
> -		/* 27+i: write mask, 11+i: value */
> -		value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
> +		/* rv1126 i2c2 uses non-sequential write mask 20, value 4 */
> +		if (i2c->soc_data == &rv1126_soc_data && bus_nr == 2)
> +			value = BIT(20) | BIT(4);
> +		else
> +			/* 27+i: write mask, 11+i: value */
> +			value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
>   
>   		ret = regmap_write(grf, i2c->soc_data->grf_offset, value);
>   		if (ret != 0) {

