Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52D0274D11
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 01:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgIVXFj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Sep 2020 19:05:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:58106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIVXFj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 22 Sep 2020 19:05:39 -0400
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C4582085B
        for <linux-i2c@vger.kernel.org>; Tue, 22 Sep 2020 23:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600815939;
        bh=KdyH5PdkW6akKxxRP/M2ZEuzgfDMoyfgST4hxH5MDFg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S01WyCf/FYbEJXrwRAQ8thW0grsDaGa0G4TxiqbXm9kOuOfzJ8at4jIr4F3hiqQcN
         Yboz0D/ggRpj5NrQb5o2AIZ6f3Wb5dF2xzHhOFlXnamyKTruA3L5QQXCxCHyc6kwwa
         EQ9gliuDOAAar7FPy8FuDI4w1UTIn62hKpmQmRow=
Received: by mail-oi1-f172.google.com with SMTP id n2so22914727oij.1
        for <linux-i2c@vger.kernel.org>; Tue, 22 Sep 2020 16:05:39 -0700 (PDT)
X-Gm-Message-State: AOAM5331I64hW0wPYWMTAEsp0Pke8OcIaiaotJiv8FKE51Y695vlMq1j
        IgUW4oPQFICtBELwCgdVfBMlXzaL07W4YPLhcg==
X-Google-Smtp-Source: ABdhPJwq0U8i0DUO9N/aSyFSlQVRRkcGrk53k1IoYs+2gnhOSInYECowY0kfO7+hdNpsuMC6Ivlz8x7zhMyzfxrfL8k=
X-Received: by 2002:aca:4d58:: with SMTP id a85mr4152212oib.147.1600815938664;
 Tue, 22 Sep 2020 16:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1600804577.git.kblaiech@mellanox.com> <cce96d20e0bb258ad84c6ed52c49b957f0fa3452.1600804577.git.kblaiech@mellanox.com>
In-Reply-To: <cce96d20e0bb258ad84c6ed52c49b957f0fa3452.1600804577.git.kblaiech@mellanox.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 22 Sep 2020 17:05:27 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+-ZzOiS3CpVCScBmR2a8ZXqg9PbGcXviJ-QP34t41oVQ@mail.gmail.com>
Message-ID: <CAL_Jsq+-ZzOiS3CpVCScBmR2a8ZXqg9PbGcXviJ-QP34t41oVQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] dt-bindings: i2c: I2C binding for Mellanox
 BlueField SoC
To:     Khalil Blaiech <kblaiech@nvidia.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 22, 2020 at 4:49 PM Khalil Blaiech <kblaiech@nvidia.com> wrote:
>
> From: Khalil Blaiech <kblaiech@mellanox.com>

Use scripts/get_maintainers.pl and send to the right lists/people.
Specifically, this needs to go to the DT list to get in my queue.

>
> Add device tree bindings documentation for Mellanox BlueField
> I2C SMBus controller.
>
> Signed-off-by: Khalil Blaiech <kblaiech@mellanox.com>
> ---
> v5->v6:
>         - Adding description of an extra resource to be
>         consistent with new BlueField-2 SoCs.
>         - Adding an additional example of device instance.
> v3->v4:
>         - Re-ordering of the property descriptions.
>         - Removing useless register addresses from the
>         resource description.
>         - Definition of default clock-frequency value.
>         - Fixing format issues; removing spaces.
>         - Removing "aliases" from Example section.
>         - Renaming device instance node in Example section.
> v2->v3:
>         - Removing shared resources from the controller
>         instance.
>         - Updating the 'compatible' property and support the
>         second generation of the Mellanox BlueField SoC.
>         - Fixing file format; replacing spaces with tabs.
> v1->v2:
>         - Enumeration of the device resources.
>         - Updating the 'compatible' property to make it less
>         generic.
>         - Removing the 'bus' index property and replace it with
>         standard approach to read the bus identifier.
>         - Getting rid of the 'profile' property.
>         - Using 'clock-frequency' property instead of 'bus-freq'.
>         - Convertion of the clock frequency from KHz to Hz.
>         - Removing useless examples.
> ---
>  .../devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/mellanox,i2c-mlxbf.txt

Sorry, but DT bindings are now in DT schema format.

Rob
