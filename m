Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8A5056780E
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jul 2022 21:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbiGETvR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jul 2022 15:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbiGETvN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jul 2022 15:51:13 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8121CB24;
        Tue,  5 Jul 2022 12:51:12 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id fd6so16640330edb.5;
        Tue, 05 Jul 2022 12:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JpHX3o8Gr6YdjHiWia1ySFjvRs3ZRI2eysFYCJSrNlw=;
        b=Xi6YRaopnDGl5B0GRQBbUT0WIRVVBzn1AfWtDzEfHW87dD+rxZc3uJBqNOlx66bztm
         48pP7K0Uwt3mC7fPCglaUfCFvYzHlBwpVFJMVNdhHvuzT4YkgTbNKTAqI4Y7uiRwLtyD
         MhlEqFPTHYVFL5TL9s127cLNFOxAdB0fTotwsJOeKhvYvvOXMhNXWfIfwASFbSOpriTG
         0ac+5KtzqJjws19ikmVKSbX+iNrv190ZDzkX+w4BSMIkiAyqrossLS0jEqUdoqSemB5q
         +jZAbQNqe9Yo+5ZNelmLaKnss3CGEF2Z2y7ajnDgu/owkm8L0XtEgPi49jMbsz05Yq7b
         iisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JpHX3o8Gr6YdjHiWia1ySFjvRs3ZRI2eysFYCJSrNlw=;
        b=EV2pTDM8WQ6JnUUovDwep5vLn5lco2IGmEta+gwT4Bi41tuiC8M4SS8G/PSysZ4U3K
         ZnW0Cl5U4YA4zrZvP/K+DmVcGSoUb18qXYzULKaU6Uu/Q4enVRYcvUI06AFd/6dh5cUG
         1KljL7Jcd4TrUmSgoNDLGrW53hsjxpd96jt7FsozAcVpKYOXtRNS7SH9IFSwcYs0idnR
         nmdIvNkdjISFH2W9ABdxL9M2wfT9B/W24/1h8b9YPK/fxdoT+Mx9w4Frg/X6cc/9TQ4B
         Ep3oSgjmGKOqN/dTqtjT69W+Q2aDYMHa5iA3aBbSUmi5l/DYug1djdChNO0a8+eqltMA
         pJZA==
X-Gm-Message-State: AJIora+tXx0P3heceIGS4cMiFvrxVkaWc3xtYWJ4TIPvgVS+AS5C9EG1
        j55SG0Aswibhm/mPdkWFOLo=
X-Google-Smtp-Source: AGRyM1sNJktg1YmMdLPTYeKTqHNOv312OI3jMf97duZ3lXEcAUza27lYPuJ/nh7rhfh6F59NsJijgw==
X-Received: by 2002:a05:6402:27c9:b0:435:d420:5ebb with SMTP id c9-20020a05640227c900b00435d4205ebbmr48029957ede.89.1657050671132;
        Tue, 05 Jul 2022 12:51:11 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id g4-20020a17090669c400b006fe9f9d0938sm16474180ejs.175.2022.07.05.12.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:51:10 -0700 (PDT)
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
Subject: Re: Re: [PATCH 2/2] arm64: dts: allwinner: a100: Update I2C controller fallback
Date:   Tue, 05 Jul 2022 21:51:09 +0200
Message-ID: <3482564.LM0AJKV5NW@kista>
In-Reply-To: <6399243.G0QQBjFxQf@kista>
References: <20220702052544.31443-1-samuel@sholland.org> <20220702052544.31443-2-samuel@sholland.org> <6399243.G0QQBjFxQf@kista>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dne torek, 05. julij 2022 ob 21:45:31 CEST je Jernej =C5=A0krabec napisal(a=
):
> Dne sobota, 02. julij 2022 ob 07:25:43 CEST je Samuel Holland napisal(a):
> > The I2C controllers in the A100 SoC are newer-generation hardware
> > which includes an offload engine. Signify that by including the
> > allwinner,sun8i-v536-i2c fallback compatible, as V536 is the first
> > SoC with this generation of I2C controller.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


