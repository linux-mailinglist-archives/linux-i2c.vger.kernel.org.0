Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABE41E041F
	for <lists+linux-i2c@lfdr.de>; Mon, 25 May 2020 02:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388349AbgEYAPx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 24 May 2020 20:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388300AbgEYAPw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 24 May 2020 20:15:52 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A09C061A0E
        for <linux-i2c@vger.kernel.org>; Sun, 24 May 2020 17:15:52 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id g34so4810517uah.4
        for <linux-i2c@vger.kernel.org>; Sun, 24 May 2020 17:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8xZtrj3RIgCParKhhHhrwLVYCysXTLVybnwFS/JJ2PQ=;
        b=iyoPJUoiXAuQOJjImT9SNM9IlSHykc3Cl5f/nTV4TwoEiGTP6rx7ijGWxU/iNGD3Bm
         Of0KVG48R/J1QujHwJPye1mVO6TThC6g1WpxNWzG/87qYX4e9bOYfIGSaLKvE7kBQt/Y
         SKwFs623KngRtoaSEtS9QcUA2AsjvzNWTEiPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8xZtrj3RIgCParKhhHhrwLVYCysXTLVybnwFS/JJ2PQ=;
        b=cf8oHouv8RZukLZqbEqRynS1W/4pwccuIQ9g8mztEiHykStNq1jjrJCnC4+NyeftK/
         9OExcv9kmGPB4oLTsh+E7XtEAjLY4SYvW8t2tV9h07/XNle0Sjcz1a2v7fdo39BuwIAA
         /zV2Z4INyLZsxFdgSFRiKUW4poUQCUZ04LX10BECQVjWew6DK/7mMI+okZeD64zT70kI
         TSfspXF40fd+bnZ4/mRB2C+cR73YpS9yIW9CwIbWzoGOh11ldvfKF162yump10+ScOSx
         0+ZLa1OulxIL5rA5hs2WF8zdbPxvnQ3eNA2W6srxIMj/oGScoHllo1X7OuEB38NVGd+P
         7/4w==
X-Gm-Message-State: AOAM532wVRaFV3M1qvFWlvE7VLgX0OXpblyUBGoyEQteFtxd0DpCYq3A
        ORhQzeUBq7ytjYUcM3SSKR6jJt6xnfavdOjwVGNX8Q==
X-Google-Smtp-Source: ABdhPJwS0XiPjgxCp92hhjI991iSAAc125O/5mWGvHfFIy0A2BqM2GPJsqfJbB6zR47b6fuvA0f1x8D9eJuX7dT637I=
X-Received: by 2002:ab0:6449:: with SMTP id j9mr16300773uap.117.1590365751445;
 Sun, 24 May 2020 17:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200521002907.176922-1-matthewb@chromium.org>
In-Reply-To: <20200521002907.176922-1-matthewb@chromium.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 25 May 2020 08:15:40 +0800
Message-ID: <CANMq1KACPvtc95WN+FFkPHrvar27f6eBi5oDEhD=cWBZZskXYQ@mail.gmail.com>
Subject: Re: [PATCH v4] i2c: Add i2c-pseudo driver for userspace I2C adapters.
To:     Matthew Blecker <matthewb@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Harry Cutts <hcutts@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matthew,

Overall, this is a huge driver (3K+ lines!), is there anything you can
do to try to shrink it down to the bare minimum, so we could review
that first?

Very, very, partial review below.

On Thu, May 21, 2020 at 12:29 AM Matthew Blecker <matthewb@chromium.org> wrote:
>
> The i2c-pseudo module provides I2C adapters backed by userspace programs.
> This allows for userspace implementations of functionality such as
> tunneling I2C through another communication channel, or mocking of real I2C
> devices whose behavior cannot be modeled with i2c-stub.
>
> Signed-off-by: Matthew Blecker <matthewb@chromium.org>
> Reviewed-by: Harry Cutts <hcutts@chromium.org>
> ---
> [snip]
> diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
> index 1474e57ecafc..78a6f909718a 100644
> --- a/drivers/i2c/Kconfig
> +++ b/drivers/i2c/Kconfig
> @@ -56,7 +56,7 @@ config I2C_CHARDEV
>           programs use the I2C bus.  Information on how to do this is
>           contained in the file <file:Documentation/i2c/dev-interface.rst>.
>
> -         This support is also available as a module.  If so, the module
> +         This support is also available as a module.  If so, the module

