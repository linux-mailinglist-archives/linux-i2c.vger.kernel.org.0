Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584C64C0A61
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Feb 2022 04:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236435AbiBWDja (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 22 Feb 2022 22:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236199AbiBWDj3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 22 Feb 2022 22:39:29 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D8903D4AC;
        Tue, 22 Feb 2022 19:39:01 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id j3so1774106vsi.7;
        Tue, 22 Feb 2022 19:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LvRpWJinftwqb1VQH9ytrPGNaXqDypv0JPsj78l9+FY=;
        b=eyOfnPKtUVgM0Mz7hg2JjW4Pk/cOsbb3Md/CMGUoOB6YmvT4mWNt+HKzTz4ai5IMj4
         NnyWY5PzJxHtn1xXyW2OPkEgSG7DYn+zaC9ZWRwjK2jqiJN8Yugp+oKw+re8Q/0Lfr+q
         /aB+Lz0oBq9VJvVBsKnlUhFITt66Pm4TQgrAD6o5HJm98Lbe/iRriGEiN+vZvfTLMlQf
         3P53F77Zyl3kNK4bGdYDdawYfykRZcz0M7zYJSi6sMGRcKEyuQMqN3+SydppMRGUmwL+
         d6KCoMSQX+abiZ7sWPWU29QNTpYf0uobYQSCeABP5bxxfvMytyScizk4f+vb8nMa2+5S
         mnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LvRpWJinftwqb1VQH9ytrPGNaXqDypv0JPsj78l9+FY=;
        b=D4Dp6yVvsBXegekXzLtD/16MDNnar5Z81rtE5EaiQH3uHa0HLM40jDVWgp9wjfmXAn
         G760GD1pJ44tA4vEjOX4vWh1jjLcTrWP1hlDzSjCfkACpJcQ+kZeioWRoZybrXiWlKc1
         mYmei8HZ+sXUFOUzvujVSoCHiqWhWCr4BBaEAzUHRvMYRUYvWHwL2ZbrxEeTpJnUK2l4
         1qhx74hohEbrKuMqG6p1ghm8ozgG5zwMdsh2tewYsjU4rbZKJNgcvuBWveQwYdnHOKal
         uhXOwh19LQyKFPYbzwOOscWXw47Z3AqyaPkTybtWeWCA6hirT+YXFUOPzVkuSQ6ym/0q
         Idyg==
X-Gm-Message-State: AOAM532AvV0twYSW4nxaaDI3f88K2Vaz2ROrkfa51yUFGvog8kqgAb+P
        bKwtibF+8v1x0tE4xArlYoNsXbZ+TiicUIFFXw==
X-Google-Smtp-Source: ABdhPJz9tQfelHz+P+qJV477ABXt4WJYhC7UjoC/2gG4A4NNsfZVAU8hDEjpRLH19nxzc+D6GfYbeIYfdqQfZmCrLpk=
X-Received: by 2002:a05:6102:370f:b0:31b:60dc:4f76 with SMTP id
 s15-20020a056102370f00b0031b60dc4f76mr12203672vst.2.1645587540488; Tue, 22
 Feb 2022 19:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com> <20220220035321.3870-6-warp5tw@gmail.com>
 <YhN8OGIR9eSCus8E@latitude> <CACD3sJbMZ-CT4htPUBqyswghAC+j8PgJ_z-VdA38yC+6HFrF+w@mail.gmail.com>
 <YhUIP4pvoGBUohCE@latitude>
In-Reply-To: <YhUIP4pvoGBUohCE@latitude>
From:   Tyrone Ting <warp5tw@gmail.com>
Date:   Wed, 23 Feb 2022 11:38:47 +0800
Message-ID: <CACD3sJZtJ_vrd=xQQ5P1c1L8dZ9LgjZhE2-76SFyQ+jX9NPNVg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] i2c: npcm: Remove unused clock node
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
        semen.protsenko@linaro.org, yangyicong@hisilicon.com,
        wsa@kernel.org, jie.deng@intel.com, sven@svenpeter.dev,
        bence98@sch.bme.hu, christophe.leroy@csgroup.eu,
        lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
        digetx@gmail.com, andriy.shevchenko@linux.intel.com,
        tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, devicetree@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

Hi Jonathan:

Got it and thank you.

Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=B42=
=E6=9C=8822=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8811:59=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, Feb 22, 2022 at 10:15:04AM +0800, Tyrone Ting wrote:
> > Hi Jonathan:
> >
> > Thank you for your comments and please find my reply next to your comme=
nts.
> >
> > Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net> =E6=96=BC 2022=E5=B9=
=B42=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:49=E5=AF=AB=
=E9=81=93=EF=BC=9A
> > >
> > > On Sun, Feb 20, 2022 at 11:53:15AM +0800, Tyrone Ting wrote:
> > > > From: Tali Perry <tali.perry1@gmail.com>
> > > >
> > > > Remove unused npcm750-clk node.
> > >
> > > You're not actually removing a node, for example in the sense of remo=
ving a
> > > devicetree node from a devicetree.
> > >
> > > So, I think "Remove unused variable clk_regmap." would be a better
> > > description.
> > >
> >
> > May I modify the description according to your input and attach
> > "Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>"
> > onto this commit in the next version of the patch set?
>
> Yes!
>
>
> Jonathan

Best regards,
Tyrone
