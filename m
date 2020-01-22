Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10039145603
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2020 14:35:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgAVNSv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jan 2020 08:18:51 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:46332 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbgAVNSt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jan 2020 08:18:49 -0500
Received: by mail-qv1-f65.google.com with SMTP id u1so3151807qvk.13;
        Wed, 22 Jan 2020 05:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2lJ5QNgwpRzOQbAxO/609U7b0x37hAivNqISTiD3HWo=;
        b=aYOfRDZ2x/NIOkNxI0T5WwT9IKeenQ5Qj5QgjdSkvzB9zaLSPrFkdcP75g6PBgCUHB
         BjIFsqZVRyzDuGwoR0j6al2mPKgqO+GbTPu1LVjvaX2gOB1riGK/AN40r3hOtQM0pjv5
         JALRRXGAsu602xHDh+pTHWbYigHkO1rlKZZbAbE6GzAX8P6aIrnt50UuVG8+JmsbPcH0
         6YFBlNB596A+EuYvCJihR5OXrYrWVuXzYJQvjFgLATyLcO24tLeMxi6onhYovyCOp2dZ
         u8XazXCECVBembnkGztqlsVWhdjGj50kfaS4MuIaX6s6ZmtYLcPGjCGKhBn0Ztr5dFyq
         xR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lJ5QNgwpRzOQbAxO/609U7b0x37hAivNqISTiD3HWo=;
        b=C1/+h3GkJX4+flIkCC63Dqguq7KamjC98/Dk8Q/josOyCnPEUDmeBPOylXyMHPOdEq
         RNv+duaxobsGgyljexljpm1IK5TS0Y9+EDMMfZN5as6iDuFqNx1Tq9GIrejLx3zPTN6U
         WsYSh9P+atkJ1+YqkgjzVJQ5cbNSIIrFm65vbe0IfXtlsY+D6iIJMBtv0k/R2GuUgzCZ
         NBHiLJlPQPFv27NjAtJnEkQ1O7bbCMR77jDSo049IPnhnBRszjRRPUFuX+dS7rnEumbl
         w+0bTQHpjylxNHBEJ3EzMC/d5amM/kUfJepUfc1jp3c8c6G5Kjox3RPG9oT0ZkEUEZ32
         xXhQ==
X-Gm-Message-State: APjAAAVT/wIB+UMcXwplquN/eOniQCCKlBuEVcToreS0OSLabvVKi0SD
        LKBOcrJBNwkEJDx15zo+PpYvkMxukGPARUM+XSc=
X-Google-Smtp-Source: APXvYqwe1tNtAHutt+OKYyVgggbsjlCJPHnkoUAFE3fGJNLbqgPPHAYuflcG/x45cWhnXrOUgefEoGROyWiij874d00=
X-Received: by 2002:ad4:408c:: with SMTP id l12mr10445440qvp.164.1579699128301;
 Wed, 22 Jan 2020 05:18:48 -0800 (PST)
MIME-Version: 1.0
References: <1579581860-29560-1-git-send-email-gupt21@gmail.com> <20200122131320.GA20984@ninjato>
In-Reply-To: <20200122131320.GA20984@ninjato>
From:   rishi gupta <gupt21@gmail.com>
Date:   Wed, 22 Jan 2020 18:48:37 +0530
Message-ID: <CALUj-gsJ4aKDzir2qArSrt3uNMwO-L3KbOzUFpikj6K5pQ=wtw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: mcp2221: add usb to i2c-smbus host bridge driver
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
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

It is both I2C and SMBus.
Title of the product itself is "USB 2.0 to I^2C/UART Protocol
Converter with GPIO"
https://www.microchip.com/wwwproducts/en/MCP2221A

If I am mistaken in something, please help me with specific thing so
that I can dive more from that perspective.

On Wed, Jan 22, 2020 at 6:43 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> On Tue, Jan 21, 2020 at 10:14:20AM +0530, Rishi Gupta wrote:
> > MCP2221 is a USB HID to I2C/SMbus host bridge device. This
> > commit implements i2c and smbus host adapter support. 7-bit
> > address and i2c multi-message transaction is also supported.
> >
> > Signed-off-by: Rishi Gupta <gupt21@gmail.com>
>
> My main concern is there are quite some limitations in mcp_i2c_xfer().
> Looking at them, I think we should just drop it. This seems to be an
> SMBus controller, not I2C. Or?
>
