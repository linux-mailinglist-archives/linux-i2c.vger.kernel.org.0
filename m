Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D0F314EC4
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Feb 2021 13:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhBIMM0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Feb 2021 07:12:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhBIMLw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Feb 2021 07:11:52 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A753C061786;
        Tue,  9 Feb 2021 04:11:12 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id o193so8100565qke.11;
        Tue, 09 Feb 2021 04:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9b1+FT42iYfcBaXACNqZZ8m0dOYDgpi8jpItwihB888=;
        b=UGlY2FQWhtT3walGbEZSEZicPmfHAAfnO+Qy2cpBcfFE/eCtSyGhllrt7V3ARb+idi
         VZmpoIChaC56Wocfdzm1xDhttnJKU2403POE7bOYgWPj0jFttWxJPiUHMEt9Rug7z7/G
         gZKy8gxFr7zOIt15N98S/AxtUPaWeD5aZRssE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9b1+FT42iYfcBaXACNqZZ8m0dOYDgpi8jpItwihB888=;
        b=tDB3ftXvRXtf/PJS4HGeUFZV+atoEWHdgmHQu+GIzYmmCZJUZZNTH1jcDQIhNKCWMS
         Nx4PHEyRXdG7Z+lQKo0kq1xwiL4tEptdS8TDI/IzYOc0lcJyv1cPUM5DMcLJz3NrCD3t
         2KuTu8BRAKnbG0q2/4MQP6VlSD6uGXo8XNF/T+fCnySRcIYaIy1FVMS4fBOEh4BQp+o0
         d8q51qXHvLyPvSdzQwQc7g/p2PL9PuhOYMTOBLII1Ogu96n+nwxv1UOVqo0t5JLUKayJ
         qZTUfLZGbwago+0dl2zVluP3R1WYnsyMT9c/COOWDHBksdA8+zwycvZDWid5Ihd4Gtpb
         iTEg==
X-Gm-Message-State: AOAM532fqVxQTIOFb6dV2n5n30RfwhXxUkPjJ4MOl5j39YFNu/qGNBne
        8Rgn+6cHyyMgTDDk17a6NbOtFNbICOx62wQSGH4=
X-Google-Smtp-Source: ABdhPJznG+/3DRBuaBXOdhGQaUyUKQ7CvJxjrD65Ucij76t+VNLlWYhA5nJdNKP2loti8FRSBk9GJ1U7fyFVqRwjKmQ=
X-Received: by 2002:ae9:e314:: with SMTP id v20mr11627616qkf.66.1612872671495;
 Tue, 09 Feb 2021 04:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
 <20210112003749.10565-2-jae.hyun.yoo@linux.intel.com> <20210114193416.GA3432711@robh.at.kernel.org>
 <4f67358e-58e5-65a5-3680-1cd8e9851faa@linux.intel.com> <CACPK8XcZTE=bnCP1-E9PTA09WnXG9Eduwx0dm-QqmQJUDa_OrQ@mail.gmail.com>
 <1814b8d1-954c-0988-0745-e95129079708@linux.intel.com> <87ed4085-26e4-98f8-21e3-b1e3c16b0891@linux.intel.com>
In-Reply-To: <87ed4085-26e4-98f8-21e3-b1e3c16b0891@linux.intel.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 9 Feb 2021 12:10:59 +0000
Message-ID: <CACPK8XekihpoXEeyUbWSXsRkVMbX1gKG-gSeYgWq=s3UR2gi1g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Rob Herring <robh@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
        Cedric Le Goater <clg@kaod.org>, linux-i2c@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, 3 Feb 2021 at 23:03, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> Hi Joel
>
> On 1/28/2021 11:36 AM, Jae Hyun Yoo wrote:
> > Hi Joel
> >
> > On 1/27/2021 4:06 PM, Joel Stanley wrote:
> >>>> All this information doesn't need to be in the binding.
> >>>>
> >>>> It's also an oddly structured dts file if this is what you are doing...
> >>>
> >>> I removed the default buffer mode settings that I added into
> >>> 'aspeed-g4.dtsi' and 'aspeed-g5.dtsi' in v1 to avoid touching of the
> >>> default transfer mode setting, but each bus should use its dedicated
> >>> SRAM buffer range for enabling buffer mode so I added this information
> >>> at here as overriding examples instead. I thought that binding document
> >>> is a right place for providing this information but looks like it's not.
> >>> Any recommended place for it? Is it good enough if I add it just into
> >>> the commit message?
> >>
> >> I agree with Rob, we don't need this described in the device tree
> >> (binding or dts). We know what the layout is for a given aspeed
> >> family, so the driver can have this information hard coded.
> >>
> >> (Correct me if I've misinterpted here Rob)
> >>
> >
> > Makes sense. Will add these settings into the driver module as hard
> > coded per each bus.
> >
>
> Realized that the SRAM buffer range setting should be added into device
> tree because each bus module should get the dedicated IO resource range.
> So I'm going to add it to dtsi default reg setting for each I2C bus
> and will remove this description in binding. Also, I'll add a mode
> setting property instead to keep the current setting as byte mode.

I don't understand. What do you propose adding?
