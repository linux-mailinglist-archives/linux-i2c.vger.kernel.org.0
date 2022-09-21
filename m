Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B31305BF6CA
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 08:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiIUGzP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 02:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbiIUGzO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 02:55:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3556052E45
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:55:10 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z25so7671726lfr.2
        for <linux-i2c@vger.kernel.org>; Tue, 20 Sep 2022 23:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=sRNPPxQwMPWqLWjhj5YW/0hO23m4s4pA3ZxgfGEgLeQ=;
        b=G/8D3dSTttTpzXOjAWi9d1DQ7rTiVYMus6IL0Yb5KZ5Q2Ga7EPgRD7cGkuN3oXp67N
         dmtxinE/F2lefDeiN5Ij/Rt1oeRF82EaERJRGGA3NUnVDVE0zQ/nia9twKkSN5yQ/dVP
         tkp4MTTuTJW8soQP+qoOjyxARqSjRRf7zBaSx8LRkvWGDZ/5UM1zl78GaptJVuhgNSta
         JZ/U7v7Cj1TxFgdm9RzH2//TZ3zWesVB1P0DaKR5KcLqi3QJpDgjIy28r1eOz7p0oG/3
         /ulJnrHBrByf2SlZluGEDoOay0gHJNS7q3f9v/bFip0SATm9KZ4IihcB0S/d+KHU6QHK
         PARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sRNPPxQwMPWqLWjhj5YW/0hO23m4s4pA3ZxgfGEgLeQ=;
        b=Y0reuc0GMBAg3b5uWW1xyAjarRsS1pxoZi0kZ2l7FqmxnaJd/UCkttkiF0HY45sret
         Qo6geFL4SxawgwB903AlcX5DiScqeY8kHs2bFk9ZhBIfa5KOXode0T+ce00dV5lzd+vx
         h0RCa4OAQBMLKKLFG3JF98rKq+tWm7X9f7ZrtGU/QXpvR6hRosdpa1C//HY0vEel7jf2
         Ujh8SjvInB9WQf63fySbH+bGwpKjUOYBnq+x/6EL8KgUpIf68y/EOdebV4dpuBeVDKhv
         6WuxNx7sEy2NuMlKzDBdsRwch8qf5xUJL+ZdUTaF59npf82xQgUwQ8YeP621RnPEmbIK
         ajqQ==
X-Gm-Message-State: ACrzQf3A4GRMpmtOvjDy5e7drFqmUAKEsYx9zTMtYG8Dmz8Iwo0C//Lw
        zH0hoLs+xWct2FBM6sTYMiid/UazoK5S3Q==
X-Google-Smtp-Source: AMsMyM4DTkJhb6tltXybTUjMwPnetSGfYqWpxsNwBGB5mUV9PpXWl3QlTC+kYnYLuO4XT7A9lMwEEw==
X-Received: by 2002:a19:5f59:0:b0:497:a72e:e0a1 with SMTP id a25-20020a195f59000000b00497a72ee0a1mr8976594lfj.259.1663743308568;
        Tue, 20 Sep 2022 23:55:08 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j21-20020a056512345500b004946274b7d6sm305694lfr.166.2022.09.20.23.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 23:55:08 -0700 (PDT)
Date:   Wed, 21 Sep 2022 08:55:06 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org, robh@kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v5 8/8] i2c: i2c-mlxbf.c: Update binding devicetree
Message-ID: <20220921065506.6cu6p2cpu3zfhtie@krzk-bin>
References: <20220920174736.9766-1-asmaa@nvidia.com>
 <20220920174736.9766-9-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220920174736.9766-9-asmaa@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 20 Sep 2022 13:47:36 -0400, Asmaa Mnebhi wrote:
> In the latest version of the i2c-mlxbf.c driver, the "Smbus block"
> resource was broken down to 3 separate resources "Smbus timer",
> "Smbus master" and "Smbus slave" to accommodate for BlueField-3
> SoC registers' changes.
> 
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
> ---
>  .../bindings/i2c/mellanox,i2c-mlxbf.yaml      | 48 ++++++++++++++-----
>  1 file changed, 36 insertions(+), 12 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
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
