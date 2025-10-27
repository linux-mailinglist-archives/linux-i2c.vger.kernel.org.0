Return-Path: <linux-i2c+bounces-13834-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AAAC0F52D
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 17:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D108425650
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 16:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016ED30E820;
	Mon, 27 Oct 2025 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DB8oq497"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01730ACF4;
	Mon, 27 Oct 2025 16:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761582529; cv=none; b=eJ45mmivlMuSQmRfTB/ExKWOLzzujl/Wb93ZiZMNjP2t8iDFHNGZ+K1ghRFgfwGl2cebv1SK8hmYyC9wcu+0TkbHfv0PkrhX9cOilYZPJGu21rouaZh0rDyDH5SgUyVjGUeIlFpqHzsLPUmZO7LmCJJuyOAPH9c2tygeaYAZ/nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761582529; c=relaxed/simple;
	bh=K3sPGBBKqtRTD0tT/nQEB5JeUJR4KU4m1T94OlqJ8Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndghmigEkWnPEIq4SKngg9EhUUget75EHbxhWcObRrS38u5NEYGdWqYA7p2Xazc9/47dhbyFmeaPalnkCrgll9YL3jxowLeAnEFvyf/4hBi+HY9Hv+YxO8RlqnW5kwvww5Z+y98Gxvw0/eoajx5gRgsUvbZV6buR/MFrc39Lkck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DB8oq497; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFF1C4CEF1;
	Mon, 27 Oct 2025 16:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761582527;
	bh=K3sPGBBKqtRTD0tT/nQEB5JeUJR4KU4m1T94OlqJ8Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DB8oq497j3C+s/tckbNNLiaAC38F3nm60fF+QYhLP9eIzSD8hH4nTVqJjsgaMh7hj
	 GPEnRdmscIWI7d804qnXPMQoXUCBsmF3WUSQWyoj7Ab34EBe+EHOneBSboVRwdBa5s
	 fM+vPYJmtvXg+UVYh/Ys+O5hcASf6yCr8n3GrnpS+cugwup47ol7XpjJjLbhtL9XeD
	 1827RGgBy9fW9r4926FtFpwljgVeD8ONmqyV8fqg9S2qkRkHGdHFFNDIOYGa2YSiDa
	 erJEn4e7qmag45LtE6Br0fqANNhmaFq2qMHN8dCjWoPhWTodxn8gtZV8QmFWsah3Mj
	 ikxpogqDj7XgQ==
Date: Mon, 27 Oct 2025 17:28:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v9 1/3] i2c: pcf8584: Move 'ret' variable inside for
 loop, goto out if ret < 0.
Message-ID: <okcyigt326pn7b4vjo5jir37ppyb6zhb3z7e4irkyykjpjqjot@adqmu3hr4gf2>
References: <20251023120043.8661-1-chiru.cezar.89@gmail.com>
 <20251023120043.8661-2-chiru.cezar.89@gmail.com>
 <dnjved3kd3awdseclr56mbwxkbuysxcezzbebrk7fjpuq2kf2p@rhat4xhdao52>
 <CANvS2vX2+ZRA_sT8gzmLmw9r7Z1aPEn9d+c=0QigPpeUYb3=sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANvS2vX2+ZRA_sT8gzmLmw9r7Z1aPEn9d+c=0QigPpeUYb3=sQ@mail.gmail.com>

Hi Cezar,

On Fri, Oct 24, 2025 at 04:55:28PM +0300, Cezar Chiru wrote:
> > > Require spaces around '=' and '<'. Add spaces around binary operators.
> > > Enforce error fixing based on checkpatch.pl output on file.
> > > Move 'ret' variable inside for loop. Then check if (ret < 0) goto out. This
> > > improves usage of ret variable.
> > >
> > > Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
> > > Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> > > Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> > you don't really need to resend patches for updating the tag
> > list. Anyway, that's OK, better to send than not to send, when in
> > doubt, ask.
> 
> Anyways I had to resend as I grouped 3 patches into 1 patch series
> 
> > For this patch I think neither me or Andy have been suggesting
> > the change. The change came from you, we made observation which
> > you applied, this is the normal review process.
> 
> Can you please let me know the process of tagging with Suggested-by
> without resending the patch. I don't know how people add reviewed-by
> or ACK-ed-by or Suggested-by other than resend the patch?
> I've seen it but have yet to figure how to do it.

with Reviewed-by I understand that you have carefully reviewed
the code line by line, agree with everything written, and do not
see any issues or major improvements to be made.

With Acked-by I understand that you have read the change and
agree with it, but you may not have gone into the fine details.
You are simply OK with the patch being applied.

With Suggested-by I understand that someone has proposed the
entire idea behind the patch, not just smaller improvements or
changes made during review. For example, if I tell you that 'ret'
does not need to be initialised and can be moved inside the for
loop, that comes from review. However, if I suggest sending a new
patch changing the function type, that would justify a
Suggested-by tag.

Then there are other tags, such as Reported-by when someone
reports an issue, and many more that you will learn if you stay
in the community (and I hope you will).

Everything is more or less documented in
Documentation/process/submitting-patches.rst, and when in doubt,
asking is always the right thing to do.

Again, thank you for your patches,
Andi

