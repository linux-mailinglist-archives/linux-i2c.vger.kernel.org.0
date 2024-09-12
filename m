Return-Path: <linux-i2c+bounces-6628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA2D976EFA
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76F80283796
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 16:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC44D1B4C21;
	Thu, 12 Sep 2024 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfyJ8iDZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772F61B013F;
	Thu, 12 Sep 2024 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726159405; cv=none; b=AedsZ+zWgfgFvFSa0R7m99cf4Y8ZGV/jgJmxDWvhs/A8MHNMOU/UFP94Y8Vnt4VLBI30AqiHFL0jBjM0SLkdWSEV9nw2zzYeNquohOr6iLGgYTYEPg0CGTMtrpGfdNv9fTwGLc4pJcpN4RtXvygnDbjGvUasxYi9FXDjz8+uZHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726159405; c=relaxed/simple;
	bh=KTfFdZ5myqFwUnnKGa4dqMjtIo26ifA2dIeC+F+UCT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGY8NwJ88UK3xe1QqCVPk+OdcmH4iOfierKrqVcTDqkNbq55BnijC1ZQb47GSDjzC/bG7XrKY58/rXdUbYGNarVe81Tf6aIcAsYuGTJVUrb9dPLygn/gM54ZhvE5vwJwpkg3EOLsGt6l6WGw3X3w7OP/xLUx2djiWHPtzqQgNts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfyJ8iDZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D952C4CEC3;
	Thu, 12 Sep 2024 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726159405;
	bh=KTfFdZ5myqFwUnnKGa4dqMjtIo26ifA2dIeC+F+UCT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfyJ8iDZb1DVsxwPn9QJHOaF3PGr9QDT474/usFG5qhAMw8BDkuGcPLzasZpLM6Vk
	 2L6SMcbRfUJDw9Sqv/0KUHuptuiLCLsHom4e0hNv3IkqqrNcOBne95U8r47t0Y58rW
	 p92QmnP/AB4WaevkSOinahoZmRuhvktYe1rc5bSYV9AQSfNWZyJmH/zJOqRVySrdv4
	 buWbtKGEKRWPz7q/GB1WTczyQ2nB1oYbqJAqP9IYDm0EyTHzTvH4I0lKZjcU0pOCp5
	 H+YN/+joj0U0dqepEUQj9EoiLMcTyM1K/YaoiJnCxkM5cfaYrWMDe0hAGWuMvr5N4R
	 2/yRt9p8gFCqg==
Date: Thu, 12 Sep 2024 18:43:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v1 08/12] i2c: isch: Use read_poll_timeout()
Message-ID: <45bkfzv7peff2gfdf4h2ot6z4fv3uxcmiljsnlhyy5ltzhehca@bsa5ojshvlcb>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
 <20240911154820.2846187-9-andriy.shevchenko@linux.intel.com>
 <pwvhzkxeniutopyxczvimkau3elchfy5x32cimlqwjnmqjzv42@zpojd2lxs3o4>
 <ZuMKUnY58Blm7UX-@surfacebook.localdomain>
 <zuijrzur6htcg4dhccfydl4gb4rj62jq5co4ege6fkggaceesg@3kkujnlrgbye>
 <CAHp75VeC1Gw8PvJCRGxKKzHGJCaSvsh3JbPnPhDCNsLDF5OaFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeC1Gw8PvJCRGxKKzHGJCaSvsh3JbPnPhDCNsLDF5OaFw@mail.gmail.com>

On Thu, Sep 12, 2024 at 07:06:19PM GMT, Andy Shevchenko wrote:
> On Thu, Sep 12, 2024 at 6:55 PM Andi Shyti <andi.shyti@kernel.org> wrote:
> > On Thu, Sep 12, 2024 at 06:35:46PM GMT, Andy Shevchenko wrote:
> > > Thu, Sep 12, 2024 at 09:29:38AM +0200, Andi Shyti kirjoitti:
> 
> ...
> 
> > > > > -         sch_io_wr8(priv, SMBHSTSTS, temp);
> > > > > +         sch_io_wr8(priv, SMBHSTSTS, temp & 0x0f);
> > > >
> > > > there is still a dev_dbg() using temp. To be on the safe side, do
> > > > we want to do a "temp &= 0x0f" after the read_poll_timeout?
> > >
> > > Isn't it even better that we have more information in the debug output?
> >
> > I think not, because:
> >
> >  1. It's information that we don't need, and we intentionally
> >     discard in every check. If we print a value we ignore, we
> >     risk providing incorrect information.
> >
> >  2. It’s more future-proof. In future development, cleanups,
> >     refactorings, or copy-paste, temp can be used as is
> >     without needing to continuously & it with 0xf. This
> >     avoids unnecessary operations being repeated later on.
> >
> >  3. It maintains the original design.
> 
> Okay, but where do you see this debug message? I looked again into the
> code and do not see that _this_ value of temp is used in the
> messaging. What did I miss?

Indeed nowhere :-)
'temp' is re-read right after and &-ed with 0x0f.
Nevermind!

Andi

