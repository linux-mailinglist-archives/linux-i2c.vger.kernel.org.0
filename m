Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC4926A1EA
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Sep 2020 11:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgIOJRz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Sep 2020 05:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbgIOJRm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Sep 2020 05:17:42 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50103C06178B
        for <linux-i2c@vger.kernel.org>; Tue, 15 Sep 2020 02:17:42 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id b12so2299779lfp.9
        for <linux-i2c@vger.kernel.org>; Tue, 15 Sep 2020 02:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=1/4JPb+qyZHZrcotwK7O29U3MTuAJPswe26YQQLoaeI=;
        b=d1YVqwB8Cz0cMNPX6fN6wizi3UsZJftqgAUwnlh53zqZ87HgGBzbHdxX1Bq15ErtI7
         r1Q3hxvf+3oKlbnEJZcuy3rjWKeGpP0QR2gQnOW4iKf/Y27lJdPk9h+d4Uzvqt/Gx4Pg
         JxUbsBL52gzlb02QZjX9453BgqFQVz1AI+JGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=1/4JPb+qyZHZrcotwK7O29U3MTuAJPswe26YQQLoaeI=;
        b=KsG9xwkEqib5pjez7dhEw6RRHOezyE6BemqdR7uCulHGy61PhEpNTPJxI4p+t/e+AJ
         7/PMnrkXNlhRlJAU99Y/nFTxHQRGZeMGHeNgmsy2kw1FgUX6+8nlziMY1oTEeYTxOFVp
         Mdr/5UQATdyW7YHUVn7LPhhKYB+XTqKQf6vLGsVhEBX819dclXRk0FF37Yo/BYgpn/IE
         q8I9AZJwtVefxzwYx6+b+UmgbJmg6wBaj+Ie3e5KspitAm6AjB5yleElfqMlJLdqXjbv
         ckERxSK1rTVgFVpI81LiLueZkGj85TLRLe3z6GdKtaCTBUA3c0THQizwUWMk+Eauwj6w
         FdWw==
X-Gm-Message-State: AOAM532S2n/fGRT/Ss8SYs0Sf/h3en9Y26ZfeYP5TxeCVEvFASr1fNqq
        EklDGTwBFKtb2C/665OB2c7LeZAKsFYcOhVldjr2KUhsI7/U8Q==
X-Google-Smtp-Source: ABdhPJxavpKOCr9XPvMS3/1dzn34aJlO/M4dtJ+w8lEkySZvOfgK5pjBZu9JUKxm/dQAfNgUProUv+U8J347usOsgpQ=
X-Received: by 2002:a19:8001:: with SMTP id b1mr6064835lfd.122.1600161460136;
 Tue, 15 Sep 2020 02:17:40 -0700 (PDT)
MIME-Version: 1.0
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Tue, 15 Sep 2020 14:47:29 +0530
Message-ID: <CAHO=5PHaJbNxQk3DN0wxD0ZaftrQDe4qMZc4L79vgwQpjHL8qg@mail.gmail.com>
Subject: Question on SMBUS slave transmit with PEC enabled
To:     linux-i2c <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello All,

I have the following questions wrt SMBUS PEC support on the SLAVE side,

As we know when Master sends a read request, Slave keeps on
transferring data until STOP/NACK is received from Master.
This means Slave doesn't have a prior idea about how many bytes to
transmit to Master.

Let's say, the Master wants to read 1 byte of data with PEC enabled,
in this case Slave needs to send a total of two bytes (1st byte data
and 2nd byte PEC).
When Master puts this request on Bus, following events will happens,

1. Slave sends 1st bytes
2. Master receives 1st byte and sends ACK
3. Since no STOP is received from Master, slave send 2nd byte (But
Master is expecting PEC bytes as 2nd byte)
4. Master receives 2nd byte and sends NACK/STOP.

This means Slave didn't send PEC byte and is no longer driving the SDA
line to send PEC bytes.
When Master checks PEC it will not match and Master read will fail.

How do we handle this case, what is the expected behavior from Slave
as per SMBUS protocol ?
In this case when should Slave send PEC bytes ?

Please let me know.

Best regards,
Rayagonda
