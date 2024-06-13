Return-Path: <linux-i2c+bounces-4019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136F907FEF
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2024 01:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E32811C2166D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 23:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA1B14A602;
	Thu, 13 Jun 2024 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEcDfSl2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D82139D04;
	Thu, 13 Jun 2024 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718322938; cv=none; b=subisvm9yMx8evFqd2QdPjJnngaCPmLN88KSeDXO1DtcjISzTWwO6a7PX5eraWlw45H1U0JWktit7/aGtTPUzefBMy5OgZDZ+ttiLazvAgZZA3/9GFr0Ji7JpKo0fEHcDK/saKMmwSGdbUq6g6qNp8wJKY8yAvuGWCA6hVRP85E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718322938; c=relaxed/simple;
	bh=eqePGDayfWp7FPSRufOIkB+/WyCJz0Trx1EWkkzz/iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiOTDtVadRVrIM1nQGiot4zrdwreHUMWfVfNVPrUm2aeQTGGGD0K2OU4rTjGGlRoGoFNHQrJUTtLCVcnJIT0dOZG5anoE9NKS2m4hLUODQ5yz6rY6tpomzegQYWMQy0sS8lka5FAcZRW4OB5yvfueCLOm5NPTn0/yz/7mmZ2ybM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEcDfSl2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC851C2BBFC;
	Thu, 13 Jun 2024 23:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718322938;
	bh=eqePGDayfWp7FPSRufOIkB+/WyCJz0Trx1EWkkzz/iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CEcDfSl2U5KNFpkBg09FreU2iA3V72xfryij8oOcNRdHwLaIrWUPHznVjC9erB5kO
	 246oI/xJsIJZ183/wheIZvpXwOSWioWP/XfrRIZPGjysdAJFIVqEWgzmEtk0c6tdqD
	 VKeUT0zUp2N5/p+zKSKsDSuEqGBc9F5ekgKQwms7uSuww9ds3HF7BTg6f+ZB9sotOS
	 91c9C66pUITn5ZtCYGj2nGbFuaLgqiOfpsm7ciUOhI/2BvfJy7+gVCUdpck5TCu8VG
	 aJ/Yi6pp0Qko0KLhYTB6CXKVJPdrS26yufJnrrSYq1486aC45nRf3NSokpFAzTl+NA
	 JhRB9D80hSnhA==
Date: Fri, 14 Jun 2024 00:55:34 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
	Robert Richter <rric@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] i2c: octeon: refactor hlc r/w operations
Message-ID: <lx2mv6kbblao5ubjfxg4we6h62g63osbwct2hyuwygmp2u5nxz@j3iyezth2zd2>
References: <20240613025412.3848629-1-aryan.srivastava@alliedtelesis.co.nz>
 <20240613025412.3848629-2-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613025412.3848629-2-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

> +/* Construct and send i2c transaction core cmd for read ops */
> +static int octeon_i2c_hlc_read_cmd(struct octeon_i2c *i2c, struct i2c_msg msg, u64 cmd)
> +{
> +	u64 ext = 0;
> +
> +	if (octeon_i2c_hlc_ext(i2c, msg, &cmd, &ext))
> +		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));

I think this check here is the only logical change I see. Right?

If so, can you please describe in the log why you made this
change?

Thanks,
Andi

> +	return octeon_i2c_hlc_cmd_send(i2c, cmd);
> +}

