Return-Path: <linux-i2c+bounces-9447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B16A35124
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 23:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD5067A4DCD
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 22:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22239266B59;
	Thu, 13 Feb 2025 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkIDze3M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653E24A045
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 22:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739485337; cv=none; b=Owwn/NLEt2AJ6bOpMZZ641mMPIW40RPCWuGEQIq+iUzn9VYhbhrjYy3JOiI7c7bgqPa23H9CYRvVbClU8wQ7VuC2S/G3QpIGdYqFOdjVVCxgvHXT2ZXaEn0HVSPvS+91f29m6nhajHYEiFvCbgBrPoXW54XbgwxABayW0lxFRMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739485337; c=relaxed/simple;
	bh=hAplAi6f2jpwhA91/zPnKrze5khqUUslV6GHEqUsWwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5D/++qHcjoAIYb1634wigIw32EaFzHJVA5a/18ggfHug1Se6ETVuzAa3PY6fxMHNnzHBDVlgnFfXFgHRBDmt/3kOLq8bo8F0h0jOfUUjuhIPIIIF4MeAhfYYG0kCP/Rt8V3ck2HQDun9G73TKPeGWhYPC+zefDbenOR3hcnUd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkIDze3M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E17A5C4CED1;
	Thu, 13 Feb 2025 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739485337;
	bh=hAplAi6f2jpwhA91/zPnKrze5khqUUslV6GHEqUsWwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkIDze3MtmzOuqOrBw9iuKZxqpg8IihZWPieXvgiCVQLUO+fTobmiIvMuXTohhtWH
	 VtM8FM6MLDFiXXnMtv+hIGpJ9OLAqrOZlXIxh9hbcHCUBIWMTDMpe/QhrKILiUL1L4
	 QKHs/FEIUmfVM+bDDxTC2P+KYTSnLoTZ1iNA9y/lVRwcGdoGqH+jhrLFFVWqtTXgQl
	 xowZSnVu6Saf3MlQV9hUMjDiRiP1dGgQSmPUAKyq4jnPFyMsiXcdX3HG/sKcziSveK
	 TliY+OOzFHTeYIONB+6PfnjllZ9CaXozaDFGnz5mMsCQIcketcZ8EfHu35lzUoe08e
	 wA8f0A1RQH6jA==
Date: Thu, 13 Feb 2025 23:22:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: delete entry for AXXIA I2C
Message-ID: <etop6cck4zy6m2idpbytgm2bdtqzh3nymqppnfhu2r7xz37vbe@rme3wpxioqy7>
References: <20250213162950.45596-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213162950.45596-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Thu, Feb 13, 2025 at 05:29:51PM +0100, Wolfram Sang wrote:
> The maintainer's email address bounced and he wasn't active for 4 years.
> Delete this entry and fall back to the generic I2C host drivers entry.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

