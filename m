Return-Path: <linux-i2c+bounces-14782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96572CDE5C0
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 06:59:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3142F300957C
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Dec 2025 05:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D74423D7E6;
	Fri, 26 Dec 2025 05:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JngAh+MQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BFD143C61
	for <linux-i2c@vger.kernel.org>; Fri, 26 Dec 2025 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766728774; cv=none; b=McTeTx3MsIR/OJbGpKAKDCLHU7yCjncAW/MYnjL4504ycSDzVfpR+M6paxqrDMPWOEAKc7mHGhVH8YLU0+Nv0DOn971iAOQ8N+WnZmv8E462N0VHXIsunnB9zUh5OiAMd9MwRFt7xwNwhgkueu8pcTWm+uNJFILT+QVYz19Rb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766728774; c=relaxed/simple;
	bh=/sFvOdXheww+vs8nNgsVQJOeqqaBlYClRklvHU6txfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4Pqk9s0K5m8l4VqP2b7nGVfCTtie1vhvExLPaSAz+OqNi/diCxCjo5250Lnrzgss9oVN8h4zJ1nRdYUwzYoLaQfqvudN7Nv1e5pAyycyHgTj9xd6Pzv+ewIxGV5anMmCtsPaV1rRY4pvsmFOzaXBuUTj/Qs6pB91AVPk3E6Cm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JngAh+MQ; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766728690;
	bh=naZAYYRI1JBcsRQk9sPvRjOUBTUxZLDtykBpQJLgSuw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=JngAh+MQppEx2hWmdB3PBYTZPRbUR1l7A5kXs7kYdhohhx19crMKpcz3XWMESx95I
	 rJplrSHC4pdWMu3d605nAlwp3JEru4LZVMlBC2ePLJLWIGUAPldtOgxGZ2srSiXn2z
	 SEqdqE1s20+agEk3Zdac4h+4O3IBspxafCAro15o=
X-QQ-mid: esmtpgz15t1766728682ta0fc67c3
X-QQ-Originating-IP: oXV7eas6q4+G5fWnguFIeViUamJ75KfeaJ7jJJI9E9g=
Received: from = ( [183.48.244.228])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 13:58:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8067851373917819696
EX-QQ-RecipientCnt: 13
Date: Fri, 26 Dec 2025 13:58:00 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <BD74A47E5BB66010+aU4j6CgGxebcBV5I@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
 <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MlEcK20dh8y2ahYrz7s7E6C+uyK0sndIC3rJhcQqJqKW9tp3QEjBFFfq
	fAv1ET2cr+JvmFr4vzdygVxnrxRrB2O5JuH9iAq1L7nha/iR3W/7MS2BalnJQnaFqDELRs7
	FYDI3mgU7Xv0HIjmlXV2ZS6lGaUYN2+zaDOVo3G3O5MOFbc482ZRAd+q/vhMO/a1FDko2lq
	V52JkFfHKMBVPh+3jFO9+xarsVzWlw6Oldj0eVOQdlppxHB0Z0UH30gsDL/0DZNek1cdf0u
	29ECwxVHjj0Xrk/otJ63/DBz7NWPGJIQmHI4RInjb/gnAfVxXxdfK3eRLsLWrG66dTBlp8E
	UOo1h5mS6vCkxY0WZVUnzkfEeZhlwXXmwgmXfkkNvCR7wWx4XM5Fw+EiFAsMZBa6TnDCp3Z
	yPIQD3Xv2yZrXjCbtBBvQU2ZzdYc3lY39lHXqH+Jwnm20++17zv7IL9l/fXhMNGgZ9TAzRm
	Argriy+n07myR1UvKx2oXEdSpD3T0sBIQKgwi7mcnDhEBwiDHXpsQbOGKmKkVmunWtgISxS
	7IfuvFPKW2JNK+6AqlIStA/VqjDTpeffEFAXzgKLCoSqF80nff80LmBer+b1BEOu2qtnWsg
	DxC/WhKUe0TvZ0ikhH9DGGfH+Fwz54t+Hz1zu0GL0WfA+BMwffizN7nrIx/6zm7/4M+7pf2
	++M+euNmYt3ec/4PQ1W7LxOT34Et0MDCpQ6gcVSHzrbeCMezakjrTHOl0StBUux2v3x7lss
	X+0QQObwj39OfkZWBF0glwobU+B0vulLj8oHxjAPiOmYJcRCmrl1OiaWbF9UnTP5x6ShaXB
	2ZBVm7A7v8W7N3syGoTiii4dJQSOrpE9qD1tCs+ffNnk2hVM940hPw1OmClwdKUr8uGyuWS
	/tssDnT1iSPFk9ADVudAfB74Kattz7QmSK4Izhr2uxSP9+U2y6U8Xr4l4TycQly6znSy5ZP
	fczajv7WuTD0gD7EiSA46QykP9qCEa2AMG6degqjCvtwLnsEYKS6Lcr5+AIOXZYNpIjOODG
	6x2kytyiAgICXpYpt9RC3XFYfhCyTcrcTm4BNd5Wv9c021Dij1zgeDF8UZLhNGM6i0X66Jp
	1UZ49TqHmWW7D2Hghhbq2FAFOE+Vy6xmA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Tue, Nov 18, 2025 at 11:32:44AM -0600, Alex Elder wrote:
