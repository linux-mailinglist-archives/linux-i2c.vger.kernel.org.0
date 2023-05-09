Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF656FC020
	for <lists+linux-i2c@lfdr.de>; Tue,  9 May 2023 09:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235222AbjEIHHy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 May 2023 03:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235223AbjEIHHs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 May 2023 03:07:48 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCF0D052
        for <linux-i2c@vger.kernel.org>; Tue,  9 May 2023 00:07:46 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so28981315276.0
        for <linux-i2c@vger.kernel.org>; Tue, 09 May 2023 00:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683616065; x=1686208065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPhm8MRVoAMGTrOwh5djskX3K6/bJjAzMyo/bEltrz4=;
        b=MlptH1Hohgc0KmEt1TZ5C5deunwA+e5fAdrk+WHFK3j4PG9qY+47VOgQJwHqqiQ48H
         ZP3zUoxxEHPPyjexQz5HoGaR/47fvW2/VT456gdMHfoD6jUEpF8O07xFV780Q/wkRGIA
         B0CYG4yaOX2BVud8/qTokHke4bR+ZasawV8iEUPTaX5JzscXHZkWHwwxGGjFDFPZ/CSS
         Ra2vazWDFxOuyoRcKSiu+K2xuEdP3e5EssCKR86VuQEh31sSgyIr2a47/9f0AWGH4t6K
         Ny6Q8KDIkYBN5MY26nxGJ61nyyVc9Gkw8WuOlkslzcbGPdS2RQKdvi49wgIRkCjtZoeR
         SfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616065; x=1686208065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPhm8MRVoAMGTrOwh5djskX3K6/bJjAzMyo/bEltrz4=;
        b=lkOSteoQj4aoYB4CRzKbsEeUCtsEtCEih8dTcdHleTyAaVc39ANw4vhcC9uXW37O52
         k+7Njfi50jP3DDtru2NmH3UzO+C2SSPccV4rNoUdMsZAfC3K8L++e51KcWoOYdCEmae2
         6DpJrk3txwGmOTC3kAbMbD5HRpzCa+zNhtfuON+taDLYY+JdU3LF6qOqKkz/bFDzPPLw
         I0OD8L8eLEDIUBOmQ5LHVWJ6cBC3afVVtzrRQmw5HTH+ReOrpEz8WC3xDYp7AlWFNKAk
         q6L6EGiBFshhdNnuZWLAHKZS9r2FseHu0GAXtaJaNRYGB0gPBTD9eXU+3aAAB4IeyfKI
         Pp4w==
X-Gm-Message-State: AC+VfDxfTiXCqjP8tfrYY/HgkSLJz0+Uf6iSQHu36okyi8xeZDe2i3Ct
        B0fjPXTEltdmrkp3d2MsYu+8v1ZFMd3YRm5+D3gZEw==
X-Google-Smtp-Source: ACHHUZ5mWSTqP+mVhPJDK9D45b6vH1SbgnO6iUJJYDrjwkJ+1HX3pOyJxFVOjFw+tTkLvSGwZeEpJLGQxqla7YomsQs=
X-Received: by 2002:a81:4895:0:b0:54e:ac2b:8a8c with SMTP id
 v143-20020a814895000000b0054eac2b8a8cmr14205053ywa.24.1683616065701; Tue, 09
 May 2023 00:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de> <20230508205306.1474415-78-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-78-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 May 2023 09:07:34 +0200
Message-ID: <CACRpkdZawnKey-ajNf4eGUFzNAV0QqUwA43qGMGARX-utPfFxw@mail.gmail.com>
Subject: Re: [PATCH 77/89] i2c: versatile: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 8, 2023 at 10:53=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
