Return-Path: <linux-i2c+bounces-11066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E333ABD396
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 11:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43AF14A0630
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 09:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB03259C92;
	Tue, 20 May 2025 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZBsWk5f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA80647
	for <linux-i2c@vger.kernel.org>; Tue, 20 May 2025 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747733977; cv=none; b=FIgnigFDqAN2ht7Bvp3DNbN8+CWmkd6DlL0UZSI/dWlYQP9/TvzMjczE/0A+wkdSqFnUdnjsQhm8uqlbPqIFrzrGZqKCdDtG/elyNO90rBvA1tOR5/gyoz76JtRPtfzFRcIBWdlXTZlCFUy7OBBhd9BBagqUgI504azBWP5ly2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747733977; c=relaxed/simple;
	bh=dqwrQrWhJgRqFu/+w+3lHgg6iHrbHydwVyKCn+xleEo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4Ajj2vrcei7JBtQAdrNZX9p6xDWht3QMXgEtEyb/aNfWlmajtfhcqVzjY2ZXTOnRxhGzm4krvrlJrINmLF0RUy8SfJMdxJO10V/u8nymnIC+hyweBEs7A1ptFr3q159ofpegYhCuu99YKTwP+t6kjqsiQR5NrpKxIBgJmP/9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZBsWk5f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1998C4CEEB;
	Tue, 20 May 2025 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747733977;
	bh=dqwrQrWhJgRqFu/+w+3lHgg6iHrbHydwVyKCn+xleEo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=lZBsWk5f19wpeJWeh3xaGE0RM2RJa7mSGC2inPgseWO3kppFOw9l6ZWz74kdC7yOe
	 qJLwVOC5WjutEsmhQCm8mZIgf3Fna+4qHjLYifzWSnU3L7tfNKsvCXxsnyoZE8LrJh
	 aJRlmJ/yBA7ywoPpbGmeGwQ15/h0AqjNcAZpIAegOaL7xjMpbnKJRGpd0RiggPQPz4
	 tYqz25pX+HAjLFu1nxC/u3OvM8qXAtGnAQfe5ZI8jck19xLcn8W9u5e0KLFtXqsbbu
	 62edErBCnJYuyBnyfSDh++74hF1+II08SOf6QZBAV3r5bpzM+la5U2CYOe9gle7u8h
	 JVXs7bn8Q64Mg==
Date: Tue, 20 May 2025 11:39:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Message-ID: <2eannezxcjzazahbjfttvrcd6hod2tzamovqimbetwvdtqdnc4@myglh7pghrxp>
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
 <enlo2gjoh5qua4phd3lnmmfr65zgx47vto35abwuwtpdy7ocp5@yd6mrc2yepws>
 <aCxIKd1QjIpaviBT@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCxIKd1QjIpaviBT@shikoro>

Hi Wolfram,

On Tue, May 20, 2025 at 11:15:21AM +0200, Wolfram Sang wrote:
> 
> > I took this patch in i2c/i2c-host. Please let me know if you want
> > me to take also the others.
> 
> To avoid the dependency with your PR, is it okay if you drop it and I
> take this patch via my tree?

yes, sure! I will take it out.

Thanks,
Andi

