Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0489634F9BE
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 09:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbhCaHVc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 03:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbhCaHVS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Mar 2021 03:21:18 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 257BCC061574;
        Wed, 31 Mar 2021 00:21:18 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id j7so13803513qtx.5;
        Wed, 31 Mar 2021 00:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s4dZpKsQjRIf/50NcJCIC9AC6YrNNOPiTIacHmapqUk=;
        b=KNeC8fgHEIGbXL6MkMCcRhM8c8/bw5Fqa99LAA9XUWBQfo4dGIfI7K7aw2WiLfeZ2+
         S/QYZw/AvMC47f8HgBVTcomSLsmoDcoZvQbccRD77AEwNgmGu/8m4jy6m2E90YSCvK5o
         J3MKquvsYOtrLSOEA4wgCkulSWpXgqTwB0388=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s4dZpKsQjRIf/50NcJCIC9AC6YrNNOPiTIacHmapqUk=;
        b=PPQVKmba2M7nxJw2h0D9y3ohTQRcSAQgu2//FeCEwyCkon7U02/tCkiFswsDy00m/Y
         BdZTXsn2zVI2o6t2LreiKWXbSr86IUkioGFcehEAVAmgv/B0NcEK1VoCl64g8gy7VyA4
         Zfy/EOpGRzJdwM4aYWQZlncabbJnf47g7u6HZnHMsz+eTbSM+UjT3OestXJIxPoRi4OA
         Wnx/Ghdjmisu6OztJttmrmrhXPblx9/CuWnXp5o9xzxd0IACw+znnelUy2SFU5N9xcLK
         ehY70bxofu+eHjgFfkz6EREceLtWp/2n5rMx3/Z7VwmkxOgZsQ0H2+XaLQLGGhIH25BX
         CfTg==
X-Gm-Message-State: AOAM533S2fZe8ExJXT+LZLThnB6r5sAfcYdIOy4OFfaFeQ6hiC6oXZHk
        B4wFhysIwN6bJf92S7TGtmwQvOAINosC3uVNNTYQBwJMDlRmbw==
X-Google-Smtp-Source: ABdhPJwnUlUXgKe2tnHuiik3PVhNtVpJHhdq/BPuODbeA/sZCuXAIkATJqEwOFPe8pk3PPsITOGZ1i91w6KQ5iosdGU=
X-Received: by 2002:ac8:7547:: with SMTP id b7mr1372933qtr.176.1617175277091;
 Wed, 31 Mar 2021 00:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210329121759.5644-1-quan@os.amperecomputing.com> <20210329121759.5644-3-quan@os.amperecomputing.com>
In-Reply-To: <20210329121759.5644-3-quan@os.amperecomputing.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 31 Mar 2021 07:21:05 +0000
Message-ID: <CACPK8Xf5d67-KR9AQ9QMcyT2Or9ieF_Q+_RbMMTHt4ckiKi6_A@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drivers: char: ipmi: Add Aspeed SSIF BMC driver
To:     Quan Nguyen <quan@os.amperecomputing.com>
Cc:     Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        openipmi-developer@lists.sourceforge.net,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 29 Mar 2021 at 12:18, Quan Nguyen <quan@os.amperecomputing.com> wrote:
>
> The SMBus system interface (SSIF) IPMI BMC driver can be used to perform
> in-band IPMI communication with their host in management (BMC) side.
>
> This commits adds support specifically for Aspeed AST2500 which commonly
> used as Board Management Controllers.
>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>

I don't have any SSIF or IPMI related feedback on your patch, but some
general things I noticed when reading it.

> ---
>  drivers/char/ipmi/Kconfig           |  22 +
>  drivers/char/ipmi/Makefile          |   2 +
>  drivers/char/ipmi/ssif_bmc.c        | 645 ++++++++++++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h        |  92 ++++
>  drivers/char/ipmi/ssif_bmc_aspeed.c | 132 ++++++
>  5 files changed, 893 insertions(+)
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
>  create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c

It would make sense to split the aspeed implementation into a separate
patch form the ssif framework.

> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -0,0 +1,645 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * The driver for BMC side of SSIF interface
> + *
> + * Copyright (c) 2021, Ampere Computing LLC
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <https://www.gnu.org/licenses/>.

You should omit the licence text; it is replaced by the SPDX tags.

