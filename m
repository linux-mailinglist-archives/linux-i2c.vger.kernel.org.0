Return-Path: <linux-i2c+bounces-11273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6C1AD0BFD
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jun 2025 10:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1126188C9A3
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Jun 2025 08:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970A620A5EC;
	Sat,  7 Jun 2025 08:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CHHe2qUZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BAD208961;
	Sat,  7 Jun 2025 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749284349; cv=none; b=j73Zw75/J6Ad3R54xbLZ67me/ZN3KVNihmYU3Zg0b1vRzMYGYgvja9P0/26Bmy98ZLCC/NiF5IDGOcqbGFP7CZg4In8s/JIdugv5+4pSKLx8IXGmLKKK9aWXn+Z+fAGBwA0Eswj9eyzE7kRq3X9nVxniDzDjq8MXeXhu/Sn6ZYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749284349; c=relaxed/simple;
	bh=lppgpdv9VRE+d57S10l9i1OgPYXzcAIz9rJ/OjsVEr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QhGy763JEgcOnp3BxsN4s4mqFnn1GeNQ5htjuJmMvAG1hHm4A7d4fa6hAyx/hHEd8MqtffbuDGEZgYMO8WQ86vyQGOziS0r+7yDL/anBc2rrEwuAcNsr5j5k5K6ealzeO6Z4Ke/uxG1+N2ySrMRFcWaFSU7sqDheo0B2Wtuli28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CHHe2qUZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792BAC4CEE4;
	Sat,  7 Jun 2025 08:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749284348;
	bh=lppgpdv9VRE+d57S10l9i1OgPYXzcAIz9rJ/OjsVEr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHHe2qUZPoPxIe8Y1n5v87cTuROx8i+39tkiREzxtGZiGs38gMquYUbwF6YGJP1ya
	 99o3dBLEHyFT0AOXPqXi3nhJIBVl2bw2ocz0+8en9ufYTlaePDdKlU+llmWCICX/1p
	 VT/ayHB58KCE1rkGZuO5qmxNUhXTncZOIe2NimUM=
Date: Sat, 7 Jun 2025 10:19:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Matt Corallo <yalbrymrb@mattcorallo.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-hwmon@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>,
	security@kernel.org
Subject: Re: PMBus memory overflow
Message-ID: <2025060749-attendant-trout-d2c8@gregkh>
References: <eb5796e8-de76-4e91-9192-65b9af7a4d49@roeck-us.net>
 <284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net>
 <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
 <00baca6f-8046-46ae-a68c-525472562be7@roeck-us.net>
 <aAtEydwUfVcE0XeA@shikoro>
 <3a9ab7bf-6761-4a14-983e-e6bb288ce58a@mattcorallo.com>
 <e0e789b3-24c2-4ea3-9c79-fa815d801d83@roeck-us.net>
 <bc9a14b5-8b10-436f-a791-28df245465e6@mattcorallo.com>
 <4e198aa1-527b-4ad8-abc5-e7408296bfbd@roeck-us.net>
 <03da7997-74f4-4435-a6c5-6aa5aea2f6d7@mattcorallo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03da7997-74f4-4435-a6c5-6aa5aea2f6d7@mattcorallo.com>

On Fri, Jun 06, 2025 at 04:57:37PM -0400, Matt Corallo wrote:
> Adding security@kernel.org cause probably they should make sure this gets fixed.

That's not how security@k.o works, sorry.  As this is already public, no
need for security@k.o to get involved at all, the normal development
process happens here now.

So, submit a patch and people will be glad to review it!

thanks,

greg k-h

