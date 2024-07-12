Return-Path: <linux-i2c+bounces-4948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E1292F2E6
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 02:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 894BB28410E
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 00:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC96621;
	Fri, 12 Jul 2024 00:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfi1kJR2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E31173;
	Fri, 12 Jul 2024 00:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720742536; cv=none; b=CEHj5oHsE7PYdYXkabq+CL3ymWAoMUggcVDFn2Y90iUAgS3I81eyiA2/S2w6VUKwbUPDodanZuZdRYXwQzNMY5IiHsDmuUA7Ag/ITwZAEHxCdsbQeRNNFzLk/4fw0nc4FTGpJEFoe7gfMjpl8k5x1scQGItP8/y7qmbS0NUQqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720742536; c=relaxed/simple;
	bh=Pj6CV5nFkkKCcUgoicfilyAIRMUovgedtDnOMpNlx4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZCSp5e0eVDPxglxKl14/G9k3GDJFmZxIH7QwHjJjrRySEEO8LShj4pz2x22JajgZ2lqSllL05UKRYrnjPA64U2Ed6ZRMIxaALbMymxA9rQSCBUOUDDQ5Rm0CKen56z2HlBcwgEyPTN/qAiiFf6iONwhEplu09HuF6tdaV7VY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfi1kJR2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404F7C116B1;
	Fri, 12 Jul 2024 00:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720742535;
	bh=Pj6CV5nFkkKCcUgoicfilyAIRMUovgedtDnOMpNlx4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfi1kJR26ByBAfe3tbzfXXfxi6CKTQRsNQtIkdB7Jy2otHzXaa7zNTcTidHEZOxcz
	 IqyY07Ddl0+YUq2Hy5EwIzhXjAyHkg6UikbD1DJsc/n9LgR/0XzTTTOPX1BhEEIIuO
	 YZ4bNhxa6xKuy+y1DYv6tiWcb1OG4t7RxZJUtXKt4tbeegyD8CXkGRTun4FAmfu1MY
	 mUvk9MMoYBk6z8mYMpeyw1qWe/gPn9cpbKtFRCE7/513VhvLVTfdDDqgOClMo2tlJa
	 C2iqH0tAOcGiKt4z/WVs4+nVL7jK40khF5lz9nPBJvcgdipDi6jD1MMiZrFaepq517
	 ENWfdvfRlGuHw==
Date: Fri, 12 Jul 2024 02:02:11 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 0/2] i2c: smbus cleanups and SPD support for piix4
Message-ID: <sgeavkqhn2i2n7luiervclpibxyaroab5pmcdltmcrxvl5yaeh@ulp3clqgv3ix>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>

Hi Wolfram,

> Thomas Weißschuh (2):
>       i2c: smbus: remove i801 assumptions from SPD probing

this is yours...

>       i2c: piix4: Register SPDs

... this is mine :-)

Do you want me to pick them both up?

Thanks,
Andi

