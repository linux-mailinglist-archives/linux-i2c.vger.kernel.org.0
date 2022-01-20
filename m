Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B24494D29
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiATLkj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbiATLkh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 06:40:37 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FFDC061574;
        Thu, 20 Jan 2022 03:40:37 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id l7-20020a4a2707000000b002dde197c749so2070439oof.10;
        Thu, 20 Jan 2022 03:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IURShh+tAODqAiJh+KDJ+01PfxKxuj1xZUOMackfOOk=;
        b=Vz1pvQALrPt8wZAYERJlR7js9v4/O4ym8VLsubf10xKBms/HSrNyJXsvLUKVPNz2er
         z9y+6nPpnS1qbFwvKwvJorb0aIcWu63ZFCha1bhWzJH7j1MFpfTrIFzyaQa00g+b1UFg
         wCO+8ajcrVTlY4dtkpmSgqGqvfxa4zoI31BvQggtxFB/0MXIwL9qG/XyDMZXxGeTkHiK
         vDn1LtEM2iBH8xCc+4qhPyIX5aK0onRaVfO6k6V2ZgTS6FQ7r+O88jb7LSRI7mYQh0sP
         kkC0b533v7hmJ/EjyCQ8E4jxwvWW9+JZqK4CRU2XFJCepYw+mCDbLaLCO0yyFAUVRbME
         bg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IURShh+tAODqAiJh+KDJ+01PfxKxuj1xZUOMackfOOk=;
        b=CBwg8evbXewTKOVoBhJZHj4P0TqGmS9TjGZIAHe4Ki1FvCnRR1jPaDN6izzBj+rthG
         7/iB1pLaT7T+7i08Mkq6csNs6XAETHypE3o9zbEDNGSHYEhxJM7+ugLfAsbTW2Vdntuk
         sEtckbCHAB3x/8fOZMp6CXKbYA9UAvxgEZ5xEuLTm/P5qcJf2s3+UrtgbWbR0Do4zJms
         5ssKA6k2UKpeY5olaH4n0AgS1YUb7B+9AaPiErn/iPNvgn6YlU685vCm45Kj5eqq5fnY
         EsCS3aXSSCTKs80IzIMKMDNPBBg6FQUO5N0++lLVVWciqJJ+PnyU0C6rryXq0ah5lVr7
         VQbg==
X-Gm-Message-State: AOAM530VHa5L2eJsIWZTUZLAG37JmD/D5TDlARfUHxjFJcrC+6IgYpDx
        K/HPSmaYGUG8GK0eLrMtubIivo5BJWUPg4UqHe4=
X-Google-Smtp-Source: ABdhPJzVUuPUA0+dLs3T4/ac9raYhHS1yiR6xjixMRgj1sa6nF5nfrTil5Enm8pp/zVblcBTM7eQu4CMn+laojzaQUo=
X-Received: by 2002:a05:6808:1b25:: with SMTP id bx37mr7082972oib.129.1642678836132;
 Thu, 20 Jan 2022 03:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com> <a370a74a-2548-fc20-20b0-89e48645086f@baylibre.com>
In-Reply-To: <a370a74a-2548-fc20-20b0-89e48645086f@baylibre.com>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Thu, 20 Jan 2022 12:40:24 +0100
Message-ID: <CAFqH_52NGQYjtEPvsK+pPM12-U6j9vhVCZCFwh6xAABdd+7hqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: drop Enric Balletbo i
 Serra from maintainers
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Simon Glass <sjg@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-i2c@vger.kernel.org, linux-iio <linux-iio@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Missatge de Neil Armstrong <narmstrong@baylibre.com> del dia dj., 20
de gen. 2022 a les 11:52:
>
> On 20/01/2022 11:40, Krzysztof Kozlowski wrote:
> > Enric Balletbo i Serra emails bounce:
> >
> >   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
> >
> > so drop him from the maintainers, similarly to commit 3119c28634dd
> > ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").  Add generic DRM
> > bridge maintainers to Analogix ANX7814.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > ---
> >  .../devicetree/bindings/display/bridge/analogix,anx7814.yaml  | 4 +++-
> >  .../bindings/display/bridge/google,cros-ec-anx7688.yaml       | 1 -
> >  Documentation/devicetree/bindings/display/bridge/ps8640.yaml  | 1 -
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> > index 8e13f27b28ed..bce96b5b0db0 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> > @@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
> >
> >  maintainers:
> > -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > +  - Andrzej Hajda <andrzej.hajda@intel.com>
> > +  - Neil Armstrong <narmstrong@baylibre.com>
> > +  - Robert Foss <robert.foss@linaro.org>
> >
> >  properties:
> >    compatible:
> > diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > index 9f7cc6b757cb..a88a5d8c7ba5 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > @@ -8,7 +8,6 @@ title: ChromeOS EC ANX7688 HDMI to DP Converter through Type-C Port
> >
> >  maintainers:
> >    - Nicolas Boichat <drinkcat@chromium.org>
> > -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >
> >  description: |
> >    ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> > index cdaf7a7a8f88..186e17be51fb 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> > @@ -8,7 +8,6 @@ title: MIPI DSI to eDP Video Format Converter Device Tree Bindings
> >
> >  maintainers:
> >    - Nicolas Boichat <drinkcat@chromium.org>
> > -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >
> >  description: |
> >    The PS8640 is a low power MIPI-to-eDP video format converter supporting
> >
>
> Let's wait for Enric's response, but in any case (removal or new address):
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>

I'm fine with the removal as I don't have access anymore to this
hardware so it doesn't really make sense to be there. Sorry for not
sending the patches myself before.

Acked-by: Enric Balletbo i Serra <eballetbo@kernel.org>

Best regards,
  Enric

> Neil
