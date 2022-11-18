Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0D8562F620
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Nov 2022 14:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242046AbiKRNbd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 08:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235303AbiKRNbY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 08:31:24 -0500
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9555A13F4D;
        Fri, 18 Nov 2022 05:31:22 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-141ca09c2fbso5922949fac.6;
        Fri, 18 Nov 2022 05:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y+PQank0kVuo33Md8NlsnP7gjwKHFRrleDDip1LLBFo=;
        b=0CLK1VbLXGwN5ehZle8r3kRY5vhWqYZQN3QQn0J7yzAdw1gvimTjNV633TlOvPA0SJ
         JU3KWMV85s+PmaAZehF8RgFRBqHmvL1RFBxwA4uminTlgzlor4d2nDXqVu2X9LcnVeqM
         KwX+wq6mE4LBuYw3EtWHxmW8lzl8j6vtHnttSsjTMcayqd1k59G3qp3H2uOkdkd47poI
         MA94yQhI4Gf7j7OWV9eb5qKJjLh3j6F5G6Fl7VYq7sE3buRTuUAxTytV/2tQ7k/szgct
         jRRFVEOON/eteKq3s6glDDQa/Ttwqk7j0tf8B9hA4bu1XoyJeFQbTvCzbus7LTDDWYok
         bZiA==
X-Gm-Message-State: ANoB5pnDS+5zHuc7VTFYgMKTlI7nWLDgibfXbq6S8onW0GJoWw05gMSU
        Hov2/hoWhk8YC3olShLlKfhGkzsNLQ==
X-Google-Smtp-Source: AA0mqf6hKsFP3YIalK4Wpqh7ejVjg0lybBFJOFt9BJ0OaI0dhtPs2Hp8J4zJGnJ0+qOqxFzfnK01kA==
X-Received: by 2002:a05:6871:4598:b0:13c:14f9:8657 with SMTP id nl24-20020a056871459800b0013c14f98657mr4098190oab.293.1668778281533;
        Fri, 18 Nov 2022 05:31:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q4-20020a9d5784000000b00661a16f14a1sm1534081oth.15.2022.11.18.05.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 05:31:20 -0800 (PST)
Received: (nullmailer pid 1482194 invoked by uid 1000);
        Fri, 18 Nov 2022 13:31:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org
In-Reply-To:  =?utf-8?q?=3C20221114-narmstrong-sm8550-upstream-i2c-master-hu?=
 =?utf-8?q?b-v2-1-aadaa6997b28=40linaro=2Eorg=3E?=
References:  =?utf-8?q?=3C20221114-narmstrong-sm8550-upstream-i2c-master-hub?=
 =?utf-8?q?-v2-0-aadaa6997b28=40linaro=2Eorg=3E__=3C20221114-narmstrong-sm85?=
 =?utf-8?q?50-upstream-i2c-master-hub-v2-1-aadaa6997b28=40linaro=2Eorg=3E?=
Message-Id: <166877745148.1437444.17672314766624749996.robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: qcom: geni-se: document I2C Master
 Hub wrapper variant
Date:   Fri, 18 Nov 2022 07:31:19 -0600
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Fri, 18 Nov 2022 09:45:05 +0100, Neil Armstrong wrote:
> The I2C Master Hub is a stripped down version of the GENI Serial Engine
> QUP Wrapper Controller but only supporting I2C serial engines without
> DMA support.
> 
> Document the variant compatible, forbid UART and SPI sub-nodes,
> and remove requirement for the Master AHB clock and iommu property.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 44 +++++++++++++++++++---
>  1 file changed, 38 insertions(+), 6 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221114-narmstrong-sm8550-upstream-i2c-master-hub-v2-1-aadaa6997b28@linaro.org


geniqup@8c0000: i2c@880000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@8c0000: i2c@884000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@8c0000: i2c@888000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@8c0000: i2c@88c000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@8c0000: i2c@890000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@8c0000: i2c@894000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@8c0000: i2c@898000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@8c0000: i2c@89c000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@8c0000: spi@880000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@8c0000: spi@880000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
	arch/arm64/boot/dts/qcom/sm8450-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8450-qrd.dtb
	arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb

geniqup@8c0000: spi@884000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@8c0000: spi@884000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
	arch/arm64/boot/dts/qcom/sm8450-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8450-qrd.dtb
	arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb

geniqup@8c0000: spi@888000: Unevaluated properties are not allowed ('label' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb

geniqup@8c0000: spi@888000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@8c0000: spi@888000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
	arch/arm64/boot/dts/qcom/sm8450-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8450-qrd.dtb
	arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb

geniqup@8c0000: spi@88c000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@8c0000: spi@88c000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
	arch/arm64/boot/dts/qcom/sm8450-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8450-qrd.dtb
	arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb

geniqup@8c0000: spi@890000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@8c0000: spi@890000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
	arch/arm64/boot/dts/qcom/sm8450-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8450-qrd.dtb
	arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb

geniqup@8c0000: spi@894000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@8c0000: spi@894000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
	arch/arm64/boot/dts/qcom/sm8450-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8450-qrd.dtb
	arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb

geniqup@8c0000: spi@898000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@8c0000: spi@898000: Unevaluated properties are not allowed ('spi-max-frequency' was unexpected)
	arch/arm64/boot/dts/qcom/sm8450-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8450-qrd.dtb
	arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb

geniqup@8c0000: spi@89c000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@ac0000: i2c@a80000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@ac0000: i2c@a84000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@ac0000: i2c@a88000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@ac0000: i2c@a8c000: Unevaluated properties are not allowed ('label', 'operating-points-v2' were unexpected)
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb

geniqup@ac0000: i2c@a8c000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@ac0000: i2c@a90000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@ac0000: i2c@a94000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@ac0000: i2c@a98000: Unevaluated properties are not allowed ('label', 'operating-points-v2' were unexpected)
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb

geniqup@ac0000: i2c@a98000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@ac0000: i2c@a9c000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)
	arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
	arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
	arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
	arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
	arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
	arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
	arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
	arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
	arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
	arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
	arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

geniqup@ac0000: spi@a80000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@ac0000: spi@a84000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@ac0000: spi@a88000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@ac0000: spi@a8c000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@ac0000: spi@a90000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@ac0000: spi@a94000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@cc0000: spi@c80000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@cc0000: spi@c84000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@cc0000: spi@c88000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@cc0000: spi@c8c000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@cc0000: spi@c90000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

geniqup@cc0000: spi@c94000: Unevaluated properties are not allowed ('reg-names', 'spi-max-frequency' were unexpected)
	arch/arm64/boot/dts/qcom/sa8155p-adp.dtb
	arch/arm64/boot/dts/qcom/sm8150-hdk.dtb
	arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dtb
	arch/arm64/boot/dts/qcom/sm8150-mtp.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-bahamut.dtb
	arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb

