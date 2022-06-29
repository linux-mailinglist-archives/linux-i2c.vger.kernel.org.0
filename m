Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19A2755F72E
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 08:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbiF2GyN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 02:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiF2GyM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 02:54:12 -0400
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5EF2A247;
        Tue, 28 Jun 2022 23:54:11 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id q4so23457060qvq.8;
        Tue, 28 Jun 2022 23:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PpuEtshrQZzm75lWu/UuoW2nHSJByVf/uoUWMyeBAMw=;
        b=7iSyfDBfVp5ma4BxAW4Lfr6rivish4kK7/Vo8uZ+umBZe3Pa6nP73UGR8XdiDNqQY/
         1BlGxCE/HNyVurynmRa6xvtmjr2U3n5PAv6cWFLnp7CBgM7Xi4qwEB/W0fRAm2SWxIAJ
         F0RiGUz7MBg3uCLwYyVCzTTICy49SH4ERxbST7BKrLnyofHTMos0uoCyXIiKRvjjHjQ5
         J7lSpnslb/Izr8iSrW69A0bXNj4nUWdjucmAPSPJNBx6GjsvSejBRIfzURB4+kHo7I01
         N/N3hIKBx/AdoVfLVI0oOJS0AbUQJzzc0dDhsqc/c6A38lL6mHRZyGYikyjfQk+1LAnn
         NPpQ==
X-Gm-Message-State: AJIora/H5bdqMqSAiioa+CVrOBt2wIR2IuYcmxj/z07aFVkH9PuhQZFm
        UXn/54KTo3jXiUZzay2MS2pmQwXMpt6e9w==
X-Google-Smtp-Source: AGRyM1s5qZzR84urO5FpKepSH/mHpp2Fyt2U0ZcuYBfPXOxqd2Oaiv+4OXKgKtV2zSoGzAC72XH/Tg==
X-Received: by 2002:ac8:7fc6:0:b0:31b:940a:fb02 with SMTP id b6-20020ac87fc6000000b0031b940afb02mr1192834qtk.663.1656485650681;
        Tue, 28 Jun 2022 23:54:10 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id bz19-20020a05622a1e9300b0031bba2e05aesm3721424qtb.58.2022.06.28.23.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 23:54:09 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id q132so26219774ybg.10;
        Tue, 28 Jun 2022 23:54:09 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr1695809ybr.380.1656485649369; Tue, 28
 Jun 2022 23:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-2-phil.edworthy@renesas.com> <1656468579.925440.1403681.nullmailer@robh.at.kernel.org>
In-Reply-To: <1656468579.925440.1403681.nullmailer@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 29 Jun 2022 08:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVsdh1YpVtq7570_kNOWUm5sMb=Fm=Dv_8qOS=hg3iuKA@mail.gmail.com>
Message-ID: <CAMuHMdVsdh1YpVtq7570_kNOWUm5sMb=Fm=Dv_8qOS=hg3iuKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
To:     Rob Herring <robh@kernel.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Rob,

On Wed, Jun 29, 2022 at 4:09 AM Rob Herring <robh@kernel.org> wrote:
> On Tue, 28 Jun 2022 20:45:25 +0100, Phil Edworthy wrote:
> > Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2:
> >  - Use an enum and set the default for clock-frequency
> >  - Add resets property
> > ---
> >  .../bindings/i2c/renesas,rzv2m.yaml           | 80 +++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml: patternProperties:^thermistor@:properties:adi,excitation-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
>         hint: Standard unit suffix properties don't need a type $ref
>         from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml: ignoring, error in schema: patternProperties: ^thermistor@: properties: adi,excitation-current-nanoamp
> Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.example.dtb:0:0: /example-0/spi/ltc2983@0: failed to match any schema with compatible: ['adi,ltc2983']

All of these look like false-positives, i.e. not related to this patch?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
