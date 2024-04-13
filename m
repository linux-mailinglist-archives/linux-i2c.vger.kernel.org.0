Return-Path: <linux-i2c+bounces-2927-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C618A3B4B
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 08:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2D1E1C212D5
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 06:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C121B947;
	Sat, 13 Apr 2024 06:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="h+Kv9ugX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F098E14267;
	Sat, 13 Apr 2024 06:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712990685; cv=none; b=CHR+Pn2Y5R/mZf7Z/rwOuPLPGv5rlghkZjSNgVNx6wOuUouSl9Do0XS8xmjAGroJDSLM5Rz380cz/iOwfQ181S+j9N8yrmqr1rfILukI3Gvc0Ryj0ONiEAbrjUJaI1vuLD8ViyYs5ydGrML+9KZzSkLpVfnKN9yGh6dJPTaZSoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712990685; c=relaxed/simple;
	bh=XmFQlhBHV5QBJqC7fe5fkrZpqsD2g+VZXB68l8Ylke4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ssPpUr0Jn46knUq2XjTRNFsLKZyNknwSQpl2Jpv8cg/d6arHr8JO45s5oSDWTMzPrX67RZogHCeSoL3T8kpMzcyxf3E+jeKUjILDSMoHUeCL/B1jXO37Eem7B69O9CkPPj43H7eDCB4deMvrvsz50Hu4+4GVK5r3vfwvTOiDnE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=h+Kv9ugX; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1712990682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edjx4KOtZo79KyUa3xCJ0nGWFUnOAaK8oUZd/7k6jA4=;
	b=h+Kv9ugX3GvZKUIbTEx8bVBDB+8Okx1GG19VKWGu3vcaqOHibm/NkV8ZRtSVdVXgHPiKMa
	LazIEggQ5THWV9yhIOro3mZ9kdSm+sbCdEJtF06uskKcyysNUBC+gSRrv+rQd9T04Yz8MG
	VfcL9hCC6UOXI+qiNA2uSP4GMExzESsUsp+n95ZBw8BntnzkUewjZj9gysB7WiNh86nIm2
	UepkxIQ2UfY4PEExOyTDWrRBd26bIZrbH2zkx2issxmYM8A6AkbygYIcGDcG5X4hgTSat/
	7MWbp1V06V7cVoY66Z2yHboon7yKWmwvqXy64dYeClEh1WH9Gjo470p9VxtanA==
Date: Sat, 13 Apr 2024 08:44:41 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Andi Shyti
 <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
In-Reply-To: <hgdhrf2jiovfxcppdtsq32sfbk4xuq7ewiwq4awwztj4mp3yez@kj6ixihkcxhe>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-33-wsa+renesas@sang-engineering.com>
 <4bcd397ec377a4932c34d62c85ef28ed@manjaro.org>
 <hgdhrf2jiovfxcppdtsq32sfbk4xuq7ewiwq4awwztj4mp3yez@kj6ixihkcxhe>
Message-ID: <af8ac48f10a1636ab2486aef91e01c3f@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2024-04-13 08:38, Wolfram Sang wrote:
>> Maybe it would be good to turn it into a debug message, instead of
>> simply removing it?  Maybe not all client drivers handle it correctly,
>> in which case having an easy way for debugging would be beneficial.
> 
> Hmm, but it still returns -ETIMEDOUT to distinguish cases?

Sure, but I think that having such an additional debug facility
can only help and save the people from adding temporary printk()s
while debugging.

