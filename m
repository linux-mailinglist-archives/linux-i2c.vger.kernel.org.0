Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB2447F3B0
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Dec 2021 16:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhLYP73 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Dec 2021 10:59:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbhLYP73 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 25 Dec 2021 10:59:29 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A2AC061401;
        Sat, 25 Dec 2021 07:59:29 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id o6so44129061edc.4;
        Sat, 25 Dec 2021 07:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TenvAiJ90C5hePUyjR/4VW2hAVkpn7rtvVoE6E1BK5k=;
        b=Saq5EkEo+7Yc69Hn2p9L8mftuMep3Goz7JXSbtUuaFjJtL2NjrdHov6FM/aKELwsnP
         8gBglqnWKfFbbc1R2+1mYjo91CPDk0Sc1fSu3bKIzgEclCWIJWMmfiAiX0sxLmqMww24
         n9tyqWSqK8FGyoRj6BSRBrwE+5egj6NfxilNC/FHxpQMsYXAlBJXp6NH+LyRnRz++9Bz
         92qmYPbji3Z5ad0Zc3w6TZJ7jkMeY5rmWnOgxiMveJuYwl1h+QNguwoU2yL58MvRXN5w
         Iyplyf1ipNba0vnGjIcbOm8j5i41vq7o3E8CXvQ5IXNpwXcNLbQU43z6Lu+CS+vlhF7m
         5CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TenvAiJ90C5hePUyjR/4VW2hAVkpn7rtvVoE6E1BK5k=;
        b=pabqOIpKK68ZUkcEG1qQxCb5ROi9iabwwVWzp6iwR3qvR6bBIRNZ7YtfAMGURnD2ko
         oV+D7mMTIdRYA0gshebwsZWZZUGY2ykoskqib1iDQXsQILFJ82L2BspJIwr7zecB1bg8
         HfHYo9INFoYMxKvk9eDkqTc0t9vv6xAMrk+Q2kRfi5DlZiMqWx0v3Mu3O793ov+dKrd8
         r5skBNRR1nESuEFtJ/nLbfKbb1UhS8ehKa3fkoi7ii1Zhe1s7JbcUKHbHPAVm2LfOBvS
         dH2XNc/xw8CfQnPoxagO6dgqQ5xYwGhrkFGPw0vFGaidEiW86ZQGYNwurXTFt+vd7U6k
         FlzA==
X-Gm-Message-State: AOAM530YhFDRaY+5KogT1mUx70+x6pMIgtmIFFkVKgqSR7qCm7Z1q/PG
        0KCWS3k+tx6BSbe4upjsF/Y9DnNpWdYueYiPN9Q=
X-Google-Smtp-Source: ABdhPJzTYlqwkcyPP/VMOEbXuatxgvBbhAT31Z04KO4cwF6blxsUrnYpdiHKC2zAfnnDglty13s7fII5DV67NlHdQL0=
X-Received: by 2002:a17:906:a3c6:: with SMTP id ca6mr8363942ejb.639.1640447967656;
 Sat, 25 Dec 2021 07:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20211222094558.2098791-1-jsd@semihalf.com>
In-Reply-To: <20211222094558.2098791-1-jsd@semihalf.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 25 Dec 2021 17:58:51 +0200
Message-ID: <CAHp75VeQAXW0Pzo=sxrHTB_VeD9BZo_iKsDUW79No4OyLtqZCQ@mail.gmail.com>
Subject: Re: [RFC 0/2] i2c-designware: Add support for AMD PSP semaphore
To:     Jan Dabros <jsd@semihalf.com>, Hans de Goede <hdegoede@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Dec 23, 2021 at 4:43 PM Jan Dabros <jsd@semihalf.com> wrote:
>
> This patchset comprises support for new i2c-designware controller setup on some
> AMD Cezanne SoCs, where x86 is sharing i2c bus with PSP. PSP uses the same
> controller and acts as an i2c arbitrator there (x86 is leasing bus from it).
>
> First commit aims to improve generic i2c-designware code by adding extra locking
> on probe() and disable() paths. I would like to ask someone with access to
> boards which use Intel BayTrail(CONFIG_I2C_DESIGNWARE_BAYTRAIL) to verify
> behavior of my changes on such setup.
>
> Second commit adds support for new PSP semaphore arbitration mechanism.
> Implementation is similar to the one from i2c-designware-baytrail.c however
> there are two main differences:
> 1) Add new ACPI ID in order to protect against silent binding of the old driver
> to the setup with PSP semaphore. Extra flag ARBITRATION_SEMAPHORE added to this
> new _HID allows to recognize setup with PSP.
> 2) Beside acquire_lock() and release_lock() methods we are also applying quirks
> to the lock_bus() and unlock_bus() global adapter methods. With this in place
> all i2c clients drivers may lock i2c bus for a desired number of i2c
> transactions (e.g. write-wait-read) without being aware of that such bus is
> shared with another entity.
>
> Mark this patchset as RFC, since waiting for new ACPI ID value. As a temporary
> measure use "AMDI9999". Once proper one will be ready, will re-send this CL for
> review & merge.
>
> Looking forward to some feedback.

When you will be ready, CC a new version also to Hans, he may look at
it from the Baytrail functionality perspective.

-- 
With Best Regards,
Andy Shevchenko
