Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 085BB52FC7B
	for <lists+linux-i2c@lfdr.de>; Sat, 21 May 2022 14:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234229AbiEUM5O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 21 May 2022 08:57:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbiEUM5O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 21 May 2022 08:57:14 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C19305DD1F;
        Sat, 21 May 2022 05:57:12 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id 63so3791671uaw.10;
        Sat, 21 May 2022 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v7lrzZz0TqmDNB8iA94k1xpruUt+qA1fWDXV+uIRpKk=;
        b=Q3TeCmucO50s7J5M6a3xN+W+q61y8GAmoRzuhg6QJKfZL4uou5QBw6ij591vK2UqVA
         B6XgyomQFok7CXOXdu2PYPd89cHEbxeHJlb5iAGj1tDA5zzBmUDKmWD0AiVFu563fFLi
         ujv+a7etD0ShVX6rAPn2umQymv7TrkQGxcSONuZL1Y1aUG2sE196l5LdJyfWp9/rDBU9
         55Cmvmgsf/a8IslNkLCHcesXNmMDRkGE4uaGf2gwKYiGLzJb37ejRriZa+A2UCBoqLhU
         FJD+GWiHRFtgZvqiuCdVOllb5avu0Q7l3XTndvHVnBhmtqb8LfIEMBCB51aGLKrGVK98
         r9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v7lrzZz0TqmDNB8iA94k1xpruUt+qA1fWDXV+uIRpKk=;
        b=5ljsPW65MCj5m9aZKzqVp6C2emN328aza8XPwAlIApffXkB4Hu6s1n5yxvjRB/j/SC
         6ZP3FRMuf27VV0w5zTfPzzgvOPc6Wvcha/qRIzDZ3g3ITNztcwrMn9HWzKbpyIbS3tp/
         iCcX+8EF6eTYzmnMYjlNUGarQiI97s/3cxzrntJBz1E6AgEdRpO5eo7EK1QBaA53pQu4
         VQZ5AIQDM1lMj9bpE+ADSQBtbAA5p7SToCputL2Ze3lRZz8Dq3Q4ZnaKb6ER60ORN13G
         KHropqE8C9BPnjaviW4nobiuvd3IjuETgq2J0zji0H4b3cAR+mbc4aIBbEOB3WFXU8gw
         nuqg==
X-Gm-Message-State: AOAM530ubGToRbntEsbDAgWm9YkxO0s/CPCWrtz1O0I5cRmCxAVBM504
        cssfxn2HvLud7EcgjhFE9vcMq0yRuzjFE2WoYw==
X-Google-Smtp-Source: ABdhPJwi1fjgS3MbDK+Zsx3uIqu1nMkDhsIcuffkfADCaBMWQnKsuU8847NRfSHjq0/iuOs8KnhQFNBcov83tKIqFl8=
X-Received: by 2002:ab0:66c1:0:b0:35f:c5a8:8a2e with SMTP id
 d1-20020ab066c1000000b0035fc5a88a2emr5047687uaq.98.1653137831733; Sat, 21 May
 2022 05:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com> <20220517101142.28421-6-warp5tw@gmail.com>
 <Yoh+KYtRzzbdsB9M@shikoro>
In-Reply-To: <Yoh+KYtRzzbdsB9M@shikoro>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Sat, 21 May 2022 20:57:00 +0800
Message-ID: <CACD3sJYE9AEFrQ7MgXN3=P9W66cw4tDwNc5xch3vn9TJjL7bfg@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] i2c: npcm: Add tx complete counter
To:     Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
        avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
        semen.protsenko@linaro.org, rafal@milecki.pl, sven@svenpeter.dev,
        jsd@semihalf.com, lukas.bulwahn@gmail.com, arnd@arndb.de,
        olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, openbmc@lists.ozlabs.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     jie.deng@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram:

Thank you for your help and review.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:37PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > tx_complete counter is used to indicate successful transaction
> > count.
> > Similar counters for failed tx were previously added.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Applied to for-next, thanks!
>
> I dropped the Fixes tag, doesn't look like a bugfix to me.
>

Best Regards,
Tyrone
