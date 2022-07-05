Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14EC55677F7
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jul 2022 21:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbiGETpg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jul 2022 15:45:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiGETpg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jul 2022 15:45:36 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C23140A6;
        Tue,  5 Jul 2022 12:45:34 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id q6so23359315eji.13;
        Tue, 05 Jul 2022 12:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fQ8Il+1xPSOiB3xTi8ckjDydW1jD8EUHsIV+FtKFLqg=;
        b=gcOylOkT5WTQ3dPLhA5E174DMkmIRa1bUSD0r6+wz5OxAfjNk7SxKEVM1OeqzEa6lE
         G6sGvyIqD+8r8y9MtT9zdyFOZy5iqZLozIOPh+KntERR5gMjeV4ARS6UoRPNBHPefBko
         TXwhByyu6+zb0YDDT7rJKU06egJpMFRZ0gxByXuFKQbL2PvMqwHAAX872l6+ptFDgQjH
         4Jz4YP9Anf9XT55Ldky6FWHGNT25ImtoWQJgZCxCM1UQy96HIPo+CW5svJXfxa2eFy16
         ylW/CtoDje28JRgdQgYI+XPNuB+sBd6QLVP7bt+T3JFbLIWHWQdXQLNyChYuHdPV62pI
         XFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fQ8Il+1xPSOiB3xTi8ckjDydW1jD8EUHsIV+FtKFLqg=;
        b=X51iyCA5msCsbTN5lCTVOeaL15VO4iNvrIPYdyiRfmV3RbVU+FPBBdpFabwy24k2rA
         hti0Sql1RpiCumEsyGr18bTjvVM3UXBtde6mZmv/J1m6P/cBWuS0aOsO/AdFPGCTLy0U
         8YL0HfDX6XGoxdKMM9rC9WGNYS6GovarwcNZOSetE3xBiWtAFQEw6+gRBfC5WRJaXZHy
         gyz2sV+bhI9ltCQOlzSPkyhyZU3VkGbUt2CrxexX5D6T3qQ/WrK8iXyzi7L/Ej0G6uX2
         Zu25lQxxTGkB6Pxkb1Rgp3L9OOwzl03yIZohQpNODh//JYEKC+up+UNy0Z3QnZNNPrqk
         EbkQ==
X-Gm-Message-State: AJIora9Mp/PrctzQkKPLAxXzr8QhDWD7zFXFig9ftpzl2APNrp5QjEBe
        nKSoKr94UB9+YT1MVX5ahM4=
X-Google-Smtp-Source: AGRyM1sw9aYAXHCG2hkDhMKhQg0SO46odbeaKjrBDV3M21Aft9N3nJaJYcu3RriA6OWDPmkmw471jQ==
X-Received: by 2002:a17:907:3d93:b0:726:3ade:a299 with SMTP id he19-20020a1709073d9300b007263adea299mr35802645ejc.635.1657050333521;
        Tue, 05 Jul 2022 12:45:33 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id p27-20020a1709060ddb00b00722e559ee66sm15992983eji.62.2022.07.05.12.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:45:33 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Wolfram Sang <wsa@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: a100: Update I2C controller fallback
Date:   Tue, 05 Jul 2022 21:45:31 +0200
Message-ID: <6399243.G0QQBjFxQf@kista>
In-Reply-To: <20220702052544.31443-2-samuel@sholland.org>
References: <20220702052544.31443-1-samuel@sholland.org> <20220702052544.31443-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dne sobota, 02. julij 2022 ob 07:25:43 CEST je Samuel Holland napisal(a):
> The I2C controllers in the A100 SoC are newer-generation hardware
> which includes an offload engine. Signify that by including the
> allwinner,sun8i-v536-i2c fallback compatible, as V536 is the first
> SoC with this generation of I2C controller.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


