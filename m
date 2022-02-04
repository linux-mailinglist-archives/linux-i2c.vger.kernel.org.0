Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4551E4A9851
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 12:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357310AbiBDLTZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 06:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241309AbiBDLTZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 06:19:25 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4000BC061714
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 03:19:25 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id oa14-20020a17090b1bce00b001b61aed4a03so5810248pjb.5
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 03:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AXCvnRjZC+8Sx6TYFGjn4jpIJEHY9Tx8WSNO8hG4M0U=;
        b=oqvvcBNqeJVQpBV+h4lad097EBh+fZWU9+W7ktAOO4m+VaGfKmYRtotuJz0l3lj4UE
         TfUlqfqBhxOBD+sf/sfqjfWws8zzpfxKaYIrkI4KA4zJqfgGue9240cAJk18Z5hLwPys
         ELVqUEpcJuaJ5eFsYe2yIKaw/Vqi/027oOwwJOEchKG6SyG7bfBXqA0iLl1bFJxUl7SK
         k78qUzyXXFHNcIzOcoQtG/3JXxDKnji9ukGexUUtNsl455O4jueJoFfEsaVurXcBFklj
         vqlnoYPqT6GARBeQjEhfSBocZEd/3djDM7GezvZm09jTPj4PokHi1BifFruCp2JwY0Rb
         cW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXCvnRjZC+8Sx6TYFGjn4jpIJEHY9Tx8WSNO8hG4M0U=;
        b=5F+bztQ1fW6qiqXt8lP5+Men0XBS7cKBg40gkEAfifyEoYFLGyYpb2NhIEzfCuxI86
         Hnn9AQydbpc3L3cYCWnbV7lD8fx5VKZeR+MZIPBkdDturfhw1sG09fZhEM7pEV2kMBd0
         yqn4/Ql98qbETp2+u2eP8fv5tekjhrurgDuZXhOpl+lFjfhb6n3q1y98L/exieq9+4Ht
         jFEOTliF4qC71TqkIZKD/rJmk+TN9socuYE9++2EuOlYKO4C8jbeXaf9kQk+vYEjOV0U
         KRmdVwfLdVoCnxeCEptr21abA7bOK7bKs+aopQVlDD/TdA5Vsjh2cxzTqGYazBQ0xjdY
         /t1A==
X-Gm-Message-State: AOAM5314U96kY5rEgZx1V9pB0Lu1/YIKOcwtPzNnQnqSiUeU2CZOH8lw
        t6uiksAbfo4kYPOeBnh3duXvbxTBYOlo2lml89JfzQ==
X-Google-Smtp-Source: ABdhPJxkRUACAsdtHZtVoOhXebj5duO+nCNjZhA4CiXbG5gifi1C0i6cADx7mjk3UpzoABQq8Kz+OmmA0aN877AFcto=
X-Received: by 2002:a17:90b:198d:: with SMTP id mv13mr2553318pjb.209.1643973564361;
 Fri, 04 Feb 2022 03:19:24 -0800 (PST)
MIME-Version: 1.0
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164705.1712027-1-vladimir.zapolskiy@linaro.org> <CAMZdPi_mNzg4ET7FvMeNLiQxVJj7XU1DSxjSQ2CHLBvKu2XZzA@mail.gmail.com>
 <a0b1a993-7358-4016-e8d5-538f87d3d252@linaro.org>
In-Reply-To: <a0b1a993-7358-4016-e8d5-538f87d3d252@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 4 Feb 2022 12:18:48 +0100
Message-ID: <CAMZdPi_mMgi0mb_vu2UEoAwJkiU1+TGQTDt4p-czxriC5tk2UA@mail.gmail.com>
Subject: Re: [PATCH 5/9] i2c: qcom-cci: initialize CCI controller after
 registration of adapters
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 3 Feb 2022 at 19:45, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Loic,
>
> On 2/3/22 7:29 PM, Loic Poulain wrote:
> > Hi Vladimir,
> >
> > On Thu, 3 Feb 2022 at 17:47, Vladimir Zapolskiy
> > <vladimir.zapolskiy@linaro.org> wrote:
> >>
> >> The change is wanted to postpone initialization of busses on CCI controller
> >> by cci_init() and cci_reset() till adapters are registered, the later is
> >> needed for adding I2C bus devices and get correspondent vbus regulators.
> >
> > This is odd, I don't think it's a good idea to register an adapter
> > which is not yet initialized. Could you elaborate on why you need to
> > do this, if you can't access the controller without this regulator
> > enabled, maybe it is more than vbus supply, and, in that case, it
> > should be enabled from your probe function.
>
> thank you for review, the controller can be accessed without a vbus regulator,
> but I2C devices connected to the master controller can not.
>
> The registration of a master controller device done by i2c_add_adapter()
> should be safe to defer IMO, because there shall be no communication on
> the bus at this point, there are no slaves before probe completion, thus
> cci_init()/cci_reset() can be safely called afterwards.
>
> The rationale of the change is to merge two loops over busses, see change 6/9,
> keeping two loops extremely complicates the proper resource management.

OK, I see, I'm sure it works, but I still think that registering the
adapter should be the last step, without making assumptions on when
the i2c core is going to use it. Maybe the point here is the initial
bad design/implementation of cci_reset and cci_init.

cci_reset() is a global reset and then should not depend on subnode
initialization in order to be executed early in the probe.You can e.g
add an 'irq_complete' completion to the cci struct. The CCI_IRQ_MASK_0
bit should probably be added here as well.

cci_init() should be subnode/master specific (cci_init_master) so that
you call it in the registering loop, updating master specific timings
and irq-mask bits.

Thoughs?

Regards,
Loic
