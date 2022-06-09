Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9960545052
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 17:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbiFIPMd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 11:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240661AbiFIPMc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 11:12:32 -0400
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1DAB1F;
        Thu,  9 Jun 2022 08:12:31 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id f7so18968615ilr.5;
        Thu, 09 Jun 2022 08:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CGEoHPza3xdvV7CwQXyXz/OI0Wr6yYkBqPLhFgmXcEI=;
        b=Bh2ELTycg4ma/KbeTqEgQmpGXOXFGVSjbglpZjFShrAZhRHRGsWkIlhIwWrLsPQxbx
         nxE6I4VMKEOevXBqjPgpSTKnnPytzina7CswLWf8uV1lHRXER/zdAmhiQjTLH+h2vp0H
         Dm/CSLokw5VDXe5RKLQ1kBm2U2nzt1jbCBIAPd8FMLgPrazG71QGQGOV7Hcr5d6TIIpi
         HPiUHK2Ai1lvo6DYDAxyDldeD2AIP1WgqXqYCSq/xKG0n5AHoWgJsTcs+8d/ZT6hOeQl
         5WwWULJ6PaNl7NlllA8OjOcW8lxxPk+pIRE4TTuSR5uKBbh48Guhr9ww66TYdCTQ6Z8E
         nTvQ==
X-Gm-Message-State: AOAM532Fw7FGKe4xwno2y0vA3WN1ROsDrvvjCCQnZAc6wOJ1Kh/oaI2s
        l9wrKSeZopqndqVGap8I9g==
X-Google-Smtp-Source: ABdhPJxO74uRCvSmQ2Qo1e121V5wl+KoVx7z04wk1OQqECEb6tExG/JJBd5b7j1HEtIB6qWquwjzmQ==
X-Received: by 2002:a05:6e02:180e:b0:2d3:c497:710 with SMTP id a14-20020a056e02180e00b002d3c4970710mr22275012ilv.166.1654787550592;
        Thu, 09 Jun 2022 08:12:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id m7-20020a056638408700b0032b3a7817b3sm9599623jam.119.2022.06.09.08.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:12:30 -0700 (PDT)
Received: (nullmailer pid 3805410 invoked by uid 1000);
        Thu, 09 Jun 2022 15:12:28 -0000
Date:   Thu, 9 Jun 2022 09:12:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Atul Khare <atulkhare@rivosinc.com>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: sifive: add gpio-line-names
Message-ID: <20220609151228.GA3800290-robh@kernel.org>
References: <CABMhjYp4ChJ3KfP=jQmA5nnv7YB=Kkanjb2KwDEVWSS+Sn5m1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABMhjYp4ChJ3KfP=jQmA5nnv7YB=Kkanjb2KwDEVWSS+Sn5m1g@mail.gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 08, 2022 at 04:39:39PM -0700, Atul Khare wrote:
> Fixes device tree schema validation messages like 'gpio-line-names'
> does not match any of the regexes: 'pinctrl-[0-9]+' From schema: ...
> sifive,gpio.yaml'.
> 
> The bindings were missing the gpio-line-names element, which was
> causing the dt-schema checker to trip-up.
> 
> Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
> ---
> Changes since v1 [1]: Rebased on latest version

This one also doesn't apply.

> [1]: https://tinyurl.com/yvdvmsjd
> ---
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index 939e31c48081..787ce7300118 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -47,6 +47,9 @@ properties:
>      default: 16
> 
>    gpio-controller: true

blank line

> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 32
> 
>  required:
>    - compatible
> --
> 2.34.1
> 
