Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECBB23CFEA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Aug 2020 21:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgHET0r convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 5 Aug 2020 15:26:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:46798 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728512AbgHERNs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Aug 2020 13:13:48 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A1A44B626;
        Wed,  5 Aug 2020 14:37:13 +0000 (UTC)
Date:   Wed, 5 Aug 2020 16:36:55 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: VAIO EEPROM support in at24
Message-ID: <20200805163655.6cfa6e17@endymion>
In-Reply-To: <CAMRc=Mdoh5Sk3iS_CO4+++SG2jJOy1qrG4q2zOzbeYYMdJR0VA@mail.gmail.com>
References: <20200317151409.7940926c@endymion>
        <CAMRc=Mdoh5Sk3iS_CO4+++SG2jJOy1qrG4q2zOzbeYYMdJR0VA@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Tue, 17 Mar 2020 15:32:56 +0100, Bartosz Golaszewski wrote:
> wt., 17 mar 2020 o 15:14 Jean Delvare <jdelvare@suse.de> napisał(a):
> > Before I start implementing the idea above, I would like to know if
> > anyone objects to it, or has a better idea?
> 
> Sounds good to me in general but isn't it something we could
> generalize a bit more?
> 
> For instance we could make at24_chip_data struct look something like this:
> 
> struct at24_chip_data {
>     u32 byte_len;
>     u8 flags;
>     struct resource masked;
> };
> 
> And we could introduce a new macro called AT24_CHIP_DATA_MASKED that
> would automacially set the AT24_FLAG_MASKED_RANGE flag and take
> another argument that would contain the address and size of the masked
> register range (we'd put it into the "masked" resource)?
> 
> Other ideas are welcome too. I just think that making it
> SONY_VAIO-specific may be a bit limiting in the future.

I finally found the time to give it a try. Here's what my (tested)
prototype looks like:

--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -8,9 +8,11 @@
 
 #include <linux/acpi.h>
 #include <linux/bitops.h>
+#include <linux/capability.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/ioport.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/mod_devicetable.h>
@@ -38,6 +40,8 @@
 #define AT24_FLAG_MAC		BIT(2)
 /* Does not auto-rollover reads to the next slave address. */
 #define AT24_FLAG_NO_RDROL	BIT(1)
+/* Contains an area that should not be exposed to non-root users */
+#define AT24_FLAG_MASKED_RANGE	BIT(0)
 
 /*
  * I2C EEPROMs from most vendors are inexpensive and mostly interchangeable.
@@ -87,6 +91,7 @@ struct at24_data {
 	u16 page_size;
 	u8 flags;
 
+	struct resource masked;
 	struct nvmem_device *nvmem;
 	struct regulator *vcc_reg;
 
@@ -121,6 +126,7 @@ MODULE_PARM_DESC(at24_write_timeout, "Ti
 struct at24_chip_data {
 	u32 byte_len;
 	u8 flags;
+	struct resource masked;
 };
 
 #define AT24_CHIP_DATA(_name, _len, _flags)				\
@@ -128,6 +134,16 @@ struct at24_chip_data {
 		.byte_len = _len, .flags = _flags,			\
 	}
 
+#define AT24_CHIP_DATA_MASKED(_name, _len, _flags, _mstart, _mlen)	\
+	static const struct at24_chip_data _name = {			\
+		.byte_len = _len,					\
+		.flags = _flags | AT24_FLAG_MASKED_RANGE,		\
+		.masked = {						\
+			.start = _mstart,				\
+			.end = _mstart + _mlen - 1,			\
+		},							\
+	}
+
 /* needs 8 addresses as A0-A2 are ignored */
 AT24_CHIP_DATA(at24_data_24c00, 128 / 8, AT24_FLAG_TAKE8ADDR);
 /* old variants can't be handled with this generic entry! */
@@ -144,6 +160,9 @@ AT24_CHIP_DATA(at24_data_24mac602, 64 /
 /* spd is a 24c02 in memory DIMMs */
 AT24_CHIP_DATA(at24_data_spd, 2048 / 8,
 	AT24_FLAG_READONLY | AT24_FLAG_IRUGO);
+/* vaio is a 24c02 on some Sony laptops */
+AT24_CHIP_DATA_MASKED(at24_data_vaio, 2048 / 8,
+	AT24_FLAG_READONLY | AT24_FLAG_IRUGO, 0x00, 14);
 AT24_CHIP_DATA(at24_data_24c04, 4096 / 8, 0);
 AT24_CHIP_DATA(at24_data_24cs04, 16,
 	AT24_FLAG_SERIAL | AT24_FLAG_READONLY);
@@ -177,6 +196,7 @@ static const struct i2c_device_id at24_i
 	{ "24mac402",	(kernel_ulong_t)&at24_data_24mac402 },
 	{ "24mac602",	(kernel_ulong_t)&at24_data_24mac602 },
 	{ "spd",	(kernel_ulong_t)&at24_data_spd },
+	{ "eeprom-vaio",(kernel_ulong_t)&at24_data_vaio },
 	{ "24c04",	(kernel_ulong_t)&at24_data_24c04 },
 	{ "24cs04",	(kernel_ulong_t)&at24_data_24cs04 },
 	{ "24c08",	(kernel_ulong_t)&at24_data_24c08 },
@@ -389,6 +409,9 @@ static int at24_read(void *priv, unsigne
 	struct device *dev;
 	char *buf = val;
 	int ret;
+	unsigned int orig_off = off;
+	char *orig_buf = buf;
+	size_t orig_count = count;
 
 	at24 = priv;
 	dev = at24_base_client_dev(at24);
@@ -427,6 +450,15 @@ static int at24_read(void *priv, unsigne
 
 	pm_runtime_put(dev);
 
+	if ((at24->flags & AT24_FLAG_MASKED_RANGE) && !capable(CAP_SYS_ADMIN)) {
+		int i;
+
+		for (i = orig_off; i < orig_off + orig_count; i++) {
+			if (i >= at24->masked.start && i <= at24->masked.end)
+				orig_buf[i] = 0x00;
+		}
+	}
+
 	return 0;
 }
 
@@ -654,6 +686,7 @@ static int at24_probe(struct i2c_client
 	at24->byte_len = byte_len;
 	at24->page_size = page_size;
 	at24->flags = flags;
+	at24->masked = cdata->masked;
 	at24->num_addresses = num_addresses;
 	at24->offset_adj = at24_get_offset_adj(flags, byte_len);
 	at24->client[0].client = client;

Comments welcome. I already have my own comments/questions:

1* Do we actually need to use a struct resource? With the current
   requirements, that looks overkill to me. We really only need the
   start and end offsets of the masked area (or start and length). Or
   do you plan to ever support multiple masked ranges, and
   resource.child would be used to daisy-chain these ranges? Personally
   I would wait until the need exists.

   Note that if we would just store mstart and mlen in struct
   at24_chip_data then we could even get rid of AT24_FLAG_MASKED_RANGE,
   as mlen > 0 would imply a masked range.

2* I chose the name "eeprom-vaio" because "vaio" would be too generic.
   I'm open to suggestions if you don't like that name.

3* at24_read() was pretty elegant before my changes, but with the need
   to remember the original value of many parameters, it no longer is.
   I'm considering rewriting it in a way that does not modify the
   parameters needed to process the masked range, either as part of
   this patch or as a subsequent clean-up patch. That would hopefully
   make the code elegant again.

4* I made the masking active only for non-root users as this is what
   the legacy eeprom driver was doing. I hope that's OK with you.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
