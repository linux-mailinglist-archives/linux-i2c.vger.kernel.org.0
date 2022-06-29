Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 688F85601B5
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Jun 2022 15:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiF2Nuf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Jun 2022 09:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiF2Nue (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Jun 2022 09:50:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AC6DFE0;
        Wed, 29 Jun 2022 06:50:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7CDB261E88;
        Wed, 29 Jun 2022 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB75C341C8;
        Wed, 29 Jun 2022 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656510632;
        bh=VMfYKMWvhAYlNBRE5+J2Dkfi0eUU5Q30vFi/V4AWzHU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GETHWCkoSunTjq5u/0ujktPGg6qtbdHdVHdWoYf1iSUuprFkUAPWvwpaMVasEEMgH
         ck4EhHotuESssRD0XtA51/KmRvIz0Px+QWuMvmoyKKYZ7hphq4EOup14rzDny0ltYu
         qfrWbQWPN67T9bwHwCuJBB6twuWGKP1l9vg4itG6tBtpw6jkIHx+P6DiidGOfUdoYs
         ZTyTEkTORxkaxp/voyd8v8VBgVa8bFQVCz9Vk7Qnd4T/zdUniGqYmL56VwEJ8ccG4C
         fwwFdGiUcdcHjhdjM53dP+qF+OhNT1zPeDjL8HTEZLX4UoMnHLP1aY/cT7OKYT7KNV
         e5EgHi251y34g==
Received: by mail-ua1-f47.google.com with SMTP id s4so2632872uad.0;
        Wed, 29 Jun 2022 06:50:32 -0700 (PDT)
X-Gm-Message-State: AJIora9+FZiZJjDZeswQMYWNyHlRN/KUpbm1x36djzlRZAJKtbTwegXO
        Va12xI6cOCW3eNNCEdUS5XPWOBcHMp7jLDVnmQ==
X-Google-Smtp-Source: AGRyM1vKGXqFayysL8pEeROfaIV0o7ghK/bslJjjPn8tNlKPkGvn1x3tqB9tWvX/xYVyIkhnRX8ry8eIzxcL8s3QRD4=
X-Received: by 2002:a05:6130:3aa:b0:37f:26c0:e196 with SMTP id
 az42-20020a05613003aa00b0037f26c0e196mr1628527uab.43.1656510631830; Wed, 29
 Jun 2022 06:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-2-phil.edworthy@renesas.com> <1656468579.925440.1403681.nullmailer@robh.at.kernel.org>
 <CAMuHMdVsdh1YpVtq7570_kNOWUm5sMb=Fm=Dv_8qOS=hg3iuKA@mail.gmail.com> <43a19f7f-016a-0820-adf1-41419fe82d28@linaro.org>
In-Reply-To: <43a19f7f-016a-0820-adf1-41419fe82d28@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 29 Jun 2022 07:50:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJfrqPbu3RZ0wuY9GiiJ6tNmOSqdmdjRHXOYqoL=xUE9w@mail.gmail.com>
Message-ID: <CAL_JsqJfrqPbu3RZ0wuY9GiiJ6tNmOSqdmdjRHXOYqoL=xUE9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Document RZ/V2M I2C controller
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 29, 2022 at 2:15 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/06/2022 08:53, Geert Uytterhoeven wrote:
> > Hi Rob,
> >
> > On Wed, Jun 29, 2022 at 4:09 AM Rob Herring <robh@kernel.org> wrote:
> >> On Tue, 28 Jun 2022 20:45:25 +0100, Phil Edworthy wrote:
> >>> Document Renesas RZ/V2M (r9a09g011) I2C controller bindings.
> >>>
> >>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> >>> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>> ---
> >>> v2:
> >>>  - Use an enum and set the default for clock-frequency
> >>>  - Add resets property
> >>> ---
> >>>  .../bindings/i2c/renesas,rzv2m.yaml           | 80 +++++++++++++++++++
> >>>  1 file changed, 80 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/i2c/renesas,rzv2m.yaml
> >>>
> >>
> >> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> >> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >>
> >> yamllint warnings/errors:
> >>
> >> dtschema/dtc warnings/errors:
> >> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml: patternProperties:^thermistor@:properties:adi,excitation-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
> >>         hint: Standard unit suffix properties don't need a type $ref
> >>         from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> >> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.yaml: ignoring, error in schema: patternProperties: ^thermistor@: properties: adi,excitation-current-nanoamp
> >> Documentation/devicetree/bindings/iio/temperature/adi,ltc2983.example.dtb:0:0: /example-0/spi/ltc2983@0: failed to match any schema with compatible: ['adi,ltc2983']
> >
> > All of these look like false-positives, i.e. not related to this patch?
>
> Few other patches also got it, I think the bot got some problem.

Yes, and the bot's overlord failed to see that too. A change yesterday
in dtschema main branch introduced a new warning and that requires
clearing the CI cache which I didn't do til now.

Rob
