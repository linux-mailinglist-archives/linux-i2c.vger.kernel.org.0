Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67A964AE3E9
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 23:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386885AbiBHWYk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 17:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386341AbiBHUK6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 15:10:58 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644B8C0613CB;
        Tue,  8 Feb 2022 12:10:57 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id y3so1049232ejf.2;
        Tue, 08 Feb 2022 12:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNeJNqdqiYnVYWualgJIjRFugWIH6ZRZ9ffFOARK/cE=;
        b=n1BWw2fNSgJK0rswqqpuw4wPGEdEsqQ2XhDNE6fBVE1/Nv3wL7DAAylwKE4cnembKm
         UeiDSU7dLdQyD5otmjeQhMA4Z4UR/jCQQwT9VnfNm1V2vS1VFXVOgXl/DldLE7ahHKeK
         EWrS5FF3vHZvisuYmRyMgzABtfZrsz8TfHNeb1Y33TX7M/oQL9wRDGX2VwZVZwXuu+TH
         EI1E31RadSBEzzYbtYJLF/V8b2+IFZc4g4yZHrtLOoN93f+6c4or4kUH9I4rabqnO1Ul
         kDEA5VI5/ixj6U5RqJ9NqcG21gsJx/F6DHF76zfhZVnBqT+V3KXpZnuUr5c/i13BoH5p
         ZDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNeJNqdqiYnVYWualgJIjRFugWIH6ZRZ9ffFOARK/cE=;
        b=eWVZI7dIlnSAp6Kyf7/sDx2VYkN+WasNSZ1BO3/Q0MVCwp5Pn3zsyJC9zBZR0QzYkk
         ooevCRgM98mIHqNqaIhXvZiv4Xs+gRX8ZJBNP8ALrL9TJW+gk5xXWVjBIn+adwDYWSWO
         d8g3V7vO5z1MAQRS+3Bposcacy9QYS+umjpPGpd3cX/t6QsrIzEzcya9fOQ7mgT+omBL
         +WvBMuHLwIAtTHRIEA5gzLBCovVZuGqyaMXncZObXboG46BybA4fGTX1L75K635Yt/w8
         hlGiFm9oan/byWA1U0Vf59WSXRF1FvL5Vj0BmWpSDO7i4oHxPAauAPYuPukChR+L1vNd
         xkZw==
X-Gm-Message-State: AOAM531Ivn09MvAbgZ4jrSpQLu7Dv24IyhcXulklT80wfNK4zNMUt2fP
        z+62tn+ypIjoB1C8Hb586itJEcWKzolAoqi63kD0NvTylnE=
X-Google-Smtp-Source: ABdhPJz/29dfIwH1sP0e+2jI+7e4+ZvY6/O4KUyuquNucQ1QIxeS3tdTI9eYGZUhLIMBVu/8y6ESM+lCVFRYcaAq4yw=
X-Received: by 2002:a17:906:c14d:: with SMTP id dp13mr5102597ejc.132.1644351055786;
 Tue, 08 Feb 2022 12:10:55 -0800 (PST)
MIME-Version: 1.0
References: <20220130184130.176646-1-terry.bowman@amd.com> <20220130184130.176646-10-terry.bowman@amd.com>
 <20220208173316.403ec944@endymion.delvare>
In-Reply-To: <20220208173316.403ec944@endymion.delvare>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Feb 2022 22:10:19 +0200
Message-ID: <CAHp75VfjQv=k4fG0GOSRRqTmpTkXe8chRQqjBaY3caHzdnhEKw@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] i2c: piix4: Enable EFCH MMIO for Family 17h+
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Terry Bowman <terry.bowman@amd.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        sudheesh.mavila@amd.com,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
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

On Tue, Feb 8, 2022 at 6:33 PM Jean Delvare <jdelvare@suse.de> wrote:
> On Sun, 30 Jan 2022 12:41:30 -0600, Terry Bowman wrote:

...

> > +#define AMD_PCI_SMBUS_REVISION_MMIO          0x51
>
> I don't think that was worth a define. You only use the value once, in
> a context where the symbolic name doesn't add much value IMHO.

I don't remember the code context here, but it would be nice in such a
case to convert this definition to a comment (if it's not crystal
clear what this magic number is about).


-- 
With Best Regards,
Andy Shevchenko
