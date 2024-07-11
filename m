Return-Path: <linux-i2c+bounces-4933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8B92E8E1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 15:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 859FC1C211BC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 13:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D8F1607AA;
	Thu, 11 Jul 2024 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0YJ6oHc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2B15F3F8;
	Thu, 11 Jul 2024 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703129; cv=none; b=anzDHcmdyXk8ObO27Ro3NYSezcDR1YTJl9rpDUqt5vHT+ybTVhZ3N8oz8EosPkq57zbuKmenGCVP9L+0Pqh8jVCkyK/u2k9bmH1nd4MW8y8nxSojUSLy25ASH1JTczDUIzgaUkk/ZxCW2hK5KnEMXSdWIe21fnlmt9ehz3WE/R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703129; c=relaxed/simple;
	bh=2s9Lj+iHBNIUcSIKOPmbypulZxr4z9CS1ZkFflss1Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jeGxKn16VGUGG+tivvLa49cs623B/zhMEYTrx48fkKlBd33x/AIY6tddasKwSc1GVLYkLYmcJqn1+XIHMcFv423zCecT5/PWQCm1gghVJyj2HoYrahymJQr6BDZz3Y2jW1bhJvWXgGrM3DWTvwRfuWW1vGg2wgQAaEs3G0pQKkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0YJ6oHc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1B5C4AF0C;
	Thu, 11 Jul 2024 13:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720703128;
	bh=2s9Lj+iHBNIUcSIKOPmbypulZxr4z9CS1ZkFflss1Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0YJ6oHc24Z+aWIj22429307MtqNXRObYG7VgimAQ8rPTlvPIGSYP+Ll2qTxT93uP
	 mHZeLWoG7cA5/Sh8SM+CwypoH7/HL4vQmtzz3KM5z5dLLcYm7Yyv/cPmWDXMtPfA81
	 4dYeoU8eu91SLG+jVV61n3jeQRadKnvUYGFS3ajgZzvV1LgWyrGjzlBvDrIAMdLeFF
	 9FhYzFdiA+QD3N7AS3izJYsWU/FpLDWt8BUsYeKI72tyjohFfVSgMe1kQnhGIhO3mG
	 0LHMKDMVB019a2APLknVCWCzfstPeM6W2TtaaqJ/E4Ak5yeClvOul3mfIUyn32z51C
	 vkQyHFICmSBsw==
Date: Thu, 11 Jul 2024 15:05:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Hans Hu <hanshu@zhaoxin.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 56/60] i2c: viai2c: reword according to newest
 specification
Message-ID: <6arkyo4dg3k2ya6oitgv4ajcd55ncf2xfgm4o76jfbkvn4wca6@7qf3kjaq5sci>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-57-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-57-wsa+renesas@sang-engineering.com>

Hi Wolfram,

> diff --git a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
> index ab3e44e147e9..95dc64902b7c 100644
> --- a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
> +++ b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
> @@ -38,7 +38,7 @@
>  #define ZXI2C_GOLD_FSTP_400K	0x38
>  #define ZXI2C_GOLD_FSTP_1M	0x13
>  #define ZXI2C_GOLD_FSTP_3400K	0x37
> -#define ZXI2C_HS_MASTER_CODE	(0x08 << 8)
> +#define ZXI2C_HS_CTRL_CODE	(0x08 << 8)

They also look like driver specific rather than hardware.

Hans, can you please confirm?

For the time being:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

