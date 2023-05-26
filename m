Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA245712ECA
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 23:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244075AbjEZVNk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 17:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242710AbjEZVNj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 17:13:39 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA24FBC;
        Fri, 26 May 2023 14:13:38 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-75b17aa343dso83227685a.3;
        Fri, 26 May 2023 14:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685135618; x=1687727618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nQEwU13/Pg08ju9uEIm4sBIkXWSddS4J+3tTkqzDBM=;
        b=Zvq5chWI31qQuLXQBk+CsaRlF1ydkcUhQcOcMYL/aiH/GWx30evVepddJb3nXXlOAT
         RxVis/s6Bjvtbi0vFx8X/8li9+c7hEzjrkSHvQ0Y2fyzeudFBW8fk4Wf9V9T0sb1WS8Q
         xXzbzhJvdNDKAFrAoAhTNazWOf5RmX9VzfhjqhugwFD6cTZyXHBtupeaV9FacWUqfa5Q
         Lu9mEzQnkDnsPKyEA78FL/Q8gfrhTdZPpsa8Dp1l4+5kofTjPKRXtoB5x3NULIbqmj8A
         In1nrj8HKO4H0GPhla6i6ed/m16myi3KpBH6NZz1ghzlkeGMKgrY1Mb7MzS5aZk7sHKN
         7jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685135618; x=1687727618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nQEwU13/Pg08ju9uEIm4sBIkXWSddS4J+3tTkqzDBM=;
        b=INa74d9kY0YIUzUNa1xFspAC/wmPKHiRDk3/JWtVgJSuthOWgBPjkv3nDytFIQ66P7
         S6P66/Ekrdvrzq1YeJjXjLMfJ2PtJj8rx4ueAFjkcXK3LHi3WeXw/fjFmgkJlpLjL87+
         fTUHe9w8PP/ItvdyRWQ/jas9fz1BicDrWZ1AQ9EYmg3XG6x9Q+AsNLXFmTnPSGXBo4E5
         p+o5M8t282OX7x/2w5oDf0pxIxnJfEiIGAq10Z41P9KFM6S72j/iZxS3QfivWHAMQejO
         9H8IILep/yg04wbGoc2SdI4QhqSQrRTAiJUaFTUYcrFtYGkj8isNJhoWMGwZUlD93At+
         pW6A==
X-Gm-Message-State: AC+VfDy3QtkczLyVGYCt1A4GqTYRJ4wcmD8ypql4dqrc8yyznPEKyFhj
        BDPrd1SSJ82TiyBt9RzRFpr8sOMyAxGCKAmMp4U=
X-Google-Smtp-Source: ACHHUZ7bwJP+RBpWEkqWwcqXkHtFdHldZKH6sVjoSOSM3bs7sBiE0mHKHg2xIDybOFzgLwC3wuSQdzUW1phynFtB2oM=
X-Received: by 2002:a05:6214:230b:b0:5cc:277c:b5e with SMTP id
 gc11-20020a056214230b00b005cc277c0b5emr3056128qvb.33.1685135617821; Fri, 26
 May 2023 14:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230525152203.32190-1-Jonathan.Cameron@huawei.com> <20230525152203.32190-5-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230525152203.32190-5-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 27 May 2023 00:13:01 +0300
Message-ID: <CAHp75Vcg+FxXS3-VQ2KDVAo-ygO_c2ZG5JADCS0xpxNw4qvovA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/6] i2c: aspeed: Set the fwnode for the adap->dev
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Niyas Sait <niyas.sait@linaro.org>,
        Klaus Jensen <its@irrelevant.dk>,
        Andy Shevchenko <andy@kernel.org>, linux-acpi@vger.kernel.org,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Matt Johnston <matt@codeconstruct.com.au>,
        Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>,
        linux-cxl@vger.kernel.org, linuxarm@huawei.com,
        "Viacheslav A . Dubeyko" <viacheslav.dubeyko@bytedance.com>
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

On Thu, May 25, 2023 at 6:24=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> This is needed for the bus matching used for ACPI based
> i2c client registration.

...

> +       device_set_node(&bus->adap.dev, dev_fwnode(&pdev->dev));

Please, remove this
https://elixir.bootlin.com/linux/v6.4-rc1/source/drivers/i2c/busses/i2c-asp=
eed.c#L1029

at the same time.

>         ret =3D i2c_add_adapter(&bus->adap);
>         if (ret < 0)
>                 return ret;

--=20
With Best Regards,
Andy Shevchenko
