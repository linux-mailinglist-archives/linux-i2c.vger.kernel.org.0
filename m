Return-Path: <linux-i2c+bounces-2873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D514889F454
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 15:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FBE7285FC7
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E648715ECFD;
	Wed, 10 Apr 2024 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XN6zeQN0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5B15ADBF;
	Wed, 10 Apr 2024 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755884; cv=none; b=dYkb67X0k2wMIomnOlhnSbQEBsXigeJE2H7paVAdR4ycGbtGfCA9VBPJDBajFrFfWbhRmofKDNaQ7tLOgfygtXuVZYXGkXVsNw+jwjXj6JuqeGzNDifbklEqWddOkx21Njc4QLQzhHsyijB/0AISQeSTUrTaZUBg1LP0ETFu1vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755884; c=relaxed/simple;
	bh=8/wXwcx5NajVLNTz4GkObpje3TaN5khbVxkN03PMLec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WO8iKet3h2n5yfas3B0F6jWDqFUS78XRLGCJ9UWsm1Z9eWOyHOkhr4DaRDF886eFGorVft/up7t9ts0OgdYhzjBjLRJ2kceItxcbW9LFc5GLJtsDoYHn4SOgw6FOlhH8MowqDUhvjBXgT+dfsUB/+RR4Xw5nLxv7iMI0XEC2eeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XN6zeQN0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10E8C433C7;
	Wed, 10 Apr 2024 13:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712755884;
	bh=8/wXwcx5NajVLNTz4GkObpje3TaN5khbVxkN03PMLec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XN6zeQN05eLen8fg+5sCAAEdjHNXR2mOh0YmTXlp+rL6lDKXZoy2mNpLFhxL73dR2
	 gd0M+gKKu3Xykr4kbP3dfhXCI6qIoxhSH/BpJo7aE3ztAPIREHU3FTXiDlZhPaaSRf
	 fLw+sUbJV6llvQXmthltyFuFI/wD1uO8p5iLi9FeE4cDccQLCY7NB7WvNyEv0Ah71m
	 sanCsCg4cSn7R5BkD533dPWPaUSMwTnncoY0KumIIX/5FJ2JYEV5Nsse1N71XCgTfe
	 HoG/owUUCbTbd5sSCthWIWTc8L+JZM0dRrCZkt89DuvMkgiQCnoVWypLaO5BKUX5jo
	 8KVewOtWhuqow==
Date: Wed, 10 Apr 2024 15:31:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Gregor Herburger <gregor.herburger@tq-group.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: convert to ioport_map() for IORESOURCE_IO
Message-ID: <cwbht6xtv2nfqm7xz2ra52dtfwx3whjyyigbxxtdrwzcsq3llp@vhryqiyrjxqx>
References: <20240408092923.2816928-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408092923.2816928-1-arnd@kernel.org>

Hi Arnd,

On Mon, Apr 08, 2024 at 11:28:36AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is at least one machine that uses this driver but does not
> have support for inb()/outb() instructions.
> 
> Convert this to using ioport_map() so it can build on architectures
> that don't provide these but work correctly on machines that require
> using port I/O.
> 
> Fixes: 53f44c1005ba ("i2c: add HAS_IOPORT dependencies")

I had to update this Fixes tag as I have done a rebase.

> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/lkml/CAMuHMdVUQ2WgtpYPYfO2T=itMmZ7w=geREqDtsP8Q3ODh9rxdw@mail.gmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This will go through i2c/i2c-host and sent in the merge window
pull request.

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: ocores: convert to ioport_map() for IORESOURCE_IO
      commit: a43939d2d96aec5fcb77d0abd75bab5e6ab006d3

