Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C31B567808
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jul 2022 21:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbiGETvH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jul 2022 15:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiGETvE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jul 2022 15:51:04 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B0619004;
        Tue,  5 Jul 2022 12:51:04 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id v12so4021401edc.10;
        Tue, 05 Jul 2022 12:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xXJhaDsxtuXfhJR4i+ixGyr3aR3yk8wgwsxng0Wd/gE=;
        b=TmYSt+aavfs4VHdx2iu3TnBaWgHxF+Qhe+cTVxmpDzk0pIhZs9ePFzvpU08NNCuOT5
         2O8DBhgYiXy7CnJIJlagQX2xcaIjNybGpwQo7Um1qkNYJPrZJM28FjA9YbwVKBnsBaj1
         WHBwQMIAKZJ9WI28U0GeGL+Cp5lEK1asd/SO8HtbDo1rOcIYHxNPX7vturkFRCj0oMSj
         VteCemuOSbwW/qDvIw0BfArn28EnWowKu0qaLVKOqF4pd2TJ8o2o/F4bQIDFkQceKS8e
         YdmKcl13eQMGS0eh3ncCE74ogeGGhiy6yTPfk7vX5KIhEz41tS7ZNfC8G26xo9vKTh1U
         Di3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xXJhaDsxtuXfhJR4i+ixGyr3aR3yk8wgwsxng0Wd/gE=;
        b=XGVyHizyqvVdZngG7QhvmqmQxmSGM2jUjdfAIxzhi7wnvTf0NAgMuJf4iSEuWP6Tcr
         Hv8QA9z18eOyxctDUHF628uTD9TuP4xAXeCk4/afe+1mdvY9laSaeQjUkcavBpIR1Ys/
         h3auneWLcHv2lyHu+PJqOzRsUUsO3ppTUatKJwQd68g/SntnCgQwWtWR92hc7WxTrXcH
         FhbXNsSwUtVjPfSsI5YDlOqQL3zqMA9xISEYVLchwesBG1hPmJ9vTI6IY6zYPR40H/oN
         0ibPIWL+qxATdMqsu6C0S2vIBYj0VRx6tJfozrXMmILq6y4DPwDi0FPMEEgNMB6EQyut
         xtUg==
X-Gm-Message-State: AJIora+YztMUT2Bu+4DMyQRn2aDKrfap3N01zD1cbK+jUa20wKPimYTw
        2z9wyNt84XHmIDx79Bv0Ibs=
X-Google-Smtp-Source: AGRyM1v7VQa4DdLrM/+ApwzfPxJIiAyQF/uZ4jRgUZIs+dtkXx/zQqYgICBgrtGFbzowxvyJWho82w==
X-Received: by 2002:aa7:db09:0:b0:43a:7353:94a6 with SMTP id t9-20020aa7db09000000b0043a735394a6mr9276893eds.191.1657050662763;
        Tue, 05 Jul 2022 12:51:02 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640204d200b00435a08a3557sm24059324edw.27.2022.07.05.12.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:51:02 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Wolfram Sang <wsa@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mv64xxx: Add variants with offload support
Date:   Tue, 05 Jul 2022 21:51:01 +0200
Message-ID: <37661608.10thIPus4b@kista>
In-Reply-To: <20220702052544.31443-1-samuel@sholland.org>
References: <20220702052544.31443-1-samuel@sholland.org>
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

Dne sobota, 02. julij 2022 ob 07:25:42 CEST je Samuel Holland napisal(a):
> V536 and newer Allwinner SoCs contain an updated I2C controller which
> includes an offload engine for master mode. The controller retains the
> existing register interface, so the A31 compatible still applies.
> 
> Add the V536 compatible and use it as a fallback for other SoCs with the
> updated hardware. This includes two SoCs that were already documented
> (H616 and A100) and two new SoCs (R329 and D1).
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thanks!

Best regards,
Jernej


