Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933BC6AFAA4
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Mar 2023 00:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjCGXmj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Mar 2023 18:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjCGXmh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Mar 2023 18:42:37 -0500
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029BE8F719
        for <linux-i2c@vger.kernel.org>; Tue,  7 Mar 2023 15:42:36 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id l10-20020a17090270ca00b0019caa6e6bd1so8405541plt.2
        for <linux-i2c@vger.kernel.org>; Tue, 07 Mar 2023 15:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678232555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HqzrjtunBCbTiG/9hLGZPz4HpJ6gvwCBlEocXHjYpgc=;
        b=BVf//gG8V71fiiDyfQ8szqCJ4bPgO7DaUm8HJJeelmc7d3Ds9PorlXTBXqfj5tMMNV
         z09vFhbJ4QjN/CU2ZSUhTRHikpPlTSK+EaJVWLb3roygPLeCUV0KXD/Diuh8QkiCadOt
         bH2E45Az1vag7vGPFljLbj5mRe6VAtWdo0Dy+y6ViSvhY8QS7RVt/eV9eyoZMY5sVC1Z
         FlOUGwA08Lc9OOiAuWHNDEcrzin4G8yyIWTF2CWSPuk8EMq7eF01Op8VG46MFFDus/n/
         4wotVknXaiPlF0jq7ZXvMcMpVGXqCNY2+xTzv79y6iXlcNUygElR1376y7sqwAxhwd2j
         ELzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678232555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqzrjtunBCbTiG/9hLGZPz4HpJ6gvwCBlEocXHjYpgc=;
        b=ws7i0WvV+1NcR6uoWnQO39qCYoCax3J7Bwe23Klj5IqkvD3OzwAK0t+Ideb+XsPGu/
         5hYvXrAqy8N1tfl7dLyoN0GWKwfDKNdbf8i06Om7gZONZ4yfNSRPOM35Es7YXhEMRcyT
         CjEmGYvY2K0shIlWj/8r4ndSkNJTLs6izr0ro5UCa9ISrDZEoY9Tppat2BfRzh6inL+S
         rohgEcfY6yPU5UjVSYLsEsXVCNIK22f7CwoWqWsHzmBrhIy2ap20dsERD8ufiOy9y+m8
         q0Uik2UohcMKRb3BipadgHrVY7uTeiTPrmfz8IHhdDGFEUy+yeMd0d8ZnWAbJ1chRbwi
         oeVg==
X-Gm-Message-State: AO0yUKXYU3/dv4h/2v1wX6AzUMWkerwTsdTluz/yjT0js/SWzYTWtq+P
        iyt2qsJLtyyEc69aTxK+tM1ICfvFS5c=
X-Google-Smtp-Source: AK7set8Z3jueSenBo8cEWwdWq3U4Z/X1tE6ANTZZWfxuL+FcDB0ZeH55jX9W6vlqIO+zJdj0BIGfAjJfTe4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:e40e:0:b0:5a8:a56f:1c3a with SMTP id
 r14-20020a62e40e000000b005a8a56f1c3amr9036088pfh.0.1678232555455; Tue, 07 Mar
 2023 15:42:35 -0800 (PST)
Date:   Tue, 7 Mar 2023 15:42:33 -0800
In-Reply-To: <20230303165050.2918-3-mario.limonciello@amd.com>
Mime-Version: 1.0
References: <20230303165050.2918-1-mario.limonciello@amd.com> <20230303165050.2918-3-mario.limonciello@amd.com>
Message-ID: <ZAfL6SK0jMtsAhGv@google.com>
Subject: Re: [PATCH v3 2/9] crypto: ccp: Add a header for multiple drivers to
 use `__psp_pa`
From:   Sean Christopherson <seanjc@google.com>
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     "Jan =?utf-8?B?RMSFYnJvxZs=?=" <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>, Rijo-john.Thomas@amd.com,
        Thomas.Lendacky@amd.com, herbert@gondor.apana.org.au,
        Paolo Bonzini <pbonzini@redhat.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        John Allen <john.allen@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Mar 03, 2023, Mario Limonciello wrote:
> The TEE subdriver for CCP, the amdtee driver and the i2c-designware-amdpsp
> drivers all include `psp-sev.h` even though they don't use SEV
> functionality.
> 
> Move the definition of `__psp_pa` into a common header to be included
> by all of these drivers.
> 
> Reviewed-by: Jan Dabros <jsd@semihalf.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com> # For the drivers/i2c/busses/i2c-designware-amdpsp.c
> Acked-by: Sumit Garg <sumit.garg@linaro.org> # For TEE subsystem bits
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com> # KVM
