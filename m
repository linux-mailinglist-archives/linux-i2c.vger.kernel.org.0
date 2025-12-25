Return-Path: <linux-i2c+bounces-14775-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3918ECDE1A8
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 22:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A4093004F32
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Dec 2025 21:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52D2262FC0;
	Thu, 25 Dec 2025 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXeH++OB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7819C1CD15;
	Thu, 25 Dec 2025 21:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766696518; cv=none; b=D1YQtrIsXFFM29ApcHcdXMwz/YhAGbk0TKOPOOKwBCvwoFEFjkZYir4lal9jQSFvziPtUvdvYVmcp9x2GA5ZBKXdkeKPW4s0AULkOMsHqrwWQeOuoFQMe5ZjnfTtkjqwOW/RHJK1imPO6XH5cLOBsuQn3rZaN+7nwtVxiVD4ULM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766696518; c=relaxed/simple;
	bh=ftZicz13u88tWLL9LuwPfwC6FxR0P2PCchUxPZqxkqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwX3QHO1hjqxWf9kVsIFRRll80+6RU30kw14N0GsGDNS92P7BglwVursvqi5RkYYojyq2bQfYOoPABNVLIRClcwj19+79W7dMAY4IrmWWwJwhz/FUQM6p3JF2HuUc3LRx5mQdXrbAeJ7LhDk4o1s+8ZCIfVVJHTMVNyqK6nRiKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXeH++OB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D99C4CEF1;
	Thu, 25 Dec 2025 21:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766696517;
	bh=ftZicz13u88tWLL9LuwPfwC6FxR0P2PCchUxPZqxkqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXeH++OB+jScuTXBBpcC7BJAPf0uY6M/OqoroBQe3B+w5w/IbLmgClEjIDrZbtUzY
	 b3b3wWN5bLYcS6/bTixBNcBauY2MSidgHRICSMX+g4YSvxDCq6Ulc5D+yFpTKiFyiR
	 lJ+J3IDVN7IP7O0DJ/tH9eZzMi/uj1kLFRiJx1uZtfE8InV64zrBximRbumC6ixGs9
	 pnvVxJAz0wH14QrDK9yaXoPiKSpD6t1ysT6CP0OUjjxQ38OU3ahVnI7lr92YH6Zkjg
	 mhkLe89+l1hfnM5yB0ZCQqu8w6pKZhgsVCasFVCUuaUDKiv/w7QjEjyevkJNvSPWKe
	 if6KzI8mzTznA==
Date: Thu, 25 Dec 2025 22:01:36 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, 
	Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
Message-ID: <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>

Hi Encrow,

...

> +	rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(dev, PTR_ERR(rst),
> +				     "failed to acquire deasserted reset\n");

If this is optional, why are we returning with error?

Thanks,
Andi

