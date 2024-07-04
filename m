Return-Path: <linux-i2c+bounces-4645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9A8927EC8
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 23:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBC4C284D53
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 21:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039BD14373B;
	Thu,  4 Jul 2024 21:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0dO043U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB55F2BB06;
	Thu,  4 Jul 2024 21:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720130253; cv=none; b=PU/RnRwIcABjog87H6rjMAdjB/oS98y9iLX+ge7unDLy28r5sKnRG870Y78+4OzQjmwf8udIcPItadOzWQKEMz6oW8dj7TtwtqWjOvQH58Skge7AMw6F4yQLQydU+bt7eAk5pR+fp6TQf5nmVzPNJNpGTKaY+9vVHSkqgm8Cm0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720130253; c=relaxed/simple;
	bh=zkBiMl+ux9VR3M1YvSeomW7EpBU0lFts8Fs40iTv7Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=un3/T+RNVUvyq+AANRWIWdr2jedSL3koAUdgH/Nxshma+tTZG+dB4rnyE85MW+jlVZb3KC4X0U8AVWj0piWlsguHp8Lo4z+dz/U7r23TA/0T2Nwjus5z8sO7heCA7s0t4Zw2WvupBCiosIEvdjn1p6y9ovAR6x+Ho9v6PnRuodw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0dO043U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ED5C3277B;
	Thu,  4 Jul 2024 21:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720130253;
	bh=zkBiMl+ux9VR3M1YvSeomW7EpBU0lFts8Fs40iTv7Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T0dO043UuO/ykS6x9C5hdiYasXYr4VD+q7mxPHtR6Q563zPUgu+od+I+baQIuVSKZ
	 b7xwupB4cfOLpZolCIkB6NvTcfE7FiA+Ran44ipldMbWbjElBkHYSuFDaS5bViZsdM
	 +E19kFixCEL+Ci/yeMckHJ3bKGmcGOzdC+wgkI00ghPx3FglWk3ol0rlQKmowaMPja
	 kPhhrGFyZr0bpw3QrBx2+pNsTPcDWfMsMQgngV6vjkF8auJ7WoVX4TKqAGkBocpRgL
	 0vgLVaonHMSWmn3WAyQGF5WsWEwmig0jFkCUd7V3yGcy2ggTYHMk6pNPCu6Wis7xZh
	 KqIAfAFDvShdQ==
Date: Thu, 4 Jul 2024 23:57:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 1/4] i2c: smbus: only limit max banks to eight
Message-ID: <2mtehll54bpuozsjswynp2xron3dfxknsixnouovby2nxlnrun@3sxdqqbvfr22>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
 <20240627-piix4-spd-v2-1-617ce47b8ff4@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240627-piix4-spd-v2-1-617ce47b8ff4@weissschuh.net>

Hi Thomas,

On Thu, Jun 27, 2024 at 07:48:11PM GMT, Thomas Weiﬂschuh wrote:
> If there are less than eight slots in total,
> only probe those.
> Now the code matches the comment "..., then limit slots to 8".
> 
> Fixes: 8821c8376993 ("i2c: smbus: Prepare i2c_register_spd for usage on muxed segments")
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

I don't see the need for the Fixes here... was there a bug that
has been fixed?

Thanks,
Andi

