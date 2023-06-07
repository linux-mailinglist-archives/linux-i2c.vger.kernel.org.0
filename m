Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA19725F48
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jun 2023 14:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240835AbjFGM0M (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 7 Jun 2023 08:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240788AbjFGM0L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 7 Jun 2023 08:26:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CCB1FD5
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 05:26:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D14D63501
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 12:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEDEC433EF
        for <linux-i2c@vger.kernel.org>; Wed,  7 Jun 2023 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686140760;
        bh=Hejwqi6FBhLDJdlbjy5YX5ddU3z1wSekyGkZ/FAMHQs=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=lVMFvjHfHmZOUp40QJcIRdRKOopnpdahIcx/ouNZ9a83AloFXSSRlnch9oaJebxnq
         FGg0bE4kwGHTIGM2oe/76CXkhZ7pXZ/GluUfK+WWzFW6ZQkQtKufzwsjyrZGOBcKH5
         X11tHjkDeW7/8HfPU4k1p4HlWiSuwmDUoC39t7OS8wN4e7COqCw2N+jYtObxCSyZ9Z
         joZmSJMsUpV7obtPwUaG9QGyPb9A4nyi1ckEAA7DJfmoAOUKNpcKUDBj6S8VoZ80HS
         8VMm5eMb1nzorr03R8nkzC0CZXHQbh4Es9q+1VErDCVAdbG3Tq0PlsYDp4nWeZGmkA
         Aeb9RnpaFJ94w==
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6b2a875b1bfso407168a34.0
        for <linux-i2c@vger.kernel.org>; Wed, 07 Jun 2023 05:26:00 -0700 (PDT)
X-Gm-Message-State: AC+VfDzeZ9cBbsm0yjx6jUGC3gzeryQuPULa8WswPd82kdngmwJgs36q
        LbzITYHc1yTe6HhCFnlt9Q9rPldpsvb3/P4wSj5rRg==
X-Google-Smtp-Source: ACHHUZ7TWJ2NcDJr/cxQbuGmMmmwWCCOcyvvJg4RZIubr7St0+CT82SvbIhXjRjm6U4dj7pTP9a2wPqMdgQbidTEkYY=
X-Received: by 2002:a05:6358:4e83:b0:127:db0e:395a with SMTP id
 ce3-20020a0563584e8300b00127db0e395amr3370873rwb.7.1686140759753; Wed, 07 Jun
 2023 05:25:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230306144522.15699-1-quic_mdalam@quicinc.com> <ZIBdN/16vizJqNZp@shikoro>
In-Reply-To: <ZIBdN/16vizJqNZp@shikoro>
From:   Robert Foss <rfoss@kernel.org>
Date:   Wed, 7 Jun 2023 14:25:48 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4X7+OAY3Bhc2ud1RVBZUd5fSOLOeWLNXWhMtptxUWTWA@mail.gmail.com>
Message-ID: <CAN6tsi4X7+OAY3Bhc2ud1RVBZUd5fSOLOeWLNXWhMtptxUWTWA@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: qcom-cci:Use devm_platform_get_and_ioremap_resource()
To:     Wolfram Sang <wsa@kernel.org>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        loic.poulain@linaro.org, rfoss@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_sjaganat@quicinc.com,
        quic_srichara@quicinc.com, quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 7, 2023 at 12:34=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrote=
:
>
> On Mon, Mar 06, 2023 at 08:15:22PM +0530, Md Sadre Alam wrote:
> > Convert platform_get_resource(), devm_ioremap_resource() to a single
> > call to devm_platform_get_and_ioremap_resource(), as this is exactly
> > what this function does.
> >
> > Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>
> Loic, Robert, do you agree with this patch?
>

Acked-by: Robert Foss <rfoss@kernel.org>
