Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1BA4AB6B3
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 09:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbiBGIf6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 03:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244786AbiBGI10 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 03:27:26 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2691AC043181
        for <linux-i2c@vger.kernel.org>; Mon,  7 Feb 2022 00:27:25 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 192so11716253pfz.3
        for <linux-i2c@vger.kernel.org>; Mon, 07 Feb 2022 00:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FUgg4Equ2He9Zu5YgUnLDTuk24eDlugPiPqltuoxuSI=;
        b=jsxJRPT5HrKdHN0aukhZ0jx5VsFJukcuO8DiaecEH3isCh7tmsxns7tJLrMewiBVI4
         vdihfqxC3KiIFTQJUGNNwt7nqS5LqidMhjO++/PcnFQy3iQM7buSi9yUMg9+cfCQiVtT
         zfW3kwOTkGcxTYTOCA9KFaNlrb5tJ4lfJo51Fqqknudnl1W1c4fhmWPvT0nKc7XKnmpm
         /b+U6schCJi+xPqNqqSKenOH78L93ovKF/x0iCBQKLp68PjpKHpZDgdAFWWZwxYUYJKX
         ZWNrvGOugVs4hlosEbQc1Y9sJTSpzsNgO+Vch10WLCm1QV78HR6Slj7AnRnvgHZe/akn
         f7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FUgg4Equ2He9Zu5YgUnLDTuk24eDlugPiPqltuoxuSI=;
        b=nEIYBz639e5SC9zu/Bd7cHvuoiI8GUXOZM8IvH5V2ZXqc3XIpSITIQsEQlR3ZDGS52
         uL8DpEDo1f0ApIAYA4kC1yjas8jhdWv0pLgFyc6k6u9lKTY+/FeE/Z+MsQc+/MlabrEK
         guXP05wxAfnpD6aOz/AMmOS2G9xMg9yz3c2B151ITnLUGXshvRux8gLExrJW1aHuAyv1
         jIXf0qDrxhfkCiQhDlCWM5KqC796PO4PouIe6N4pgqmMWFe0GQ1ZbU3Q8tteJmBXA5iz
         o9uhwHyySZ/T99//5JhniqJCCaTPa6sc3XD9bHZFH24RDFfNui0yqRfMkqHx38SwOHyq
         nWrw==
X-Gm-Message-State: AOAM532EwdphJXhC9CfWVEerVQdJ93OkSHoJpHt+RYP6k8Kn6vR5dbjw
        TBpKMtONXs+oydfh3/f87Y7m2wngoYsBlD+fzrPbhw==
X-Google-Smtp-Source: ABdhPJx2eW3thz8UJ/xBubbYMDkStcxn24j3cGWJnzcGfETIdIlBkrOO9dGxLR3+mfZtG34i2txITFEvo/Jq56FzQ00=
X-Received: by 2002:a63:d848:: with SMTP id k8mr8633728pgj.164.1644222444466;
 Mon, 07 Feb 2022 00:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-2-jsd@semihalf.com> <20220202144302.1438303-1-jsd@semihalf.com>
 <20220202144302.1438303-2-jsd@semihalf.com> <YfqtkBIZZxp2Au2l@smile.fi.intel.com>
In-Reply-To: <YfqtkBIZZxp2Au2l@smile.fi.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 7 Feb 2022 09:27:12 +0100
Message-ID: <CAOtMz3O_j5-0ZLJngQpzQSGduhZVnQ8awBvGkMdUQWAX8nN5Hw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

