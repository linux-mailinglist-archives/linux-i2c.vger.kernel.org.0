Return-Path: <linux-i2c+bounces-14473-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B42BCAE4A9
	for <lists+linux-i2c@lfdr.de>; Mon, 08 Dec 2025 23:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79743300CA96
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Dec 2025 22:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB38C2FBDF2;
	Mon,  8 Dec 2025 22:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rt24g4my"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3373A2F4A16
	for <linux-i2c@vger.kernel.org>; Mon,  8 Dec 2025 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765231815; cv=none; b=Le5KLBY4gbI3jI5z3W8fAckbFo51tHkLN+YFlaDahnJIblUifMFqdW9yyXLq3A1dFqv7Gyje0y7pFOxC93sFSK4UDsrCwh8uGVKHWwePPWCTFAaYTyN5WQe8kxXBTP8XI9LLHV4GB3ltNWg2xcaH/a7I7UleKAPv7KOKTLYsTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765231815; c=relaxed/simple;
	bh=zFHEO13RL+zJ5zTB0G4JLuS740G9rywMqOvHfsbtQVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+ub4itv8KFJDFw8K59A7byeTFYp/FKuqugrL+qmPLcdTC6uplsw/rSOZH7eocHgu1q6zrh0mzBG2JY6oQNTBtBqRRya1+To/SY7r9hiMmBh4tXHN/ddbhkHSfzYXftjYqEDpCnwlHt5hvW0QzGWwxjClriMHjLiclL2dK5URVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rt24g4my; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B9DCF4E41AF2;
	Mon,  8 Dec 2025 22:10:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8EE9B606DD;
	Mon,  8 Dec 2025 22:10:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D1B3103C8D5C;
	Mon,  8 Dec 2025 23:10:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765231811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mWYWUqUd6OQt7ZTmYi9XvKs64pHlmAY9QPRYKKtCcFM=;
	b=Rt24g4myiXVnNAovrP9jmwGnftV0vDJl4Pb6W9vWLh7F7cxwRKWvMSxvvJilWNvYoBFu3Z
	EQ2LIYI3Zzn53izvjSbY3Bqm/c6y/2svxnL2eelGeqq6n+hovdbER0s10q12AtvO6texI2
	1pnme6q7Krn5NRMlM5Lrl9wOQUONd25MzixAhudxvBzcPVgx6LOm4utGikX3ySF0avryUb
	RKHvAfiBuyjK70bta4tdNw+wmokJzX8dS+NPm5DficVcGyhgOviL9vJ9NBsuBIYAweJIFq
	iwslDl/nfwQhPUsC0l3rB1MPDauYaHnuVVXcn8GMDc33BzGSeJt9HaDVWurhjQ==
Date: Mon, 8 Dec 2025 23:10:08 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 2/4] rtc: spacemit: MFD_SPACEMIT_P1 as
 dependencies
Message-ID: <176523152359.342815.11295458688296790112.b4-ty@bootlin.com>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-p1-kconfig-fix-v3-2-8839c5ac5db3@linux.spacemit.com>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 18 Nov 2025 14:08:06 +0800, Troy Mitchell wrote:
> RTC_DRV_SPACEMIT_P1 is a subdevice of P1 and should depend on
> MFD_SPACEMIT_P1 rather than selecting it directly. Using 'select'
> does not always respect the parent's dependencies, so 'depends on'
> is the safer and more correct choice.
> 
> Additionally, the default value depends on MFD_SPACEMIT_P1 rather
> than ARCH_SPACEMIT.
> 
> [...]

Applied, thanks!

[2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
      https://git.kernel.org/abelloni/c/16bd954c9336

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

