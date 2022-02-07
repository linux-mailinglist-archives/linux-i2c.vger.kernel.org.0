Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26CC54ACA1E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Feb 2022 21:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239990AbiBGUKB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Feb 2022 15:10:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241017AbiBGUIm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Feb 2022 15:08:42 -0500
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE68AC0401DA;
        Mon,  7 Feb 2022 12:08:41 -0800 (PST)
Received: by mail-oo1-f46.google.com with SMTP id f11-20020a4abb0b000000b002e9abf6bcbcso15008223oop.0;
        Mon, 07 Feb 2022 12:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CrvosFW42PH24vyhcJ8yCYK5kuH9wojPlsSY3hcdOUc=;
        b=s6qySJ7NxpOBdNCmmTsCIV1gFzYVIwBoLTq1vD5C6oDZGEFOp8ljVrgIpQPcalvoz2
         rHqzmGgBxHK5KMU+Z4OIv3RJ3EZVn0b6KSUpY3bjascWOGZG8OTAKX2MNI7puBM9JLaS
         cSO6qn4+DwguJ3CwJzsrOCho+rKB1H/BVyGWcKAlVgiXkAZhNvWul17QAIkX0P36cRnL
         X+AxDmLZx2Xa7TBwlrGUGoUZZTNuiDnuTm+naSUyox76jVPO8S953mkjcx+GuMMsxL42
         ayf1RCXxeKCYtrrrlHlGbx5epFFIBrpdy4O1tDtasG64/hBlvkreLvoWRMJKhloEuatd
         gfAA==
X-Gm-Message-State: AOAM532BbKQlmSNjrHn29TKV42eVB0olkITuuU/1Q1szezDoJx2nMC23
        llNd6D+ocpqUmBDFX3g5IA==
X-Google-Smtp-Source: ABdhPJyJK27+psTtrfkCuMuAqpffgGb6n5sw/ohgngNCI1dXBNEA26ejonL56UAsIWXjvhBlpqcVtQ==
X-Received: by 2002:a05:6870:72c5:: with SMTP id o5mr203147oak.138.1644264520985;
        Mon, 07 Feb 2022 12:08:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b8sm4398365otk.36.2022.02.07.12.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 12:08:40 -0800 (PST)
Received: (nullmailer pid 822044 invoked by uid 1000);
        Mon, 07 Feb 2022 20:08:38 -0000
Date:   Mon, 7 Feb 2022 14:08:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     conor.dooley@microchip.com
Cc:     linux-i2c@vger.kernel.org, linus.walleij@linaro.org,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org, robh+dt@kernel.org,
        ivan.griffin@microchip.com, atishp@rivosinc.com,
        bin.meng@windriver.com, Palmer Dabbelt <palmer@rivosinc.com>,
        devicetree@vger.kernel.org, heiko@sntech.de,
        u.kleine-koenig@pengutronix.de, paul.walmsley@sifive.com,
        krzysztof.kozlowski@canonical.com, aou@eecs.berkeley.edu,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        thierry.reding@gmail.com, jassisinghbrar@gmail.com,
        a.zummo@towertech.it, daire.mcnamara@microchip.com,
        palmer@dabbelt.com, lee.jones@linaro.org,
        linux-pwm@vger.kernel.org, geert@linux-m68k.org, brgl@bgdev.pl,
        lewis.hanly@microchip.com
Subject: Re: [PATCH v6 04/12] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Message-ID: <YgF8RhEUVNb1ZVFl@robh.at.kernel.org>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-5-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207162637.1658677-5-conor.dooley@microchip.com>
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

On Mon, 07 Feb 2022 16:26:30 +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Add device tree bindings for the real time clock on
> the Microchip PolarFire SoC.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
