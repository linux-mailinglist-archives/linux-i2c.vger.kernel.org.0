Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C37D5E74A8
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 09:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiIWHQV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Sep 2022 03:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiIWHQU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Sep 2022 03:16:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DADCC12A48C;
        Fri, 23 Sep 2022 00:16:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7D8FFB826AD;
        Fri, 23 Sep 2022 07:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D24BC433C1;
        Fri, 23 Sep 2022 07:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663917377;
        bh=0tcsWPFJuJ+JlL9d8TQDqM0wY+okAAqCVZ/OiEHw45U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rJG+DfLqmZdouOHJ0mysxHFYu9iKaOMz+wi8FJ1+njiOCgY5Cu0YGiyZoyiB9QhtI
         HXg2Sp6wWoIiz6uMNMWPEg2SkCZOm+03bDA7NR823IlLzH0fEDmQIIdZ3GIe8dgzD3
         Z8kC66bDBhI8gPeXMzfDwGblQmk8WAWtAfhehVJaK/ViGXB7AarOoKGl5UqzcQd2SQ
         pf4iDM5wgW3AQJPqptysvxC45F8QTWmIxVTKvbi2KYfnVRStxUCtR1rzpy8u0YiGk7
         4JqRl2pMbn4DCfIXO/2PColmMmz9Jd69BxXm4OnBIiCmtlSbZcRkNEobUiiY09+b9P
         ce/cj+iA7JdEw==
Received: by mail-vs1-f49.google.com with SMTP id h1so12735660vsr.11;
        Fri, 23 Sep 2022 00:16:16 -0700 (PDT)
X-Gm-Message-State: ACrzQf1TjafK/rqWwr4b8Gb0ku1NuhEONKCQaxmABlf/V49hCZ3QUltR
        XJkkRKXEL/aEEidROiMY5vYu3a1I9uv37TeWweY=
X-Google-Smtp-Source: AMsMyM5y4VoSXLt6JYBz789A2bqg2P0a6bGsOz1xz6qwcf9P77Rub6RQld7QuxGsmB/tk/HzZ5dgYTB4ePorEu2q/rM=
X-Received: by 2002:a05:6102:1481:b0:39a:67f5:3096 with SMTP id
 d1-20020a056102148100b0039a67f53096mr2762228vsv.70.1663917375962; Fri, 23 Sep
 2022 00:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663835855.git.zhoubinbin@loongson.cn> <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
 <YyxTwl7mos/hARWm@black.fi.intel.com>
In-Reply-To: <YyxTwl7mos/hARWm@black.fi.intel.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Fri, 23 Sep 2022 15:16:03 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4waMMDnctjkC61P6eurLuPfhs1+UP1vLc-XwHXieEhgQ@mail.gmail.com>
Message-ID: <CAAhV-H4waMMDnctjkC61P6eurLuPfhs1+UP1vLc-XwHXieEhgQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] i2c: core: Pick i2c bus number from ACPI if present
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi, Mika,

On Thu, Sep 22, 2022 at 8:23 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Thu, Sep 22, 2022 at 07:39:54PM +0800, Binbin Zhou wrote:
> > Under LoongARCH based on ACPI(such as Loongson-3A + LS7A), the ls2x i2c
> > driver obtains the i2c bus number from ACPI table.
>
> Why this is needed? The I2CSerialBusV2() resource should be enough to
> identify the adapter, and I don't see why static number would be needed
> for anything?
>
In later patches we will add LS7A i2c driver, this driver is shared by
MIPS-based Loongson-3A4000 system (use FDT) and LoongArch-based
Loongson-3A5000 system (use ACPI).

FDT systems support static bus numbers, so we want to do the same
thing on ACPI systems. I think keep this consistency can make user
feel better


Huacai
