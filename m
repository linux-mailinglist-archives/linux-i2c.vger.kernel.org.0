Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E753A291F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jun 2021 12:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhFJKSP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Jun 2021 06:18:15 -0400
Received: from mail-pf1-f176.google.com ([209.85.210.176]:46853 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhFJKSO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Jun 2021 06:18:14 -0400
Received: by mail-pf1-f176.google.com with SMTP id u126so1194646pfu.13;
        Thu, 10 Jun 2021 03:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CPAncIK/Xsm93p1b2E0EPPoWmULTHdIaBvwnFau9rDo=;
        b=D63IRhUnXGXzstNAGqP7JQE0iz/pQ3AMGkIw7CgkJsyESVTpI0h4pcbmHs0zvaOkes
         n3Pb6XidsmciWKEPkNGZ0pFohS2lqs//gJoXqCOxDnvaFO61p26/68WfvMur0CLJHOo3
         KlkxGAuqeet2fTWlmRErJsXN7mbYkCrB3TNPx5Dxl1XNbgtn6VMIpc2roxfV/zBkJ+HU
         jhoSBEo1fOnqvRsHztpyMlH14BjitTZf7k5vQn/bVHPlzU40pqxvOtwCMhuJsezv17eI
         MN4itPq+5IhCZeBu0rmZXhct81PR8cMNy+K87nGioWGKM/wuQ6QAy4YrktoInsigG0sh
         0LPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CPAncIK/Xsm93p1b2E0EPPoWmULTHdIaBvwnFau9rDo=;
        b=nF3HJ0/hRQ7ZWZCb53O1cltEnScDA72hsDpXwLVPv/yNsLn3ZrqS99rmsMx8COxYYL
         dsyJXwOYpp4NMc2W7TO6zjZUpI7F34HIZ3gI0nwIENnH+j53bjHPNunPouy9wGDcoZ/d
         E0avvYYn+lS8SobDN737NPtexgkqpLhMPRGga8nVyBhRS27Phu4MPV2RgxKA4k6dPhfQ
         //VEAiYm8r++Ug4ho47UaZUg+J6v4lOlfCvQI0nAVVeps4pHops6W1HnKYKifElbEZjm
         b6KI590LhbCWxsS8lNFzgfmzG9OxtBw/7cxV0MbGdvfYS4oERamfXm7JhThij7iwb1+M
         Q5JA==
X-Gm-Message-State: AOAM532F7R8teoMJ1n0NV4iBn8CbkhQap5bbxwagwbZGqlJ4Jk8znZiF
        vgYYMhhlK9Rwgfp+h/eZ++o84XkdJWtErbjTMSQ=
X-Google-Smtp-Source: ABdhPJzGQTlCQPMgvygsz5zR1Ag52CJUcVlQm7CURdxOiEPyzDSD8tn4z44BuR5xk0/a1nmXqrPINBaJMQqIjtKJiSk=
X-Received: by 2002:a63:b507:: with SMTP id y7mr4310974pge.74.1623320105647;
 Thu, 10 Jun 2021 03:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com> <20210610110211.0e239af6@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210610110211.0e239af6@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 10 Jun 2021 13:14:49 +0300
Message-ID: <CAHp75VeYy0tyP-OLZX5dbYFZM1C_K5eALo64_nb4rSvH7-93FA@mail.gmail.com>
Subject: Re: [rfc, PATCH v1 0/7] PCI: introduce p2sb helper
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 10, 2021 at 12:14 PM Henning Schild
<henning.schild@siemens.com> wrote:
>
> Am Mon, 8 Mar 2021 14:20:13 +0200
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
>
> > There are a few users and even at least one more is coming
> > that would like to utilize p2sb mechanisms like hide/unhide
> > a device from PCI configuration space.
> >
> > Here is the series to deduplicate existing users and provide
> > a generic way for new comers.
> >
> > It also includes a patch to enable GPIO controllers on Apollo Lake
> > when it's used with ABL bootloader w/o ACPI support.
>
> That bit is especially interesting. Making pinctl*lake initialize when
> ACPI IDs are missing and p2sb is hidden.
>
> However i have seen pinctl-broxton get confused because it was trying
> to come up twice on a system that has the ACPI entries. Once as
> "INT3452" and second as "apollolake-pinctrl". They should probably
> mutually exclude each other. And the two different names for "the
> same"? thing make it impossible to write a driver using those GPIOs.

Then it's clearly told that BIOS provides confusing data, it exposes
the ACPI device and hides it in p2sb, how is it even supposed to work?

I consider only these are valid:
 - ACPI device is provided and it's enabled (status = 15) => work with
ACPI enumeration
 - no ACPI device provided and it's hidden or not by p2sb => work via board file
 - no ACPI device provided and no device needed / present => no driver is needed

> Unless it would try and look up both variants or not looking up with
> gpiochip.label.
>
> I would also need that "enable GPIO w/o ACPI" for skylake.

Not a problem to add a platform driver name there or actually for all
of the Intel pin control drivers (depends what suits better to the
current design).

>  I think it
> would be generally useful if the GPIO controllers would be enabled not
> depending on ACPI, and coming up with only one "label" to build on top.

I didn't get what 'label' means here...

> > Please, comment on the approach and individual patches.
> >
> > (Since it's cross subsystem, the PCI seems like a main one and
> >  I think it makes sense to route it thru it with immutable tag
> >  or branch provided for the others).


-- 
With Best Regards,
Andy Shevchenko
