Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 521A667236C
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 17:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjARQeR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 11:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbjARQeB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 11:34:01 -0500
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9382E474F7;
        Wed, 18 Jan 2023 08:32:10 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id r132so18492350oif.10;
        Wed, 18 Jan 2023 08:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD85U98S+pS0WRPnJl9HKkiqjtEHsCO7bylri+EWF0E=;
        b=bD3SKhtCv/25EBk4J3iWmw+SWN2BJ9GdwWZXoxVd3RZvKQLK8ctB9Yh8agNu00bHoR
         sdJeCvo82+GoWp5YzR42IrybKItQ0/92g3p4R8xgpnn4gs5BlIscQVBxt8p6MTjbaPlw
         pgEBZztATPRitW79A987mlS6r+8WxfpChWELrTSSlnuj9RCG2xMg4BjpQKBJCghWrxNF
         MfyVmkKHjcQzcT943VfXUdyGmDcsUG4SETGTTy8zNeUU1IQq+uljRfor3ziUB841Dpij
         mNAonkDcwIitQthJgAL9O7uuxY6x6gdE8YikylDn+Ki+t4G+zV0akWMrv+9oLU74IPBE
         C5bw==
X-Gm-Message-State: AFqh2kqmyPaFhirncMpjhsDWJu42Cn8GbnWzES46hoiFynhqHTO4ahm8
        EcyL9iD3mdFPrcaJD6HVahDxIEQVHg==
X-Google-Smtp-Source: AMrXdXurUkT9WfYmTLCzRzB7E6Qnq1arL/65cVzPK76MApOMpYUIqeTNPunlYX4DAZ+b6iH2UAF+7g==
X-Received: by 2002:a05:6808:1292:b0:364:b580:d122 with SMTP id a18-20020a056808129200b00364b580d122mr4852881oiw.46.1674059529454;
        Wed, 18 Jan 2023 08:32:09 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
        by smtp.gmail.com with ESMTPSA id e23-20020aca1317000000b0035028730c90sm1339379oii.1.2023.01.18.08.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 08:32:08 -0800 (PST)
Received: (nullmailer pid 125184 invoked by uid 1000);
        Wed, 18 Jan 2023 16:32:08 -0000
Date:   Wed, 18 Jan 2023 10:32:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c-gpio: Add properties for dealing
 with write-only SDA/SCL w/o pullup
Message-ID: <20230118163208.GA117919-robh@kernel.org>
References: <57666b4f-4c12-7feb-caf1-5bd38908bfc7@gmail.com>
 <fa28a480-1980-16dd-0263-ae4866e7c7cc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa28a480-1980-16dd-0263-ae4866e7c7cc@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 17, 2023 at 09:36:05PM +0100, Heiner Kallweit wrote:
> There are slave devices that understand I2C but have read-only SDA and
> SCL. Examples are FD650 7-segment LED controller and its derivatives.
> Typical board designs don't even have a pull-up for both pins.
> Therefore add properties for not using open-drain. For write-only SCL
> we have a property already, add one for write-only SDA.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v4:
> - add no-pullup properties
> ---
>  .../devicetree/bindings/i2c/i2c-gpio.yaml        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
> index e0d76d5eb..67898cc52 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
> @@ -33,6 +33,10 @@ properties:
>        open drain.
>      maxItems: 1
>  
> +  i2c-gpio,sda-output-only:
> +    description: sda as output only
> +    type: boolean
> +
>    i2c-gpio,scl-output-only:
>      description: scl as output only
>      type: boolean
> @@ -63,6 +67,18 @@ properties:
>        GPIO line used for SCL into open drain mode, and that something is not
>        the GPIO chip. It is essentially an inconsistency flag.
>  
> +  i2c-gpio,sda-has-no-pullup:
> +    type: boolean
> +    description: sda is used in a non-compliant way and has no pull-up.
> +      Therefore disable open-drain. This property is mutually-exclusive
> +      with i2c-gpio,sda-open-drain.
> +
> +  i2c-gpio,scl-has-no-pullup:
> +    type: boolean
> +    description: scl is used in a non-compliant way and has no pull-up.
> +      Therefore disable open-drain. This property is mutually-exclusive
> +      with i2c-gpio,scl-open-drain.

The mutual-exclusion can be expressed as a schema instead:

allOf:
  - not:
      required:
        - i2c-gpio,scl-has-no-pullup
        - i2c-gpio,scl-open-drain
  - not:
      required:
        - i2c-gpio,sda-has-no-pullup
        - i2c-gpio,sda-open-drain

Using 'dependencies' with a schema would also work.

Rob
