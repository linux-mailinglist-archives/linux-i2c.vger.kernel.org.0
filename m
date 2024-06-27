Return-Path: <linux-i2c+bounces-4408-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E9391AA60
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4924BB27CA9
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3741990C2;
	Thu, 27 Jun 2024 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b="KDNRYZPN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AE0198A17
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500664; cv=none; b=MfvyQ/gVQRnKYD+Ekba65pCyEKCUcXDpN09B8nkxWzatix2Zl7inAOxtKzZSQT6tOPNMmLG+96D/lMiURW7WTHNiBESYmfzaGGpNT3D9ntSH72JoQZyHw9MfzaKeMzf7y898Zdz9+1zyr3V6JFeN0Gwkr7xjfWoKm1qpabUr4lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500664; c=relaxed/simple;
	bh=+MoA5T7a5GTI46GqiwhJRXiMixeE8zhFLC4/mfXz7cs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nr8zHxIuIHizeuaZ4Lfntcs3z5KjBhduseK7uFBXr7rdPzYsqd8vnqUk2Q50uAcATwAdalo7gZYCU9qDjUumm7B9RyXt/i5iHfWycZALu9hjUsmNBYzLszOU82l+Q3has9RiT2ieNOgHaO23ouZYVLfZwfpDZTrSQ+gar9t18mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com; spf=pass smtp.mailfrom=timesys.com; dkim=pass (2048-bit key) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.b=KDNRYZPN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timesys.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a72510ebc3fso722296966b.2
        for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 08:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500660; x=1720105460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAbEFx8Qx1jb1E3qZFdMOF6RPU8ZJ7qI5KSjiERwRt4=;
        b=KDNRYZPNjCdE/a8aHxe0SI9052OK0fqwQ1L0jX6uMxj+QnImKmMzbAjLDFQUIgZweo
         DdUvgCtdel6TMbEniZnr4KhRPeAyYV7wKmfxN6rqXpaSHFU/+Tv7O/LnVDOO39u5ogIg
         7zYBlgFlmX+c4t4Exv0/M1lSmgapMXmTIZ8VjyW05E9Dky/ZpoO3FWL9VsKHovyHVfZD
         mRTVMNcMLx38cy7VK1YZJZ+gTSE2fLgD5BLY5GhoT51PLbmCOX76ToENc5y6AWVdhbfT
         VGkzBXFmNS0i7ac5EAoR7FBHnCrbbyQgD/SmS45tgKYhqXAZ4nnF5aa2qVIPY45yzTUM
         AYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500660; x=1720105460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAbEFx8Qx1jb1E3qZFdMOF6RPU8ZJ7qI5KSjiERwRt4=;
        b=gEKM5R1DjXwrY+/vPI+93wGSGRDZoNXFmI0hVSFiEYZOaTEysZwLm32YNSLUsufOFk
         2rFgViU3FcQ908kXxdctksJ3e9JH47v06zd5Jg42V5q4LgwEfz3VObiqziF+yEwm73Hj
         skuMxfiGwh5wtiZB9hdwvs0iBDdPr2V3y8oFwQlGzG4cj3bCQyDdyeIzYJLxHgyCqeDs
         w7NOvzgwF/4Red6RS2LSykYPhPGsHkX2r23lUqLPekrlH0/9jeo1Dibsy7fVS3IkT2/E
         rLnoonPEkvwXjPS2p9XU9KRJXA1Ie8NfJYakWE0fAZDgzLq6E0ui0+V9R5Y3ZHQfgKMB
         Ri1w==
X-Forwarded-Encrypted: i=1; AJvYcCV1b2z9KhZNePIDvrcqwEjq/cgf/s1vf8zzT5scFsVnsJNLTfA8Ck0l5X57E1kECu6OM4vurua0sSxD9xZ3QKmmCz53kKBkmsqD
X-Gm-Message-State: AOJu0Yz8HU9PFoI8vHvg3v/86MEjJiL2+XLXkk0ICD+Wr7zlNkQzgAIO
	EddizQu6kMgm4QmAewQUpoFUf2i4VD5K8vUB9bLDfeuxHUfuHHNk5z51pNWziSQ=
X-Google-Smtp-Source: AGHT+IGWWjdS8xPoV3qLbjKKjfLtKfd3PYZl/5ZuwXyyzk52xq360p0PA+fjmtbO1v8hyBEWixy7Fw==
X-Received: by 2002:a17:906:c44d:b0:a72:548a:6f42 with SMTP id a640c23a62f3a-a72548a702emr877880166b.18.1719500659616;
        Thu, 27 Jun 2024 08:04:19 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:04:18 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Corentin Labbe <clabbe@baylibre.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [Patch v5 09/12] ARM: lpc32xx: Remove pl08x platform data in favor for device tree
Date: Thu, 27 Jun 2024 17:00:27 +0200
Message-Id: <20240627150046.258795-10-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the driver for nxp,lpc3220-dmamux we can remove the pl08x platform
data and let pl08x driver to create peripheral channels from the DT
properties.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 arch/arm/mach-lpc32xx/phy3250.c | 54 ---------------------------------
 1 file changed, 54 deletions(-)

diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 66701bf43248..0c7797a0e44e 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -16,64 +16,10 @@
 #include <asm/mach/arch.h>
 #include "common.h"
 
-static struct pl08x_channel_data pl08x_slave_channels[] = {
-	{
-		.bus_id = "nand-slc",
-		.min_signal = 1, /* SLC NAND Flash */
-		.max_signal = 1,
-		.periph_buses = PL08X_AHB1,
-	},
-	{
-		.bus_id = "nand-mlc",
-		.min_signal = 12, /* MLC NAND Flash */
-		.max_signal = 12,
-		.periph_buses = PL08X_AHB1,
-	},
-};
-
-static int pl08x_get_signal(const struct pl08x_channel_data *cd)
-{
-	return cd->min_signal;
-}
-
-static void pl08x_put_signal(const struct pl08x_channel_data *cd, int ch)
-{
-}
-
-static struct pl08x_platform_data pl08x_pd = {
-	/* Some reasonable memcpy defaults */
-	.memcpy_burst_size = PL08X_BURST_SZ_256,
-	.memcpy_bus_width = PL08X_BUS_WIDTH_32_BITS,
-	.slave_channels = &pl08x_slave_channels[0],
-	.num_slave_channels = ARRAY_SIZE(pl08x_slave_channels),
-	.get_xfer_signal = pl08x_get_signal,
-	.put_xfer_signal = pl08x_put_signal,
-	.lli_buses = PL08X_AHB1,
-	.mem_buses = PL08X_AHB1,
-};
-
-static struct lpc32xx_slc_platform_data lpc32xx_slc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
-	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
-	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
-		       &lpc32xx_slc_data),
-	OF_DEV_AUXDATA("nxp,lpc3220-mlc", 0x200a8000, "200a8000.flash",
-		       &lpc32xx_mlc_data),
-	{ }
-};
-
 static void __init lpc3250_machine_init(void)
 {
 	lpc32xx_serial_init();
 
-	of_platform_default_populate(NULL, lpc32xx_auxdata_lookup, NULL);
 }
 
 static const char *const lpc32xx_dt_compat[] __initconst = {
-- 
2.25.1


