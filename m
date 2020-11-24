Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67CDC2C243F
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Nov 2020 12:35:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732174AbgKXLfF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Nov 2020 06:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730158AbgKXLfF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Nov 2020 06:35:05 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215ECC0613D6;
        Tue, 24 Nov 2020 03:35:05 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id n137so8197915pfd.3;
        Tue, 24 Nov 2020 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cW/ptNFbyubYTVlLmkH+6Zzywp/+iQxPtreJHO5qxG8=;
        b=utswucX/NMJSC7Ug9Go1731F74lTp+lOSox8mk2K3LcwPavQdMJom5hJ5i9GGnqB+s
         O/ZVy4xI5we3l93wdPq9PRaXF5di0AHwCHcjX2qxCs9rX/U5C0wiemCivx9xeQaUfMdA
         ummBWVE2TTEKSKV5I8zpPOz70lVZntCg5OeIERgnCjxPlztyILTDVb+Rt+GaAxpdgUPH
         mgYvaikTUqfVPbWbM+QKZ1TsJBWjaFmufRkNHuDAmSefEzlUj9U92MThdFhnkdPswRwq
         8SNH9Eq9403Cmf7bQfbVpkEoJD5RnGWAOlNsUW/Apjz2UGlvT1cUNyNVUYwxm75gE5xF
         7CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cW/ptNFbyubYTVlLmkH+6Zzywp/+iQxPtreJHO5qxG8=;
        b=i945hI07wFG4aTmnYun3BPIwD2+kPxcHa+bPMkQVZHEilMpsonK2Z3l2oHf5SRvMvZ
         uNM5xOtHYl8CUWp1gXvhy9sZrqcJ+7uaYXO9ox04XbGIL3VvZe06oQIVY4pEx0mvh+6A
         Dt/75Sq5Ec8zQ1wvtKqQqDhfKdj04Dwf5iXHv7KmQRVCZZZL8VbMg2clks9qmShTYQxU
         DPJ1Hc6lcuy94dyW/J1994s4U6UB8/UiQjIjFVse5d5Lq5u4Yzp5zORIHK9Hgrjs5UJW
         SPzKsGhTTcUSDJTifEREcEhpc9R518ZXK69zfG0ehxsR/993PoHy+3tPqhzwzuySHE7r
         5qFA==
X-Gm-Message-State: AOAM531VrI1hP5SGfn7bvEipn11sbfEC8CNrCd5creo3j1iwQJSzj1yG
        lUuAPVhvTK5xmHPI85BJxqKLN+WGhROuHWoe9OU=
X-Google-Smtp-Source: ABdhPJx8EHx3Q5Tc0KAdTDCpH3gvhep/beyCO4T3G3g3v8aUj93MI9Zf25rDj5EUYnAH2K3rrxsvPDEeT5h5n8AUx5Q=
X-Received: by 2002:a17:90a:34cb:: with SMTP id m11mr882961pjf.181.1606217704723;
 Tue, 24 Nov 2020 03:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20201105080014.45410-1-hdegoede@redhat.com> <CAHp75Vdm4PuQpAMj98wJZoNMwV2tFGPj-r9ezvXyWCYj2cSuaA@mail.gmail.com>
 <81343662-aaac-a5e8-af86-1370951ff646@redhat.com> <CAHp75VdbHPwnOAUWjSN+HuVsWVb=8EUwfWNR1onL9QNrX8yU0w@mail.gmail.com>
 <6345eeb9-8416-3e7c-e619-632b5d4abbbd@redhat.com> <CAHp75VdcG_qDpJoppc3Ri8y0rjL9m07r9Xb4JPu30HE6TYf9zQ@mail.gmail.com>
 <5f9b0957-fd18-3ad3-79e0-2124edd7d434@redhat.com>
In-Reply-To: <5f9b0957-fd18-3ad3-79e0-2124edd7d434@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 24 Nov 2020 13:35:53 +0200
Message-ID: <CAHp75VfVyV4Z+FqQJve8ozOK-MasBFSL1Psh+O41hhTxox6Hdw@mail.gmail.com>
Subject: Re: [RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode
 to instantiated i2c-clients
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 24, 2020 at 12:35 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 11/10/20 3:47 PM, Andy Shevchenko wrote:
> > On Tue, Nov 10, 2020 at 1:14 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >> On 11/10/20 11:10 AM, Andy Shevchenko wrote:
> >>> On Mon, Nov 9, 2020 at 1:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > ...
> >
> >>> I think in general the direction to switch to fwnode is a good one. I
> >>> was thinking about moving i2c core to use swnodes in which case they
> >>> will utilize fwnode pointer. But it might have complications, you are
> >>> right.
> >>
> >> So do you agree to just keep this series in the archives (in case we need
> >> it later) for now ? Or would you still like me to post a non RFC version ?
> >
> > If nobody else has a different opinion (Heikki, Wolfram, Rafael?), I'm
> > fine with it to be in archives for the time being.
>
> Since no-one else has responded, lets just keep this series for the
> archives.
>
> Andy, that also means that there no longer is a reason to hold of merging
> your i2c-multi-instantiate cleanup series (minus patch 3 as discussed),
> so I've merged that into my review-hans branch now.

Cool, thanks!

-- 
With Best Regards,
Andy Shevchenko
