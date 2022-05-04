Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D9951A4A8
	for <lists+linux-i2c@lfdr.de>; Wed,  4 May 2022 17:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352956AbiEDP7n (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 May 2022 11:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352928AbiEDP7l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 May 2022 11:59:41 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C327613D56;
        Wed,  4 May 2022 08:56:04 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id l7so3761423ejn.2;
        Wed, 04 May 2022 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/MaG3ZRxc4+H0WC1x/YbpPIHfpEZGPdrdbB0R6rZ248=;
        b=l85EWaFhKcWG+iEl6rrGnGCY5Z/crEoYwQzItVzAOzLGH1/pgHDyYECey8ScXdDXE1
         n65+6TOfcYygLcOacv98c8wCphaSSVkRVF8oEBq4yhlWWizwq/NfPJOMFg8Nt99tsGcX
         yxaAjJvv5XBmLHR022ucyQ36+vF/haWAgT0NZBxR9pIwneBvbqR2kueO412rO53RdTLk
         tgpKcRBxxg4yXgE47Q9z7L7bVmgbsxkAfoxOg9ELUfKxhKIkh+Y5SCciLwneWVEOvamG
         1LA6l6RRSbmUmPMrpJD3Ca9E9gA0jxiECssD2CjjnH8rLfkuSRk3fUmzJK7vePoB6dbt
         QGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/MaG3ZRxc4+H0WC1x/YbpPIHfpEZGPdrdbB0R6rZ248=;
        b=iGwEWVibSdstU+8wMxIfYXSIbE4YkChIozM2bCiBHEGQGeZb8KU67uCw7uyWyRp/PE
         dwAf8sHd005dNtQDIGphjVE23v8TXwG3bgx+mNS1GMxI7ZN528jjN8+0KBcuYKUdgvRA
         cllMzczkSBZLVYCHB2Nlw8+tCUscRlvSHl4z2y1jcbygZA0xhUQ92xank4YEMXi64DBZ
         UwveSk3WN98l7IX9xjXIV1ipZCU2v2Zk+/3DnOWezVBxioCKkBSleZH6p6MRY7LHCUo4
         EXFVyeNkArrzBTISzX+naLMCPjiPZLyXN2OVUWZPUy76ulBVi6HSuzSRFsaoVu+m1vgn
         41Hw==
X-Gm-Message-State: AOAM531oM98uP/XfMl4WREhehczQM7eKr39Jrp+no341r2HkgiCtmUQ0
        AVM9Dfq8mVCLaD1Rpg0s+wrM0WcXnqML8R+C6HE=
X-Google-Smtp-Source: ABdhPJyuYBhJj9i6UkwxP4bpUHxcD+QUaErFF4VF/CmTnhrV4i0EhEIHGYVA9FLAQNnprizp2Z6JLR6wMNW70SZyAHw=
X-Received: by 2002:a17:906:3ce9:b0:6ef:a8aa:ab46 with SMTP id
 d9-20020a1709063ce900b006efa8aaab46mr21027830ejh.579.1651679762802; Wed, 04
 May 2022 08:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220308205016.2c0112ad@md1za8fc.ad001.siemens.net> <YnJ0tdGTzTRYEISn@smile.fi.intel.com>
 <20220504171007.2f641098@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220504171007.2f641098@md1za8fc.ad001.siemens.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 4 May 2022 17:55:26 +0200
Message-ID: <CAHp75Vfh5DbiGQ4NLv+hhYyRx5wDbMjFmgO5sNZ7864ipRrDHg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] platform/x86: introduce p2sb_bar() helper
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

On Wed, May 4, 2022 at 5:10 PM Henning Schild
<henning.schild@siemens.com> wrote:
> Am Wed, 4 May 2022 15:42:29 +0300
> schrieb Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > On Tue, Mar 08, 2022 at 08:50:16PM +0100, Henning Schild wrote:

...

> > Can we have your formal Tested-by tag?
>
> Sure. I will just put it here for you to take.
>
> Tested-by: Henning Schild <henning.schild@siemens.com>

Thank you!

> Let me know if you need it in another shape or form.

Form is okay, just would be nice if you can retest what I have in the
branch as an updated version.

--
With Best Regards,
Andy Shevchenko