=C5=9Br., 2 lut 2022 o 17:16 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Wed, Feb 02, 2022 at 03:43:02PM +0100, Jan Dabros wrote:
> > Implement an I2C controller sharing mechanism between the host (kernel)
> > and PSP co-processor on some platforms equipped with AMD Cezanne SoC.
> >
> > On these platforms we need to implement "software" i2c arbitration.
> > Default arbitration owner is PSP and kernel asks for acquire as well
> > as inform about release of the i2c bus via mailbox mechanism.
> >
> >             +---------+
> >  <- ACQUIRE |         |
> >   +---------|   CPU   |\
> >   |         |         | \      +----------+  SDA
> >   |         +---------+  \     |          |-------
> > MAILBOX                   +--> |  I2C-DW  |  SCL
> >   |         +---------+        |          |-------
> >   |         |         |        +----------+
> >   +---------|   PSP   |
> >    <- ACK   |         |
> >             +---------+
> >
> >             +---------+
> >  <- RELEASE |         |
> >   +---------|   CPU   |
> >   |         |         |        +----------+  SDA
> >   |         +---------+        |          |-------
> > MAILBOX                   +--> |  I2C-DW  |  SCL
> >   |         +---------+  /     |          |-------
> >   |         |         | /      +----------+
> >   +---------|   PSP   |/
> >    <- ACK   |         |
> >             +---------+
> >
> > The solution is similar to i2c-designware-baytrail.c implementation, wh=
ere
> > we are using a generic i2c-designware-* driver with a small "wrapper".
> >
> > In contrary to baytrail semaphore implementation, beside internal
> > acquire_lock() and release_lock() methods we are also applying quirks t=
o
> > lock_bus() and unlock_bus() global adapter methods. With this in place
> > all i2c clients drivers may lock i2c bus for a desired number of i2c
> > transactions (e.g. write-wait-read) without being aware of that such bu=
s
> > is shared with another entity.
> >
> > Modify i2c_dw_probe_lock_support() to select correct semaphore
> > implementation at runtime, since now we have more than one available.
> >
> > Configure new matching ACPI ID "AMDI0019" and register
> > ARBITRATION_SEMAPHORE flag in order to distinguish setup with PSP
> > arbitration.
> >
> > Add myself as a reviewer for I2C DesignWare in order to help with revie=
wing
> > and testing possible changes touching new i2c-designware-amdpsp.c modul=
e.
>
> Side note, please start a new email thread for new version of the series.

Sure, will do so starting with v4.

>
> Looks good enough to me, although a few minor comments below.
> Up to you to address them now or later.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks a lot! I will address your comments and send v4.

>
> > Signed-off-by: Jan Dabros <jsd@semihalf.com>

(...)

> > --- /dev/null
> > +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> > @@ -0,0 +1,389 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/bitfield.h>
>
> IIRC this does not guarantee bits.h inclusion.

That is correct. There is a comment in bitfield.h with example of
GENMASK usage, but bits.h isn't actually included there.

>
> > +#include <linux/i2c.h>
> > +#include <linux/io-64-nonatomic-lo-hi.h>
> > +#include <linux/psp-sev.h>
> > +#include <linux/types.h>
> > +
> > +#include <asm/msr.h>
> > +
> > +#include "i2c-designware-core.h"
> > +
> > +#define MSR_AMD_PSP_ADDR     0xc00110a2
> > +#define PSP_MBOX_OFFSET              0x10570
> > +#define PSP_CMD_TIMEOUT_MS   500
> > +
> > +#define PSP_I2C_REQ_BUS_CMD          0x64
> > +#define PSP_I2C_REQ_RETRY_CNT                10
> > +#define PSP_I2C_REQ_RETRY_DELAY_USEC (50 * 1000)
>
> _US is enough and possibly (50 * USEC_PER_MSEC).

ACK.

>
> > +#define PSP_I2C_REQ_STS_OK           0x0
> > +#define PSP_I2C_REQ_STS_BUS_BUSY     0x1
> > +#define PSP_I2C_REQ_STS_INV_PARAM    0x3
> > +
> > +#define PSP_MBOX_FIELDS_STS          GENMASK(15, 0)
> > +#define PSP_MBOX_FIELDS_CMD          GENMASK(23, 16)
> > +#define PSP_MBOX_FIELDS_RESERVED     GENMASK(29, 24)
> > +#define PSP_MBOX_FIELDS_RECOVERY     BIT(30)
> > +#define PSP_MBOX_FIELDS_READY                BIT(31)
> > +
> > +struct psp_req_buffer_hdr {
> > +     u32 total_size;
> > +     u32 status;
> > +};
> > +
> > +enum psp_i2c_req_type {
> > +     PSP_I2C_REQ_ACQUIRE,
> > +     PSP_I2C_REQ_RELEASE,
> > +     PSP_I2C_REQ_MAX
> > +};
> > +
> > +struct psp_i2c_req {
> > +     struct psp_req_buffer_hdr hdr;
> > +     enum psp_i2c_req_type type;
> > +} __aligned(32);
>
> I forgot if this alignment is requirement due to DMA or so?
> We may use ____cacheline_aligned in such case.

I used some old code as a reference - this structure is mapped by PSP,
thus alignment applied here. I'm checking this with AMD whether it is
really needed or at least can be somehow limited - still waiting for
their response.
I propose to left this as is right now and eventually remove or make
more liberal in the future.

