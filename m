Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC6B5B275E
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 22:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiIHUBq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 16:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229838AbiIHUBX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 16:01:23 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABB0FE4AA;
        Thu,  8 Sep 2022 13:01:14 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so2592454wmk.3;
        Thu, 08 Sep 2022 13:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bIlc6ICOGPGbihgQlUe3reSXqofwJ0TrB3eitj5hQ/k=;
        b=jK6Lxe7npRBNqeLKvNRyJLwEX5/QFzY8+cWLKdNgjx8fxiLVa2Ih1LWuxfxswpNqld
         nkBTz6M4cULCv7pKtbOpjbrSxvKjtjXPvjQhVcHr3+fdaVKeWWL8EXWygtJCl18E4dn0
         Uo4oz+QLNz8Izp3XbvPGoHuB7HLTrpJ24YXS2iL3jHtcLbU3/XZspFkG5xfgEmZ/lXqu
         w94jBP87pVQQQW6om7uOltkLOraerY+qt8Ia4NRO6J7Gc1Ys6+H7Ffy5eA41Vd7/yJtN
         L8BaBjqHePUORrKyaT1Nr/pKC2t3ZV2Z9AwCrpV7ofdsawT8aFPnbTbv0kh7SrgPaN+0
         YV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bIlc6ICOGPGbihgQlUe3reSXqofwJ0TrB3eitj5hQ/k=;
        b=k0MBoabouNxKhnmmVJZ+b8Wmld5V2W44PqdmBg8ol6WCltjVyA8vJfV5RW98cNeWic
         Yh4eyRkSQwRKbaH+ecQiIhUMpokhyUn8w7MT8NWFI71OFOAT7D07Rs5wzGmcHyYtyJZ/
         Z3UKBWMBh65Nq3cboGjjdjH2MlxVb8ZIQzSIUlcU3gY8YThREswGs4bzGkgNrfbiKHIJ
         OD+937VvFf3zH9t2PngCh9rlZ3LvtbBuU7G4mbu7ALr83ZpGoNs9rCHS7mwtOo/vUQla
         dmW0/DbDCNpd/7ZV48OzSZ81t4KymE0rwRRbDRs6oxe7V346trdWjBExtfvJql/3czXu
         fCkQ==
X-Gm-Message-State: ACgBeo0/EIop1o8HDv78rdVlRGgrFNYPQ+RtlO44ceVo5D4plxd3/tVy
        kUxu/oqcB6A5aGe++VFzKiE=
X-Google-Smtp-Source: AA6agR7H6MggZHHKFFnXkpyjgZEmuehSoIrUSbIsY9nGLhFxc9ctcYp6HCFAmXYUlwvPC2Ieq9WU5w==
X-Received: by 2002:a05:600c:548a:b0:3b3:1ef2:1d3f with SMTP id iv10-20020a05600c548a00b003b31ef21d3fmr3148938wmb.62.1662667272766;
        Thu, 08 Sep 2022 13:01:12 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id j4-20020adfea44000000b0022a2c600d5csm8454wrn.55.2022.09.08.13.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 13:01:12 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc:     Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Yangtao Li <frank@allwinnertech.com>
Subject: Re: Re: [PATCH 2/3] arm64: dts: allwinner: a100: Add device node for DMA controller
Date:   Thu, 08 Sep 2022 22:01:11 +0200
Message-ID: <2718036.BEx9A2HvPv@kista>
In-Reply-To: <3373468.QJadu78ljV@kista>
References: <20220830020824.62288-1-samuel@sholland.org> <20220830020824.62288-3-samuel@sholland.org> <3373468.QJadu78ljV@kista>
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

Dne torek, 06. september 2022 ob 23:09:38 CEST je Jernej =C5=A0krabec napis=
al(a):
> Dne torek, 30. avgust 2022 ob 04:08:23 CEST je Samuel Holland napisal(a):
> > From: Yangtao Li <frank@allwinnertech.com>
> >=20
> > The A100 SoC has a DMA controller that supports 8 DMA channels
> > to and from various peripherals.
> >=20
> > Add a device node for it.
> >=20
> > Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


