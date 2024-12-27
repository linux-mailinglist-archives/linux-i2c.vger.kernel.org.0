Return-Path: <linux-i2c+bounces-8776-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8229FD7EF
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 23:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB9A71885346
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 22:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766661F8905;
	Fri, 27 Dec 2024 22:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDq5GdBC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8F11F76DE;
	Fri, 27 Dec 2024 22:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735337427; cv=none; b=XMPYASjMOnSK8AfpnkokUkZNTaIR3Gm72Rz3WBOxoGjSVNTzn1HL9tipMNIcva3s3HFOLUL/ipD7flVwS+eoZSKbrMV4PCElGZzewz1ctrtd34jUfUkTlm5Ikg2I6zNFdhUWISSf3ePntFONukCiAIgwR7D7rd7rA99YHQ6A/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735337427; c=relaxed/simple;
	bh=c7UkfUuRvp7ohwANYFcGRBC5CtL5p6FsMXidRmZEZNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VV0X+5bYcays+g/eYZoTaUgTv2Jxpxc72kip6WtsWxduyVMaMf6dojGyVRwgzad3z718kX9FmV8JgFKYY9ty8UAwE1COm1VlfTsr/ZhgDKHqGy07zjqvx6pHJMt4t9UpHAqyHrOMIOBpxkf3Gph6uIAVelp6lJuZiMeYjk6x4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDq5GdBC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06577C4CED0;
	Fri, 27 Dec 2024 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735337426;
	bh=c7UkfUuRvp7ohwANYFcGRBC5CtL5p6FsMXidRmZEZNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GDq5GdBCbfqT7Z8Txw6wDvYJ8htp1hzfZ7/wkEx1G99Pu81vWXijY1BgryA7wxEm/
	 mYl69PJxAaLBPBvq2vUv8BlTyL6kZP5mWFTJVLrXhhe7xtO9jzaYCqsepkTmzX2fTZ
	 3zJ/0vPjBSiwg3bhAlwGgHAmV4uwcsA9pOwUOtzaFE3iBxUVoR1ML918Bl+kOHb9uN
	 p0Fj2AHpiEMdv7oe6ozQdKhahJEaOsM4TLbKZTp0bxm93oxBpeeBJXP5TXD+f3xwx4
	 FcPSWxXvcfHTKeOtu2vNU3YhJtOFqD9TR3hzSuCuA8fs2hShcrRLZYjj805qDT9D9c
	 fhL8Dkq0Yc3qg==
Date: Fri, 27 Dec 2024 23:10:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/8] i2c: riic: driver cleanup and improvements
Message-ID: <huhbfedblerrw6koztkiij3hgdrty2oihmacug53734wctq34a@aqlgw63zj3ad>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi,

> Lad Prabhakar (8):
>   i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
>   i2c: riic: Use local `dev` pointer in `dev_err_probe()`
>   i2c: riic: Use BIT macro consistently
>   i2c: riic: Use GENMASK() macro for bitmask definitions
>   i2c: riic: Make use of devres helper to request deasserted reset line
>   i2c: riic: Mark riic_irqs array as const
>   i2c: riic: Use predefined macro and simplify clock tick calculation
>   i2c: riic: Add `riic_bus_barrier()` to check bus availability

merged to i2c/i2c-host.

Thanks,
Andi