>
> > +struct psp_mbox {
> > +     u32 cmd_fields;
> > +     u64 i2c_req_addr;
> > +} __packed;
> > +
> > +static DEFINE_MUTEX(psp_i2c_access_mutex);
> > +static unsigned long psp_i2c_sem_acquired;
> > +static void __iomem *mbox_iomem;
> > +static u32 psp_i2c_access_count;
> > +static bool psp_i2c_mbox_fail;
> > +static struct device *psp_i2c_dev;
> > +
> > +/*
> > + * Implementation of PSP-x86 i2c-arbitration mailbox introduced for AM=
D Cezanne
> > + * family of SoCs.
> > + */
> > +
> > +static int psp_get_mbox_addr(unsigned long *mbox_addr)
> > +{
> > +     unsigned long long psp_mmio;
> > +
> > +     if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
> > +             return -EIO;
> > +
> > +     *mbox_addr =3D (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
> > +
> > +     return 0;
> > +}
> > +
> > +static int psp_mbox_probe(void)
> > +{
> > +     unsigned long mbox_addr;
> > +     int ret;
> > +
> > +     ret =3D psp_get_mbox_addr(&mbox_addr);
> > +     if (ret)
> > +             return ret;
> > +
> > +     mbox_iomem =3D ioremap(mbox_addr, sizeof(struct psp_mbox));
> > +     if (!mbox_iomem)
> > +             return -ENOMEM;
> > +
> > +     return 0;
> > +}
> > +
> > +
> > +/* Recovery field should be equal 0 to start sending commands */
> > +static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
> > +{
> > +     u32 tmp;
> > +
> > +     tmp =3D readl(&mbox->cmd_fields);
> > +
> > +     return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
> > +}
> > +
> > +static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
> > +{
> > +     u32 tmp, expected;
> > +
> > +     /* Expect mbox_cmd to be cleared and ready bit to be set by PSP *=
/
> > +     expected =3D FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
> > +
> > +     return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp =3D=3D exp=
ected),
> > +                               0, 1000 * PSP_CMD_TIMEOUT_MS);
>
> 0?!

Yes, we are checking for readiness of PSP mailbox in a tight loop. We
would like to proceed further quickly as soon as this bit is set.
Actually checking this twice per every ACQUIRE&RELEASE - once before
sending command (to check whether PSP is ready to accept requests) and
second time after sending it. Do you think we should increase
@sleep_us value?

>
> > +}
> > +
> > +/* Status equal to 0 means that PSP succeed processing command */
> > +static int psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
>
>   static u32 ...
>
> So reader will know it won't return error codes.

ACK/

>
> > +{
> > +     u32 cmd_reg;
> > +
> > +     cmd_reg =3D readl(&mbox->cmd_fields);
> > +
> > +     return FIELD_GET(PSP_MBOX_FIELDS_STS, cmd_reg);
> > +}
> > +
> > +static int psp_send_cmd(struct psp_i2c_req *req)
> > +{
> > +     struct psp_mbox __iomem *mbox =3D mbox_iomem;
> > +     phys_addr_t req_addr;
> > +     u32 cmd_reg;
> > +
> > +     if (psp_check_mbox_recovery(mbox))
> > +             return -EIO;
> > +
> > +     if (psp_wait_cmd(mbox))
> > +             return -EBUSY;
> > +
> > +     /*
> > +      * Fill mailbox with address of command-response buffer, which wi=
ll be
> > +      * used for sending i2c requests as well as reading status return=
ed by
> > +      * PSP. Use physical address of buffer, since PSP will map this r=
egion.
> > +      */
> > +     req_addr =3D __psp_pa((void *)req);
> > +     writeq(req_addr, &mbox->i2c_req_addr);
> > +
> > +     /* Write command register to trigger processing */
> > +     cmd_reg =3D FIELD_PREP(PSP_MBOX_FIELDS_CMD, PSP_I2C_REQ_BUS_CMD);
> > +     writel(cmd_reg, &mbox->cmd_fields);
> > +
> > +     if (psp_wait_cmd(mbox))
> > +             return -ETIMEDOUT;
> > +
> > +     if (psp_check_mbox_sts(mbox))
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
> > +
> > +/* Helper to verify status returned by PSP */
> > +static int check_i2c_req_sts(struct psp_i2c_req *req)
> > +{
> > +     int status;
> > +
> > +     status =3D readl(&req->hdr.status);
> > +
> > +     switch (status) {
> > +     case PSP_I2C_REQ_STS_OK:
> > +             return 0;
> > +     case PSP_I2C_REQ_STS_BUS_BUSY:
> > +             return -EBUSY;
> > +     case PSP_I2C_REQ_STS_INV_PARAM:
> > +     default:
> > +             return -EIO;
> > +     };
> > +}
> > +
> > +static int psp_send_check_i2c_req(struct psp_i2c_req *req)
> > +{
> > +     /*
> > +      * Errors in x86-PSP i2c-arbitration protocol may occur at two le=
vels:
> > +      * 1. mailbox communication - PSP is not operational or some IO e=
rrors
> > +      * with basic communication had happened;
> > +      * 2. i2c-requests - PSP refuses to grant i2c arbitration to x86 =
for too
> > +      * long.
> > +      * In order to distinguish between these two in error handling co=
de, all
> > +      * errors on the first level (returned by psp_send_cmd) are shado=
wed by
> > +      * -EIO.
> > +      */
> > +     if (psp_send_cmd(req))
> > +             return -EIO;
> > +
> > +     return check_i2c_req_sts(req);
> > +}
> > +
> > +static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
> > +{
> > +     struct psp_i2c_req *req;
> > +     unsigned long start;
> > +     int status, ret;
> > +
> > +     /* Allocate command-response buffer */
> > +     req =3D kzalloc(sizeof(*req), GFP_KERNEL);
> > +     if (!req)
> > +             return -ENOMEM;
> > +
> > +     req->hdr.total_size =3D sizeof(*req);
> > +     req->type =3D i2c_req_type;
> > +
> > +     start =3D jiffies;
> > +     ret =3D read_poll_timeout(psp_send_check_i2c_req, status,
> > +                             (status !=3D -EBUSY),
> > +                             PSP_I2C_REQ_RETRY_DELAY_USEC,
> > +                             PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY=
_DELAY_USEC,
> > +                             0, req);
> > +     if (ret)
> > +             goto cleanup;
>
> > +     if (status) {
> > +             ret =3D status;
> > +             goto cleanup;
> > +     }
>
> I would write it in this form:
>
>         ret =3D status;
>         if (ret)
>                 goto cleanup;

ACK.

> > +     dev_dbg(psp_i2c_dev, "Request accepted by PSP after %ums\n",
> > +             jiffies_to_msecs(jiffies - start));
> > +
> > +cleanup:
> > +     kfree(req);
> > +     return ret;
> > +}
> > +
> > +static int psp_acquire_i2c_bus(void)
> > +{
> > +     int status;
> > +
> > +     mutex_lock(&psp_i2c_access_mutex);
> > +
> > +     /* Return early if mailbox malfunctioned */
> > +     if (psp_i2c_mbox_fail)
> > +             goto cleanup;
> > +
> > +     /*
> > +      * Simply increment usage counter and return if PSP semaphore was
> > +      * already taken by kernel.
> > +      */
> > +     if (psp_i2c_access_count > 0) {
>
> ' > 0' is redundant. It's unsigned.

ACK.

>
> > +             psp_i2c_access_count++;
> > +             goto cleanup;
> > +     };
> > +
> > +     status =3D psp_send_i2c_req(PSP_I2C_REQ_ACQUIRE);
> > +     if (status) {
> > +             if (status =3D=3D -ETIMEDOUT)
> > +                     dev_err(psp_i2c_dev, "Timed out waiting for PSP t=
o release I2C bus\n");
> > +             else
> > +                     dev_err(psp_i2c_dev, "PSP communication error\n")=
;
> > +
> > +             dev_err(psp_i2c_dev, "Assume i2c bus is for exclusive hos=
t usage\n");
> > +             psp_i2c_mbox_fail =3D true;
> > +             goto cleanup;
> > +     }
> > +
> > +     psp_i2c_sem_acquired =3D jiffies;
> > +     psp_i2c_access_count++;
> > +
> > +     /*
> > +      * In case of errors with PSP arbitrator psp_i2c_mbox_fail variab=
le is
> > +      * set above. As a consequence consecutive calls to acquire will =
bypass
> > +      * communication with PSP. At any case i2c bus is granted to the =
caller,
> > +      * thus always return success.
> > +      */
> > +cleanup:
> > +     mutex_unlock(&psp_i2c_access_mutex);
> > +     return 0;
> > +}
> > +
> > +static void psp_release_i2c_bus(void)
> > +{
> > +     int status;
> > +
> > +     mutex_lock(&psp_i2c_access_mutex);
> > +
> > +     /* Return early if mailbox was malfunctional */
> > +     if (psp_i2c_mbox_fail)
> > +             goto cleanup;
> > +
> > +     /*
> > +      * If we are last owner of PSP semaphore, need to release aribtra=
tion
> > +      * via mailbox.
> > +      */
> > +     psp_i2c_access_count--;
>
> > +     if (psp_i2c_access_count > 0)
>
> Ditto.

ACK.

Best Regards,
Jan
