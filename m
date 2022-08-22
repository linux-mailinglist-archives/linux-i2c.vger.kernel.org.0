Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6E959BD97
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Aug 2022 12:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbiHVKbn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Aug 2022 06:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231961AbiHVKbm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Aug 2022 06:31:42 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22782F02F
        for <linux-i2c@vger.kernel.org>; Mon, 22 Aug 2022 03:31:41 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id s206so9001138pgs.3
        for <linux-i2c@vger.kernel.org>; Mon, 22 Aug 2022 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=KvLVHIy7zFmD92aZ72OpIyLKeAlx3Wy2AZD7ansT0hI=;
        b=uRjb+mCzNE70MMOwkG1xm8XLINlTbDkVtFqyTMQP45dT6ADUDma5G/UjvHJapmVm3e
         Yd0J94dERpRzHrFPIGIXL16T63choHaKDPsZpuMB9ruiATjU1SOMK+mUfsV2bEx9GPVc
         PHbZhc6tXUD/L6m7nlBT8jfNRsqInjSDtRccPdG6QIq1gGAHlJgeYyT/ABdPVC1llSXh
         ZJqBi/ieOvLak0ErKyhg+IX6a90rtonqtdOva+e3O53ser83AcWhhLNDbx+KJZgak0gV
         OSHQFIOE8q9AxVHsadaoONziCY7jXocYXYe3gvAl90uOl7wMBmPbj7PrAUCxPXcfObWE
         Ziig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=KvLVHIy7zFmD92aZ72OpIyLKeAlx3Wy2AZD7ansT0hI=;
        b=xgcQArfFnf161GrO0que6MpaHxl3zqxjoUgC+zoqtHs2tz1o55GucvvdDdjH3CaN4w
         RM6ciQ4SGIy8jid+9XKL3HaBXIb7HEJff2Ouda9JQWa/4Ywx5F8hFQW7Tgh7xz/1baOd
         wuKjaUEJz0fTdDiBf5hE7aDI4hc87kgeuPUC+RCUGG+tnovegnq7lDkV5xp0B/bspdhg
         nuu/gSSolToBLlRFQhoYurEll/Sq+dmlF4BPI4Yy0sFtx7pGGyBrNxk/khJd/56zhdZ9
         Y9T8gHJR2I7CvNeuZ2vmqrMIqlDLeVC/671B+TkAFHtCGP+o1wegYIrf+NkLi48i6mFz
         pUgg==
X-Gm-Message-State: ACgBeo302gLqVdHLMTurEMdnvsYiOWzc5C/nXxQQ5xOk7xwN7tHkqdYW
        F9DjGoycSYiWd+2kIs9aBqIwUZ3zrG69Y5x1U/E0Gg==
X-Google-Smtp-Source: AA6agR5XofIXPXZ4LEElDr9w/G89kUmRcY6qMj6MV1zWn56gcU6Qdn13Sw7kEPRLbozr1pg3nNWrORVLo40ygh5EkAU=
X-Received: by 2002:a63:2c6:0:b0:41d:9a04:c227 with SMTP id
 189-20020a6302c6000000b0041d9a04c227mr16202348pgc.167.1661164301179; Mon, 22
 Aug 2022 03:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220812071526.414285-1-jsd@semihalf.com> <a6e5b123-91da-b32d-be40-d88a82e4374e@linux.intel.com>
In-Reply-To: <a6e5b123-91da-b32d-be40-d88a82e4374e@linux.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 22 Aug 2022 12:31:30 +0200
Message-ID: <CAOtMz3Nt15089MrvKAzgoviY1P4B=5v08c5-8qt3=f7RhPb8BA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: designware: Introduce semaphore reservation timer
 to AMDPSP driver
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        rrangel@chromium.org, mw@semihalf.com, upstream@semihalf.com
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

pon., 15 sie 2022 o 13:17 Jarkko Nikula
<jarkko.nikula@linux.intel.com> napisa=C5=82(a):
>
> On 8/12/22 10:15, Jan Dabros wrote:
> > In order to optimize performance, limit amount of back and forth
> > transactions between x86 and PSP. This is done by introduction of
> > semaphore reservation period - that is window in which x86 isn't
> > releasing the bus immediately after each I2C transaction.
> >
> > In order to protect PSP from being starved while waiting for
> > arbitration, after a programmed time bus is automatically released by a
> > deferred function.
> >
> > Signed-off-by: Jan Dabros <jsd@semihalf.com>
> > ---
> >   drivers/i2c/busses/i2c-designware-amdpsp.c | 68 +++++++++++++++++----=
-
> >   1 file changed, 53 insertions(+), 15 deletions(-)
> >
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Thanks!

Best Regards,
Jan
