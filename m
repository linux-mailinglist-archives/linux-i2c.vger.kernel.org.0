Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF3AFCB6A0
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2019 10:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbfJDItE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Oct 2019 04:49:04 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34621 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfJDItD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Oct 2019 04:49:03 -0400
Received: by mail-oi1-f194.google.com with SMTP id 83so5150445oii.1
        for <linux-i2c@vger.kernel.org>; Fri, 04 Oct 2019 01:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4srUMAb9FodN25eyle5Udz2pjw/o6POWzQ4a2VYu4x8=;
        b=gBzaLleNeuh/7+w94uvLf91O41Hw0TEOL8kO6Y4TJL6KpGs3D27g923Unj4k8DGh4o
         jr67LqYQ7gFSdVSI+2Jf7tHDnv2q3+r3CuVjhkY4z4djmIXOe0xdhNM+/DA/2JyBn3Uq
         YHAHkgOzQAfapk5ekUKtDfG0YlR8LOH0Re6ncKRkQwCLJJHtha+h0jRkz+RSCz4pKB3l
         RQV/J7w7smROfanllT8wsRYUP4tgdZV6Fs8z1dNSAFzbLSYL/uMM2Rg3NeV+1LSirxyi
         +5Cav8usW6+8Z1NZLNx22xMq+1bpsVmVYSgo7JlRqNPhH5M0mkCy+JmRyHPvZfkhw0bb
         qq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4srUMAb9FodN25eyle5Udz2pjw/o6POWzQ4a2VYu4x8=;
        b=tAiFknt2qFMQU+OWatwajOjm8/+FKP2l67J1XOHKc/Qp7/6gHo2lcvtYj+HRBrqW6m
         bivto/3eFMsiYD3n4aAkXKOMeNtIjQx/8u9vdhtwXTdqVxUfYYyJS4Cijyk4qbXvy7fD
         Se8WaUT5IhhxZhm/hwZIyS/6RSS4UeCZKiGVKgJEwy1oHErz79oqhej9P8mRRlp1LWRy
         yt9cX+HKfc4reUTf1Y58n1X1EZzdBOusLp9DO2or8/Bk5Pi6+WFRCsSy8BmT1GbAwv5K
         prGyVe/UvwI4HWYa53zLfG1GZQzgXk5BpJ2JKqAWUV/TiG0dMV7dQW2NcNjQNRKqhfwq
         nF1A==
X-Gm-Message-State: APjAAAVwtBaUKjVzmJ6OmiCprHujO4WTg4Kzu5kEl6aTXSVYng/Cw88J
        lh0+sxYjPKYhORvW5JBx5wbW6IMxDh2qTcX3T/Xtsabm
X-Google-Smtp-Source: APXvYqxB3FjxCSW4t3tUHQFpXgbmjP0ZxbLdbnBIWoIs47E9C9X3U1Q/u1YOAzY3s4q2F27xtoL7RLq/qrt3asXR6Kk=
X-Received: by 2002:aca:ad09:: with SMTP id w9mr6306968oie.114.1570178942848;
 Fri, 04 Oct 2019 01:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191004103748.12076669@endymion> <20191004084326.GB1405@kunai>
In-Reply-To: <20191004084326.GB1405@kunai>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 4 Oct 2019 10:48:51 +0200
Message-ID: <CAMpxmJWfRcteDp8qD78Cg2XwCeTe=zTAnov6M_5nmhN8hoTCgw@mail.gmail.com>
Subject: Re: [PATCH] eeprom: at24: Improve confusing log message
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

pt., 4 pa=C5=BA 2019 o 10:43 Wolfram Sang <wsa@the-dreams.de> napisa=C5=82(=
a):
>
> On Fri, Oct 04, 2019 at 10:37:48AM +0200, Jean Delvare wrote:
> > Currently when binding to an spd EEPROM, the at24 drivers logs the
> > following message:
> >
> > 256 byte spd EEPROM, read-only, 0 bytes/write
> >
> > The last part is confusing, as by definition you don't write to a
> > read-only EEPROM, plus "0 bytes/write" makes no sense whatsoever.
> >
> > I propose to have a different message for read-only EEPROMs, which
> > does not include this last part.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
>
> I like it!
>
> Reviewed-by: Wolfram Sang <wsa@the-dreams.de>
>

Me too. Applied right away.

Bart