Drop this change.

>           will be called i2c-dev.
>
>  config I2C_MUX
> @@ -98,6 +98,21 @@ config I2C_SMBUS
>  source "drivers/i2c/algos/Kconfig"
>  source "drivers/i2c/busses/Kconfig"
>
> +config I2C_PSEUDO
> +       tristate "I2C userspace adapter interface"
> +       depends on m
> +       default 'n'
> +       help
> +         Say Y here to have an i2c-pseudo-controller device file, usually
> +         found in the /dev directory on your system.  This makes it
> +         possible to have user-space programs implement an I2C bus
> +         (I2C adapter in kernel lingo).  Information on how to do this is
> +         contained in the file <file:Documentation/i2c/i2c-pseudo>.
> +
> +         This support is only available as a module, called i2c-pseudo.
> +
> +         If you don't know what to do here, definitely say N.
> +
>  config I2C_STUB
>         tristate "I2C/SMBus Test Stub"
>         depends on m
> diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
> index bed6ba63c983..07d7bfea7358 100644
> --- a/drivers/i2c/Makefile
> +++ b/drivers/i2c/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_I2C_SMBUS)               += i2c-smbus.o
>  obj-$(CONFIG_I2C_CHARDEV)      += i2c-dev.o
>  obj-$(CONFIG_I2C_MUX)          += i2c-mux.o
>  obj-y                          += algos/ busses/ muxes/
> +obj-$(CONFIG_I2C_PSEUDO)       += i2c-pseudo.o
>  obj-$(CONFIG_I2C_STUB)         += i2c-stub.o
>  obj-$(CONFIG_I2C_SLAVE_EEPROM) += i2c-slave-eeprom.o
>
> diff --git a/drivers/i2c/i2c-pseudo.c b/drivers/i2c/i2c-pseudo.c
> new file mode 100644
> index 000000000000..e409fac581d3
> --- /dev/null
> +++ b/drivers/i2c/i2c-pseudo.c
> @@ -0,0 +1,3202 @@
> +// SPDX-License-Identifier: GPL-2.0

You still need to add a copyright line here. Google LLC.

> +/*
> + * This Linux kernel module implements pseudo I2C adapters that can be backed
> + * by userspace programs.  This allows for implementing an I2C bus from
> + * userspace, which can tunnel the I2C commands through another communication
> + * channel to a remote I2C bus.
> + */
> +
> +#include <linux/build_bug.h>
> +#include <linux/cdev.h>
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/fs.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/kobject.h>
> +#include <linux/list.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/poll.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/time64.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> +#include <linux/wait.h>
> +
> +/* Minimum i2cp_limit module parameter value. */
> +#define I2CP_ADAPTERS_MIN      0
> +/* Maximum i2cp_limit module parameter value. */
> +#define I2CP_ADAPTERS_MAX      256
> +/* Default i2cp_limit module parameter value. */
> +#define I2CP_DEFAULT_LIMIT     8
> +/* Value for alloc_chrdev_region() baseminor arg. */
> +#define I2CP_CDEV_BASEMINOR    0
> +#define I2CP_TIMEOUT_MS_MIN    0
> +#define I2CP_TIMEOUT_MS_MAX    (60 * MSEC_PER_SEC)
> +#define I2CP_DEFAULT_TIMEOUT_MS        (3 * MSEC_PER_SEC)
> +
> +/* Used in struct device.kobj.name field. */
> +#define I2CP_DEVICE_NAME       "i2c-pseudo-controller"
> +/* Value for alloc_chrdev_region() name arg. */
> +#define I2CP_CHRDEV_NAME       "i2c_pseudo"
> +/* Value for class_create() name arg. */
> +#define I2CP_CLASS_NAME                "i2c-pseudo"
> +/* Value for alloc_chrdev_region() count arg.  Should always be 1. */
> +#define I2CP_CDEV_COUNT                1
> +
> +#define I2CP_ADAP_START_CMD            "ADAPTER_START"
> +#define I2CP_ADAP_SHUTDOWN_CMD         "ADAPTER_SHUTDOWN"
> +#define I2CP_GET_NUMBER_CMD            "GET_ADAPTER_NUM"
> +#define I2CP_NUMBER_REPLY_CMD          "I2C_ADAPTER_NUM"
> +#define I2CP_GET_PSEUDO_ID_CMD         "GET_PSEUDO_ID"
> +#define I2CP_PSEUDO_ID_REPLY_CMD       "I2C_PSEUDO_ID"
> +#define I2CP_SET_NAME_SUFFIX_CMD       "SET_ADAPTER_NAME_SUFFIX"
> +#define I2CP_SET_TIMEOUT_CMD           "SET_ADAPTER_TIMEOUT_MS"
> +#define I2CP_BEGIN_MXFER_REQ_CMD       "I2C_BEGIN_XFER"
> +#define I2CP_COMMIT_MXFER_REQ_CMD      "I2C_COMMIT_XFER"
> +#define I2CP_MXFER_REQ_CMD             "I2C_XFER_REQ"
> +#define I2CP_MXFER_REPLY_CMD           "I2C_XFER_REPLY"

