Return-Path: <linux-i2c+bounces-6621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF42976CA3
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 16:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 417A31C23AC4
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 14:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFD61B984E;
	Thu, 12 Sep 2024 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+z+hGPw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B11AED55;
	Thu, 12 Sep 2024 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726152588; cv=none; b=M258LGwLLlbI7WLcVSGhgqyPRyCOO0DcToMnA1PvnB5mwpSs4Hjhokm60N2TT0rGWrBOvql07t96Ukom/seQP4HSXHfCl8afkDuBWQ0JMF6Q8UuuxclMCoxJ710KCt5I6SxI6b1Hr5FCUbWOAoLkT5g/32wRjPVcY+ccOnmSB4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726152588; c=relaxed/simple;
	bh=dQr32KsP2owpLLtngMgglgtTxnAhpoz6jlK156V6xTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k8HjAAPAgkc+HzuMYcqawo6Jw9LS/J+mRMdDcb2Caiz6AxQcRNmgb2kdhtD/zBFbb7gFWZoylKSNWAMNzy7t1NMKUIzLYpY1RLf5spwoIidxOjYIbDgkde/Jrzx+OD73NYEdJmdIwtM42WlNscfhcLMU1mNv7qqfQVplFZg5hns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+z+hGPw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A37C4CED2;
	Thu, 12 Sep 2024 14:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726152587;
	bh=dQr32KsP2owpLLtngMgglgtTxnAhpoz6jlK156V6xTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+z+hGPw4yFxd7pTQXxb9RK39/k1kRCkX8YFnlg8933YnR2nCoT4jCCWO6qtMhfxI
	 /jkej2CDNB2HllUz5xys2WcvAxTjGNd5zPObo8oIfKuZAuUohnTMWVZRTdQBn99DKj
	 JkbVTohcZTvq9DCJgLEM50geB8tZTJK9Zgnp9x7CXRZ/tf3H4DudFlUGW/cXi4xlX4
	 2R3I47pM8eS8AFsGkbSvQkvPcmpJ/0/dEJtUxH0e/JbbAGb3OCW4/O6KkzSrqPeG9j
	 sJ7XfAIgvodlulV6AoqGguXJFI51+QPPjqIiLRo//La4uyL3KoBVRGtOPlusSuopyc
	 TNPD7/KtvgTFg==
Date: Thu, 12 Sep 2024 16:49:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: synquacer: Fix clock rate retrieval code
Message-ID: <7ha475ast6xpzukbbxq5xg4jniyo4t5rujee3m3eejaigi6hry@v4di2uxcxky2>
References: <20240912144105.1555624-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912144105.1555624-1-andy.shevchenko@gmail.com>

Hi Andy,

On Thu, Sep 12, 2024 at 05:41:05PM GMT, Andy Shevchenko wrote:
> With the devm_clk_get_enabled() the probe will fail on the systems
> that have no clock provided, such as ACPI-based ones.
> 
>     synquacer_i2c SCX0003:00: error -ENOENT: failed to get and enable clock
>     synquacer_i2c SCX0003:00: probe with driver synquacer_i2c failed with error -2
> 
> Fix this by switching to devm_clk_get_optional_enabled() in conjunction with NULL
> check, so we won't overwrite the clock rate from the property.
> 
> Fixes: 55750148e559 ("i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()")
> Reported-by: Ard Biesheuvel <ardb@kernel.org>
> Closes: https://lore.kernel.org/r/CAMj1kXFH+zB_YuUS+vaEpguhuVGLYbQw55VNDCxnBfSPe6b-nw@mail.gmail.com
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

you are late, Ard already sent the fix :-)

Thanks,
Andi

