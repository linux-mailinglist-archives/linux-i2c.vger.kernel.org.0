Return-Path: <linux-i2c+bounces-2108-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C1086ED4B
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 01:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3B011C21174
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 00:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657946AD6;
	Sat,  2 Mar 2024 00:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVVn7fb3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593417F3;
	Sat,  2 Mar 2024 00:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709338582; cv=none; b=MBeZhQgxLLzJOaUuI+bkp7jjT87OLBIfbxeHpjbiKJhRFFYPL2vOUWFz/w9JKJp/LXbeKIhVAp9tEin+JInJlPgdiPopSbHkbFyywjT8pk14mtIzWgP7sZf5E2J7Ek3lvIJuh+nAG6sl2NTkqhlIOpAgEGSlxK8IKVq5OIMcCYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709338582; c=relaxed/simple;
	bh=e1sMeEwV6zrYXOM9M9z2DLs2bzRRRslBRFpB8ITBido=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARSUtlDT/RfVailIwwfG8UkPAwdXAubc1s3jLNjs1uGX0PSMJ8JnbYq+3bl1rpOsKdq+skkbBc7nFupcBv40xkPPOUlHSxRQT+jjUINGJNGYpVqsVMpYF3SnGAR9fMsqE+6eGAiGZ10wmZWsww4KP/wMbNRleN7AX/FbmMLyWSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVVn7fb3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCDAC433C7;
	Sat,  2 Mar 2024 00:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709338581;
	bh=e1sMeEwV6zrYXOM9M9z2DLs2bzRRRslBRFpB8ITBido=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVVn7fb3930ZHmaDmxv3Z6Vd1Bo6TsmqTBJ2N8WWx5XosEAqJOZsWs7pvpzXZAare
	 qNwwz9Ap7rlKVE8uNFDfs6gHYzMF7S09S8JJcfLt0bBnZAjPofIifVHuXwa3rDRm/1
	 xSh/Tan9At8mFSFKjF1qjjMpGj2F4PNcwcmNS2qIW3ai/YEHqgJnpgD7B2XsyCg9uY
	 XDDZMHBTtvXUwXztcg1L8XDBt6s+50ybSfSHdMbyho2gvwu8xHN6qUlkKBi99K0Fiy
	 Isb0PIg7EMX92l3yLvxYEdkG3a0sg5kqAdc7YQUZq4ccPgrG1Q7pMeHxfM9VJ3zd7E
	 lzvA/lcYr/sag==
Date: Sat, 2 Mar 2024 01:16:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	Gregory Clement <gregory.clement@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [SPAM] [PATCH v2 03/11] i2c: nomadik: rename private struct
 pointers from dev to priv
Message-ID: <heuizvxx7zu2if33wofbecdroiqg6k3wmovmhtjjlb4b7qx4as@4ksrhcn5ohk4>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-3-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229-mbly-i2c-v2-3-b32ed18c098c@bootlin.com>

Hi Theo,

On Thu, Feb 29, 2024 at 07:10:51PM +0100, Théo Lebrun wrote:
> Disambiguate the usage of dev as a variable name; it is usually best to
> keep it reserved for struct device pointers. Avoid having multiple
> names for the same struct pointer (previously: dev, nmk, nmk_i2c).

just a nitpick here: this patch does also some small style fixes.
Could you please mention them in the commit log in your v3?

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>

In any case,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

