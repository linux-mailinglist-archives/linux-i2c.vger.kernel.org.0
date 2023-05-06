Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9384C6F918D
	for <lists+linux-i2c@lfdr.de>; Sat,  6 May 2023 13:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbjEFLfJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 6 May 2023 07:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbjEFLfI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 6 May 2023 07:35:08 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9966A76A5;
        Sat,  6 May 2023 04:35:07 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-5eefa0a5561so26635286d6.1;
        Sat, 06 May 2023 04:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683372907; x=1685964907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sK36cKnvukm+DR/gYW/LoqX2aifa388gDAb/9gGJFM=;
        b=MjYJhLZJUraZ9r0jbqCNE05KXBwtUhhlscYfDjCWi6DwoXlFHMs0ouY57e1qfjJBpx
         7byz+9W5QFXQu1UsdRjZEIR7zYdJIxFvW+/25bYRh6xQ1Eaq7Y++yHyUryrm+jjoAKxP
         FcLYWhOIVH4X9VM6epBOzlBm5o0O3OnNW1kILTyMRIjwI4BJ7DVEjSOOIBP23ePidIjY
         PpSCYksQmeMpB/aDYqDk+8fhNHc6gjrrY7wF17YX0Mw0XioU/a1BCof0gMnai2YIILEf
         uEzkFwZaB21uuTi0X7GBlhkIsmRwu+S2exXY0c3gVhwlM5Riq1VDGfbhLAODbgtD8FgE
         ExrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683372907; x=1685964907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sK36cKnvukm+DR/gYW/LoqX2aifa388gDAb/9gGJFM=;
        b=YjHPEYGtHHWKiVhXr3qwNNQ9DLgaz+Hq4pcDWiGW9pxyWslD7HI1YDzeoS0+2T+ILv
         Qoxt95ATfC0S4c4SeFhJiP+xv4Ns9WQj7+wDlFxM3OS8QMmfVkcj50CXpmtEc27aS+Qk
         bHmnyyA6RXT8P0cUNCoVz13n090fabsb63EA5b5g/j5rrojy4Fq1GfaSRigPXr9C2FzL
         xrqvw9JD3bjrAwkgjsgIZDOOqvQjByccKiAaFJnyxjXlUiaVsOi/CQZIUgC8I7bSgXHa
         XWISo04PaeJwKfuIHTXz6TQPvSI6PSy8qPOf/rI2zrweKcS4t0y8DlLXy8kN3bIc2k0y
         b/UQ==
X-Gm-Message-State: AC+VfDxaoVWQ/TFXOQf8YFgpVnX97T2upWD4PkhOJOY4mBJcBNTfhQgd
        9JtFYmgIK3H/fDszUvTCi97OQSA43bWwvbUv6OB3Cvp9njMmsg==
X-Google-Smtp-Source: ACHHUZ7/w5GybeH4u/9nQ9t3b/C79E8Tvvt3ygLViSILeHXSXAcn7TV0DL0HrtpRSxSCFHRPxueMZSkYMYzYrXlcG+U=
X-Received: by 2002:ad4:596a:0:b0:61a:ee15:4a93 with SMTP id
 eq10-20020ad4596a000000b0061aee154a93mr4834907qvb.28.1683372906726; Sat, 06
 May 2023 04:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230505074228.84679-1-jiawenwu@trustnetic.com>
 <20230505074228.84679-3-jiawenwu@trustnetic.com> <ZFVPYSKfvQq3WeeO@surfacebook>
 <ZFViufP6qh79C1-T@surfacebook> <000001d97ffd$39ae2db0$ad0a8910$@trustnetic.com>
In-Reply-To: <000001d97ffd$39ae2db0$ad0a8910$@trustnetic.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 6 May 2023 14:34:30 +0300
Message-ID: <CAHp75Vfj1RDSv2gX=NokEaXgcD9W83V_sYwyTP35a1BfosCFXg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next v6 2/9] i2c: designware: Add driver support
 for Wangxun 10Gb NIC
To:     Jiawen Wu <jiawenwu@trustnetic.com>
Cc:     netdev@vger.kernel.org, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, Jose.Abreu@synopsys.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        mengyuanlou@net-swift.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, May 6, 2023 at 12:29=E2=80=AFPM Jiawen Wu <jiawenwu@trustnetic.com>=
 wrote:
> On Saturday, May 6, 2023 4:11 AM, andy.shevchenko@gmail.com wrote:
> > Fri, May 05, 2023 at 09:48:01PM +0300, andy.shevchenko@gmail.com kirjoi=
tti:
> > > Fri, May 05, 2023 at 03:42:21PM +0800, Jiawen Wu kirjoitti:

...

> > > > + device_property_read_u32(&pdev->dev, "wx,i2c-snps-model", &dev->f=
lags);
> > >
> > > I believe in your case it should be named something like
> > > "linux,i2c-synopsys-platform". But in any case this I leave
> > > to the more experienced people.
> >
> > Or "snps,i2c-platform", I dunno...
>
> I thought you wanted me to introduce a property specific to my device,
> so I named it "wx,...".

But the property meaning is not in this case. If you want the specific
one, it should be boolean (it's also a possible way to go):

  if (device_property_present(...))
    dev->flags |=3D MODEL_...;

> But if it's a universal property for platform device,
> maybe it's necessary to check if flag is NULL, otherwise the second resul=
t
> will overwrite it.

Right. With boolean like above it will be more robust.

--=20
With Best Regards,
Andy Shevchenko
