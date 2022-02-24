Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E327A4C2D32
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 14:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235017AbiBXNfC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 08:35:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbiBXNfB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 08:35:01 -0500
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BFA178689;
        Thu, 24 Feb 2022 05:34:31 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id y26so2116234vsq.8;
        Thu, 24 Feb 2022 05:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/rGJyXX5HuWtJN5KYux5wXK7Ltl9r3aNxihQ5ZjTDFA=;
        b=UV3BxKRez+pXvCKAlbJeJgWGZKESsxE1s1oFIs2CH5iqa/D7ihRKXve9bUC3kpT6wR
         YFECU4Rlua1deS6YXWME9svvA+8Nc7ZFX5qys2CkmYUAVAgzKg+mTXeXJk/HfjBr/zgb
         NxqNQamwdwTO5PDOXAK7aW20Sn6rHAnrGkERF9DHbdg/WETQTu8p+MQUP7D/yKXRUDpV
         Ytbx4roW58NECS43q8GyOUi5chxObS7IYcpEaP4RNP/OmU9drM6zAqfwoIZJUvEEEeeC
         EerGtug7bHNTA26aEsETskBtw5tELAkLFABFl2nCJQ9DejzqOZ4NDL4AnCKj54HiK6N6
         adZg==
X-Gm-Message-State: AOAM531K/UsFQy0lpfIrtkjusL3m1pSsLYWl6Pvu3DLUHg37xaeQCanS
        UfMp7F6ECkPxKr1UEo5ooCljZ/Oos8FhjA==
X-Google-Smtp-Source: ABdhPJz6P2/5hUu/aC3862I412RyAhgL/oqOreW8Kik+K1TPhhe5zu5N0UvL/B8/lR4FgM8zijO0uA==
X-Received: by 2002:a67:d38f:0:b0:31a:808b:7f1 with SMTP id b15-20020a67d38f000000b0031a808b07f1mr1022196vsj.56.1645709670531;
        Thu, 24 Feb 2022 05:34:30 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id j24sm383459vki.39.2022.02.24.05.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 05:34:30 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id t25so898112uaa.3;
        Thu, 24 Feb 2022 05:34:30 -0800 (PST)
X-Received: by 2002:ab0:6253:0:b0:341:8be9:7a1 with SMTP id
 p19-20020ab06253000000b003418be907a1mr1074483uao.114.1645709670171; Thu, 24
 Feb 2022 05:34:30 -0800 (PST)
MIME-Version: 1.0
References: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
 <97b69b3a-bf17-6a43-bf96-da19822051b3@microchip.com> <CAMuHMdXGQDqMagqzD8VNYm2oucE=_nas9mM2sT_RoW2GKhr4vw@mail.gmail.com>
 <ae6b0849-a3e3-33fe-b540-6dc77c868f4b@microchip.com>
In-Reply-To: <ae6b0849-a3e3-33fe-b540-6dc77c868f4b@microchip.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 24 Feb 2022 14:34:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5ghvAze-zOVAm9LSv9261PE0hh3nxyv5db18azmo2=w@mail.gmail.com>
Message-ID: <CAMuHMdV5ghvAze-zOVAm9LSv9261PE0hh3nxyv5db18azmo2=w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
To:     Conor Dooley <Conor.Dooley@microchip.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Daire.McNamara@microchip.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

Hi Conor,

On Thu, Feb 24, 2022 at 2:15 PM <Conor.Dooley@microchip.com> wrote:
> On 24/02/2022 12:58, Geert Uytterhoeven wrote:
> > On Thu, Feb 24, 2022 at 1:55 PM <Conor.Dooley@microchip.com> wrote:
> >> On 24/02/2022 12:31, Geert Uytterhoeven wrote:
> >>> make dt_binding_check:
> >>>
> >>>       Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> >>
> >> Hey Geert,
> >> I've run dt_binding_check locally but I dont get a warning, is there
> >> something I am missing?
> >
> > Interesting. Are you using the latest dtschema?
> > https://github.com/devicetree-org/dt-schema.git
>
> I was on v2021.12, but have now tried v2022.01 & master
> (2022.2.dev1+gf677c85).
>
> Is there something other than running "make dt_binding_check" in a fresh
> checkout that I need to do?

You did update your installation after the fresh[1] checkout?

$ cd dt-schema
$ pip3 install -e .

[1] What about "git pull"? ;-)


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
