Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E56E4ADAEC
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 15:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377226AbiBHONs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 09:13:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355312AbiBHONr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 09:13:47 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED22C03FED2
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 06:13:46 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id y15-20020a17090a474f00b001b88562650aso1685493pjg.0
        for <linux-i2c@vger.kernel.org>; Tue, 08 Feb 2022 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=wUs61oZJqlck5gF/NSnB+WfYV6TsIOcAjV18fUOsHlk=;
        b=ZuEWBeUc9bEG2LQdnQyHE5UBcFUs8oJSTQ6GPLYPoIjEhRE/LDCWcWCXCAU3m/eMVq
         ws08ZFiONPO0S/hSLSZomLJ9dX+wvzxaFBpOb8Ci4ojNJWNNgPXyTjv/T7lglm1xII/c
         wnGAlINh+EY26z0uO8ZPjM911jlqHBhj1tis9NjM3nd+eD6fTeFCwnrvSgO/VTch78J0
         ZKG2dYPFELaTD1C96wVBKYKu9le83VkbBjXJHamQatoBfxBk91rHxIEaHr4y4UiKNnvC
         jgAaIYjdqoAxzwc2FTLCK90G1ABjKKKZCdxEQ19loDJZmRnEPvkzZVCPWArpqmS8uPqB
         nvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=wUs61oZJqlck5gF/NSnB+WfYV6TsIOcAjV18fUOsHlk=;
        b=3nS0w1/IPGsuNJ11mm9TujEHCMoiOH/3HUnu/OJZUHydbsCLejrYuAxjpm62QWYz6e
         fCkjYWdB1RlJxaWq48iDH9tuJHXwBQ/qVsivNrK4B7xYkde9jkHGN880qYTF6U8sHxIi
         /4Ujgl+S14HgzKqYTkdT7LQVS3MaoRCxRltxB4L5DZU3OhgriZRns2Vzey+g2v9ocEDl
         HZafq5OuDdniFrN+WXPnNWUEPAJe7AEzfdWa9u5m4xl5/ZoTCd34rBgu95I+GnVkvvcf
         UNjwaPEcVKgxCRgA02dzySOY+JBeDse+tptNs+9tIHWLeXTpn5AxwOeE8v7r5zcIU0ZZ
         5RlQ==
X-Gm-Message-State: AOAM531k2mWHDyKJs2259iY3Jx7TuHBoYbktsGExVerP6k3udyfZzFH7
        Gma2xVfwCL6Z9SiR7bziIgXVKqpEuF5EqCRPsDqE/b1jRegGXg==
X-Google-Smtp-Source: ABdhPJzkOPqpuKjkoaUj11A2U5adT1XOMis3E2cn7BT/wkP8nSrGThhgEaXL6pbGnpEWOkbCWnGvmyLtRYUiMXiAwOU=
X-Received: by 2002:a17:90b:1e06:: with SMTP id pg6mr1633156pjb.4.1644329625500;
 Tue, 08 Feb 2022 06:13:45 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-2-jsd@semihalf.com> <20220202144302.1438303-1-jsd@semihalf.com>
 <20220202144302.1438303-2-jsd@semihalf.com> <YfqtkBIZZxp2Au2l@smile.fi.intel.com>
 <YgEr7LtUAd4QWiiR@shikoro>
In-Reply-To: <YgEr7LtUAd4QWiiR@shikoro>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Tue, 8 Feb 2022 15:13:34 +0100
Message-ID: <CAOtMz3MEFyW+g8n880rWiZbfU-2Gtfj2b3GNOtZswrFQg_m-yA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
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
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

pon., 7 lut 2022 o 15:25 Wolfram Sang <wsa@kernel.org> napisa=C5=82(a):
>
>
> > Side note, please start a new email thread for new version of the serie=
s.
>
> Yes, please. Also, neither me nor patchwork got patch 1 of this series.
> So, please ensure the series is complete when you resend.

Right, I fixed this in v4.

Best Regards,
Jan
