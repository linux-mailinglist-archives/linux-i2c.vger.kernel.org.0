Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0462626063D
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 23:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgIGV0H (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 17:26:07 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:23387 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726929AbgIGV0F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 17:26:05 -0400
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Sep 2020 17:26:04 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599513963;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=MEfJczHxjUwwNdro3JsOxqEL/t/8Utf3ZeUeoMIgX/E=;
        b=ZTeGjhiUKDxQupH9J7fC3nGdZ07bdHTfkA7B6lfiFVggja9EYyoDauOeLh9OcqOX1i
        pgmHEVSwFE6/72zgV183w7T1sN9H3H/f1XOwq5tJrDWwdjGZ7uoEEmJfKbnncbftXR4o
        VAPE+oKxEvFNqNrZXUb/bRMXn7c4sIMnaMCXUB2i87aW2/0jvitCaEGUjerk+jdpgYzL
        Pb7PBHNDb4f51S0IixArSi1rgKDb1D/w/HlJDmXKyG4JfzgyOi+jtND93eSRQXSHsQ30
        mt0YLlEo5okWkU6oHn/U0husO6k1YWeVP6w1PBifGxko2NvdUllte8L9ZfDxiNSbtE77
        WGPg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCv/x28jVM="
X-RZG-CLASS-ID: mo00
Received: from oxapp06-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.10.7 AUTH)
        with ESMTPSA id e0624aw87LJxMv7
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 7 Sep 2020 23:19:59 +0200 (CEST)
Date:   Mon, 7 Sep 2020 23:19:59 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Guenter Roeck <linux@roeck-us.net>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, linux-i2c@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Message-ID: <919936154.542022.1599513599331@webmail.strato.com>
In-Reply-To: <a89b6ee3-4b69-422c-4a48-d105ff8807ed@roeck-us.net>
References: <20200901161756.28100-1-uli+renesas@fpond.eu>
 <a89b6ee3-4b69-422c-4a48-d105ff8807ed@roeck-us.net>
Subject: Re: [PATCH] watchdog: da9063: wake up parent ahead of reboot
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev21
X-Originating-Client: open-xchange-appsuite
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> On 09/01/2020 6:48 PM Guenter Roeck <linux@roeck-us.net> wrote:
> 
>  
> On 9/1/20 9:17 AM, Ulrich Hecht wrote:
> > This patch ensures our parent is awake before a reboot takes place. This
> > prevents situations in which the I2C host has been suspended and cannot
> > be safely woken up anymore when it needs to talk to us.
> > 
> 
> Why not call pm_runtime_get_sync() in da9063_wdt_restart() ?

It's no longer safe to do so at that point because the restart handler runs in atomic context. The unpleasant details can be found at https://www.spinics.net/lists/linux-i2c/msg46367.html

> What
> guarantees that the local notifier is called before the watchdog core's
> restart notifier ?

It would seem to me that a reboot notifier that triggers after the restart notifier (which, if successfully handled, does not return) would be rather pointless.

> And what is the point of using the watchdog core's
> reboot handler if it is bypassed anyway ?

I don't think it's bypassed, it should be possible to register several reboot notifiers per device.

It would also be possible to do this stuff in the core's reboot handler, but I have chosen not to do so because the core seems to avoid dealing with PM, which I assume is a design decision. Also, it would affect all other drivers with a restart handler, with (to me) unforeseeable effects. What do you think?

> Also, why is it not necessary to call pm functions when the watchdog is
> started, when it is stopped, and during suspend/resume ?

These cases are handled automatically, AFAIK.

CU
Uli
