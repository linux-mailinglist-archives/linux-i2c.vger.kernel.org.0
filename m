Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68917477AF
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jul 2023 19:21:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjGDRVz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 4 Jul 2023 13:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjGDRVy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Jul 2023 13:21:54 -0400
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF34E76;
        Tue,  4 Jul 2023 10:21:53 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b58330576fso19014691fa.1;
        Tue, 04 Jul 2023 10:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688491312; x=1691083312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4u6eIXf7e98cure07zvGITm6ZjEeaYArMs+Y8ColeM=;
        b=WCkoqO7bdNSk9uncF+lDxVbpJVlKWfZ5083PSTyANANH52ACxF3EPQFGDh8z5eDh8q
         XPLZsm/92w2YcTe8hpL+0j/iJj/zCXGMnhItqmLRy2YuBd+aejMsPuzNJSn/iVcbBiPT
         ZvA699dUVnfmr64iDfwtRksXLLLcncWJSiaGF/zNZs8P0cqMF9SGQezM1jFLd+jblzkI
         AtwX5gQRFFd+9yu2BSRGWY1W9LPrhYV0yf5Hsi5R8ddSHuc+UL/cK4whBAa2AZTVij3l
         FjtPgevtC+0Gg/5TJvg8SqXKKJPp+VxdHSmiC/jHe9W0GGBTCRhWZGZcJleYerdsFjOF
         GUcA==
X-Gm-Message-State: ABy/qLZ1YxaeCh0LNtKJdxUbpDjusNTkyHsQX9r4fPwgkw+J4+9SdNqd
        LMzSCcuuBQfIXnPT3VkJ2f6MMxRrEEEnAEicjo4=
X-Google-Smtp-Source: APBJJlEzVFMq4eEFDvAnGVGxB6cIV+lZaBdnBF+zTrdd1CJZ8L8sBTMbIo2Q2EXSxB/VNYgGZwXg+pY3/OGR8tOISvU=
X-Received: by 2002:a2e:888e:0:b0:2b6:120a:af65 with SMTP id
 k14-20020a2e888e000000b002b6120aaf65mr9145539lji.3.1688491311701; Tue, 04 Jul
 2023 10:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230703121411.69606-1-andriy.shevchenko@linux.intel.com> <20230703121411.69606-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230703121411.69606-6-andriy.shevchenko@linux.intel.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 4 Jul 2023 19:21:40 +0200
Message-ID: <CAJZ5v0hytwzAPBpnPZnvdU7GhK12P0PJbe9aD+eVrVJhkq1ayA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] ACPI: scan: Provide symbol declarations
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        acpica-devel@lists.linuxfoundation.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Michael Walle <michael@walle.cc>
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

On Mon, Jul 3, 2023 at 2:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Compiler is not happy about a couple of symbols that, it thinks,
> are not declared:
>
>   warning: symbol 'acpi_device_lock' was not declared. Should it be static?
>   warning: symbol 'acpi_wakeup_device_list' was not declared. Should it be static?
>
> Include "sleep.h" to have them explicitly declared and make
> the compiler happy.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I've just applied a patch from Ben Dooks making the exact same change.

> ---
>  drivers/acpi/scan.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index ec1c9bec8bae..5b145f1aaa1b 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -23,6 +23,7 @@
>  #include <linux/dma-direct.h>
>
>  #include "internal.h"
> +#include "sleep.h"
>
>  #define ACPI_BUS_CLASS                 "system_bus"
>  #define ACPI_BUS_HID                   "LNXSYBUS"
> --
