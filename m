Return-Path: <linux-i2c+bounces-459-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C197F931D
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 15:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8260EB20DD4
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 14:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C76AD2F8;
	Sun, 26 Nov 2023 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUT6WDXV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90CD2EC
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 14:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7DAC433C8;
	Sun, 26 Nov 2023 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701008700;
	bh=dogDavh1wYyxSIDTwKV72xzE4E1oVnU3xqsG8+isZx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUT6WDXVFRokZsKFXmfL0E0C9NklxVXo8CphwMT9h4Jz5IiiOJXz4nlrUSv4caodC
	 Tr5Daga56Eebb4BwjzhuERQ8nlC3WJsc+0s+8nQKsKE9BLMANFl62I/C7OoRRkZoif
	 pUm2bpLD8VVHfPR55CG3O0N4wKBFE9Wq2PcFl8y7t459sVOL3GAUIV6AwFsCWdGFsO
	 YgWYmnDh75BfYbsCYQAFHFULBpRgxi9qQ1roJRtaK9yvGVJb+ESkEEeBnr3et4JY5q
	 7mjPi4xLjCyBTSKcBKbdiIYeRibksBbXKp853fdvxPz2Jdb+PHS6+Q3fi6s6OBVUwD
	 6E3SceCn8FVsw==
Date: Sun, 26 Nov 2023 15:24:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	linux-i2c@vger.kernel.org, Rudolf Marek <r.marek@assembler.cz>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] i2c: ali1563: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Message-ID: <20231126142456.ul6d5fefszszdhjq@zenone.zhora.eu>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <20231124101619.6470-10-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124101619.6470-10-hkallweit1@gmail.com>

Hi Heiner,

On Fri, Nov 24, 2023 at 11:16:18AM +0100, Heiner Kallweit wrote:
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

