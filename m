Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 700D518EC73
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Mar 2020 22:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgCVVK5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 Mar 2020 17:10:57 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37235 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgCVVK4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 Mar 2020 17:10:56 -0400
Received: by mail-pj1-f67.google.com with SMTP id o12so1337591pjs.2;
        Sun, 22 Mar 2020 14:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ai9RtqjCu+OJpSZhJLiunddst6+ShA+X0m0X5Zucg40=;
        b=c3ibGZAQz9x1uNUWH6sf4F26QawUchWnGrdn6wPpnQXirGBrRi4dpwn4Rgxxtu4xjh
         K+d0lvCzs5dm4IoMtFjW7bLThzBzX8HrMdHaL5LCAQk8njdNb+e7NGi8vomVXixMdCSy
         n4r73X3z5tqHoj86rIylt8Tbh03mqlsHnJtHQCe7rfq8PvArNFaOu4CCN7mAbwyQlBnY
         db/cyNAA2DmNr9ioOLwIsp24gmWUONRwNXnd99d8YsuArEN1emTd9CQuCrsgpKFeoyfR
         N6fT2E2Rn1wgYpbk6coZ1PCawPmip2rcCSn5cu4UsMnjvwmy4p4971955VkWCXKM07Y7
         cW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ai9RtqjCu+OJpSZhJLiunddst6+ShA+X0m0X5Zucg40=;
        b=EJdP7oZTW/QYRn7YCOhViTA1MeKJPYRf0NVBiIxbWxYBSdGA2v/GIs9Aj98wVPfefI
         Sw2HvXS2UUBgurtATlOvVNxs+cVnNP6HqrYyLEO6ZqYNozPSaiPjneeNTNgc4VCWJN6+
         znfenKx2LA5yVlG8DwdVH+4w/2/r3MNKF7c/Am8SzxjEXM5Bddv5PKtT9D1hFvpWPYVU
         FdUCCO2KWI8VY9mvlPYs7a1bEMWVy6872KhpVtblW1wiaeqdfIhBxN51/K9tnPO6+vFc
         TvrC9TVWR5w2mMBdkcdrWdgLfpiyM4NYMZOCULjx2QgC3WC+GJrP1YMTvYQ1TPSoaEps
         RcDA==
X-Gm-Message-State: ANhLgQ3p7rDfy0cmNt7sA88W0o0gSwFCaYHVZ+vfCE/KFcoTEdANMWrX
        WlrzuJa8UEG2IYqwPr5Vh5d/xZQBxV2ych43U9k=
X-Google-Smtp-Source: ADFU+vthjNlU1cT8P22d8fLkoNTw87YK9kBROPaaLkHiKA206Xg3msj0bTY94bgHldcilAnkBNIqQrUJt3Ty/NcEddI=
X-Received: by 2002:a17:90a:3602:: with SMTP id s2mr264038pjb.143.1584911455145;
 Sun, 22 Mar 2020 14:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000009586b2059c13c7e1@google.com> <20200114073406.qaq3hbrhtx76fkes@kili.mountain>
 <20200222124523.GI1716@kunai> <20200320145748.GD1282@ninjato> <20200322190813.39b92de2@endymion>
In-Reply-To: <20200322190813.39b92de2@endymion>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 22 Mar 2020 23:10:43 +0200
Message-ID: <CAHp75Ve-_KwH51pjnuZQAkaRsZVGuimBM-03MPW6j_nxgadx2g@mail.gmail.com>
Subject: Re: [PATCH] i2c: i801: Fix memory corruption in i801_isr_byte_done()
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        syzbot <syzbot+ed71512d469895b5b34e@syzkaller.appspotmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Mar 22, 2020 at 8:11 PM Jean Delvare <jdelvare@suse.de> wrote:
>
> Hi Wolfram,
>
> Can you please bounce the previous messages in this thread to me? I was
> apparently not Cc'd so I'm missing the context.

You can always take it from patchwork
http://patchwork.ozlabs.org/patch/1222542/

-- 
With Best Regards,
Andy Shevchenko
