Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA45290841
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Oct 2020 17:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409271AbgJPPZD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 11:25:03 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34793 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407453AbgJPPZC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Oct 2020 11:25:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id t18so1476463plo.1;
        Fri, 16 Oct 2020 08:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p4wHBbyj1qP+0UQOePmRIec/eGkyuo1FhUm5Kz5xQBo=;
        b=m3XcGXj5NOKIJs+/pTRNm/J7ZArDbu5MYq6Oue18/yHzQWuv630a31Q1KV+uH4uzJa
         HLbSmVMURdW+cZMBiCx1ZctmXa5LN2k8CZ6JHPlNYk8km7pifbhizb/YNJtW2kTx8BYE
         GXptIoifEfZ+k4moAjLo3I8LZRcgXLNt8dpEO8Xchqll34fWVA3vItduh/UeGXhtBJQL
         /1iZaxxQwmGOEQFyLEu2Ekfncn9o2QHp58ai8vZrxTQfAq0mPTT8mzHqdhuk14u/wvsv
         /ipPIy71gMslFOXyS2x102xQ9redL3Uihh6TAzMPH9PgdvIL0lMyh3qVWyGI2CtcmBFe
         MEuA==
X-Gm-Message-State: AOAM530Elpsbai9/yqTg/gAffBGxU6/n7mqw3r8QrDM+yjKWvAKvAGjN
        PUOCQpxCVQmVa2RyhK+GTC0=
X-Google-Smtp-Source: ABdhPJw9UYXeXs92vRB5+O8EXfRISY/W3Zevu2pibPenDaQ4nRxLdZixgQInEEAIEkoZdM/fbOxppA==
X-Received: by 2002:a17:90a:d983:: with SMTP id d3mr4546348pjv.144.1602861901907;
        Fri, 16 Oct 2020 08:25:01 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-131-119.cust.tzulo.com. [198.54.131.119])
        by smtp.gmail.com with ESMTPSA id f4sm3330388pgk.19.2020.10.16.08.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 08:25:00 -0700 (PDT)
Date:   Fri, 16 Oct 2020 08:24:58 -0700
From:   Sultan Alsawaf <sultan@kerneltoast.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-i2c@vger.kernel.org,
        aaron.ma@canonical.com, admin@kryma.net,
        andriy.shevchenko@linux.intel.com, benjamin.tissoires@redhat.com,
        hn.chen@weidahitech.com, jarkko.nikula@linux.intel.com,
        kai.heng.feng@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com,
        vicamo.yang@canonical.com, wsa@kernel.org
Subject: Re: [PATCH v2 0/4] i2c-hid: Save power by reducing i2c xfers with
 block reads
Message-ID: <20201016152458.GA37863@sultan-box.localdomain>
References: <20200917052256.5770-1-sultan@kerneltoast.com>
 <nycvar.YFH.7.76.2009221118150.3336@cbobk.fhfr.pm>
 <b29e577e-7c10-1e28-ef01-22b00a9734e5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b29e577e-7c10-1e28-ef01-22b00a9734e5@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Oct 16, 2020 at 01:16:18PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/22/20 11:19 AM, Jiri Kosina wrote:
> > On Wed, 16 Sep 2020, Sultan Alsawaf wrote:
> > 
> >> From: Sultan Alsawaf <sultan@kerneltoast.com>
> >>
> >> This is a fixed resubmission of "[PATCH 0/2] i2c-hid: Save power by reducing i2c
> >> xfers with block reads". That original patchset did not have enough fixes for
> >> the designware i2c adapter's I2C_M_RECV_LEN feature, which is documented
> >> extensively in the original email thread.
> >>
> >> Here is the original cover letter, which still applies:
> >> "I noticed on my Dell Precision 15 5540 with an i9-9880H that simply putting my
> >> finger on the touchpad would increase my system's power consumption by 4W, which
> >> is quite considerable. Resting my finger on the touchpad would generate roughly
> >> 4000 i2c irqs per second, or roughly 20 i2c irqs per touchpad irq.
> >>
> >> Upon closer inspection, I noticed that the i2c-hid driver would always transfer
> >> the maximum report size over i2c (which is 60 bytes for my touchpad), but all of
> >> my touchpad's normal touch events are only 32 bytes long according to the length
> >> byte contained in the buffer sequence.
> >>
> >> Therefore, I was able to save about 2W of power by passing the I2C_M_RECV_LEN
> >> flag in i2c-hid, which says to look for the payload length in the first byte of
> >> the transfer buffer and adjust the i2c transaction accordingly. The only problem
> >> though is that my i2c controller's driver allows bytes other than the first one
> >> to be used to retrieve the payload length, which is incorrect according to the
> >> SMBus spec, and would break my i2c-hid change since not *all* of the reports
> >> from my touchpad are conforming SMBus block reads.
> >>
> >> This patchset fixes the I2C_M_RECV_LEN behavior in the designware i2c driver and
> >> modifies i2c-hid to use I2C_M_RECV_LEN to save quite a bit of power. Even if the
> >> peripheral controlled by i2c-hid doesn't support block reads, the i2c controller
> >> drivers should cope with this and proceed with the i2c transfer using the
> >> original requested length."
> >>
> >> Sultan
> >>
> >> Sultan Alsawaf (4):
> >>   i2c: designware: Fix transfer failures for invalid SMBus block reads
> >>   i2c: designware: Ensure tx_buf_len is nonzero for SMBus block reads
> >>   i2c: designware: Allow SMBus block reads up to 255 bytes in length
> >>   HID: i2c-hid: Use block reads when possible to save power
> >>
> >>  drivers/hid/i2c-hid/i2c-hid-core.c         |  5 ++++-
> >>  drivers/i2c/busses/i2c-designware-master.c | 15 +++++++++------
> >>  2 files changed, 13 insertions(+), 7 deletions(-)
> > 
> > Hans, Benjamin, could you please give this patchset some smoke-testing? It 
> > looks good to me, but I'd like it to get some testing from your testing 
> > machinery before merging.
> 
> Sorry for being slow to respond to this. I have not gotten around to testing
> this, but I saw another email that this breaks things on at least AMD
> platforms, so I guess that this is on hold for now ?
> 
> Regards,
> 
> Hans

Hi,

Only the i2c-hid-core.c hunk is on hold. It is on hold until every i2c adapter
gets updated for proper block read functionality up to the new block read limit
of 255 bytes. This is not really a surprise.

The designware patches are good to go. Please let me know what you think of
them.

Sultan
