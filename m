Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEB21735AF7
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 17:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230270AbjFSPRb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 11:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjFSPR3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 11:17:29 -0400
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9DDB9;
        Mon, 19 Jun 2023 08:17:28 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-77e2f4498d3so139573039f.1;
        Mon, 19 Jun 2023 08:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187848; x=1689779848;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgKRXvSMWABKvbmLX95jy/NSU+/y9S3eGrmMqjWNJU0=;
        b=mGVlhnyjSkGaOBKc/9ivIgtWosRjEfaW2RRA+fjjgrJL6GJQnM9XDOQh2U2sdpBUjr
         V9T7oZ8Nhrj/Cwd27/xAjuiQ8+L+AuaMszwJ633DKW1a85kefR2qXwmGWzgK5+Kc/tb3
         5xm7ZCY047Q7Ps8QBE7RQYuxJ00nBkj8BuFvi5WjhBqsLeYtJX4uCu/gJIE+F/Sm+8QI
         X96IQ493pAIpJpxjAsKIvnjxb48cX75yt9W6Jn3bChU27Wp97jCT2ewadU2gFiECVmhm
         CnNiYcDaArZUgUrlDqDWAyN0bRoICGKjT4udNKOWOz9f8zXZHRE32lcvw391LkJXii8p
         prZQ==
X-Gm-Message-State: AC+VfDy26DJk/T3jrncXHlfW4kCL6kHW7ZTVuNw0ylcXr0BpIr07aHcp
        skzfjJlaoyAfGc0VNpFr0A==
X-Google-Smtp-Source: ACHHUZ5es6kWhTCARuzVLDXGsRnpv7SH6/aqBJ5ei9Fyio38kSLiK55jginlEAtUi6nJJcy3wyFkVA==
X-Received: by 2002:a6b:d903:0:b0:774:9c64:e0a4 with SMTP id r3-20020a6bd903000000b007749c64e0a4mr8720642ioc.4.1687187846644;
        Mon, 19 Jun 2023 08:17:26 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c2-20020a6bec02000000b0077e2ae3170fsm1754400ioh.55.2023.06.19.08.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:17:26 -0700 (PDT)
Received: (nullmailer pid 1285056 invoked by uid 1000);
        Mon, 19 Jun 2023 15:17:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        devicetree@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org
In-Reply-To: <20230619143611.24482-2-clamor95@gmail.com>
References: <20230619143611.24482-1-clamor95@gmail.com>
 <20230619143611.24482-2-clamor95@gmail.com>
Message-Id: <168718784438.1285040.10790522017287667306.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: add binding for
 i2c-hotplug-gpio
Date:   Mon, 19 Jun 2023 09:17:24 -0600
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


On Mon, 19 Jun 2023 17:36:10 +0300, Svyatoslav Ryhel wrote:
> Document device tree schema which describes hot-pluggable via GPIO
> i2c bus.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/i2c/i2c-hotplug-gpio.yaml        | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
FATAL ERROR: Can't generate fixup for reference to path &{/i2c@7000c400}
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/i2c/i2c-hotplug-gpio.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230619143611.24482-2-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

