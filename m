Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7C274A2E1
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 19:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbjGFRNJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 13:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbjGFRNJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 13:13:09 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA581BDB
        for <linux-i2c@vger.kernel.org>; Thu,  6 Jul 2023 10:13:07 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-bacf685150cso1019267276.3
        for <linux-i2c@vger.kernel.org>; Thu, 06 Jul 2023 10:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688663587; x=1691255587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkHV8J2K1jXicOIdElQgmue9tb3U/Eoe6EmaK8XyOg0=;
        b=zxSiekYPLmMkEiq69rNMutiYid71TNUMfonzBh1wlhNUdmSrt19Oaf5cqUy3++YGMN
         gmAbRHZNgHO8QCxBOKa8B1eBVl0qABPZDkgsqU75TLMly7qhRddAJv2OOcSpmbCZS21l
         fTwPZmC8Ch8JegJoS/+jYzV2a4vwRD5Tn+kl0UhI4GlbtWVvzTf5FLsWWAU2ikWZzynW
         PRlN/LiAl2K367ba6x+ILBHCMQwMERtCFqRy4PPY+rky3geB4UaD2zOvgSoWHvJqzOEo
         zZ0YXN7v95tOmTxIgDGWO+R6V5XvIMVEW9N1WSLalIQn8bihHoe9jQ4pa7IsGTIFPZNw
         87uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688663587; x=1691255587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkHV8J2K1jXicOIdElQgmue9tb3U/Eoe6EmaK8XyOg0=;
        b=MLBTHTpt+7rxMfOM9/YvSraJQxAnfTbbek7Z8a/NCXDbOxhszuc1bI/V7+IB4Fanmh
         TkPhLZT4jOPgDcOnTvSoYtYAFftp6T72k4ANT225Fv3Jn1nd4ZtwkVKQw5x3RiaQXXgu
         TraFVfSYQ06xgHOCqwPqpHc5DatkYLCyJdAtAhl0CUTXl5P6dtMTviL7+2eXK9p99vHR
         bv5vO+Fz0jQb/GoMjZBUct8L3cawGYZWUJk6HaxOwQEyHc5wSzouTbbtg0H3tjPlifLK
         XvOtRMECqxaoH+gh1iJnAxqOa5EB20fMuZU6jiMAGPf0i5eT+ZrzSqYY8gw2U+tN3aq+
         qoQQ==
X-Gm-Message-State: ABy/qLa56wIkxbyi7wVlzxBN/hfsBnFasngejh4GsfIOGWfwOhFAaMiL
        r6cdJf30U9uYYLqCsbMQFFrhGDB1VYGkVh9idseQgw==
X-Google-Smtp-Source: APBJJlHJwE176QvJtLImE7riPWrf4xFLg6FiTPXkitnF57oChOJWybyijgN7tHtVkAnIZ7J+Kp9Wa5R54YLSDfJ8TFw=
X-Received: by 2002:a25:854a:0:b0:bca:c726:157c with SMTP id
 f10-20020a25854a000000b00bcac726157cmr2116376ybn.33.1688663586878; Thu, 06
 Jul 2023 10:13:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230705204314.89800-1-paul@crapouillou.net> <20230705204314.89800-15-paul@crapouillou.net>
In-Reply-To: <20230705204314.89800-15-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 Jul 2023 19:12:55 +0200
Message-ID: <CACRpkdaGSAPecfnfyDJH8X2JEjzsbty9uLm07HDHCnMkJ+Lwnw@mail.gmail.com>
Subject: Re: [PATCH 14/23] i2c: nomadik: Remove #ifdef guards for PM related functions
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jul 5, 2023 at 10:43=E2=80=AFPM Paul Cercueil <paul@crapouillou.net=
> wrote:

> Use the new PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Looks correct!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
