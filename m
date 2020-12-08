Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90AB62D2B5B
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Dec 2020 13:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbgLHMsK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Dec 2020 07:48:10 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46564 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgLHMsJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Dec 2020 07:48:09 -0500
Received: by mail-wr1-f68.google.com with SMTP id l9so6959701wrt.13
        for <linux-i2c@vger.kernel.org>; Tue, 08 Dec 2020 04:47:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X/zg5EuILTAhAOxRFCL0AJ/LIsGkYR3s67X+bQJiNqY=;
        b=FE2FfTF1vv+V5Vr5OZeYbsxFvnfPdUT1M9242jjrIXTnacWQoamVQ2fnyXvctmEEgz
         3K9pwqzjb3rAHDAe3Htw87YgCzEiMzk8+xSbeRquBv4O/9apTmcdybYv7iz+qyYFMBKz
         zXDiDRfkKYqmaYcbnn+C6IuZ1kT3rpiaTKCN1mR6GlvfiYTTbfw09+vuI5ZfA8/HUn9E
         0G0QdC3vsZRAfGffsM81x8j/9JjtFk2SNxGe33Gv6X6bpTXVJgAMNCE5EotcOgUocvox
         4KYmh6etQbaghmFdMWr30nkSq1OowD+GihRCX6EslTMSXFtT96IPmb7D5nZAC14RpHKL
         DIZA==
X-Gm-Message-State: AOAM533DQQvD1Jt3FBjJsBpV8lkFk3fSgSb2jtJtW0eFQXkuPOkBPV3F
        neSLUEmWEEgjF/j1lX/MjR0=
X-Google-Smtp-Source: ABdhPJyDkEDBzJpyp5PIqsDLoxnczhMAhYWKt3pcWz3nO6Jd3QAvu2JF5SD5i0h+8wvikVxv10tpQg==
X-Received: by 2002:a5d:4d4f:: with SMTP id a15mr551545wru.315.1607431646921;
        Tue, 08 Dec 2020 04:47:26 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id p19sm21855173wrg.18.2020.12.08.04.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 04:47:26 -0800 (PST)
Date:   Tue, 8 Dec 2020 13:47:24 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sanjay R Mehta <sanju.mehta@amd.com>
Cc:     wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, jdelvare@suse.de,
        Sergey.Semin@baikalelectronics.ru, kblaiech@mellanox.com,
        loic.poulain@linaro.org, rppt@kernel.org,
        bjorn.andersson@linaro.org, linux@roeck-us.net,
        vadimp@mellanox.com, tali.perry1@gmail.com,
        linux-i2c@vger.kernel.org,
        Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
