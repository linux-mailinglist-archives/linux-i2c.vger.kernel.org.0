Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8800379AFE9
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Sep 2023 01:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239201AbjIKVS3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Sep 2023 17:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236380AbjIKKbT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Sep 2023 06:31:19 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625B3E69
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 03:31:14 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-273ca7ab3f5so2737505a91.2
        for <linux-i2c@vger.kernel.org>; Mon, 11 Sep 2023 03:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1694428274; x=1695033074; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W/uIdUtu+7l5UMbKFZD59eNB3mb3PdH3zACB6TXRSY8=;
        b=MEM6QiwKGi0DmPacJ752dEVd8lwz5z6RYNEtqqgE8tzQ1Xqj/JP3n8R5OHRndN9xjH
         ClacmV87N/J2x54EpebbATZfgI9kCiGimmXM/THoqptXKA93Y719WTaLxpefKC4LSqIY
         dMTHg3pQncgkpzf8Uc4WLsE1eagcrA2q4hdHIjjXQH50TbgqWv2rGSnfwBcx9dIcqQRZ
         PQuFPKMt0Po7Cc2bEBmCW0AroIpLMhK2BmbIdLrlbtu60Yjpb3FQX6cK34E8ZUYHEpCo
         bMX4BC0wBaKOWP0i9f+8DGBN1eWTd9I7OsL3X/NdRfrzSWSSnYtQT9fsND+k20nerAG4
         d00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428274; x=1695033074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/uIdUtu+7l5UMbKFZD59eNB3mb3PdH3zACB6TXRSY8=;
        b=Ka40bTuiXjbaZmIwZgC+UdTwKZWCiAO7Dgbifyh1jtWPD94vwA3e1xLW4w3P/fPAOQ
         v+w+VjQVq9FJiYEjRktrJJJ6AaCu3pHG3eeMrWCEfpmq/Q3jLAT8ZVEhF9RNhotQaYdw
         WRZk9305qLDdVuV5whTqte0yQiOWnFyYYi/z9ZZLfwUqq+Gjw7GE3TBHu3FP/gAUk2jz
         54Mh4/Uw32V0ddSZvBaMbM7n3n3f8Yh8+ApMQCyri/JWAYVZbT+MWpgejnHtk6oPPWoo
         InHfZBFh13Mr8DyTFB5csU953twAMTe41u5zAgm2wVufM9ksohPdpuP5OO+ofwAq1ifj
         NKwA==
X-Gm-Message-State: AOJu0YxpznSjtYcyn68JTFqSMHplYrg31RxT9ayjvMzksxw9la/kQXmX
        mQScuksPEDAKGHUs5/SVolCxeJHNdYLCLUiyMHVs/g==
X-Google-Smtp-Source: AGHT+IHZqqMaKWb42G94RFUbOIJRNKvkvFRzVoexrnn+glFoO9u6eRJUbV26Xq1UJ3sAdlXN4LMxSzxm4IvxlQzoXco=
X-Received: by 2002:a17:90b:1488:b0:268:ac99:4bb4 with SMTP id
 js8-20020a17090b148800b00268ac994bb4mr7192497pjb.46.1694428273778; Mon, 11
 Sep 2023 03:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230831101513.2042773-1-Naresh.Solanki@9elements.com> <0b7cb454-4c31-569c-7609-7931e6fb798a@linaro.org>
In-Reply-To: <0b7cb454-4c31-569c-7609-7931e6fb798a@linaro.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
Date:   Mon, 11 Sep 2023 16:01:03 +0530
Message-ID: <CABqG17g8QOgU7cObe=4EMLbEC1PeZWxdPXt7zzFs35JGqpRbfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add custom properties for MAX7357/MAX7358
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Thu, 31 Aug 2023 at 17:33, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/08/2023 12:15, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Both chips have a configuration register to enable additional
> > features. These features aren't enabled by default & it's up to
> > board designer to enable the same.
> >
> > Add booleans for:
> >  - maxim,isolate-stuck-channel
> >  - maxim,send-flush-out-sequence
> >  - maxim,preconnection-wiggle-test-enable
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>
> Subject: still did not improve. You waited exactly 30 minutes for my
> feedback after sending your response.
Will update the subject prefix to: 'dt-bindings: i2c: pca954x:'
Also I'm adding three properties here so I guess 'Add custom
properties..' should be fine.
If you have a better suggestion then please let me know.

>
>
>
> > ---
> > Changes in V2:
> > - Update properties.
> > ---
> >  .../bindings/i2c/i2c-mux-pca954x.yaml         | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > index 2d7bb998b0e9..fa73eadfdf7b 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > @@ -71,6 +71,23 @@ properties:
> >      description: A voltage regulator supplying power to the chip. On PCA9846
> >        the regulator supplies power to VDD2 (core logic) and optionally to VDD1.
> >
> > +  maxim,isolate-stuck-channel:
> > +    type: boolean
> > +    description: Allows to use non faulty channels while a stuck channel is
> > +      isolated from the upstream bus. If not set all channels are isolated from
> > +      the upstream bus until the fault is cleared.
>
> Nothing improved here. As I said, please provide arguments or drop this
> property.
These features cannot be enabled by default because doing so may lead
to unexpected behavior, such as bus disconnections(although that
wasn't expected).
These features should only be enabled after they have been validated
by the board designer.
Therefore, they cannot be enabled by default.

Regards,
Naresh
>
> > +
> > +  maxim,send-flush-out-sequence:
> > +    type: boolean
> > +    description: Send a flush-out sequence to stuck auxiliary buses
> > +      automatically after a stuck channel is being detected.
>
> Ditto
>
> > +
> > +  maxim,preconnection-wiggle-test-enable:
> > +    type: boolean
> > +    description: Send a STOP condition to the auxiliary buses when the switch
> > +      register activates a channel to detect a stuck high fault. On fault the
> > +      channel is isolated from the upstream bus.
>
> Ditto
>
>
> Best regards,
> Krzysztof
>
