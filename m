Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE8744AD85
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Nov 2021 13:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242439AbhKIMdY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Nov 2021 07:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbhKIMdX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Nov 2021 07:33:23 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0518C061764;
        Tue,  9 Nov 2021 04:30:37 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id f8so76136636edy.4;
        Tue, 09 Nov 2021 04:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Izwf0rNKbmjX//l6OqTNxretUo1ZACTCQZpG5D1V0qY=;
        b=Z/PuwOPXJ3QyXPwgTI9wO+h6I0yH2IfB0vfbX7zfIkNnrTuYgjwNTg8gUcIk9r3Lsh
         nq7PTATk9O6PgJ+Ps9johoCLk8wGfs7N7urFewvSeQoV3S6g6hoyGPSPFSlhGO8nswXp
         Wopwg9j50Op5IceG+odtGlfYttvwgb1Sp+2Opeio08MxPEP3azmUObThzL2+t8tsavPL
         CfuvmInv622AoGVMwFbIWEPuNLZ+PyHulPDOIBAA2n6T9PplQExr3+UgfsETC8q8QL0S
         aShTqkuyTtNI9AikZdMlx2sZ93ysgYLssinbMA+BR8WiPO7Gjfofs/3ddjA5wtnWVCNt
         RZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Izwf0rNKbmjX//l6OqTNxretUo1ZACTCQZpG5D1V0qY=;
        b=yXZzWshZouakFaAt0ML41JbzHDadg5i1PJmJicuwvE6XRymDw7f/6UEpDzTUsFUuJV
         Qa84WOKfY32yAAdxMsDHb7dbrG7hYVsMqgPHs09dvUfCPHlWJRg2kxTHqLWftqhXzX9I
         231t6RHs3rdvb8OL1hLi/1utPxpGNB4NJE3gu/o6su75/mcoLzb0vko5k9p1+mjnogEv
         Or8vCAbFpZKr/vd2RgYXsHxmUD6LgqYcbDhGEu/v4u4HO1euoZyGXjCjVEOaKvi6FYPr
         VVEG0Uq9Phf41rmLjnIwakSJ2aeknfBRF/JhUYDpBMV1ktksNKsZpZ1iy1+8K/CPhqiJ
         3xkA==
X-Gm-Message-State: AOAM532bWQetsLIv+POWSkF9DnNbsK0pNbtyAAacJZyjNWRTGcAws2UF
        BZYnSvDVqyNV9GYq2KBA4UNnRsGjo3+OWGgqaC8=
X-Google-Smtp-Source: ABdhPJxDCOOSrJrsdArOYFSqCctbOnu9Joe6Dm69fx4ZRvWaZkOHluNqKBfMst7bcVTnfdqsUbuH2jYNQs+b4XxgduE=
X-Received: by 2002:a17:906:489b:: with SMTP id v27mr8851114ejq.567.1636461036427;
 Tue, 09 Nov 2021 04:30:36 -0800 (PST)
MIME-Version: 1.0
References: <20211025094119.82967-1-hdegoede@redhat.com> <20211025094119.82967-5-hdegoede@redhat.com>
 <YYpmMNefsGUhqJ9W@paasikivi.fi.intel.com>
In-Reply-To: <YYpmMNefsGUhqJ9W@paasikivi.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Nov 2021 14:29:51 +0200
Message-ID: <CAHp75VeGR8_53ZEXAtQ9oQXGfLoVfS6a+RNWWgA6Hi6oq7_02g@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] regulator: Introduce tps68470-regulator driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Nov 9, 2021 at 2:14 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Mon, Oct 25, 2021 at 11:41:12AM +0200, Hans de Goede wrote:

> > Changes in v4:
> > - Make the top comment block use c++ style comments
>
> Why?

Subsystem maintainer requirement.

-- 
With Best Regards,
Andy Shevchenko