> On 11/18/25 12:08 AM, Troy Mitchell wrote:
> > The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> > master mode operations is determined by the ILCR (I2C Load Count Register).
> > Previously, the driver relied on the hardware's reset default
> > values for this register.
> > 
> > The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> > frequencies lower than intended. For example, with the default
> > 31.5 MHz input clock, these default settings result in an SCL
> > frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> > and approximately 338 kHz (fast mode) when targeting 400 kHz.
> > These frequencies are below the 100 kHz/400 kHz nominal speeds.
> > 
> > This patch integrates the SCL frequency management into
> > the Common Clock Framework (CCF). Specifically, the ILCR register,
> > which acts as a frequency divider for the SCL clock, is now registered
> > as a managed clock (scl_clk) within the CCF.
> > 
> > This patch also cleans up unnecessary whitespace
> > in the included header files.
> 
> I have a few comments below.  Sorry I didn't comment on
> earlier versions. > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > Link: https://lore.kernel.org/all/176244506110.1925720.10807118665958896958.b4-ty@kernel.org/ [1]
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> > This patch was affected by the P1 Kconfig, which caused the maintainer
> > to revert it.
> > The current commit is a direct cherry-pick and reserves the original changelog.
> > This note is to clarify for anyone who sees the cover letter marked as v2
> > while the changelog entries reach v4.
> > ---
> > Changelog in v4:
> > - initialize clk_init_data with {} so that init.flags is implicitly set to 0
> > - minor cleanup and style fixes for better readability
> > - remove unused spacemit_i2c_scl_clk_exclusive_put() cleanup callback
> > - replace clk_set_rate_exclusive()/clk_rate_exclusive_put() pair with clk_set_rate()
> > - simplify LCR LV field macros by using FIELD_GET/FIELD_MAX helpers
> > - Link to v3: https://lore.kernel.org/all/20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com/
> > 
> > Changelog in v3:
> > - use MASK macro in `recalc_rate` function
> > - rename clock name
> > - Link to v2: https://lore.kernel.org/r/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com
> > 
> > Changelog in v2:
> > - Align line breaks.
> > - Check `lv` in `clk_set_rate` function.
> > - Force fast mode when SCL frequency is illegal or unavailable.
> > - Change "linux/bits.h" to <linux/bits.h>
> > - Kconfig: Add dependency on CCF.
> > - Link to v1: https://lore.kernel.org/all/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com/
> > ---
> >   drivers/i2c/busses/Kconfig  |   2 +-
> >   drivers/i2c/busses/i2c-k1.c | 159 ++++++++++++++++++++++++++++++++++++++++----
> >   2 files changed, 146 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> > index fd81e49638aaa161ae264a722e9e06adc7914cda..fedf5d31f9035b73a27a7f8a764bf5c26975d0e1 100644
> > --- a/drivers/i2c/busses/Kconfig
> > +++ b/drivers/i2c/busses/Kconfig
> > @@ -798,7 +798,7 @@ config I2C_JZ4780
> >   config I2C_K1
> >   	tristate "SpacemiT K1 I2C adapter"
> >   	depends on ARCH_SPACEMIT || COMPILE_TEST
> > -	depends on OF
> > +	depends on OF && COMMON_CLK
> >   	help
> >   	  This option enables support for the I2C interface on the SpacemiT K1
> >   	  platform.
> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index 6b918770e612e098b8ad17418f420d87c94df166..e38a0ba71734ca602854c85672dcb61423453515 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> > @@ -4,18 +4,21 @@
> >    */
> >   #include <linux/bitfield.h>
> > - #include <linux/clk.h>
> > - #include <linux/i2c.h>
> > - #include <linux/iopoll.h>
> > - #include <linux/module.h>
> > - #include <linux/of_address.h>
> > - #include <linux/platform_device.h>
> > +#include <linux/bits.h>
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/i2c.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/module.h>
> > +#include <linux/of_address.h>
> > +#include <linux/platform_device.h>
> >   /* spacemit i2c registers */
> >   #define SPACEMIT_ICR		 0x0		/* Control register */
> >   #define SPACEMIT_ISR		 0x4		/* Status register */
> >   #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
> >   #define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
> > +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
> >   #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
> >   /* SPACEMIT_ICR register fields */
> > @@ -87,6 +90,13 @@
> >   #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
> >   #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
> > +#define SPACEMIT_LCR_LV_STANDARD_SHIFT		0
> > +#define SPACEMIT_LCR_LV_FAST_SHIFT		9
> 
> Why do you need these SHIFT symbols?  Just use the masks
> and FIELD_GET() related macros.  I'll provide examples below.
> 
> > +#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(8, 0)
> > +#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(17, 9)
> > +#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE	FIELD_MAX(SPACEMIT_LCR_LV_STANDARD_MASK)
> > +#define SPACEMIT_LCR_LV_FAST_MAX_VALUE		FIELD_MAX(SPACEMIT_LCR_LV_FAST_MASK)
> > +
> >   /* i2c bus recover timeout: us */
> >   #define SPACEMIT_I2C_BUS_BUSY_TIMEOUT		100000
> > @@ -104,11 +114,20 @@ enum spacemit_i2c_state {
> >   	SPACEMIT_STATE_WRITE,
> >   };
> > +enum spacemit_i2c_mode {
> > +	SPACEMIT_MODE_STANDARD,
> > +	SPACEMIT_MODE_FAST
> > +};
> 
> Will there ever be more than two i2c modes?  If not, this
> could simply be a Boolean.
Yes, Will. See below.
> 
> > +
> >   /* i2c-spacemit driver's main struct */
> >   struct spacemit_i2c_dev {
> >   	struct device *dev;
> >   	struct i2c_adapter adapt;
> > +	struct clk_hw scl_clk_hw;
> > +	struct clk *scl_clk;
> > +	enum spacemit_i2c_mode mode;
> 
> Perhaps this could be:
> 
> 	bool fast_mode;
hardware also supports high-speed mode.

> 
> > +
> >   	/* hardware resources */
> >   	void __iomem *base;
> >   	int irq;
> > @@ -129,6 +148,79 @@ struct spacemit_i2c_dev {
> >   	u32 status;
> >   };
> > +static void spacemit_i2c_scl_clk_disable_unprepare(void *data)
> > +{
> > +	struct spacemit_i2c_dev *i2c = data;
> > +
> > +	clk_disable_unprepare(i2c->scl_clk);
> > +}
> > +
> > +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > +				     unsigned long parent_rate)
> > +{
> > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > +	u32 lv, lcr, mask, shift, max_lv;
> > +
> > +	lv = DIV_ROUND_UP(parent_rate, rate);
> 
> Would DIV_ROUND_CLOSEST() give a more accurate value?
I'll test it.
> 
> > +
> > +	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
> > +		mask = SPACEMIT_LCR_LV_STANDARD_MASK;
> > +		shift = SPACEMIT_LCR_LV_STANDARD_SHIFT;
> > +		max_lv = SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
> > +	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
> > +		mask = SPACEMIT_LCR_LV_FAST_MASK;
> > +		shift = SPACEMIT_LCR_LV_FAST_SHIFT;
> > +		max_lv = SPACEMIT_LCR_LV_FAST_MAX_VALUE;
> > +	}
> > +
> > +	if (!lv || lv > max_lv) {
> > +		dev_err(i2c->dev, "set scl clock failed: lv 0x%x", lv);
> > +		return -EINVAL;
> > +	}
> > +
> > +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> > +	lcr &= ~mask;
> > +	lcr |= lv << shift;
> > +	writel(lcr, i2c->base + SPACEMIT_ILCR);
> 
> 	FIELD_MODIFY(mask, &lcr, lv);
> 
> I suppose this might give you trouble because the mask isn't
> constant at compile time, but anyway I think something like
> this is simpler:
> 
> 	lv = DIV_ROUND_CLOSEST(parent_rate, rate);
> 	lcr = readl(i2c->base + SPACEMIT_ILCR);
> 	if (i2c->fast_mode)
> 		FIELD_MODIFY(SPACEMIT_LCR_LV_FAST_MASK, &lcr, lv);
> 	else
> 		FIELD_MODIFY(SPACEMIT_LCR_LV_STANDARD_MASK, &lcr, lv);
> 	writel(lcr, i2c->base + SPACEMIT_ILCR);
> 
> Note:  I've never used FIELD_MODIFY(), but it looks like this is
> how it's supposed to be used.
Thanks! I'll give it a go.
> 
> > +	return 0;
> > +}
> > +
> > +static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > +					unsigned long *parent_rate)
> > +{
> > +	u32 lv, freq;
> > +
> > +	lv = DIV_ROUND_UP(*parent_rate, rate);
> > +	freq = DIV_ROUND_UP(*parent_rate, lv);
> 
> Consider whether DIV_ROUND_CLOSEST() (in one or both of
> these) provides a rate that is as close as possible to the
> requested rate.
> 
> > +
> > +	return freq;
> > +}
> > +
> > +static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
> > +						  unsigned long parent_rate)
> > +{
> > +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> > +	u32 lcr, lv = 0;
> > +
> > +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> > +
> > +	if (i2c->mode == SPACEMIT_MODE_STANDARD)
> > +		lv = FIELD_GET(SPACEMIT_LCR_LV_STANDARD_MASK, lcr);
> > +	else if (i2c->mode == SPACEMIT_MODE_FAST)
> > +		lv = FIELD_GET(SPACEMIT_LCR_LV_FAST_MASK, lcr);
> > +	else
> > +		return 0;
> 
> You shouldn't need the last else here.  You can probably tell
> by inspection that it will always be one mode or the other.
> And a Boolean reinforces that.
I'll drop else here.

> 
> > +
> > +	return DIV_ROUND_UP(parent_rate, lv);
> > +}
> > +
> > +static const struct clk_ops spacemit_i2c_clk_ops = {
> > +	.set_rate = spacemit_i2c_clk_set_rate,
> > +	.round_rate = spacemit_i2c_clk_round_rate,
> > +	.recalc_rate = spacemit_i2c_clk_recalc_rate,
> > +};
> > +
> >   static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
> >   {
> >   	u32 val;
> > @@ -147,6 +239,26 @@ static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
> >   	writel(val, i2c->base + SPACEMIT_ICR);
> >   }
> > +static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
> > +						 struct clk *parent)
> > +{
> > +	struct clk_init_data init = {};
> > +	char name[32];
> > +
> > +	snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));
> 
> What if dev_name(i2c->dev) is longer than 24?  You should
> be checking the return value here.
Thanks! I'll check the return value and extend the array size to 64.

