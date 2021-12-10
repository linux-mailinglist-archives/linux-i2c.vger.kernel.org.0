Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59979470B7E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Dec 2021 21:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243176AbhLJUMY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Dec 2021 15:12:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242594AbhLJUMX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Dec 2021 15:12:23 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4CACC061A32;
        Fri, 10 Dec 2021 12:08:47 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id w1so33158985edc.6;
        Fri, 10 Dec 2021 12:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zjHbozy8lTEw3S9Lfcr8vZlenDvjXEkS7qIHLdAcDg4=;
        b=mTUaCWFS9m8JKY04hj2SpDF4uM+U+OZm1n77NagK7gdfu4PTiknx/Bncc5YVDHs0nG
         sPMw/bXqKgHwCmoLQYwpDVSRMvGxUz/sweJD+sP2QbhWddbja4m2KOZ6j9aXcGdZpI74
         bUkmOPTEBOQ67ni/GfBQBXpKTW9MGrSb3lkYgj0PyooQBd/j2m1YN7pGqk/sPxLMvXbs
         O72UGGudJWkipw2xE8FC6luc7Kvscw9TwZh1YpWppvknx/ST4Vzj6dSlNYgdA6OJQLl9
         Q3ypI4HbXOvYgY2zlCxEauBpc6TdJy7R68Veut2ywjn8IPOnqdFRn8SeOob16scbdeDl
         tREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zjHbozy8lTEw3S9Lfcr8vZlenDvjXEkS7qIHLdAcDg4=;
        b=WPEvyK/5fEWH/u38E5ZfY7u5ii3tqUU9jd9lYciZCtprc88uqVgEKLHIu8N2IfhNHb
         zj1DndybL3pISVDk5/VL3HzSPkRni1J3diyNN0TUXWCy4Wn4iNP1k2Xgqoxd2xbiYjXD
         fDYiAZkX/RqxHcx7sIgBTyd2QnY4OHZ0KynOJ6+bi9pQ9QZiD636Bs+F0pQ520oP51D8
         iwYl6SLto8e/47JolCka/9mYMX2x+hcOH0zkAPnOfFKvGF0qeUZxMsF6mQvsSFuQOmRB
         eQ0BSMxQw54VQ9VdTpzfksk0/11sTGkV05b5M91AXVUbGF27mbKlMYqWnUqvWFFsin3f
         lbDQ==
X-Gm-Message-State: AOAM533FU0UFJoyTOgILEWm3eVcS9uOria6BwSAPVWrZZMPMpt/rt5gH
        NKKK3A3/Tsm5+WyYSTfTxtgY9EWMerEqknNo8kE=
X-Google-Smtp-Source: ABdhPJy6CvrLI2nJiPz+lJ9iWb5YgAsn9Qunps3UJrbeYJg8cz3p6VEAg92FM5GUe79+D/1/bXAgZOUVLBf/AGI693Y=
X-Received: by 2002:a05:6402:291:: with SMTP id l17mr41658073edv.242.1639166926056;
 Fri, 10 Dec 2021 12:08:46 -0800 (PST)
MIME-Version: 1.0
References: <1639138557-1709-1-git-send-email-akhilrajeev@nvidia.com> <1056abdf-684b-b808-3471-d4733fd5e449@gmail.com>
In-Reply-To: <1056abdf-684b-b808-3471-d4733fd5e449@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 10 Dec 2021 22:07:14 +0200
Message-ID: <CAHp75VfykSN6Jnoq6XsEL7W9+yCq-uwRdFRTSAJ6bBuYCuMa5Q@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: tegra: use i2c_timings for bus clock freq
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Akhil R <akhilrajeev@nvidia.com>,
        Christian Koenig <christian.koenig@amd.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Dec 10, 2021 at 7:24 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 10.12.2021 15:15, Akhil R =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Use i2c_timings struct and corresponding methods to get bus clock frequ=
ency
> >
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> > Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Note that your s-b should be the last line of the commit message. No
> need to resend for that.

AFAICT there is no such requirement in the documentation. It says that
SoB should be last among SoBs, which is not broken here.

--=20
With Best Regards,
Andy Shevchenko
