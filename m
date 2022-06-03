Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02CA253C6B5
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jun 2022 10:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242693AbiFCIB4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Jun 2022 04:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242024AbiFCIBz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Jun 2022 04:01:55 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD7E1F1;
        Fri,  3 Jun 2022 01:01:53 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id d5-20020a05600c34c500b0039776acee62so4429472wmq.1;
        Fri, 03 Jun 2022 01:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZWqxINbJ7iFdxIil6If2SDWq69slkShlezEpSvrr7HU=;
        b=TQs+moXeRsZ/FkStEHbgDBpJC0N/FN8q/6qSlEDcv3zzEAU9eysVlE6oYun4aHrL6W
         ftzC6fPUl5re+nDMO5nYPsP8W1vyjt+uYGh8C74UUS8m2i5MA1SxTDMNht5rDc3eXSPg
         VVRg7N4wwAkjlfUTkv01e1ijJ8gE7eO8ic7Kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZWqxINbJ7iFdxIil6If2SDWq69slkShlezEpSvrr7HU=;
        b=dmcQTneTmYw28UtfKHGX5FpYrtkMVvgZDVhJg23eYxcXw+Mrl1K2BjvOX0AogtAHLS
         l5+QSbve/b0FvMSVTXk18ztDCiyM1KkvBuMBKOjqftXCrCxaxsOT6k8pTalJFzdAZQJo
         BQiy0qhtHCYymc72i0Dliwm3wCOgANG77SmHfhIVTF05R0MSo9AcIu8yazGLPw7G8xWk
         j+u1f1MQFr5GIEWGqitFEa6pN40kh2X4DAsgPyf5+e6uSyH99JM6KAIt6wPna/zM3pDO
         ns/yxvDJ1Yed2H2toinCr5WyOSIu6pmH0trvFLjz/0+H558qoVdEChzIkn8fLed2kkvM
         zZVQ==
X-Gm-Message-State: AOAM530jFKh5L7LuG9kja1HeFT+fA/loK4Jj/tgzPUvuJRDHVR2msKxD
        FqniUvRaDlWUofJd9N+37x56IeL4FjRT00V8R+k=
X-Google-Smtp-Source: ABdhPJxWxPCyIsUwcgWRlEoQ7nKS/RgnrjI7HT05hNJpTqQEnGEqr5saaTLSVlhfa1OuH0YgZY1r3EIr0RW4oumEiE8=
X-Received: by 2002:a05:600c:3cc:b0:397:337e:14ca with SMTP id
 z12-20020a05600c03cc00b00397337e14camr37002619wmd.10.1654243311469; Fri, 03
 Jun 2022 01:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220526205334.64114-1-eajames@linux.ibm.com> <20220526205334.64114-2-eajames@linux.ibm.com>
In-Reply-To: <20220526205334.64114-2-eajames@linux.ibm.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 3 Jun 2022 08:01:38 +0000
Message-ID: <CACPK8XdVF0qMtkPsk5SEJycLfBVOnk3eo6FBk_75pP+itx2rkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: core: Add mux root adapter operations
To:     Eddie James <eajames@linux.ibm.com>
Cc:     "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        linux-iio@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Milton Miller II <miltonm@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 26 May 2022 at 20:53, Eddie James <eajames@linux.ibm.com> wrote:
>
> Some I2C clients need the ability to control the root I2C bus even if the
> endpoint device is behind a mux. For example, a driver for a chip that
> can't handle any I2C traffic on the bus while coming out of reset
> (including an I2C-driven mux switching channels) may need to lock the root
> bus with the mux selection fixed for the entire time the device is in
> reset.
> For this purpose, add a new structure containing two function pointers to
> the adapter structure. These functions pointers should be defined for
> every adapter. The lock_select operation, for a mux adapter, locks the
> parent adpaters up to the root and selects the adapter's channel. The
> unlock_deselect operation deselects the mux channel and unlocks all the
> adapters. For a non-mux adapter, the operations lock and unlock the
> adapters up to the root. This scheme should work with multiple levels of
> muxes and regular adapters in between.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

