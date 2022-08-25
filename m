Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9175A1076
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 14:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241607AbiHYM3w (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 08:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241687AbiHYM3t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 08:29:49 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A006B2D9F;
        Thu, 25 Aug 2022 05:29:42 -0700 (PDT)
Received: from mail-ed1-f50.google.com ([209.85.208.50]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MJEtx-1ok5OA0BXX-00KkXr; Thu, 25 Aug 2022 14:29:41 +0200
Received: by mail-ed1-f50.google.com with SMTP id z2so25904378edc.1;
        Thu, 25 Aug 2022 05:29:40 -0700 (PDT)
X-Gm-Message-State: ACgBeo0LSyn14gF097vrNh3SQOMtuu9lYgzAfAI49h+16QRrqEdypkty
        bOPjpK9K5L2vLBXG7CsqzpRIr7XUTWXtVNoRyxk=
X-Google-Smtp-Source: AA6agR7KLEkAM4h39WPvK1n/vrpN5oyAY305pogjb5TjxCoIxGhtM1grQtWxFDj0eVYDz8/thf8BgPF1EzfN/sp1J84=
X-Received: by 2002:a05:6402:5241:b0:447:47:5bf1 with SMTP id
 t1-20020a056402524100b0044700475bf1mr3109096edd.227.1661430580695; Thu, 25
 Aug 2022 05:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
In-Reply-To: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 25 Aug 2022 14:29:21 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rteX8N2A-K-8bmvWaUhLJjXLV_8JNLCY0ezBzkQODUg@mail.gmail.com>
Message-ID: <CAK8P3a3rteX8N2A-K-8bmvWaUhLJjXLV_8JNLCY0ezBzkQODUg@mail.gmail.com>
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
To:     Arminder Singh <arminders208@outlook.com>
Cc:     linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Hector Martin <marcan@marcan.st>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:qvPLYgiha1jlBb0JrK6hiHWGeSURlujUywUeocgI9ZEDAtJYvGr
 wVB1YHXLUgPgdOxl0e2hFuHetCzWp4mgjPAZajlxfxEIW41JEMAjCi/oALI82XmS2/dqdSy
 acD3ogFEdkhoEs3OM4HaJqsRh9LCDxBmm5PVWk5ywbZn0SIhkRqXRYHDffDNvF6T/eyS2er
 k+Pql3k9Mq1L8nvcSrH0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qZTU8vXY4lc=:sQ+HRRq0VCpNFsqrcu+2SF
 22HwveonHAxEDBDAKM3M1avy3tQF+gwf1H81eCWlyjAgJA7/q8mqioynq6eq1FKhYZnXcByD/
 nPPrRaVBAGiHyN5H02PWGThDLxcZpNjuhdWAqkeB0DV39QY9fmcdKWq6rPUlx8wnr9SHUJ74J
 NToXw2SlpO/eyvitO0SnDIdthLVDXOGz0a3aJqFJSKluTwbzYIWYLJLypaGKi5HBJnRpimH4n
 CWfLZkHtaqjnnBz0CBOK6N1mrFHtbW1jd4/W9tz2t3rhUPZGt2iP3NxEC+Bi76rvPQL6ttKII
 1Ym54Bg0xosj+jT89ZD8+y/SYEBsS/FgFhwSgZwDj/43tMn+GBNZoHUGOn2Yujm8PKjmViyzt
 e2OzRMNRUTYabIYHPAa88iQAQhovzNzirSqncusdohlf8FnDw/klfH3f0nui+d42FRQlAfqps
 mhuyQlMJRH6Nd5uamvqBDRDqCbnEiaSJTMrG3rmBLLJjEICmPNcXl6CtPICibiUUgM2zOSICs
 b6THRbirHH5EMOPr78Z3DB4uC0PQDGcpC8e6HDr6ZqLDgPHqo+jiRwn1soLWDxMxoLzoMayei
 0K73jIN3NnA8/3kKdzaTDM6K5J5Kjv3cC/JolI3k8nf3WANLj0BH56vKIbRK/ocuu38oloYHS
 yj0B3zyUthTPaSkABN11lHZQr+C65Kole1DEnFNP/kg8OB8wCLoQ3MIZuTEyqrVsByPwgV6Hu
 gPx/+27MF0FE5S44YS1pg/k5KA4mnBEHRgWIng==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Aug 20, 2022 at 9:45 PM Arminder Singh <arminders208@outlook.com> wrote:
>
> I also fixed a quick checkpatch warning on line 303. "i ++" is now "i++".

In general, anything that is mentioned in the changelog as "also done this"
is worth splitting into a separate patch, or dropping from the patch, to
make reviewing easier.

In this case, I would just not do the trivial change. Alternatively you
can consider doing a larger patch for coding style cleanup on the
patch, as there are possibly other issues as well. Usually it's not worth
changing things unless they hurt readability.

> @@ -80,14 +81,21 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
>  {
>         int timeout = 10;
>         unsigned int status;
> +       unsigned int bitmask = SMSTA_XEN | SMSTA_MTN;
>
> +       if (smbus->use_irq) {
> +               reinit_completion(&smbus->irq_completion);
> +               reg_write(smbus, REG_IMASK, bitmask);
> +               wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
>                 status = reg_read(smbus, REG_SMSTA);
>         }
>
> +
>         /* Got NACK? */
>         if (status & SMSTA_MTN)
>                 return -ENXIO;
...
> @@ -356,3 +366,12 @@ int pasemi_i2c_common_probe(struct pasemi_smbus *smbus)
>
>         return 0;
>  }
> +
> +irqreturn_t pasemi_irq_handler(int irq, void *dev_id)
> +{
> +       struct pasemi_smbus *smbus = (struct pasemi_smbus *)dev_id;
> +
> +       reg_write(smbus, REG_IMASK, 0);
> +       complete(&smbus->irq_completion);
> +       return IRQ_HANDLED;
> +}

I think the completion structure gets out of sync if you run into a
timeout here,
so a subsequent wait_for_completion will never complete after we missed one
interrupt.

Since this already causes a bus reset, I think you can just do
reinit_completion() at the end of pasemi_reset() to avoid this.

        Arnd
