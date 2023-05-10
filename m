Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC8A6FE54E
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 22:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236375AbjEJUli (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 16:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236538AbjEJUla (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 16:41:30 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6477B65B9
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 13:41:21 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-965d73eb65fso1217287466b.2
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 13:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683751280; x=1686343280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLyFEVV1jGPC3iY0YIn9kdsHioTTS2gGvHxpATDXhkk=;
        b=YpOpHDpzp24vwhDBhE0jfhGgbGNkWSaCX+VkPGlXQoiKh9kr/iWWVZLaAkS/iYSp2i
         0hZIdmk9p8XneA20JGqtXN88Jk+d56rtJBRMZF4mImL0X6SnFFe9qRC5IcWlZUIODvMZ
         uerl9BOwdoTRgFSws6rfYIRlXIMCkgGTRlxixfDyR2/3rq5eFkWbfnNh7aQsG71YOEGX
         Kzptpkc0VRL/aA/ML36B5jaizIoAEKf/zWA1nTu5tI7loJCOV4UFW2sLHxo2J2nzyJWf
         OcXdMVN7AxbL3Dk5rH7N/EZUTCDKco2OEaL+GTI+O8yV1mmN3FKmq77WoZFxZO3+X0Sd
         ZVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683751280; x=1686343280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLyFEVV1jGPC3iY0YIn9kdsHioTTS2gGvHxpATDXhkk=;
        b=Of1sL9QdkC6IvodWPbPZZk8RzAra+G3fWYwZui9/ATN7w86Ahhuf8eqs1p/3fcbzpE
         ymmjqZMQq+JLvNs3QojxUumBj99ZZdDi4UZ7HUu49x2Q9HJZ3krp48t1VcP7tiSFe+tC
         d8weK1k9dPKmTysFChkB7eD0BYS1TJ9Fmbx7kLbTcu8sAM7wrCWJB8ehsq6XVhhaRHTV
         oCltXf2YN3pED2YKgRCEfE6UYLV8wT+h2kHK8eWYsAz6bEeT9lstP/HrG7MhhLCWn3YN
         zsY7x9w179Uq+eD4kgyw7hlfdNj2MVCu4zUtm0VbhX+OwvXawdvmpXR1RRMp3XeS6eln
         85AA==
X-Gm-Message-State: AC+VfDzC3m2w2i87MuwdBfRMv8jdlF3muL+iXyIlq5WzI7fIMqdHhOEk
        vTzl5Yy+AV48/9BR+UY5FaN2b6Ct8hvT5MBmG9C1mzL5Vws=
X-Google-Smtp-Source: ACHHUZ7v3GSnX/C7ZWC2qvI7W7PUdDYNaIEoaMgIEvO25DgY0uOdNHTyHCHKx8YPktTMr2JgvwpsTnDMOynGxZlP8x8=
X-Received: by 2002:a17:907:843:b0:94f:5847:8ac with SMTP id
 ww3-20020a170907084300b0094f584708acmr16386781ejb.51.1683751279630; Wed, 10
 May 2023 13:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-37-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-37-u.kleine-koenig@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 10 May 2023 22:41:08 +0200
Message-ID: <CAFBinCARygtyxpfOv9ELMoBkPPDS=C8nRHU-EqSBAgcBrJvdag@mail.gmail.com>
Subject: Re: [PATCH 36/89] i2c: meson: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Wolfram Sang <wsa@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 8, 2023 at 10:53=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
