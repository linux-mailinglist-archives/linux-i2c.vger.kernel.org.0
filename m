Return-Path: <linux-i2c+bounces-13831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D08C0CF1F
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 11:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E45819A3E93
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Oct 2025 10:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59502F4A14;
	Mon, 27 Oct 2025 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="hZjW6izf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from hall.aurel32.net (hall.aurel32.net [195.154.113.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84A71DF252;
	Mon, 27 Oct 2025 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.113.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761560682; cv=none; b=NgIy35qKJA73a/OZUYXCZI0nZ5oPPSIn8DeRsffuk6g2U9RjAkgQMnd92SWaTIOYu5Pa2roYzIHGrhpHqFIQIuVvexZ1EEX3RIak+1gUFOQ1gptVCkg5RAmH/3UMJrTfoXEKd2BZZVUeBLM0JC7jZVa4NlMeHwr7sEtf12zxhBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761560682; c=relaxed/simple;
	bh=2yo3UHKNtEQONX1tdbT7+n6bFy9xuftW/eyliqeTrTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZS8CH37koDRW/nGbiZKJlbdNfbmWpR1j86YIQU0K0DyTjt9FsgGnbEWf4Y6p4OHojzBrB7UV8rXe3z1SNlYGqSQSrQtZ2tPH85hdrT1Xrc0mgZdt0o5ttdxfIcczpAhBPlMVmmtMgGBi5eUcJagjCsXeyY+jEOnmzIxjAO+XatA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=hZjW6izf; arc=none smtp.client-ip=195.154.113.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=LNaVRs2nb2TCpZYcKwloTHzyssBQhUNg2F8D04En2RM=; b=hZjW6izf5L5wREd13n0lMqkcRE
	H2U7GyJB5y/eTg21mhb7eRy57Npj8PhsoX5y6y/9cKnbeV/edYmpGuCWkVQL8I02ejHV9yC1Hn78I
	WO/nEJIjbAJf+vM/Wy3yFr5KUtqZNX+40RfXh28TgkBGDh9KEUdOFtncOjNXTFsh/DP/nRS8XvTP2
	zdZwGbf4PDmwQP8+6i9+XOhg30PD4oJxYa8O9QJmclDczhHw1yxjGk/9ZYQsFJyqStpnjWTwkw7cm
	IfzZlQdgMyx+5DloRIsJs6xyk40yOcrDt2pU9OvZzjQb5BU12AhGE7koBMqSEjkTB01xRO57vRw8n
	XT9eNOUg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1vDKOk-006ms6-1Y;
	Mon, 27 Oct 2025 11:24:22 +0100
Date: Mon, 27 Oct 2025 11:24:21 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <aP9IVckJT-k2_O4K@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

Hi,

On 2025-10-27 13:48, Troy Mitchell wrote:
> Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> merged, the driver would fail [1] when COMMON_CLK was not selected.
> 
> This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> patch has reverted by maintainer [2]). In addition, the Kconfig for
> P1's two subdevices, regulator and RTC, has been updated to use
> 'depends on MFD_SPACEMIT_P1' instead of 'select'.
> 
> Link: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/ [1]
> Link: https://lore.kernel.org/all/sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx/ [2]
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

I think this series misses a patch to add a default value for 
MFD_SPACEMIT_P1. Otherwise it doesn't make sense to define a default 
value for the ones depending on it (RTC_DRV_SPACEMIT_P1, 
REGULATOR_SPACEMIT_P1).

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

