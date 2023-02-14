Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05EF5695E04
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Feb 2023 10:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbjBNJFd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Feb 2023 04:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbjBNJFQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Feb 2023 04:05:16 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572E423C4E
        for <linux-i2c@vger.kernel.org>; Tue, 14 Feb 2023 01:04:35 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id lf10so6499983ejc.5
        for <linux-i2c@vger.kernel.org>; Tue, 14 Feb 2023 01:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B1Z3q3DmS5pOVEGCvUAhyPF2bKswWr3oxM1fP44E01g=;
        b=COuUcT2AZRNsgh9PCtbDoV0xwtkZWgtPrWi0j45nCIH+dV8sucbSd3+SYnyQv4y9o3
         ZPe0l/BpBLeKgxQy0xp5VWH853xLbsTOEv81tJbrO84pCQmlx7v+BS0zdsYRHqxJ40p3
         Kn5cCw8AFYmOw4bbCEQkoGam0kTsWm3qNgrNUanOF2uhZh8kTeND61lGxf6LKSpsXc2t
         HsgjbLGYP2p5n2Rfms1o7UmPcg3FWOTRzvThW3dFRzqN+rhylkaXtiQCsfhzieKSmCxa
         zQIV2f3AFobTga5xgdf/wvs1v3Ps1qEoWML/t8QGmVcGiTK/bNuzbjIdE4RjJYYwfBga
         TPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1Z3q3DmS5pOVEGCvUAhyPF2bKswWr3oxM1fP44E01g=;
        b=RCXizeu9Gyc1p2RZBLpfvkouSFbzn8s3Rp3zL+XDxNowhCKpUIB+ttJ/hFSTcUPdK3
         WMWfnAUJTPK3YN+hF4XS72GMxncgqu51qnhrbM8AGr7ugTy1HX7+89KtyhS6UhsK3gZV
         uORKmhebp1qZYVtuUhEUEeeQlNvsr/bS8qpmh6C7BwRJjDFOlOJttB6GeiR75cykapXe
         d0aoqCeHKPEAlW7iU35mlsqdURAztj7TIw77/k5pv5GKOgLVK66VlyvkXXiMsLDbCaFx
         9G1poM1ngyU2GM0Q8wMSF6Ol8rNqspyZmGU0VvntjIQa5HgTiYT2R/IT5AvmY2vdwfhx
         SruA==
X-Gm-Message-State: AO0yUKWSB8AX4WbOwtuPIXH/ieBi33x6LP09RRu3dxJNkbr8MRYihMxl
        nBLYnT5cYMjABF8XOcg7ue51IHUoZ8/TLaVTBBLn270013pTm/6q
X-Google-Smtp-Source: AK7set+hnsT1pAPi2MI7vrdiN/w8ZaWDcCTCHsqz2LQt0+BtAA2hKUW/X8H+N/bzrjH9fJpgD+558039XefVrYatVD0=
X-Received: by 2002:a17:906:1696:b0:8b1:2fff:8689 with SMTP id
 s22-20020a170906169600b008b12fff8689mr630834ejd.6.1676365470122; Tue, 14 Feb
 2023 01:04:30 -0800 (PST)
MIME-Version: 1.0
References: <20230209223811.4993-1-mario.limonciello@amd.com> <20230209223811.4993-4-mario.limonciello@amd.com>
In-Reply-To: <20230209223811.4993-4-mario.limonciello@amd.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Tue, 14 Feb 2023 10:04:18 +0100
Message-ID: <CAOtMz3PuzpcrqQb-L9kzY1be4xwhp72fqNqSWnRvAE0Nd4d3qQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] crypto: ccp: Move some PSP mailbox bit definitions
 into common header
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        Lendacky Thomas <Thomas.Lendacky@amd.com>,
        herbert@gondor.apana.org.au, John Allen <john.allen@amd.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

(...)
> @@ -99,7 +93,7 @@ static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
>
>         tmp = readl(&mbox->cmd_fields);
>
> -       return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
> +       return FIELD_GET(PSP_CMDRESP_RECOVERY, tmp);
>  }
>
>  static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
> @@ -107,7 +101,7 @@ static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
>         u32 tmp, expected;
>
>         /* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
> -       expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
> +       expected = FIELD_PREP(PSP_CMDRESP_RESP, 1);

What's the meaning of "PSP_CMDRESP_RESP"? I see that this new macro
name is currently used by other drivers, but in my opinion "READY" is
more descriptive. (It is also aligned to the comment above this line.)
