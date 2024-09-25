Return-Path: <linux-i2c+bounces-6996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E3D986781
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 22:19:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7112B21FCE
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 20:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94595146A79;
	Wed, 25 Sep 2024 20:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TK3JSYw7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C9628E8;
	Wed, 25 Sep 2024 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727295551; cv=none; b=Q/N+exQLhLdSNQEfgofghMOm9YlkBFQKlUEKSC11SzS7qQboB4lROQfie9FfId76pMU66IYhyFUT4gNqHzhJO8oyuF3SFbIw8W2KZZ3cPUpjLGbiMH9JkKvvKb1d0Lg0n9ytPWuoh7yChi3aoQrYECaS0i3iTZby7486YBQeWS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727295551; c=relaxed/simple;
	bh=vAWMx9G13EynX00wpjAYAtIgxqGNrZ8HS8AmNSNLzmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZj8TkA7t4ZfZ6KNCAP+hKsIW5mn7inTYSCsYNspkh6aiaPnxK+53Xax3scm1GL5FlsN49LSQYAK/ZXeebonZ+mPZvHVx2a2d/WafJ0eecconObJknadT5gE1VMeoiHkQ2gh1eYRRoOlE5/l0hzqNT+zXCNgqBJOz3CA/miL7fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TK3JSYw7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE080C4CEC3;
	Wed, 25 Sep 2024 20:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727295550;
	bh=vAWMx9G13EynX00wpjAYAtIgxqGNrZ8HS8AmNSNLzmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TK3JSYw7OksLYc64eM2dFrj77UAE82vPI0wTltj2nMZZtgh39bGoooZmRMfcmZeIH
	 0uxWhFlApIimXYuYNT4GUkJeJ9pH6yqnwlQif4YPazukSweFaSjBteuU24g0w2b3i4
	 paJycJC9fjNF43l9Rr9VMkfOKEoVZftXF5OeYZnrxehjkH1Vk97NusWYzoEZC0qA7Q
	 Bw0dZxUN5HMr1gp6GWSe9vt0ir40YKRt6u41GJ3pE+Y1keIxTW6bwOW+GNjokh/T+i
	 70PAUoJkTE/NbB3i41WJbau+zE6YquJS9YKYj8iq/x6cV4vhDWpT0vvOEFPlG1S6Vo
	 iwUwt6tTSbVqQ==
Date: Wed, 25 Sep 2024 22:19:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: warp5tw@gmail.com
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] i2c: npcm: correct the read/write operation
 procedure
Message-ID: <rpu2o2vw6jqbuywabaxaqepathkqlzjzjvn7j6h5lq6zslitu4@icj5hpmwo6kr>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-2-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-2-kfting@nuvoton.com>

Hi Tyrone,

On Fri, Sep 20, 2024 at 06:18:15PM GMT, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> From: Tyrone Ting <kfting@nuvoton.com>

no worries, I can take care of this.

> Originally the driver uses the XMIT bit in SMBnST register to decide
> the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
> write operation. If it's 0, then a read operation will be executed.
> 
> In slave mode the XMIT bit can simply be used directly to set the state.
> XMIT bit can be used as an indication to the current state of the state
> machine during slave operation. (meaning XMIT = 1 during writing and
> XMIT = 0 during reading).
> 
> In master operation XMIT is valid only if there are no bus errors.
> For example: in a multi master where the same module is switching from
> master to slave at runtime, and there are collisions, the XMIT bit
> cannot be trusted.
> 
> However the maser already "knows" what the bus state is, so this bit
> is not needed and the driver can just track what it is currently doing.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Tali Perry <tali.perry1@gmail.com>

This patch is independent from the rest of the series, can I
start takin this in and unburden you from this?

Andi

