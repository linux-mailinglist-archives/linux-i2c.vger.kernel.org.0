Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD1216815A8
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Jan 2023 16:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235868AbjA3P4e convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 30 Jan 2023 10:56:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235425AbjA3P4e (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Jan 2023 10:56:34 -0500
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4747681;
        Mon, 30 Jan 2023 07:56:33 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id y11so11397144edd.6;
        Mon, 30 Jan 2023 07:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAlScTTB+tf94CjxUdf3KOUl7WlYYBCqK07CBgYdTI8=;
        b=ima4yoZoR52dH2tEKWqixAU3VVcx6+h2wyjZfZxYE2HLbR7JlO2LygbtqxeFP+9Bwa
         KboAFQGY5qpsQS8kTfqk6L4fpzJjN9hBp98KDR5dChzsGOYVq09cEDfzOIyzVC6K1eSw
         0d2BfV07THO8zaxQVQTop+2bb81pe6XnGeb8o8idTDq5RSOY2c0N7p+iym1lAPQFv/2d
         3yw0GTMrNEw4i5QPn9sW+0bJk5tsdpeTthgBByu5q4RqmrhdhyWJPtXvqal0PVoIemxH
         JgoIuZpD777/rwQk751KKZE1F9QuBsuLyCla7EsrJ/A5dHi19tzyDbDlu6E5QiC3gK3k
         xG8w==
X-Gm-Message-State: AO0yUKVWAfve68Uz5h3Uz27/MV3I1QHRu9mDwTke/H0q819X3zyB4xkO
        PwvU08fBD/1CV2f3SVgHAhmsxl3VD+tIPjqTXbU=
X-Google-Smtp-Source: AK7set+x11XhQLwP/KmmbuzdkOHLUax+QGv7eHJdJ3G4vNxvaXcrsnv/OpSTe2BPmMKFPySbylH35DWmIjNRPRYTfVE=
X-Received: by 2002:a05:6402:1bd9:b0:4a2:223c:b96b with SMTP id
 ch25-20020a0564021bd900b004a2223cb96bmr2586995edb.49.1675094191585; Mon, 30
 Jan 2023 07:56:31 -0800 (PST)
MIME-Version: 1.0
References: <0113ca60-acf2-f4db-3230-959e9bb15726@o2.pl> <20230123214414.GA987407@bhelgaas>
In-Reply-To: <20230123214414.GA987407@bhelgaas>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 30 Jan 2023 16:56:20 +0100
Message-ID: <CAJZ5v0hTXAdM5oC_5cFF0pZU5QKaaqcsY4rADXJhAkAa0s=4Kw@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] acpi,pci: warn about duplicate IRQ routing
 entries returned from _PRT
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Borislav Petkov <bp@suse.de>,
        Jean Delvare <jdelvare@suse.com>,
        Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 23, 2023 at 10:44 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Mon, Jan 23, 2023 at 10:00:43PM +0100, Mateusz Jończyk wrote:
> > W dniu 23.01.2023 o 21:33, Bjorn Helgaas pisze:
> > > On Sat, Jan 21, 2023 at 04:33:14PM +0100, Mateusz Jończyk wrote:
> > >> On some platforms, the ACPI _PRT function returns duplicate interrupt
> > >> routing entries. Linux uses the first matching entry, but sometimes the
> > >> second matching entry contains the correct interrupt vector.
> > >>
> > >> Print an error to dmesg if duplicate interrupt routing entries are
> > >> present, so that we could check how many models are affected.
> > >
> > > It shouldn't be too hard to use qemu to figure out whether Windows
> > > uses the last matching entry, i.e., treating _PRT entries as
> > > assignments.  If so, maybe Linux could just do the same.
> > >
> > > Is anybody up for that?
> >
> > The hardware in question has a working Windows XP installation,
> > and I could in theory check which interrupt vector it uses - but
> > I think that such reverse engineering is forbidden by Windows' EULA.
>
> I'm not talking about any sort of disassembly or anything like that;
> just that we can observe what Windows does given the _PRT contents.
> You've already figured out that on your particular hardware, the _PRT
> has two entries, and Linux uses the first one while Windows uses the
> second one, right?
>
> On qemu, we have control over the BIOS and can easily update _PRT to
> whatever we want, and then we could boot Windows and see what it uses.
> But I guess maybe that wouldn't tell us anything more than what you
> already discovered.
>
> So my inclination would be to make Linux use the last matching entry.

But it would be able to log a diagnostic message anyway IMO.

So maybe two steps can be taken here, (1) adding the message printout
(this patch) and (2) changing the behavior?
