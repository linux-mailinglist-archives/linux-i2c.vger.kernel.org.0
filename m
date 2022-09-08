Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02FE35B2755
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Sep 2022 22:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbiIHUBK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Sep 2022 16:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiIHUBG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Sep 2022 16:01:06 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D262FDBAF;
        Thu,  8 Sep 2022 13:01:04 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id c2-20020a1c3502000000b003b2973dafb7so2599306wma.2;
        Thu, 08 Sep 2022 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=0ab0C3Pt3y+AUtGAmk+cGrgQVzgDrXyFcmGY9LIPg7I=;
        b=DE7ZxcwuTdu0khBFNHcr5Sc7L4fS7iVOBLTIvKCsgzyQlbNBXmHD9fZKJ/LXb7717t
         BoSkWRPMB8qtpvAyffGQYSKkcy8s9NphwB69i05tQNPEKvLiorY2ycNhuZBJ6dT+kERO
         O3Qjr/1sl+5MdNXrHu4qdApNHrU1GzImPv4lRGm4xkxXjhpDb8Eaz0qVqDsTXfJnsJbe
         9BHIknG9QpqZnmv7CvFxAacbOyhUwRH+6dqkk57ZS5itz8tETJi2gBDc2zpSEhYthSWw
         aMKTMYwh5jAloWEF1IhCrETkdTayr3vNqd88JyTv3bZL7f4G3Byq+ZGYnYrxK+xmg3Q0
         K+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=0ab0C3Pt3y+AUtGAmk+cGrgQVzgDrXyFcmGY9LIPg7I=;
        b=j6fAT0qnuhqZPo9rtWiZwJ8Yrhcy7+5WDxSInaSv0CdgZUYrhW215/UdIFmMqzq61r
         c68qqJwfI/nhj+Znj199DyvG/a8kVNJAXRWKC804CChLcbRhM/mU9DCQTCjpFCpryZGP
         Mr3Pntga3hR34AnVzQF6+o1H9Ax+B+6FAbVMtuApykQf5+eKG+soz68EQq5XMjnhICeV
         loPfTCwPnDa2a8NgsNxMKvJ11nkzokaMDA4yphx6VJvWD7N0r2DTLn00HKuXfEA5YUI7
         CQtt0R+HZMP+EBqsd0XchnUp/XDNhFbDA+glrBo95V9xvvequHZKY3E+D16oS4Z2njWO
         dbcw==
X-Gm-Message-State: ACgBeo0JeqNolWQoIHRbwKBBk+mEd0PuNYuVsK1bu8N/RgpAJKq4PoRw
        0GdEii91YGRXdYawgkczIIg=
X-Google-Smtp-Source: AA6agR4UVng5AUyO+Lb+M/d2q9vC91aXyrkT8ydz2RnziObmJg3cal0aghkmKspPlBplLPOjwPHi/w==
X-Received: by 2002:a05:600c:89a:b0:3a5:4ea9:d5ee with SMTP id l26-20020a05600c089a00b003a54ea9d5eemr3350715wmp.8.1662667262590;
        Thu, 08 Sep 2022 13:01:02 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b003a5b6086381sm4314038wmq.48.2022.09.08.13.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 13:01:02 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc:     Samuel Holland <samuel@sholland.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: Re: [PATCH 3/3] arm64: dts: allwinner: a100: Add I2C DMA requests
Date:   Thu, 08 Sep 2022 22:01:01 +0200
Message-ID: <2079594.OBFZWjSADL@kista>
In-Reply-To: <22775214.6Emhk5qWAg@kista>
References: <20220830020824.62288-1-samuel@sholland.org> <20220830020824.62288-4-samuel@sholland.org> <22775214.6Emhk5qWAg@kista>
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

Dne torek, 06. september 2022 ob 23:11:02 CEST je Jernej =C5=A0krabec napis=
al(a):
> Dne torek, 30. avgust 2022 ob 04:08:24 CEST je Samuel Holland napisal(a):
> > The I2C controllers in the A100 SoC are all connected to the DMA engine.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!

Best regards,
Jernej


