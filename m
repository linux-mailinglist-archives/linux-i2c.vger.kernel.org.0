Return-Path: <linux-i2c+bounces-454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5E87F9311
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 15:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C3DBB20DBF
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 14:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B60D2E9;
	Sun, 26 Nov 2023 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+6iWj0Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A394D26E
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 14:21:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC8DFC433C7;
	Sun, 26 Nov 2023 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701008496;
	bh=bbeVb7ta7M772Ne1bflwV3+mRM/2wurmWIiNh6tcStA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+6iWj0QJfs0h1YwQ83hMRo+9OXNC0BQdkLyTpvvPC3silRDagzTjEw+eyajsKb3A
	 yoFHA33MA4PYwE6DnyCNLnuzgtem+5/v3eLeL+T3ALSugKmyEeyAxhnFUuTTscUZKY
	 RfUHVnDMY0Ds5GU6gruIQh1sO6CIHoQMHEoxZSBZbQZFvvqTGXw2NrjJzjpUJTWR2K
	 e37ekt8IZ5y+1/FCIFG2Kq5ZCkasTsClcWTTWUgkRlLgFlwtKzi4LhrqlMfTIB5sxn
	 EWX47DXurf/Ng53kFXZjA1rMCxvVgn8I8owybTOGOVhDEEDCRlmD3s4CF0difBEUHj
	 jSowfqcAiMzHQ==
Date: Sun, 26 Nov 2023 15:21:31 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] i2c: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Message-ID: <20231126142131.5ityn2e3bbpzjqqs@zenone.zhora.eu>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <20231124101619.6470-2-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124101619.6470-2-hkallweit1@gmail.com>

Hi Heiner,

On Fri, Nov 24, 2023 at 11:16:10AM +0100, Heiner Kallweit wrote:
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

Andi

