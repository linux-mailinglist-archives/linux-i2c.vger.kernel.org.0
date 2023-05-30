Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26176716E41
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 22:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjE3UAb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 16:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjE3UAa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 16:00:30 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53C9102;
        Tue, 30 May 2023 13:00:27 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-75b17b80834so516069185a.1;
        Tue, 30 May 2023 13:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685476827; x=1688068827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6L6n4ZrFF+y1WAMwOt9RGF7/oL5OvT5sm42pUiUq3M=;
        b=i9U85GBNMUysDzBH1wblrVZTAr23E24a6cnxHqFscIPMQtXT5ZG5WRN67TjdT5t1jp
         bIFbod/Mb691LT5tnUMuFl0g57xEkas2SONx2ze2s3M1Zia8JBIpZJOWC4Aj87EGZRMf
         2bPKVhUx5dYAjy+KeRNa0XHeEKYYrZHdkYg1BnbP0WU7MbeNH9xIp+B7fM0uja+QGg8I
         ZUcSdihm6olN2dSrCxCnUmzQ+laEBgOk8mG8NPAwErp39WZEDTOSq1baQxL5ZuchP4/U
         Ccf4d9dIv8qJCWscgrpSUI9WeiVcp63cVsIAffSP794kV013zeX70wc7JWnwZJ9rSAnG
         1g/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685476827; x=1688068827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6L6n4ZrFF+y1WAMwOt9RGF7/oL5OvT5sm42pUiUq3M=;
        b=YYaCak3mpMr6Et+X74DymPgOG1wtzDjTBOfM+GgNZW90FAeMFRapFYnE7zZqDksagt
         aZWFQyHL5u02sBcTl9M/dZ3/UP99RrCxsufupNJj5Ep0eIul3IMg2l0apNzgHy3fASQb
         Ef0iYjtSONFNB+dyx4JJ3klYQHVvJHwjlpmtlPvGZREwleuRI1D4Ob8fW2cWOVb/uWJV
         a//peZm7KccmTR6CKGh9b/sdoXKnP4T1CxQaPqCRsWtip/6qwQ+wZ7lly6sMhibIEQrb
         3Kkd4MhqLuTO5gYjq2/0fknmZVcI7mROBy/QAaKhobeFLD07OuKBRAcg5iu/aWYRz7JR
         MyWQ==
X-Gm-Message-State: AC+VfDxEYAF9mc7qJ4s2LfpHsVw3jgFClmNwn1/jB70mWXERqliSH5OJ
        xCgP5jKcViaxq192KaStlmS7r3O2dNF/E98sJLTujlBsKlA=
X-Google-Smtp-Source: ACHHUZ7S53UnHLzYmLPYrfa5aCNVqAPjmCdtZtJ4MqqTS4Vb76K97+Ei4+5Q84/YA06xjiA2nFbua7CjA2Ha5kdqlY0=
X-Received: by 2002:a05:6214:21a5:b0:626:1893:6266 with SMTP id
 t5-20020a05621421a500b0062618936266mr3777521qvc.9.1685476826906; Tue, 30 May
 2023 13:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230530145601.2592-1-Jonathan.Cameron@huawei.com> <20230530145601.2592-7-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230530145601.2592-7-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 22:59:50 +0300
Message-ID: <CAHp75VcaE2-9ZKgmcZXaA668mLZ8XETcUuUdt2asF4aEzx97gg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/6] HACK: i2c: aspeed: Comment clock out and make
 reset optional
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

On Tue, May 30, 2023 at 5:59=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Needs tidying up - hopefully can do clock right using ongoing
> work from Niyas
> https://linaro.atlassian.net/wiki/spaces/CLIENTPC/pages/28832333867/ACPI+=
Clock+Management

I'm wondering how this will be solved for the cases where the
"clock-frequency" property is used, see below.

> ACPI does not provide an equivalent reset deassert / assert. _RST
> doesn't fit that model, so for now make the reset optional.

...

>  - Left the clock with the hideous hack to keep it obvious that it is
>    a hack given no way for us to get the clk rate on ACPI firmware yet
>    and I don't want to pretend there is.

The workaround in some cases is to read the "clock-frequency"
property, which is standard de facto in several drivers / subsystems.

That said, why not split this patch into two and switch the clock to
be optional and use the above property? Okay, one thing is that this
can collide probably with the generic I2C bus timings, which this
driver uses with a non-standard property name.

--=20
With Best Regards,
Andy Shevchenko