I think this looks okay. It was hard to understand at first, but makes
more sense with the context of the existing bus locking code.

There's a typo in one of your comments that the 0day bot found.

Have you tested with CONFIG_DEBUG_MUTEXES?

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/i2c/i2c-core-base.c | 38 ++++++++++++++++++++++++++++
>  drivers/i2c/i2c-mux.c       | 50 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         | 42 +++++++++++++++++++++++++++++++
>  3 files changed, 130 insertions(+)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index d43db2c3876e..e2c365348e1f 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -1357,6 +1357,41 @@ static const struct i2c_lock_operations i2c_adapter_lock_ops = {
>         .unlock_bus =  i2c_adapter_unlock_bus,
>  };
>
> +/*
> + * For a non-mux adapter, the lock_select operation locks the chain of
> + * adapters upwards, returning the root. If there's a mux above this adapter
> + * somehow, it should also get locked and the desired channel selected.
> + */

Recursive lock the set of adaptors.

> +static struct i2c_adapter *i2c_adapter_lock_select(struct i2c_adapter *adapter)
> +{
> +       struct i2c_adapter *ret = adapter;
> +       struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
> +
> +       if (parent) {
> +               ret = parent->mux_root_ops->lock_select(parent);
> +               if (IS_ERR(ret))
> +                       return ret;
> +       }
> +
> +       adapter->lock_ops->lock_bus(adapter, I2C_LOCK_ROOT_ADAPTER);
> +       return ret;
> +}
> +
> +static void i2c_adapter_unlock_deselect(struct i2c_adapter *adapter)
> +{
> +       struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
> +
> +       adapter->lock_ops->unlock_bus(adapter, I2C_LOCK_ROOT_ADAPTER);
> +
> +       if (parent)
> +               parent->mux_root_ops->unlock_deselect(parent);
> +}
> +
> +static const struct i2c_mux_root_operations i2c_adapter_mux_root_ops = {
> +       .lock_select = i2c_adapter_lock_select,
> +       .unlock_deselect = i2c_adapter_unlock_deselect,
> +};
> +
>  static void i2c_host_notify_irq_teardown(struct i2c_adapter *adap)
>  {
>         struct irq_domain *domain = adap->host_notify_domain;
> @@ -1452,6 +1487,9 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>         if (!adap->lock_ops)
>                 adap->lock_ops = &i2c_adapter_lock_ops;
>
> +       if (!adap->mux_root_ops)
> +               adap->mux_root_ops = &i2c_adapter_mux_root_ops;
> +
>         adap->locked_flags = 0;
>         rt_mutex_init(&adap->bus_lock);
>         rt_mutex_init(&adap->mux_lock);
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 774507b54b57..c7db770e4198 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -210,6 +210,49 @@ static void i2c_parent_unlock_bus(struct i2c_adapter *adapter,
>         rt_mutex_unlock(&parent->mux_lock);
>  }
>
> +/*
> + * For a mux adapter, the lock_select operation first locks just like the
> + * lock_bus operation. Then it selects the channel for this adapter and
> + * returns the root adapter. If there is another mux above this one, calling
> + * the parent lock_select should ensure that the channel is correctly
> + * selected.
> + */
> +static struct i2c_adapter *i2c_mux_lock_select(struct i2c_adapter *adapter)
> +{
> +       int ret;
> +       struct i2c_mux_priv *priv = adapter->algo_data;
> +       struct i2c_mux_core *muxc = priv->muxc;
> +       struct i2c_adapter *parent = muxc->parent;
> +
> +       rt_mutex_lock_nested(&parent->mux_lock, i2c_adapter_depth(adapter));
> +
> +       adapter = parent->mux_root_ops->lock_select(parent);
> +       if (IS_ERR(adapter))
> +               return adapter;
> +
> +       ret = muxc->select(muxc, priv->chan_id);
> +       if (ret < 0) {
> +               parent->mux_root_ops->unlock_deselect(parent);
> +               rt_mutex_unlock(&parent->mux_lock);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return adapter;
> +}
> +
> +static void i2c_mux_unlock_deselect(struct i2c_adapter *adapter)
> +{
> +       struct i2c_mux_priv *priv = adapter->algo_data;
> +       struct i2c_mux_core *muxc = priv->muxc;
> +       struct i2c_adapter *parent = muxc->parent;
> +
> +       if (muxc->deselect)
> +               muxc->deselect(muxc, priv->chan_id);
> +
> +       parent->mux_root_ops->unlock_deselect(parent);
> +       rt_mutex_unlock(&parent->mux_lock);
> +}
> +
>  struct i2c_adapter *i2c_root_adapter(struct device *dev)
>  {
>         struct device *i2c;
> @@ -279,6 +322,11 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
>         .unlock_bus =  i2c_parent_unlock_bus,
>  };
>
> +static const struct i2c_mux_root_operations i2c_mux_root_ops = {
> +       .lock_select = i2c_mux_lock_select,
> +       .unlock_deselect = i2c_mux_unlock_deselect,
> +};
> +
>  int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>                         u32 force_nr, u32 chan_id,
>                         unsigned int class)
> @@ -339,6 +387,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>         else
>                 priv->adap.lock_ops = &i2c_parent_lock_ops;
>
> +       priv->adap.mux_root_ops = &i2c_mux_root_ops;
> +
>         /* Sanity check on class */
>         if (i2c_mux_parent_classes(parent) & class)
>                 dev_err(&parent->dev,
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index fbda5ada2afc..a3596f61b417 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -583,6 +583,26 @@ struct i2c_lock_operations {
>         void (*unlock_bus)(struct i2c_adapter *adapter, unsigned int flags);
>  };
>
> +/**
> + * struct i2c_mux_root_operations - represent operations to lock and select
> + * the adapter's mux channel (if a mux is present)
> + * @lock_select: Get exclusive access to the root I2C bus adapter with the
> + *   correct mux channel selected for the adapter
> + * @unlock_deslect: Release exclusive access to the root I2C bus adapter and
> + *   deselect the mux channel for the adapter
> + *
> + * Some I2C clients need the ability to control the root I2C bus even if the
> + * endpoint device is behind a mux. For example, a driver for a chip that
> + * can't handle any I2C traffic on the bus while coming out of reset (including
> + * an I2C-driven mux switching channels) may need to lock the root bus with
> + * the mux selection fixed for the entire time the device is in reset.
> + * These operations are for such a purpose.
> + */
> +struct i2c_mux_root_operations {
> +       struct i2c_adapter *(*lock_select)(struct i2c_adapter *adapter);
> +       void (*unlock_deselect)(struct i2c_adapter *adapter);
> +};
> +
>  /**
>   * struct i2c_timings - I2C timing information
>   * @bus_freq_hz: the bus frequency in Hz
> @@ -725,6 +745,7 @@ struct i2c_adapter {
>
>         /* data fields that are valid for all devices   */
>         const struct i2c_lock_operations *lock_ops;
> +       const struct i2c_mux_root_operations *mux_root_ops;
>         struct rt_mutex bus_lock;
>         struct rt_mutex mux_lock;
>
> @@ -817,6 +838,27 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
>         adapter->lock_ops->unlock_bus(adapter, flags);
>  }
>
> +/**
> + * i2c_lock_select_bus - Get exclusive access to the root I2C bus with the
> + *   target's mux channel (if a mux is present) selected.
> + * @adapter: Target I2C bus
> + *
> + * Return the root I2C bus if mux selection succeeds, an ERR_PTR otherwise
> + */
> +static inline struct i2c_adapter *i2c_lock_select_bus(struct i2c_adapter *adapter)
> +{
> +       return adapter->mux_root_ops->lock_select(adapter);
> +}
> +
> +/**
> + * i2c_unlock_deslect_bus - Release exclusive access to the root I2C bus
> + * @adapter: Target I2C bus
> + */
> +static inline void i2c_unlock_deselect_bus(struct i2c_adapter *adapter)
> +{
> +       adapter->mux_root_ops->unlock_deselect(adapter);
> +}
> +
>  /**
>   * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
>   * @adap: Adapter to mark as suspended
> --
> 2.27.0
>
