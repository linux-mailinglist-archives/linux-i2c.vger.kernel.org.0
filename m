Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D7C44EB56
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Nov 2021 17:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233776AbhKLQa2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 12 Nov 2021 11:30:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbhKLQa2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 12 Nov 2021 11:30:28 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A42AC061766;
        Fri, 12 Nov 2021 08:27:37 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id w1so39973263edd.10;
        Fri, 12 Nov 2021 08:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zsV/+JajBxvECqgbXU5NctAri6DYeUe5QDRJp9nyrJg=;
        b=ogU4LKqIquQfYvcTURyCoxooGA5B97aIP5e8GRtRGNKGKQUiiyFn15nRjAbjb41ius
         3QYwyT7Phtj3CPE0Bge6ag/7f83S4uSyhdVthjByERbcQBoqpgjkGiGH7HUl0ik31VQF
         LecDC5ZZsGXJIemL0f3qYOjzwcRFmA7sMNO50zlP4YoPOAhhXGtZ4VZHZ7lKQr0Pujxh
         symWISZMrrMhqtIF2OL7MGVBhpj74pkAHz0LsBD4ctT+abkCGvvBz3r8ea2HgIHU4oCx
         YKtCCpvHgz8HoWp3chYdfsMPn0D7+dl0/0/vTV7f/hP3GNybTYLfiV0j5muojdRLYE4R
         jyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zsV/+JajBxvECqgbXU5NctAri6DYeUe5QDRJp9nyrJg=;
        b=g9l+r97Ow+t5vc5cdPg/+aQrTnzJrNI9Nl88bcAZy5mBS0vp6B0ROJ9egQV8NcGt3a
         FGfLRGwmeJvDOOmOPoKz+SsbkYDAWs2yo9bIt8+i8QVt6XpuHg3AFqRuHhV/fSLRsz7b
         anA98U0H95bJjquwmE5D10UJHFE346wuazxrhnGLypZr1D+pAu1HAI6bATPNaMtHiNuV
         TAPJkCDGzJ1hTKiJEvNwoJdWpvdeeaMweeJsWZya6rVf/1Tg71iuBIRfAaD16N6xd+vw
         5mmwZ/VsIGCjCkLjC4ZbzJnSeuWy0BwqZ0hbJ+lq5XP3J9pgH1TjNpesHbpw0o9+Ujsv
         onJQ==
X-Gm-Message-State: AOAM530RkEpGwlZsQ03/3DB1OlxEV+RTbeJ8jp5BuIaoIfQ4FoeiD1wg
        qBmxYUYSU5ieC4Lzgj7nkCMmE83GibOlzk7O2HY=
X-Google-Smtp-Source: ABdhPJxeqCVsiCw3yPwtaWfyCpvPNyLLBDAAJAxRBY2VK9j+T6vNq/QWiFRbH2vcqo59W+MDFD+5QaAdM78FBILa7Ng=
X-Received: by 2002:a05:6402:c89:: with SMTP id cm9mr5258389edb.283.1636734455894;
 Fri, 12 Nov 2021 08:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20211112123459.73538-1-andriy.shevchenko@linux.intel.com> <e62bf878-03df-1b93-2177-7b8a3be293c4@infradead.org>
In-Reply-To: <e62bf878-03df-1b93-2177-7b8a3be293c4@infradead.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 12 Nov 2021 18:26:52 +0200
Message-ID: <CAHp75Vd71WPosA8Sy999Mb5ZiGEGg-y3vxYsYz3st5Ng2PJ98A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: designware: Fix the kernel doc description
 for struct dw_i2c_dev
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 12, 2021 at 6:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 11/12/21 4:34 AM, Andy Shevchenko wrote:

...

> > + * @rinfo: I=C2=B2C GPIO recovery information
>
> Preferably:   "I2C"

Why?

> like it is in thousands of places in the kernel source tree.

UTF-8 has been established for more than a decade. I prefer to use the
proper form of the abbreviation (*).

*) Check UM10204.pdf.

--=20
With Best Regards,
Andy Shevchenko
