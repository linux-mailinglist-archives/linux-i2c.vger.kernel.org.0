Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 101C54B1903
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Feb 2022 00:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345406AbiBJXF4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Feb 2022 18:05:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345405AbiBJXF4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Feb 2022 18:05:56 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA7555BC
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 15:05:56 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id i30so12952200pfk.8
        for <linux-i2c@vger.kernel.org>; Thu, 10 Feb 2022 15:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=kJZrXnKlSxrjXbd3RYug7qVrQuHlSubZSZCjGAgo8T4=;
        b=pNQoziWj07h4zslfeAEKP41bWOo3sO/yJWcqO/A73915ts3EeEVSQ4oiToHcfESyd6
         GtjbtUCRsXDmi5XhNLoKpIK+lpE6SKAUEn9hIcmwm9XRM+FJSqsavYN3wmCSKuWdyCs+
         ESTvUDypoE9TvzXF/2Qone/FMH+zNAOxzReSpY4FP4s7hdn5CPpj5V3i1cr39euOtWUy
         UBOylmxUTqoEAeB9fevPvnaSGagIyLO6esskwvDnj0cAnEyXWQ0MwIB3iO6HIqagSs3H
         I71bXk1pl9iaYcP7aNN06qvVWbCYJ+S8J4FtmJg9VmpWCQYx+1oZhR/2BRIFC8PNiluR
         31iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=kJZrXnKlSxrjXbd3RYug7qVrQuHlSubZSZCjGAgo8T4=;
        b=IFetlNUlssR/Ygi9gvcTQoGf0tBlKZI1mH6yy4fWOzqOYoTxovrGWhgMG5L4NkvEAG
         pxZK2sseQ2PEW6vZNac5xBxx9IECbZkpTaF6/Xg5aSxlPlV2tM/ipWWYTlDuwf9SknIR
         L7WqRBTVArykfj98gcib76lyhlqS2ekSUjW3KfLkcSxRTXqF1RJ23srPHvlTi94hfQPL
         gOnYTS6At1Ozq11e7BDvbQpBItlb+dXQzUCcMhWQgt62fiJMrxhyh1160fgeLI7x2Y2u
         vNU+vbWyqx1lK4Q17kKUgJTqngTnesRRDMM8HVE075w4wD8DlWWU1m5uZBh4dN1Qz9sT
         yB3A==
X-Gm-Message-State: AOAM532WS/IqeYHzwrJ47AsR/jf+/wGVlp0X2UWTLx3Itg9GxpslcNHD
        IhP7yI4uw9ddF9IUM5KsgwXBgg5eSPoPjCxf9agrmw==
X-Google-Smtp-Source: ABdhPJz+Z/Y4py18mYB9eOlDDSIClqj/qJhYYV/2ESV7+c6avGFBXkdIO0PdvABjMYEYUn0hB5b6yrkhz+rDHKAmWJY=
X-Received: by 2002:a63:6a06:: with SMTP id f6mr7998246pgc.18.1644534355976;
 Thu, 10 Feb 2022 15:05:55 -0800 (PST)
MIME-Version: 1.0
References: <20220208141218.2049591-1-jsd@semihalf.com> <20220208141218.2049591-2-jsd@semihalf.com>
 <YgWMyj6ZZzBQRODX@kunai>
In-Reply-To: <YgWMyj6ZZzBQRODX@kunai>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 11 Feb 2022 00:05:45 +0100
Message-ID: <CAOtMz3PLx4oqDYZ19vDrSXJkzhUXhWAKwvxBz=V8S4b4xEEQhg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] i2c: designware: Add missing locks
To:     Wolfram Sang <wsa@kernel.org>, Jan Dabros <jsd@semihalf.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>, upstream@semihalf.com,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Deucher, Alexander" <alexander.deucher@amd.com>,
        "Easow, Nimesh" <Nimesh.Easow@amd.com>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 10 lut 2022 o 23:08 Wolfram Sang <wsa@kernel.org> napisa=C5=82(a):
>
> On Tue, Feb 08, 2022 at 03:12:17PM +0100, Jan Dabros wrote:
> > All accesses to controller's registers should be protected on
> > probe, disable and xfer paths. This is needed for i2c bus controllers
> > that are shared with but not controller by kernel.
> >
> > Signed-off-by: Jan Dabros <jsd@semihalf.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Applied to for-next, thanks!

Thanks!

Best Regards,
Jan
