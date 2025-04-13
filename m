Return-Path: <linux-i2c+bounces-10298-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2977EA8743F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Apr 2025 00:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73D581891A42
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E88C17C210;
	Sun, 13 Apr 2025 22:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlKlTzbY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1DB1F95C;
	Sun, 13 Apr 2025 22:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744583443; cv=none; b=niAbfQ8ykz8x+zbEjju3VtjvCSS3J5PLj4XkIY4EPVYVaOHfpEaaQgj0VeXmn2Z0LsFytNnqUo/pi0TChZ8jSNYU+7vTRJEcZ2xS3lD1TbifXogHYacKGHTQbFKRjZ4UkuuqlJjkWdffrg71lc5RhIEQRMm+iScQZpijKgxVgyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744583443; c=relaxed/simple;
	bh=IWvBZeKrqdYC6r3NvWqAvivZq1FG96ilxfnAQsvWQeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxBmkAL8jxi51daD6DS8j65n4MszG8ymmK96An0QYY8w0KfLQH6R2DKgkMJnA6EYFwb7AcoEqJchGvtWc/bTyLkyBC4D2oYFj87J9FkOqGHEqO8K5ZW+4BLBnUAEujE/3TzHYn7l7FybPeITKFrmQjXg46zU4tzSG174DMcxOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlKlTzbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2851C4CEDD;
	Sun, 13 Apr 2025 22:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744583442;
	bh=IWvBZeKrqdYC6r3NvWqAvivZq1FG96ilxfnAQsvWQeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlKlTzbYZhy+rzLI1OGixfD/aUzhOw+Q97TtCTebdnzJYVdAOvNKS5YJfdwh40X8C
	 VAdFLglwsBQrai0/zFjl4ILO7Efi1O1XECEwlIfCQo+18KkWFGvAcgyBWuZ5nNJNkO
	 A/Lsf9R9TC3UbFVYyAFhUOX0b/772v5WHZNV06okpDdPRa7cyOMuQ9pTK9uNmuntdh
	 LZwWHxF1SwST2YnLUk0Np8t/1LCtvgdspeCMlrGGV1aMXplYQRyPP18wqdDv7tQcse
	 k9TVD4grzh+yeOabAUS91gefhYWyiCtAPsLDKtVjIEkGavGCWOZX7Eu07KpbwtlZY2
	 9t6ZECXtOAIeg==
Date: Mon, 14 Apr 2025 00:30:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: xgene-slimpro: Simplify PCC shared memory region
 handling
Message-ID: <gzrqpn7a5g5bqvlc6ryw64iux3w5v3a4iqxu2i4qkivn7l2nf7@4drkvcwi6pyw>
References: <20250411112303.1149086-1-sudeep.holla@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411112303.1149086-1-sudeep.holla@arm.com>

Hi Sudeep,

On Fri, Apr 11, 2025 at 12:23:03PM +0100, Sudeep Holla wrote:
> The PCC driver now handles mapping and unmapping of shared memory
> areas as part of pcc_mbox_{request,free}_channel(). Without these before,
> this xgene-slimpro I2C driver did handling of those mappings like several
> other PCC mailbox client drivers.
> 
> There were redundant operations, leading to unnecessary code. Maintaining
> the consistency across these driver was harder due to scattered handling
> of shmem.
> 
> Just use the mapped shmem and remove all redundant operations from this
> driver.
> 
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

I thought this patch was going to take other paths. Anyway, I
merged it to i2c/i2c-host.

Thanks,
Andi

