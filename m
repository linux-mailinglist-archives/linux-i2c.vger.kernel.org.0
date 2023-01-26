Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAEA67CC5E
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jan 2023 14:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236987AbjAZNjG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 26 Jan 2023 08:39:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236377AbjAZNjF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 26 Jan 2023 08:39:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A330E45BD5;
        Thu, 26 Jan 2023 05:39:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F5A3B81DC0;
        Thu, 26 Jan 2023 13:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED866C4339E;
        Thu, 26 Jan 2023 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674740340;
        bh=3gnbHufn8tvtYBXfJcxSBpfzUNOp7H3EkIw2GJIYjgw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YIsCB1IhovlAeELk1XKJOXRwEpG2jdkrlDHnY9J7xy4dvse5eclsKqughFTGv+pkc
         /mjB7uZ6iUjpiWu7ueVdhwMNZPqtp9YrB4EuP1KLvh/+y0FMs5gJt2yArde37cC4Th
         pZaJ2A272C3lX85N9wrtbkmtle/5nVuT5axBRBg+ndBAMmuYmVajxysFZn6hOYbn+F
         +DlJa5zl3VOYDiugu044AMsYqXEPwTc2wg1D+nu5veFzaaW1kZuEDG7lgS0ptDrger
         ZP8CQFrJwJZHx91A2auvJvF1oIiL7hxywIQgF0c7i7dSSAXpTai+UnJVx28VoY5jAo
         9q8ZUrr4ighGg==
Received: by mail-ua1-f50.google.com with SMTP id j1so344822uan.1;
        Thu, 26 Jan 2023 05:38:59 -0800 (PST)
X-Gm-Message-State: AFqh2kqzZjIBhTDL0dSYEAA/JHe9pZG42800zrj13BAp8ykyUZxghQ6U
        0XnW7R+Ms10y8CarsXomPW9kxBpkBEPlg+WPOw==
X-Google-Smtp-Source: AMrXdXsiGeT85ZR+/u+85VzDpJDX04wnLvJNs+7Dcb8hausx6i/2duWGFT0kGPcnJXbR4OO7GypUU3GwITb3P7nsCC4=
X-Received: by 2002:ab0:5a32:0:b0:61b:d0f0:406b with SMTP id
 l47-20020ab05a32000000b0061bd0f0406bmr3059624uad.9.1674740338890; Thu, 26 Jan
 2023 05:38:58 -0800 (PST)
MIME-Version: 1.0
References: <20230125184438.28483-1-nick.hawkins@hpe.com> <20230125184438.28483-3-nick.hawkins@hpe.com>
 <20230125211811.GA2902717-robh@kernel.org> <399C2A3B-703A-4D67-818A-27AFA2F1B742@hpe.com>
In-Reply-To: <399C2A3B-703A-4D67-818A-27AFA2F1B742@hpe.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 26 Jan 2023 07:38:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJgoWBmx8-Gcabo_d8R7wqS1pPAu1wauAqq8JRrWMFq3A@mail.gmail.com>
Message-ID: <CAL_JsqJgoWBmx8-Gcabo_d8R7wqS1pPAu1wauAqq8JRrWMFq3A@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: i2c: Add hpe,gxp-i2c
To:     "Hawkins, Nick" <nick.hawkins@hpe.com>
Cc:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "joel@jms.id.au" <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 25, 2023 at 3:32 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:
>
> > > + hpe,sysreg:
> > > + $ref: /schemas/types.yaml#/definitions/phandle
> > > + description:
> > > + Phandle to the global status and enable interrupt registers shared
> > > + between each I2C engine controller instance. It enables the I2C
> > > + engine controller to act as both a master or slave by being able to
> > > + arm and respond to interrupts from its engine. Each bit in the
> > > + registers represent the respective bit position.
>
>
> > Each bit represents the bit position?
>
> Yes what I mean here is that bit 0 represents engine 0, bit 1 represents
> engine 1 and so on. I will reword this how you have below.
>
> > AIUI, each I2C instance has a bit in it needs to control. How does the
> > driver know what instance (and therefore the correct bit)? Typically you
> > would have a 2nd cell here with that information.
>
> We are currently using the memory area designated reg to determine
> which engine we are on.
>
> Here is a snippet from patch 1 of this patchset that introduces the driver:
> /* Use physical memory address to determine which I2C engine this is. */
> +       drvdata->engine = ((u32)drvdata->base & 0xf00) >> 8;
>
> This works because each engine is 0x100 apart.

Ah, that works fine then.

Reviewed-by: Rob Herring <robh@kernel.org>
