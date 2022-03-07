Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE8F4D0732
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Mar 2022 20:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244937AbiCGTGP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Mar 2022 14:06:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233935AbiCGTGO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Mar 2022 14:06:14 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3194ECD6;
        Mon,  7 Mar 2022 11:05:18 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id y12so1602553edc.13;
        Mon, 07 Mar 2022 11:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iXQiyusXSHknsabSyew3dw1NkYbYI4nNb8+pTTi1PQI=;
        b=A0Qm2gzVSL627z/YIsLeTA5SP5E7x2U5Pe29dKLwHmbPEL/WdOL2oAodAGHmZcZpjn
         JKkq7YdVAzJz4/V5YePclrtVeqaRb3FlmEdYcDTmntzHNErOPkXMN6lHILSMfGmlkTh2
         oaBQHovjcLuesxDDS5NBnseM7LWCnuzzVOgwWQlGkg9d+MVqS8IGM5vUOQiHEvcZW/6S
         hqDRJTeuz1h8QjgvPbQm1SQa9XYrv/Q9JLwddI7kp+ynr3928GWZqis41b22wjvOruu8
         64T3kDN3Q0m46Bwnm3Q4WjMZMAiV/oH7HpPpM9I2eig6JNcTKl9rT5QrRceZDpfzeh72
         TKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iXQiyusXSHknsabSyew3dw1NkYbYI4nNb8+pTTi1PQI=;
        b=cx1n/wcT87A/D0FHnUrq+2YOr8cZzmsEZBu33IHAwQaZu8hlJxNaStbVO9VxOXZ05K
         44TjaWxE0tuHQqAOM2/ukJVqUIPEWTrR26RSUfuGNvTsugHs/8K52COzB1ah4iiKnDEV
         UxCvhx7HWhxjuLvljwVpLeFpXW/gnwB0qFsonSPiLAT5SqFSXkhyaiXjuwqanZhWq69X
         2R0QoW5eu7TbCE97M2UeotrYSwdFjveQ1MkPbOETIx50D6bti5k3OkbyBszaBcWjvziV
         oWsYV0vjuI4LrvsNAf/FD38gE6KCT6QVQXLxnjRX/ElwlF3/3a4zlzV90VJJsj4JHEGF
         tmVQ==
X-Gm-Message-State: AOAM531bFf4l0yesVT4uPWFALUuW1kPISymcERQOwUR1n5WDGAG4g4xH
        J+oU0VgUrsZ6nVmyqKSSU6/FRy/uTLHfZoQy/Xs=
X-Google-Smtp-Source: ABdhPJxy2ZUaE3jKuxMdHwPTygdRtYs5VUR/hF+JBH/n7tsdurRqjjrqMjRdNeaD2Y6s4TVmSih1gf2kzIRgo8jrXaw=
X-Received: by 2002:aa7:da93:0:b0:416:4aca:bef7 with SMTP id
 q19-20020aa7da93000000b004164acabef7mr5481099eds.296.1646679916550; Mon, 07
 Mar 2022 11:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-6-andriy.shevchenko@linux.intel.com> <20220307192138.10f5fc32@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220307192138.10f5fc32@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Mar 2022 21:03:58 +0200
Message-ID: <CAHp75Vf71FB_=i2FSoGmPbWikHLq2YLCh_J=oQz7u50hyALm0g@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] mfd: lpc_ich: Add support for pinctrl in non-ACPI system
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Mar 7, 2022 at 8:21 PM Henning Schild
<henning.schild@siemens.com> wrote:

Please, do not top-post.

> Can this patch not be proposed separately? Maybe i am wrong but it
> seems unrelated to the p2sb story.

The entire story happens to begin from this very change. The author
(you may see that's not me) proposed the change a long time ago and
AFAIU this is the requirement to have it upstreamed.

> The whole p2sb base and size discovery is easy and switching the
> simatic drivers is also. It is an interface change, where the old open
> coding remains working.
>
> But having to switch to GPIO in the same series is kind of weird. That
> is a functional change which even might deserve its own cover letter. I
> bet there are tons of out-of-tree modules which will stop working on
> apl after that gets merged.

Upstream rarely, if at all, cares about 3rd party modules. From the
upstream point of view the thing (whatever the 3rd party module
supports) wasn't working ("no driver" in upstream) and won't work
(still "no driver" in upstream) after the change, so there may not be
any regression.

> I still did not understand why apl is special and other boards do not
> get their pinctrl brought up without ACPI/p2sb-visible.

The platform is being heavily used by one of our departments in such
configuration with firmwares that may not be fully compatible with
UEFI.They want to support that along with the case when BIOS has no
GPIO device being provided.

> I have patches floating around, but still would be happy if we could do
> one thing at a time.

Either way any new changes must use a pin control driver and the
previous work was accepted only on this basis.

> Or maybe it is strongly coupled and I do not understand why.

That's the initial requirement by our peer departament.

-- 
With Best Regards,
Andy Shevchenko
