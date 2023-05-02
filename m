Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFCF6F3DDC
	for <lists+linux-i2c@lfdr.de>; Tue,  2 May 2023 08:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233710AbjEBGxx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 May 2023 02:53:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbjEBGxV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 May 2023 02:53:21 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2AFD4C37
        for <linux-i2c@vger.kernel.org>; Mon,  1 May 2023 23:53:01 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so23300685276.0
        for <linux-i2c@vger.kernel.org>; Mon, 01 May 2023 23:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1683010381; x=1685602381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcUXDXaT3ty1Xt8nlRve7aJUPr1+gS6+OMxz4c8SSi8=;
        b=FBeH5yhzOigNo0qNk7msZqNEI0D4ajPcA+q1pNmp8oLq+RXNB270++fJuHY9JguMpi
         EXKwUz+8/TIwzpBamFbT7ty2TQ+2JRGAK7Oo8h4y6eUI1wrzyzBKgkqo5l17MTaZz/E1
         vvSdFncNC99UkJ3F/rxarMU0zqABAG7FsO5vlHodAdYjsXq0S06Z9qTyrd0GtZK8gjeq
         E/aOLhH9m2fVqTxmov5aoS1hg5197zhHLjmAAvFk2CCY+Zbu/ECw5ikLM8fNVWmRpGk9
         N8HZFSXNbAHfS2t0fZpmKAhHuNigc4FerJiqqFkv7guUMVKloazzUo1YpXKPi8FFwwRA
         weOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683010381; x=1685602381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcUXDXaT3ty1Xt8nlRve7aJUPr1+gS6+OMxz4c8SSi8=;
        b=Q53MWeKaevvTw2BuYhNDMoN5AAlz3dk3IVc5o3Ynttx5KJxo+hymyWqqwsGxFoFyBh
         giww5oz+icFi1yRupghNc6AyNyrbKKeu8hGb1qfCnHgRdupvMHRjhPYakibZi4m6Sa0y
         93FM+0ZcYy0yHr6bOUKStEjM6PNW3VTzHED+I0SgXtNTLfYiiB4SNz/w0PuH0sWcZhwS
         +GIQ1lWWaEM7EgoYuCLWzz//nNnAG17Wp1pXCnnhFlZskOygXD+0EA5uchU3fCiH+UAk
         HWty2UuyUHN9Q2krTOCyJ9m4oT7md/8X4WUdRgGYVWK4Er3+70+5d/XkxVbRuWycjdFf
         QBCg==
X-Gm-Message-State: AC+VfDygI5UHay7CWCodsc5JH8I/xld8LDQbg+3959hoVTdxaDVsfsln
        BZiiV8dGORjI8xMLqrLHn/8V6UXSTNCyTpVxMESi4g==
X-Google-Smtp-Source: ACHHUZ7zG5ub4HnT4rMwgFf02SO3pOSYBKGhJ/AKw0Nc/jPYYyTotJFeknFJKuCcOs7u+0vMkwfvzv0/QE8qCuunqCE=
X-Received: by 2002:a81:6c88:0:b0:55a:8293:e387 with SMTP id
 h130-20020a816c88000000b0055a8293e387mr3222351ywc.19.1683010379722; Mon, 01
 May 2023 23:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230501091552.847240-1-patrick.rudolph@9elements.com>
 <20230501091552.847240-3-patrick.rudolph@9elements.com> <fd20cad6-34f9-5f3c-abe7-cdf3a93d712c@axentia.se>
In-Reply-To: <fd20cad6-34f9-5f3c-abe7-cdf3a93d712c@axentia.se>
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
Date:   Tue, 2 May 2023 08:52:48 +0200
Message-ID: <CALNFmy1gxUD-C62SH5GxA=fq8eKYxiOHe8wqXGsVdzsyiJc6Xg@mail.gmail.com>
Subject: Re: [PATCH v14 2/4] dt-bindings: i2c: Add Maxim MAX735x/MAX736x variants
To:     Peter Rosin <peda@axentia.se>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,
it could indeed cause problems when VDD1 !=3D VDD2 and at both needs to
be enabled.
The pca9846 datasheet seems to refer to VDD1 as VDD. Thus I could add
an optional "vdd2" regulator to the binding and driver.

Please let me know if that's what you had in mind.
Regards,
Patrick

On Tue, May 2, 2023 at 8:03=E2=80=AFAM Peter Rosin <peda@axentia.se> wrote:
>
> Hi!
>
> 2023-05-01 at 11:15, Patrick Rudolph wrote:
> > Update the pca954x bindings to add support for the Maxim MAX735x/MAX736=
x
> > chips. The functionality will be provided by the existing pca954x drive=
r.
> >
> > For chips that are powered off by default add a regulator called vdd-su=
pply.
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  .../bindings/i2c/i2c-mux-pca954x.yaml         | 22 +++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml=
 b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > index e5c1070903ef..6fed6eae9c9b 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> > @@ -4,18 +4,29 @@
> >  $id: http://devicetree.org/schemas/i2c/i2c-mux-pca954x.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: NXP PCA954x I2C bus switch
> > +title: NXP PCA954x I2C and compatible bus switches
> >
> >  maintainers:
> >    - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> >  description:
> > -  The binding supports NXP PCA954x and PCA984x I2C mux/switch devices.
> > +  The NXP PCA954x and compatible devices are I2C bus
> > +  multiplexer/switches that share the same functionality
> > +  and register layout.
> > +  The devices usually have 4 or 8 child buses, which are
> > +  attached to the parent bus by using the SMBus "Send Byte"
> > +  command.
> >
> >  properties:
> >    compatible:
> >      oneOf:
> >        - enum:
> > +          - maxim,max7356
> > +          - maxim,max7357
> > +          - maxim,max7358
> > +          - maxim,max7367
> > +          - maxim,max7368
> > +          - maxim,max7369
> >            - nxp,pca9540
> >            - nxp,pca9542
> >            - nxp,pca9543
> > @@ -56,6 +67,9 @@ properties:
> >      description: if present, overrides i2c-mux-idle-disconnect
> >      $ref: /schemas/mux/mux-controller.yaml#/properties/idle-state
> >
> > +  vdd-supply:
> > +    description: A voltage regulator supplying power to the chip.
> > +
>
> The pca9846-9 chips do not have one VDD, they have separate supplies for
> "low level" (VDD1), and "core logic" (VDD2). I don't know how such a
> situation is normally reflected in bindings, but could it not cause
> headaches later if use of unqualified VDD is spreading for those chips?
> Possibly with different semantics depending on if vdd-supply is tied to
> VDD1, VDD2 or both?
>
> Cheers,
> Peter
>
> >  required:
> >    - compatible
> >    - reg
> > @@ -68,6 +82,8 @@ allOf:
> >            compatible:
> >              contains:
> >                enum:
> > +                - maxim,max7367
> > +                - maxim,max7369
> >                  - nxp,pca9542
> >                  - nxp,pca9543
> >                  - nxp,pca9544
> > @@ -94,6 +110,8 @@ examples:
> >              #size-cells =3D <0>;
> >              reg =3D <0x74>;
> >
> > +            vdd-supply =3D <&p3v3>;
> > +
> >              interrupt-parent =3D <&ipic>;
> >              interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;
> >              interrupt-controller;