I wonder if all of those should be ioctls, instead of doing
string/command parsing in the kernel.

Any reason you're not using ioctls?

> +
> +/* Maximum size of a controller command. */
> +#define I2CP_CTRLR_CMD_LIMIT           255
> +/* Maximum number of controller read responses to allow enqueued at once. */
> +#define I2CP_CTRLR_RSP_QUEUE_LIMIT     256
> +/* The maximum size of a single controller read response. */
> +#define I2CP_MAX_MSG_BUF_SIZE          16384
> +/* Maximum length (not size!) of i2cp_cmds static array. */
> +#define I2CP_CMDS_SANITY_LIMIT         64
> +/* Maximum size of a controller read or write. */
> +#define I2CP_RW_SIZE_LIMIT             1048576
> +
> +/*
> + * Marks the end of a controller command or read response.
> + *
> + * Fundamentally, controller commands and read responses could use different end
> + * marker characters, but for sanity they should be the same.
> + *
> + * This must be a variable, not a macro, because it is passed to copy_to_user()
> + * by address.  Taking the address of a character literal causes a compiler
> + * error.  Making these C strings instead of characters would allow for that
> + * (with other implications), but then copy_to_user() itself refuses to compile,
> + * because of an assertion that the copy size (1) must match the size of the
> + * string literal (2 with its trailing null).
> + */
> +static const char i2cp_ctrlr_end_char          = '\n';
> +/* Separator between I2C message header fields in the controller bytestream. */
> +static const char i2cp_ctrlr_header_sep_char   = ' ';
> +/* Separator between I2C message data bytes in the controller bytestream. */
> +static const char i2cp_ctrlr_data_sep_char     = ':';
> +
> +/*
> + * This used instead of strcmp(in_str, other_str) because in_str may have null
> + * characters within its in_size boundaries, which could cause an unintended
> + * match.
> + */
> +#define STRING_NEQ(in_str, in_size, other_str) \
> +       (in_size != strlen(other_str) || memcmp(other_str, in_str, in_size))

I'd define STRING_EQ instead. Also, this is not used?

> +
> +#define STR_HELPER(num)                #num
> +#define STR(num)               STR_HELPER(num)
> +
> +#define CONST_STRLEN(str)      (sizeof(str) - 1)
> +
> +/*
> + * The number of pseudo I2C adapters permitted.  This default value can be
> + * overridden at module load time.  Must be in the range
> + * [I2CP_ADAPTERS_MIN, I2CP_ADAPTERS_MAX].
> + *
> + * As currently used, this MUST NOT be changed during or after module
> + * initialization.  If the ability to change this at runtime is desired, an
> + * audit of the uses of this variable will be necessary.
> + */
> +static unsigned int i2cp_limit = I2CP_DEFAULT_LIMIT;
> +module_param(i2cp_limit, uint, 0444);
> +
> +/*
> + * The default I2C pseudo adapter timeout, in milliseconds.
> + * 0 means use Linux I2C adapter default.
> + * Can be changed per adapter by the controller.
> + */
> +static unsigned int i2cp_default_timeout_ms = I2CP_DEFAULT_TIMEOUT_MS;
> +module_param(i2cp_default_timeout_ms, uint, 0444);

