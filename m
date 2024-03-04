Return-Path: <linux-i2c+bounces-2186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 262AE8710D1
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Mar 2024 00:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1BD02877EF
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 23:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85477C098;
	Mon,  4 Mar 2024 23:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6gWD9zI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DF57B3FA
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 23:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709593269; cv=none; b=szVJeaNRdySehtthabKwSngzQL7yh4RRVmWbEWFGFfX6UGYarAk7i8RIe59Mn0G6ixzRCugsYQkaRn7wN53RWvKYReHl79Xq+Z/2fj2yjSc9UgB2otnL7d3FcXqphs9iwfxxpQMgXfW23pbrRtDUsbFuZPinj5pq7rGwTfc1aqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709593269; c=relaxed/simple;
	bh=vK5aifHw1PXPNy31SJyhDdUlt69oddYpVxikBcjgeC4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N85uKw2lissho7jwdp4+NAT2d4lbaIXTuICUilPAIIAt6RScqordEX9cAHNRxjsI/1dSpmrAOkAu3sdaVSB3CUj2ziHRMdRlg0r+AG8L+DCVYwZWne68vxLhe/2/qXDTl9vodYgs12YpdS0LnpU46fGsrITi+01vrPeKY/XH4fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6gWD9zI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79AFC433F1;
	Mon,  4 Mar 2024 23:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709593269;
	bh=vK5aifHw1PXPNy31SJyhDdUlt69oddYpVxikBcjgeC4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=a6gWD9zI1OQd5/1q8yfFJd4dswHGUS8MFL7hL1wjoWHcsNdkAlNh/5O890/aexB27
	 hXGdHiVfGZmjmxbhuvgyzvkStnObh9XpjFIUXCLI5wt6tghMbWIN+fXW9xsSkHdRRL
	 Ngq4JtyJAm0XrGnpTso4OkQaixwgZGvIRC5pNGhMe3nw3BSYg6AbgmQMXIkI48s0W+
	 95g3RNoFfFtp+nZAdT0LqywEox0Iy/ksrLGFF+plBjh7BhDnL7wMmqtQuAys5KVEJw
	 8NZG6LTRBA+sEb8KSqe/pLATTszFMbzIBOmDqsQYh/8Ieg1qqLvQWj4wr7E0o6J2DY
	 Mrd2As0iMs3dQ==
Date: Tue, 5 Mar 2024 00:01:05 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Hans Hu <hanshu-oc@zhaoxin.com>, 
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com, hanshu@zhaoxin.com
Subject: Re: [SPAM] Re: [PATCH v8 6/6] i2c: add zhaoxin i2c controller driver
Message-ID: <7jopk32t6ygaxgo27ln2bsqhgsces5d2hxxri6g3la6datrlxd@llfdg36ldr4b>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <4e9c2c3a3940a00da67564c6e19f4771ab6dc67f.1709014237.git.hanshu-oc@zhaoxin.com>
 <ZeWZHSt-qm5wH3wn@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeWZHSt-qm5wH3wn@ninjato>

Hi Hans,

...

> > +		/*
> > +		 * if BIOS setting value far from golden value,
> > +		 * use golden value and warn user
> > +		 */
> > +		dev_warn(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
> > +				params[0], fstp, params[2]);
> 
> Well, if you want to warn the user, the string should be more
> descriptive. Maybe "FW settings might cause wrong timings" or whatever
> these values mean. I don't know.
> 
> The issues I mentioned could be resolved incrementally from my point of
> view. Or with a new series. I don't mind. So, in general:

Same goes for few minor checkpatch warnings.

I will accept incremental patches to fix them... they are mainly
allignment issues.

Thanks,
Andi

