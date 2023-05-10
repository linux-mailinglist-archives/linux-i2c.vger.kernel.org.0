Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B006FE45F
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 21:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236142AbjEJTDz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 15:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbjEJTDy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 15:03:54 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9646E2D63
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 12:03:26 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bceaf07b8so14135668a12.3
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683745402; x=1686337402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUm1RseG4gL1lkYyVQ+0Gcvm9e1117RvbwpOaGA4O7s=;
        b=XPz/s4HTgv63jYJh8z3f7SS/1iAoLoxJtMzBarJSI+t5sOgKgifmZAMtKXWud6JXVZ
         wLCJOLkW/n3ss06Igw+XlIhRQwemvnf18H0mWifAhu4YRO7AvJK3CeReQzb/jRiMN2eZ
         Hs2WYNu5hIAbWMHUtmyiCmbvP6W6ubNR+9V+gaZPdbYyDLFCs5A4UjqAxi+Xc0rZ2Ink
         VXkVCxn7/Az1K1jBItqDqKOD9QL18cMtCemNi6istCKx2DK3OwVMG0R83C06Vu0aUz5j
         +CWXQYnmFTo9jfIo8SjRIkZO12XcyWOdh2kd+lseeFhaySun9TL84b32Hl5PqmDlcJVn
         nHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683745402; x=1686337402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUm1RseG4gL1lkYyVQ+0Gcvm9e1117RvbwpOaGA4O7s=;
        b=bwhXtn8FY5jW3ByiLh62G5z+NNPzc9KbxW5/khOUcaOSsqvdFr+UXLyljmJ2IVZM4k
         ciw8PoWXqWGKn9lJWNYfTZbs6qWYwoAF5olRu5IBP+XpT/GIBIQWMblB6Nu0ii7S8VeG
         EqrG8O/nphsdr599CDgpZ1Tha2WR1aEvIJ0chZwAC4Jw2z72atNiSLLDVAvGYjlthuz+
         y4h+Uv03TtGC8kTQ4GrtzWI6xbAmV+TrdxVIOGzG+qDGmNHxmGv2gWOwOFVV4vhi9UVo
         jKnTHgL7OjeWUUVv4NqqGPJA8vg9/WUdtQUcXu0wB2w6VaVfxG5CqTuGLF7JzJPi1C0+
         FUYw==
X-Gm-Message-State: AC+VfDz66FnK8SRu71cTCWWzfXSyY1HZeOPC8bSSzSdDeoaZUiqRKCkd
        eKN2Z1F3az2YBpySC9g7l98=
X-Google-Smtp-Source: ACHHUZ6BFE4NR5OmqK9DHzA38atpHNyNW6749lGSKxskq0PTDosCWiIzwlxIOkNSaqAx8IVLf5bL5g==
X-Received: by 2002:a05:6402:48f:b0:506:9220:b149 with SMTP id k15-20020a056402048f00b005069220b149mr14073920edv.26.1683745401705;
        Wed, 10 May 2023 12:03:21 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id k23-20020a05640212d700b0050c0b9d31a7sm2185149edx.22.2023.05.10.12.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 12:03:21 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
        Wolfram Sang <wsa@kernel.org>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 71/89] i2c: sun6i-p2wi: Convert to platform remove callback
 returning void
Date:   Wed, 10 May 2023 21:03:19 +0200
Message-ID: <1854054.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230508205306.1474415-72-u.kleine-koenig@pengutronix.de>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-72-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dne ponedeljek, 08. maj 2023 ob 22:52:48 CEST je Uwe Kleine-K=F6nig napisal=
(a):
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


