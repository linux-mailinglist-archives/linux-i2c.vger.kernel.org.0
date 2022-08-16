Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6759F59580F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Aug 2022 12:23:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234473AbiHPKXX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Aug 2022 06:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234477AbiHPKW6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Aug 2022 06:22:58 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925BF5FB1
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 01:34:59 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id o15-20020a9d718f000000b00638c1348012so1982480otj.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 Aug 2022 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=xRMt4D6plr80yHsz/2ZNEtUgaRCDku9aJ70gD0Jopf8=;
        b=G6nb2ORVYSZQMSk+jLhKluOA/nWnPRJly8hk9FL35KQsLvWHtpOJ/K18PD5zgAlVnF
         yG2pSOsk6j93uxiUO72vHB0RJX8nUhQPq7nS48paqPpxFBTN5xMivjavmRruPSpE3C5z
         dTz3Ai2SxMVWMs6CAiDvvJtpAWKtvExOCp7a/As4wZCi0L8nq2sWbSIu9l5YCbDYgby+
         aNExaVREXhPvSG+Yvt61BTQ4whaCcKgfkS4snCxZrSSYaLqBSAUNj82yHzvsPhNN88N2
         HerlsPlxrSgFnO8wWIRo+PJYQDdd3zUbKF/r0SZq9UT07k905rjaawmtbDC/VJpqO0aR
         7i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=xRMt4D6plr80yHsz/2ZNEtUgaRCDku9aJ70gD0Jopf8=;
        b=weGwgMlAXZfrLHTtZ1zt4mdD0NGdyGgZsE20gA+mEOrmBYnBQIIS11qk45ErxjF6W4
         o1/nDdXydPvm6BhepnWyrboWD6CD1nV+vQ6u5rM74b4eh7Wcl7EXRtCSVlnQao4FnLO4
         mhFkbVIr19nGCv2DdyYFeiXwcPrKPtSlZ1rT/41eCU2kM+1AQ8nio59wUbBO3TXpQizk
         np2JrL1wtksTcK6EYzZfTd/Zo6rKku4rTNT3daE+WqXUOML5eA1J962RJa17tICnWZ9f
         CBiVNuXokKPjmAPRw9pdyqRCVvJQVZaac0zstcXG+tqE+9crxkwOL+OxVimWhsrI1fbI
         3A2w==
X-Gm-Message-State: ACgBeo0+kjQ1sO0nTIx4aVJDdpyuJaEblm5BMSzPNUR840JSUqsO8ZOz
        a2ojeB+hnbDcPO0gn/EGpHDu6oiW3HnpTJaZSudzyishgmLkfg==
X-Google-Smtp-Source: AA6agR5TCgvkLm8/ebrcrm/pYMGcHSUOSCIuJezGVZgqNM8B+MK4BiqaFlt2VlsSAA4C2oUBmBqNXqQHEuwSKuZZxCc=
X-Received: by 2002:a05:6830:660c:b0:618:f504:5b7d with SMTP id
 cp12-20020a056830660c00b00618f5045b7dmr7142896otb.300.1660638898864; Tue, 16
 Aug 2022 01:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220815080230.37408-1-u.kleine-koenig@pengutronix.de>
 <20220815080230.37408-7-u.kleine-koenig@pengutronix.de> <20220815085029.y7k3e5yg22dby2c7@pengutronix.de>
In-Reply-To: <20220815085029.y7k3e5yg22dby2c7@pengutronix.de>
From:   Crt Mori <cmo@melexis.com>
Date:   Tue, 16 Aug 2022 10:34:22 +0200
Message-ID: <CAKv63uvXTrJpMF2m0uZs6QJ0aYcY0F+97NM15znhic8WhpFiSA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] i2c: Make remove callback return void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-i2c@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For mlx90614 and mlx90632:

Acked-by: Crt Mori<cmo@melexis.com>

Best regards,
Crt

On Mon, 15 Aug 2022 at 10:50, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> On Mon, Aug 15, 2022 at 10:02:30AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > The value returned by an i2c driver's remove function is mostly ignored=
.
> > (Only an error message is printed if the value is non-zero that the
> > error is ignored.)
> >
> > So change the prototype of the remove function to return no value. This
> > way driver authors are not tempted to assume that passing an error to
> > the upper layer is a good idea. All drivers are adapted accordingly.
> > There is no intended change of behaviour, all callbacks were prepared t=
o
> > return 0 before.
> >
> > [...]
> > ---
> > [...]
> >  619 files changed, 646 insertions(+), 1733 deletions(-)
>
> There seems to be a 300k limit for mails on vger.kernel.org, so this
> patch didn't make it to the list. Please get it from
>
>         https://git.pengutronix.de/git/ukl/linux i2c-remove-void
>
> or
>
>         https://git.pengutronix.de/cgit/ukl/linux/commit/?h=3Di2c-remove-=
void
>
> or send me a (private) mail, then I can bounce you the message to
> properly reply to it. (Or if that is enough for you: The Message-Id is
> <20220815080230.37408-7-u.kleine-koenig@pengutronix.de>.)
>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
