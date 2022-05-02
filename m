Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8970B516F31
	for <lists+linux-i2c@lfdr.de>; Mon,  2 May 2022 14:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384840AbiEBMFq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 May 2022 08:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbiEBMFp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 May 2022 08:05:45 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C8B13E9C
        for <linux-i2c@vger.kernel.org>; Mon,  2 May 2022 05:02:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id k23so27359840ejd.3
        for <linux-i2c@vger.kernel.org>; Mon, 02 May 2022 05:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N75s0zlZ/grfCnjSSDgj4JMBZsdJ4ACb/MkzbjrMPK0=;
        b=2C8SNpetrT95gaXxl4PKvpcPFXCNt7hD8Rkw5YSjWw75sN7WvDyWUE20xLW3aAc9JO
         +Rpd1A4w/6YR6qfkgsBfZMH0F6RQdHGgbiN23YkPJE/o5615Hk1kScxhk67aaEydZvQx
         gUr3gQznUpZQ8WULmMVrW9fmeTdhAmf3QZcN3dS3QMCCegj8D/mHFiyimgwqKQTXly2R
         y9MfZ6hTC+1JrGkjf6Sm2dpq2JKqkbm1fjpGeLhulBvJZ+PnCzOMN926eNiC6p12WCZf
         ppEczvZ3ho5OKyefWPj3empmDu2x4QGZClpsgJq5zBH85WlWvFaKr7hDQ4OpyfNpFc93
         tt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N75s0zlZ/grfCnjSSDgj4JMBZsdJ4ACb/MkzbjrMPK0=;
        b=f+PyH0yEZMSBSRjc2IShHa4I4zRW4Fy1eFtOu3zMbYAaKuXwguwfOlnZF901nZUQh0
         ljXDGYI7mMFsgUEVxDqyls3rpKbOOhPBTSUxy9jppaCWOWtbVcTCvkxu0ULoprHE8P+t
         +R2AFOu/0sBaaAE2V1XChpZlvLn6WcNXfSvJxIz9csvm2V26ScTQfpHv+tPDYCts1sJW
         51oeCpAoZq+0BfVfMTVh5KQQBidlr0bPSzDdFlrgvKc1aRxOHb6O5TE7LU9+LPzTQF71
         YzhgVC3yTm29+M8Y+TdCdjMjBZnSpjrLVNvX8QesVdkIc4LOowbXmRbDyMY1z0b+ip0y
         Kmig==
X-Gm-Message-State: AOAM533196l+c5HiT0DRYp21lY7byTGOyBcgRhPrYP26Ulermbw0IZzs
        2BTNwICGmN+ZCxewMeMWovZjpANMp8ebxmGoNwvlLg==
X-Google-Smtp-Source: ABdhPJy3H4B9Xv6DMwPGyJFAVkCyL7HSoolYUgy9O4RpHeAO8P+IrocSLqSxIuMS7CSVBa8yNk/VwwJ8+38L2DDuuOo=
X-Received: by 2002:a17:907:9490:b0:6f4:5606:d98b with SMTP id
 dm16-20020a170907949000b006f45606d98bmr3892736ejc.734.1651492934588; Mon, 02
 May 2022 05:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220426175938.2262966-1-robh@kernel.org>
In-Reply-To: <20220426175938.2262966-1-robh@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 May 2022 14:02:03 +0200
Message-ID: <CAMRc=MfrvUn8w_aPL0_kej83-tf06GTUcJJ3bC0p8O8rd2Ae0Q@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: eeprom/at24: Add samsung,s524ad0xd1 compatible
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 26, 2022 at 8:00 PM Rob Herring <robh@kernel.org> wrote:
>
> The samsung,s524ad0xd1 compatible is in use, but not documented. According
> to arch/arm/mach-s3c/mach-smdk6410.c, the samsung,s524ad0xd1 is compatible
> with the 24c128. As the schema requires a fallback compatible to the
> corresponding Atmel compatible, 'atmel,24c128' is added as a fallback.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Fix the example in samsung,s3c2410-i2c.yaml
>
>  Documentation/devicetree/bindings/eeprom/at24.yaml            | 4 +++-

For at24 part:

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

>  .../devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml          | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
> index 6b61a8cf6137..d14e0accbda8 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -120,7 +120,9 @@ properties:
>            - const: giantec,gt24c32a
>            - const: atmel,24c32
>        - items:
> -          - const: renesas,r1ex24128
> +          - enum:
> +              - renesas,r1ex24128
> +              - samsung,s524ad0xd1
>            - const: atmel,24c128
>
>    label:
> diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
> index c26230518957..3d5782deb97d 100644
> --- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
> @@ -123,7 +123,7 @@ examples:
>          samsung,i2c-slave-addr = <0x66>;
>
>          eeprom@50 {
> -            compatible = "samsung,s524ad0xd1";
> +            compatible = "samsung,s524ad0xd1", "atmel,24c128";
>              reg = <0x50>;
>          };
>      };
> --
> 2.34.1
>
