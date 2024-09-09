Return-Path: <linux-i2c+bounces-6435-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CA1972219
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 20:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 556D428421C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 18:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB3E17C9B6;
	Mon,  9 Sep 2024 18:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8Y36nd4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DEF170A16;
	Mon,  9 Sep 2024 18:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725907909; cv=none; b=r4h+tlLt9gblmbK2XACO6MnDGCR8LmdfDulTgPB9GY4yC3y76WHnO3puViiLoQZtE+itMZBXpalER5yfIDThYqej/nMN8r1qgm18pOgdqocSPK700DHMRuKWD3lAY9CV8QglDzTEn0MC2vbZYnfpnZXrOcApUype5R/iPqesqiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725907909; c=relaxed/simple;
	bh=x8XaR/gudDiWhJBM2f+r39sJh4+TjDNYAqtwwEVnMY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7fqyqEBXRj6CU1aDuFcBF0vOU9KiTXljSA2G/MQEoMiCrZ9QQYno5PkEofuFAasNKT9Ntp1bXREADJQ8qsR4xIrKY5hHlCkhElOqdGx8230ohPvBZgDbhBbRg1dF0KAcEFzM4tpdIyGIF529izH2JB1DZ7QMt+2SfK+ePZsNyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8Y36nd4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DEEC4CEC5;
	Mon,  9 Sep 2024 18:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725907908;
	bh=x8XaR/gudDiWhJBM2f+r39sJh4+TjDNYAqtwwEVnMY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8Y36nd4g0fQknHpUs/bzrY2zZkZLGoqm2qgZ9VBIXrnPCypbKWkZcSbAJk55KfAO
	 I/B/BkCemUYUozH70k1ZQUt6Pidg5QUAYAJFhsbaYRXuHiMsnNdkqmDJPmZXlSJGJk
	 hZI5n0CZmdkMbW8zshEtM7ZuwQo66roESgmEX/MB4zVpD/JtsM1o25ZM9iqZg/0Uw6
	 0BNf0Xx37O4A8ZQe/Z1ucbEOzdNsSRyw11aFK6gEDQZbZcJ1JPBKTLu/X2Ml6P/o0c
	 c1QZuGF30hwyv2RRrnqauzPPmtIDvUjUxPonbfWlJ5UuUwGEuSpOy5pE0TByaLTC9J
	 uJ67TRaa1YzAA==
Date: Mon, 9 Sep 2024 20:51:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] i2c: rcar: tidyup priv->devtype handling on
 rcar_i2c_probe()
Message-ID: <cfecio36d7exwlf5rz57o4eynzxfjev5v5zahsmjomu6nczlq5@rm5mflt24pmg>
References: <87a5ghsaii.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5ghsaii.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

On Mon, Sep 09, 2024 at 04:42:45AM GMT, Kuninori Morimoto wrote:
> rcar_i2c_probe() has priv->devtype operation, but handling (A) and (C)
> in same place is more understandable ( (A) and (B) are independent).
> 
> (A)	if (priv->devtype < I2C_RCAR_GEN3) {
> 		...
> 	}
> 
> (B)	...
> 
> (C)	if (priv->devtype >= I2C_RCAR_GEN3) {
> 		...
> 	}
> 
> Let's merge it with if-else
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Merged to i2c/i2c-host.

Thanks,
Andi

