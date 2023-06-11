Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE35172B3AC
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jun 2023 21:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbjFKTXM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jun 2023 15:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbjFKTXK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jun 2023 15:23:10 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E8110CF
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 12:22:41 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-bc379e4c1cbso1904567276.2
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jun 2023 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686511332; x=1689103332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+pK5a95MOVuuN1NBZZk+USYnG+mrZyWKzAgvOFvvZs=;
        b=Nc7T6DIu65FPGn4TiugWUeSVRoOZKKbBlual+Qjitxa++8q1xipgwWobZmkYpROJ7Y
         WQH9DRnvHuowMR7uWqjmTReDQlKoxzfs36fzBLyn1RqaEdwQclrKjecIvakESURqg4HI
         P6PI+UuBlEnBe7b7d/DljfRLDOmEz/QNzYk1MSV+xWLSF6v2vYD8OWZzASF9NBDJpT2N
         sTWiqhqn5Vcnjb2l/1Tv5JS2L7bVbW5femH1haHSraNiMQdrMcMhwz1yYd6GManiEwXw
         AIUG7rnH1tjlJhhkyO1raCQo9ZiJy3w4Z999b/tWFlH8C1zdPr5aQo+8zsYGQQHVbV5k
         ilvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686511332; x=1689103332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+pK5a95MOVuuN1NBZZk+USYnG+mrZyWKzAgvOFvvZs=;
        b=bkgngbRkKFkELgQTQDVpW/mzNwO87P0pxQI/nUgk3tr/tbDeeoB//ZTCJ+3CV+5JtY
         U1HBkByCVLMNRm8jQzEZMTvNRTyADNn4rG/HvVJnoY4Ar1vPh8Et01W1gOghctkDGOqz
         uFL39SuI+cP55+qnR8xrKeZGL6S6Fd/RlWfjQTvxw+vX1kD2556wTaf70qsIfIA2nuxC
         Yt9248+au4PG7K4VVavK8fMyOHt9N6f0WlFFlM/Ys/20h48c95tEbpiO/oLUgrfI5HPC
         /1lTpMQcyD3hmy5Iq8hVTx6IX+kxgZeSbUMOj9zEs4R9swIMeNg6dyahpHifK4ReLcYO
         oUnA==
X-Gm-Message-State: AC+VfDwbH8V84O0Zf/udiiqh0+FyttQLWPlRkqWpdwj7QL9K2vKm1hM6
        CY+ODGTyHT/lBj/zsvqpyeFx8ZvIWAw0o3V54PQdhF1A7B3F9/s8
X-Google-Smtp-Source: ACHHUZ5fS9zWrUJsK8WGkYu5SzQ50D9QLh/TjExZmUHq4u7B0xFFQzsCiOBy6Zl2UfSBSUBRG6Pei9jhdSQmwDVjnm8=
X-Received: by 2002:a25:ba4a:0:b0:ba8:5a5a:8b23 with SMTP id
 z10-20020a25ba4a000000b00ba85a5a8b23mr6576248ybj.40.1686511332435; Sun, 11
 Jun 2023 12:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230611013701.1464025-1-andi.shyti@kernel.org>
In-Reply-To: <20230611013701.1464025-1-andi.shyti@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 11 Jun 2023 21:22:01 +0200
Message-ID: <CACRpkdbGiuvExBGHmJHv8Y_YNYn812-CJteHo4Wmu=rqQE5qpg@mail.gmail.com>
Subject: Re: [PATCH 0/3] i2c: busses: nomadik cleanups
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
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

On Sun, Jun 11, 2023 at 3:37=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:

> while browing the i2c code I spotted the unused goto. The other
> two patches come naturally.

Excellent patches Andi!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
