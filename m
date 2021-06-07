Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB34139E10F
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jun 2021 17:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbhFGPo5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Jun 2021 11:44:57 -0400
Received: from smtprelay0029.hostedemail.com ([216.40.44.29]:41378 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231582AbhFGPo5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Jun 2021 11:44:57 -0400
Received: from omf08.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 24B06837F24A;
        Mon,  7 Jun 2021 15:43:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf08.hostedemail.com (Postfix) with ESMTPA id 1BA771A29F9;
        Mon,  7 Jun 2021 15:43:03 +0000 (UTC)
Message-ID: <dbcd926e934dc66e17cc35c4c0d2b867474379e5.camel@perches.com>
Subject: Re: [PATCH v2 1/3] units: Add SI metric prefix definitions
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        wsa@kernel.org
Date:   Mon, 07 Jun 2021 08:43:02 -0700
In-Reply-To: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
References: <20210607152344.57458-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.90
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 1BA771A29F9
X-Stat-Signature: mrgkembcckokhd5c6m9siy7a4ij7piwc
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+dXr/s0DMQTspylw0p8uO+ItJW9kzTZv0=
X-HE-Tag: 1623080583-985749
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2021-06-07 at 18:23 +0300, Andy Shevchenko wrote:
> Sometimes it's useful to have well-defined SI metric prefix to be used
> to self-describe the formulas or equations.
> 
> List most popular ones in the units.h.
[]
> diff --git a/include/linux/units.h b/include/linux/units.h
[]
> @@ -4,6 +4,22 @@
>  
>  #include <linux/math.h>
>  
> +/* Metric prefixes in accordance with Système international (d'unités) */
> +#define PETA	1000000000000000LL
> +#define TERA	1000000000000LL
> +#define GIGA	1000000000L
> +#define MEGA	1000000L
> +#define KILO	1000L
> +#define HECTO	100L
> +#define DECA	10L
> +#define DECI	10L
> +#define CENTI	100L
> +#define MILLI	1000L
> +#define MICRO	1000000L
> +#define NANO	1000000000L
> +#define PICO	1000000000000LL
> +#define FEMTO	1000000000000000LL
> +
>  #define MILLIWATT_PER_WATT	1000L
>  #define MICROWATT_PER_MILLIWATT	1000L
>  #define MICROWATT_PER_WATT	1000000L

Somewhat surprisingly to me, this seems safe.

(though I suggest using UL and ULL rather than L and LL)

The only use of any of these seems to be:

sound/pcmcia/vx/vxp_ops.c:      [VX_MICRO]      = 0x0c,         // MICRO
sound/pcmcia/vx/vxp_ops.c:              vx_outb(chip, MICRO, level);
sound/pcmcia/vx/vxp_ops.c:                      vx_outb(chip, MICRO, vx_compute_mic_level(chip->mic_level));

and these vx_outb uses are themselves macros that prepend VX_ to the 2nd arg.


