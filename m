Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FDA273BA88
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 16:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbjFWOp2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 23 Jun 2023 10:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231393AbjFWOow (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 10:44:52 -0400
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E231997;
        Fri, 23 Jun 2023 07:44:10 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b46d945510so1899441fa.1;
        Fri, 23 Jun 2023 07:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687531448; x=1690123448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZiwtYNSOh0NeHU7WEn4N3VuCjNo0G26bDf11cTSsZno=;
        b=ZIVtQEvIiRiIG17zavSMNhQAXGJLlM9rcfAd/qXy/9YbTEVoF86N27i9OX6GJo9Hl/
         MjooJIHnpIT80SIwXj5xrKIK27lvrNvWcsHWi2FOxiJC5STYDCCSrOYWck2WQhFl1rrt
         3JkmT+Z4pC4K/YlLUnRF3V1C9CJja5Vq1FoNDaiZCectWFBz23LmwHlMAxL9D20Wy249
         hHSlYTHBb0V9wpYvc/8/LzZoVURGhof69QpmRBlDH5XloIW172xDsVQ/kkcuqUgb7sLM
         bnvfp9heR2rVGCZVM+N3kRrNNlA1R3/kMMDKFPisw3cm2IUGKTsjCv+kFeSDd+TToxAT
         tDkQ==
X-Gm-Message-State: AC+VfDxQWmKB2BBHxZo3Z8aBFnaPt/We2FaGi7RYPr+yjZYApWrTCAWB
        7c3ymC1swUZuE0ubGAG7svdjLK53BCnOXRce65JNs8kFYWY=
X-Google-Smtp-Source: ACHHUZ52+16LL+CRSPIyup7hQg+18EmiT6Qex68UctPZrXoSH36kbOkm0FDBp/YJbsHR5yt+iCZJXHVn4LPr42y4djQ=
X-Received: by 2002:a2e:b804:0:b0:2b4:5bc8:3f1a with SMTP id
 u4-20020a2eb804000000b002b45bc83f1amr12642496ljo.2.1687531448363; Fri, 23 Jun
 2023 07:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jt8XCzUxQaBXLz0zXezih1Urq=dt-K9PWVY1JpN=Go6Q@mail.gmail.com> <ZJSQf07cO6qmNyCn@smile.fi.intel.com>
In-Reply-To: <ZJSQf07cO6qmNyCn@smile.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Fri, 23 Jun 2023 16:43:55 +0200
Message-ID: <CAJZ5v0iKLtQpUnhMqB6zgwbURXGFZkje5rNORS9MLqYN=13nWg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ACPI: platform: Ignore SMB0001 only when it has resources
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Brunner <michael.brunner@kontron.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 22, 2023 at 8:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jun 22, 2023 at 05:53:13PM +0200, Rafael J. Wysocki wrote:
> > On Wed, Jun 21, 2023 at 5:16 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > After switching i2c-scmi driver to be a plaform one, it stopped
> >
> > "platform"
> >
> > > being enumerated on number of Kontron platforms, because it's
> > > listed in the forbidden_id_list.
> > >
> > > To resolve the situation, split the list to generic one and
> > > another that holds devices that has to be skipped if and only
> >
> > "have"
> >
> > > if they have bogus resources attached (_CRS method returns some).
>
> Thanks for the typo fixes!
>
> ...
>
> > > +static const struct acpi_device_id forbidden_id_with_resourses[] = {
> >
> > I don't quite like this name and the driver_data field could be used
> > to indicate the need to check the resources.
>
> Okay, something like
>
> /* Check if the device has resources provided by _CRS method */
> #define ACPI_PLATFORM_CHECK_RES         BIT(0)
>
> ?

Could be, but this is specific to forbidden_ids_list[].  Maybe
ACPI_ALLOW_WO_RESOURCES or similar.

> > > +       {"SMB0001",  0},        /* ACPI SMBUS virtual device */
> > > +       { }
> > > +};
>
> ...
>
> > > +static int acpi_platform_resource_count(struct acpi_resource *ares, void *data)
> > > +{
> > > +       int *count = data;
> > > +
> > > +       *count = *count + 1;
> >
> > Why not (*count)++?
>
> Can be that way, I just copied'n'pasted from the existing code.
>
> > > +       return 1;
> > > +}

BTW, this doesn't need to increment the count even.  It could just
terminate the walk on the first valid resource found and tell the
caller to return true in that case.
