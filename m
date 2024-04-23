Return-Path: <linux-i2c+bounces-3084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1B88AFCFF
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 01:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E3B31C20CCB
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 23:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BF054663;
	Tue, 23 Apr 2024 23:59:09 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0259A53E1F
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 23:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713916749; cv=none; b=iElkWTkARjbtekVtcIWvF4V1sMffSfvSmb/imHtLXWztaCc3LYPPqexwvMgirKc8sOeJG/nIJpsoWwjdT6EazGlprWFicNOITU9qft9tNAchunMP79R8uQ+uaAs3xXVRbMZFkUEUS0SLHMu1EcD5dqj/BnvT08oNpBFqHmo9n28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713916749; c=relaxed/simple;
	bh=v5HpaNzjnS+nzagCgPnhRXGNmlFHAWypeXId0ro+rLs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ow8hSuiRg7R+YYwHZStA6ALyqcCnzM7PgH9D/HpXvJbY/Pdk1b0g+Dtd1uttJz9UNK0W1C0HRvVHOpZpa0/vLlbh2dhUE6eOD91dUEQLiDSL4W/tmRN96lrOk3lVay6dw2UXFpilZxUrg6T9gt6NEH7W3N+x3dvbMKnbeHO6UkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 772b339a-01cd-11ef-b972-005056bdfda7;
	Wed, 24 Apr 2024 02:59:05 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Apr 2024 02:59:04 +0300
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
Subject: Re: [PATCH 1/4] i2c: designware: Create shared header hosting driver
 name
Message-ID: <ZihLSKe_BHxasBql@surfacebook.localdomain>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
 <20240423233622.1494708-2-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423233622.1494708-2-florian.fainelli@broadcom.com>

Tue, Apr 23, 2024 at 04:36:19PM -0700, Florian Fainelli kirjoitti:
> We have a number of drivers that reference the string "i2c_designware"
> yet this is copied all over the places with opportunities for this
> string being mis-used. Create a shared header that defines this as a
> constant that other drivers can reference.

...

>  #include <linux/i2c.h>
> +#include <linux/i2c-designware.h>

Can it be hidden in the subfolder?

...

> -#define DRIVER_NAME "i2c-designware-pci"
> +#define DRIVER_NAME I2C_DESIGNWARE_NAME "-pci"

Oh, this makes all the things hard to read.

>  /* Work with hotplug and coldplug */
> -MODULE_ALIAS("i2c_designware-pci");
> +MODULE_ALIAS(DRIVER_NAME);

I believe we shouldn't use MODULE_ALIAS() without real justification.

...

> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c

All as per above.

-- 
With Best Regards,
Andy Shevchenko