> +static int send_ssif_bmc_response(struct ssif_bmc_ctx *ssif_bmc, bool non_blocking)
> +{
> +       unsigned long flags;
> +       int ret;
> +
> +       if (!non_blocking) {
> +retry:
> +               ret = wait_event_interruptible(ssif_bmc->wait_queue,
> +                                              !ssif_bmc->response_in_progress);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       spin_lock_irqsave(&ssif_bmc->lock, flags);

What's the lock doing here? We've just waited for response_in_progress
to be false, so we then take the lock to check what value it is?
Should it also be sending some data in this function?

> +       if (ssif_bmc->response_in_progress) {
> +               spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +               if (non_blocking)
> +                       return -EAGAIN;
> +
> +               goto retry;

The goto threw me, so I tried re-writing it without. Again, I don't
quite follow what the spinlock is doing.

while (1) {
    if (blocking) {
        ret = wait_event_interruptible();
        if (ret)
             return ret;
    }

     spin_lock_irqsave()
     if (ssif_bmc->response_in_progress) {
         spin_lock_irqrestore()
         if (!blocking)
             return -EAGAIN;
     } else {
        spin_lock_irqrestore()
        break;
     }
}


> +       }
> +
> +       /*
> +        * Check the response data length from userspace to determine the type
> +        * of the response message whether it is single-part or multi-part.
> +        */
> +       ssif_bmc->is_singlepart_read =
> +               (ssif_msg_len(&ssif_bmc->response) <= (MAX_PAYLOAD_PER_TRANSACTION + 1)) ?
> +               true : false; /* 1: byte of length */

I don't follow the 1: byte of length comment, what is it telling me?

The ternary operator is a bit messy here, I'd go for a good old if statement.

> +
> +       ssif_bmc->response_in_progress = true;
> +       spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +       return 0;
> +}

> +/* Handle SSIF message that will be sent to user */
> +static ssize_t ssif_bmc_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
> +{
> +       struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +       struct ssif_msg msg;
> +       unsigned long flags;
> +       ssize_t ret;
> +
> +       mutex_lock(&ssif_bmc->file_mutex);

->file_mutex is protecting the device against more than one user of
the character device? Can you enforce that in open() instead?

> +
> +       ret = receive_ssif_bmc_request(ssif_bmc, file->f_flags & O_NONBLOCK);
> +       if (ret < 0)
> +               goto out;
> +
> +       spin_lock_irqsave(&ssif_bmc->lock, flags);
> +       count = min_t(ssize_t, count, ssif_msg_len(&ssif_bmc->request));

count is user controlled, so I assume ssif_msg_len will always be less
than or equal to struct ssif_msg?

> +       memcpy(&msg, &ssif_bmc->request, count);
> +       ssif_bmc->request_available = false;
> +       spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +       ret = copy_to_user(buf, &msg, count);
> +out:
> +       mutex_unlock(&ssif_bmc->file_mutex);
> +
> +       return (ret < 0) ? ret : count;
> +}
> +
> +/* Handle SSIF message that is written by user */
> +static ssize_t ssif_bmc_write(struct file *file, const char __user *buf, size_t count,
> +                             loff_t *ppos)
> +{
> +       struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +       struct ssif_msg msg;
> +       unsigned long flags;
> +       ssize_t ret;
> +
> +       if (count > sizeof(struct ssif_msg))
> +               return -EINVAL;
> +
> +       mutex_lock(&ssif_bmc->file_mutex);
> +
> +       ret = copy_from_user(&msg, buf, count);
> +       if (ret)
> +               goto out;
> +
> +       spin_lock_irqsave(&ssif_bmc->lock, flags);
> +       if (count >= ssif_msg_len(&ssif_bmc->response))

Is that test correct?

> +               memcpy(&ssif_bmc->response, &msg, count);
> +       else
> +               ret = -EINVAL;
> +       spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> +
> +       if (ret)
> +               goto out;
> +
> +       ret = send_ssif_bmc_response(ssif_bmc, file->f_flags & O_NONBLOCK);
> +       if (!ret && ssif_bmc->set_ssif_bmc_status)
> +               ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_READY);
> +out:
> +       mutex_unlock(&ssif_bmc->file_mutex);
> +
> +       return (ret < 0) ? ret : count;
> +}
> +
> +static long ssif_bmc_ioctl(struct file *file, unsigned int cmd, unsigned long param)
> +{

If you're not using this I suspect you should omit the callback.

> +       return 0;
> +}
> +
> +static unsigned int ssif_bmc_poll(struct file *file, poll_table *wait)
> +{
> +       struct ssif_bmc_ctx *ssif_bmc = to_ssif_bmc(file);
> +       unsigned int mask = 0;
> +
> +       mutex_lock(&ssif_bmc->file_mutex);
> +       poll_wait(file, &ssif_bmc->wait_queue, wait);
> +
> +       /*
> +        * The request message is now available so userspace application can
> +        * get the request
> +        */
> +       if (ssif_bmc->request_available)
> +               mask |= POLLIN;
> +
> +       mutex_unlock(&ssif_bmc->file_mutex);
> +       return mask;
> +}
> +
> +/*
> + * System calls to device interface for user apps
> + */
> +static const struct file_operations ssif_bmc_fops = {
> +       .owner          = THIS_MODULE,
> +       .read           = ssif_bmc_read,
> +       .write          = ssif_bmc_write,
> +       .poll           = ssif_bmc_poll,
> +       .unlocked_ioctl = ssif_bmc_ioctl,
> +};
> +
> +/* Called with ssif_bmc->lock held. */
> +static int handle_request(struct ssif_bmc_ctx *ssif_bmc)

Could return void.

> +{
> +       if (ssif_bmc->set_ssif_bmc_status)
> +               ssif_bmc->set_ssif_bmc_status(ssif_bmc, SSIF_BMC_BUSY);
> +
> +       /* Request message is available to process */
> +       ssif_bmc->request_available = true;
> +       /*
> +        * This is the new READ request.
> +        * Clear the response buffer of the previous transaction
> +        */
> +       memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
> +       wake_up_all(&ssif_bmc->wait_queue);
> +       return 0;
> +}
> +
> +/* Called with ssif_bmc->lock held. */
> +static int complete_response(struct ssif_bmc_ctx *ssif_bmc)

Could return void.

> +{
> +       /* Invalidate response in buffer to denote it having been sent. */
> +       ssif_bmc->response.len = 0;
> +       ssif_bmc->response_in_progress = false;
> +       ssif_bmc->nbytes_processed = 0;
> +       ssif_bmc->remain_len = 0;
> +       memset(&ssif_bmc->response_buf, 0, MAX_PAYLOAD_PER_TRANSACTION);
> +       wake_up_all(&ssif_bmc->wait_queue);
> +       return 0;
> +}
> +
> +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> +{

> +       default:
> +               /* Do not expect to go to this case */
> +               pr_err("Error: Unexpected SMBus command received 0x%x\n", ssif_bmc->smbus_cmd);

Use dev_err if you can, so the message is associated with the device.

> +               break;
> +       }
> +
> +       ssif_bmc->nbytes_processed += response_len;
> +}
> +