Why do you need this? Maybe drop it to simplify?

> +
> +struct i2cp_controller;
> +
> +/* This tracks all I2C pseudo adapters. */
> +struct i2cp_counters {
> +       /* This must be held while accessing any fields. */
> +       struct mutex lock;
> +       unsigned int count;
> +       /*
> +        * This is used to make a strong attempt at avoiding ID reuse,
> +        * especially during the lifetime of a userspace i2c-dev client.  This
> +        * can wrap by design, and thus makes no perfect guarantees.
> +        */
> +       /* Same type as struct i2cp_controller.id field. */
> +       unsigned int next_ctrlr_id;
> +       struct i2cp_controller **all_controllers;
> +};
> +
[snip]
> +/* vanprintf - See anprintf() documentation. */
> +static ssize_t vanprintf(char **out, ssize_t max_size, gfp_t gfp,
> +       const char *fmt, va_list ap)
> +{
> +       int ret;
> +       ssize_t buf_size;
> +       char *buf = NULL;
> +       va_list args1;
> +
> +       va_copy(args1, ap);
> +       ret = vsnprintf(NULL, 0, fmt, ap);
> +       if (ret < 0)
> +               goto fail_before_args1;
> +       if (max_size >= 0 && ret > max_size) {
> +               ret = -ERANGE;
> +               goto fail_before_args1;
> +       }
> +
> +       buf_size = ret + 1;
> +       buf = kmalloc_track_caller(buf_size, gfp);
> +       if (buf == NULL) {
> +               ret = -ENOMEM;
> +               goto fail_before_args1;
> +       }
> +
> +       ret = vsnprintf(buf, buf_size, fmt, args1);
> +       va_end(args1);
> +       if (ret < 0)
> +               goto fail_after_args1;
> +       if (ret + 1 != buf_size) {
> +               ret = -ENOTRECOVERABLE;
> +               goto fail_after_args1;
> +       }
> +
> +       *out = buf;
> +       return ret;
> +
> + fail_before_args1:
> +       va_end(args1);
> + fail_after_args1:
> +       kfree(buf);
> +       if (ret >= 0)
> +               ret = -ENOTRECOVERABLE;
> +       return ret;
> +}
> +
> +/*
> + * anprintf - Format a string and place it into a newly allocated buffer.
> + * @out: Address of the pointer to place the buffer address into.  Will only be
> + *     written to with a successful positive return value.
> + * @max_size: If non-negative, the maximum buffer size that this function will
> + *     attempt to allocate.  If the formatted string including trailing null
> + *     character would not fit, no buffer will be allocated, and an error will
> + *     be returned.  (Thus max_size of 0 will always result in an error.)
> + * @gfp: GFP flags for kmalloc().
> + * @fmt: The format string to use.
> + * @...: Arguments for the format string.
> + *
> + * Return value meanings:
> + *
> + *   >=0: A buffer of this size was allocated and its address written to *out.
> + *        The caller now owns the buffer and is responsible for freeing it with
> + *        kfree().  The final character in the buffer, not counted in this
> + *        return value, is the trailing null.  This is the same return value
> + *        meaning as snprintf(3).
> + *
> + *    <0: An error occurred.  Negate the return value for the error number.
> + *        @out will not have been written to.  Errors that might come from
> + *        snprintf(3) may come from this function as well.  Additionally, the
> + *        following errors may occur from this function:
> + *
> + *        ERANGE: A buffer larger than @max_size would be needed to fit the
> + *        formatted string including its trailing null character.
> + *
> + *        ENOMEM: Allocation of the output buffer failed.
> + *
> + *        ENOTRECOVERABLE: An unexpected condition occurred.  This may indicate
> + *        a bug.
> + */
> +static ssize_t anprintf(char **out, ssize_t max_size, gfp_t gfp,
> +       const char *fmt, ...)
> +{
> +       ssize_t ret;
> +       va_list args;
> +
> +       va_start(args, fmt);
> +       ret = vanprintf(out, max_size, gfp, fmt, args);
> +       va_end(args);
> +       return ret;
> +}

