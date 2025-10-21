Return-Path: <linux-i2c+bounces-13713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E222ABF9289
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 00:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F17A05082A5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Oct 2025 22:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B588D2BE041;
	Tue, 21 Oct 2025 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qq8PL4PT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A212BE653;
	Tue, 21 Oct 2025 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761087025; cv=none; b=ZbE2DSf3hl1CPJDb2tx/pu6Wet9cPm6bdGC8AYko/4EOW9JbUyhlMPyc42CP22eyf4SYVqlkWwnNAiB6y50ZE3ONdT7ANpznyxhh9gVVXl8LJCR7UKlJ1CzM7S5/v6wQVJpVeYROoVWCoPIlMFk6K/Cc2xupvHZqzKAI4Afntyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761087025; c=relaxed/simple;
	bh=Z+x4GylvAi4s8DnashVr3L7NdYjqh4PcymnmWRogDI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTJzg8o8evQ/MAYatXsq6IkwiAWq8VnuKQLoYy+IaxXLkaW1KxnYjhoOutlh302p6rU4NK7IRxDbSeq3y4UAS9qPLkIo1T3DAPTOyDYfrwFbm7RTr/3my7O2Vh/r8L7aicpLhkPCL1aKwsXSV95SVn/KApv3Oj43S9kjyHqjcGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qq8PL4PT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71346C4CEF1;
	Tue, 21 Oct 2025 22:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761087024;
	bh=Z+x4GylvAi4s8DnashVr3L7NdYjqh4PcymnmWRogDI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qq8PL4PTMLM+BnVu8d9Lfk7TbqTYsgO+ijiMcbnosBMUmTad57Q32jKdxhbJmebXq
	 uh8m4zfxpJ5TadTS2IX2JOwF9vjCpg+r5+8yq9z+EcH3QWP1ryXnjf3wI0DB3fxYrt
	 ODXFHLzNzm7pBkINWFT+kPTYwHUmlFJaXtEZHTpw2cxODQC3XjLabDR0aKMl+BPbzk
	 a2T0os0/IgTIaOTIAGJnA2bbr/Hnt4fhCCzkhvOpAy2i2369UI4MMlEBSbQFqZmt80
	 rGeA30+dxXAvor6oYIFlpW1VK1TWNRBZsGeag7+Vu0uCrowGLcaNl5mv8mRGJkad9O
	 nVMRvPPY/LRQg==
Date: Wed, 22 Oct 2025 00:50:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, 
	Jan Dabros <jsd@semihalf.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	LKML <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] i2c: designware: Omit a variable reassignment in
 dw_i2c_plat_probe()
Message-ID: <ki5u2qdtlyvsvzip2sl7jcdxjym4yqxnzuy3kr7sqpvpsnnysn@mambfizxjc5r>
References: <bec52694-c755-4d88-aa36-1d96f6d146e4@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bec52694-c755-4d88-aa36-1d96f6d146e4@web.de>

Hi Markus,

> An error code was assigned to a variable and checked accordingly.
> This value was passed to a dev_err_probe() call in an if branch.
> This function is documented in the way that the same value is returned.
> Thus delete a redundant variable reassignment.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

merged to i2c/i2c-host.

Thanks,
Andi

