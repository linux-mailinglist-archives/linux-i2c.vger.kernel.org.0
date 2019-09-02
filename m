Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE97CA5DE8
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 01:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfIBXDG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 19:03:06 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:34796 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbfIBXDG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Sep 2019 19:03:06 -0400
Received: by mail-ed1-f54.google.com with SMTP id s49so16834506edb.1
        for <linux-i2c@vger.kernel.org>; Mon, 02 Sep 2019 16:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0bNUh5GpvlXK+d4bObYFTeJcSMlCeXRssDpmNhscW8Y=;
        b=AnjR5i0ww7D8H6oF4H/VKQJwgvPLhZ7wZjC0e+Bwcewyy+9ijdk4vnCiPvmR1bDwCm
         F1bIbaKbShjIT3rV9Y4HybCmysjo7KJhGkGyoF8/w+oM8tuEwgVbtqtmy8zz+tybaFPb
         gq3S+BdT/baNtE3V89Jm/6wIIj8VNLih2XbW5/7o7KB4FFhq7XMO6uTmfwkKVl1pQQOT
         6Wr/+rW5scw0wU4FAjyDLcKwZUFT79jxPxTtvQcejFriYcrDOYFv5byGg+h2aLXJ7o7R
         wWbFN8Qmrg38kbTVHkuIoqdEcwfsLZPoq4Pl9cTuot5+TluUjkFGuhxz5bJJkxlMnBi4
         4cYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0bNUh5GpvlXK+d4bObYFTeJcSMlCeXRssDpmNhscW8Y=;
        b=oITCz1zHnrJwnYKb8nmkrqYj42ZcUxTg2+3etoqVLWosQYxMLzEp+asSUS0+CPLYnz
         GWP20GVEz3hi4tIjvmxC1J9dimh6I+5Z1geAMrmWPtGTXsu5j1uv313dSvqjoc0LjUvk
         Cyh8hWBbqRUTWTqhlBPhJr1Y6ZjP9kgMgpo0do7S/zjJ/zvJfec8FCcjDWs2wizWmYQS
         x9iD2RM4wcnpwGAuyDkHFAU+rywZ05CHB6nLYSBRdZ5N5uXhJp237biMvkBFYS+nUkLs
         3LTs3RTVXcLip+FcgeBB2eQsvhqqThEcpKnvOSeVyDAbuvsDP6q4rOtu/02G68WOfWvM
         x1oA==
X-Gm-Message-State: APjAAAUUGhzZAt3VUz2AIOxx6Cp/87dbup3Hx/DqiMHVejfZmS0NiHU9
        hPbeKhlUITlkGVvye5UvGvSETxE7T5FvnwDnW04=
X-Google-Smtp-Source: APXvYqzqN+j0J1K11TS0Apj2DwyBCCsTgYkNvZh9JVJlbXLf1evK8tZ5K92jOEcqeF7sZdbgKcU0mjRs8dxGenXRNtA=
X-Received: by 2002:a17:906:64cc:: with SMTP id p12mr25746290ejn.176.1567465384799;
 Mon, 02 Sep 2019 16:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAFoRp-PH=Bjs+vSmCvA9i0X3Jw7M6zuUCew7y=A7gxNUSrRZ7g@mail.gmail.com>
 <20190902112902.6b1abf42@endymion>
In-Reply-To: <20190902112902.6b1abf42@endymion>
From:   Hans L <thehans@gmail.com>
Date:   Mon, 2 Sep 2019 18:02:28 -0500
Message-ID: <CAFoRp-NFnoA7-3-wuvzdCqyGfNG1RyOj61GZikBnB00NPt_gqw@mail.gmail.com>
Subject: Re: Problems with decode-dimms
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 2, 2019 at 4:28 AM Jean Delvare <jdelvare@suse.de> wrote:
> No, decode-dimms doesn't know about XMP. I'm not even sure if the data
> is inside the SPD EEPROM or somewhere else. So decode-dimms will only
> report the standard speeds your memory modules are capable of, not the
> overclocked / non-standard speeds.

I was just looking into this, and found that the Wikipedia SPD page
talks about the XMP data here:
https://en.wikipedia.org/wiki/Serial_presence_detect#Extreme_Memory_Profile_(XMP)
The wiki article references [20] this URL:
https://web.archive.org/web/20120306230940/http://www.softnology.biz/pdf/IntelXMP_Rev1.1.pdf

I guess this information is specific to DDR3, because my DDR4 shows
nothing around bytes 176+ (0xB0)
*However* it looks like the data is just shifted down into 0x180
instead.  The data here begins with the "Intel Extreme Memory Profile
Identification String": 0C4A, same as the Rev 1.1 PDF describes.  I
haven't checked through the rest of the data to see how much it
matches, but it seems like it may be feasible to report XMP info.
From what I've understand, XMP 2.0 was defined for DDR4, but I haven't
had any luck finding a public spec sheet for that online.

-Hans
