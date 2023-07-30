Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270CD76871F
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Jul 2023 20:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjG3SVg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Jul 2023 14:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjG3SVf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Jul 2023 14:21:35 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D615BB;
        Sun, 30 Jul 2023 11:21:33 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-522c7b81ef8so536446a12.2;
        Sun, 30 Jul 2023 11:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690741291; x=1691346091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUGo+n+RgR5Sa/qBNUoOesuoOXhRiF1v9D1Aw6QoVVY=;
        b=qE0LzVzgI9U+HMZI4WrP5+cSWOogEIarjkvnSP8RxGYUsgolbTvj+n6RjaU3lMOLyJ
         +k94uNLxH6PFIcO3FKIua4a5snkIqcTce4S9FO261QREGJltf5cAdAPXEnkDR5b1kDYb
         aiPOwe0DybmmbGUSf1UzQR8oCQmN359XsMQPD9FRMiO46y/ze1BoLVUf8EUKRvlVEDub
         EsnHtowyTcjyDISL160bRBRoo9VQr69BVRbB9iWlIjrTcCEA+8NvQdi1YgQgDKBvHmE4
         9Uaw6XGnIJMz70ANHDhwfSY7V117hVe3+f/a4o/6Drp0K/YhMymGf/xTkzsLUPviJvpi
         Awrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690741291; x=1691346091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUGo+n+RgR5Sa/qBNUoOesuoOXhRiF1v9D1Aw6QoVVY=;
        b=UuDvKiIReBNFryk1+0hkN73y5fb9KGDvThHBYNM2BZY7gscOdosxvq1OLRn7mBMt/g
         zO2JQWlCnPK/np6T0mjhTUAXOK9cChIuOOI5GgCvzgOO9U7TAUcZz5XlVemH7CQR7MYT
         SbaJX1zJ2l1i5BoUt4NDZdQblednl7gufVuBy2jciiKicILV1mZMSdKBzfj7eeJMgoeZ
         7bz05axt0o5ErX6PJijVIUqPyay1v0F4N/d/xzJZFTSobq6Gtv5Y62lzR/ChiQo9Kgpx
         IQ7LB3KvQo91uKI9f3vQqLiMC2oYrffkWeDL62CbVBXm1HWTKzmnEdSNTCprKQkd92ZL
         49dA==
X-Gm-Message-State: ABy/qLYfWGireFtmVXPswWTOxaJxt0E8kZHUw6AACaV6Hha/czZRxZY4
        tdzGAMv4UjMtcRdpOCL7Nd1VjNkPNCp/+KNY/sA=
X-Google-Smtp-Source: APBJJlE3kBCBErT82ZozGqPli/BMonXd4eDmSbOdJC5z+PoCpj7y7mZfECZqpdRHX0rOG9CgjpCRyGyiZcEnPeki05k=
X-Received: by 2002:a17:906:21b:b0:99b:55e3:bbd with SMTP id
 27-20020a170906021b00b0099b55e30bbdmr5379713ejd.34.1690741290921; Sun, 30 Jul
 2023 11:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230729160857.6332-1-clamor95@gmail.com> <20230730174934.vobmyhubi7jsqzjv@intel.intel>
In-Reply-To: <20230730174934.vobmyhubi7jsqzjv@intel.intel>
From:   Svyatoslav Ryhel <clamor95@gmail.com>
Date:   Sun, 30 Jul 2023 21:21:19 +0300
Message-ID: <CAPVz0n1WUm6tg4Uhp8US_-1A5gBoJXAenqBz-EhVBNTmyC2=dg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] GPIO-based hotplug i2c bus
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

=D0=BD=D0=B4, 30 =D0=BB=D0=B8=D0=BF. 2023=E2=80=AF=D1=80. =D0=BE 20:49 Andi=
 Shyti <andi.shyti@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Sat, Jul 29, 2023 at 07:08:55PM +0300, Svyatoslav Ryhel wrote:
> > ASUS Transformers require this driver for proper work with their dock.
> > Dock is controlled by EC and its presence is detected by a GPIO.
> >
> > The Transformers have a connector that's used for USB, charging or
> > for attaching a keyboard (called a dock; it also has a battery and
> > a touchpad). This connector probably (I don't have the means to verify
> > that) has an I2C bus lines and a "detect" line (pulled low on the dock
> > side) among the pins. I guess there is either no additional chip or
> > a transparent bridge/buffer chip, but nothing that could be controlled
> > by software. For DT this setup could be modelled like an I2C gate or
> > a 2-port mux with enable joining two I2C buses (one "closer" to the
> > CPU as a parent).
> >
> > In this case it's hard to tell the difference if this is real or virtua=
l
> > hardware.
>
> How did you test this device?
>
Using devices, which relay on this patch, here is a list of those:
- ASUS Eee Pad Transformer TF101 (mainlined)
- ASUS Transformer Prime TF201 (mainlined)
- ASUS Transformer Pad TF300T/TF300TG/TF300TL (mainlined)
- ASUS Transformer Infinity TF700T (mainlined)
- ASUS VivoTab RT TF600T (WIP)
- ASUS Transformer Pad TF701T (mainlined)

Non ASUS device is Microsoft Surface RT

Tested by many owners and users for more than a year iirc.

> > This patchset is a predecessor of a possible larger patchset which
> > should bring support for a asus-ec, an i2c mfd device programmed by
> > Asus for their Transformers tablet line. Similar approach is used in
> > Microsoft Surface RT for attachable Type Cover.
>
> Would be nice to have a driver using this support in the series,
> otherwise it looks like thrown there without any use. Do you have
> any use of it already? Even in your private repository just to
> take a look.
>

Bindings which call gpio hotplug i2c bus:
ASUS TF https://github.com/clamor-s/linux/commit/360f62f706670ab13101ef15b7=
f2bc8880da7a48
ASUS TF600T/TF701T
https://github.com/clamor-s/linux/blob/transformer/arch/arm/boot/dts/tegra3=
0-asus-tf600t.dts#L1050-L1089
Surface RT https://github.com/grate-driver/linux/blob/master/arch/arm/boot/=
dts/tegra30-microsoft-surface-rt.dts#L35-L53

> Thanks,
> Andi
