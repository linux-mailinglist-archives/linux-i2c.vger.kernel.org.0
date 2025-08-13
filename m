Return-Path: <linux-i2c+bounces-12286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF4AB2531E
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 20:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F001C84451
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 18:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FBB2E9EDC;
	Wed, 13 Aug 2025 18:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H9azEvDI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5F91DF24F
	for <linux-i2c@vger.kernel.org>; Wed, 13 Aug 2025 18:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755110266; cv=none; b=FH+oye1qwdGl+8tN3BGNBiSnIDHQeJAMpXOl2NTj70UIT3n3CtKIifdPZrIb9jW2F6aQLRsFoRmuMZ3WrxwTO1F4Qxcs3tn++9cOLH/mNjtWr1sfZ/QGxC0uZHQ3wl5zLnqP+oiW/HZ+QZJATQxPOKxW3jcQVtwgMXEjHtkP71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755110266; c=relaxed/simple;
	bh=F8Sl2bDnDnjJw+YG6ufvhntOT5nenuZz8vX1IsEg47A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aF0EfaUEaLiJpw8ceepIxQLKdMj9WK8oC8lqvFjMeTrSJYZ0xwUET62Ck+bkIE9UA/F/4bJ5RnQK3Yo4tpu0CaA3wPifvUvDXJfOHFt5bkKn/WUiT/XyfOTrqizIFc3R1Tb9ZVL5jYJJ9g72jDsBpf/gIBkoD3vVnik02rQJUts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H9azEvDI; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qLoo
	IQeM14qVt2R3iNMksVO2OoAxPBm8EDTL1+MXpRQ=; b=H9azEvDIg7LttMudtBUl
	AA4bNamdTvpOJPCzbrVX86FzCeS0jSfzp6xFjf2Esz5CSxtTxCgw9hbF8qWDjd5X
	GgNQeZz/tQytXid9g7PqvMHPFqfVQNd53hHIS6E3fq+ewo2Kbi9BOrTOwKVLXd7p
	ny4dXs9GUbu4p+1ruQfUk3hMcHpX4eVSwL80lXqxD4g5ljUb5652hLJKAweYhzWY
	Y5PedHtFyv9G9nlRPiw/TORSC3UTfn408axsciOH88WHWQ6xA9zM/tYWVTItdH8l
	+vKG56KIcJkfcXkedq2fdtFVFJ0jva61javWTIJck1GyfoojpE5wqJL/zQ9kcOuQ
	cg==
Received: (qmail 726888 invoked from network); 13 Aug 2025 20:37:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 20:37:39 +0200
X-UD-Smtp-Session: l3s3148p1@jMyLc0M8Rr9tKLNT
Date: Wed, 13 Aug 2025 20:37:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, broonie@kernel.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 7/9] i2c: at91: make it selectable for ARCH_MICROCHIP
Message-ID: <aJzbclxOoHqQ7QAs@shikoro>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-8-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813174720.540015-8-robert.marko@sartura.hr>

On Wed, Aug 13, 2025 at 07:44:43PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel TWI I2C, so make it selectable for ARCH_MICROCHIP to
> avoid needing to update depends in future if other Microchip SoC-s use it
> as well.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


