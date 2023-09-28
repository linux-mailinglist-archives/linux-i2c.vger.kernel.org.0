Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94AAD7B1F0E
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 15:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbjI1N4x (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 09:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232440AbjI1N4x (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 09:56:53 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437AC1A6
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 06:56:51 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so20718748e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 28 Sep 2023 06:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695909408; x=1696514208; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxPZWQf1jw9MHdfo1JPytSk2yZsM3hoAykpf52V7Iz8=;
        b=GyK907qXLz1NgByW7qgeR7RYemU/+JYohjP1NOcWPJ5v+D+dGwhW5+7T7DeQncfCtD
         MmlGPwEwFEYZIleLCf41+SB6AASCoC97djn2V4PR7e5SSoVpTaxp523AK1rDn2Lr7sYm
         4wDgT2JiZS8j+p45UISUXpxhojpARYsQ342fWQ1cELXlJXOzs6BaRYzVPuWCaNaC/72b
         b6kVBgwiM1KaHAKrK6kOUu2qHK2C2KBW1BMZLFiGC8ODBPWozyHGwtpky06W5s5Ralw/
         8IED8GWph5OVHHGsf0NpM0iqUYF4IK8AlkEQUnPcmdocvhKJWu/f7KR3ARwrmTbx1Oi4
         UJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695909408; x=1696514208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxPZWQf1jw9MHdfo1JPytSk2yZsM3hoAykpf52V7Iz8=;
        b=uo52+WAdg9twK20lpR3aByJ2McgbdhjWj7p1G6LoS3Kok91GEMRanyYKtOcUBAbU7f
         N0vgm0LQtzL1/T2Q21dVFXRiMKJIx4g0X/iX09JZhNmcnLtvqnCxY0vYIqpTD10eQCE9
         NR6qxIcrTb1NRRLNzzfPc0mXqGB2GqozAPztgu65Z0mFBsyJ3AOod5cyLUvYNMu2S8hx
         hn5RTLLV2iDVJkbv90G/EqIKOM85LOfxCWq/inaP9KAw9fArfW99wOYSYRECwrEKPDVp
         CfOcfKtfb9Ol5UCtASx/yR2kmGtGRX7c8ZNNdj6j9qjuhcEXWIi7nwaoicsgK/J6L/fZ
         yqcQ==
X-Gm-Message-State: AOJu0Yx52rY7N80iVKZgOBMNYZZ9I45XMiFNw/ReytRvVh+lVROhlXpt
        xGvUqzznUwm/dIlVrM+HnU7uqoUvVOQHloY1JYbp0A==
X-Google-Smtp-Source: AGHT+IGWt/wwI1p/wZzGGCUfLvgGR5TCHpLokdh/WyYX4g0mNEhcbq32z+QYCub4QkTCL//rj90mIgcT2dEcBY4jYVc=
X-Received: by 2002:a19:e05a:0:b0:500:adbd:43e7 with SMTP id
 g26-20020a19e05a000000b00500adbd43e7mr1393633lfj.8.1695909408216; Thu, 28 Sep
 2023 06:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh> <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
 <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com> <ZRVxedVoCetvqGm3@ashyti-mobl2.lan>
In-Reply-To: <ZRVxedVoCetvqGm3@ashyti-mobl2.lan>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 28 Sep 2023 15:56:35 +0200
Message-ID: <CAMRc=MfdvkHSvCv_RcQo3MoMWrWCQn_JfbpL7RdZrrQ_cqMteA@mail.gmail.com>
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
To:     Andi Shyti <andi.shyti@linux.intel.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Wentong Wu <wentong.wu@intel.com>, arnd@arndb.de,
        mka@chromium.org, lee@kernel.org, wsa@kernel.org,
        kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, sakari.ailus@linux.intel.com,
        bartosz.golaszewski@linaro.org, srinivas.pandruvada@intel.com,
        zhifeng.wang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Sep 28, 2023 at 2:29=E2=80=AFPM Andi Shyti <andi.shyti@linux.intel.=
com> wrote:
>
> Hi,
>
> On Thu, Sep 28, 2023 at 12:18:50PM +0200, Oliver Neukum wrote:
> > On 17.09.23 13:26, Hans de Goede wrote:
> > > Note I did not ask for a new version to be send right away, but
> > > I'm afraid there has been a bit of miscommunication and instead
> > > of rebasing the next version based on further review Wentong has
> > > send out a new rebased version immediately, sorry about that.
> >
> > Hi,
> >
> > what to do now? It's been ten days.
> > I am sure this driver has been very thoroughly reviewed by now.
> > We are dragging this out. Do we want the developer to do another releas=
e
> > or do we ask Greg to take it as is?
> > This is becoming almost comical, but that is not what we want driver
> > submission to be.
> >
> > As far as I am concerned on the USB side everything is fine now.
> > Hans? Greg?
>
> i2c is also good to go and the rest looks good, as well. I have
> some concerns on patch 4 that looks like a mixture of many random
> things.
>
> Andi

It's got a lot of coding style fixes ninja-packed in there that are
not mentioned by the commit message. But as it's been reviewed by
Linus, acked by Andy (and myself) and tested by Hans, I'm ready to let
it slide if that saves me from seeing ten additional versions of this
series in my inbox.

Bart
