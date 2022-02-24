Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E49A14C2D77
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Feb 2022 14:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbiBXNoS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Feb 2022 08:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234186AbiBXNoS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Feb 2022 08:44:18 -0500
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AA7526F4E5;
        Thu, 24 Feb 2022 05:43:48 -0800 (PST)
Received: by mail-oi1-f175.google.com with SMTP id l25so2459484oic.13;
        Thu, 24 Feb 2022 05:43:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oFxox6Rtx3Fe6uNuzzj0Rk7m4YUgm6HJR0qPe+JqODI=;
        b=rk6FGbXP2eMw3qqlY02r5eVoeDXibnMPsgHnHbdyGZFW8K/nh3EKC7lLkP1lAmiAfy
         Z1b0NIrfV5CC/7yUGDVCgu4K+N73eW5qdIGTS3DLQNK6+TxNXEXMq3VaW9OMwmM0aB7Y
         6XZnMwabuOWdh02QX0Psp/3ISnfb7yFRTodbMuBk7MNlo1tliUQMHOSva1crC+UybQ91
         kDWaHE/H+gEFA0l3ovETgUIGgztcYsAoA2nuriTFqPrFDYVyafQyGuJEksykWmD+Hd4M
         OocSsrtMoS7xYv5in0zbEhR1cA9oxyvmDSNfTCQM3DSSaTFJTzr/IxBXEQxK53U3I1BK
         FVzg==
X-Gm-Message-State: AOAM531tO9BZpy4mLgjcV0W48rFsC3g/q1Y6QnDOf+sDRHrHUf/ykSrl
        sM+okzYMt10uAhDpjcc8Qg==
X-Google-Smtp-Source: ABdhPJz1QWLgsv7VejcwUyb9puTqDbXaF4wtVejxP+C4vYRH92gEBQrg+gcDbXCzplcwJCyn6il+cA==
X-Received: by 2002:a05:6808:19a5:b0:2d4:edeb:9beb with SMTP id bj37-20020a05680819a500b002d4edeb9bebmr7271243oib.279.1645710227600;
        Thu, 24 Feb 2022 05:43:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id du3sm259712oab.6.2022.02.24.05.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 05:43:46 -0800 (PST)
Received: (nullmailer pid 2901179 invoked by uid 1000);
        Thu, 24 Feb 2022 13:43:46 -0000
Date:   Thu, 24 Feb 2022 07:43:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Conor Dooley <Conor.Dooley@microchip.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Daire.McNamara@microchip.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: microchip,corei2c: Fix indentation of
 compatible items
Message-ID: <YheLklKvZqR1qY90@robh.at.kernel.org>
References: <365d32c63c2fe080866be60c32dddd0f3634d19d.1645705789.git.geert@linux-m68k.org>
 <97b69b3a-bf17-6a43-bf96-da19822051b3@microchip.com>
 <CAMuHMdXGQDqMagqzD8VNYm2oucE=_nas9mM2sT_RoW2GKhr4vw@mail.gmail.com>
 <ae6b0849-a3e3-33fe-b540-6dc77c868f4b@microchip.com>
 <CAMuHMdV5ghvAze-zOVAm9LSv9261PE0hh3nxyv5db18azmo2=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV5ghvAze-zOVAm9LSv9261PE0hh3nxyv5db18azmo2=w@mail.gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 24, 2022 at 02:34:18PM +0100, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Thu, Feb 24, 2022 at 2:15 PM <Conor.Dooley@microchip.com> wrote:
> > On 24/02/2022 12:58, Geert Uytterhoeven wrote:
> > > On Thu, Feb 24, 2022 at 1:55 PM <Conor.Dooley@microchip.com> wrote:
> > >> On 24/02/2022 12:31, Geert Uytterhoeven wrote:
> > >>> make dt_binding_check:
> > >>>
> > >>>       Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> > >>
> > >> Hey Geert,
> > >> I've run dt_binding_check locally but I dont get a warning, is there
> > >> something I am missing?
> > >
> > > Interesting. Are you using the latest dtschema?
> > > https://github.com/devicetree-org/dt-schema.git
> >
> > I was on v2021.12, but have now tried v2022.01 & master
> > (2022.2.dev1+gf677c85).
> >
> > Is there something other than running "make dt_binding_check" in a fresh
> > checkout that I need to do?
> 
> You did update your installation after the fresh[1] checkout?
> 
> $ cd dt-schema
> $ pip3 install -e .
> 
> [1] What about "git pull"? ;-)

yamllint is not installed. It's optional from the kbuild perspective.

Rob
