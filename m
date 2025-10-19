Return-Path: <linux-i2c+bounces-13639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0BBEEDF5
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 00:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3090B189907D
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Oct 2025 22:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA36A238D52;
	Sun, 19 Oct 2025 22:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ife7YrsM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D8282EB;
	Sun, 19 Oct 2025 22:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760911642; cv=none; b=sA5ipIFuvoeDgHUoyLY+Sj/HviaSieaBAk1D4+kjKPTUMgjNcec+/FUlw7C1HXoghOp5M207SXJVMXfvi5cE93W125hVjRg9HxAnbelSe/hQuv8UqeCnqgnAy4QYz+PWAMYAiIdNLPyYMVdaenEgo2RxMGBZ/VSv6ct+3CVPmng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760911642; c=relaxed/simple;
	bh=f8OKm7LxmqEsOR8ecVzZtcj/ejcfTWoQR815s+f/UZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2VYnFYkpGrEcRWR02kJuiY0N24C5FRmZHAEnk52mb3t5EUD9KsivZ4kWvB8fm2ELhKQzMUQMD8JFcTDIr1i7zpiOQX7wn03KH6FKno86k5jFzXvRUlhgKIWtputm+ycYy+ZoJUZnxW/ajjuT2BstEpleAx/TlIGi1dnvWGttoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ife7YrsM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A84EC4CEE7;
	Sun, 19 Oct 2025 22:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760911640;
	bh=f8OKm7LxmqEsOR8ecVzZtcj/ejcfTWoQR815s+f/UZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ife7YrsM0WPLFiT/icWPsnC5XV1lncn6nd1uaod3IcdTlrQKxeb8m3aaD+GXmJD0q
	 SmD/aIPjQetWGLDvyBjpR4v7OTSSrt5hcWbO9TpSTqhegNJKzsSo3gTgAX+Jq5nH+6
	 a5lSVBdz23r+2BOC5t3PeAoaWH3iTKVCGO79A32MNBzKPT288cGmzK0jyLTZVoP4J8
	 hZI5oB65upqdWh3x9qqFxwLBJkDgsdF4hwRlI8fBxGwipLkWLe3qwqNBpixPz/uP0V
	 4W6/m3cM/c90wLYPyn7/X3MdH0U2ifYQJUAf8S0FHdOxeeCatzAnKfZGH5j6Y1n8HR
	 4izAVAFDORBfg==
Date: Mon, 20 Oct 2025 00:07:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] i2c: pcf8584: Fix errors and warnings reported by
 checkpatch
Message-ID: <yto5zpmkavf3koo7bxhyxabyonrilwxhcevuzc7rzavoe3jous@c3aswzlzwo4a>
References: <20251018091258.5266-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018091258.5266-1-chiru.cezar.89@gmail.com>

Hi Cezar,

> Cezar Chiru (3):
>   i2c: pcf8584: Remove debug macros from i2c-algo-pcf.c
>   i2c: pcf8584: Fix do not use assignment inside if conditional

I applied these two patches into i2c/i2c-host.

>   i2c: pcf8584: Move 'ret' variable inside for loop, break if ret < 0.

I left you with two comments here in this patch.

Thanks for following up.

Andi