> 
> > +
> > +	init.name = name;
> > +	init.ops = &spacemit_i2c_clk_ops;
> > +	init.parent_data = (struct clk_parent_data[]) {
> > +		{ .fw_name = "func" },
> > +	};
> > +	init.num_parents = 1;
> > +
> > +	i2c->scl_clk_hw.init = &init;
> > +
> > +	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
> > +}
> > +
> >   static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
> >   {
> >   	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
> > @@ -246,7 +358,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
> >   	 */
> >   	val |= SPACEMIT_CR_DRFIE;
> > -	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> > +	if (i2c->mode == SPACEMIT_MODE_FAST)
> >   		val |= SPACEMIT_CR_MODE_FAST;
> >   	/* disable response to general call */
> > @@ -538,14 +650,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> >   		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
> 
> I don't think there's any need to warn when the "clock-frequency"
> property is not found.  It's an optional property, and the default
> is specified in the binding to be 400 KHz.
I will fix it in another patch.
> 
> >   	/* For now, this driver doesn't support high-speed. */
> > -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> > +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> > +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> > +		i2c->mode = SPACEMIT_MODE_FAST;
> > +	} else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> > +		i2c->mode = SPACEMIT_MODE_STANDARD;
> So this I2C driver will literally support *either* the standard
> speed *or* the high speed frequency.  Is this a necessary
> restriction?  If it is, perhaps the DT binding should be
> clear that the speeds should be one of those supported
> (because anything else will result in using a supported
> speed, not the one provided).
I think there may be a misunderstanding here.
The documentation already states that:

