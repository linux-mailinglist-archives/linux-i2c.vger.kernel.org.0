Return-Path: <linux-i2c+bounces-4042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E861909983
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 20:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CB941C20E50
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 18:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92CC51C50;
	Sat, 15 Jun 2024 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGXy8Fp/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0FC1870;
	Sat, 15 Jun 2024 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718474853; cv=none; b=jKm/wTpJtAItygzPoZs9HVMFFaDPfYimwoGOGMoBRN3SMteqH0ZjHxugwwCibwZm+kxPCdFV0VT1iHVa4hHylF6/3vFLk4FfJEx5whViCpF5xpNcHmNoAxg5bO3RnSvngrFmxV24fwZkqAph6jbYFJa74cJHZBIw4Hhv3l9ZjZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718474853; c=relaxed/simple;
	bh=9NR8eeQbajusaYpez6Kf5UH33FTgd/OTA7c7X3rT2Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWQXxUv0663XI5spzD0kV252MQIlkJr4k1f+G1Mgd9X/DArp9rfMVSQKx2YhXdr4GvmVJ7F9NRG+9v4nFy3tVjHE21s5AszvzCn5EFmwBneBAkaU3lyZrM4ldpj/u1HorJT0EQZK3JNlz8oCNICHsnxp/4RtBorXD/FNLSxAWeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGXy8Fp/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED11C116B1;
	Sat, 15 Jun 2024 18:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718474853;
	bh=9NR8eeQbajusaYpez6Kf5UH33FTgd/OTA7c7X3rT2Bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGXy8Fp/kP5grSvun2zzV/F+91qS3bhKOeS4sVAMgKd4pmXFGpZp8CG/t33rF8dMi
	 Y4s2emXdfnqLFMmer8mEPOZli0e6ZXVmDoRJWDsvOsCQ8sejMGACHIKF7lo2dvS3pD
	 1mmR52pw7PkF0u5joIckyOWNL11CQnyNqFZDwgbVbrNBfrnGFBaGaGBZijyfGasJIB
	 6YmZD5iDXW+pdtIjNhlChCdajvFE5elyGWkttRWPjForO7jYS2FJgRAyHwiwhtw2W3
	 K9skAoRBHcr/qJLTSWVos36g2kRw4y3Y2+7C4AoEGAMdSpbpPyWcyDKZ9Mzeo5unht
	 E6Fz+Fsq5sAQQ==
Date: Sat, 15 Jun 2024 20:07:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] docs: i2c: summary: update speed mode description
Message-ID: <wmzvrtnhtnkc6j37ty3wm7cqsqbunzdbfidefdrgnb5fo3a4yn@pm6ee4ffaudc>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-11-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614081239.7128-11-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Jun 14, 2024 at 10:12:41AM GMT, Wolfram Sang wrote:
> Fastest I2C mode is 5 MHz. Update the docs and reword the paragraph
> slightly.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  Documentation/i2c/summary.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
> index e3ab1d414014..a1e5c0715f8b 100644
> --- a/Documentation/i2c/summary.rst
> +++ b/Documentation/i2c/summary.rst
> @@ -3,8 +3,8 @@ Introduction to I2C and SMBus
>  =============================
>  
>  I²C (pronounce: I squared C and written I2C in the kernel documentation) is
> -a protocol developed by Philips. It is a slow two-wire protocol (variable
> -speed, up to 400 kHz), with a high speed extension (3.4 MHz). It provides
> +a protocol developed by Philips. It is a two-wire protocol with variable
> +speed (typically up to 400 kHz, high speed modes up to 5 MHz). It provides

In a single sentence explanation this is correct :-)

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

>  an inexpensive bus for connecting many types of devices with infrequent or
>  low bandwidth communications needs. I2C is widely used with embedded
>  systems. Some systems use variants that don't meet branding requirements,
> -- 
> 2.43.0
> 

