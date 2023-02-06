Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A36C68C1DD
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Feb 2023 16:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjBFPla (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Feb 2023 10:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbjBFPlH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Feb 2023 10:41:07 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581F4227A6
        for <linux-i2c@vger.kernel.org>; Mon,  6 Feb 2023 07:40:16 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id g13so952709uan.7
        for <linux-i2c@vger.kernel.org>; Mon, 06 Feb 2023 07:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpkauG+rgx7W7DFN0SYxYtweC2kO2oK5ojBoQErRjTA=;
        b=CJmjo4Zedug8tgemoAR1Z9q6U/IwIlpNwMIBoUa5k76WDDaWZCcgzLdgbSPg4zCstT
         2F00oXh/jSbYtmcNCCP/y3M4UtzkzHRDdnA/600T9p+jECf5JcHm7Res5u5wCeBT5HbY
         IvGcBPjlAOPd9zlIB/7gMkctWhkNszY7n+/gbkufGIfAwuqZ6L6mzKt5jz/YemKoZmos
         MoRImvgKoprmqCEOXi23JdgM/8V7GFaqEjpqtEnZLTllj2mU2oDkGU+8HyBpHMgfAfOe
         ieHVd4k4s77qw+IA1cU7Yr29+Uv6fCtMUYBeoom8EQUvP2ivmvS8DAC2OXs059XJRhl6
         +v+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpkauG+rgx7W7DFN0SYxYtweC2kO2oK5ojBoQErRjTA=;
        b=3qlyCQNsntA2kHz3AP4TXw82Tkph5CRmI/lKYb6pya8fvwD0dTf2g/MM7KZzM9ahKG
         uuYM4nfdYHIjysvbT1NPlcZHDJBjr0Cg2JHede/i0IDq89kXYIsEjeyRT+5+GHn3CfHN
         xXNVeFkVElXLnjGW7gfvd1YcOnCeC5tWqiB44OPW/hBQqm9DBgJVY0EwAlSG7/Wg87d+
         OGd+hBprmJH03c1uF+YoXofx1oZ+NtroAnWuRRBCxqyjQRTcfDTMkpMGIjIdXsIsgoHM
         BPeybOPKlZp7GXRwgWtqmuFlxMerikw1Lg40/ca3fdkupKJgnEDSRDioXC/SPzQNKDKl
         BF/Q==
X-Gm-Message-State: AO0yUKUQ5Uq8324B7jMXIsIKi1jhimH65x6CW9gp+S+Xypm7mgURrcdu
        8S+4Y8tYHG7pZR6VAeH9nho1CGYgO4l4UHRC7x0VRA==
X-Google-Smtp-Source: AK7set9lz31x3q1eRkFASaS5TaQzAhGeLPxObyJKNUQBhR5rCgh8Zz6r6jvUT/ADOybgPBub1exrHldvNio3+vAY3dQ=
X-Received: by 2002:ab0:134c:0:b0:419:5b8b:4cda with SMTP id
 h12-20020ab0134c000000b004195b8b4cdamr3026669uae.8.1675697947673; Mon, 06 Feb
 2023 07:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20230118134940.240102-1-brgl@bgdev.pl> <20230206152849.aygz4hlnpo5azx75@pengutronix.de>
In-Reply-To: <20230206152849.aygz4hlnpo5azx75@pengutronix.de>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Feb 2023 16:38:56 +0100
Message-ID: <CAMRc=MerMK+jHcm_qDDZQFrLAKpXkfoUfmwJvKqHS-wP=EahVg@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: dev: don't allow user-space to deadlock the kernel
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Feb 6, 2023 at 4:28 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> On Wed, Jan 18, 2023 at 02:49:40PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > If we open an i2c character device and then unbind the underlying i2c
> > adapter (either by unbinding it manually via sysfs or - for a real-life
> > example - when unplugging a USB device with an i2c adaper), the kernel
> > thread calling i2c_del_adapter() will become blocked waiting for the
> > completion that only completes once all references to the character
> > device get dropped.
>
> Is this bad?
>
> > In order to fix that, we introduce a couple changes. They need to be
> > part of a single commit in order to preserve bisectability. First, drop
> > the dev_release completion. That removes the risk of a deadlock but
> > we now need to protect the character device structures against NULL
> > pointer dereferences. To that end introduce an rw semaphore. It will
> > protect the dummy i2c_client structure against dropping the adapter fro=
m
> > under it. It will be taken for reading by all file_operations callbacks
> > and for writing by the notifier's unbind handler. This way we don't
> > prohibit the syscalls that don't get in each other's way from running
> > concurrently but the adapter will not be unbound before all syscalls
> > return.
> >
> > Finally: upon being notified about an unbind event for the i2c adapter,
> > we take the lock for writing and set the adapter pointer in the charact=
er
> > device's structure to NULL. This "numbs down" the device - it still exi=
sts
> > but is no longer functional. Meanwhile every syscall callback checks th=
at
> > pointer after taking the lock but before executing any code that requir=
es
> > it. If it's NULL, we return an error to user-space.
> >
> > This way we can safely open an i2c device from user-space, unbind the
> > device without triggering a deadlock and any subsequent system-call for
> > the file descriptor associated with the removed adapter will gracefully
> > fail.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> @Bartosz, is that the patch you talked about on FOSDEM? I thought
> Wolfram had some concerns but I thought they were unaddressed still.
> What am I missing?

Hi Uwe, yes, this patch was dropped, I can see the rest of the
discussion on the list, have you got the rest of the email too?

Bart
