Return-Path: <linux-i2c+bounces-456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEDA7F9316
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 15:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 621B7281209
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 14:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E842D2F6;
	Sun, 26 Nov 2023 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV53LiJS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B9ED283
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 14:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988CAC433C8;
	Sun, 26 Nov 2023 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701008613;
	bh=nJRLDScxE9MREoMy7ECO/mS6jpoglTXrMPk1fUXKulI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AV53LiJSewklLVlZKiAj10KL6A/ozscKPdmzAayQoLtrnCnn4z+WG8huk+x5leLiR
	 VyzTFNhFJFc7o1N7VJ5U5crGErjBhQhq8nMXb6tgZzVbHcyuB8m56oFBd5ku9hI0CH
	 3rMUzNj9lYpNLZbqBWhqBdCe0RM1W3t7mqMhZmJv5fp+sI7iXPTFaueLwi+KABAqgE
	 o+EJWk2JEGM7026TpE2UBQB6BoEhtpeQyqiW8JsRao+Ik9W84Nlxeik3Mh85RH3ULw
	 0+SpF1VApUXXs9eXX2wOrwcBq88otaMQJM6/Rj/RPqqQhvmSErYPoNR/YzJvl/I1nf
	 tIoWjDV+3sLPA==
Date: Sun, 26 Nov 2023 15:23:27 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] i2c: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Message-ID: <20231126142327.fwi5pzr2apjyhicz@zenone.zhora.eu>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <20231124101619.6470-5-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124101619.6470-5-hkallweit1@gmail.com>

Hi Heiner,

On Fri, Nov 24, 2023 at 11:16:13AM +0100, Heiner Kallweit wrote:
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

