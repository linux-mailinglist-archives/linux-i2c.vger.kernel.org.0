Return-Path: <linux-i2c+bounces-2208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD588735E1
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 12:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D14851C21D55
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 11:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66AE5F566;
	Wed,  6 Mar 2024 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ll4Rbz8e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867427F7E9
	for <linux-i2c@vger.kernel.org>; Wed,  6 Mar 2024 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709725828; cv=none; b=H9QcdQq98pE6zHouW88EzjSDiIXmALwudzdOndWXzpm2G8KIX/KswJt4TQFVj/4BUvB28DBYXX2RT84pQQPI1KiycDYCNqKxhNjVBdK1zATyf/lb9/6S3AMjV2OG4Kl/oM26pzUhWulAyoZlKALbJIF1XFhy4E9J68B96VN/Ucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709725828; c=relaxed/simple;
	bh=PCMRrmtS6Jnoi3W/ErngkaROfBNoRPQOEkQT7Cx6h4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hA5uhsyChkaPtyN7v5BqXEbr4JGIlapjVeTA9LtbeWGBA3lsFcpOeHA8oSbIq43vkQR4E0+nYp8XdUblJ2+BmBLoe2ecVpdrE1sl9OBRGrYEZPZpVkzCnV7qUwfvJYK34pHlmYAZNikIoc8mOQk9yEWEpKI1ojc0dDOnwIE4Rcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ll4Rbz8e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73468C433F1;
	Wed,  6 Mar 2024 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709725828;
	bh=PCMRrmtS6Jnoi3W/ErngkaROfBNoRPQOEkQT7Cx6h4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ll4Rbz8eA69U9uRQ1GgAuuW8qtdnkNUcntAHSY8gMpjhBc+xHnEgVxoHAC7YrE9zV
	 nzHR2zzUw2eN5KwMirKNHHQTBCrVnLrxrZpBUiKxXOBIqAtPkPinZP4+n9dir4Qj/p
	 fIvlw2yedFw5w4eROYu0RS4Hj20XWn4tappl3XqTKB8FoxzmVTG/Ye6MO/l64PCwrL
	 kah6KUv3LQjcYEOU47mBVBKs+W3ckEGrMF6p6GMDYebqy/IsBUzT7IOmiljHZN05kp
	 8gsLMwOY4n7qhukYOXTtQzPQVcKLG2iJp6evzYxZ/JwPz+YsqzG+UOiSUe306L5Mi6
	 mCjvjcllxepqw==
Date: Wed, 6 Mar 2024 12:50:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	cobechen@zhaoxin.com, hanshu@zhaoxin.com
Subject: Re: [SPAM] Re: [PATCH v8 6/6] i2c: add zhaoxin i2c controller driver
Message-ID: <y47653e7g2nbwhpavbxpt27yuzpbbhfizjmp6q4tsxzuf2e6ct@onbajqix7hda>
References: <cover.1709014237.git.hanshu-oc@zhaoxin.com>
 <4e9c2c3a3940a00da67564c6e19f4771ab6dc67f.1709014237.git.hanshu-oc@zhaoxin.com>
 <ZeWZHSt-qm5wH3wn@ninjato>
 <7jopk32t6ygaxgo27ln2bsqhgsces5d2hxxri6g3la6datrlxd@llfdg36ldr4b>
 <c0eb2886-6250-4f67-8b17-c6ba953a42d3@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0eb2886-6250-4f67-8b17-c6ba953a42d3@zhaoxin.com>

Hi Hans,

> > > > +           /*
> > > > +            * if BIOS setting value far from golden value,
> > > > +            * use golden value and warn user
> > > > +            */
> > > > +           dev_warn(i2c->dev, "speed:%d, fstp:0x%x, golden:0x%x\n",
> > > > +                           params[0], fstp, params[2]);
> > > Well, if you want to warn the user, the string should be more
> > > descriptive. Maybe "FW settings might cause wrong timings" or whatever
> > > these values mean. I don't know.
> > > 
> > > The issues I mentioned could be resolved incrementally from my point of
> > > view. Or with a new series. I don't mind. So, in general:
> > Same goes for few minor checkpatch warnings.
> > 
> > I will accept incremental patches to fix them... they are mainly
> > allignment issues.
> > 
> 
> OK, the issues you mentioned will be fixed with a new series.

Thanks! Looking forward to receiving your new patches.

> For the current series patch, do I need to push it to the latest
> for-next branch? Or will you push it?

I believe you can't push it :-)

I am taking care of it!

Andi

