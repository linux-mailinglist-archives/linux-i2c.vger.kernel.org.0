Return-Path: <linux-i2c+bounces-1605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B11668462A0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 22:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D61A1F24334
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 21:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0A13D0AF;
	Thu,  1 Feb 2024 21:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViXrHEOW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A93D0A4;
	Thu,  1 Feb 2024 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706823085; cv=none; b=g0Jb2teSOahNKFQ8wquCesOEJPj75rwsNgEBX/Npj2HczPmQcUqLI9q1asDf5RqQkph2mYh8vLsere9NGKH3kiUqkFhnDFpalWyksonMbQTFAgkRmtNLvU0a17vOy4ZbdaKmd0C53Ix3p8KoLdlCD80V+2tLdzuw1Ch/079Y9Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706823085; c=relaxed/simple;
	bh=zCGwWu2bOg9jz3i7zKwlejA4b+KeB3Jj+XHu4j5HP0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYNDAebKOnHNdR3f6yMdk53Df13BuKowU96UlG8A3dGC+QMlWSv0+vyP1RRfS4kq+h/hupnpWvu4GpgacE3O9oIpmoQXn5/OJwSWx6GVKhAvaxxuA7yzMA6W034q4heehSezHoFDY4LAxjHJuq/t9k9+CgLeEshCjdbx/aOyTP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViXrHEOW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F289FC433F1;
	Thu,  1 Feb 2024 21:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706823084;
	bh=zCGwWu2bOg9jz3i7zKwlejA4b+KeB3Jj+XHu4j5HP0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ViXrHEOWwR9G4iXP0iyvq/rlm9pEKxlrSiD7YVioCGcTHmwZZcwlaN18aNlU3rXdI
	 d6xT3RY9rj8ldO2DKDD6/X4ScB7jioTyzP03rdvf3lh99g7eVaOG79TtFBcCdzfcuZ
	 1ZbCu/xk32mP2Wfwh/qK3qZHcqCHGKXwEfj1olL9G0vPobUQuiaaDsZiISN7bX0jf5
	 0x6zSZ1XAco+7kNSDPZF/mjNxaVJXJZqxbR8GVm30LIabfdherQ0zMc5yKE8lwjwWj
	 nejLlYvtvA1AQHOfnAKAtIbXfzn9NFEBaU6Fwj5yks8QxFZ3q0XXPxWwB2gqN/7+Iy
	 iySPr1GvPk7Eg==
Date: Thu, 1 Feb 2024 22:31:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: renesas,rcar-i2c: Add r8a779h0 support
Message-ID: <3b3yc5phep7j3dgooaickcfegem3wicupwlespzlihbsojigue@yen737m3g2iw>
References: <b83a745334b0aea8bffae5a41db2543100ad5e30.1706789816.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b83a745334b0aea8bffae5a41db2543100ad5e30.1706789816.git.geert+renesas@glider.be>

Hi Geert,

On Thu, Feb 01, 2024 at 01:18:51PM +0100, Geert Uytterhoeven wrote:
> Document support for the I2C Bus Interfaces in the Renesas R-Car V4M
> (R8A779H0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

