Return-Path: <linux-i2c+bounces-15233-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C477D31F56
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 14:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0B3E3019862
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jan 2026 13:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12510283CA3;
	Fri, 16 Jan 2026 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmbvb0jW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6EE276058;
	Fri, 16 Jan 2026 13:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570706; cv=none; b=ubvA5omvSh8N+G26oapS9pifsPA3R7ttcKZO0LYFLQI7tmnIWLla4VtjX6QkYO59fF5bH3Z6Bp8lpz+2NbzihqiMP4DcbW9PG44GlWfsmanxRA4KqSunkzFzvOcNn90BKREybKG79PC1PPNOJ3FhLLdQ4tjmc2rjzbm4c6i61fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570706; c=relaxed/simple;
	bh=YZ21gRQkXORC1LT9ESeDmgdSRH4zCzRBTC0PjE4ThlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dh3F/e8wliZ5mse2h8IJCl4z3UmjJwnHcidw7DcQeGa9lQ/uStt/gB9CWi1dQopJZ43biAXMNSxV8GmvdvjKpExJwrXMcdkIaJ4x3y2fMQMOqfDXakjqIKOBQeKuOT4K2/WmcJrEGdZHoxqF06/nIUjPQiCi4J9kY3Mk05QLjt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmbvb0jW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EDEC116C6;
	Fri, 16 Jan 2026 13:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768570706;
	bh=YZ21gRQkXORC1LT9ESeDmgdSRH4zCzRBTC0PjE4ThlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmbvb0jWpMqtBhs5Ln5D46PGPexzsn5CmU92S7vLRcwnLyBph3x7gKFDo++Ad+TS0
	 omfcJu1K/CQEBczfREACYxL+LR9ZxARy2IQZAxTxSEAZtIbgjTp319Xgsbe4WUx8JO
	 JB7CRXta05/J5XRMdGOyOQPykVt+MQzFpTE0GsQsxtIWz4dWwnOsOsJ0EC17JkPYBS
	 b2hQPFaZj4Sn7kkYwtm8Cuv1nqa1QLwzEJ4hC5JuHMQATaMIS5BdAc0MG/bBsEd6FC
	 TIKJ/okqlWRQ2+pKjcwHDWVfrSPEA1TF/aYfzRGlOUxCM43x1cisAQGXLdozerogeH
	 HBdM5fYXBuOww==
Date: Fri, 16 Jan 2026 14:38:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Qing Chang (qinchang)" <qinchang@cisco.com>
Cc: "Jean Delvare   (maintainer:I2C/SMBUS CONTROLLER DRIVERS FOR PC)" <jdelvare@suse.com>, 
	"open list:I2C/SMBUS CONTROLLER DRIVERS FOR PC" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: piix4: Add support for I2C block data transactions
Message-ID: <aWo_DJRp_GwRG7p1@zenone.zhora.eu>
References: <458484CD-01AC-4155-8687-D628A19D6493@cisco.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <458484CD-01AC-4155-8687-D628A19D6493@cisco.com>

Hi Jean,

any thought on this?
On Tue, Dec 09, 2025 at 03:30:31AM +0000, Qing Chang (qinchang) wrote:
> From 329a0f951071c03b75a92e6b3c5746d9ee002935 Mon Sep 17 00:00:00 2001
> 
> -
> From: Qing Chang <qinchang@cisco.com>
> Date: Sun, 30 Nov 2025 19:30:36 -0800
> Subject: [PATCH] i2c: piix4: Add support for I2C block data transactions
> 
> Add support for I2C_SMBUS_I2C_BLOCK_DATA protocol to the PIIX4 SMBus
> driver. This enables I2C block read/write operations where the master
> specifies the transfer length, unlike SMBus block data where the slave
> provides the length.
> 
> Key changes:
> - Add PIIX4_I2C_BLOCK_DATA protocol constant (0x18)
> - Implement I2C block write: first data byte to SMBHSTDAT0, rest to SMBBLKDAT
> - Implement I2C block read: pre-specify length, read first byte from
>   SMBHSTDAT0, rest from SMBBLKDAT
> - Update piix4_func() to advertise I2C_FUNC_SMBUS_I2C_BLOCK support
> - Add IMC notification for SB800 series chips
> 
> Signed-off-by: Qing Chang <qinchang@cisco.com>

the commit log is a bit screwed up, but nothing that can't be
fixed without resending :-)

Let's wait for Jean.

Andi

