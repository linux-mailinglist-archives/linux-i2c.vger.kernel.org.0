Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2EF49FC48
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 15:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242044AbiA1O7y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 09:59:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234150AbiA1O7w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 09:59:52 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D45AC061747
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:59:52 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id e28so6361784pfj.5
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xvJuUzOhotizpLBU0OMyw0mKoYy5MME5BHbLXNF/K0Q=;
        b=gA7Tu+FL8Z6PvmbvWrMdFQIP0XDGikzPTLkZpQiFfZFauj/M1syQoriim0a+5CskMr
         plXmJAaoMd2gPd880UcdDE3Gx45QVIMpnt13spaVX6wL1sS885Sd1WRFGXRMpgqkvUca
         321jABWHqcodvxHVkdjdqCtZhESlLktpyDm25TmNQWUr1GBYCeNKyzxdIlRDNzdfcGXc
         1BqjL4wmhHDLj+Dr38YD8rXCmoleUshQSLxfDniv5Flv1I7P1nvPPiYd8M/0nWjIr2iR
         8HPVD3LGhJHpvXHgUlJtiQB/7OvUQPagDBr6S/MbtE+DIsn8s7AunreqUS8uIuM6eXLr
         kr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xvJuUzOhotizpLBU0OMyw0mKoYy5MME5BHbLXNF/K0Q=;
        b=LiMGx2eZNawJKO3u7mRhBjhauAininV6p9Yz+sLSTIYuAnVX8Y1On70Q6eZ4a2Qirz
         +cNyDczLzM9UsTE6ZIe18yeyys4OkaTfzpIwhCvOY8g7huNzGJH3uPyi3Gmlz06j/PgI
         MD/fPdFqEYDGaqX3gUPCO47mh2DjNJXc23+kbdsidu7DMzFKbkmrWSN0u0BKYMD2D2i7
         uoxiOd/oTHqHVk3SWjO6mLPk+vx4KKh7jaLs/k/346w1XWP8gfnutcv6Hi0xH0BILcOn
         bvvxn6tXsCdcbyNRM7a2+2IyeCgOXhRSz0gJ/HPJxLoc2TYub5ZwGpRZ+9fyrRAnVguU
         Txpw==
X-Gm-Message-State: AOAM531MNE51JpoOHuToEGu2cJ1an9ipVxJB86bDrp6In+b8Il61f7uY
        LJ5JvfL12TU5GopiECwPRfkBhpiYix/jC1hHFogeuQ==
X-Google-Smtp-Source: ABdhPJx++cYwxewkq7bF7yAkw2yIAzoZrAGOp0GjHAh26ZwSIk5VPi9hy4Tqpchy7n0zcJOmSsL7rrFMpbNzS2h14sw=
X-Received: by 2002:a05:6a00:2408:: with SMTP id z8mr7464016pfh.68.1643381991633;
 Fri, 28 Jan 2022 06:59:51 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-2-jsd@semihalf.com> <20220128144811.783279-1-jsd@semihalf.com>
 <20220128144811.783279-3-jsd@semihalf.com>
In-Reply-To: <20220128144811.783279-3-jsd@semihalf.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 28 Jan 2022 15:59:40 +0100
Message-ID: <CAOtMz3MnM6knabs0kF6urpE+Thm6rj++6Yy9G=ky2r9uOByH5Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Adding proper Andy's email address (and removing wrong one) in the
whole patchset. Sorry for noise!

Best Regards,
Jan

