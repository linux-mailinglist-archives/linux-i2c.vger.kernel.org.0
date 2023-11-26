Return-Path: <linux-i2c+bounces-457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0C7F9319
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 15:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 153181C20C97
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 14:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5A1D2F8;
	Sun, 26 Nov 2023 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqrLjtBH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F03D2EC
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 14:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C542EC433C7;
	Sun, 26 Nov 2023 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701008646;
	bh=TQH4ghouJGjb8mIp0Ldpj0f4sZlFwq3FfqG6FJSDWew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nqrLjtBHN+4Of/I3Wxrc0cOeuSAdLUlIUyvZxkoIe1FGKFqVU1uNPqYlOeAyNH0bA
	 mILCBvzTKQGFjtNguNge3hCBj3OWRJb13R3SxCAGC7qxLGS4ur0WCfu3M1OnHKAXfz
	 m9czgtw3Ue8ICAnXbTzNXIJdH9tGMT+Il9dmAAgvZhj8PLNHNJXK9vLOQ8g5B8EzFs
	 ClscsWyvOwbR5kUns/qBKaLCPTlxu0LeNoU9n+oRSCJFK6Fa8ZOumU65JFcrtbgLBd
	 tErJb/2Cs3oxs0PVGxPpAsK34UTM2gS1zoGEo/evW6QUShZdyoYgUQbgV5Pi6ltN1B
	 YYF8luL7+PwUQ==
Date: Sun, 26 Nov 2023 15:24:01 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/10] i2c: gpio: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Message-ID: <20231126142401.ypwejbwcmac72gdq@zenone.zhora.eu>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <20231124101619.6470-7-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124101619.6470-7-hkallweit1@gmail.com>

Hi Heiner,

On Fri, Nov 24, 2023 at 11:16:15AM +0100, Heiner Kallweit wrote:
> After removal of the legacy eeprom driver the only remaining I2C
> client device driver supporting I2C_CLASS_SPD is jc42. Because this
> driver also supports I2C_CLASS_HWMON, adapters don't have to
> declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
> It's one step towards getting rid of I2C_CLASS_SPD mid-term.
> 
> Series was created supported by Coccinelle and its splitpatch.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

