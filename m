Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E58C4D7DEB
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Mar 2022 09:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbiCNI5k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Mar 2022 04:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237506AbiCNI5g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Mar 2022 04:57:36 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6903F8B0
        for <linux-i2c@vger.kernel.org>; Mon, 14 Mar 2022 01:56:27 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id d10-20020a17090a7bca00b001c5ed9a196bso2476138pjl.1
        for <linux-i2c@vger.kernel.org>; Mon, 14 Mar 2022 01:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xJkiDlz3HjpJV2R+3JbmTlL+SAG14PZ3xVrckfn5kNk=;
        b=dkYXGOyJzkjCjEaUYwMBBwUQ2lQfJ7mDnqUx083FGEQ+pkorSa1ttsyS+AdZFuEmPS
         kmCCSIVnfSNZKhFXBYZFR8ki+O6JHuUUhqbIfosIdBU3GqZIkHYj2alLZ3FUXUf6ZNBc
         LP5A8bNHQJLkfjqrUBCLHBdaNkQsWMWyNIV1kTkhFbq6SRGP/sBtTvdQNe6HkrKrkv2k
         Lf82xZ7m2xkbDg7xl1inT8y5ZZOtijYg6ORnC/8uJxIKZAtHsfHEYsFcdk4gaOPpSmeT
         eiZgL6CUY/s+cesA1eNYmHMI5CFnN3eTyglBgFafMFY6hw77sJlG7SZ4F3sDb6hpKr/D
         d4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=xJkiDlz3HjpJV2R+3JbmTlL+SAG14PZ3xVrckfn5kNk=;
        b=kstPFHasvVCp0ghqNbTka9DM2dQtkU7hY8asf1mtnsvcDVFzslTNX9G8C/rVX2Pe6J
         1LZtyzGHURzj48aR2mg8N4YqqOJxKnGaSzR23qKaJhxueXfrSDqR6rvTcMr9wOG2qD8t
         C0pkL+5uVdUp7CJbd84lKiYF/9UL43JT2X0xL1T8vQXPTsaH1WKGVHGoZbvp8GfDn83h
         fKYgVBkQpbZkwZ4qF5yBoCJBP6P0K2Q76Dw2sy+04hEA8neAws0DLcUBK53ONfd/juCC
         VyQ3pVesVKw2YnazNxMjWFwmcUEBzNAKz4pS+a3XapVpVoienl/+5EOEC5XXv0edHYNK
         3ryg==
X-Gm-Message-State: AOAM531UdE3haCOY1l6e65q0bc5fjSMFiaeD+uyjXJ2n5WDZ20LAiq8g
        uy22jsT0jgeQ8KXSw/0Tn4Zg30CnZTjovG9u8zHpcg==
X-Google-Smtp-Source: ABdhPJxfESJhZgMSB07Ud5xszy38lMUWBSmH5NVzvowlZrXZkoq+MgH4i4vNjgmR0ELx688xrYGljHac7kXGrIgNgSo=
X-Received: by 2002:a17:902:a585:b0:14d:58ef:65 with SMTP id
 az5-20020a170902a58500b0014d58ef0065mr22469940plb.139.1647248187124; Mon, 14
 Mar 2022 01:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220310220932.140973-1-jsd@semihalf.com> <Yiu2NIvEOow87s+r@ninjato>
In-Reply-To: <Yiu2NIvEOow87s+r@ninjato>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Mon, 14 Mar 2022 09:56:16 +0100
Message-ID: <CAOtMz3OM9c7NpGiYVHxs+KOVBVNykbQkj+KarBbNtUt6iiiQCw@mail.gmail.com>
Subject: Re: [PATCH v2 -next] i2c: designware: Remove code duplication
To:     Wolfram Sang <wsa@kernel.org>, Jan Dabros <jsd@semihalf.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

pt., 11 mar 2022 o 21:51 Wolfram Sang <wsa@kernel.org> napisa=C5=82(a):
>
> On Thu, Mar 10, 2022 at 11:09:32PM +0100, Jan Dabros wrote:
> > Simplify code by moving common part to one function.
> >
> > Signed-off-by: Jan Dabros <jsd@semihalf.com>
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Is it really based on for-next? I can't apply the patch. Am I missing
> something?

I checked this once again and I mistakenly used the old linux-next
baseline. Actually the cherry-pick of the above patch was successful,
but I confirmed "git am" is not happy because of the missing semicolon
in one of the lines from context. Baseline for v2 doesn't include
1e4fe5430b: "i2c: designware: remove unneeded semicolon" thus the
problem.

Sorry for the confusion, I will send v3 rebased on top of fresh -next.

Best Regards,
Jan
