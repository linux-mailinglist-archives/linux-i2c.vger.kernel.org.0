Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B781326179
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Feb 2021 11:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhBZKkz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Feb 2021 05:40:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:51216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230225AbhBZKky (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 26 Feb 2021 05:40:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FF0C64EFA;
        Fri, 26 Feb 2021 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614336013;
        bh=qtsNbxlwWusja+8qgfUIhAWUqV+NaDdmvSMT4ORU/CQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GBkGz5QJPyHmuazztCt0WheomivNVsz6a+EE6GjVbz7QUGYOl/8tu8D6GSm3l5CfX
         MmrOTKLmeAUMq3Avcl4vZzY4kr1sbXasCvKE+jK54PsKtftTikuFfG5n78a5sobKfK
         mCiM+RA4eQ1U2KKuZFIE1m4hLicsMpN9EPVW0F/YZbXk2MkHYCwAiXZfFdmlVboZlo
         +n0gRZN+6cxq1OVc2KuUN5r/kYAJIrFGMmmQkpgIx6khPvY9X7ka1kiEvYqJFj2t1o
         njJbGZbGDhKBYatcAAtHyX462FnRRj8pi49OWTqPLFHHvVjjsbUkh/GLkVabtOlPPU
         P1UaQKYPZlVHw==
Received: by mail-ed1-f54.google.com with SMTP id g3so10322678edb.11;
        Fri, 26 Feb 2021 02:40:13 -0800 (PST)
X-Gm-Message-State: AOAM530ZCrBtaqPeGeNmQ1NRnDODpJCiZy2/rN22V/qcfGtYhejPwaAq
        CmTi5g2HwRgGSMhTiHKBX6RpWBuKQA6Xoaj6qcc=
X-Google-Smtp-Source: ABdhPJzvD8qfYZQ8TNla0DO68ZCxCgmWQRYQNKcyGlyFWTS+CWctTyBGxzSdI/WIW1/CYu1f+fWhUXC4nN3dS3NOMEE=
X-Received: by 2002:a05:6402:d05:: with SMTP id eb5mr2500229edb.143.1614336012091;
 Fri, 26 Feb 2021 02:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20210216222538.6427-1-marten.lindahl@axis.com> <20210226103407.GF1014@ninjato>
In-Reply-To: <20210226103407.GF1014@ninjato>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 26 Feb 2021 11:40:00 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcx5a7m0ChqA8BimK=JhnzSgm0cx07RhSu+P8D-2YsfWw@mail.gmail.com>
Message-ID: <CAJKOXPcx5a7m0ChqA8BimK=JhnzSgm0cx07RhSu+P8D-2YsfWw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: exynos5: Preserve high speed master code
To:     Wolfram Sang <wsa@kernel.org>
Cc:     =?UTF-8?Q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>,
        kernel@axis.com,
        =?UTF-8?Q?M=C3=A5rten_Lindahl?= <martenli@axis.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, 26 Feb 2021 at 11:34, Wolfram Sang <wsa@kernel.org> wrote:
>
> On Tue, Feb 16, 2021 at 11:25:38PM +0100, M=C3=A5rten Lindahl wrote:
> > From: M=C3=A5rten Lindahl <martenli@axis.com>
> >
> > When the driver starts to send a message with the MASTER_ID field
> > set (high speed), the whole I2C_ADDR register is overwritten including
> > MASTER_ID as the SLV_ADDR_MAS field is set.
> >
> > This patch preserves already written fields in I2C_ADDR when writing
> > SLV_ADDR_MAS.
> >
> > Signed-off-by: M=C3=A5rten Lindahl <martenli@axis.com>
>
> Looks good. Is there a Fixes-tag we could apply?

The first commit, 2013 :)
Fixes: 8a73cd4cfa15 ("i2c: exynos5: add High Speed I2C controller driver")

Best regards,
Krzysztof
