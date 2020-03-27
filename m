Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C83AB1958A7
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Mar 2020 15:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgC0OJR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Mar 2020 10:09:17 -0400
Received: from smtpo.poczta.interia.pl ([217.74.65.155]:45252 "EHLO
        smtpo.poczta.interia.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgC0OJR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Mar 2020 10:09:17 -0400
X-Greylist: delayed 463 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Mar 2020 10:09:16 EDT
X-Interia-R: Interia
X-Interia-R-IP: 188.121.19.19
X-Interia-R-Helo: <t480s.localdomain>
Received: from t480s.localdomain (ipv4-188-121-19-19.net.internetunion.pl [188.121.19.19])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Fri, 27 Mar 2020 15:01:28 +0100 (CET)
Date:   Fri, 27 Mar 2020 15:01:26 +0100
From:   Slawomir Stepien <sst@poczta.fm>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, krzysztof.adamski@nokia.com,
        jakub.lewalski@nokia.com, slawomir.stepien@nokia.com,
        alexander.sverdlin@nokia.com
Subject: Re: [RFCv3] i2c: hold the core_lock for the whole execution of
 i2c_register_adapter()
Message-ID: <20200327140126.GA2112@t480s.localdomain>
References: <20191008163956.GB566933@t480s.localdomain>
 <20200321191532.GF5632@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200321191532.GF5632@ninjato>
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1585317688;
        bh=rxFEDd4hzN9lJEGo6ptnbnVgAbUJOJj8JKLgkRs3Mx0=;
        h=X-Interia-R:X-Interia-R-IP:X-Interia-R-Helo:Date:From:To:Cc:
         Subject:Message-ID:References:MIME-Version:Content-Type:
         Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
         X-Interia-Antivirus;
        b=VgvOGAwuHaWxSC5s7430SX3ItXtytzkuiGW0OBUfzJHTI9avXOeqClvXH+w7bC4N3
         9e/GDkp+qkNSyTIyFzOrCg8HiIIJD+qiPIOkdeeAPxLKSLy/ZgKAmuXU9dpCm8dslR
         bya3otWAgg5BlmEhlusMoDzn9yQ144krtmv3ZjzQ=
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On mar 21, 2020 20:15, Wolfram Sang wrote:
> Hi Slawomir,

Hello Wolfram,

> On Tue, Oct 08, 2019 at 06:39:56PM +0200, Slawomir Stepien wrote:
> > From: Sławomir Stępień <slawomir.stepien@nokia.com>
> > 
> > There is a race condition between the i2c_get_adapter() and the
> > i2c_add_adapter() if this mutex isn't hold for the whole execution of
> > i2c_register_adapter().
> > 
> > If the mutex isn't locked, it is possible to find idr that points to
> > adapter that hasn't been registered yet (i.e. it's
> > kobj.state_initialized is still false), which will end up with warning
> > message:
> > 
> > "... is not initialized, yet kobject_get() is being called."
> > 
> > This patch will change how the locking is arranged around
> > i2c_register_adapter() call and will prevent such situations. The part
> > of the i2c_register_adapter() that do not need to be under the lock has
> > been moved to a new function i2c_process_adapter.
> > 
> > Signed-off-by: Sławomir Stępień <slawomir.stepien@nokia.com>
> 
> Thank you for tackling this one and sorry for the late reply.
> 
> Do you have a test case for me so I could reproduce the bad case here?

I don't have any test case ready on hand, but please take a look at this flow:

Note: The assumption is that i2c_add_adapter() and i2c_get_adapter() are called
from separate threads of execution.

time | i2c_add_adapter()     | i2c_get_adapter()
------------------------------------------------
0001 | lock of core_lock     |
0002 | new idr via idr_alloc |
0003 | unlock of core_lock   |
0004 |                       | lock of core_lock
0005 |                       | idr_find
0006 |                       | get_device [1]
0007 | i2c_register_adapter  |

At point [1], the i2c_get_adapter() assumes the device is ready only because it
was found in idr. It calls get_device() which causes kobject_get() to fail.

-- 
Slawomir Stepien
