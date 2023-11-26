Return-Path: <linux-i2c+bounces-458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D31F7F931B
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 15:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2EDEB20DC2
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 14:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3794ED2F8;
	Sun, 26 Nov 2023 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8PP1NSM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE366D2EC
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 14:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D0AC433C7;
	Sun, 26 Nov 2023 14:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701008674;
	bh=E73aNZkPWZQbs+CRX4L7x72nEDCK9HoTHpreFGTvXBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i8PP1NSM5KVvCkhWRTqtmfIJlhhu7S3e2PK1Cm3YSOOISTLVMe3Oz53mbownkEdE6
	 R3hdsh4149I5VAtwgWjj8cW0fph+fBy4P4s2pP8Myh7sr0yIU6gJW5GhUtgW8JfDh6
	 mPZGRnMZBKeZPdzPd9Zu42vR2zlQPftEG3pgZ0d3NcW/5oAaht2GxGeJu8ft4Dg1GS
	 rWoN9pdWWwQmdX3mbeftKxr8Qr0Vea05fpYMNBl/t8df18+P4YLfaccB3fTr/p/mbT
	 yG8Q66SdoZUfyvLh4lbTD6IBnnz/9BMo9AG00+aV9eo+fIq3iS+sN9BetGXQeqUMr9
	 krN4ePDN7G7aw==
Date: Sun, 26 Nov 2023 15:24:29 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>,
	linux-i2c@vger.kernel.org, Michael Shych <michaelsh@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/10] i2c: mlxcpld: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Message-ID: <20231126142429.b7xwle7so43rtgwv@zenone.zhora.eu>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <20231124101619.6470-8-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124101619.6470-8-hkallweit1@gmail.com>

Hi Heiner,

On Fri, Nov 24, 2023 at 11:16:16AM +0100, Heiner Kallweit wrote:
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

