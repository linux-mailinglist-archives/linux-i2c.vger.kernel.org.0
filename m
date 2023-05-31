Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4467188C2
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 19:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbjEaRrW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 13:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjEaRrU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 13:47:20 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44EB2136;
        Wed, 31 May 2023 10:47:19 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6262d8688baso312266d6.1;
        Wed, 31 May 2023 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685555238; x=1688147238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5tZ4/mNa6d+ma98/1tPD3ntqg9GXUy7bJJNj95+GwY=;
        b=abMT0/cSeFGxJ65TCxQiqQMmfEu9heDFlQ3o+BPk3ohi6UwNpIZeOTbkHi40ftX/K4
         Furw3H1RPRiIthoi90tiArM2uXqG8wfZg33tgZ49Hb5ibNm94W4O+JQsVsmzMCU7gyEM
         /ENIYpB45jqyTxx0IAgPEwA3rI5Zwi5Tc4W8KRzcaUJxsapAb0ZEk8dBLIlwo3PPfXPS
         /AG6qGEQqBbUY/LFvuI2R1QjELnO0ivge4fGdBK+YjtTaYlwGbPebtrOzvavJ94mzxGj
         SG9OWRCkW9L2UVTQbEpWfjZqTSSYs1icAA+VVG8I6km6ObjAtXZ8+8ONoJUyr+pNJa8B
         EYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685555238; x=1688147238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5tZ4/mNa6d+ma98/1tPD3ntqg9GXUy7bJJNj95+GwY=;
        b=gz/lC4/KnvR1WhjJm4ojT256/MAbq5zkvcQ5X9uvyrhu6M5joG9JvTeCY23OEkGYMm
         9Ay1YgsrBNiXq3t9tf+Yj2Fon4Yi1U+fOx9X0hxNjjnUjZW05Unkw3ppIdVXhUZvfv3F
         V2nFdmpCrcBpxevxAAsQ4knYBq5cNCFhs2LOKTqFrsWGipbEb0DBAdDRi9fAavBhxuz5
         zAGq6rI8DGPPgsZNsySflCTOE4NAhzhqu8pVzufRtMO8lylwzDQjOXRjnCVlZOAJjCj4
         yfqAYIctBm7Gv1Thfe0rv1Qj+qIP9YSHNBj0F5ZPMijucBQSSnGTVIhJEfvoBTZeYMJH
         7oSg==
X-Gm-Message-State: AC+VfDyYgORwgJWIKuiloht8Mj2QTIO84A0x3WErSSHaw39UJE8rl9es
        8IPS2eOMb/cSYW3UyAq/LvuWoeXFN5f90vfcxWoLqZVH
X-Google-Smtp-Source: ACHHUZ4KnDs+7tv5NjnsuBFAy8ROCocNzgZTMjlPNW2WUNcG627cRoeIaGpeVUJRHbJgPBKvEuvqWKvV+IjbhZSAQbM=
X-Received: by 2002:ad4:5c88:0:b0:626:3a98:968 with SMTP id
 o8-20020ad45c88000000b006263a980968mr7205511qvh.32.1685555238311; Wed, 31 May
 2023 10:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230531100600.13543-1-Jonathan.Cameron@huawei.com> <20230531100600.13543-7-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230531100600.13543-7-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 May 2023 20:46:42 +0300
Message-ID: <CAHp75Vctpy_4yoaCWETxF_Ui7uVLzgUkfL_WqEgZdh=baYX5Uw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/7] i2c: aspeed: Set the fwnode for the adap->dev
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

On Wed, May 31, 2023 at 1:09=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> This is needed for the bus matching used for ACPI based
> i2c client registration.

Btw, this patch like maybe others (e.g., patch 1) can be sent already
as non-RFC and applied independently on the goal of the entire series.

--=20
With Best Regards,
Andy Shevchenko
