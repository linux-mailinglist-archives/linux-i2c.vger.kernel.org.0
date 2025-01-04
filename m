Return-Path: <linux-i2c+bounces-8913-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB45A01130
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 01:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B97616455E
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2025 00:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108231C5498;
	Sat,  4 Jan 2025 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cpn7WtY/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43781C5491;
	Sat,  4 Jan 2025 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948819; cv=none; b=W3MyFBOYJ4O/h4PhHqZyhS3ETCr1hjFDEAi13b9PhkoCdQvtQg5EhOVHoCAISoxh6UFtQR/0Zl5Xsy8AjFXO4bQSiCudsw08tj0bV58vSISNEr8ZlUTVi7d900PWVtmaFqpju7k0deVijmX4EVNcLasdRIJUScrkFcT1EYAwqXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948819; c=relaxed/simple;
	bh=Et6JqiybWk9MSa1Zne4js3r2VxnP/jj4oz63xhlzhuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEXmPK7RB0ku5tQ6y8v5PNEHa6R6Zfc5rhzT1koRxxW8LrgcHQZlzaZKkC7v4WGDQUWgbawQ9rPW3Hd48u1m2+Zugz6baqlMGmhoWu9nLsaAGYHCiJyOe/jSbBuB3H0barzJxvMY5Zn/ZAk3jlONYKLFqJS5fHhyWd0UlRjEr1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cpn7WtY/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8879EC4CEDE;
	Sat,  4 Jan 2025 00:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735948819;
	bh=Et6JqiybWk9MSa1Zne4js3r2VxnP/jj4oz63xhlzhuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cpn7WtY/kz5+PtH14NJRo86nlCfALN85ERUjlRAFZ/3i60BaBXTQTN8OU6U4NdBhW
	 d9cK0wBQcpqsujZbaqPCzQfZfMWcnsNsiMPkyYnxjS0WbsIkw2UKxLXr3VEqJXr0Lu
	 D4kPrEjWZjSwEF5SKUPfTtG/9ax0vH/M/7oVt/SOaVJn04li22SDJRvW6Ewu3RHVYq
	 gienaPWVNbJCw8W2N3Ztw+6AQN3cyx1cInSi9YB3d165c8C6BB/bpdVWLCJ0WSD+TJ
	 Yw0guNIb3ilpwghDiL5T6RU/MpDbI7iftgd8HMuCg4ZKf20E/mYa9KhYkNxuQf2H5l
	 i1jq7+Wxt8YnQ==
Date: Sat, 4 Jan 2025 01:00:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] i2c: imx-lpi2c: add target mode support
Message-ID: <zjgclpreptiv3vtc3bstsuupdrv5rtydzedx2ktgjuzumdtosr@z6xlgawi7lie>
References: <20241230033846.2302500-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241230033846.2302500-1-carlos.song@nxp.com>

Hi Carlos,

On Mon, Dec 30, 2024 at 11:38:46AM +0800, Carlos Song wrote:
> LPI2C support master controller and target controller enabled
> simultaneously. Both controllers share the same SDA/SCL lines
> and interrupt source but has a separate control and status
> registers. When target is enabled and an interrupt has been
> triggered, target register status will be checked to determine
> IRQ source. Then enter the corresponding interrupt handler
> function of master or target to handle the interrupt event.
> 
> This patch supports basic target data read/write operations in
> 7-bit target address. LPI2C target mode can be enabled by using
> I2C slave backend. I2C slave backend behaves like a standard I2C
> client. For simple use and test, Linux I2C slave EEPROM backend
> can be used.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

