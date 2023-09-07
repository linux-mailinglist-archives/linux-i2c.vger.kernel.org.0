Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 510DC797749
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Sep 2023 18:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241338AbjIGQYK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Sep 2023 12:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244055AbjIGQXW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Sep 2023 12:23:22 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ECEB1FCA;
        Thu,  7 Sep 2023 09:13:01 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-791b8525b59so455780241.1;
        Thu, 07 Sep 2023 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694103096; x=1694707896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBbG/89WwsARwO9cDG6ZrnKutfGNLaFwpYJJxWQTWZs=;
        b=b0vQ4D1mQ3kgqLuEJrXWtcFCHI5Fab6K8w6MX+iTwP4/6dpOYnIbghxpErxgGXmfdm
         xdMABYv6ezxLVSLwGR1+/5cipYCr1fYqGF0zmM5OjfdVHFC9Q//fb+01Pw2gcN6ocuS3
         EzgkLCBjWluobmjdFWYxy4slQYM7FmACRBhETD1QCEvW/wq4sn04c/lDOIYvkLvmKjlT
         u4iv2it/HImD+miwGl9oaRpUUv9SH7ZKJ5lU+lMk5ouu5B3Xm+uMV0NQeJ+kHZUQkK6f
         tyWIFzBqDcrJpZyBeRohhnIvPTSIeQeQoIuMkfrDfn9wqpiiGixCIel74rXxbX+QAEBG
         gDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103096; x=1694707896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBbG/89WwsARwO9cDG6ZrnKutfGNLaFwpYJJxWQTWZs=;
        b=OeGUGyat+QwIj46Hul/zlsY02WX3jUfBUyFhphz3EOY2w6gSKeoMCcb4ApzDJkUIZT
         Ew1lXhzdJJXXIk/I0bujhluRnM3vwxot0ur7f1HNDOl3WMhMTJUIA4fgTlcaKok+wqs6
         sW6E+tM2G+Gcj36CaZN3chWTLhKbYs4f0RZXf7bxal41FNSdfqYuQpFw8vwkTqkuRRbi
         +NLkp8DfWZhq3Q5fgvMO9DxbBCbMW1WYvxtmAyvi/pXieiYLqLiATfAMjVqkLqCmAh14
         yQzJhqq7YAxjZZfTznJpXGhGTIAZIZCJ0J1WX0vm2ivB1xShw8VNYo2n82RGgfiRUy2l
         YZAA==
X-Gm-Message-State: AOJu0Yw7KDHEENFthOi39/fz4YBzaYfQxYbYghhjUK355onyA06cacvk
        YSqc9+LDOkDUqmc4lesX4joYnh0i8QM=
X-Google-Smtp-Source: AGHT+IEsTDjlEJFvmqN1jWfGRQV26ABBTlqdZtz+qVwfZnqDHmSJNz8WWRbKq21PTU6/3PBfwQkKYQ==
X-Received: by 2002:a17:90a:49cd:b0:268:5431:f2a7 with SMTP id l13-20020a17090a49cd00b002685431f2a7mr16515868pjm.28.1694093797142;
        Thu, 07 Sep 2023 06:36:37 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 10-20020a17090a01ca00b00263dfe9b972sm1623144pjd.0.2023.09.07.06.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 06:36:36 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id C775B8F4C13A; Thu,  7 Sep 2023 20:36:32 +0700 (WIB)
Date:   Thu, 7 Sep 2023 20:36:32 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Raul Piper <raulpblooper@gmail.com>,
        <kernelnewbies@kernelnewbies.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux Devicetree <devicetree@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: Debugging i2c : i2cdetect cant detect a device on i2c line
Message-ID: <ZPnR4Cx6_Hh3weEl@debian.me>
References: <CAEwN+MCorDCS7EhN40Qgja_nY+SFc3G61Zd6yntqAS+w26YO9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H1/cJnQLbHBLXKRp"
Content-Disposition: inline
In-Reply-To: <CAEwN+MCorDCS7EhN40Qgja_nY+SFc3G61Zd6yntqAS+w26YO9Q@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--H1/cJnQLbHBLXKRp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc: devicetree and ARM folks]

On Thu, Sep 07, 2023 at 08:21:44AM +0530, Raul Piper wrote:
> Hello ,
> I am trying to detect an i2c device A on i2c1 line on  one of the Arm
> Cortex A7 platform but not able to see any device on a given address (
> 0x3d) .
>=20
> Is there any parameters of i2c which i can change like rise/fall time
> , timeout etc in a device tree or kernel source and re test it?
> I have tried changing the i2c speed from 100KHz to 400 KHz  but no succes=
s.
> I have even tried removing the 1.5K pull ups on the i2c lines but no resu=
lt.
>=20
> So I wanted to know on what factors i2cdetect may not probe the device
> or show it on the hex dump.
> What parameters of i2c driver i can tinker and where? Is Platform dts
> is the only file i can modify and test with?
> Kernel is 5.51 .

Do you mean v5.15.y stable series?

> There are other 2-3 devices on the same lines which responds to
> i2cdetect with correct address but not this device (0x3D) .
> Its i2c address is also different from the current devices.
>=20

Specifically, what device do you have this issue with?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--H1/cJnQLbHBLXKRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPnR3AAKCRD2uYlJVVFO
oyWCAP9+/SOZwrNMjfRhCDMh3l0obDG00/bTTq/q77PhjjA7rgD+NsH4fEEZCONi
2HKCHPJtDXAGeViGmvQbTqhp/EFcsAw=
=irVf
-----END PGP SIGNATURE-----

--H1/cJnQLbHBLXKRp--