pt., 28 sty 2022 o 15:48 Jan Dabros <jsd@semihalf.com> napisa=C5=82(a):
>
> Implement an I2C controller sharing mechanism between the host (kernel)
> and PSP co-processor on some platforms equipped with AMD Cezanne SoC.
>
> On these platforms we need to implement "software" i2c arbitration.
> Default arbitration owner is PSP and kernel asks for acquire as well
> as inform about release of the i2c bus via mailbox mechanism.
>
>             +---------+
>  <- ACQUIRE |         |
>   +---------|   CPU   |\
>   |         |         | \      +----------+  SDA
>   |         +---------+  \     |          |-------
> MAILBOX                   +--> |  I2C-DW  |  SCL
>   |         +---------+        |          |-------
>   |         |         |        +----------+
>   +---------|   PSP   |
>    <- ACK   |         |
>             +---------+
>
>             +---------+
>  <- RELEASE |         |
>   +---------|   CPU   |
>   |         |         |        +----------+  SDA
>   |         +---------+        |          |-------
> MAILBOX                   +--> |  I2C-DW  |  SCL
>   |         +---------+  /     |          |-------
>   |         |         | /      +----------+
>   +---------|   PSP   |/
>    <- ACK   |         |
>             +---------+
>
> The solution is similar to i2c-designware-baytrail.c implementation, wher=
e
> we are using a generic i2c-designware-* driver with a small "wrapper".
>
> In contrary to baytrail semaphore implementation, beside internal
> acquire_lock() and release_lock() methods we are also applying quirks to
> lock_bus() and unlock_bus() global adapter methods. With this in place
> all i2c clients drivers may lock i2c bus for a desired number of i2c
> transactions (e.g. write-wait-read) without being aware of that such bus
> is shared with another entity.
>
> Modify i2c_dw_probe_lock_support() to select correct semaphore
> implementation at runtime, since now we have more than one available.
>
> Configure new matching ACPI ID "AMDI0019" and register
> ARBITRATION_SEMAPHORE flag in order to distinguish setup with PSP
> arbitration.
>
> Add myself as a reviewer for I2C DesignWare in order to help with reviewi=
ng
> and testing possible changes touching new i2c-designware-amdpsp.c module.
>
> Signed-off-by: Jan Dabros <jsd@semihalf.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  MAINTAINERS                                  |   1 +
>  drivers/acpi/acpi_apd.c                      |   7 +-
>  drivers/i2c/busses/Kconfig                   |  11 +
>  drivers/i2c/busses/Makefile                  |   1 +
>  drivers/i2c/busses/i2c-designware-amdpsp.c   | 373 +++++++++++++++++++
>  drivers/i2c/busses/i2c-designware-baytrail.c |  10 +-
>  drivers/i2c/busses/i2c-designware-core.h     |  18 +-
>  drivers/i2c/busses/i2c-designware-platdrv.c  |  61 +++
>  8 files changed, 471 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/i2c/busses/i2c-designware-amdpsp.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f41088418aae..e0a7e05c5a41 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18666,6 +18666,7 @@ SYNOPSYS DESIGNWARE I2C DRIVER
>  M:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
>  R:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  R:     Mika Westerberg <mika.westerberg@linux.intel.com>
> +R:     Jan Dabros <jsd@semihalf.com>
>  L:     linux-i2c@vger.kernel.org
>  S:     Maintained
>  F:     drivers/i2c/busses/i2c-designware-*
> diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
> index e7934ba79b02..ad245bbd965e 100644
> --- a/drivers/acpi/acpi_apd.c
> +++ b/drivers/acpi/acpi_apd.c
> @@ -232,12 +232,13 @@ static const struct acpi_device_id acpi_apd_device_=
ids[] =3D {
>         /* Generic apd devices */
>  #ifdef CONFIG_X86_AMD_PLATFORM_DEVICE
>         { "AMD0010", APD_ADDR(cz_i2c_desc) },
> -       { "AMDI0010", APD_ADDR(wt_i2c_desc) },
>         { "AMD0020", APD_ADDR(cz_uart_desc) },
> -       { "AMDI0020", APD_ADDR(cz_uart_desc) },
> -       { "AMDI0022", APD_ADDR(cz_uart_desc) },
>         { "AMD0030", },
>         { "AMD0040", APD_ADDR(fch_misc_desc)},
> +       { "AMDI0010", APD_ADDR(wt_i2c_desc) },
> +       { "AMDI0019", APD_ADDR(wt_i2c_desc) },
> +       { "AMDI0020", APD_ADDR(cz_uart_desc) },
> +       { "AMDI0022", APD_ADDR(cz_uart_desc) },
>         { "HYGO0010", APD_ADDR(wt_i2c_desc) },
>  #endif
>  #ifdef CONFIG_ARM64
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 42da31c1ab70..3ba9e7f9366e 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -553,6 +553,17 @@ config I2C_DESIGNWARE_PLATFORM
>           This driver can also be built as a module.  If so, the module
>           will be called i2c-designware-platform.
>
> +config I2C_DESIGNWARE_AMDPSP
> +       bool "AMD PSP I2C semaphore support"
> +       depends on X86_64
> +       depends on ACPI
> +       depends on I2C_DESIGNWARE_PLATFORM
> +       help
> +         This driver enables managed host access to the selected I2C bus=
 shared
> +         between AMD CPU and AMD PSP.
> +
> +         You should say Y if running on an AMD system equipped with the =
PSP.
> +
>  config I2C_DESIGNWARE_BAYTRAIL
>         bool "Intel Baytrail I2C semaphore support"
>         depends on ACPI
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index 1d00dce77098..752f47be3fc1 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -54,6 +54,7 @@ i2c-designware-core-y                                 +=
=3D i2c-designware-master.o
>  i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE)     +=3D i2c-designwa=
re-slave.o
>  obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)                  +=3D i2c-designwa=
re-platform.o
>  i2c-designware-platform-y                              :=3D i2c-designwa=
re-platdrv.o
> +i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)        +=3D i2c-=
designware-amdpsp.o
>  i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) +=3D i2c-desig=
nware-baytrail.o
>  obj-$(CONFIG_I2C_DESIGNWARE_PCI)                       +=3D i2c-designwa=
re-pci.o
>  i2c-designware-pci-y                                   :=3D i2c-designwa=
re-pcidrv.o
> diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/bus=
ses/i2c-designware-amdpsp.c
> new file mode 100644
> index 000000000000..9b600ca54f7c
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> @@ -0,0 +1,373 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bitfield.h>
> +#include <linux/i2c.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/psp-sev.h>
> +#include <linux/types.h>
> +
> +#include <asm/msr.h>
> +
> +#include "i2c-designware-core.h"
> +
> +#define MSR_AMD_PSP_ADDR       0xc00110a2
> +#define PSP_MBOX_OFFSET                0x10570
> +#define PSP_CMD_TIMEOUT_MS     500
> +
> +#define PSP_I2C_REQ_BUS_CMD            0x64
> +#define PSP_I2C_REQ_RETRY_CNT          10
> +#define PSP_I2C_REQ_RETRY_DELAY_USEC   (50 * 1000)
> +#define PSP_I2C_REQ_STS_OK             0x0
> +#define PSP_I2C_REQ_STS_BUS_BUSY       0x1
> +#define PSP_I2C_REQ_STS_INV_PARAM      0x3
> +
> +#define PSP_MBOX_FIELDS_STS            GENMASK(15, 0)
> +#define PSP_MBOX_FIELDS_CMD            GENMASK(23, 16)
> +#define PSP_MBOX_FIELDS_RESERVED       GENMASK(29, 24)
> +#define PSP_MBOX_FIELDS_RECOVERY       BIT(30)
> +#define PSP_MBOX_FIELDS_READY          BIT(31)
> +
> +struct psp_req_buffer_hdr {
> +       u32 total_size;
> +       u32 status;
> +};
> +
> +enum psp_i2c_req_type {
> +       PSP_I2C_REQ_ACQUIRE,
> +       PSP_I2C_REQ_RELEASE,
> +       PSP_I2C_REQ_MAX
> +};
> +
> +struct psp_i2c_req {
> +       struct psp_req_buffer_hdr hdr;
> +       enum psp_i2c_req_type type;
> +} __aligned(32);
> +
> +struct psp_mbox {
> +       u32 cmd_fields;
> +       phys_addr_t i2c_req_addr;
> +} __packed;
> +
> +static DEFINE_MUTEX(psp_i2c_access_mutex);
> +static unsigned long psp_i2c_sem_acquired;
> +static void __iomem *mbox_iomem;
> +static u32 psp_i2c_access_count;
> +static bool psp_i2c_mbox_fail;
> +static struct device *psp_i2c_dev;
> +
> +/*
> + * Implementation of PSP-x86 i2c-arbitration mailbox introduced for AMD =
Cezanne
> + * family of SoCs.
> + */
> +
> +static int psp_get_mbox_addr(unsigned long *mbox_addr)
> +{
> +       unsigned long long psp_mmio;
> +
> +       if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
> +               return -EIO;
> +
> +       *mbox_addr =3D (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
> +
> +       return 0;
> +}
> +
> +static int psp_mbox_probe(void)
> +{
> +       unsigned long mbox_addr;
> +       int ret;
> +
> +       ret =3D psp_get_mbox_addr(&mbox_addr);
> +       if (ret)
> +               return ret;
> +
> +       mbox_iomem =3D ioremap(mbox_addr, sizeof(struct psp_mbox));
> +       if (!mbox_iomem)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +
> +/* Recovery field should be equal 0 to start sending commands */
> +static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
> +{
> +       u32 tmp;
> +
> +       tmp =3D readl(&mbox->cmd_fields);
> +
> +       return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
> +}
> +
> +static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
> +{
> +       u32 tmp, expected;
> +
> +       /* Expect mbox_cmd to be cleared and ready bit to be set by PSP *=
/
> +       expected =3D FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
> +
> +       return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp =3D=3D exp=
ected),
> +                                 0, 1000 * PSP_CMD_TIMEOUT_MS);
> +}
> +
> +/* Status equal to 0 means that PSP succeed processing command */
> +static int psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
> +{
> +       u32 cmd_reg;
> +
> +       cmd_reg =3D readl(&mbox->cmd_fields);
> +
> +       return FIELD_GET(PSP_MBOX_FIELDS_STS, cmd_reg);
> +}
> +
> +static int psp_send_cmd(struct psp_i2c_req *req)
> +{
> +       struct psp_mbox __iomem *mbox =3D (struct psp_mbox __iomem *)mbox=
_iomem;
> +       phys_addr_t req_addr;
> +       u32 cmd_reg;
> +
> +       if (psp_check_mbox_recovery(mbox))
> +               return -EIO;
> +
> +       if (psp_wait_cmd(mbox))
> +               return -EBUSY;
> +
> +       /*
> +        * Fill mailbox with address of command-response buffer, which wi=
ll be
> +        * used for sending i2c requests as well as reading status return=
ed by
> +        * PSP. Use physical address of buffer, since PSP will map this r=
egion.
> +        */
> +       req_addr =3D __psp_pa((void *)req);
> +       writeq(req_addr, &mbox->i2c_req_addr);
> +
> +       /* Write command register to trigger processing */
> +       cmd_reg =3D FIELD_PREP(PSP_MBOX_FIELDS_CMD, PSP_I2C_REQ_BUS_CMD);
> +       writel(cmd_reg, &mbox->cmd_fields);
> +
> +       if (psp_wait_cmd(mbox))
> +               return -ETIMEDOUT;
> +
> +       if (psp_check_mbox_sts(mbox))
> +               return -EIO;
> +
> +       return 0;
> +}
> +
> +/* Helper to verify status returned by PSP */
> +static int check_i2c_req_sts(struct psp_i2c_req *req)
> +{
> +       int status;
> +
> +       status =3D readl(&req->hdr.status);
> +
> +       switch (status) {
> +       case PSP_I2C_REQ_STS_OK:
> +               return 0;
> +       case PSP_I2C_REQ_STS_BUS_BUSY:
> +               return -EBUSY;
> +       case PSP_I2C_REQ_STS_INV_PARAM:
> +       default:
> +               return -EIO;
> +       };
> +}
> +
> +static int psp_send_check_i2c_req(struct psp_i2c_req *req)
> +{
> +       if (psp_send_cmd(req))
> +               return -EIO;
> +
> +       return check_i2c_req_sts(req);
> +}
> +
> +static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
> +{
> +       struct psp_i2c_req *req;
> +       unsigned long start;
> +       int status, ret;
> +
> +       /* Allocate command-response buffer */
> +       req =3D kzalloc(sizeof(*req), GFP_KERNEL);
> +       if (!req)
> +               return -ENOMEM;
> +
> +       req->hdr.total_size =3D sizeof(*req);
> +       req->type =3D i2c_req_type;
> +
> +       start =3D jiffies;
> +       ret =3D read_poll_timeout(psp_send_check_i2c_req, status,
> +                               (status !=3D -EBUSY),
> +                               PSP_I2C_REQ_RETRY_DELAY_USEC,
> +                               PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY=
_DELAY_USEC,
> +                               0, req);
> +       if (ret)
> +               goto cleanup;
> +
> +       if (status) {
> +               ret =3D status;
> +               goto cleanup;
> +       }
> +
> +       dev_dbg(psp_i2c_dev, "Request accepted by PSP after %ums\n",
> +               jiffies_to_msecs(jiffies - start));
> +
> +cleanup:
> +       kfree(req);
> +       return ret;
> +}
> +
> +static int psp_acquire_i2c_bus(void)
> +{
> +       int status;
> +
> +       mutex_lock(&psp_i2c_access_mutex);
> +
> +       /* Return early if mailbox malfunctioned */
> +       if (psp_i2c_mbox_fail)
> +               goto cleanup;
> +
> +       /*
> +        * Simply increment usage counter and return if PSP semaphore was
> +        * already taken by kernel.
> +        */
> +       if (psp_i2c_access_count > 0) {
> +               psp_i2c_access_count++;
> +               goto cleanup;
> +       };
> +
> +       status =3D psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> +       if (status) {
> +               if (status =3D=3D -ETIMEDOUT)
> +                       dev_err(psp_i2c_dev, "Timed out waiting for PSP t=
o release I2C bus\n");
> +               else
> +                       dev_err(psp_i2c_dev, "PSP communication error\n")=
;
> +
> +               dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive hos=
t usage\n");
> +               psp_i2c_mbox_fail =3D true;
> +               goto cleanup;
> +       }
> +
> +       psp_i2c_sem_acquired =3D jiffies;
> +       psp_i2c_access_count++;
> +
> +cleanup:
> +       mutex_unlock(&psp_i2c_access_mutex);
> +       return 0;
> +}
> +
> +static void psp_release_i2c_bus(void)
> +{
> +       int status;
> +
> +       mutex_lock(&psp_i2c_access_mutex);
> +
> +       /* Return early if mailbox was malfunctional */
> +       if (psp_i2c_mbox_fail)
> +               goto cleanup;
> +
> +       /*
> +        * If we are last owner of PSP semaphore, need to release aribtra=
tion
> +        * via mailbox.
> +        */
> +       psp_i2c_access_count--;
> +       if (psp_i2c_access_count > 0)
> +               goto cleanup;
> +
> +       /* Send a release command to PSP */
> +       status =3D psp_send_i2c_req(PSP_I2C_REQ_RELEASE);
> +       if (status) {
> +               if (status =3D=3D -ETIMEDOUT)
> +                       dev_err(psp_i2c_dev, "Timed out waiting for PSP t=
o acquire I2C bus\n");
> +               else
> +                       dev_err(psp_i2c_dev, "PSP communication error\n")=
;
> +
> +               dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive hos=
t usage\n");
> +               psp_i2c_mbox_fail =3D true;
> +               goto cleanup;
> +       }
> +
> +       dev_dbg(psp_i2c_dev, "PSP semaphore held for %ums\n",
> +               jiffies_to_msecs(jiffies - psp_i2c_sem_acquired));
> +
> +cleanup:
> +       mutex_unlock(&psp_i2c_access_mutex);
> +}
> +
> +/*
> + * Locking methods are based on the default implementation from
> + * drivers/i2c/i2c-core-base.c, but with psp acquire and release operati=
ons
> + * added. With this in place we can ensure that i2c clients on the bus s=
hared
> + * with psp are able to lock HW access to the bus for arbitrary number o=
f
> + * operations - that is e.g. write-wait-read.
> + */
> +static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
> +                                       unsigned int flags)
> +{
> +       psp_acquire_i2c_bus();
> +       rt_mutex_lock_nested(&adapter->bus_lock, i2c_adapter_depth(adapte=
r));
> +}
> +
> +static int i2c_adapter_dw_psp_trylock_bus(struct i2c_adapter *adapter,
> +                                         unsigned int flags)
> +{
> +       int ret;
> +
> +       ret =3D rt_mutex_trylock(&adapter->bus_lock);
> +       if (ret)
> +               return ret;
> +
> +       psp_acquire_i2c_bus();
> +
> +       return ret;
> +}
> +
> +static void i2c_adapter_dw_psp_unlock_bus(struct i2c_adapter *adapter,
> +                                         unsigned int flags)
> +{
> +       psp_release_i2c_bus();
> +       rt_mutex_unlock(&adapter->bus_lock);
> +}
> +
> +static const struct i2c_lock_operations i2c_dw_psp_lock_ops =3D {
> +       .lock_bus =3D i2c_adapter_dw_psp_lock_bus,
> +       .trylock_bus =3D i2c_adapter_dw_psp_trylock_bus,
> +       .unlock_bus =3D i2c_adapter_dw_psp_unlock_bus,
> +};
> +
> +int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
> +{
> +       int ret;
> +
> +       if (!dev || !dev->dev)
> +               return -ENODEV;
> +
> +       if (!(dev->flags & ARBITRATION_SEMAPHORE))
> +               return -ENODEV;
> +
> +       /* Allow to bind only one instance of a driver */
> +       if (psp_i2c_dev)
> +               return -EEXIST;
> +
> +       psp_i2c_dev =3D dev->dev;
> +
> +       ret =3D psp_mbox_probe();
> +       if (ret)
> +               return ret;
> +
> +       dev_info(psp_i2c_dev, "I2C bus managed by AMD PSP\n");
> +
> +       /*
> +        * Install global locking callbacks for adapter as well as intern=
al i2c
> +        * controller locks.
> +        */
> +       dev->adapter.lock_ops =3D &i2c_dw_psp_lock_ops;
> +       dev->acquire_lock =3D psp_acquire_i2c_bus;
> +       dev->release_lock =3D psp_release_i2c_bus;
> +
> +       return 0;
> +}
> +
> +/* Unmap area used as a mailbox with PSP */
> +void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev)
> +{
> +       iounmap(mbox_iomem);
> +}
> diff --git a/drivers/i2c/busses/i2c-designware-baytrail.c b/drivers/i2c/b=
usses/i2c-designware-baytrail.c
> index c6a7a00e1d52..0c674542dd99 100644
> --- a/drivers/i2c/busses/i2c-designware-baytrail.c
> +++ b/drivers/i2c/busses/i2c-designware-baytrail.c
> @@ -12,25 +12,25 @@
>
>  #include "i2c-designware-core.h"
>
> -int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> +int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev)
>  {
>         acpi_status status;
>         unsigned long long shared_host =3D 0;
>         acpi_handle handle;
>
>         if (!dev || !dev->dev)
> -               return 0;
> +               return -ENODEV;
>
>         handle =3D ACPI_HANDLE(dev->dev);
>         if (!handle)
> -               return 0;
> +               return -ENODEV;
>
>         status =3D acpi_evaluate_integer(handle, "_SEM", NULL, &shared_ho=
st);
>         if (ACPI_FAILURE(status))
> -               return 0;
> +               return -ENODEV;
>
>         if (!shared_host)
> -               return 0;
> +               return -ENODEV;
>
>         if (!iosf_mbi_available())
>                 return -EPROBE_DEFER;
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busse=
s/i2c-designware-core.h
> index 4b26cba40139..1d65212fddbd 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -227,6 +227,8 @@ struct reset_control;
>   * @hs_lcnt: high speed LCNT value
>   * @acquire_lock: function to acquire a hardware lock on the bus
>   * @release_lock: function to release a hardware lock on the bus
> + * @semaphore_idx: Index of table with semaphore type attached to the bu=
s. It's
> + *     -1 if there is no semaphore.
>   * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
>   * @disable: function to disable the controller
>   * @disable_int: function to disable all interrupts
> @@ -285,6 +287,7 @@ struct dw_i2c_dev {
>         u16                     hs_lcnt;
>         int                     (*acquire_lock)(void);
>         void                    (*release_lock)(void);
> +       int                     semaphore_idx;
>         bool                    shared_with_punit;
>         void                    (*disable)(struct dw_i2c_dev *dev);
>         void                    (*disable_int)(struct dw_i2c_dev *dev);
> @@ -297,6 +300,7 @@ struct dw_i2c_dev {
>
>  #define ACCESS_INTR_MASK       BIT(0)
>  #define ACCESS_NO_IRQ_SUSPEND  BIT(1)
> +#define ARBITRATION_SEMAPHORE  BIT(2)
>
>  #define MODEL_MSCC_OCELOT      BIT(8)
>  #define MODEL_BAIKAL_BT1       BIT(9)
> @@ -310,6 +314,11 @@ struct dw_i2c_dev {
>  #define AMD_UCSI_INTR_REG      0x474
>  #define AMD_UCSI_INTR_EN       0xd
>
> +struct i2c_dw_semaphore_callbacks {
> +       int     (*probe)(struct dw_i2c_dev *dev);
> +       void    (*remove)(struct dw_i2c_dev *dev);
> +};
> +
>  int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
>  u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offse=
t);
>  u32 i2c_dw_scl_lcnt(u32 ic_clk, u32 tLOW, u32 tf, int offset);
> @@ -370,9 +379,12 @@ static inline void i2c_dw_configure(struct dw_i2c_de=
v *dev)
>  }
>
>  #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
> -extern int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev);
> -#else
> -static inline int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev) { re=
turn 0; }
> +int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
> +#endif
> +
> +#if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
> +int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
> +void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
>  #endif
>
>  int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/bu=
sses/i2c-designware-platdrv.c
> index 2bd81abc86f6..7cb555d6c2e8 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -50,6 +50,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] =
=3D {
>         { "808622C1", ACCESS_NO_IRQ_SUSPEND },
>         { "AMD0010", ACCESS_INTR_MASK },
>         { "AMDI0010", ACCESS_INTR_MASK },
> +       { "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
>         { "AMDI0510", 0 },
>         { "APMC0D0F", 0 },
>         { "HISI02A1", 0 },
> @@ -204,6 +205,64 @@ static const struct dmi_system_id dw_i2c_hwmon_class=
_dmi[] =3D {
>         { } /* terminate list */
>  };
>
> +static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table=
[] =3D {
> +#ifdef CONFIG_I2C_DESIGNWARE_BAYTRAIL
> +       {
> +               .probe =3D i2c_dw_baytrail_probe_lock_support,
> +       },
> +#endif
> +#ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
> +       {
> +               .probe =3D i2c_dw_amdpsp_probe_lock_support,
> +               .remove =3D i2c_dw_amdpsp_remove_lock_support,
> +       },
> +#endif
> +       {}
> +};
> +
> +static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
> +{
> +       const struct i2c_dw_semaphore_callbacks *ptr;
> +       int i =3D 0;
> +       int ret;
> +
> +       ptr =3D i2c_dw_semaphore_cb_table;
> +
> +       dev->semaphore_idx =3D -1;
> +
> +       while (ptr->probe) {
> +               ret =3D ptr->probe(dev);
> +               if (ret) {
> +                       /*
> +                        * If there is no semaphore device attached to th=
is
> +                        * controller, we shouldn't abort general i2c_con=
troller
> +                        * probe.
> +                        */
> +                       if (ret =3D=3D -ENODEV) {
> +                               i++;
> +                               ptr++;
> +                               continue;
> +                       } else {
> +                               return ret;
> +                       }
> +               }
> +
> +               dev->semaphore_idx =3D i;
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
> +{
> +       if (dev->semaphore_idx < 0)
> +               return;
> +
> +       if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
> +               i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev)=
;
> +}
> +
>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
>         struct i2c_adapter *adap;
> @@ -334,6 +393,8 @@ static int dw_i2c_plat_remove(struct platform_device =
*pdev)
>         pm_runtime_put_sync(&pdev->dev);
>         dw_i2c_plat_pm_cleanup(dev);
>
> +       i2c_dw_remove_lock_support(dev);
> +
>         reset_control_assert(dev->rst);
>
>         return 0;
> --
> 2.35.0.rc0.227.g00780c9af4-goog
>
