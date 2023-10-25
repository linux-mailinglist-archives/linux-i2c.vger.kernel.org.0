Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4EF57D7008
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Oct 2023 16:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbjJYOwn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Oct 2023 10:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbjJYOwk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 Oct 2023 10:52:40 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8829C18A
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 07:52:13 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-457bafdc467so2322116137.2
        for <linux-i2c@vger.kernel.org>; Wed, 25 Oct 2023 07:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698245531; x=1698850331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLjdKZ5k0mXVbD8bW7euvhzE58el0xEiaStx/smEM9o=;
        b=L2zx2ZDUTUcNhjd/kQhBfl0X6zLoWnqtZftN5bvJLKV8MKaeH+LxAIiuNlaXBauLFe
         olCtDxbH+t09Olwjiuwif1Oxm6GktIiG4Rwm3z6Gr/OnLSQAOE2T2K8QWLk/Bql4yTZ1
         vEDW9Rc6LSkY2q7TqlAgLV5mvnni0yfndg8EZEkDGBsNVZAAm/67qXPnX4r21w9+r5s7
         AMmr/QdCizQRiu51ynVZB0L+RecCDYSjd9/5pxqfrL9+4yPhG1kpfnrszGLdga3CA/uM
         RDPeD+zQTRJxoaWGcdr2iodOWpIE65JKHQvoPhU5HCa6SIevFw7DlYjCirKVdqmJTHr/
         yuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245531; x=1698850331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLjdKZ5k0mXVbD8bW7euvhzE58el0xEiaStx/smEM9o=;
        b=esYcjYIKVbHaJO3x8NqB0/uBNZJW/c3begdIPnAdhEpPi31WpFmccqVxEc+FDIaCX8
         N2FTC/2qGUQwhwPQUNd/1IQLqAZMKW39J9K7Y5/RXU5SpgSu6e1pLPvvS/neaUZ8xKSG
         ut2bs41FcxfNmNysZ+IhtBvfD8bNEkZZOQVs5texUAAqoMdWSbq0LABC1zpfVrTQkrXw
         w7/uea+NxpWdX1CH4h+sraebQV/Xbl6RPt11coAJVAGAqCx/aS6KrQq1bgJj+BsfElkW
         EJ0EPS2M6vESWy/TBsn/GxDfBDSInRt62DSTlnJ4g+ByAcdE/j5ngRhpNRK5cYDaM2B7
         lIag==
X-Gm-Message-State: AOJu0YzVq1Hbktogsg29gR6J6eYNbniGrj7jZmRq3Ki3rBEy2f8kUDSO
        6ajVbqjpd+P330luqVqRmEF7YbjQsYNa6uxHoKy6bg==
X-Google-Smtp-Source: AGHT+IH9eZcIeh5TypMu2DrELpqy3iFXVc5K2Hl5mUVraJmb0uVk6Ut6VGVvmn/692Isw5J2GiM90b5hEhQWssWFL90=
X-Received: by 2002:a67:c295:0:b0:458:47e6:70e4 with SMTP id
 k21-20020a67c295000000b0045847e670e4mr15925625vsj.19.1698245531279; Wed, 25
 Oct 2023 07:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231024171253.19976-1-zajec5@gmail.com> <20231024171253.19976-2-zajec5@gmail.com>
In-Reply-To: <20231024171253.19976-2-zajec5@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 25 Oct 2023 16:52:00 +0200
Message-ID: <CAMRc=Mdb7mjOLQSVVka4XTCuziB1DNj9kpgB=sE=fcJKvpk0_A@mail.gmail.com>
Subject: Re: [PATCH 6.7 fix 2/2] dt-bindings: eeprom: at24: allow NVMEM cells
 based on old syntax
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Oct 24, 2023 at 7:13=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This binding supported NVMEM cells as subnodes and that syntax is used
> by few in-kenel DTS files. Modify binding to allow it.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Fixes: c5330723d5a0 ("dt-bindings: nvmem: move deprecated cells binding t=
o its own file")
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index 6385b05a1e62..b6864d0ee81e 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -12,6 +12,7 @@ maintainers:
>
>  allOf:
>    - $ref: /schemas/nvmem/nvmem.yaml
> +  - $ref: /schemas/nvmem/nvmem-deprecated-cells.yaml
>
>  select:
>    properties:
> --
> 2.35.3
>

Do you want it to go through the at24 and subsequently i2c tree?

Otherwise if someone else will pick it up:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
