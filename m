Return-Path: <linux-i2c+bounces-1525-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADF084176D
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 01:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A57371C22BB1
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059AFD266;
	Tue, 30 Jan 2024 00:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHVIZqIw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA502F2D
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 00:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706574341; cv=none; b=t4sb3VLs/SLwconHz9SE/dHcgEGJ1Q9miXHXwgMhGlMNiEH+VjLIMu07VCaGkvOpMhHmDqEu6Z3veFzx7A1zaze7UkUDXAndmwohrcFxbhexn6UM9mi6uP31N2LvtGddJzLlxCPmK3BeS7n6kR12K+kKkaUR45DaTK/VXLyOYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706574341; c=relaxed/simple;
	bh=w0IFJAaCT9ZruEMO/UZEu+WnCk3GPyC/h8WcC+JZtr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=beeTWorQFwJEWZfXGjB8Dhc18TE3PRgQzfTfYduKtgA+JgFYQQ8/e9s4Pm0drX9qADjxwJ7TWATkKqMvm/Kfht1wsZkGzdfERLvirqqVGN3fiyuDx9IO+DNK3WNgPbqk8UhY6Sf92eYMnWZ2G4r1uxziTo3/91wYVTvVv/n1aBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHVIZqIw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD824C433C7;
	Tue, 30 Jan 2024 00:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706574341;
	bh=w0IFJAaCT9ZruEMO/UZEu+WnCk3GPyC/h8WcC+JZtr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHVIZqIwp817TOBDvK3ZmhRxdglry06umk8UGU77nnC2kv7oY+Uu+QzFJFk9hHeaD
	 r0VMOALOFcSUhbPjzKEhRudtFn7QxOFrfguFrNDQviBlSihqrJ3RPMVpNkcvll6dWj
	 rKL8xOpNwLpejTfJQ+K5xkB56PBHkCOU6pM/W4/IxNhTvMJj28XEMSCYZREOWogEbj
	 cyVpO+LYLbu8cKKrAjg8VPlf6VNhqVLdW5PCIH8UNU9WLHQ4yqIGhRf3xpNu7xBblV
	 i4cHyR1focsdv2fwS9My3UOW/m+384tWLFZsbJ9FtsHw8Knbnj1lfea3aZ61MJFUlJ
	 a0y+upvdUnH7w==
Date: Tue, 30 Jan 2024 01:25:34 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 8/8] i2c: i801: Add helper i801_get_block_len
Message-ID: <zbogudfehgw64uvrhdmhlhozng2lbc7upcecihignm6f4k4xof@mpxvfmahp2jb>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <0d347ae8-b4e0-4937-a6dd-55bd72748d04@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d347ae8-b4e0-4937-a6dd-55bd72748d04@gmail.com>

Hi Heiner,

On Fri, Sep 22, 2023 at 09:41:41PM +0200, Heiner Kallweit wrote:
> Avoid code duplication and factor out retrieving and checking the
> block length value to new helper i801_get_block_len().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

