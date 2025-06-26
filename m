Return-Path: <linux-i2c+bounces-11625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6DAEA85A
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 22:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B8F44E0E64
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 20:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A982F0E30;
	Thu, 26 Jun 2025 20:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aU54u4/c"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A892F0C7F;
	Thu, 26 Jun 2025 20:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750970671; cv=none; b=lfYg5+h/k5stLrEND3IWL1AFZcYh1DDo9ht9/fcddKDn+6J98GLz5Np3Lizio0MduxauUco1bW2sjplNkvzJ9NkrelQkx4a5LwtLbI23Wj2KCNUFWNA81lkuxTBukgCIwDM/fPHXl0VYFHVAD9ytXiv51b4Zb32gy/D1dkyZTWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750970671; c=relaxed/simple;
	bh=abaYV/TxoNSuyHl0eTqG9SzcI4RVLABBdwTCYM/IuUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4fv/g1TqF2y4fz6Fl/IyxlxRRWlAknG+9UUQGgRPsBx4gZjvNQ4GNK2nNckAvRt7VoVN6Ounw53cgj4h1THkpvtcuxtX2MV9xCdR/yuacrzkXYQtpYdpCoxKLamAI0CVZdZnFDvtslhTpFGILWvP0/NhJ2WVD7xsmzxJFZlvdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aU54u4/c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787D6C4CEEB;
	Thu, 26 Jun 2025 20:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750970670;
	bh=abaYV/TxoNSuyHl0eTqG9SzcI4RVLABBdwTCYM/IuUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aU54u4/cN2JAQ9nEf5AfYIcmyjgFIqvA3lOdGsnxB02qthvI85iMArx7c9v/YLgWu
	 ygsqR33ijsfk/UZYDmcPdO0v1uiPvqvRIGfi+fbJrWhlKHk84USM1XV5tMsg92zp07
	 I7dNUfRMysVq9ebTu+To/GRg0xIoYUxblBkeoO/rGWF16ARF7m57Mvt5MKTEaPy03V
	 dS//DqTwW0VVdwewQK2DOoXqQs6MmHcKAkUnaHENeK5XZqMKw4lj2DGHWYDU+PK2n0
	 IqqLAJkhnN1U23rLmnr4+mmURiiJAuhInR7XWkwnGV7f/+ndTiKEiMmtwgDyvub4qc
	 O85FInCQCIeqQ==
Date: Thu, 26 Jun 2025 22:44:25 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko <andy@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 0/5] Add RIIC support for RZ/T2H and RZ/N2H SoCs
Message-ID: <va2iyipvikhgt6uq6n6bjydsqbmeep267ue4w24z2ptzdq4t4c@w36e3vstxnzh>
References: <20250625104526.101004-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625104526.101004-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

> Lad Prabhakar (5):
>   dt-bindings: i2c: renesas,riic: Move ref for i2c-controller.yaml to
>     the end
>   dt-bindings: i2c: renesas,riic: Document RZ/T2H and RZ/N2H support
>   i2c: riic: Pass IRQ desc array as part of OF data
>   i2c: riic: Move generic compatible string to end of array
>   i2c: riic: Add support for RZ/T2H SoC

Merged to i2c/i2c-host.

Thanks,
Andi

