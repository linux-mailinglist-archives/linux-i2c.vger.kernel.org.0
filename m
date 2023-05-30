Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2591C716DE2
	for <lists+linux-i2c@lfdr.de>; Tue, 30 May 2023 21:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbjE3TqJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 30 May 2023 15:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjE3TqH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 30 May 2023 15:46:07 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B2A3B2;
        Tue, 30 May 2023 12:46:07 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3f805551a19so26202811cf.3;
        Tue, 30 May 2023 12:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685475966; x=1688067966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98iPVLVadzoneKMYXN/slFjkTckG0j77uClaHpnE/jc=;
        b=Bs+m/RVdp8BZq1xWxyc6ua3kgzULnwTnUqMDMei/qYT7McWESwKsiZ+gxPrPqGBcto
         mGKDxozckQo4cwadVb02Hc+Djh0NPo/VnT/jIKxgeMCDSAtjxDs6JIkLKM4qsB+95dam
         m6WlgMte77CiUI3VQyZBsPXK1v6A1612hu+GJlfhe1VfVGHKzWs6mMH5RensdgpAjVr5
         /fVHxKuMSh3j3dPQ5dWYaFS1CSDaPk+c2A/q3juO7I4hVzPvBl0jT27h0qXGrd+OdfIx
         JteMRdLcrGDG9Q1jOfa9uD1PCgBRICXcJMHwnpNSwmK9XcEmK5jP8vskht/0A4QmVgRi
         KEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685475966; x=1688067966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98iPVLVadzoneKMYXN/slFjkTckG0j77uClaHpnE/jc=;
        b=jneZKwx0exjbBsAhvw51V+WXKX9lYLZtcm0lRKEq4Ix5BlXs9b2uwBAwi8D1Q9oFZt
         inmANAk6AbVtP9F1uo1XX01Pe97AjnfgCZa4n/7FsJPH0iC856J2OB7pIFJKvvIvGp2v
         Pem6eLUR+PKdKVH7J4eER9KRR9V02VjdPqomnDVP8wy97ehAVGic4jxvt5ko1RBSHE+T
         B6pg5YxrkUa0sZjtQOsvWtnPvNBn0Q91Tf13xVfoRdq27dtMjM08jMGGz0LmFtAw3gp1
         OFINOcI1tnfEZz+tTDZI5VS5ga/4BPdiaACAUa/QYRj4hk6Q9bVptt8smFKVVPwYNY+I
         JtfA==
X-Gm-Message-State: AC+VfDyRAyOnm6UakT2iZhfGcPa3S3RGzMcmj3DbO6GIdmW5AYeN/zh1
        D4bFexrq8xbYM7qlDSy6mZ8igxMIx9M6t7W6PLpYD0GeiMM=
X-Google-Smtp-Source: ACHHUZ6xIzLDLVObVsAr4UI9e+rM7Ou6Dz2e4PI1lSMkSl/CDaWworF13I8YwCYcamtPQd5ECDsY5zXgHPxejdy6PfU=
X-Received: by 2002:a05:6214:1ccd:b0:621:4669:c806 with SMTP id
 g13-20020a0562141ccd00b006214669c806mr2777737qvd.37.1685475966128; Tue, 30
 May 2023 12:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230530145601.2592-1-Jonathan.Cameron@huawei.com> <20230530145601.2592-3-Jonathan.Cameron@huawei.com>
In-Reply-To: <20230530145601.2592-3-Jonathan.Cameron@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 May 2023 22:45:30 +0300
Message-ID: <CAHp75VdNXtnorvx+aFhkkQZdgArVLuU_0-W-OKUyyarntt6vwA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] i2c: aspeed: Use platform_get_irq() instead of opencoding
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

On Tue, May 30, 2023 at 5:57=E2=80=AFPM Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> A cleanup in it's own right.

its ?

> This has the handy side effect of working for ACPI FW as well
> (unlike fwnode_irq_get() which works for ARM64 but not x86 ACPI)

...

>  #include <linux/of_address.h>

>  #include <linux/of_platform.h>

With your commit message I'm wondering why these are still there. Do
we have some OF calls that are optional and do not affect
functionality (in ACPI case)?


--=20
With Best Regards,
Andy Shevchenko
