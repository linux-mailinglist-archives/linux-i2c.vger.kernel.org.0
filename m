Return-Path: <linux-i2c+bounces-9011-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101BA07C55
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 16:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A57DD7A18ED
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 15:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D05F21E0A8;
	Thu,  9 Jan 2025 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpFjFeoZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5521D5BA;
	Thu,  9 Jan 2025 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437553; cv=none; b=HxA0F5Gd7G88sH2KwyKjPucV2DHY2UGLbSTWrAHBnHKefRiCy28MsrKFxklq1B48cm0IhiFLHUhHM2s7rcXwccLvYLx183mEn/aeK8m2TXEdaLVSBntYKl1HoC1+6j8Q55LUawZ27+XlM8wn2eaExUFBHtjq0hyLDRcuVKGJmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437553; c=relaxed/simple;
	bh=2eF7Ltp4saNC4yNxVJhgFEWHZDqLb2x85eVhPEBW56c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+yEK269Vwn3hjcU9c9zmNJczqaESIOTVc5W+7PfiuZ8COhWA5eji2nG0/T9XcjSpZBskowWFfCnpEyhf6dgB684w4s3be6eTaJ2//avQ4VH997mY8vL75vOiRDWvfx10MCVnUPNDT7dy1k3YbQSUY8vEHb2CpP62nVKAL+8Mdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpFjFeoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF291C4CED3;
	Thu,  9 Jan 2025 15:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736437552;
	bh=2eF7Ltp4saNC4yNxVJhgFEWHZDqLb2x85eVhPEBW56c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MpFjFeoZRA+hg9LUwe031F0N6W9KpLGaUvvS5HMu1cmGlfe5OOymqCEUo/TviGPhD
	 99UL2FrPlcBuaFKaHsen4JL3VHvoHwS6UxOzmMle5lL3KiPmVWwzdxSoP+FrJ3kuG/
	 IDcFGj9mYT1pS/YBM2yzAZ5tdY1KuOpceFRqE8/neoEizHKo3RA15V3n16p85vWMLF
	 HBkEiAakdC4JGx9w5qXuQCt+fjT93Uy7AX+Wd9yKVM42Yh0Gc3m4Q/4Gd7kP0zDqpY
	 Jrjj3VzIKMlaTffrY0YRbTlJMwxvUbzSbjxQQmt5rf9MmRJU78d+DUcH1RhSNnVq5s
	 ZudPe+v1pnh7Q==
Date: Thu, 9 Jan 2025 16:45:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: i801: Remove unnecessary PCI function call
Message-ID: <3uoxhrghtize4hmp2sofqmi5tpgn5n74zhnvta6743kop2fscz@bk3aza3kostx>
References: <20241121195624.144839-2-pstanner@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121195624.144839-2-pstanner@redhat.com>

Hi Philipp,

On Thu, Nov 21, 2024 at 08:56:25PM +0100, Philipp Stanner wrote:
> Since the changes in
> 
> 	commit f748a07a0b64 ("PCI: Remove legacy pcim_release()")
> 
> all pcim_enable_device() does is set up a callback that disables the
> device from being disabled from driver detach. The function
> pcim_pin_device() prevents said disabling. pcim_enable_device(),
> therefore, sets up an action that is removed immediately afterwards by
> pcim_pin_device().
> 
> Replace pcim_enable_device() with pci_enable_device() and remove the
> unnecessary call to pcim_pin_device().
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

nice cleanup, merged to i2c/i2c-host.

Thanks,
Andi

