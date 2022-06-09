Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B388654502E
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jun 2022 17:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344127AbiFIPId (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jun 2022 11:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344133AbiFIPI3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jun 2022 11:08:29 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF527CDE9;
        Thu,  9 Jun 2022 08:08:28 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id a10so22392298ioe.9;
        Thu, 09 Jun 2022 08:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nAv69gpcPWI9Low0xHefIateOKeB8tVbI9fswYi40nM=;
        b=lVEklPxlARZDppoKII0ezz70Kk3EQSAj0alX2JyJzIqS3K68ztm5Ysx5h0923+/YU0
         JvoRIwNchBMtPh5AwuJFGvIonQu9JQ2j6gXAFt/SxI6wjvdcY8fjoVkZMmhX1um80Zjo
         U9DxcehEE8lzs/HJAmyYG7yg48ptnJn73XVGe/BuRl9QuXtxRN1P/N2fgIG2FiMHJPP0
         0bkhlW8uWgfhxAUehZaoiiQSwv0QeFhHe1dRmDHwacZPWO6xLOTM7y88hP27yZN1b/qJ
         t3xe3bv6+ubEkdGVD/PbxkUtfoXxB2Z4S6WCIr/UmvDzVJBv7rB0L2wd8InVCVynJjDB
         Gqsw==
X-Gm-Message-State: AOAM5318/MNVqBf13nUY8wV2ThAehXDj6IqzamHu+1NR7OKh9a3GXi5I
        F5oJN3c0LcnEsPx7SrJVw/J0oCkULg==
X-Google-Smtp-Source: ABdhPJw/GiO2Y1Nfl+vdnO3TJaRJzKOYQd9vP5AIMiesXHagezYV5WnL5NCT3JUuEpT4Qe4UHq/VPA==
X-Received: by 2002:a05:6638:16cf:b0:332:2bc:b7d5 with SMTP id g15-20020a05663816cf00b0033202bcb7d5mr1401791jat.172.1654787307750;
        Thu, 09 Jun 2022 08:08:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id y10-20020a02354a000000b00331f48289easm2031970jae.136.2022.06.09.08.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 08:08:27 -0700 (PDT)
Received: (nullmailer pid 3800045 invoked by uid 1000);
        Thu, 09 Jun 2022 15:08:25 -0000
Date:   Thu, 9 Jun 2022 09:08:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     Atul Khare <atulkhare@rivosinc.com>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Conor Dooley <Conor.Dooley@microchip.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sifive: add cache-set value of 2048
Message-ID: <20220609150825.GA3783956-robh@kernel.org>
References: <CABMhjYq8WbHcA=8dRxHVy=-NhL3+GaRKsBb3X2bG2-6Azd2S1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABMhjYq8WbHcA=8dRxHVy=-NhL3+GaRKsBb3X2bG2-6Azd2S1g@mail.gmail.com>
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

On Wed, Jun 08, 2022 at 04:39:31PM -0700, Atul Khare wrote:
> Fixes Running device tree schema validation error messages like
> '... cache-sets:0:0: 1024 was expected'.
> 
> The existing bindings had a single enumerated value of 1024, which
> trips up the dt-schema checks. The ISA permits any arbitrary power
> of two for the cache-sets value, but we decided to add the single
> additional value of 2048 because we couldn't spot an obvious way
> to express the constraint in the schema.

There is not any way to express power of 2, so you have to list values. 
Rather than just adding 1 more value, I would add at least a few more so 
we're not adding these one by one. This is for a specific cache 
implementation, so it can't really be *any* power of 2. Designs have 
some limits or physics does.

> 
> Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
> ---
> Changes since v1 [1]: Rebased on latest version

What version is that because this did not apply to v5.19-rc1 for some 
reason.

> [1]: https://tinyurl.com/yvdvmsjd
> ---
> ---
>  Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index e2d330bd4608..309517b78e84 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -46,7 +46,9 @@ properties:
>      const: 2
> 
>    cache-sets:
> -    const: 1024
> +    # Note: Technically this can be any power of 2, but we didn't see
> an obvious way
> +    # to express the constraint in Yaml
> +    enum: [1024, 2048]
> 
>    cache-size:
>      const: 2097152

Surely this is not fixed either?

> --
> 2.34.1
> 
