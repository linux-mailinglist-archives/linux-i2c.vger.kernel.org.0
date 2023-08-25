Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAEEE7891FD
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Aug 2023 00:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjHYWxB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Aug 2023 18:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbjHYWwx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 25 Aug 2023 18:52:53 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7A0199F
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 15:52:52 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-58d40c2debeso16888287b3.2
        for <linux-i2c@vger.kernel.org>; Fri, 25 Aug 2023 15:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693003971; x=1693608771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xMtqDbKxEwCzgnyNbVs2sMz5QqO99bNAeKAJBAO7ac=;
        b=owun0nYHfvLTp02HwjgYJCJKKexvJCKZ8eEpK/3Pa51NHe3qKpAz3uJHyuIsFuWBSL
         s8prQQagkZbq4lBh+Vb/qil5pGBOTceukyQpNn+SD480sQl3YIzE7pWG+7PyQFayvM+q
         8WhSikpJegzXr+eu+3QY4wqY5bofpo+TgaSgHtXLMN9rXyi934cymNwNw9mcN4psAFWD
         e6f6ePwPhTMBdPi1PLhDF1EKPIiLG7c4lp2fpy4/uNrHVrx6SEkFbm3ooIXfahBbkNiy
         QMesI7AF4+yAjxNNYdcaaCLhrNDpo9mP6TPiCb9GW8Si7JtKP8EohgzrmuPP0u2RCpPh
         cQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693003971; x=1693608771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xMtqDbKxEwCzgnyNbVs2sMz5QqO99bNAeKAJBAO7ac=;
        b=Xzep4pNurNQtpa5RVT6189DzNDEX15BbKgsxa7BkR8w3TlLD6rtSmtkUiZ81oPt7KL
         zeVXetHL5t5bFXnFnhN1ZyMHDcxpQV6lKXpR0kB3FrmjghK5PlZW/vqvoJFmyz5n8b25
         j0GdXrgVlJ1TYO/rpq/49WnQR3TNig983eME4bI3sMw9gNcLFU+zHosUrHrG7x2Vyo1w
         I1T38bRk1khwJmuB1yEA/o8eyz/bsQqQir30UzDXbb0xpqb+tA+ffvhTizeI1n8Jzp0j
         P7Wy7dGhNPZN3rJ1oMyhSXndbU7FoGWJCbm/UhHXIcBAd9O9uZUYgRLPy7R2RZoHfWZs
         lKIA==
X-Gm-Message-State: AOJu0YwmeFoFashW9c25wfrTB5sF//ZKmtTg3At06OC0M1/MWfosUwy5
        ceuIAgzXuCUOb450JP3E1MC7INhd7bdrD4imN1PW3m++u2LUGjTbkxA=
X-Google-Smtp-Source: AGHT+IHXxCQJZoZx8m6MeDZFbASI/p7xgZwgm0CtAj9gMwK5eTjmcUc8UZWXJ+fjed0ebk0B7L3wKLDrCavAO/UrWKw=
X-Received: by 2002:a0d:d4d5:0:b0:579:ec06:eb3d with SMTP id
 w204-20020a0dd4d5000000b00579ec06eb3dmr22215439ywd.21.1693003971054; Fri, 25
 Aug 2023 15:52:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
 <ZOkofUzv6t9lXyN+@shikoro> <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>
In-Reply-To: <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 25 Aug 2023 15:52:39 -0700
Message-ID: <CAKwvOd=1otHgNkJf7wBajDrGmRNQduvR5ie_XgJMPPWT6+n_mQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: pxa: fix clang -Wvoid-pointer-to-enum-cast warning
To:     Justin Stitt <justinstitt@google.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
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

On Fri, Aug 25, 2023 at 3:49=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> On Fri, Aug 25, 2023 at 3:17=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wro=
te:
> >
> >
> > > Note: I think something like this may be more readable:
> > > |     *i2c_types =3D (enum pxa_i2c_types)(uintptr_t)of_id->data;
> > >
> > > Thoughts on this approach against the one present in this patch?
> >
> > On the one hand, I think this is more explicit and, thus, more readable=
.
> > On the other hand, we still have the loss of precision, between the
> > first and the second cast. Which gives it a bit of a "let's hide it
> > somewhat so the compiler will be happy" feeling?
> >
> There was some discussion [1] wherein it was ultimately decided that
> this warning should probably be turned off (contrary to what the title
> of the GitHub issue says).
>
> The state of these patches [2] is in some sort of limbo until I get a
> patch in to disable the warning from W=3D1 (keep in mind GCC doesn't
> even support this specific warning). I want to make the patch but am
> seeking some guidance about what exactly is to be done -- I feel a
> simply _demotion_ from W=3D1 to W=3D2 would suffice as CI robots aren't
> testing w/ that AFAIK.
>
> Nick, do you have anything to add here as we had previously discussed
> this off-list/IRL.

Mostly that we should make -fsanitize=3Denum not totally suck (i.e.
actually do anything for C code, then check for bad conversions from
values that aren't valid enumeration values including truncations),
then disable this warning in favor of folks testing with that
sanitizer enabled.

>
> [1]: https://github.com/ClangBuiltLinux/linux/issues/1910
> [2]: https://lore.kernel.org/all/?q=3Db%3Apointer-to-enum-cast



--=20
Thanks,
~Nick Desaulniers
