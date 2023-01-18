Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B230671EF7
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 15:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbjAROJG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 09:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjAROIn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 09:08:43 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE995899C
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 05:48:17 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id q125so24002779vsb.0
        for <linux-i2c@vger.kernel.org>; Wed, 18 Jan 2023 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oKvhfUCktfucOow59Par69GopiHPaPg8RQ2jzlvrjzs=;
        b=X6DKVIQ5ahHIPO3f7akP4AeT/6HskfWjuHsxwer6NOiTfM8ECgEMqiBOnHm24djb/1
         8NKynEHGpiT+E70+k70BANt78fbwydaAqG7iesfXr8J5yGPhP3xY0UqRJY2WyxyPvQvn
         sP61b514NLcUNe1qlA/985lI7uoG/wGfK+Tt8ARwssAuJMXHwQznb8MAx9ha2dRDGWZA
         OfNiTDkLd8+tKv7Ghm16qceVmp1ALNCedCToS9Tz3/aW4muJUooK6jxt3l2g7Eg0HUyR
         GOhBPTK5B4A/ih9omtpXtFNIA02q+Qa8WRXHs33zo86w7Or+dTT3ffAr0jkZrH2CUz/m
         J2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKvhfUCktfucOow59Par69GopiHPaPg8RQ2jzlvrjzs=;
        b=RqFLPnYKAe75uAT/8JAasUUXIXpbr2tBdcLnA0qQPUcqM0uElifnJOZ5HIPRYsTjBc
         rPUmxl4MWQTEG4+yYcsyoUh0FhnDWhU2shGGDU0hw2jQ1yowHWnHwqZqkd2mw7PfaWsv
         RJIYLNieVuq0z9zhTJgoBQK/OrzTzqSmCbFZNdXFJkD3viUJsPsMaTvSjkP77xU2hemC
         fbwL9FDv2E1oZzZy9rdqDw5xK2Xmuj6lKwexYUjBw5x0CzYVL6MQyxe2M9A5ebtXEZob
         aMPh06G+8+U8UBfFq47jAWs4IA+mRnI30XMtEEjID/0397l4elaxGp/WTBGb1odVuTSj
         fVng==
X-Gm-Message-State: AFqh2ko9fG4aWy89ajQXvfx1eB3ulKxYFCcmOZl8g8Nwqc7xV1NjghpW
        sSus3fOXKmto373i2iyt/YSxdmhBEvqH5792SvUk5iVoKGKJDQ==
X-Google-Smtp-Source: AMrXdXtVmsoyaFCYYgslHGZcHRFCqFflod52kiyVb2jXhnB02g2cqp9MxzeskB538p3/7Fq11lDTv87A4S4/HBU7KK4=
X-Received: by 2002:a67:f2da:0:b0:3d3:d90c:5ef2 with SMTP id
 a26-20020a67f2da000000b003d3d90c5ef2mr1157120vsn.17.1674049696453; Wed, 18
 Jan 2023 05:48:16 -0800 (PST)
MIME-Version: 1.0
References: <20230118134707.239900-1-brgl@bgdev.pl>
In-Reply-To: <20230118134707.239900-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 18 Jan 2023 14:48:05 +0100
Message-ID: <CAMRc=Mdpv04oPe_r0S+fPcVvWc4Fkp6RiN89mdNTzDrjvfOG6Q@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: dev: don't allow user-space to deadlock the kernel
To:     Wolfram Sang <wsa@kernel.org>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 18, 2023 at 2:47 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> If we open an i2c character device and then unbind the underlying i2c
> adapter (either by unbinding it manually via sysfs or - for a real-life
> example - when unplugging a USB device with an i2c adaper), the kernel
> thread calling i2c_del_adapter() will become blocked waiting for the
> completion that only completes once all references to the character
> device get dropped.
>
> In order to fix that, we introduce a couple changes. They need to be
> part of a single commit in order to preserve bisectability. First, drop
> the dev_release completion. That removes the risk of a deadlock but
> we now need to protect the character device structures against NULL
> pointer dereferences. To that end introduce an rw semaphore. It will
> protect the dummy i2c_client structure against dropping the adapter from
> under it. It will be taken for reading by all file_operations callbacks
> and for writing by the notifier's unbind handler. This way we don't
> prohibit the syscalls that don't get in each other's way from running
> concurrently but the adapter will not be unbound before all syscalls
> return.
>
> Finally: upon being notified about an unbind event for the i2c adapter,
> we take the lock for writing and set the adapter pointer in the character
> device's structure to NULL. This "numbs down" the device - it still exists
> but is no longer functional. Meanwhile every syscall callback checks that
> pointer after taking the lock but before executing any code that requires
> it. If it's NULL, we return an error to user-space.
>
> This way we can safely open an i2c device from user-space, unbind the
> device without triggering a deadlock and any subsequent system-call for
> the file descriptor associated with the removed adapter will gracefully
> fail.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Sorry for the noise, it was supposed to be v3.

Bart
