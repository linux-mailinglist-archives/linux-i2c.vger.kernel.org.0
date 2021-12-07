Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3655746B8C0
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 11:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbhLGKZo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 05:25:44 -0500
Received: from ns.iliad.fr ([212.27.33.1]:58456 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229675AbhLGKZn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 05:25:43 -0500
X-Greylist: delayed 544 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Dec 2021 05:25:43 EST
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 16B3520216;
        Tue,  7 Dec 2021 11:13:08 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 08BE6200E2;
        Tue,  7 Dec 2021 11:13:08 +0100 (CET)
Message-ID: <ea12555e66d4dc16c5b093ac528442ed6dddf644.camel@freebox.fr>
Subject: Re: [PATCH] i2c: mpc: Use atomic read and fix break condition
From:   Maxime Bizon <mbizon@freebox.fr>
Reply-To: mbizon@freebox.fr
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 07 Dec 2021 11:13:07 +0100
In-Reply-To: <20211207042144.358867-1-chris.packham@alliedtelesis.co.nz>
References: <20211207042144.358867-1-chris.packham@alliedtelesis.co.nz>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Dec  7 11:13:08 2021 +0100 (CET)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On Tue, 2021-12-07 at 17:21 +1300, Chris Packham wrote:

> Can you give this a test on your setup. I've tried it on the setup
> where I had the original problem that led to 4a8ac5e45cda and it
> seems OK so far (I'll leave my test running overnight).

Tested-by: Maxime Bizon <mbizon@freebox.fr>

Small reservation though, it does not seem to be understood why this
polling is needed.

Reading the driver history, the theory is that the controller will
trigger an interrupt at the end of transfer just after the last SCL
cycle, but irrespective of whether SCL goes high, which happens if a
slave "stretch" the clock until it's ready to answer.

Supposedly when that happen, CSR_MCF bit would be 0 at interrupt time,
meaning bus is busy, and we have to poll until it goes to 1 meaning the
slave has released SCL.

I have no slave that does clock stretching on my board so I cannot test
the theory. On my mpc8347 device, i2c clock speed set to 90kHz, I've
never seen a case where MCR was 0 at interrupt time.

For i2c experts here, is 100us enough in that case ? I could not any
maximum stretch time in i2c specification.

My CPU user manual is IMO vague on this precise topic, hopefully an NXP
knowledgeable employee will read this and enlighten us.

Thanks,

-- 
Maxime
 

