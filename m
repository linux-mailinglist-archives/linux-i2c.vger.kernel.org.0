Return-Path: <linux-i2c+bounces-2931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 488AE8A3B99
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 10:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6429B21636
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Apr 2024 08:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FC6208B6;
	Sat, 13 Apr 2024 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="Bu6UDgW/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0ED944F;
	Sat, 13 Apr 2024 08:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712995955; cv=none; b=FTPNQRkTmDqk08fwJqgupu8+YTBBum/kae/t3RIZWHGgURAjjf20dxXqXarVtOYhPHyvfCEIkoVx9LdT04bUzgUdowgm18vVFs+CFlWqDo9xuyp6gKj0fB3yEpPuT+4UN3IVFumPHaz5c3FCaY/n2WKKz7t51ewEeG4cR6pT6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712995955; c=relaxed/simple;
	bh=3EHZjVd+aLZ3jM9IhMRLRR+KLD0vUVJPZD02Pv8QCTo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=kzm7X766PAnaRvPNgBLPH++RX9D2GHIOPOzbMtzTqp/2hcSDZBsb7aX9x1SXJql6JR6DLYAFcO7KhBg/7mrzPomp6QhVwlu15Tlnt81dLI5epTYHQJdhBtROCtuF1IMIHk+1wgupAchDc/WdBEEvCk/p4U4Lel6hXRSF7P8xH28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=Bu6UDgW/; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1712995951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ahlUb9+Un53eTerF9Lifl5XA3JlHB2YHwocz+Ot5irk=;
	b=Bu6UDgW/c68Krg6kKB8aSCIEMHl5gzJ3nYG44WRalu+s/vgsKw+FaOerxX9yYS5rif1TyL
	xREyQzbWxJIlkKALTCDHY9TJ7xwWrNp6cu4tVrZI9fqPdSXTaMIu5HuZ6W4Y5HbtdbRXdA
	q86i6NI3YLzEJ4x74NClyUK3FDXO/skz/n1nBLkndfh7T0UVeryUlavs7mLeGQpOBq3tBE
	91LRvUYqI3oQy2Od++Psrbym/vlHvlIirJqtuhJqNE+CtERrwU7REzF59SMvUbE6qUWFFW
	A9hcam1wyedhnJ+bqM0UM0+35xSi+tSHn6fYFsaDcMMRk+vDyzN35Peg0PrLlw==
Date: Sat, 13 Apr 2024 10:12:31 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
In-Reply-To: <8358604.T7Z3S40VBb@diego>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <hgdhrf2jiovfxcppdtsq32sfbk4xuq7ewiwq4awwztj4mp3yez@kj6ixihkcxhe>
 <af8ac48f10a1636ab2486aef91e01c3f@manjaro.org> <8358604.T7Z3S40VBb@diego>
Message-ID: <cfb8d27455b213a87af4b20f96225d9e@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Heiko,

On 2024-04-13 09:58, Heiko Stübner wrote:
> Am Samstag, 13. April 2024, 08:44:41 CEST schrieb Dragan Simic:
>> On 2024-04-13 08:38, Wolfram Sang wrote:
>> >> Maybe it would be good to turn it into a debug message, instead of
>> >> simply removing it?  Maybe not all client drivers handle it correctly,
>> >> in which case having an easy way for debugging would be beneficial.
>> >
>> > Hmm, but it still returns -ETIMEDOUT to distinguish cases?
>> 
>> Sure, but I think that having such an additional debug facility
>> can only help and save the people from adding temporary printk()s
>> while debugging.
> 
> Also we're talking about two lines of code, I wouldn't call that bloat 
> ;-)
> I was thinking about dev_dbg vs. removal too, but hadn't a clear
> favorite.
> 
> So essentially Dragan is tipping the scale and I guess dev_dbg might be
> the nicer way to go.

Yes, the code for printing the message is already there and it's only
a couple of lines, so it might be a good idea to recycle it. :)

