Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C77F27891F5
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Aug 2023 00:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbjHYWuS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 18:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjHYWtq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 18:49:46 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE6B269F
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 15:49:44 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5298e43bb67so2996544a12.1
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 15:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693003783; x=1693608583;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sgnDPAQajX7It4uxeSwlO6Mx1CoEKJV2g+PY/BJzjg=;
        b=bBS+7cd8FRW4dzJtMySyt6XKf2oHudUYri5wtnnrsG/BJyWOo70aIBEpTMg+AhyCCj
         fovvl5xtG3I7niLsZ37kZomMSo0nqgG5zCk74z650eMv6FvtGK1oD/imt0x94ArqXpVb
         yRThpuRNk0VzYy7oDomGOHPqi6LHndq/lKCBwSN6vs8V7eCD23p2uv/vBd66SxYUnz6W
         kKzU3aSPZTQywt5gR1QrodffCUB9SMQbnQS/YYEolPLm/RYRK61NP+thaaDNejqQf3rA
         obxiB3GHEMGaPz1mI40Ov+K+/Nl3NE1NBUzTHrcOACIYVFQIzNWhkCborZRFbZm9mJ02
         KJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693003783; x=1693608583;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sgnDPAQajX7It4uxeSwlO6Mx1CoEKJV2g+PY/BJzjg=;
        b=AlFfiS4GcCS95aKT2hkWw1HfuqjKP0dEPsTPyl2yPsTeqskjJppQAl+SdT3eTthiPt
         zI9DibR48MRCjLwJpBtUGyqgwasIUlUY/I+pHFhV5PwMxHWPDYo0gWRHSj2RtgwN940Z
         n5RZVHs9+4JUvdS1ymVNE1REY75veSq5EZXc/UnwP0Rcxf1vOZFY3PQN1nFr8eI/SjFY
         NLSaV4/goV1TwiL/r89kVGGu+22GZ2cg+oNvWF2cr9rqCqMc/+Kir19T6TBWv9ZLy76g
         libjqcujp9P1xJZhYjZeml8dKX/YpM1dnZW3ocHhz+NdFDZVDFK0W9BBIoOV5QBOWa4W
         HrqQ==
X-Gm-Message-State: AOJu0YxAhYfbwzvP22tq8U/Q3Q8ty94Rb+FV804lSgeNfYoQ0aDg5G3s
        d+mfMfjqy/MALOCxON2llOwCWkkuSfLqqJwhtD+j7g==
X-Google-Smtp-Source: AGHT+IFCPH5X2LJbcf8xckkFkpHcRZwEMJ7xl5Uq2e6i8yeRqoFo9bvHzvfBM0xmlpCS5MhJ9oOC0tLsXk0HsrzsF8U=
X-Received: by 2002:aa7:cf09:0:b0:523:37f0:2d12 with SMTP id
 a9-20020aa7cf09000000b0052337f02d12mr22310855edy.17.1693003782879; Fri, 25
 Aug 2023 15:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
 <ZOkofUzv6t9lXyN+@shikoro>
In-Reply-To: <ZOkofUzv6t9lXyN+@shikoro>
From:   Justin Stitt <justinstitt@google.com>
Date:   Fri, 25 Aug 2023 15:49:31 -0700
Message-ID: <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>
Subject: Re: [PATCH] i2c: pxa: fix clang -Wvoid-pointer-to-enum-cast warning
To:     Wolfram Sang <wsa@kernel.org>,
        Justin Stitt <justinstitt@google.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Aug 25, 2023 at 3:17=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
>
>
> > Note: I think something like this may be more readable:
> > |     *i2c_types =3D (enum pxa_i2c_types)(uintptr_t)of_id->data;
> >
> > Thoughts on this approach against the one present in this patch?
>
> On the one hand, I think this is more explicit and, thus, more readable.
> On the other hand, we still have the loss of precision, between the
> first and the second cast. Which gives it a bit of a "let's hide it
> somewhat so the compiler will be happy" feeling?
>
There was some discussion [1] wherein it was ultimately decided that
this warning should probably be turned off (contrary to what the title
of the GitHub issue says).

The state of these patches [2] is in some sort of limbo until I get a
patch in to disable the warning from W=3D1 (keep in mind GCC doesn't
even support this specific warning). I want to make the patch but am
seeking some guidance about what exactly is to be done -- I feel a
simply _demotion_ from W=3D1 to W=3D2 would suffice as CI robots aren't
testing w/ that AFAIK.

Nick, do you have anything to add here as we had previously discussed
this off-list/IRL.

[1]: https://github.com/ClangBuiltLinux/linux/issues/1910
[2]: https://lore.kernel.org/all/?q=3Db%3Apointer-to-enum-cast
