Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0162F1706D4
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 18:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgBZR6X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 12:58:23 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34920 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726688AbgBZR6W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Feb 2020 12:58:22 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so88780ljb.2
        for <linux-i2c@vger.kernel.org>; Wed, 26 Feb 2020 09:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UF1GUULDwls0dX46Jm1kXZ/MRKiSt1HI5s2crXeh/hg=;
        b=hk6O3ON4XT9tIW0H57cpnIhEbpNf6CCw2mf+ADjCIOuQXzOSaZRwdXt35GY1EHkhfV
         3mE/H6A6OZg7uNR/uGN2ANdEhrRcTr5klGXdkJsDLaeotebmgWiQnOYN3r7PmUbtSohg
         IFDk8E90rHatAUAzVW42dvkshbfZeixAgtLze/bBsQ7M+4wN+rNjzbl9gHevzl34eLsk
         q9Zr/4QY8QwWKXxnQmgabmA/xzUR0hsWMIvbc9zXCSCkzjXeAF+MISPg7OAOWgi5FqfA
         MYdZlZhoD2qfdPoDpCVRrdchIeGm2SmOzXLn64o0T6OdeJwXupe/85j/Op3y+r5s9KUZ
         BxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UF1GUULDwls0dX46Jm1kXZ/MRKiSt1HI5s2crXeh/hg=;
        b=auZREse/zx0GqqYZdcUEjRM1LddHniSVDb4tGU9Zz4vCej2tYMws0TIQgMvY2F94vj
         2j8SSmbMy/an76sHonzBxbvlkO2RK3AI5SyZxBlRMqL/MpkQkjyeQi1Cg6lY4bsp2YJq
         7zD4u3D5vjbqtWLj6DHKM250VvBKML3tzBqBl4cFamGXcIL22ROuLBMYIfFh9bnbzVwt
         gCTxmKSURHkW/myz6KriTudB89i0bBAbubMzbjKUFh0FY0ON+YkRC2RMbtbxqiTg0Zzj
         b6k6y4SRk6K7tpHhlu6qfjqE+wLtCHluObnSzUFBsZ/vw6G3tKXAdpOrJ7cdDmEbEkf3
         mP5A==
X-Gm-Message-State: ANhLgQ0FXkahpL27RADX/y6B8V0fp0qdApQYuh5LoMqPbSAtnSxQvEgV
        gEtKaaFeFzkaPUfQ1uuLHVRVmGvJ8aUYME1NWfM=
X-Google-Smtp-Source: ADFU+vsQ0Ku79EPxK0ivhSXLloaXRzaC6GvtqgzsKJuWjJ9PAx6vFD29+39TR2/7i5vgkjN5E14aXl7uBiG3Wmrda6U=
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr85504ljk.13.1582739900768;
 Wed, 26 Feb 2020 09:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20200224151530.31713-1-andriy.shevchenko@linux.intel.com> <20200224151530.31713-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200224151530.31713-5-andriy.shevchenko@linux.intel.com>
From:   Elie Morisse <syniurge@gmail.com>
Date:   Wed, 26 Feb 2020 14:58:09 -0300
Message-ID: <CAC_JBqpFF6BLU_cpW4prejWECdJCv_L7qDvVYaXjcJJRxvEOsQ@mail.gmail.com>
Subject: Re: [PATCH v1 05/40] i2c: amd-mp2: Use generic definitions for bus frequencies
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le lun. 24 f=C3=A9vr. 2020 =C3=A0 12:15, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> a =C3=A9crit :
>
> Since we have generic definitions for bus frequencies, let's use them.
>
> Cc: Elie Morisse <syniurge@gmail.com>
> Cc: Nehal Shah <nehal-bakulchandra.shah@amd.com>
> Cc: Shyam Sundar S K <shyam-sundar.s-k@amd.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-amd-mp2-plat.c | 27 ++++++++++++++++-----------
>  include/linux/i2c.h                   |  2 ++
>  2 files changed, 18 insertions(+), 11 deletions(-)

Looks good to me.

Acked-by: Elie Morisse <syniurge@gmail.com>

--
Elie Morisse
