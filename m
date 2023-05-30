Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67928716E0B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 21:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbjE3Tu5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 15:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbjE3Tu4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 15:50:56 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBABD9;
        Tue, 30 May 2023 12:50:49 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-3f6b2af4558so24444241cf.1;
        Tue, 30 May 2023 12:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685476248; x=1688068248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXjN9PRF0JVsBQA3sSRY5GwI7nakQdzi1PnsvFjrYqM=;
        b=dJG4SW6q+btsccPXWgVyBA2wU9LmiDckjB80PzRCy5c0+X0zRksexJwJAJMz1SkSE6
         j2rQ664pEhP2u2FmYQchAwk853f0psHayZoOv8izLVXgvDOvwOUcdHI8gAo2DCttZScn
         fnJNkH7UPFNpAtwhPloiOHz/nJQ4c1GrpEMjM7IjmDcFfPrgJjCsKSmyzn+f7XQn/C1C
         0y7ev5Jw3yMPfydqUKB2ov7hFxQU2AacZ30YbzcUfzHs2y9seBhBkLn3azFsFhfLWAWe
         x6JE/Slx6Ntvgc+MNiiFm8l+UfnyQv09Jh2b4OxqgbYtKoUQQS9bpPw7XP/v25A+THAI
         njNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685476248; x=1688068248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXjN9PRF0JVsBQA3sSRY5GwI7nakQdzi1PnsvFjrYqM=;
        b=lihl1lrHsNoz/2RiOJTLJjhXnUo14MaprUqvOJaas+oujX+Vi6/B8BeqBlbwjBoObb
         aCNtqGNQE/u3vodIwZ38Tut8ScUgPUhRenjmJEccwbM8Pw+52iXhFryYmoWl9kgeq7aE
         NoUoMwwDBQ4/ytWpAPGV8z3PGgP9b0AwTZqaqZh6LPD46gkwynFdLjLOt6Ph/IxWenLe
         7tPVAjJLK2pCWFtgAJM5C/ssK/aZF6N92WqjP3VujmkGv4z3zzimCOi4P03Z9G7dNLPK
         wWNXyH8kYhHLbrDYd2HRcuCyxqQjg6mVAsfCLibSm/+dzUz3Z0aAI0k8lTFjMRDNRNeG
         EAUg==
X-Gm-Message-State: AC+VfDySaARXrdnZO3T0ZASw0rWoQGu2d0XvfN8cM+x1qdemcw0MLOKB
        LaL6UkwUevS3znuXUkrWD0qvMmge8Mtz4he8IrA=
X-Google-Smtp-Source: ACHHUZ6KYhK91R4BVPuE9IdyLAE2nsMPM/uycxmxt3LW0NeCt7s+cFLlZlYu2taTYdaOeIpSj2HrxRZWbX8Xra03Tfo=
X-Received: by 2002:a05:6214:aca:b0:626:1db8:de41 with SMTP id
 g10-20020a0562140aca00b006261db8de41mr4356695qvi.25.1685476248578; Tue, 30
 May 2023 12:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230530145601.2592-1-Jonathan.Cameron@huawei.com> <20230530145601.2592-5-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230530145601.2592-5-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 22:50:12 +0300
Message-ID: <CAHp75VcjXFOG7ijEDgO7qdJiNPsBkuv_STH9e2GcSbPQDm40Mw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/6] i2c: aspeed: switch to generic fw properties.
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

On Tue, May 30, 2023 at 5:58=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> Moving over to generic firmware properties allows this driver to
> get closer to working out of the box with both device tree and
> other firmware options, such as ACPI via PRP0001.
>
> Tested only via QEMU emulation.

...

> -#include <linux/of_address.h>
> -#include <linux/of_platform.h>

> +#include <linux/property.h>

Ah, stupid me. You can discard the previous question (in one of the
previous emails).

...

> +       bus->get_clk_reg_val =3D (u32 (*)(struct device *, u32))
> +               device_get_match_data(&pdev->dev);

Why not typedef this function and use it here and there?

--=20
With Best Regards,
Andy Shevchenko
