Return-Path: <linux-i2c+bounces-1363-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D74830E5C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 22:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78078283E43
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 21:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240342554E;
	Wed, 17 Jan 2024 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Smcam5gM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14BD22EEC;
	Wed, 17 Jan 2024 21:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705525553; cv=none; b=ewbutJSQ+vMxOP+hIeCCihfvkf0dQ2xs+OqHaMV/6ko/byjfgLkILUTPNVStAb4QRpxnBlp7Usgfp/0GTzLK3KgIPUqM+Hwt9Mr6rbpeFOrgB7ZLFY+fNcg8DO2k15i6LjMeYWqEEj3BB4NzKvvg1gE6XBGR/NJY/txwJoJH83A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705525553; c=relaxed/simple;
	bh=6ZXHmnzWB2J471fGbFzkTEz9OgChCQqUtQGmN51eyfs=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=TukB5qsCjjxxCkqVRM634kKOc6r/DdpTqmYSwzcKyD/6gbRssm1N5wnOtpN3nvc1GlVY9YTpb8uJ+4ZaHAcp2OMB1qFgnOVoL9tSvh8jG9nLJwsexMVKIM8xObn0bsKLQMqXQPtQDNYRHGx9u/uaOcVxhkotzdcQlID55ZPR59U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Smcam5gM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C022EC433F1;
	Wed, 17 Jan 2024 21:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705525553;
	bh=6ZXHmnzWB2J471fGbFzkTEz9OgChCQqUtQGmN51eyfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Smcam5gMJPERHyHvTLRciyWk2aWC9EB/6WSgHFGVLOsYSky95RmvaoRWMG6MP0pPJ
	 vwI1zCRp60xbntgVKLCtJMLWZ7nDCOTw2Q55xgP/vivALdAWE/GfkbkqE9vQaA76Ik
	 kd3PruvwTw5OEeNmFmTi3E7ahakOmbw0IQBFb4F/0eIfhaPeMnJCZdrJAXIt/VOEc2
	 qJYf0LI2tKxTmYmUp9KKToWuXHZqBjq1K2vktTY0tyEK69Tp5NLa/cZz4X+6pzulQw
	 nwZ8dq+WHa8FAKmivGmoWa/YQ1nv80ZZn+lfgNRJANM5uiTYUanS5OyVK2bD4tpYCO
	 aWZNNZa9UwYTw==
Date: Wed, 17 Jan 2024 22:05:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Boddu, Sai Pavan" <sai.pavan.boddu@amd.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "Simek, Michal" <michal.simek@amd.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: cadence: Avoid fifo clear after start
Message-ID: <pi4mct77spgoef3mfth7qcha73qrzlmvxhjrqrdf5rjfcxzlb4@zwxbyxf3httv>
References: <20240105125258.2470397-1-sai.pavan.boddu@amd.com>
 <lzvb6oyinlmdrbaat6ayxioca5r2qf7wi3kt63lzorbjytmmbn@wfuz63znrzbr>
 <DS7PR12MB5741FC0E92875C8DB7BFEEDFB6722@DS7PR12MB5741.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR12MB5741FC0E92875C8DB7BFEEDFB6722@DS7PR12MB5741.namprd12.prod.outlook.com>

Hi,

> >> b/drivers/i2c/busses/i2c-cadence.c
> >> index de3f58b60dce..6f7d753a8197 100644
> >> --- a/drivers/i2c/busses/i2c-cadence.c
> >> +++ b/drivers/i2c/busses/i2c-cadence.c
> >> @@ -633,6 +633,7 @@ static void cdns_i2c_mrecv(struct cdns_i2c *id)
> >>
> >>  	if (hold_clear) {
> >>  		ctrl_reg &= ~CDNS_I2C_CR_HOLD;
> >> +		ctrl_reg &= ~CDNS_I2C_CR_CLR_FIFO;
> >
> >I'm wondering whether the whole ctrl_reg should be reset after the first write.

> [Boddu, Sai Pavan] previous implementation of read-modify-write was good then ?

I don't know, I'm just asking... because rather than
read-modify-write, this is read-modify-write-modify-write :-)

I'm just wondering if after the first write ctrl_reg is still
holding a valid value.

Andi

