Return-Path: <linux-i2c+bounces-2877-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074A68A056B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 03:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6765DB24880
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 01:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA5E60BBE;
	Thu, 11 Apr 2024 01:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ub4GiJTm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8AA6FD0
	for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 01:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712798548; cv=none; b=nn92vQfBjaursZVd2NLAyVa56PMJdP3avQc4a79M2Jj8vDLUgOPfDf2IV0ap9Zzw0DWNASmydhG2vqUETJ8maPjHOKBNBiZtnGqazRHv4C0mc/cm08XHcJYHbR9tj4ZomzRdqEm1RXrnwtVfZCsTitFlCnZ6E8eEBBQW0gwPtI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712798548; c=relaxed/simple;
	bh=NA1dY9YqYvS6RQ9f9muW8F74ZNcOEVWftn8L2jOQC/s=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+p6sEQEsM4B2xQlSgLGDyKD7WQb28LhffplqvfUb/jk0YmLV7kV4YUEIeyCk0z1ta7+k4dTh5iOavvQYD1BinfllAwk02xyq00lka1vRhISC0awRvxeNwdNXiRxK7IZNU04tJP0vtry18LX4Y+7Zgup4hVZPZmYjid0W9u14Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ub4GiJTm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B58C433F1;
	Thu, 11 Apr 2024 01:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712798547;
	bh=NA1dY9YqYvS6RQ9f9muW8F74ZNcOEVWftn8L2jOQC/s=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ub4GiJTmgkn4Q/PEewql2fxB9zaM6vOIMpNeRR3nyqNydc/Jhqu3GqQjGDX71j3LZ
	 JSDgd6bkaBrtUBkwPTs1FY1+AinOq7PfN4OWcCLg2trh5pQs3UgCvNyNOwsdbQBC54
	 MnNwBs2NLcXQTkALbr3UiYVj7N/STeew982Ew3ckM5HAeQQ+Sg0Y3VOQDug5S6kcGH
	 KglP8oZjd7p9EuAj3TYMy7SiUxzaq7DsSK4wEugl0arUGit2E9OclUyWbDaXIHViDu
	 M3JZ5wkDC7xL0pGQclaklm8npP0rF4z6jPHAUM42rLp17IjH0luSgCDV5xJkDeRwJy
	 XuU/oIQwIGjBQ==
Date: Thu, 11 Apr 2024 03:22:23 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
Message-ID: <xybkdu7oujbasnunpkyrbjruakqm2ym64pigdm5yor44lqcbku@fib7b3vjshpq>
References: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
 <4dhfyaefnw2rtx5q7aaum6pfwha5o3vs65iqcrj2ghps34ubtw@b3bw3gggudjs>
 <b31f445a-6f9b-47ed-94eb-b80360846625@gmail.com>
 <ilxot5cgzlivhmxpuiifpnyx3jxymlxy2avnkqjgfzcgmmk3wd@glnv7nlydz56>
 <a4092c9c-372f-4020-9a47-72941b8690b1@gmail.com>
 <ixtm7tq4lpnaq64lesbgefphk2f7mmfnzarx7bgd4ydxl6ehma@ukzbhugjspvl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ixtm7tq4lpnaq64lesbgefphk2f7mmfnzarx7bgd4ydxl6ehma@ukzbhugjspvl>

Hi Wolfram,

On Mon, Apr 08, 2024 at 09:42:11AM +0200, Wolfram Sang wrote:
> > Another simple solution would be to move the implementation of
> > i2c_root_adapter() from i2c mux to i2c core. It just uses
> > i2c_parent_is_i2c_adapter() which is an inline function of
> > i2c core. What do you think?
> 
> I have no objections putting i2c_root_adapter() into the core. I think,
> however, that this patch makes the code a tad more readable. What is the
> downside of the symbol (despite we have way too many of those in
> general)?

That's the only reason: "having too many of those in general".

But i2c_root_adapter(), I believe should belong to the mux, even
though it makes life easier moving it to the core.

Heiner, I tested your patch and it works as expected. If no
objections or suggestions, I will push it tomorrow.

Andi