K1 supports three different modes running at different frequencies:
- standard speed mode: up to 100000 (100 kHz)
- fast speed mode    : up to 400000 (400 kHz)
- high speed mode........

The mode only defines the valid frequency range.
In standard mode, the maximum frequency is 100 kHz; in fast mode,
the valid range is 100 kHz to 400 kHz.

The exact operating frequency is determined by the ILCR register.
This is precisely the motivation for this patch: without it, once
the mode is selected, the actual bus frequency depends solely on the
ILCR reset value rather than the clock-frequency provided by DT.

                              - Troy
>
> 
> (Sorry, these last two comments are not about your patch,
> but about the driver that's already accepted.)
> 
> 					-Alex
> 
> > +	} else {
> > +		dev_warn(i2c->dev, "invalid clock-frequency, fallback to fast mode");
> > +		i2c->mode = SPACEMIT_MODE_FAST;
> >   		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> > -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> > -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> > -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> > -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
> >   	}
> >   	i2c->dev = &pdev->dev;
> > @@ -567,10 +680,28 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
> >   	if (IS_ERR(clk))
> >   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
> > +	i2c->scl_clk = spacemit_i2c_register_scl_clk(i2c, clk);
> > +	if (IS_ERR(i2c->scl_clk))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
> > +				     "failed to register scl clock\n");
> > +
> >   	clk = devm_clk_get_enabled(dev, "bus");
> >   	if (IS_ERR(clk))
> >   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
> > +	ret = clk_set_rate(i2c->scl_clk, i2c->clock_freq);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret, "failed to set rate for SCL clock");
> > +
> > +	ret = clk_prepare_enable(i2c->scl_clk);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret, "failed to prepare and enable clock");
> > +
> > +	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_disable_unprepare, i2c);
> > +	if (ret)
> > +		return dev_err_probe(&pdev->dev, ret,
> > +				     "failed to register cleanup action for clk disable and unprepare");
> > +
> >   	spacemit_i2c_reset(i2c);
> >   	i2c_set_adapdata(&i2c->adapt, i2c);
> > 
> 

