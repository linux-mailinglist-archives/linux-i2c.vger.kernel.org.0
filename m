Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEDE45BDFD8
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Sep 2022 10:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbiITIV2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Sep 2022 04:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiITIUQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Sep 2022 04:20:16 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22AEDBCB3
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 01:18:44 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id c7so2016638ljm.12
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 01:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=VgLmEzPIecZSC3MjYpPVUH86WqTbJd8woh8yOpcfqDU=;
        b=AT31RTdDAle87hJvO/3kTcU9kt9Lkl1u97mOBIhexbOrbmSq8D8sS2QeNLxbw/mhEd
         3dLdonv/6owGqgz70lzL4ciz8RwBIqC4TsGBN9WbwvqYx3DbzOoHPLETd3/BHapHOCwq
         vrzG128qYXTDJnbu/J0WuKhbmXDy9BxRKQ3BrOr6nV0kK0fKEDy/ldbKoW5wK0/jiy8x
         gJK/Se0YMqWjiPWJa8RiQPVl6na9R8VKCqodtVj4ykcaZbtGgDa+hPJ1qA4ULwxC0pGg
         iIV9a/yKOhqMOTf/G5KqVwcUMbza9u/lEz/R2MuC3mjfkIDAT2E7cVilCBP6Yat/0uhN
         Bfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=VgLmEzPIecZSC3MjYpPVUH86WqTbJd8woh8yOpcfqDU=;
        b=xrhiErZJS2igp15stIOOzwIMBpvzkfc2faMVvtdE842o5i416l2Kstn3hhDnjsbvJu
         0cs35ypaJjgWCcfQVE1KYe5X48KJz5colIjOtIg9DngX4aAJhJBBVjtkNcoTN+pQTdDp
         hnHlHAW9PKB3GwtXEZ+s1pbl0qd6n4eue1cbtEqigGCw3asRwe5Iv41j0SOrNrv9JTWF
         Arb3LywngdjsOln9BtEUmWE88AWJMU4eWbI0hUeqQwmhtrrsUaCGf/oPuHRNXaxoLtN3
         LLwWc61VJS9T1C8tTnKcnpPElaXlUUQSkOXewqrCpWDSQOhxGuux0Wy2gswl9PlWhSsN
         vXmQ==
X-Gm-Message-State: ACrzQf1F9NqPlr0lwHqr5lcY1gO2nXZqs/8BXXss2jow9IJREE4zamNj
        Y6bZq+hxglmOwsLh783OXA6aSg==
X-Google-Smtp-Source: AMsMyM5zRjJJPYotMEvfsPRUR4vDhywoNUaKPLs5B7eMo1tU6DOqqU7rZDZOmHR+OcqE93aw/KaECQ==
X-Received: by 2002:a2e:2e0b:0:b0:26b:f760:1c51 with SMTP id u11-20020a2e2e0b000000b0026bf7601c51mr6335172lju.494.1663661922472;
        Tue, 20 Sep 2022 01:18:42 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b4-20020a056512070400b0049464d89e40sm197345lfs.72.2022.09.20.01.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 01:18:42 -0700 (PDT)
Date:   Tue, 20 Sep 2022 10:18:39 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Khalil Blaiech <kblaiech@nvidia.com>, robh@kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v4 8/8] i2c: i2c-mlxbf.c: Update binding devicetree
Message-ID: <20220920081839.2wq2h2vsodphaqh7@krzk-bin>
References: <20220919213431.8045-1-asmaa@nvidia.com>
 <20220919213431.8045-9-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220919213431.8045-9-asmaa@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 19 Sep 2022 17:34:31 -0400, Asmaa Mnebhi wrote:
> In the latest version of the i2c-mlxbf.c driver, the "Smbus block"
> resource was broken down to 3 separate resources "Smbus timer",
> "Smbus master" and "Smbus slave" to accommodate for BlueField-3
> SoC registers' changes.
> 
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---
>  .../bindings/i2c/mellanox,i2c-mlxbf.yaml      | 49 ++++++++++++++-----
>  1 file changed, 37 insertions(+), 12 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml: properties:reg: {'minItems': 3, 'maxItems': 6, 'items': [{'description': 'Smbus block registers'}, {'description': 'Cause master registers'}, {'description': 'Cause slave registers'}, {'description': 'Cause coalesce registers'}, {'description': 'Smbus timer registers'}, {'description': 'Smbus master registers'}, {'description': 'Smbus slave registers'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.yaml: ignoring, error in schema: properties: reg
Error: Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.example.dts:26.19-20 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1420: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
