Return-Path: <linux-i2c+bounces-3086-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE18F8AFD0A
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 02:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EFC61F22B62
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 00:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EAD2F41;
	Wed, 24 Apr 2024 00:01:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9264A393
	for <linux-i2c@vger.kernel.org>; Wed, 24 Apr 2024 00:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713916891; cv=none; b=CC+5xlJzB4srlGyqSGNnH/xukF9hnrKTVVuFr2H9CgFuGjlI/6un9MXnjuAm0ow+FsTeneNrnIAOlUwdR4h5OZ3/QglbBJiXADy2GC5YNKzGKtKlFSGR6PXIge62zZlRBkxo9cLC2S9AhESOODQyzslAmmOzh19lJZ0gYU4Nwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713916891; c=relaxed/simple;
	bh=yWWZtVuFVmsAHihQ0rbT6L7WRYIXUYZVJCHeb4B1eU0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyVXeqO9H3/GuHCjStgi7G8njZob++I/lIPPR/LXLrn3+wsikhK4lCwpiaIXk8WnDL5i3NpDuzdXIv73bFWZ12dkNrd3UWsxPmZ+HqKq3K74fD+uiNc6uMmcCum3lGpigOzdpy62bahuiZIsD58OH9aezIN8m9hf9U+7e2vJpdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id cb8c8f3e-01cd-11ef-abf4-005056bdd08f;
	Wed, 24 Apr 2024 03:01:26 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 03:01:26 +0300
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	"open list:SYNOPSYS DESIGNWARE I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:WANGXUN ETHERNET DRIVER" <netdev@vger.kernel.org>
Subject: Re: [PATCH 3/4] mfd: intel_quark_i2c_gpio: Utilize i2c-designware.h
Message-ID: <ZihL1mb1OzwdLSvN@surfacebook.localdomain>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-4-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423233622.1494708-4-florian.fainelli@broadcom.com>

Tue, Apr 23, 2024 at 04:36:21PM -0700, Florian Fainelli kirjoitti:
> Rather than open code the i2c_designware string, utilize the newly
> defined constant in i2c-designware.h.

...

> -#define INTEL_QUARK_I2C_CONTROLLER_CLK "i2c_designware.0"
> +#define INTEL_QUARK_I2C_CONTROLLER_CLK I2C_DESIGNWARE_NAME ".0"

So, if you build a module separately for older version of the kernel (assuming
it allows you to modprobe), this won't work anymore.

-- 
With Best Regards,
Andy Shevchenko



