Return-Path: <linux-i2c+bounces-2981-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB028A743F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 21:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B08F91F21FBD
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 19:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877B1137C20;
	Tue, 16 Apr 2024 19:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5l/mDaJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42947137916;
	Tue, 16 Apr 2024 19:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713294179; cv=none; b=qOxX8WPxhcwIt09HD/gLt/2xyQBuZeNtrFgd4mZxv8Qvv9RvYAnJWwRvDGLmZHe19t+EDQ4OaD/uKcJvxZcyXKFpToIzD6L+rXF1YpHeGT97rhEK5F8Nmw7FQkOJuls90y55nOhBmOyBk6HcGLYOkfmfkP1+c6OGSHxnDtXD/gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713294179; c=relaxed/simple;
	bh=ymLn4ViqJi6azNlarzfVSe+0BD6thD1UTD9JMNYrPbA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoQIBKOGBdXznYRPa3gzFlQ/2f1ubUeKCnHpd/ZRrDckjGZoOMcvvG88hXE8bdOOmEWzz4Un8F5o1i6k+Pg3pLXk+/4DGvfpTfmDlGxQiwX2DyJ5WOrg57DbMCoRkdDG2UY8s7axLED8eSGxpePpIet8VwiWKvTz5NuNok2AFw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5l/mDaJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B4D6C32781;
	Tue, 16 Apr 2024 19:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713294178;
	bh=ymLn4ViqJi6azNlarzfVSe+0BD6thD1UTD9JMNYrPbA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=b5l/mDaJZMTRccDQU4oHPPsiNUGhNVjwt5i3LJfiFvJ1YIe4JWS7ccHxJbPQhP+rD
	 J/79Uqz96QG3JYUoyAjJZvKdAIF0seIEzlK3r6+96vq5miomFqbEdksH/nd1/CpvOJ
	 bDgSRndgM/MYoFTFba31wgTREhjmD7o4jIGezKSjI0jy+vBIz2dyDnTeQfqEnV5L78
	 Emztim/IwxeIc6VF0RCvge7DcLl83r7wC32fogZHYf1kQ3ut6pFZXEDTgbDFLdiOR8
	 JtjXsJAPJFlP67O/F7i0R2IofsZmbOuiCRiJRfybCPCu4TZE5MVxrCrZshifvqXqiP
	 ePxtnDOoJQDdA==
Date: Tue, 16 Apr 2024 21:02:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
Message-ID: <kxlb62ejtnaacgvlkdnyxtap23oesagq7p52z7kqhhydqdjhbt@gpvwnr4rb67a>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <hgdhrf2jiovfxcppdtsq32sfbk4xuq7ewiwq4awwztj4mp3yez@kj6ixihkcxhe>
 <af8ac48f10a1636ab2486aef91e01c3f@manjaro.org>
 <8358604.T7Z3S40VBb@diego>
 <dnh4yiajjqcxcq7xjvj35quda7yrf7tubp2l2ktsaf4zgzai4n@xdefxkk76yyg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dnh4yiajjqcxcq7xjvj35quda7yrf7tubp2l2ktsaf4zgzai4n@xdefxkk76yyg>

Hi,

On Sat, Apr 13, 2024 at 04:35:06PM +0200, Wolfram Sang wrote:
> > Also we're talking about two lines of code, I wouldn't call that bloat ;-)
> 
> With this patch, yes. But once you allow debug code, it is hard to draw
> a line which debug is still okay and which is too fine-grained. And then
> you end up with a lot. Over the years, I developed the tendency to try
> to have less but meaningful error printouts. But I don't enforce it
> strictly because it is too much bike-shedding discussion.
> 
> In case of this error printout here, it is just wrong. But, see, it also
> came from this tendency I don't like to have printouts for every error.

I agree with Wolfram here. Debug messages are OK if they are
providing real useful information to a final product.

Besides, as I explained earlier, the patter:

	dev_dbg("timed out")
	return -ETIMEDOUT;

(print a debug but return error) doesn't make much sense.

But, I this is all personal preference. So that I can also leave
it to the specific maintainer.

From my side all patches in this series are r-b'ed, except for
patch 6 where there are 3 dev_dbg in a row stating the same
thing.

Thanks Dragan and Heiko for your feedback.

Andi

