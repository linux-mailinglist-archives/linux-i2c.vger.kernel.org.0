Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523BF4AC158
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 15:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382628AbiBGOgH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 09:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391910AbiBGOWp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 09:22:45 -0500
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A64C0401C5;
        Mon,  7 Feb 2022 06:22:43 -0800 (PST)
Received: by mail-oo1-f46.google.com with SMTP id f11-20020a4abb0b000000b002e9abf6bcbcso13792088oop.0;
        Mon, 07 Feb 2022 06:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=QIbiP35GQSEEEaU8+SHxv92w3MHEG9bQFU7JRjEoZlY=;
        b=brozXX9fSBUx2wiyZ45jMCF1zbhTF5Jiiiq/1qNhNEISHbW9idPfyEbk388ryHClRI
         0nU/I8STgLK1hbT0plPcwny50flkQzxCjsi6LK1snw4iaT282uNMsVQYt3xavJMk9rR+
         kmLWZYT/g1ay7JqscV/Nfdsh8TqmCQ+1myJ/rKWsopNPrpeC27KI6joXYQuFsXwZu+sJ
         XrWEqu88NKNf1lc/JCcPGyDLtxIRNHMdEpBZeuDCCGdJbGc2jBn7tV0qeZt18snSUbkX
         ZQOcuYijB/0aopkICz3ZKm+TMRcz7NFg64I+yiesfeDxG8Muf8DR/v4I4nZtVFv8udTA
         NMxw==
X-Gm-Message-State: AOAM532iigGs7hIrfCwwGBbQ6avAsAOcehmfXMqTJBdZFnra8h/l5REp
        fW9LagM5g+a/gusyp1cm5Q==
X-Google-Smtp-Source: ABdhPJxfXZdsGyfmTD5R1VDT1P4brg4JwOcmWmQsyw1NxMpW2nnJoH8Cy0v4BgETqUhZfQJQxbm3pg==
X-Received: by 2002:a05:6870:44:: with SMTP id 4mr3436859oaz.68.1644243762896;
        Mon, 07 Feb 2022 06:22:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t31sm4334410oaa.9.2022.02.07.06.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 06:22:42 -0800 (PST)
Received: (nullmailer pid 320510 invoked by uid 1000);
        Mon, 07 Feb 2022 14:22:40 -0000
From:   Rob Herring <robh@kernel.org>
To:     Tyrone Ting <warp5tw@gmail.com>
Cc:     Avi.Fishman@nuvoton.com, openbmc@lists.ozlabs.org,
        lukas.bulwahn@gmail.com, bence98@sch.bme.hu, sven@svenpeter.dev,
        devicetree@vger.kernel.org, tali.perry1@gmail.com,
        krzysztof.kozlowski@canonical.com, arnd@arndb.de,
        benjaminfair@google.com, tmaimon77@gmail.com, yuenn@google.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        semen.protsenko@linaro.org, olof@lixom.net, venture@google.com,
        wsa@kernel.org, avifishman70@gmail.com, jie.deng@intel.com,
        robh+dt@kernel.org, linux-i2c@vger.kernel.org, kfting@nuvoton.com,
        tali.perry@nuvoton.com, yangyicong@hisilicon.com,
        linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com
In-Reply-To: <20220207063338.6570-2-warp5tw@gmail.com>
References: <20220207063338.6570-1-warp5tw@gmail.com> <20220207063338.6570-2-warp5tw@gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: i2c: npcm: support NPCM845
Date:   Mon, 07 Feb 2022 08:22:40 -0600
Message-Id: <1644243760.823059.320509.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 07 Feb 2022 14:33:33 +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> This commit adds compatible and syscon description for NPCM845 i2c module.
> 
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> ---
>  .../bindings/i2c/nuvoton,npcm7xx-i2c.yaml     | 21 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1589171


i2c@80000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml

i2c@81000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@82000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@83000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@84000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@85000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@86000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@87000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@88000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@89000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@8a000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@8b000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@8c000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@8d000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dt.yaml

i2c@8e000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gbs.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm750-evb.dt.yaml

i2c@8f000: 'syscon' is a required property
	arch/arm/boot/dts/nuvoton-npcm730-gsj.dt.yaml
	arch/arm/boot/dts/nuvoton-npcm730-kudo.dt.yaml

