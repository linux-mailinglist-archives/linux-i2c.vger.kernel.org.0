Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 655EB742364
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jun 2023 11:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbjF2Jnu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 29 Jun 2023 05:43:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjF2Jno (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Jun 2023 05:43:44 -0400
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920E11727;
        Thu, 29 Jun 2023 02:43:43 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-98e1fc9d130so13603466b.0;
        Thu, 29 Jun 2023 02:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688031822; x=1690623822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BOa2cA+os6Sirozpo+vKmIp/ZPBpwZIKMHVNEkdkAo=;
        b=FXLair9F1rsWjrg/DCklv5Ruhl/qoU3p6Kz8+S8C8VxPwKmJsvvMZXJxJPvcs2u+DA
         BVeIbRw58YsIk1MWwnDn84dp58CvTtZMFbcdIg6qNyGG5xtL8hMyI7u2qBUKmpdGAkzI
         Ui6bmkN0KlBvDphUJviuOW6vTrNzmhnZqwgOGRSp84SQOtFT5eDb4EuJ68aewHjxGopH
         hM/OPRyxagX9TKQWe/8JR2LPvUimGUt33QpUHUWo5sKp7cRFB4g8uStZJ63UZUcUn+er
         EyHkavW9diWHErllHJHymQpO/yKcJuBTdrGl6t+GdfdqL3Ia9YgDrh5B4dQVobCUhj54
         aiLg==
X-Gm-Message-State: AC+VfDxPrqKaZSBNXFyfhFqTkhmzQlmkncKJ7PZPiHSssqLbkea47u+U
        84hDL90rJ1TTECWtkJfb2PxtOFnSL52WtueNe+s=
X-Google-Smtp-Source: ACHHUZ7G91aFKoB+8LU9G+96kOiiq1furXLbqPGGVuciGs3Uxa/vAfBN7Q6yvT2GQPwiQM3yZ8MI5YaXyKqNY6RF5fc=
X-Received: by 2002:a17:906:73cc:b0:98d:b10f:f3cd with SMTP id
 n12-20020a17090673cc00b0098db10ff3cdmr10261241ejl.7.1688031821981; Thu, 29
 Jun 2023 02:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230626110026.65825-1-andriy.shevchenko@linux.intel.com>
 <20230626110026.65825-2-andriy.shevchenko@linux.intel.com>
 <CAJZ5v0jqP0N3=TB3w+HMwGMzctpRCjKa3a5iHKePP113T3CK-g@mail.gmail.com> <ZJ1KHJW6Jhma/rHc@smile.fi.intel.com>
In-Reply-To: <ZJ1KHJW6Jhma/rHc@smile.fi.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Thu, 29 Jun 2023 11:43:30 +0200
Message-ID: <CAJZ5v0hf49hneyE7a-qjcdUBBhtvPUhkM6XorecaOrSjn=PbAQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ACPI: bus: Constify acpi_companion_match()
 returned value
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, acpica-devel@lists.linuxfoundation.org,
        Len Brown <lenb@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
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

On Thu, Jun 29, 2023 at 11:08 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jun 29, 2023 at 10:49:17AM +0200, Rafael J. Wysocki wrote:
> > On Mon, Jun 26, 2023 at 1:00 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > acpi_companion_match() doesn't alter the contents of the passed
> > > parameter, so we don't expect that returned value can be altered
> > > either. So constify it.
> > >
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > This makes sense even without the rest of the series, so I can queue
> > it up right away if you want me to do that.
>
> Please, go ahead and thank you!

Done, thanks!
