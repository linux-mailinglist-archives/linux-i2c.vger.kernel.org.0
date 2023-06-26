Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D191473DE8A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 14:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjFZML3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 26 Jun 2023 08:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjFZML3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Jun 2023 08:11:29 -0400
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EECC1B7;
        Mon, 26 Jun 2023 05:11:28 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-98502b12fd4so77250866b.1;
        Mon, 26 Jun 2023 05:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687781486; x=1690373486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZhXM3abO/TWseJ+v7a10dpSoRYmrv1y4DXO0h+pT1k=;
        b=XCUu0fMOZMj3ruHVxzY9UIHq7zkjvv/PQhu+6XMB0zb3aE4S1YTBZh++BtTLoXDYXC
         ILqvEoTEzExHmq38Ovrxz0DMPAuNtmhwF3C/+pZ0A8n6DOQJ+W0wVWYKuHLipG3o1DPi
         oJA8XB1aExCe0+ZNlf+OE/jS8P+AJzV3HbiOGVYJwcvBEEVmLGptvYqYivgOMYSiO58r
         u1mMcUJg9xn+yHVYu+OZDbFFYQ0xcnq4OS7cmrI9k4dZCPm2AqE3Pg75qExslB2CDibO
         QboLgW8YimH3kNZmQ8bzo4fV1xgUzmxq/zLlwlG5CneR2hyUh9WH4PMSgMI+q8eykFK3
         B/Xw==
X-Gm-Message-State: AC+VfDypNn+vWEZV5lGuN7qgBEhg12m2CCT7hrgXP2QQHmXaERRj6GOW
        CEH0QedpQdHdFJDjERmwrAoVQwJ2BmHBi3xzuyklClH1
X-Google-Smtp-Source: ACHHUZ6H6DoeG3UB/LQA/p9j7IRcCxorV6gO+ljSvS4+XcuK+CQNaWjZalZHmrp9JrD0ECM5lGn31laiEMF0WfqLBEs=
X-Received: by 2002:a17:906:100a:b0:987:81d:9d49 with SMTP id
 10-20020a170906100a00b00987081d9d49mr20762464ejm.7.1687781486213; Mon, 26 Jun
 2023 05:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230621151652.79579-1-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jt8XCzUxQaBXLz0zXezih1Urq=dt-K9PWVY1JpN=Go6Q@mail.gmail.com>
 <ZJSQf07cO6qmNyCn@smile.fi.intel.com> <CAJZ5v0iKLtQpUnhMqB6zgwbURXGFZkje5rNORS9MLqYN=13nWg@mail.gmail.com>
 <ZJlJFtsXoC6JyLxY@smile.fi.intel.com> <ZJlsEggaJZc9u15T@smile.fi.intel.com>
In-Reply-To: <ZJlsEggaJZc9u15T@smile.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 26 Jun 2023 14:11:10 +0200
Message-ID: <CAJZ5v0iU5LXcjG8j+S1VZbBmTWGdOdM2W4Yf8HMou2=HQW0-nA@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 26, 2023 at 12:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jun 26, 2023 at 11:15:19AM +0300, Andy Shevchenko wrote:
> > On Fri, Jun 23, 2023 at 04:43:55PM +0200, Rafael J. Wysocki wrote:
> > > On Thu, Jun 22, 2023 at 8:19 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Thu, Jun 22, 2023 at 05:53:13PM +0200, Rafael J. Wysocki wrote:
> > > > > On Wed, Jun 21, 2023 at 5:16 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > BTW, this doesn't need to increment the count even.  It could just
> > > terminate the walk on the first valid resource found and tell the
> > > caller to return true in that case.
> >
> > Indeed, thank you for the hint!
>
> Actually it's doesn't matter if we count them or not, we still must use the
> context of the call to set up a flag or whatever.

No, it is sufficient to pass a pointer to a bool variable.

> With the current code in mind I prefer to count resources and compare that
> to be non-zero. This will help to read and understand code better.

I'm not sure.  The condition is "if there is at least one valid
resource, skip the device".  Counting them all will make casual
readers wonder why IMO.
