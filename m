Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B06A712EB3
	for <lists+linux-i2c@lfdr.de>; Fri, 26 May 2023 23:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243990AbjEZVHQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 May 2023 17:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbjEZVHM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 May 2023 17:07:12 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F78BB;
        Fri, 26 May 2023 14:07:11 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-75ca95cd9b1so83948385a.0;
        Fri, 26 May 2023 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685135230; x=1687727230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/iryZHo7JCguZijSthrxngLKIvrP3rRTiFN/OymUFU=;
        b=Gto7IeIVXiudCsE5TqI7ngpb95YGyfzCB+FTZ6qwuuqAXP2MIdD8rDJS6Id0zX+daN
         aB/jxZcN6BPfr4Sc0AGEKJ+VbR9LzpdIyBQ0ZtC2x5RT0WPKlBO7KwOlM5JUfzerfElf
         k4tm1YQ3yBREqiDm0CeBj73900pGneCFPEbmqkdhynIuhNe73uZOhv/W0x1XzaVbSsaM
         rd3+s1WrQ/Ad58izNL3AlvrO7jZWBi3mOHtHF0/ZlgzLXdM8dL6boOgs6fqpgyGDevmk
         zl9VSMZkPK09rzw/K1difYw0ijTKeX3EVo+coZ1jmOQXVbGCRjv80KGWRAHozsRLRx0u
         SskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685135230; x=1687727230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/iryZHo7JCguZijSthrxngLKIvrP3rRTiFN/OymUFU=;
        b=NVk/wTvSM10wSIJJXtFLKReHvGwLJrf2wjdVVT/Bkwep84j21yVRG2WuIJlCP068k0
         FXN+Y3alfMKqwhhBj1nP5buc5W2PpJ1ouKX+bqaNgjMuWoc7Tc+cuQVRN3VB/43aLobq
         bb0/5aFPNlLlSOTYLdf0FhQ4rGkGTDvtAAI3pc6lvjuPAeM2IK47lIUSbqWsWDWP1c9I
         0VtZVbiCjIl9Uy4+ZyG9H0pffx4j9V4ZTWJvlzUE3BPkiAfQCzO5r53kmsGRmy3vR5Ku
         k2NVXas6cIKpCcpC7emsVgFyQO0sOQtRZIlBhIhUjYwQqkxGZU20U2NTHBu4vvNae/+z
         Uf4w==
X-Gm-Message-State: AC+VfDwBEfXsLNTG8LO4C+d13RwctX8LCTpIN189fAy/pH/Gfa6fFy+v
        Z+4OcXe/RnBRD159q8o4SUvH5Ghb1crczHtzJeQ=
X-Google-Smtp-Source: ACHHUZ4BQOxeyyrFeKiUbRt4bEQ47/vYv0+dROSRiAHFg4n/bmQhNHTJC/i2UuqMt3HdISrd/OvoK43LMvIp8yORzNw=
X-Received: by 2002:a05:6214:258f:b0:61a:43f0:7308 with SMTP id
 fq15-20020a056214258f00b0061a43f07308mr3064728qvb.27.1685135230140; Fri, 26
 May 2023 14:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230525152203.32190-1-Jonathan.Cameron@huawei.com> <20230525152203.32190-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230525152203.32190-3-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 27 May 2023 00:06:33 +0300
Message-ID: <CAHp75VenMYPPvVg3YhhLPtvbkJA6CF_ovrk-L+nLjP-DiMZfhw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] i2c: aspeed: Use platform_get_irq() instead of opencoding
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 25, 2023 at 6:23=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> A cleanup in it's own right.

its ?

> This has the handy side effect of working for ACPI FW as well
> (unlike fwnode_irq_get() which works for ARM64 but not x86 ACPI)

...

> -       irq =3D irq_of_parse_and_map(pdev->dev.of_node, 0);
> +       irq =3D platform_get_irq(pdev, 0);

It makes sense now not to even try a wrong IRQ, i.e.

  if (irq < 0)
    return irq;

+ blank line here.

>         ret =3D devm_request_irq(&pdev->dev, irq, aspeed_i2c_bus_irq,
>                                0, dev_name(&pdev->dev), bus);
>         if (ret < 0)


--=20
With Best Regards,
Andy Shevchenko