I'm a bit worried you need to define your own custom string
manipulation functions. If they are really necessary, please add them
to the core.

> +
> +static ssize_t i2cp_rsp_buffer_formatter(void *data, char **out)
> +{
> +       struct i2cp_rsp_buffer *rsp_buf;
> +
> +       rsp_buf = data;
> +       if (rsp_buf->buf) {
> +               if (rsp_buf->size > 0) {
> +                       *out = rsp_buf->buf;
> +                       rsp_buf->buf = NULL;
> +                       return rsp_buf->size;
> +               }
> +               kfree(rsp_buf->buf);
> +       }
> +       kfree(rsp_buf);

This is really hard to follow, reverse the tests:

if (!rsp_buf->buf) {
   kfree(rsp_buf);
   return;
}

if (rsp_buf->size <= 0) {
   ...
}

etc.

> +       return 0;
> +}
> +
> +static ssize_t i2cp_rsp_master_xfer_formatter(void *data, char **out)
> +{
> +       ssize_t ret;
[snip]
> +
> +static ssize_t i2cp_cdev_read(struct file *filep, char __user *buf,
> +               size_t count, loff_t *f_ps)
> +{
> +       ssize_t ret = 0;
> +       bool non_blocking;
> +       struct i2cp_controller *pdata;
> +
> +       /*
> +        * Just in case this could change out from under us, best to keep a
> +        * consistent view for the duration of this syscall.
> +        */
> +       non_blocking = !!(filep->f_flags & O_NONBLOCK);
> +       pdata = filep->private_data;
> +
> +       if (count > (size_t)I2CP_RW_SIZE_LIMIT)
> +               count = I2CP_RW_SIZE_LIMIT;

I think you should just error out instead.

> +
> +       /*
> +        * Since read() calls are effectively serialized by way of
> +        * pdata->rsp_lock, we MUST NOT block on obtaining that lock if in
> +        * non-blocking mode, because it might be held by a blocking read().
[snip]
> +static ssize_t i2cp_cdev_write(struct file *filep, const char __user *buf,
> +               size_t count, loff_t *f_ps)
> +{
> +       ssize_t ret = 0;
> +       bool non_blocking;
> +       size_t remaining;
> +       char *kbuf, *start;
> +       struct i2cp_controller *pdata;
> +
> +       /*
> +        * Just in case this could change out from under us, best to keep a
> +        * consistent view for the duration of this syscall.
> +        *
> +        * Write command implementations, i.e. struct i2cp_cmd implementations,
> +        * do NOT have to support blocking writes.  For example, if a write of
> +        * an I2C message reply is received for a message that the pseudo
> +        * adapter never requested or expected, it makes more sense to indicate
> +        * an error than to block until possibly receiving a master_xfer request
> +        * for that I2C message, even if blocking is permitted.
> +        *
> +        * Furthermore, controller writes MUST NEVER block indefinitely, even
> +        * when non_blocking is false.  E.g. while non_blocking may be used to
> +        * select between mutex_trylock and mutex_lock*, even in the
> +        * latter case the lock should never be blocked on I/O, on userspace, or
> +        * on anything else outside the control of this driver.  It IS
> +        * permissable for the lock to be blocked on processing of previous or
> +        * concurrent write input, so long as that processing does not violate
> +        * these rules.
> +        */
> +       non_blocking = !!(filep->f_flags & O_NONBLOCK);
> +       pdata = filep->private_data;
> +
> +       if (count > (size_t)I2CP_RW_SIZE_LIMIT)
> +               count = I2CP_RW_SIZE_LIMIT;

I'd error out instead.

> +
> +       kbuf = kzalloc(count, GFP_KERNEL);
> +       if (!kbuf) {
> +               ret = -ENOMEM;
> +               goto free_kbuf;
[snip]
