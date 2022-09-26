Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34695EA877
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 16:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbiIZOdy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 10:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234431AbiIZOdF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 10:33:05 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEEB21006
        for <linux-i2c@vger.kernel.org>; Mon, 26 Sep 2022 05:49:24 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so12268601pja.5
        for <linux-i2c@vger.kernel.org>; Mon, 26 Sep 2022 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=SyCdAz3/ecUtDFfQmC1TuMy7jcuE/dDqGILRTJaH9kM=;
        b=OT/5lOeQ4YTZyfXlumqodv+v5oQvD8xxX4AUIYiSC2ReE1YVrHF0E8aI0MGhWfQoSJ
         uS+pc0fuPq6MdGBKK7WSqG+zO7KzjNdjAwVr3GHR4/HsQvYlQZ45eMnB4nTigK6d5HGS
         HmrdIID4CRJ7DJJn1/osW6mVWHOQJKtA3/euumGUZaJEWC7WzlweV7OfBDJFeBODgx0L
         P1HjgxWsCi/bLYKQGWWV1ZTJVGZnM9CjMwGIzO47oZT4kV8RM1QZ8Btb8Dm8lOotqfst
         yzQt/12StddSnVJGrcUbzcEYUnphUOkoV2cHmsnN9P75iMiFjvHsdwVulfap5gYaJTDY
         le2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SyCdAz3/ecUtDFfQmC1TuMy7jcuE/dDqGILRTJaH9kM=;
        b=kTyPyxHiGAcRtcowg0fkMzMdA8lVH6s2IRx4VlAYTeP3CkygWNdhLiuGu0/Xk+GqmK
         EZyBcxurSEr/dXB8NFq48F6iea6wEfJ+nolCwWCZYMHjDuDS/a8MFUy0LkRn7JLOT80d
         Cp1gi8VhcfEsmDVWFyGJU52X7xG8VnkjMAJwUzYSRgzmHGmU6eUA8oDueh7TEQ0zYZZj
         n+2Ao86/x9DbXsup2Ycn4IcKErDM3rfka76adiZUi3k3uZNbJv5IdwrR71qTvsV7Ezx6
         kscuhuoYs0LLeE+iOdgAdsDaSVWU79Zxkb50SVu0QJ1QOqI/FRpItXuCmRVWes74kdjh
         65oA==
X-Gm-Message-State: ACrzQf0HDLykN+2UOhSZW3d+wtbH5X50DqYjYQShG+EgFXizMuJBbScw
        VnRF0wcCdHptGTzdGsTxc7SVK5dHjYTqyV+SWjcpww==
X-Google-Smtp-Source: AMsMyM5JCNqXfStgzSPDXC63FbpnxdfzEnUw+dVWS4OWRUC30Gpe5fUaA2MbUAlBgRmskYPYEwTySWBi+D4Y2P/yaRI=
X-Received: by 2002:a17:90a:fd8c:b0:200:8cf9:63f4 with SMTP id
 cx12-20020a17090afd8c00b002008cf963f4mr24332702pjb.201.1664196564264; Mon, 26
 Sep 2022 05:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220916131854.687371-1-jsd@semihalf.com> <20220916131854.687371-2-jsd@semihalf.com>
 <eafc7bb5-a406-132b-4b7d-167917cdab05@amd.com> <CAOtMz3Pgh+cERiXVetDZJrQa9C0kUUbZ9dRRhdghgm5Or8kwhg@mail.gmail.com>
 <YytwNvSyhq380YNT@zn.tnic> <60a52348-7d50-1056-a596-e154f87c99d2@amd.com>
 <Yyt5LSxSz+6QeWF1@zn.tnic> <YywvmueFj/ibyZdf@smile.fi.intel.com>
 <YywwEvkZK1R9mJfE@smile.fi.intel.com> <c0c8bdce-26a0-ad3f-749b-7585d947608b@redhat.com>
 <YyxrdpUyc+kp48kX@zn.tnic> <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
In-Reply-To: <33d5cc27-474b-fdec-a6b0-84ac16f7d386@redhat.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 26 Sep 2022 14:49:12 +0200
Message-ID: <CAOtMz3M=BTZUTRMHWGULwMDWmGdOzHKo=UcZeg3sP8_ndVYk2g@mail.gmail.com>
Subject: Re: [PATCH -next 1/2] i2c: designware: Switch from using MMIO access
 to SMN access
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Borislav Petkov <bp@suse.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rrangel@chromium.org, upstream@semihalf.com,
        Muralidhara M K <muralimk@amd.com>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Borislav,

czw., 22 wrz 2022 o 16:29 Hans de Goede <hdegoede@redhat.com> napisa=C5=82(=
a):
>
> Hi,
>
> On 9/22/22 16:04, Borislav Petkov wrote:
> > On Thu, Sep 22, 2022 at 03:48:07PM +0200, Hans de Goede wrote:
> >> Right, thank you for Cc-ing me. At least on X86 there are several plat=
forms
> >> (and 100-s of device models) which use a PMIC connected to the i2c-des=
ignware
> >> controller and this PMIC gets poked directly from ACPI _S0 and _S3
> >> (power on/off) methods. So the I2C bus driver needs to *bind* to the c=
ontroller
> >> as soon as we find its description in ACPI, otherwise we get a whole b=
unch
> >> of failed ACPI OpRegion access errors as well as various actual really=
 issues.
> >
> > Thanks for explaining - I couldn't find the reason why it has to be a
> > subsys_initcall.
> >
> >> So please keep this as a subsys initcall.
> >
> > Which means, init_amd_nbs() would have to be sorted to run before
> > dw_i2c_init_driver()...
>
> Yes if possible. One solution might be to make it a arch_initcall_sync()
> which AFAIK runs after regular arch_initcall()-s but before subsys_initca=
ll()-s.

What do you think about this?

Best Regards,
Jan
