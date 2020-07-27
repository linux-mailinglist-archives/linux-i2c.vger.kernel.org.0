Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8038922F6CF
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Jul 2020 19:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730344AbgG0Ri3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Jul 2020 13:38:29 -0400
Received: from linux.microsoft.com ([13.77.154.182]:57700 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbgG0Ri2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Jul 2020 13:38:28 -0400
Received: by linux.microsoft.com (Postfix, from userid 1046)
        id 367BA20B4908; Mon, 27 Jul 2020 10:38:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 367BA20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1595871508;
        bh=hzbEnRYbp7CjaiVlwpRNX2SqfyUAUkPwouFn2zKxziQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qmtAl08tkOJUFq5qhM1G95ug1vjde7ZvCV47hZjBx2X0cEvxRw+gTnYZwve1MV6kL
         jQebm3l7+VP6UGuUb7CUHP4wUbFmOXkyQKD4D3pU56z0bjBc4SGlffw1wsdbWhyiVR
         oB4+OdZOETbwsP2nq7uZE2pPPv83JDXTgLa/O1g4=
From:   Dhananjay Phadke <dphadke@linux.microsoft.com>
To:     ray.jui@broadcom.com
Cc:     bcm-kernel-feedback-list@broadcom.com, dphadke@linux.microsoft.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        rayagonda.kokatanur@broadcom.com, rjui@broadcom.com, wsa@kernel.org
Subject: Re: [PATCH] i2c: iproc: fix race between client unreg and isr
Date:   Mon, 27 Jul 2020 10:38:28 -0700
Message-Id: <1595871508-28566-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <4cf12c92-889d-ffbf-f8de-c1e08cfb8ce9@broadcom.com>
References: <4cf12c92-889d-ffbf-f8de-c1e08cfb8ce9@broadcom.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Ray Jui <ray.jui@broadcom.com> wrote:
>>> I think the following sequence needs to be implemented to make this
>>> safe, i.e., after 'synchronize_irq', no further slave interrupt will be
>>> fired.
>>>
>>> In 'bcm_iproc_i2c_unreg_slave':
>>>
>>> 1. Set an atomic variable 'unreg_slave' (I'm bad in names so please come
>>> up with a better name than this)
>>>
>>> 2. Disable all slave interrupts
>>>
>>> 3. synchronize_irq
>>>
>>> 4. Set slave to NULL
>>>
>>> 5. Erase slave addresses
>> 
>> What about this in unreg_slave?
>> 
>> 1. disable_irq()
>> 	This includes synchronize_irq() and avoids the race. Because irq
>> 	will be masked at interrupt controller level, interrupts coming
>> 	in at the I2C IP core level should still be pending once we
>> 	reenable the irq.
>> 
> 
> Can you confirm that even if we have irq pending at the i2c IP core
> level, as long as we execute Step 2. below (to disable/mask all slave
> interrupts), after 'enable_irq' is called, we still will not receive any
> further i2c slave interrupt?
> 
> Basically I'm asking if interrupts will be "cached" at the GIC
> controller level after 'disable_irq' is called. As long as that is not
> the case, then I think we are good.
> 
> The goal of course is to ensure there's no further slave interrupts
> after 'enable_irq' in Step 3 below.

That was my question as well, the best would be if the i2c controller itself
has a bit for masking all interrupts overriding individual event enables
set by the ISR.

Also with regards to the original sequence, I think slave address should
be erased before enable_irq(), besides draining rx and tx FIFOs.

I'll send reworked patch.

@Rayagonda will validate new sequence with the test that hit the race condition.

- Dhananjay

