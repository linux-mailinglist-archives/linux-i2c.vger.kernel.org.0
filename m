Return-Path: <linux-i2c+bounces-2929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CB18A3B86
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 09:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2BCE283AD7
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 07:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41DA1D545;
	Sat, 13 Apr 2024 07:58:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FEA1CF9C;
	Sat, 13 Apr 2024 07:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712995104; cv=none; b=KUIPxCNui+Ht6UGTtjAJjlTXc9T/lPK3R5W6IJ+2woI9JtmZcAJ/S1THEy3S6wZ7790FQ/yJnlUIXSNQ6E8tHasvxEIChrnJ59+nxG69xrEbXnpYDJI9PMbcfXtfrlIf39NTTWJUEwoFQrFmTooGGLyXw85jxwCUl+rEHnUKsxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712995104; c=relaxed/simple;
	bh=rpL+lRsCc+aSI0WLSyBqKU1GVKz1bsXEqGBEH/UyoFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OB4qSgX8sFa4sg6UpyHM7omrJxBTqcoq0vYhZVLr0tZRyyjJVoPsLGwhkm9H5aP+DObqg7vGnYsEBqi2QdEPfUY2Gwg+A1bAu7VOt9IYLlz//yPI3MbGQPRmIxt5NMKn17gGgWMrXHG9u7QqaC2dLoBjyOXQ5IR+/5Ii9gEyFFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e8616c3.versanet.de ([94.134.22.195] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rvYGx-0001CH-RG; Sat, 13 Apr 2024 09:58:03 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>, Dragan Simic <dsimic@manjaro.org>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
Date: Sat, 13 Apr 2024 09:58:02 +0200
Message-ID: <8358604.T7Z3S40VBb@diego>
In-Reply-To: <af8ac48f10a1636ab2486aef91e01c3f@manjaro.org>
References:
 <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <hgdhrf2jiovfxcppdtsq32sfbk4xuq7ewiwq4awwztj4mp3yez@kj6ixihkcxhe>
 <af8ac48f10a1636ab2486aef91e01c3f@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag, 13. April 2024, 08:44:41 CEST schrieb Dragan Simic:
> On 2024-04-13 08:38, Wolfram Sang wrote:
> >> Maybe it would be good to turn it into a debug message, instead of
> >> simply removing it?  Maybe not all client drivers handle it correctly,
> >> in which case having an easy way for debugging would be beneficial.
> > 
> > Hmm, but it still returns -ETIMEDOUT to distinguish cases?
> 
> Sure, but I think that having such an additional debug facility
> can only help and save the people from adding temporary printk()s
> while debugging.

Also we're talking about two lines of code, I wouldn't call that bloat ;-)
I was thinking about dev_dbg vs. removal too, but hadn't a clear
favorite.

So essentially Dragan is tipping the scale and I guess dev_dbg might be
the nicer way to go.


Heiko



