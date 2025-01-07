Return-Path: <linux-i2c+bounces-8951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F15EA049BF
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 19:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1039166377
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 18:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117721F3D20;
	Tue,  7 Jan 2025 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaKlMbgq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFA0132111;
	Tue,  7 Jan 2025 18:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736276280; cv=none; b=Iz8wuYy2nsrVWc0Ap3Yq7nh2OWl86fADywvy/ruGwjriPygR9KPsLn9Q/3fwoWgn3XMac2b5+2pqjNnkUc24UtMtrrlGm/+FVhtvOD52Eeh5thZWl3pHqDwpPPP5UjAHIdLIq3L4kGot5q9CR4AANmt6uBHfy8Nk04hN8GM86OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736276280; c=relaxed/simple;
	bh=zPp9HHeTH6KSlechtgw+R0o80T8Rtm5Si1tkClQ9obk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBg3CEkPA6oTNikaO/pBxj70ezZfU+cVKFd3h2Ouif3zUDQsOoSwEJChQ4EQWREaF4RfYhQ29A7RGeNh97uctyn61MxxZrg/ItQzvbnU1kRGaDFNx9l4OoCzGzCGIHOxssbAxy4/0u58uit9U+alKxftLwajH9Lar0OAO8NaRs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaKlMbgq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D96C4CED6;
	Tue,  7 Jan 2025 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736276280;
	bh=zPp9HHeTH6KSlechtgw+R0o80T8Rtm5Si1tkClQ9obk=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=WaKlMbgq7io57wjO/CJwV1FmyckP1MHWAknxW+sPF1Y6FeqR5jmevV8XSSH8+LtGr
	 QXO4YL7Rh+DEQd/7akBAgYzdW4gFPLPJuQ7wd2/zv+1zYvQBXFwkAwXu32gGePW8Ve
	 +HGIxmTWnII8RboM/5h1rqcEzl8HO8ZTWyhTr6iPDEkrn6gsfYZLVVQSGzoSGe3oUK
	 tekD100PrFLkioB4nQeqE5JAVD10H8F4OZ4RyqAcqYGu9kwW+IF/7kiYBYU345tk7t
	 +1gbKgydj6+BnIPJYH05aI/eWg59aCFFY3IJj0fwblQ2Q5Re78accnEJqUkan7f379
	 rgQAISIeqE89g==
Date: Tue, 7 Jan 2025 19:57:55 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Atharva Tiwari <evepolonium@gmail.com>, kernel test robot <lkp@intel.com>, 
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <ovddzx2zitp6lqjdasinn2zaaefp35y4mspol3v3x5rk3tddgo@kgcwexuai2ir>
References: <20250101103422.30523-1-evepolonium@gmail.com>
 <qj3ymbntblc26wnezki2pn2g26z5poc5njhsfbxzam3mpjy52p@px44dxiqhedt>
 <Z3hyr3ZVf4rBuV-N@shikoro>
 <eqjgc5a4fiz6csqmehyo66yduorxt3d3vnr62d5ijxy3wooheo@qabiaft2nri3>
 <Z3kOW11SxEVwqcw-@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3kOW11SxEVwqcw-@ninjato>

On Sat, Jan 04, 2025 at 11:32:59AM +0100, Wolfram Sang wrote:
> > Yeah! That was my first thought, but because this was reported
> > by LKP (which I respect more than other code analyzers) as a
> > potential issue, I was on the 50-50.
> 
> A potential issue on outdated hardware (or better: non-existing versions
> of outdated harware) which has not showed up since the git era is not
> really a for-current bugfix in my book. That being said, it does not
> harm in for-current.

Honestly, I'm not entirely happy with this patch. It seems to add
unnecessary churn without addressing an actual need. Since we're
operating in the same endianness domain, I don't think there is
requirement for an endianness conversion here.

On one hand, I want to give credit to Atharva for his effort; on
the other hand, I think the real solution would be to just remove
the comments altogether.

I'm going to hold off for now and wait for additional feedback.
If no further comments come in, I'll likely drop this patch.

Andi

