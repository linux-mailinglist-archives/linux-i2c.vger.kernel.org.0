Return-Path: <linux-i2c+bounces-2930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1708A3B92
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 10:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95D00284020
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 08:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83991D54F;
	Sat, 13 Apr 2024 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="SXSI/zHn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35A31CD29;
	Sat, 13 Apr 2024 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712995661; cv=none; b=fDKtzYbI1HUwf3hET3sLMHU/NDCH+Ddemy/F1blQwi3yBvpoWC6UKK6fHrdewH6+rUwBJU7v9mPbmOG5TSFJtk1jn/xbac3JWyVsIdoicjVOsvk0zZKE+Me7zx2/kDditVEWUi9cbNl2JLFv+c8eLsYXG2dRbqU5xCjZqajSVAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712995661; c=relaxed/simple;
	bh=fDnR91pUPs9k8ayRt2nN8sDKaX3MojOlE08aMckL2cA=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XrU5eUcVy+kS4seUbxaeU8xfy8Hg9JAKQKLsBqent2Ns4DXEfJ2bBcmZi/icqBkZ0YP/prCPSWlZ2ZuwIbRZnjbu3HxvBt9MlmcwcR+kkGDEP5ymx9+fod3jRhSo+dKXooWZjjAtfTxO2k451G/kCtjkPUEqHQp5w9zU4bIt4vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=SXSI/zHn; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1712995656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LYnFdov+ZX/QOZ7UzZrEIgIh+j/rWuxjP60G0MEoink=;
	b=SXSI/zHnVe20vBjAJpoMtu0ZvHlgIlLW7ApEhhizFKZ5rvG3+XevLHEewK3oKkfjTsSqqk
	t0Srxkbcjs68F3n41znGHHd3qszBWObflOHquPzzRIm2sQ7dnjDFaP0u6F76deVkS1HGoq
	UKtUVd0UCTwoj43JUugxjLUfXlEiqLZOBRcxZguwJOeDzz4Hv5O3mnoL6TaVNzHSSaQtNs
	TMThbVDIkw3H27nn6oOH6/6JPUaZ7TS0c6V4frYeZveVLK1OBwYV4iBgWseru5XxW2jdvi
	FrbF4kZwpxsLThi2XHh/yhc5YWCOjIv+7xTmf1UavFjeWclZc19do+HsdPnRUA==
Date: Sat, 13 Apr 2024 10:07:36 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Andi Shyti
 <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
In-Reply-To: <4ogowge36wr2lk2zdsv3zc3sm3pjk4h5wmy2hjth734kgsr3rs@lb4wsmkpavnd>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-33-wsa+renesas@sang-engineering.com>
 <4bcd397ec377a4932c34d62c85ef28ed@manjaro.org>
 <hgdhrf2jiovfxcppdtsq32sfbk4xuq7ewiwq4awwztj4mp3yez@kj6ixihkcxhe>
 <af8ac48f10a1636ab2486aef91e01c3f@manjaro.org>
 <4ogowge36wr2lk2zdsv3zc3sm3pjk4h5wmy2hjth734kgsr3rs@lb4wsmkpavnd>
Message-ID: <d26197a9fd834cd4f35529b5fe67d77c@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Wolfram,

On 2024-04-13 09:10, Wolfram Sang wrote:
> Hi Dragan,
> 
>> Sure, but I think that having such an additional debug facility
>> can only help and save the people from adding temporary printk()s
>> while debugging.
> 
> Mileages, I guess. I like temporary printouts for temporary debug
> sessions. This way the upstream source code stays slim. In my 
> experience
> with I2C over the years, debugging happens with developers anyhow.
> Logfiles from users which help developers create patches are very rare.
> And those users are usually capable enough to add debug patches.
> Given these experiences (which may be different in other subsystems), I
> don't see why we should carry the bloat.

Yup, adding some printk()s while debugging is pretty much inevitable,
and having full debugging available would add a lot of code, regardless
of the subsystem.

> That said, I'll leave the final decision to the driver maintainers.

Agreed.

