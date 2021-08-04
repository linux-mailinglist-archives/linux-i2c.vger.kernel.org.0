Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A8D3E02C8
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 16:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238443AbhHDOGu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Aug 2021 10:06:50 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:42733 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238562AbhHDOGt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Aug 2021 10:06:49 -0400
Received: by mail-ot1-f52.google.com with SMTP id 68-20020a9d0f4a0000b02904b1f1d7c5f4so1708385ott.9
        for <linux-i2c@vger.kernel.org>; Wed, 04 Aug 2021 07:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AvFIfqj+1q5OjtZkavP4gKuZryyvY7s/cLcm3CYeYyc=;
        b=DeFyO/vAC9Tqnlc6vksXzJzfibtM5Ijr/zdxm3qBkINr43LrT39kMJDxATm3rZaV/8
         EKz5ElME09u17Zgky0SPz65G/CVmG47uOJsNwTeCW1GB4Y+heNTfGrS9UOrZiGRHKc53
         LgreVD6FA6Ipx0bqM8FIP7jEcre15hCchAdX/y6PFDKEq59C82dy4a+zIoWjKyu6LB0V
         95czpBen+qKzhSDFyrlTgW7UdzY72fd8iLvjo8qw4sb2XXLjiDqOpJ3Jse2g6OvmWgIU
         Qd1hTWLYxkJUmrDqnSbpUttXcWVeZKdqej69gVbFYZMtxsiWfKnATJKE+R8yhPpvnXE/
         LXRA==
X-Gm-Message-State: AOAM530YlHmQq1nbJoRN2/zgp1QX0MQv9z43hO2BOoIvUqTwwyNJYvSt
        kcBX+UFeUGGQuip/xErW2rEuXy5nrtlb6CPrpfg=
X-Google-Smtp-Source: ABdhPJz+trwav/81/KLDonncwFoQlmjJ+4qUs1Xt2/+mUug6OuhPYmPP1ukcEJwl9uDa7LW/j6P4woefr3dVt2llZm0=
X-Received: by 2002:a9d:5c8b:: with SMTP id a11mr20049455oti.206.1628085996101;
 Wed, 04 Aug 2021 07:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <7a1581de-7566-15da-d1af-08cbf8c5e46f@gmail.com>
 <c0eeddf6-f630-d18b-cdae-0d74ed095f9c@gmail.com> <20210802145347.605ce8d5@endymion>
 <b0bca52e-2bbc-18ef-5134-d5b6fe9df2bf@gmail.com> <68929f0f-a44e-6617-3e4e-dcdb9933d856@linux.intel.com>
In-Reply-To: <68929f0f-a44e-6617-3e4e-dcdb9933d856@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Wed, 4 Aug 2021 16:06:24 +0200
Message-ID: <CAJZ5v0jdNFDJr8ZrbU-jp53RWsZxY7+KRLF0kqmU+pxzXu6RmA@mail.gmail.com>
Subject: Re: [PATCH 01/10] i2c: i801: Don't call pm_runtime_allow
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Heiner Kallweit <hkallweit1@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 4, 2021 at 3:36 PM Jarkko Nikula
<jarkko.nikula@linux.intel.com> wrote:
>
> Hi
>
> On 8/2/21 7:31 PM, Heiner Kallweit wrote:
> > On 02.08.2021 14:53, Jean Delvare wrote:
> >> Hi Heiner,
> >>
> >> On Sun, 01 Aug 2021 16:16:56 +0200, Heiner Kallweit wrote:
> >>> Drivers should not call pm_runtime_allow(), see
> >>> Documentation/power/pci.rst. Therefore remove the call and leave this
> >>> to user space. Also remove the not needed call to pm_runtime_forbid().
> >>>
> >>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >>> ---
> >>>   drivers/i2c/busses/i2c-i801.c | 2 --
> >>>   1 file changed, 2 deletions(-)
> >>>
> >>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> >>> index 92ec291c0..362e74761 100644
> >>> --- a/drivers/i2c/busses/i2c-i801.c
> >>> +++ b/drivers/i2c/busses/i2c-i801.c
> >>> @@ -1891,7 +1891,6 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >>>     pm_runtime_set_autosuspend_delay(&dev->dev, 1000);
> >>>     pm_runtime_use_autosuspend(&dev->dev);
> >>>     pm_runtime_put_autosuspend(&dev->dev);
> >>> -   pm_runtime_allow(&dev->dev);
> >>>
> >>>     return 0;
> >>>   }
> >>> @@ -1900,7 +1899,6 @@ static void i801_remove(struct pci_dev *dev)
> >>>   {
> >>>     struct i801_priv *priv = pci_get_drvdata(dev);
> >>>
> >>> -   pm_runtime_forbid(&dev->dev);
> >>>     pm_runtime_get_noresume(&dev->dev);
> >>>
> >>>     i801_disable_host_notify(priv);
> >>
> >> These calls were added by Jarkko (Cc'd) and I'm not familiar with power
> >> management so I'll need an explicit ack from him before I can accept
> >> this patch.
> >>
> > The calls were part of the initial submission for rpm support and supposedly
> > just copied from another driver. But fine with me to wait for his feedback.
> >
> Yes, I'm quite sure I've copied it from another driver :-)
>
> This patch will cause the device here won't go automatically to D3
> before some user space script allows it. E.g
>
> echo auto > /sys/bus/pci/devices/0000\:00\:1f.3/power/control
>
> I think this is kind of PM regression with this patch. It's not clear to
> me from the Documentation/power/pci.rst why driver should not call the
> pm_runtime_allow() and what would be allowed kernel alternative for it.

Please see the comment in local_pci_probe().

Because the PCI bus type is involved in power management, the driver
needs to cooperate.

> Rafael: what would be the correct way here to allow runtime PM from the
> driver or does it really require some user space script for it?

No, it doesn't.
