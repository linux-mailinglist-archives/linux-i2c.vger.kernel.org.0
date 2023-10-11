Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1E67C56FB
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Oct 2023 16:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbjJKOgm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Oct 2023 10:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbjJKOgl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Oct 2023 10:36:41 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B030A4
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 07:36:40 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-452863742f3so2989095137.1
        for <linux-i2c@vger.kernel.org>; Wed, 11 Oct 2023 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697034999; x=1697639799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thJJX24Z+7+pXZI77rMkBrnT41qe/GrZxJsP3+491CI=;
        b=0BMRqMbO37aHl0XhyBtoWMVHLUJvDjSmGekJqrcpFoFaV1Scfc6UAvHb+aZI+XlqiX
         V2ciSH1IC/MhhfiHRsIuf3rp8DOh+IeBx1lXsPUjCbHTZ0ftO3gEha68XtqDMWWZUlE0
         p0DIz3K/g2fkiKnZkUtDeoIDBJmk27jw+a5i/bTZ5XDXSKWA/xPSRCpUI2P/a5Oo1UtR
         XwzVfKBZuLOugJV7CP4uopC8EA5ry3BbqlCh8K4wSR/hIkIS1lfK2RvKvFb9bubfdubI
         zZc8WeaFklogD7n8XJ9f+HXgfbm9nWhPal8Ttgr1AnPhCiILYfv60xfUzvcrMkLikeBw
         z/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697034999; x=1697639799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thJJX24Z+7+pXZI77rMkBrnT41qe/GrZxJsP3+491CI=;
        b=L8kJBbUTEkAHR9948GlSFH69woCtbsu0wcMwCUUIqB492wPGuslhE9xqn5t13b59ok
         +hnmsPCPpJxXTNiblsWElWrV7TXCZQ3VLrk7NxjxXFwR1ShWnUi4wdxg2GqaP+SrRGqw
         IqdlBoGGpaKuH1Yj5QJdoP5V+ir+FR9ysL5aQAOn9dB68EUuuhsY8IWfxI3iWzwsg5/u
         +PcWUrvhKniS5vMG11JumiT0CMMJELlI24854zt9X4Es3XRiLdlEXHlTrf9v5mMPiGKt
         ch+d1vG3d87a8PURQDVU34FLUpKzOrMVfwB5g6U92UzAorYIG2zOERG9l2uAgVibEXse
         h3PA==
X-Gm-Message-State: AOJu0YyhWaWKbhAz02gFuqUNp1evnRxo59XySxRKuIUsH7KxPywp/RI3
        qGZGMf+SJwEayGFORHERVRHANMPaHYD3sd056dkCGw==
X-Google-Smtp-Source: AGHT+IEeJUN5uUFEuUvugdPwFpy9Oq/FMLsK6nZtNMu7phc6LbLVti5gD2C0vhPq6rBs9XZoVWq46Ecy/QAN/Uua4YY=
X-Received: by 2002:a67:f918:0:b0:452:8e07:db61 with SMTP id
 t24-20020a67f918000000b004528e07db61mr19414708vsq.6.1697034999085; Wed, 11
 Oct 2023 07:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231010190926.57674-1-marex@denx.de> <20231011-buffer-safely-2d121d4ae8b8@spud>
In-Reply-To: <20231011-buffer-safely-2d121d4ae8b8@spud>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 11 Oct 2023 16:36:28 +0200
Message-ID: <CAMRc=MeQzii7btZSwA0QvGnNGXbhWgbtJ6CLhje1dd1Ndn2M=w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24C32-D Additional Write
 lockable page
To:     Conor Dooley <conor@kernel.org>
Cc:     Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Oct 11, 2023 at 4:32=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Oct 10, 2023 at 09:09:25PM +0200, Marek Vasut wrote:
> > The ST M24C32-D behaves as a regular M24C32, except for the -D variant
> > which uses up another I2C address for Additional Write lockable page.
> > This page is 32 Bytes long and can contain additional data. Document
> > compatible string for it, so users can describe that page in DT. Note
> > that users still have to describe the main M24C32 area separately as
> > that is on separate I2C address from this page.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Oh and Bartosz, this binding seems to have a baylibre email address for
> you in it. I'm sure it's mailmap'ed to the right place, but just FYI.
>

It isn't actually. :(

Thanks for the heads-up, I'll send a patch for .mailmap.

Bartosz

> Thanks,
> Conor.
>
> > ---
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-i2c@vger.kernel.org
> > ---
> >  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Docum=
entation/devicetree/bindings/eeprom/at24.yaml
> > index 98139489d4b5c..7be127e9b2507 100644
> > --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> > +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> > @@ -67,6 +67,8 @@ properties:
> >                    pattern: cs16$
> >                - items:
> >                    pattern: c32$
> > +              - items:
> > +                  pattern: c32d-wl$
> >                - items:
> >                    pattern: cs32$
> >                - items:
> > --
> > 2.40.1
> >
