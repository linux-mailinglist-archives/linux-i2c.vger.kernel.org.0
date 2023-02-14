Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89597695D48
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Feb 2023 09:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbjBNIlR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Feb 2023 03:41:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbjBNIkt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Feb 2023 03:40:49 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCD41E1F1
        for <linux-i2c@vger.kernel.org>; Tue, 14 Feb 2023 00:40:47 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id d40so15001237eda.8
        for <linux-i2c@vger.kernel.org>; Tue, 14 Feb 2023 00:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WnAs+yU5HM/pTqKau3Q0Rq84i+KCVbDi2UQjZa+CL2c=;
        b=IOnDLYY+0Elzxf0TfIWC8EQWsEwrMaCKhhOFqgZjFmVvvhT13q/P/HiGs9wvnJZ6rY
         7d/kHBm9tcw/+43TjyyzuBAzTUIBc7WDAyrdRrC3ftUtZ8MWczpGEDshaveZAoXjYStJ
         wXRHEHer6efEIxgXZwwTkp/fpBxcLZOJ2iGpCZ7R9EwapCFs9GD4u2xTmmBCJiFqlVt1
         nyLBu5KZknvt7j46xhFCUjQKWWVilqd0Uy8PqbPkk0z+LsxTGqKxuR/BiP0c3haHKWLN
         A4GZH590+O+wpdwg1L0i4yq5lnBwdrs5BxldDbuxuQjW6y2ri7YeqaXAnlm2/NIjEuZS
         PgIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnAs+yU5HM/pTqKau3Q0Rq84i+KCVbDi2UQjZa+CL2c=;
        b=jzV5eq86eBMrGGvujSUzNUtLypx3/xw+UkKe04ucHA+BmUcGN4yhxxSWtDMXm7+O1K
         UqqJ6CWY51oyK7Wga1Ad6UxczwVBcVu3/Jk6q2rCCkMvsBwQzJ+nlR3uxGd9EqHHrsxi
         bvQeprCxjlcR9/8JnucfMkSKY4l5MN3Ir7wbr6n1dbltxSUJzZjWKSxHYeC8dPmzUZ73
         nHF8ycM4KJBS4BBfXlk7ajSnXcBjHF1vOk7alqnu1//R48VJNB2rnsd440FC/S+yoJXj
         dOCvcolwPoi3Dx59L9B+vzwUP0XINKc2Zn97OQ3r2+2QR0GyW9kyL9sZo2oW44jFQ4n4
         y4JA==
X-Gm-Message-State: AO0yUKUiECVPPeVPS0vX0ohvO43toWfMRsGl1E008UFhMTnyfrIVSHaS
        A9CCNaQue36KhHLTZg9iTxrJtXPaxCVXGrODLoHHOg==
X-Google-Smtp-Source: AK7set+g3xZ0aQZ4h4txr/u0AcxLMzhWlvoyxDYAQAAQsRyAwaypYXTVYGXV7RZzLBtT6yY5FlYpLbAehTlxnCXUZ34=
X-Received: by 2002:a50:d097:0:b0:4ab:d0dd:ffac with SMTP id
 v23-20020a50d097000000b004abd0ddffacmr716481edd.4.1676364046326; Tue, 14 Feb
 2023 00:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20230209223811.4993-1-mario.limonciello@amd.com> <20230209223811.4993-3-mario.limonciello@amd.com>
In-Reply-To: <20230209223811.4993-3-mario.limonciello@amd.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Tue, 14 Feb 2023 09:40:35 +0100
Message-ID: <CAOtMz3OfGFsiThY7hQYG2oh1=HKg7N56cuA28e+dhB4EtZsz=Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        Lendacky Thomas <Thomas.Lendacky@amd.com>,
        herbert@gondor.apana.org.au,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        John Allen <john.allen@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>, kvm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
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

> The TEE subdriver for CCP, the amdtee driver and the i2c-designware-amdpsp
> drivers all include `psp-sev.h` even though they don't use SEV
> functionality.
>
> Move the definition of `__psp_pa` into a common header to be included
> by all of these drivers.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Jan Dabros <jsd@semihalf.com>
