Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9224F8F6B
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Apr 2022 09:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbiDHHV6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Apr 2022 03:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbiDHHVn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Apr 2022 03:21:43 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36833283F5C;
        Fri,  8 Apr 2022 00:19:41 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id k7so2019854vsb.5;
        Fri, 08 Apr 2022 00:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=DMeNt3olG0Wp2du+dxBX3Q71fHxom9k/adJcwm0QXDo=;
        b=Mf4ZofDF6wIkxnvzY1Pz9ysNZC/BcP5v3Rotxz8PpWBARNCta6isMKmhixvs4ujynW
         J3UuBchf8/utPG7XZOYYqdXTQYHGyFC+twKIGDzM6W91r/Jfd7JwIzyvX2OD9hPH9sqB
         j6uNslj1ZNJacdmv8B0PeAE+qAGNFU+AdK9845csIFopJleN3Gb/uYzJw9xuagunv4Dt
         bM48L6QMFJqcG6iNHp+go631aw/wO1Cq+sdbRplpzfq+P0kZugWbxqcybhJ+CkXwk1x+
         x+HAWtohEGR3BGLugyit6Jg/sfgnenZG7D+AhNdz+UsBNl6LD1Xdn0OGbTAYB2RpWduO
         3Fxg==
X-Gm-Message-State: AOAM530qJNhN9wuN0BwkCWLQG1QWeNtrpFmzKsILdc+mnRDy/UUhZb4k
        JJvWeSee/FOUDL0GB1HHrHNKOhVic7kIqw==
X-Google-Smtp-Source: ABdhPJykRpguBv+hpcGWZZpHcdjvdnCexnwRpUZevdNca67RIl5TxbskkbWO4CepFwnD5fdqVdYG7Q==
X-Received: by 2002:a67:6147:0:b0:328:1669:86a0 with SMTP id v68-20020a676147000000b00328166986a0mr2107658vsb.71.1649402379922;
        Fri, 08 Apr 2022 00:19:39 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id u185-20020a1fddc2000000b00344fe0cc19dsm571673vkg.10.2022.04.08.00.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 00:19:39 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id w21so4301692uan.3;
        Fri, 08 Apr 2022 00:19:39 -0700 (PDT)
X-Received: by 2002:ab0:21d5:0:b0:35d:1f9:3481 with SMTP id
 u21-20020ab021d5000000b0035d01f93481mr3129410uan.48.1649402379387; Fri, 08
 Apr 2022 00:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220326102229.421718-1-tanure@linux.com> <7hee2lu82n.fsf@baylibre.com>
 <CAJX_Q+1Y5pO_AGaFSXfo-J3EdGQeM2XYXzvsUtjtAFEXdwKEdQ@mail.gmail.com> <a27da359-3922-e4ee-16d2-b4cb6fc06ca8@baylibre.com>
In-Reply-To: <a27da359-3922-e4ee-16d2-b4cb6fc06ca8@baylibre.com>
Reply-To: tanure@linux.com
From:   Lucas Tanure <tanure@linux.com>
Date:   Fri, 8 Apr 2022 08:19:28 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2F_b+1Q_qAi6ZLkT=EoW+JjoT-cyONSnoehd5mkfUdsg@mail.gmail.com>
Message-ID: <CAJX_Q+2F_b+1Q_qAi6ZLkT=EoW+JjoT-cyONSnoehd5mkfUdsg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 5, 2022 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 28/03/2022 23:51, Lucas Tanure wrote:
> >
> >
> > On Mon, 28 Mar 2022, 21:37 Kevin Hilman, <khilman@baylibre.com <mailto:khilman@baylibre.com>> wrote:
> >
> >     Hi Lucas,
> >
> >     Lucas Tanure <tanure@linux.com <mailto:tanure@linux.com>> writes:
> >
> >      > The default duty cycle of 33% is less than the required
> >      > by the I2C specs for the LOW period of the SCL clock.
> >      >
> >      > So, for 100Khz or less, use 50%H/50%L duty cycle, and
> >      > for the clock above 100Khz, use 40%H/60%L duty cycle.
> >      > That ensures the low period of SCL is always more than
> >      > the minimum required by the specs at any given frequency.
> >
> >     Thanks for the fixes!
> >
> >     This is going to affect all SoCs, so ould you please summarize how your
> >     changes were tested, and on which SoCs & boards?
> >
> >     Thanks,
> >
> >     Kevin
> >
> >
> > Hi,
> >
> > I only tested against vim3 board, measured the bus with an saleae logic pro 16.
> > The measurements were with 100k, 400k and a few in between frequencies.
> >
> > Is that enough?
>
> I did a few measures on the Libre Computer Le Potato S905X board:
>
> i2c_AO:
>
> Before the patchset, I got:
> - 100KHz: 1.66uS HIGH, 6.75uS LOW, 20%/80%, Freq 118KHz /!\
> - 400KHz: Unable to decode, clock line is invalid, Data line is also invalid
>
> With the patchset
> - 100KHz: 4.25uS HIGH, 6.58uS LOW, 40%/60%, Freq 92KHz
> - 400KHz: 0.33uS HIGH, 3.00uS LOW, 10%/90%, Freq 300KHz
>
> i2c_B:
>
> Before the patchset, I got:
> - 100KHz: 2.25uS HIGH, 5.41uS LOW, 29%/71%, Freq 130KHz /!\
> - 400KHz: 0.42uS HIGH, 1.66uS LOW, 20%/80%, Freq 480KHz /!\
>
> With the patchset
> - 100KHz: 4.75uS HIGH, 5.42uS LOW, 46%/54%, Freq 98KHz
> - 400KHz: 0.66uS HIGH, 2.00uS LOW, 24%/75%, Freq 375KHz
>
>
> So this fixes the frequency, before they were invalid.
> And it fixes 400KHz on i2c_AO...
>
> I do not understand why behavior is different between i2c_AO & i2c_B, they
> are feed with the same clock so it should be the same.
>
> Did you check on both i2c interfaces ? can you share your results ?

I only checked I2C interfaces i2c3 and i2c_ao.
I will submit a new patch chain with more results.

>
> Neil
>
> >
> > Thanks
> > Lucas
> >
> >
> >
>
