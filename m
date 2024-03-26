Return-Path: <linux-i2c+bounces-2597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A8888CCB1
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 20:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 050EB1C3F139
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Mar 2024 19:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE94213CC4A;
	Tue, 26 Mar 2024 19:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttCJJYzH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7656913CC42;
	Tue, 26 Mar 2024 19:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711480013; cv=none; b=kCgQ/IHM2LL20PgPCNLDhL8OntR7/PmuWgFqxbC+yV9awQ0cTtPHJCT9ivatlTWPXv+XkTm9Gj8WTzm5r28lpD9rmLGvKwG/GqgyxkumqtKd9ZVRnBlnOHM8qcmViCBXcf820FnpNSayJxt5wQl0QX5EXp7cP1dwyo+k8bU1I5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711480013; c=relaxed/simple;
	bh=2xWdVvADXNpLRQdWtdHDnWRqmtHJ8IcAvtJD8vxRqH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lojaWlDTWcFOvwSMYUzYkTRI4GGgGZLoOVwemovWm3z6kZocZNpB37XG03vheFdUFyduOxDyKCaY72ikT3FkjSrkzbrtDB6mMDetxuRimCMjthSBrAY5D7IyAYTHYd3Z7hMCvXNZ2ktmEAQ1+hKQPv+4qBHwDUPoqZ4LTPYIS5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttCJJYzH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C03C433C7;
	Tue, 26 Mar 2024 19:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711480013;
	bh=2xWdVvADXNpLRQdWtdHDnWRqmtHJ8IcAvtJD8vxRqH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttCJJYzHV04QKOkc00BKB88o1DnS2n/M14BayyYRW65u2+RKUFLjbyTBLTdPtU1zL
	 oig3OQHTdY7qlyQegx1E3sn33NVSU4lBTLMw5zERwMgcnmWBSbFwo/2F5sYjlCt/w0
	 3J7bIMSE/Alyp1yYVeUouRyWJBNCSCszsCKUJjF2El/d5YLWcKbtC6RMpqEGzItc5i
	 NxmLK2XN78It/pTlRjM8LirZDNvXzydQc60lmDV6GxqcT0h5unbafn3gX7Bodjn2dv
	 0FGsC1b9UDMU0TtOUOABr8dya8xz6GXyGJyCHOc1Qn8ICSJGkGEG7Yp8qrE0twMLxs
	 YY6PGcU7sej7g==
Date: Tue, 26 Mar 2024 20:06:49 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/64] i2c: cht-wc: reword according to newest
 specification
Message-ID: <oaqudqwbzws4njdudxlkux5j5zu22dgcsorgqw34xj7vwiwfib@5ov2tauv46e2>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-13-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-13-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:25:05PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