Subject: Re: [PATCH v2] i2c: add i2c bus driver for amd navi gpu
Message-ID: <20201208124724.GA29797@kozik-lap>
References: <1607431061-57635-1-git-send-email-sanju.mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1607431061-57635-1-git-send-email-sanju.mehta@amd.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 08, 2020 at 06:37:41AM -0600, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <Sanju.Mehta@amd.com>
> 
> Latest amdgpu card has USB Type-C interface. There is a Type-C controller
> which can be accessed over I2C.
> 
> This driver adds I2C bus driver to communicate with Type-C controller. I2C
> client driver will be part of USB Type-C UCSI driver.
> 
> Signed-off-by: Sanjay R Mehta <Sanju.Mehta@amd.com>
> Signed-off-by: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
> ---
> 
> Changes in v2:
> 
> - converted the code to use regmap, read_poll_timeout and made some cosmetic
>   changes as suggested by Andy Shevchenko.
> ---
>  MAINTAINERS                          |   7 +
>  drivers/i2c/busses/Kconfig           |   9 +
>  drivers/i2c/busses/Makefile          |   1 +
>  drivers/i2c/busses/i2c-amdgpu-navi.c | 345 +++++++++++++++++++++++++++
>  4 files changed, 362 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-amdgpu-navi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 190c7fa2ea01..93894459a4c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8119,6 +8119,13 @@ L:	linux-acpi@vger.kernel.org
>  S:	Maintained
>  F:	drivers/i2c/i2c-core-acpi.c
>  
> +I2C CONTROLLER DRIVER FOR AMD GPU
> +M:	Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
> +M:	Sanjay R Mehta <sanju.mehta@amd.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +F:	drivers/i2c/busses/i2c-amdgpu-navi.*
> +
>  I2C CONTROLLER DRIVER FOR NVIDIA GPU
>  M:	Ajay Gupta <ajayg@nvidia.com>
>  L:	linux-i2c@vger.kernel.org
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 293e7a0760e7..0ff369c0f41f 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -88,6 +88,15 @@ config I2C_AMD_MP2
>  	  This driver can also be built as modules.  If so, the modules will
>  	  be called i2c-amd-mp2-pci and i2c-amd-mp2-plat.
>  
> +config I2C_AMDGPU_NAVI
> +	tristate "AMDGPU NAVI I2C controller"
> +	depends on PCI
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  NAVI I2C controller which is used to communicate with the GPU's
> +	  Type-C controller. This driver can also be built as a module called
> +	  i2c-amdgpu-navi.
> +
>  config I2C_HIX5HD2
>  	tristate "Hix5hd2 high-speed I2C driver"
>  	depends on ARCH_HISI || ARCH_HIX5HD2 || COMPILE_TEST
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 19aff0e45cb5..f599473a8ad9 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_I2C_ALI15X3)	+= i2c-ali15x3.o
>  obj-$(CONFIG_I2C_AMD756)	+= i2c-amd756.o
>  obj-$(CONFIG_I2C_AMD756_S4882)	+= i2c-amd756-s4882.o
>  obj-$(CONFIG_I2C_AMD8111)	+= i2c-amd8111.o
> +obj-$(CONFIG_I2C_AMDGPU_NAVI)	+= i2c-amdgpu-navi.o
>  obj-$(CONFIG_I2C_CHT_WC)	+= i2c-cht-wc.o
>  obj-$(CONFIG_I2C_I801)		+= i2c-i801.o
>  obj-$(CONFIG_I2C_ISCH)		+= i2c-isch.o
> diff --git a/drivers/i2c/busses/i2c-amdgpu-navi.c b/drivers/i2c/busses/i2c-amdgpu-navi.c
> new file mode 100644
> index 000000000000..3922b8aebc26
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-amdgpu-navi.c
> @@ -0,0 +1,345 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// AMD I2C Controller Driver for Navi GPU's
> +//
> +// Copyright (c) 2020, Advanced Micro Devices, Inc.
> +//
> +// Authors:
> +//	Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
> +//	Sanjay R Mehta <Sanju.Mehta@amd.com>
> +
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/regmap.h>
> +#include <asm/unaligned.h>
> +#include "i2c-designware-core.h"
> +
> +#define AMD_UCSI_INTR_EN	0xD
> +#define AMD_UCSI_INTR_REG	0x474
> +#define AMD_MASTERCFG_MASK	GENMASK(15, 0)
> +
> +struct amdgpu_i2c_dev {
> +	void __iomem		*regs;
> +	struct regmap		*map;
> +	struct device		*dev;
> +	u32			master_cfg;
> +	u32			slave_adr;
> +	u32			tx_fifo_depth;
> +	u32			rx_fifo_depth;
> +	u16			ss_hcnt;
> +	u16			ss_lcnt;
> +	struct i2c_adapter	adapter;
> +	struct i2c_board_info	*gpu_ccgx_ucsi;
> +	struct i2c_client	*ccgx_client;
> +};
> +
> +static int amdgpu_i2c_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +	struct amdgpu_i2c_dev *i2cd = context;
> +
> +	*val = readl_relaxed(i2cd->regs + reg);

It's quite confusing calling it "i2c_read" function. What is more
important - why do you need it? It's a simple MMIO on PCI, so why regmap
MMIO cannot be used?

Best regards,
Krzysztof
