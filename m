Return-Path: <linux-i2c+bounces-5626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EAD959F69
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 16:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A9531F2518A
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 14:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D0A1B1D41;
	Wed, 21 Aug 2024 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItKnVbeM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0517E18C348;
	Wed, 21 Aug 2024 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249553; cv=none; b=FnvsT9Xfx4foV9OsJNmjdz1xnfD7+YOeuhoGFyCd5WPGhph/1PtboFAO2wz/7JrUTLExyGPGy0etDNgWIs+lDpSoDqPyU+OzuPvG370rD26sGfq6DFW6v0iSeZxrkHW8vu5wrgEADWsDE8eVSNzoV2LH6Nozbtq81W8nQbrCbtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249553; c=relaxed/simple;
	bh=I3jcvaVypFsdEpwGUsVyARkazS1/NlO/kZbtl0OgEZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Orhrc/F47NWvt3XRV8ejd6b4x7TdP29FZaJxSaTNNhgDUMQYzR5LPn5SnjxqkwG8AISd7fRIekBGo77Q/xzSSNghQIkks79Fxz1txhCRqT3LWbYe1DHQrf32K8tsf6W9jUQr6NG0ybPz0FFTQSQ/gnOkPufNgdxs3Qk50Vl/iUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItKnVbeM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DFBC32781;
	Wed, 21 Aug 2024 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724249552;
	bh=I3jcvaVypFsdEpwGUsVyARkazS1/NlO/kZbtl0OgEZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItKnVbeMGCX3E+vgfBOawlIKnwLsXh74zjl3YmXSsQuzaxxZLK+MluXHA8ATy9pmL
	 tdqdnjIsLJ1uJUS/j/qumbiLRxeUbv+l5T0Xyrbbd9itgi6DMp2nxrC+X7AXC36018
	 My5jdTPG8aBk/YxHLb/slnIKgX0LpMLENNqW0c43aCePi8i6L5ZhC9Z/8WTV98YiqH
	 tuE0y/TQXz4j4O683fd7cjuMTN+n942lsH268KCDZuEEgdIK8PLdyHJtheBxNVqe9h
	 grgDz1xGNqg8R2HuDz/x3SgGq7o+/jLjsznMTAhqjdG1SDlw+r9hj3i2wW7/y6l/c6
	 pT0mBqvHq2qmA==
Date: Wed, 21 Aug 2024 16:12:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 00/11] i2c: riic: Add support for Renesas RZ/G3S
Message-ID: <pwgwgzrjx56ftxazloljkhmnptqkzzzvs2tfq2tnrz7y3mfmma@ru7mawibsipc>
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>

Hi Claudiu,

> Claudiu Beznea (11):
>   i2c: riic: Use temporary variable for struct device
>   i2c: riic: Call pm_runtime_get_sync() when need to access registers
>   i2c: riic: Use pm_runtime_resume_and_get()
>   i2c: riic: Enable runtime PM autosuspend support
>   i2c: riic: Add suspend/resume support
>   i2c: riic: Define individual arrays to describe the register offsets
>   dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
>   i2c: riic: Add support for fast mode plus

Up to here, first 8 patches, merged to i2c/i2c-host.

Thanks,
Andi

