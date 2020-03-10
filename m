Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D66517F725
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 13:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgCJMLo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 08:11:44 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:44228 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgCJMLo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 Mar 2020 08:11:44 -0400
Received: by mail-qt1-f193.google.com with SMTP id h16so9380918qtr.11;
        Tue, 10 Mar 2020 05:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jt79snC5Ck9GdmHCqifHja5JE72+04hwhwUIgFwsoJs=;
        b=VLyKRhXJYcg7RCztvHPC9b5FOb1qSWoZtV8BdnSN3AdCLBYYMgTE0uzPo2ZFZd89Xg
         izUpwCqX9zyCviNlSYJwGzvHjr92hUIod8weznD4ibUp/acnhsVS1+QzQ1FMuaWfCd9d
         tHV+hP8oDm4yhTkJfKUZ7u30+58yage84D+gpLtmO55OkHYVrMkc6B6XQ8OgTfSy8jQR
         dk7FISurLCF5GD6yfv1WiqfW/UPP9bS32/T2QaS9zktlrDpfqfx4LO2uUZr0zsBA8Z7w
         n00JURu8YcopR4WOHu35w+DmZjH2aJT0f1v3Yl1ZZFnKcs4DOGTq2GH5j86IJrv0DyxZ
         9/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jt79snC5Ck9GdmHCqifHja5JE72+04hwhwUIgFwsoJs=;
        b=qDcwDdIlCHLIb1yFh1Oqr9V285gWSqH7CJ1n5MM0X+VMlHdgeYU3t5oF7AAVzeuBI1
         iWfiHquF/F6BeEPTUrXxQ/isXfeVTxKsh+Xm/YCxq4752YBimwzC3CgeRE+EyavetJdh
         lqN+sXSvLNPJDDkXtdFY9kQp5ziQh/U8mRx6+DIs1mwlxjUyRNRpPP4GRyTd0anadHpS
         4SrWnUA1VR7+Xif96x0704XYbvLCVLbjykXYZubWYGjvnemhb7Qk8jXzkUBqeE+/9u4F
         sD3BYQ1Bq5BB6HqDUq2NVVKym4Pb6OT+uSc3FJbzd9hFJJvVWw0PSHlzLiU8slcYuP5T
         EWxw==
X-Gm-Message-State: ANhLgQ2+ZVXIhC1xLrZOaUCacVUwb/gb8mr9aJSL/+/5BDv7aJ3xwvB+
        wgocP8eOY92FcxPmPiAOTIjDfDtxwqv47Op9CgU=
X-Google-Smtp-Source: ADFU+vskPzc35t1H25E3s3HpAGVBfpG0vWNTuqrpxtNONzwU0XuGsG+Qih97IXnwq96KiNHIm7cDbMcmX/J1juGftow=
X-Received: by 2002:ac8:4c8f:: with SMTP id j15mr19147393qtv.232.1583842302771;
 Tue, 10 Mar 2020 05:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <1580185137-11255-1-git-send-email-gupt21@gmail.com> <nycvar.YFH.7.76.2003101241580.19500@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2003101241580.19500@cbobk.fhfr.pm>
From:   rishi gupta <gupt21@gmail.com>
Date:   Tue, 10 Mar 2020 17:41:31 +0530
Message-ID: <CALUj-gvUthgPRFBje3uJf03S_Fh2m5Ez6JX-A3-mvdW9TYvHhg@mail.gmail.com>
Subject: Re: [PATCH v3] HID: mcp2221: add usb to i2c-smbus host bridge
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        wsa+renesas@sang-engineering.com,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I am really grateful to you and all other maintainers.
You really do a lot work; code review is a manual and time consuming task.

Regards,
Rishi

On Tue, Mar 10, 2020 at 5:12 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 28 Jan 2020, Rishi Gupta wrote:
>
> > MCP2221 is a USB HID to I2C/SMbus host bridge device. This
> > commit implements i2c and smbus host adapter support. 7-bit
> > address and i2c multi-message transaction is also supported.
>
> Applied; sorry this took me a bit longer to review.
>
> --
> Jiri Kosina
> SUSE Labs
>
