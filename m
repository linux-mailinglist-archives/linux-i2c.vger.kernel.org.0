Return-Path: <linux-i2c+bounces-13640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F48BEEDFB
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 00:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3D614E02C0
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Oct 2025 22:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20022239E60;
	Sun, 19 Oct 2025 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFUilZjB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC331223DE8;
	Sun, 19 Oct 2025 22:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760911821; cv=none; b=MxFCXDmSeQRiyuYgCixBk0ZtSXWATIVlX6Thqnqn6D4mELM1n+gH9Du87GJX+yYf3MK1SirOHMIJx9BkYX+aWMF9+kBrnPBcWe+LBKcM146RzOg+3xQaRrgvSs/Yi6TwGhBGM6JdWbIpWGMfaArAFnqgFppOH1Xcf08/miEB36w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760911821; c=relaxed/simple;
	bh=h3qzXi2Q/KqMUPt2+Aokl+Xho1opjKiXCEIDGAHlZC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2dtGU/KhosgDdXQOGp46ynsllCJhzt8SfF1OqVFCXhHq1aA0YFywxLTavyp32W3nVhkPXuDZRoaNzT6xNBAp/ocNGEHAxmpN4lqJ8+HRMgEiDxzpXcVU1PVnAmNFz+t9ueS4CZlngQpfhtv3dXPcVE7rYjGSrcvW8BgR9fndJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFUilZjB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE46C4CEE7;
	Sun, 19 Oct 2025 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760911821;
	bh=h3qzXi2Q/KqMUPt2+Aokl+Xho1opjKiXCEIDGAHlZC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFUilZjBQ/qdsGNoClv7m/Qk7a13FKeBOi5+b1A+xfGix/W2RIapZINQShENuy6z1
	 My7tRiDAs5UhzfnK5RslxvO7HDV2gJTMSvjHKpGDA8PNvEKY4TUh1rfy1kZwjDNv/G
	 /HxISFMo1MSekBNoWfvumCazcRCmM7UWKLMktrrgZXD7BYwtnBvkl07XQxePptp2+O
	 6nX1CEgBcb+a49gg5O7Buqy2T9eR2Bf9u4OniHluHGbvvNd0I+EO079yDk9G0VLJoU
	 cGP5VRxw/DtImM65Ka+RrIXwNSXrdxLfeqXdH+GaNsr8msEhoAPv91Aa47rDdsdaN7
	 d+X+39u6r9yXQ==
Date: Mon, 20 Oct 2025 00:10:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org, Cezar Chiru <chiru.cezar.89@gmail.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] i2c: pcf8584: Fix errors and warnings reported by
 checkpatch
Message-ID: <q6drr6tsomzopifzycwlfkss23jnpgytce6ooukkko5pgl3og5@jqxgrng4foid>
References: <20251018091258.5266-1-chiru.cezar.89@gmail.com>
 <yto5zpmkavf3koo7bxhyxabyonrilwxhcevuzc7rzavoe3jous@c3aswzlzwo4a>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yto5zpmkavf3koo7bxhyxabyonrilwxhcevuzc7rzavoe3jous@c3aswzlzwo4a>

Hi Wolfram,

On Mon, Oct 20, 2025 at 12:07:21AM +0200, Andi Shyti wrote:
> > Cezar Chiru (3):
> >   i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
> >   i2c: pcf8584: Fix do not use assignment inside if conditional
> 
> I applied these two patches into i2c/i2c-host.

Sorry, I took these patches in my branch without talking with
you. Please, let me know if you want me to take them off.

Andi

